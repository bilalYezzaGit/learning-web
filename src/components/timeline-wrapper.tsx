'use client'

/**
 * Unified Timeline Wrapper
 *
 * Shared client wrapper for both module (apprendre) and serie (reviser) timelines.
 * Maps resolved activities + user progress to TimelineData format.
 */

import { useRouter, usePathname } from 'next/navigation'
import { useMemo, useState } from 'react'

import { CourseTimeline, type TimelineData } from '@/components/course-timeline'
import { TimelineProvider } from '@/lib/context/timeline-context'
import { useAuth } from '@/lib/context'
import { useProgress } from '@/lib/hooks/use-progress'
import type { ResolvedActivity } from '@/types/content'

interface TimelineWrapperProps {
  slug: string
  title: string
  description: string
  estimatedMinutes: number
  activities: ResolvedActivity[]
  /** Base URL for activity links (e.g. "/3eme-math/apprendre/continuite") */
  baseUrl: string
  /** Module sections (undefined for series) */
  sections?: Array<{ id: string; label: string; order: number }>
  /** Module objectives (undefined for series) */
  objectives?: string[]
  /** Serie difficulty (undefined for modules) */
  difficulty?: number
  /** Enable mobile sheet toggle via TimelineProvider (modules only) */
  enableMobileSheet?: boolean
  /** When provided, children are rendered after the timeline (inside TimelineProvider if enabled) */
  children?: React.ReactNode
}

export function TimelineWrapper({
  slug,
  title,
  description,
  estimatedMinutes,
  activities,
  baseUrl,
  sections,
  objectives,
  difficulty,
  enableMobileSheet = false,
  children,
}: TimelineWrapperProps) {
  const router = useRouter()
  const pathname = usePathname()
  const { userId } = useAuth()
  const { progress: userProgress } = useProgress(userId || '')
  const [mobileOpen, setMobileOpen] = useState(false)

  // Extract current activity ID from pathname by stripping the baseUrl prefix
  const currentActivityId = useMemo(() => {
    if (!pathname.startsWith(baseUrl)) return undefined
    const rest = pathname.slice(baseUrl.length).replace(/^\//, '')
    const segment = rest.split('/')[0]
    if (!segment || segment === 'play' || segment === 'result') return undefined
    return segment
  }, [pathname, baseUrl])

  const timelineData: TimelineData = useMemo(
    () => ({
      id: slug,
      title,
      description,
      estimatedMinutes,
      activities,
      sections,
      activityOrder: sections ? activities.map((a) => a.id) : undefined,
      objectives,
      difficulty,
    }),
    [slug, title, description, estimatedMinutes, activities, sections, objectives, difficulty]
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
    router.push(`${baseUrl}/${activityId}`)
  }

  const timeline = (
    <CourseTimeline
      data={timelineData}
      currentActivityId={currentActivityId}
      onActivityClick={handleActivityClick}
      progress={activityProgress}
      {...(enableMobileSheet && { mobileOpen, onMobileOpenChange: setMobileOpen })}
    />
  )

  if (enableMobileSheet) {
    return (
      <TimelineProvider onOpen={() => setMobileOpen(true)}>
        {timeline}
        {children}
      </TimelineProvider>
    )
  }

  return (
    <>
      {timeline}
      {children}
    </>
  )
}
