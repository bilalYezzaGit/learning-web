/**
 * QCM Loader — loads and shuffles compiled QCM questions for quick sessions.
 *
 * Uses pre-compiled QCM JSON from the pipeline (with rendered KaTeX HTML).
 */

import fs from 'fs'
import path from 'path'
import { cache } from 'react'

import { getCompiledQcm } from '@/lib/content-loader'

const CONTENT_DIR = path.join(process.cwd(), 'content')

// ── Types ──────────────────────────────────────────────────────────────────

export interface QcmQuestion {
  id: string
  title: string
  questionHtml: string
  optionHtmls: string[]
  correctIndex: number
  explanationHtml?: string
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
 * Get all compiled QCM questions for a module.
 */
export const getModuleQcmQuestions = cache((moduleSlug: string): QcmQuestion[] => {
  const dir = findModuleDir(moduleSlug)
  if (!dir) return []

  const qcmIds = fs.readdirSync(dir)
    .filter((f) => f.startsWith('qcm-') && f.endsWith('.mdx'))
    .map((f) => f.replace('.mdx', ''))
    .sort()

  return qcmIds
    .map((id) => {
      try {
        const compiled = getCompiledQcm(id)
        return {
          id: compiled.id,
          title: compiled.title,
          questionHtml: compiled.enonce,
          optionHtmls: compiled.options,
          correctIndex: compiled.correctIndex,
          explanationHtml: compiled.explication || undefined,
        }
      } catch {
        return null
      }
    })
    .filter(Boolean) as QcmQuestion[]
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
): QcmQuestion[] {
  const all = getModuleQcmQuestions(moduleSlug)
  const shuffled = shuffle(all)
  return shuffled.slice(0, Math.min(count, shuffled.length))
}
