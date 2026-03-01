'use client'

/**
 * Hook for user progress management
 *
 * Firestore real-time listener for authenticated users,
 * localStorage fallback for anonymous users.
 */

import { useEffect, useRef, useState } from 'react'
import {
  collection,
  doc,
  setDoc,
  onSnapshot,
} from 'firebase/firestore'
import { getDbInstance } from '@/lib/firebase/client'
import { logError } from '@/lib/services/error-logger'
import { SUCCESS_THRESHOLD } from '@/lib/constants'
import {
  getLocalProgress,
  setLocalActivityComplete,
} from '@/lib/services/local-progress'
import type { ActivityProgress, ProgressStatus, ProgressContext } from '@/types'

export type ProgressMap = Map<string, ActivityProgress>

// ── Firestore converters ────────────────────────────────────────────────────

function toFirestore(p: ActivityProgress): Record<string, unknown> {
  return {
    activityType: p.activityType,
    status: p.status,
    ...(p.score !== undefined && { score: p.score }),
    ...(p.total !== undefined && { total: p.total }),
    attempts: p.attempts,
    lastDoneAt: new Date(p.lastDoneAt),
    contexts: p.contexts.map((c) => ({
      type: c.type,
      id: c.id,
      doneAt: new Date(c.doneAt),
    })),
  }
}

function fromFirestore(data: Record<string, unknown>, docId: string): ActivityProgress {
  const contexts = (data.contexts as Array<Record<string, unknown>> | undefined) ?? []
  const latest = contexts.length > 0 ? contexts[contexts.length - 1] : null

  return {
    activityId: docId,
    activityType: (data.activityType as string ?? 'exercise') as 'exercise' | 'qcm' | 'lesson',
    status: data.status as ProgressStatus,
    score: data.score as number | undefined,
    total: data.total as number | undefined,
    attempts: (data.attempts as number) ?? 1,
    lastDoneAt: (data.lastDoneAt as { toDate: () => Date })?.toDate?.()?.toISOString() ?? new Date().toISOString(),
    contextId: latest?.id as string | undefined,
    contextType: latest?.type as string | undefined,
    contexts: contexts.map((c) => ({
      type: c.type as string,
      id: c.id as string,
      doneAt: (c.doneAt as { toDate: () => Date })?.toDate?.()?.toISOString() ?? new Date().toISOString(),
    })),
  }
}

// ── Hook ────────────────────────────────────────────────────────────────────

export function useProgress(userId: string | undefined) {
  const [progress, setProgress] = useState<ProgressMap>(() =>
    userId ? new Map() : getLocalProgress()
  )
  const [isLoading, setIsLoading] = useState(() => !!userId)
  const cacheRef = useRef<ProgressMap>(new Map())
  const [prevUserId, setPrevUserId] = useState(userId)

  // Handle userId transitions during render (React "adjusting state when a prop changes" pattern)
  if (prevUserId !== userId) {
    setPrevUserId(userId)
    if (!userId) {
      setProgress(getLocalProgress())
      setIsLoading(false)
    } else {
      setProgress(new Map())
      setIsLoading(true)
    }
  }

  // Firestore listener for authenticated users
  useEffect(() => {
    if (!userId) {
      cacheRef.current.clear()
      return
    }

    const db = getDbInstance()
    const colRef = collection(db, 'users', userId, 'activityProgress')
    const cache = cacheRef.current

    const unsubscribe = onSnapshot(
      colRef,
      (snapshot) => {
        snapshot.docChanges().forEach((change) => {
          if (change.type === 'removed') {
            cache.delete(change.doc.id)
          } else {
            const data = change.doc.data()
            if (data) cache.set(change.doc.id, fromFirestore(data, change.doc.id))
          }
        })
        setProgress(new Map(cache))
        setIsLoading(false)
      },
      (error) => {
        logError(error, { component: 'useProgress', action: 'firestoreListener' })
      },
    )

    return () => {
      unsubscribe()
      cache.clear()
    }
  }, [userId])

  const completeExercise = async (params: {
    activityId: string
    status: ProgressStatus
    contextType: string
    contextId: string
  }) => {
    if (!userId) {
      setProgress(setLocalActivityComplete({ ...params, activityType: 'exercise' }))
      return
    }

    const { activityId, status, contextType, contextId } = params
    const existing = cacheRef.current.get(activityId)
    const now = new Date().toISOString()
    const ctx: ProgressContext = { type: contextType, id: contextId, doneAt: now }

    const entry: ActivityProgress = {
      activityId,
      activityType: 'exercise',
      status,
      attempts: (existing?.attempts ?? 0) + 1,
      lastDoneAt: now,
      contexts: [...(existing?.contexts ?? []), ctx],
    }

    const db = getDbInstance()
    await setDoc(doc(db, 'users', userId, 'activityProgress', activityId), toFirestore(entry), { merge: true })
  }

  const completeQCM = async (params: {
    activityId: string
    score: number
    total: number
    contextType: string
    contextId: string
  }) => {
    if (!userId) {
      setProgress(setLocalActivityComplete({ ...params, activityType: 'qcm' }))
      return
    }

    const { activityId, score, total, contextType, contextId } = params
    const existing = cacheRef.current.get(activityId)
    const now = new Date().toISOString()
    const pct = total > 0 ? Math.round((score / total) * 100) : 0
    const status: ProgressStatus = pct >= SUCCESS_THRESHOLD * 100 ? 'success' : 'retry'
    const ctx: ProgressContext = { type: contextType, id: contextId, doneAt: now }

    const entry: ActivityProgress = {
      activityId,
      activityType: 'qcm',
      status,
      score: pct,
      total,
      attempts: (existing?.attempts ?? 0) + 1,
      lastDoneAt: now,
      contexts: [...(existing?.contexts ?? []), ctx],
    }

    const db = getDbInstance()
    await setDoc(doc(db, 'users', userId, 'activityProgress', activityId), toFirestore(entry), { merge: true })
  }

  return {
    progress,
    isLoading,
    getProgress: (activityId: string) => progress.get(activityId),
    isCompleted: (activityId: string) => progress.has(activityId),
    isSuccess: (activityId: string) => progress.get(activityId)?.status === 'success',
    completeExercise,
    completeQCM,
  }
}
