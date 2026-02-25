import fs from 'fs'
import path from 'path'
import matter from 'gray-matter'
import { z } from 'zod'
import { ATOMS_DIR } from '../config.js'
import type { RawAtom } from '../types.js'

const atomMetaSchema = z
  .object({
    type: z.enum(['lesson', 'exercise', 'qcm']),
    title: z.string().min(1),
    difficulty: z.number().int().min(0).max(3).default(1),
    timeMinutes: z.number().int().min(1).default(5),
    tags: z.array(z.string()).default([]),
    category: z
      .enum(['application', 'approfondissement', 'synthese', 'probleme', 'demonstration'])
      .optional(),
    correctOption: z.number().int().min(0).optional(),
  })
  .refine(
    (data) => data.type !== 'exercise' || data.category !== undefined,
    { message: 'category is required for exercise atoms', path: ['category'] },
  )

export function readAllAtoms(): RawAtom[] {
  const files = fs.readdirSync(ATOMS_DIR).filter(f => f.endsWith('.mdx')).sort()
  const atoms: RawAtom[] = []

  for (const file of files) {
    const id = file.replace('.mdx', '')
    const raw = fs.readFileSync(path.join(ATOMS_DIR, file), 'utf-8')
    const { data, content } = matter(raw)

    const result = atomMetaSchema.safeParse(data)
    if (!result.success) {
      const issues = result.error.issues.map(i => `${i.path.join('.')}: ${i.message}`).join(', ')
      throw new Error(`Invalid atom "${id}": ${issues}`)
    }

    atoms.push({
      id,
      ...result.data,
      rawContent: content,
    })
  }

  return atoms
}
