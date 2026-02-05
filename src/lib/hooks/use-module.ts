'use client'

/**
 * Hook for fetching a single module
 */

import { useQuery } from '@tanstack/react-query'
import { queryKeys } from '@/lib/query/keys'
import { fetchModule } from '@/lib/services'
import type { Module } from '@/types'

/**
 * Fetch a single module by ID (with activities)
 *
 * @example
 * ```tsx
 * const { data: module, isLoading } = useModule('continuite')
 * ```
 */
export function useModule(moduleId: string | undefined) {
  return useQuery<Module>({
    queryKey: queryKeys.modules.detail(moduleId ?? ''),
    queryFn: () => fetchModule(moduleId!),
    enabled: !!moduleId,
    staleTime: 5 * 60 * 1000, // 5 minutes
  })
}
