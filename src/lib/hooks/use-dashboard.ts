'use client'

/**
 * Hook for computing dashboard data
 *
 * Combines user progress (from useProgress) with content metadata
 * (modules, series, atoms passed from server) to compute all
 * dashboard widgets data via the computation engine.
 */

import * as React from 'react'
import { useProgress } from '@/lib/hooks/use-progress'
import { computeDashboard, type DashboardAtomInfo } from '@/lib/dashboard'
import type { DashboardModuleInfo, DashboardSeriesInfo, DashboardData } from '@/types/dashboard'

interface UseDashboardInput {
  userId: string | undefined
  modules: DashboardModuleInfo[]
  series: DashboardSeriesInfo[]
  atoms: DashboardAtomInfo[]
}

interface UseDashboardReturn {
  data: DashboardData | null
  isLoading: boolean
  /** Trigger a recomputation (e.g., after manual refresh) */
  refresh: () => void
  /** Timestamp of last computation */
  lastRefreshedAt: string | null
}

export function useDashboard({
  userId,
  modules,
  series,
  atoms,
}: UseDashboardInput): UseDashboardReturn {
  const { progress, isLoading: isProgressLoading } = useProgress(userId)
  const [lastRefreshedAt, setLastRefreshedAt] = React.useState<string | null>(null)
  const [refreshCounter, setRefreshCounter] = React.useState(0)

  const data = React.useMemo(() => {
    if (isProgressLoading || !userId) return null

    const result = computeDashboard({ progress, modules, series, atoms })
    return result
    // refreshCounter forces recomputation on manual refresh
    // eslint-disable-next-line react-hooks/exhaustive-deps
  }, [progress, modules, series, atoms, isProgressLoading, userId, refreshCounter])

  // Track when data was last computed
  React.useEffect(() => {
    if (data) {
      setLastRefreshedAt(new Date().toISOString())
    }
  }, [data])

  const refresh = React.useCallback(() => {
    setRefreshCounter((c) => c + 1)
  }, [])

  return {
    data,
    isLoading: isProgressLoading,
    refresh,
    lastRefreshedAt,
  }
}
