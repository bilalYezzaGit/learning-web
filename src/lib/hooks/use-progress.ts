'use client'

/**
 * Hook for user progress management
 *
 * Uses Firestore real-time listeners via ProgressService.
 */

import * as React from 'react'
import { useMutation, useQueryClient } from '@tanstack/react-query'
import { queryKeys } from '@/lib/query/keys'
import { ProgressService, type ProgressMap } from '@/lib/services'
import type { ActivityProgress, ProgressStatus } from '@/types'

/**
 * Hook for accessing and managing user progress
 *
 * @example
 * ```tsx
 * const { progress, isLoading, completeExercise, completeQCM } = useProgress(userId)
 *
 * // Check if activity is completed
 * const isCompleted = progress.has(activityId)
 *
 * // Complete an exercise
 * await completeExercise({
 *   activityId: 'ex-1',
 *   status: 'success',
 *   contextType: 'module',
 *   contextId: 'continuite',
 * })
 * ```
 */
export function useProgress(userId: string | undefined) {
  const queryClient = useQueryClient()
  const [progress, setProgress] = React.useState<ProgressMap>(new Map())
  const [isLoading, setIsLoading] = React.useState(true)
  const serviceRef = React.useRef<ProgressService | null>(null)

  // Initialize service and subscribe to changes
  React.useEffect(() => {
    if (!userId) {
      setProgress(new Map())
      setIsLoading(false)
      return
    }

    const service = new ProgressService(userId)
    serviceRef.current = service

    const unsubscribe = service.subscribe((newProgress) => {
      setProgress(newProgress)
      setIsLoading(false)

      // Update React Query cache
      queryClient.setQueryData(queryKeys.progress.user(userId), newProgress)
    })

    return () => {
      unsubscribe()
      service.dispose()
      serviceRef.current = null
    }
  }, [userId, queryClient])

  // Complete exercise mutation
  const completeExerciseMutation = useMutation({
    mutationFn: async (params: {
      activityId: string
      status: ProgressStatus
      contextType: string
      contextId: string
    }) => {
      if (!serviceRef.current) {
        throw new Error('Progress service not initialized')
      }
      await serviceRef.current.completeExercise(params)
    },
  })

  // Complete QCM mutation
  const completeQCMMutation = useMutation({
    mutationFn: async (params: {
      activityId: string
      score: number
      total: number
      contextType: string
      contextId: string
    }) => {
      if (!serviceRef.current) {
        throw new Error('Progress service not initialized')
      }
      await serviceRef.current.completeQCM(params)
    },
  })

  // Reset progress mutation
  const resetProgressMutation = useMutation({
    mutationFn: async (activityId: string) => {
      if (!serviceRef.current) {
        throw new Error('Progress service not initialized')
      }
      await serviceRef.current.resetProgress(activityId)
    },
  })

  return {
    progress,
    isLoading,

    // Get progress for a specific activity
    getProgress: (activityId: string): ActivityProgress | undefined =>
      progress.get(activityId),

    // Check if activity is completed
    isCompleted: (activityId: string): boolean => progress.has(activityId),

    // Check if activity is successful
    isSuccess: (activityId: string): boolean =>
      progress.get(activityId)?.status === 'success',

    // Mutations
    completeExercise: completeExerciseMutation.mutateAsync,
    completeQCM: completeQCMMutation.mutateAsync,
    resetProgress: resetProgressMutation.mutateAsync,

    // Mutation states
    isCompletingExercise: completeExerciseMutation.isPending,
    isCompletingQCM: completeQCMMutation.isPending,
    isResetting: resetProgressMutation.isPending,
  }
}
