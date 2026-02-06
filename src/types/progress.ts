/**
 * Progress tracking types
 *
 * ActivityProgress, ModuleStats
 * Mapped from Flutter lib/core/models/activity.dart and stats.dart
 */

// =============================================================================
// Enums
// =============================================================================

/** Progress status for an activity */
export type ProgressStatus = 'success' | 'retry' | 'skipped' | 'pending'

// =============================================================================
// Progress types
// =============================================================================

/** Context where an activity was completed */
export interface ProgressContext {
  /** "module" | "customPath" | "series" */
  type: string
  /** ID of the context (module ID, series ID, etc.) */
  id: string
  /** When the activity was completed in this context */
  doneAt: string
}

/**
 * User progress on an activity - stored in Firestore
 *
 * Firestore path: users/{uid}/activityProgress/{activityId}
 */
export interface ActivityProgress {
  activityId: string
  /** 'exercise' or 'qcm' */
  activityType: 'exercise' | 'qcm' | 'lesson'
  status: ProgressStatus
  /** For QCM (0-100) */
  score?: number
  /** Number of questions (for QCM) */
  total?: number
  /** Number of attempts */
  attempts: number
  /** Last completion timestamp */
  lastDoneAt: string
  /** Module ID (from latest context) */
  contextId?: string
  /** Context type (from latest context) */
  contextType?: string
  /** All contexts where this activity was completed */
  contexts: ProgressContext[]
}

