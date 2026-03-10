/**
 * Booklet utilities — derives booklet definitions from the content pipeline.
 *
 * A booklet is a "virtual" entity that maps 1:1 to a livret molecule.
 * The code is generated deterministically from the livret slug + programme.
 */

import { cache } from 'react'

import {
  getAllProgrammes,
  getLivret,
  getLivretActivities,
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

    for (const livretSlug of programme.livrets) {
      try {
        const livret = getLivret(livretSlug)
        const activities = getLivretActivities(livretSlug)

        booklets.push({
          code: generateBookletCode(livretSlug, programme.id),
          livretSlug,
          programmeId: programme.id,
          title: livret.title,
          description: livret.description,
          version: 1,
          exerciseCount: activities.filter((a) => a.type === 'exercise').length,
          qcmCount: activities.filter((a) => a.type === 'qcm').length,
          lessonCount: activities.filter((a) => a.type === 'lesson').length,
          estimatedMinutes: livret.estimatedMinutes,
        })
      } catch {
        // Skip invalid livrets
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
