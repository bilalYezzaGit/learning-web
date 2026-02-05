'use client'

/**
 * Hook for fetching programmes catalogue
 */

import { useQuery } from '@tanstack/react-query'
import { queryKeys } from '@/lib/query/keys'
import { fetchProgrammes, type ProgrammesResponse } from '@/lib/services'

/**
 * Fetch programmes catalogue
 *
 * @example
 * ```tsx
 * const { data, isLoading, error } = useProgrammes()
 * ```
 */
export function useProgrammes() {
  return useQuery<ProgrammesResponse>({
    queryKey: queryKeys.programmes.catalogue(),
    queryFn: fetchProgrammes,
    staleTime: 5 * 60 * 1000, // 5 minutes
  })
}
