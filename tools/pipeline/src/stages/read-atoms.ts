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
    praxeologies: z.array(z.string()).default([]),
    category: z
      .enum(['application', 'approfondissement', 'synthese', 'probleme', 'demonstration'])
      .optional(),
    source: z.string().optional(),
    lines: z.number().int().min(1).optional(),
  })
  .refine(
    (data) => data.type !== 'exercise' || data.category !== undefined,
    { message: 'category is required for exercise atoms', path: ['category'] },
  )

/**
 * Scan content/{programme}/{module}/**\/*.mdx recursively.
 * Programme dirs contain _programme.yaml, module dirs are their subdirectories.
 * Atoms can be at module root (legacy) or in profil subdirs (e.g. cours/, examen/).
 */
export function readAllAtoms(): RawAtom[] {
  const atoms: RawAtom[] = []

  for (const progDir of getProgrammeDirs()) {
    for (const moduleDir of getModuleDirs(progDir)) {
      // Collect .mdx files from module root AND profil subdirectories
      const mdxFiles = collectMdxFiles(moduleDir)

      for (const { id, filePath } of mdxFiles) {
        const raw = fs.readFileSync(filePath, 'utf-8')
        const { data, content } = matter(raw)

        // Strip legacy correctOption field (now derived from :::option{correct})
        if ('correctOption' in data) {
          delete (data as Record<string, unknown>).correctOption
        }

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

/** Collect all .mdx files from a module dir and its profil subdirs */
function collectMdxFiles(moduleDir: string): { id: string; filePath: string }[] {
  const results: { id: string; filePath: string }[] = []

  const entries = fs.readdirSync(moduleDir, { withFileTypes: true })

  // .mdx files at module root (legacy layout)
  for (const entry of entries) {
    if (entry.isFile() && entry.name.endsWith('.mdx')) {
      results.push({
        id: entry.name.replace('.mdx', ''),
        filePath: path.join(moduleDir, entry.name),
      })
    }
  }

  // .mdx files in profil subdirs (new layout: cours/, examen/, exploration/)
  for (const entry of entries) {
    if (entry.isDirectory() && !entry.name.startsWith('_')) {
      const subDir = path.join(moduleDir, entry.name)
      const subFiles = fs.readdirSync(subDir).filter(f => f.endsWith('.mdx'))
      for (const file of subFiles) {
        results.push({
          id: file.replace('.mdx', ''),
          filePath: path.join(subDir, file),
        })
      }
    }
  }

  return results.sort((a, b) => a.id.localeCompare(b.id))
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
