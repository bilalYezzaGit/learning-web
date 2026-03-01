'use client'

/**
 * Unified Timeline Wrapper
 *
 * Shared client wrapper for both module (apprendre) and serie (reviser) timelines.
 * Maps resolved activities + user progress to TimelineData format.
 */

import { createContext, useContext, useMemo, useState } from 'react'
import { useRouter, usePathname } from 'next/navigation'

import { CourseTimeline, type TimelineData } from '@/components/course-timeline'
import { useAuth } from '@/lib/context'
import { useProgress } from '@/lib/hooks/use-progress'
import type { ResolvedActivity } from '@/types/content'

// ── Timeline context (inline, replaces timeline-context.tsx) ────────────────

interface TimelineContextValue {
  openTimeline: () => void
}

const TimelineContext = createContext<TimelineContextValue | null>(null)

export function useTimeline() {
  return useContext(TimelineContext)
}

// ── Component ───────────────────────────────────────────────────────────────

interface TimelineWrapperProps {
  slug: string
  title: string
  description: string
  estimatedMinutes: number
  activities: ResolvedActivity[]
  baseUrl: string
  sections?: Array<{ id: string; label: string; order: number }>
  objectives?: string[]
  difficulty?: number
  enableMobileSheet?: boolean
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
      <TimelineContext.Provider value={{ openTimeline: () => setMobileOpen(true) }}>
        {timeline}
        {children}
      </TimelineContext.Provider>
    )
  }

  return (
    <>
      {timeline}
      {children}
    </>
  )
}
