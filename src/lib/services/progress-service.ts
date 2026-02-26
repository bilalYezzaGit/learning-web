/**
 * Progress Service
 *
 * Manages user progress in Firestore.
 * Client-side only (uses Firestore listeners for real-time updates).
 *
 * Firestore path: users/{uid}/activityProgress/{activityId}
 */

import {
  collection,
  doc,
  setDoc,
  deleteDoc,
  onSnapshot,
  writeBatch,
  getDocs,
  type Unsubscribe,
} from 'firebase/firestore'

import { getDbInstance } from '@/lib/firebase/client'
import { logError } from '@/lib/services/error-logger'
import { SUCCESS_THRESHOLD } from '@/lib/constants'
import type { ActivityProgress, ProgressStatus, ProgressContext } from '@/types'

// =============================================================================
// Types
// =============================================================================

export type ProgressMap = Map<string, ActivityProgress>

export type ProgressListener = (progress: ProgressMap) => void

// =============================================================================
// Firestore converters
// =============================================================================

function progressToFirestore(progress: ActivityProgress): Record<string, unknown> {
  return {
    activityType: progress.activityType,
    status: progress.status,
    ...(progress.score !== undefined && { score: progress.score }),
    ...(progress.total !== undefined && { total: progress.total }),
    attempts: progress.attempts,
    lastDoneAt: new Date(progress.lastDoneAt),
    contexts: progress.contexts.map((c) => ({
      type: c.type,
      id: c.id,
      doneAt: new Date(c.doneAt),
    })),
  }
}

function progressFromFirestore(
  data: Record<string, unknown>,
  docId: string
): ActivityProgress {
  const contexts = (data.contexts as Array<Record<string, unknown>> | undefined) ?? []
  const latestContext = contexts.length > 0 ? contexts[contexts.length - 1] : null

  const activityType = (data.activityType as string) ?? 'exercise'

  return {
    activityId: docId,
    activityType: activityType as 'exercise' | 'qcm' | 'lesson',
    status: data.status as ProgressStatus,
    score: data.score as number | undefined,
    total: data.total as number | undefined,
    attempts: (data.attempts as number) ?? 1,
    lastDoneAt: (data.lastDoneAt as { toDate: () => Date })?.toDate?.()?.toISOString() ?? new Date().toISOString(),
    contextId: latestContext?.id as string | undefined,
    contextType: latestContext?.type as string | undefined,
    contexts: contexts.map((c) => ({
      type: c.type as string,
      id: c.id as string,
      doneAt: (c.doneAt as { toDate: () => Date })?.toDate?.()?.toISOString() ?? new Date().toISOString(),
    })),
  }
}

// =============================================================================
// Service class
// =============================================================================

/**
 * Progress service for managing user activity progress
 *
 * Usage:
 * ```ts
 * const progressService = new ProgressService(userId)
 * progressService.subscribe((progress) => { ... })
 * await progressService.completeExercise({ ... })
 * progressService.unsubscribe()
 * ```
 */
export class ProgressService {
  private userId: string
  private cache: ProgressMap = new Map()
  private listeners: Set<ProgressListener> = new Set()
  private unsubscribeFirestore: Unsubscribe | null = null

  constructor(userId: string) {
    this.userId = userId
  }

  /**
   * Get the Firestore collection reference
   */
  private get collectionRef() {
    const db = getDbInstance()
    return collection(db, 'users', this.userId, 'activityProgress')
  }

  /**
   * Subscribe to progress changes
   */
  subscribe(listener: ProgressListener): () => void {
    this.listeners.add(listener)

    // Start Firestore listener if not already running
    if (!this.unsubscribeFirestore) {
      this.startFirestoreListener()
    }

    // Immediately call with current cache
    listener(this.cache)

    // Return unsubscribe function
    return () => {
      this.listeners.delete(listener)
      if (this.listeners.size === 0) {
        this.stopFirestoreListener()
      }
    }
  }

