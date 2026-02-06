'use client'

/**
 * Serie Timeline Wrapper
 *
 * Client wrapper that maps resolved serie data to TimelineData format.
 */

import { useRouter, usePathname, useParams } from 'next/navigation'
import { useMemo } from 'react'

import { CourseTimeline, type TimelineData } from '@/components/course-timeline'
import { useAuth } from '@/lib/context'
import { useProgress } from '@/lib/hooks/use-progress'
import type { ResolvedActivity } from '@/types/content'

interface SerieTimelineWrapperProps {
  serieSlug: string
  title: string
  description: string
  estimatedMinutes: number
  difficulty: number
  activities: ResolvedActivity[]
}

export function SerieTimelineWrapper({
  serieSlug,
  title,
  description,
  estimatedMinutes,
  difficulty,
  activities,
}: SerieTimelineWrapperProps) {
  const router = useRouter()
  const pathname = usePathname()
  const params = useParams()
  const parcours = params.parcours as string
  const { userId } = useAuth()
  const { progress: userProgress } = useProgress(userId || '')

  // Extract current activity ID from pathname
  const currentActivityId = useMemo(() => {
    // pathname format: /[parcours]/reviser/serie/[id]/[activityId]
    const parts = pathname.split('/')
    if (parts.length >= 6 && parts[5] && parts[5] !== 'play' && parts[5] !== 'result') {
      return parts[5]
    }
    return undefined
  }, [pathname])

  // Map to TimelineData
  const timelineData: TimelineData = useMemo(
    () => ({
      id: serieSlug,
      title,
      description,
      estimatedMinutes,
      activities,
      sections: undefined,
      activityOrder: undefined,
      difficulty,
    }),
    [serieSlug, title, description, estimatedMinutes, activities, difficulty]
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

    userProgress.forEach((p, activityId) => {
      if (activities.some((a) => a.id === activityId)) {
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
  }, [userProgress, activities])

  const handleActivityClick = (activityId: string) => {
    router.push(`/${parcours}/reviser/serie/${serieSlug}/${activityId}`)
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
