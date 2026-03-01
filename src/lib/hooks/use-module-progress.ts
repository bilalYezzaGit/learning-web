'use client'

import * as React from 'react'
import type { ProgressMap } from '@/lib/hooks/use-progress'

export type ModuleStatus = 'not-started' | 'in-progress' | 'completed'

export interface ModuleStat {
  done: number
  total: number
  percentage: number
  status: ModuleStatus
}

/**
 * Compute progress stats for modules given their activity IDs.
 * Shared across accueil-client, apprendre-client, and module-accueil-client.
 */
export function useModuleProgress(
  modules: Array<{ id: string; activityIds: string[] }>,
  progress: ProgressMap,
): Map<string, ModuleStat> {
  return React.useMemo(() => {
    const stats = new Map<string, ModuleStat>()

    for (const mod of modules) {
      const total = mod.activityIds.length
      const done = mod.activityIds.filter((id) => progress.has(id)).length
      const percentage = total > 0 ? Math.round((done / total) * 100) : 0
      let status: ModuleStatus = 'not-started'
      if (done > 0 && done < total) status = 'in-progress'
      if (done > 0 && done >= total) status = 'completed'
      stats.set(mod.id, { done, total, percentage, status })
    }

    return stats
  }, [modules, progress])
}
