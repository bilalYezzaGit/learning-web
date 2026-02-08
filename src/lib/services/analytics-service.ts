/**
 * Analytics Service
 *
 * Tracks key user events via Firebase Analytics.
 * Safe to call anywhere — silently no-ops if analytics is unavailable
 * (SSR, privacy blockers, dev mode).
 *
 * Events tracked:
 * - page_view (automatic via Firebase)
 * - serie_started: user starts a revision serie
 * - serie_completed: user finishes a serie
 * - qcm_completed: user finishes a QCM (with score)
 * - exercise_completed: user marks an exercise as done
 * - scan_uploaded: user uploads a photo for AI analysis
 * - parcours_selected: user selects a parcours
 */

import { logEvent as firebaseLogEvent } from 'firebase/analytics'

import { getAnalyticsInstance } from '@/lib/firebase/client'

async function logEvent(eventName: string, params?: Record<string, unknown>) {
  try {
    const analytics = await getAnalyticsInstance()
    if (!analytics) return
    firebaseLogEvent(analytics, eventName, params)
  } catch {
    // Silently ignore analytics errors
  }
}

export function trackSerieStarted(serieId: string) {
  logEvent('serie_started', { serie_id: serieId })
}

export function trackSerieCompleted(serieId: string, score?: number, total?: number) {
  logEvent('serie_completed', { serie_id: serieId, score, total })
}

export function trackQcmCompleted(activityId: string, score: number, total: number) {
  logEvent('qcm_completed', { activity_id: activityId, score, total, percentage: Math.round((score / total) * 100) })
}

export function trackExerciseCompleted(activityId: string) {
  logEvent('exercise_completed', { activity_id: activityId })
}

export function trackScanUploaded(activityId: string, isCorrect: boolean) {
  logEvent('scan_uploaded', { activity_id: activityId, is_correct: isCorrect })
}

export function trackParcoursSelected(parcours: string) {
  logEvent('parcours_selected', { parcours })
}
