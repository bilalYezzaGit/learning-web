import fs from 'fs'
import path from 'path'
import matter from 'gray-matter'
import { z } from 'zod'
import { CONTENT_DIR } from '../config.js'
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

/**
 * Scan content/{programme}/{module}/*.mdx recursively.
 * Programme dirs contain _programme.yaml, module dirs are their subdirectories.
 */
export function readAllAtoms(): RawAtom[] {
  const atoms: RawAtom[] = []

  for (const progDir of getProgrammeDirs()) {
    for (const moduleDir of getModuleDirs(progDir)) {
      const files = fs.readdirSync(moduleDir)
        .filter(f => f.endsWith('.mdx'))
        .sort()

      for (const file of files) {
        const id = file.replace('.mdx', '')
        const raw = fs.readFileSync(path.join(moduleDir, file), 'utf-8')
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
    }
  }

  return atoms
}

/** Find programme directories (those containing _programme.yaml) */
function getProgrammeDirs(): string[] {
  return fs.readdirSync(CONTENT_DIR, { withFileTypes: true })
    .filter(d => d.isDirectory())
    .map(d => path.join(CONTENT_DIR, d.name))
    .filter(dir => fs.existsSync(path.join(dir, '_programme.yaml')))
    .sort()
}

/** Find module directories within a programme (subdirs, excluding _ prefixed) */
function getModuleDirs(progDir: string): string[] {
  return fs.readdirSync(progDir, { withFileTypes: true })
    .filter(d => d.isDirectory() && !d.name.startsWith('_'))
    .map(d => path.join(progDir, d.name))
    .sort()
}
