/**
 * Content Reader — extracts summaries and solutions from raw MDX files.
 *
 * Reads directly from content/ directory (raw MDX source).
 * Used by the paper-first app for course summaries and exercise corrections.
 */

import fs from 'fs'
import path from 'path'
import { cache } from 'react'

const CONTENT_DIR = path.join(process.cwd(), 'content')

// ── Types ──────────────────────────────────────────────────────────────────

export interface LessonSummary {
  id: string
  title: string
  firstParagraph: string
}

export interface ExerciseSolution {
  id: string
  title: string
  enonce: string
  solution: string
  methode?: string
}

// ── Frontmatter parser ─────────────────────────────────────────────────────

interface Frontmatter {
  type: string
  title: string
  [key: string]: unknown
}

function parseFrontmatter(content: string): { frontmatter: Frontmatter; body: string } {
  const match = content.match(/^---\n([\s\S]*?)\n---\n([\s\S]*)$/)
  if (!match) return { frontmatter: { type: '', title: '' }, body: content }

  const yamlBlock = match[1] ?? ''
  const body = match[2] ?? ''

  // Simple YAML key-value parser (no nested objects needed)
  const frontmatter: Record<string, unknown> = {}
  for (const line of yamlBlock.split('\n')) {
    const kv = line.match(/^(\w+):\s*(.+)$/)
    if (kv && kv[1] && kv[2]) {
      const value = kv[2].replace(/^["']|["']$/g, '')
      frontmatter[kv[1]] = value
    }
  }

  return {
    frontmatter: frontmatter as Frontmatter,
    body,
  }
}

// ── Block extractor ────────────────────────────────────────────────────────

/**
 * Extract content of a :::blockname ... ::: block from MDX.
 */
function extractBlock(body: string, blockName: string): string | undefined {
  const regex = new RegExp(`:::${blockName}\\b[^\\n]*\\n([\\s\\S]*?):::`, 'g')
  const match = regex.exec(body)
  return match?.[1]?.trim()
}

/**
 * Extract the first meaningful paragraph from a lesson body.
 * Skips headings and blank lines, returns the first non-empty paragraph.
 */
function extractFirstParagraph(body: string): string {
  const lines = body.split('\n')
  const paragraphs: string[] = []
  let current = ''

  for (const line of lines) {
    const trimmed = line.trim()

    // Skip headings
    if (trimmed.startsWith('#')) {
      if (current) {
        paragraphs.push(current.trim())
        current = ''
      }
      continue
    }

    // Skip directives
    if (trimmed.startsWith(':::')) continue

    // Blank line = paragraph break
    if (!trimmed) {
      if (current) {
        paragraphs.push(current.trim())
        current = ''
      }
      continue
    }

    // Skip code blocks
    if (trimmed.startsWith('```')) continue
    if (trimmed.startsWith('$$')) continue

    current += (current ? ' ' : '') + trimmed
  }

  if (current) paragraphs.push(current.trim())

  // Return first non-trivial paragraph (> 20 chars)
  return paragraphs.find((p) => p.length > 20) ?? paragraphs[0] ?? ''
}

// ── File finders ───────────────────────────────────────────────────────────

/**
 * Find all MDX files for a module across all programmes.
 */
function findModuleDir(moduleSlug: string): string | undefined {
  const programmes = fs.readdirSync(CONTENT_DIR).filter((d) => {
    const p = path.join(CONTENT_DIR, d)
    return fs.statSync(p).isDirectory() && !d.startsWith('.')
  })

  for (const prog of programmes) {
    const moduleDir = path.join(CONTENT_DIR, prog, moduleSlug)
    if (fs.existsSync(moduleDir)) return moduleDir
  }
  return undefined
}

function readMdx(filePath: string): string | undefined {
  try {
    return fs.readFileSync(filePath, 'utf-8')
  } catch {
    return undefined
  }
}

// ── Public API ─────────────────────────────────────────────────────────────

/**
 * Get lesson summaries for a module (first paragraph of each lesson).
 */
export const getLessonSummaries = cache((moduleSlug: string): LessonSummary[] => {
  const dir = findModuleDir(moduleSlug)
  if (!dir) return []

  const lessonFiles = fs.readdirSync(dir)
    .filter((f) => f.startsWith('lesson-') && f.endsWith('.mdx'))
    .sort()

  return lessonFiles.map((file) => {
    const content = readMdx(path.join(dir, file))
    if (!content) return null

    const { frontmatter, body } = parseFrontmatter(content)
    const firstParagraph = extractFirstParagraph(body)

    return {
      id: file.replace('.mdx', ''),
      title: frontmatter.title || file.replace('.mdx', ''),
      firstParagraph,
    }
  }).filter(Boolean) as LessonSummary[]
})

/**
 * Get exercise solutions for a module.
 */
export const getExerciseSolutions = cache((moduleSlug: string): ExerciseSolution[] => {
  const dir = findModuleDir(moduleSlug)
  if (!dir) return []

  const exerciseFiles = fs.readdirSync(dir)
    .filter((f) => f.startsWith('ex-') && f.endsWith('.mdx'))
    .sort()

  return exerciseFiles.map((file) => {
    const content = readMdx(path.join(dir, file))
    if (!content) return null

    const { frontmatter, body } = parseFrontmatter(content)
    const enonce = extractBlock(body, 'enonce') ?? ''
    const solution = extractBlock(body, 'solution') ?? ''
    const methode = extractBlock(body, 'methode')

    if (!solution) return null

    return {
      id: file.replace('.mdx', ''),
      title: frontmatter.title || file.replace('.mdx', ''),
      enonce,
      solution,
      methode,
    }
  }).filter(Boolean) as ExerciseSolution[]
})

/**
 * Get the molecule YAML data for a module (sections with step IDs).
 * Returns the steps for each section of the main cours molecule.
 */
export const getModuleSections = cache((moduleSlug: string): Array<{ label: string; lessonIds: string[]; exerciseIds: string[] }> => {
  const dir = findModuleDir(moduleSlug)
  if (!dir) return []

  const moleculePath = path.join(dir, '_molecules', `${moduleSlug}.yaml`)
  if (!fs.existsSync(moleculePath)) return []

  const raw = fs.readFileSync(moleculePath, 'utf-8')

  // Simple YAML section parser
  const sections: Array<{ label: string; lessonIds: string[]; exerciseIds: string[] }> = []
  let currentSection: { label: string; lessonIds: string[]; exerciseIds: string[] } | null = null

  for (const line of raw.split('\n')) {
    const labelMatch = line.match(/^\s+-\s+label:\s*"?([^"]+)"?/)
    if (labelMatch && labelMatch[1]) {
      if (currentSection) sections.push(currentSection)
      currentSection = { label: labelMatch[1], lessonIds: [], exerciseIds: [] }
      continue
    }

    const stepMatch = line.match(/^\s+-\s+(lesson-\S+|ex-\S+)/)
    if (stepMatch && stepMatch[1] && currentSection) {
      const id = stepMatch[1]
      if (id.startsWith('lesson-')) currentSection.lessonIds.push(id)
      if (id.startsWith('ex-')) currentSection.exerciseIds.push(id)
    }
  }

  if (currentSection) sections.push(currentSection)
  return sections
})