  /**
   * Start listening to Firestore changes
   */
  private startFirestoreListener() {
    this.unsubscribeFirestore = onSnapshot(
      this.collectionRef,
      (snapshot) => {
        snapshot.docChanges().forEach((change) => {
          const docId = change.doc.id

          if (change.type === 'removed') {
            this.cache.delete(docId)
          } else {
            const data = change.doc.data()
            if (data) {
              this.cache.set(docId, progressFromFirestore(data, docId))
            }
          }
        })

        // Notify all listeners
        this.notifyListeners()
      },
      (error) => {
        logError(error, { component: 'ProgressService', action: 'firestoreListener' })
      }
    )
  }

  /**
   * Stop listening to Firestore changes
   */
  private stopFirestoreListener() {
    if (this.unsubscribeFirestore) {
      this.unsubscribeFirestore()
      this.unsubscribeFirestore = null
    }
  }

  /**
   * Notify all listeners of progress changes
   */
  private notifyListeners() {
    const progressCopy = new Map(this.cache)
    this.listeners.forEach((listener) => listener(progressCopy))
  }

  /**
   * Get progress for an activity (from cache)
   */
  getProgress(activityId: string): ActivityProgress | undefined {
    return this.cache.get(activityId)
  }

  /**
   * Get all cached progress
   */
  getAllProgress(): ProgressMap {
    return new Map(this.cache)
  }

  /**
   * Check if an activity is completed
   */
  isCompleted(activityId: string): boolean {
    return this.cache.has(activityId)
  }

  /**
   * Check if an activity is successful
   */
  isSuccess(activityId: string): boolean {
    return this.cache.get(activityId)?.status === 'success'
  }

  /**
   * Complete an exercise
   */
  async completeExercise(params: {
    activityId: string
    status: ProgressStatus
    contextType: string
    contextId: string
  }): Promise<void> {
    const { activityId, status, contextType, contextId } = params
    const existing = this.cache.get(activityId)
    const now = new Date().toISOString()

    const newContext: ProgressContext = {
      type: contextType,
      id: contextId,
      doneAt: now,
    }

    const progress: ActivityProgress = {
      activityId,
      activityType: 'exercise',
      status,
      attempts: (existing?.attempts ?? 0) + 1,
      lastDoneAt: now,
      contexts: [...(existing?.contexts ?? []), newContext],
    }

    const db = getDbInstance()
    const docRef = doc(db, 'users', this.userId, 'activityProgress', activityId)
    await setDoc(docRef, progressToFirestore(progress), { merge: true })
  }

  /**
   * Complete a QCM
   */
  async completeQCM(params: {
    activityId: string
    score: number
    total: number
    contextType: string
    contextId: string
  }): Promise<void> {
    const { activityId, score, total, contextType, contextId } = params
    const existing = this.cache.get(activityId)
    const now = new Date().toISOString()

    const percentage = total > 0 ? Math.round((score / total) * 100) : 0
    const status: ProgressStatus = percentage >= SUCCESS_THRESHOLD * 100 ? 'success' : 'retry'

    const newContext: ProgressContext = {
      type: contextType,
      id: contextId,
      doneAt: now,
    }

    const progress: ActivityProgress = {
      activityId,
      activityType: 'qcm',
      status,
      score: percentage,
      total,
      attempts: (existing?.attempts ?? 0) + 1,
      lastDoneAt: now,
      contexts: [...(existing?.contexts ?? []), newContext],
    }

    const db = getDbInstance()
    const docRef = doc(db, 'users', this.userId, 'activityProgress', activityId)
    await setDoc(docRef, progressToFirestore(progress), { merge: true })
  }

  /**
   * Reset progress for an activity
   */
  async resetProgress(activityId: string): Promise<void> {
    const db = getDbInstance()
    const docRef = doc(db, 'users', this.userId, 'activityProgress', activityId)
    await deleteDoc(docRef)
  }

  /**
   * Reset all progress for the user
   */
  async resetAllProgress(): Promise<void> {
    const db = getDbInstance()
    const snapshot = await getDocs(this.collectionRef)

    const batch = writeBatch(db)
    snapshot.docs.forEach((docSnap) => {
      batch.delete(docSnap.ref)
    })
    await batch.commit()

    this.cache.clear()
    this.notifyListeners()
  }

  /**
   * Clean up resources
   */
  dispose() {
    this.stopFirestoreListener()
    this.listeners.clear()
    this.cache.clear()
  }
}
