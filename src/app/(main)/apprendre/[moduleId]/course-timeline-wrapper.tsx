'use client'

/**
 * Course Timeline Wrapper for Module
 *
 * Client wrapper that maps Module to TimelineData format.
 */

import { useRouter, usePathname } from 'next/navigation'
import { useMemo } from 'react'

import { CourseTimeline, type TimelineData } from '@/components/course-timeline'
import { useAuth } from '@/lib/context'
import { useProgress } from '@/lib/hooks/use-progress'
import type { Module } from '@/types/models'

interface CourseTimelineWrapperProps {
  module: Module
}

export function CourseTimelineWrapper({ module }: CourseTimelineWrapperProps) {
  const router = useRouter()
  const pathname = usePathname()
  const { userId } = useAuth()
  const { progress: userProgress } = useProgress(userId || '')

  // Extract current activity ID from pathname
  const currentActivityId = useMemo(() => {
    // pathname format: /apprendre/[moduleId]/[activityId]
    const parts = pathname.split('/')
    // Check if we're on an activity page (4 parts: '', 'apprendre', moduleId, activityId)
    if (parts.length >= 4 && parts[3]) {
      return parts[3]
    }
    return undefined
  }, [pathname])

  // Map Module to TimelineData
  const timelineData: TimelineData = useMemo(
    () => ({
      id: module.id,
      title: module.title,
      description: module.description,
      estimatedMinutes: module.estimatedTime,
      activities: module.activities,
      sections: module.sections,
      activityOrder: module.coursePath,
      objectives: module.objectives,
    }),
    [module]
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

    // Convert Map to array, filtering for this module's activities
    userProgress.forEach((p, activityId) => {
      if (module.activities.some((a) => a.id === activityId)) {
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
  }, [userProgress, module.activities])

  const handleActivityClick = (activityId: string) => {
    router.push(`/apprendre/${module.id}/${activityId}`)
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
