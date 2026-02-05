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

// =============================================================================
// Stats types
// =============================================================================

/** Statistics for a module's progress */
export interface ModuleStats {
  /** Number of completed activities */
  completed: number
  /** Number of successful completions */
  success: number
  /** Total number of activities */
  total: number
  /** Completion percentage (0-100) */
  percentage: number
  /** Success percentage (0-100) */
  successPercentage: number
  /** Total exercises in module */
  totalExercises: number
  /** Completed exercises */
  completedExercises: number
  /** Successfully completed exercises */
  successfulExercises: number
  /** Total QCMs in module */
  totalQCMs: number
  /** Completed QCMs */
  completedQCMs: number
}

// =============================================================================
// Helpers
// =============================================================================

/** Create empty stats */
export function emptyModuleStats(): ModuleStats {
  return {
    completed: 0,
    success: 0,
    total: 0,
    percentage: 0,
    successPercentage: 0,
    totalExercises: 0,
    completedExercises: 0,
    successfulExercises: 0,
    totalQCMs: 0,
    completedQCMs: 0,
  }
}

/** Check if progress indicates success */
export function isProgressSuccess(progress: ActivityProgress): boolean {
  return progress.status === 'success'
}

/** Check if progress needs review */
export function needsReview(progress: ActivityProgress): boolean {
  return progress.status === 'retry'
}

/** Check if module is fully completed */
export function isModuleComplete(stats: ModuleStats): boolean {
  return stats.completed === stats.total && stats.total > 0
}

/** Get remaining activities count */
export function getRemainingCount(stats: ModuleStats): number {
  return stats.total - stats.completed
}
