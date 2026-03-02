/**
 * QCM Loader — loads and shuffles QCM questions from raw MDX for quick sessions.
 *
 * Reads QCM files directly from content/ directory.
 * Used by the paper-first app for timed QCM sessions.
 */

import fs from 'fs'
import path from 'path'
import { cache } from 'react'

const CONTENT_DIR = path.join(process.cwd(), 'content')

// ── Types ──────────────────────────────────────────────────────────────────

export interface RawQcmQuestion {
  id: string
  title: string
  question: string
  options: string[]
  correctIndex: number
  explanation?: string
  difficulty: number
  timeMinutes: number
}

// ── Parser ─────────────────────────────────────────────────────────────────

function parseQcmMdx(content: string, id: string): RawQcmQuestion | null {
  // Parse frontmatter
  const fmMatch = content.match(/^---\n([\s\S]*?)\n---\n([\s\S]*)$/)
  if (!fmMatch) return null

  const yamlBlock = fmMatch[1] ?? ''
  const body = fmMatch[2] ?? ''

  const fm: Record<string, string> = {}
  for (const line of yamlBlock.split('\n')) {
    const kv = line.match(/^(\w+):\s*(.+)$/)
    if (kv && kv[1] && kv[2]) fm[kv[1]] = kv[2].replace(/^["']|["']$/g, '')
  }

  // Extract question
  const questionMatch = body.match(/:::question\n([\s\S]*?):::/)
  const question = questionMatch?.[1]?.trim() ?? ''

  // Extract options
  const optionRegex = /:::option(\{correct\})?\n([\s\S]*?):::/g
  const options: string[] = []
  let correctIndex = -1
  let match: RegExpExecArray | null

  while ((match = optionRegex.exec(body)) !== null) {
    if (match[1]) correctIndex = options.length
    const optionText = match[2]?.trim() ?? ''
    options.push(optionText)
  }

  // Fallback to correctOption from frontmatter
  if (correctIndex === -1 && fm.correctOption) {
    correctIndex = parseInt(fm.correctOption, 10)
  }

  // Extract explanation
  const explMatch = body.match(/:::explanation\n([\s\S]*?):::/)
  const explanation = explMatch?.[1]?.trim()

  if (!question || options.length < 2 || correctIndex === -1) return null

  return {
    id,
    title: fm.title ?? id,
    question,
    options,
    correctIndex,
    explanation,
    difficulty: parseInt(fm.difficulty ?? '1', 10),
    timeMinutes: parseInt(fm.timeMinutes ?? '1', 10),
  }
}

// ── File finder ────────────────────────────────────────────────────────────

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

// ── Public API ─────────────────────────────────────────────────────────────

/**
 * Get all QCM questions for a module.
 */
export const getModuleQcmQuestions = cache((moduleSlug: string): RawQcmQuestion[] => {
  const dir = findModuleDir(moduleSlug)
  if (!dir) return []

  const qcmFiles = fs.readdirSync(dir)
    .filter((f) => f.startsWith('qcm-') && f.endsWith('.mdx'))
    .sort()

  return qcmFiles
    .map((file) => {
      try {
        const content = fs.readFileSync(path.join(dir, file), 'utf-8')
        return parseQcmMdx(content, file.replace('.mdx', ''))
      } catch {
        return null
      }
    })
    .filter(Boolean) as RawQcmQuestion[]
})

/**
 * Shuffle an array (Fisher-Yates).
 */
export function shuffle<T>(arr: T[]): T[] {
  const result = [...arr]
  for (let i = result.length - 1; i > 0; i--) {
    const j = Math.floor(Math.random() * (i + 1))
    const temp = result[i]
    result[i] = result[j] as T
    result[j] = temp as T
  }
  return result
}

/**
 * Select N random questions from a module, shuffled.
 */
export function selectRandomQuestions(
  moduleSlug: string,
  count: number,
): RawQcmQuestion[] {
  const all = getModuleQcmQuestions(moduleSlug)
  const shuffled = shuffle(all)
  return shuffled.slice(0, Math.min(count, shuffled.length))
}
