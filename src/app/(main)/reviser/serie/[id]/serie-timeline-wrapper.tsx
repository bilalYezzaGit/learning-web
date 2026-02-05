'use client'

/**
 * Serie Timeline Wrapper
 *
 * Client wrapper that maps Serie to TimelineData format.
 */

import { useRouter, usePathname } from 'next/navigation'
import { useMemo } from 'react'

import { CourseTimeline, type TimelineData } from '@/components/course-timeline'
import { useAuth } from '@/lib/context'
import { useProgress } from '@/lib/hooks/use-progress'
import type { Serie } from '@/types/series'

interface SerieTimelineWrapperProps {
  serie: Serie
}

export function SerieTimelineWrapper({ serie }: SerieTimelineWrapperProps) {
  const router = useRouter()
  const pathname = usePathname()
  const { userId } = useAuth()
  const { progress: userProgress } = useProgress(userId || '')

  // Extract current activity ID from pathname
  const currentActivityId = useMemo(() => {
    // pathname format: /reviser/serie/[id]/[activityId]
    const parts = pathname.split('/')
    // Check if we're on an activity page (5 parts: '', 'reviser', 'serie', id, activityId)
    if (parts.length >= 5 && parts[4] && parts[4] !== 'play' && parts[4] !== 'result') {
      return parts[4]
    }
    return undefined
  }, [pathname])

  // Map Serie to TimelineData
  const timelineData: TimelineData = useMemo(
    () => ({
      id: serie.id,
      title: serie.title,
      description: serie.description,
      estimatedMinutes: serie.estimatedMinutes,
      activities: serie.activities,
      // No sections for Serie (flat list)
      sections: undefined,
      activityOrder: undefined,
      // Serie specific
      difficulty: serie.difficulty,
    }),
    [serie]
  )

  // Map user progress to timeline format
  const activityProgress = useMemo(() => {
    const result: Array<{
      activityId: string
      isCompleted: boolean
      isSuccess: boolean
      score?: number
      total?: number
    }> = []

    // Convert Map to array, filtering for this serie's activities
    userProgress.forEach((p, activityId) => {
      if (serie.activities.some((a) => a.id === activityId)) {
        result.push({
          activityId,
          isCompleted: p.status !== 'pending',
          isSuccess: p.status === 'success',
          score: p.score,
          total: p.total,
        })
      }
    })

    return result
  }, [userProgress, serie.activities])

  const handleActivityClick = (activityId: string) => {
    router.push(`/reviser/serie/${serie.id}/${activityId}`)
  }

  return (
    <CourseTimeline
      data={timelineData}
      currentActivityId={currentActivityId}
      onActivityClick={handleActivityClick}
      progress={activityProgress}
    />
  )
}
