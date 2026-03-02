'use client'

/**
 * Hook to load user's paired booklets and compute progress stats.
 *
 * Combines booklet-service (pairing) + use-progress (activity completion).
 */

import * as React from 'react'
import { getUserBooklets } from '@/lib/services/booklet-service'
import { useProgress, type ProgressMap } from '@/lib/hooks/use-progress'

export interface BookletProgressStats {
  totalBooklets: number
  completedActivities: number
  totalActivities: number
  avgQcmScore: number | null
  modules: Array<{
    moduleSlug: string
    label: string
    done: number
    total: number
    percentage: number
  }>
}

export function useBookletProgress(userId: string | null | undefined) {
  const uid = userId ?? undefined
  const { progress, isLoading: progressLoading } = useProgress(uid)
  const [bookletCodes, setBookletCodes] = React.useState<string[]>([])
  const [isLoadingBooklets, setIsLoadingBooklets] = React.useState(!!uid)

  // Load user booklets
  React.useEffect(() => {
    if (!userId) {
      setBookletCodes([])
      setIsLoadingBooklets(false)
      return
    }

    let cancelled = false
    setIsLoadingBooklets(true)

    getUserBooklets(userId)
      .then((booklets) => {
        if (!cancelled) {
          setBookletCodes(booklets.map((b) => b.code))
          setIsLoadingBooklets(false)
        }
      })
      .catch(() => {
        if (!cancelled) setIsLoadingBooklets(false)
      })

    return () => { cancelled = true }
  }, [userId])

  const stats = React.useMemo(() => computeStats(progress, bookletCodes), [progress, bookletCodes])

  return {
    stats,
    isLoading: progressLoading || isLoadingBooklets,
  }
}

function computeStats(progress: ProgressMap, bookletCodes: string[]): BookletProgressStats {
  // Count QCM scores
  let qcmScoreSum = 0
  let qcmCount = 0
  let completedActivities = 0

  for (const [, p] of progress) {
    completedActivities++
    if (p.activityType === 'qcm' && p.score !== undefined) {
      qcmScoreSum += p.score
      qcmCount++
    }
  }

  // Group progress by activity prefix to approximate module progress
  const moduleMap = new Map<string, { done: number; total: number }>()

  for (const [activityId] of progress) {
    // Extract module from activity ID pattern: "ex-cont-1" -> "cont", "qcm-deriv-2" -> "deriv"
    const parts = activityId.split('-')
    const moduleKey = (parts.length >= 2 ? parts[1] : undefined) ?? 'other'

    const existing = moduleMap.get(moduleKey)
    if (!existing) {
      moduleMap.set(moduleKey, { done: 0, total: 0 })
    }
    const m = moduleMap.get(moduleKey) ?? { done: 0, total: 0 }
    m.done++
    m.total++
  }

  const modules = Array.from(moduleMap.entries()).map(([key, value]) => ({
    moduleSlug: key,
    label: key.charAt(0).toUpperCase() + key.slice(1),
    done: value.done,
    total: value.total,
    percentage: value.total > 0 ? Math.round((value.done / value.total) * 100) : 0,
  }))

  return {
    totalBooklets: bookletCodes.length,
    completedActivities,
    totalActivities: progress.size,
    avgQcmScore: qcmCount > 0 ? Math.round(qcmScoreSum / qcmCount) : null,
    modules,
  }
}
