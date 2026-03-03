/**
 * Booklet utilities — derives booklet definitions from the content pipeline.
 *
 * A booklet is a "virtual" entity that maps 1:1 to a cours molecule.
 * The code is generated deterministically from the module + programme.
 */

import { cache } from 'react'

import {
  getAllProgrammes,
  getCours,
  getCoursActivities,
} from '@/lib/content-loader'
import type { BookletDefinition } from '@/types/booklet'
import { generateBookletCode } from '@/types/booklet'

/**
 * Get all available booklet definitions from the content pipeline.
 */
export const getAllBooklets = cache((): BookletDefinition[] => {
  const programmes = getAllProgrammes()
  const booklets: BookletDefinition[] = []

  for (const programme of programmes) {
    if (!programme.visible) continue

    for (const coursSlug of programme.cours) {
      try {
        const cours = getCours(coursSlug)
        const activities = getCoursActivities(coursSlug)

        booklets.push({
          code: generateBookletCode(coursSlug, programme.id),
          moduleSlug: coursSlug,
          programmeId: programme.id,
          title: cours.title,
          description: cours.description,
          version: 1,
          exerciseCount: activities.filter((a) => a.type === 'exercise').length,
          qcmCount: activities.filter((a) => a.type === 'qcm').length,
          lessonCount: activities.filter((a) => a.type === 'lesson').length,
          estimatedMinutes: cours.estimatedMinutes,
        })
      } catch {
        // Skip invalid cours
      }
    }
  }

  return booklets
})

/**
 * Get a booklet definition by its code.
 */
export const getBookletByCode = cache((code: string): BookletDefinition | undefined => {
  return getAllBooklets().find((b) => b.code === code)
})

