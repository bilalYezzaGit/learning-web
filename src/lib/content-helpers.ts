/**
 * Content Helpers
 *
 * Shared functions for pre-compiling serie activities.
 * Used by both apprendre and reviser play pages.
 */

import { getCompiledQuiz, getAtomHtml } from '@/lib/content-loader'
import type { AtomType, CompiledQuiz, ResolvedActivity } from '@/types/content'

export interface CompiledActivity {
  id: string
  type: AtomType
  title: string
  timeMinutes: number
  quiz: CompiledQuiz | null
  htmlContent: string | null
}

export function compileSerieActivities(activities: ResolvedActivity[]): CompiledActivity[] {
  return activities.map((activity) => {
    if (activity.type === 'qcm' && activity.quizAtomIds) {
      const quiz = getCompiledQuiz(activity.quizAtomIds)
      return {
        id: activity.id,
        type: activity.type,
        title: activity.title,
        timeMinutes: activity.timeMinutes,
        quiz,
        htmlContent: null,
      }
    } else {
      const htmlContent = getAtomHtml(activity.id)
      return {
        id: activity.id,
        type: activity.type,
        title: activity.title,
        timeMinutes: activity.timeMinutes,
        quiz: null,
        htmlContent,
      }
    }
  })
}
