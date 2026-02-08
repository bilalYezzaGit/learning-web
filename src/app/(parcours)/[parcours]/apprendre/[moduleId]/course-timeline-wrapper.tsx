'use client'

/**
 * Course Timeline Wrapper for Module
 *
 * Client wrapper that maps resolved cours data to TimelineData format.
 * Manages mobile sheet state and provides TimelineContext to children.
 */

import { useRouter, usePathname, useParams } from 'next/navigation'
import { useMemo, useState } from 'react'

import { CourseTimeline, type TimelineData } from '@/components/course-timeline'
import { TimelineProvider } from '@/lib/context/timeline-context'
import { useAuth } from '@/lib/context'
import { useProgress } from '@/lib/hooks/use-progress'
import type { ResolvedActivity } from '@/types/content'

interface CourseTimelineWrapperProps {
  coursSlug: string
  title: string
  description: string
  estimatedMinutes: number
  objectives: string[]
  activities: ResolvedActivity[]
  sections: Array<{ id: string; label: string; order: number }>
  children: React.ReactNode
}

export function CourseTimelineWrapper({
  coursSlug,
  title,
  description,
  estimatedMinutes,
  objectives,
  activities,
  sections,
  children,
}: CourseTimelineWrapperProps) {
  const router = useRouter()
  const pathname = usePathname()
  const params = useParams()
  const parcours = params.parcours as string
  const { userId } = useAuth()
  const { progress: userProgress } = useProgress(userId || '')
  const [mobileOpen, setMobileOpen] = useState(false)

  // Extract current activity ID from pathname
  const currentActivityId = useMemo(() => {
    // pathname format: /[parcours]/apprendre/[moduleId]/[activityId]
    const parts = pathname.split('/')
    if (parts.length >= 5 && parts[4]) {
      return parts[4]
    }
    return undefined
  }, [pathname])

  // Map to TimelineData
  const timelineData: TimelineData = useMemo(
    () => ({
      id: coursSlug,
      title,
      description,
      estimatedMinutes,
      activities,
      sections,
      activityOrder: activities.map((a) => a.id),
      objectives,
    }),
    [coursSlug, title, description, estimatedMinutes, activities, sections, objectives]
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
    router.push(`/${parcours}/apprendre/${coursSlug}/${activityId}`)
  }

  return (
    <TimelineProvider onOpen={() => setMobileOpen(true)}>
      <CourseTimeline
        data={timelineData}
        currentActivityId={currentActivityId}
        onActivityClick={handleActivityClick}
        progress={activityProgress}
        mobileOpen={mobileOpen}
        onMobileOpenChange={setMobileOpen}
      />
      {children}
    </TimelineProvider>
  )
}
