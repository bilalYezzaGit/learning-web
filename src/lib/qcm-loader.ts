/**
 * QCM Loader — loads compiled QCM questions from the livret structure.
 *
 * Uses pre-compiled QCM JSON from the pipeline (with rendered KaTeX HTML).
 * Reads from the livret JSON (respects livret boundaries), NOT from filesystem scan.
 */

import { cache } from 'react'

import { getCompiledQcm, getLivret } from '@/lib/content-loader'

// ── Types ──────────────────────────────────────────────────────────────────

export interface QcmQuestion {
  id: string
  title: string
  questionHtml: string
  optionHtmls: string[]
  correctIndex: number
  explanationHtml?: string
}

// ── Helpers ────────────────────────────────────────────────────────────────

/**
 * Shuffle an array (Fisher-Yates).
 */
function shuffle<T>(arr: T[]): T[] {
  const result = [...arr]
  for (let i = result.length - 1; i > 0; i--) {
    const j = Math.floor(Math.random() * (i + 1))
    const temp = result[i]
    result[i] = result[j] as T
    result[j] = temp as T
  }
  return result
}

// ── Public API ─────────────────────────────────────────────────────────────

/**
 * Get all compiled QCM questions for a LIVRET (not module).
 * Reads from the resolved livret JSON and extracts all quizAtomIds.
 */
export const getLivretQcmQuestions = cache((livretSlug: string): QcmQuestion[] => {
  try {
    const livret = getLivret(livretSlug)
    const allQcmIds = livret.sections
      .flatMap(s => s.activities)
      .filter(a => a.type === 'qcm' && a.quizAtomIds)
      .flatMap(a => a.quizAtomIds!)

    // Deduplicate (same atom could appear in multiple groups, though unlikely)
    const uniqueIds = [...new Set(allQcmIds)]

    return uniqueIds
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
  } catch {
    return []
  }
})

/**
 * Get QCM questions for a specific quiz GROUP within a livret.
 * Used when scanning a QR code from the PDF (mode=quiz).
 */
export function getQcmGroupQuestions(
  livretSlug: string,
  firstQcmId: string,
): QcmQuestion[] {
  try {
    const livret = getLivret(livretSlug)
    // Find the activity that contains this QCM
    for (const section of livret.sections) {
      for (const activity of section.activities) {
        if (activity.type === 'qcm' && activity.quizAtomIds?.includes(firstQcmId)) {
          return activity.quizAtomIds
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
        }
      }
    }
    return []
  } catch {
    return []
  }
}

/**
 * Select N random questions from a LIVRET, shuffled.
 */
export function selectRandomQuestions(
  livretSlug: string,
  count: number,
): QcmQuestion[] {
  const all = getLivretQcmQuestions(livretSlug)
  const shuffled = shuffle(all)
  return shuffled.slice(0, Math.min(count, shuffled.length))
}

/**
 * Count total individual QCM questions in a livret.
 */
export function countLivretQcmQuestions(livretSlug: string): number {
  try {
    const livret = getLivret(livretSlug)
    return livret.sections
      .flatMap(s => s.activities)
      .filter(a => a.type === 'qcm' && a.quizAtomIds)
      .reduce((sum, a) => sum + (a.quizAtomIds?.length ?? 0), 0)
  } catch {
    return 0
  }
}
