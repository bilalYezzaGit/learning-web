/**
 * Dashboard types — "Cockpit de progression"
 *
 * Types for the enriched dashboard widgets:
 * next activity, global progress, learning stats,
 * strengths/weaknesses, revision recommendations, analysis status.
 */

import type { AtomType } from './content'

// =============================================================================
// Module & Series info (passed from server)
// =============================================================================

/** Minimal module info resolved by the server component */
export interface DashboardModuleInfo {
  id: string
  title: string
  trimester: string
  activityIds: string[]
}

/** Minimal series info resolved by the server component */
export interface DashboardSeriesInfo {
  slug: string
  title: string
  difficulty: number
  estimatedMinutes: number
  trimestre: 1 | 2 | 3
  modules: string[]
  tags: string[]
  type: string
  activityIds: string[]
}

// =============================================================================
// Widget data types
// =============================================================================

/** Recommended next activity */
export interface NextActivity {
  activityId: string
  activityType: AtomType
  title: string
  moduleId: string
  moduleTitle: string
  /** Reason for the recommendation */
  reason: 'continue' | 'retry' | 'next-module' | 'first-activity'
}

/** Global progress stats */
export interface GlobalProgress {
  /** Overall completion percentage (0–100) */
  percentage: number
  /** Total activities in the parcours */
  totalActivities: number
  /** Number of completed activities */
  completedActivities: number
  /** Total number of modules */
  totalModules: number
  /** Number of fully completed modules */
  completedModules: number
  /** Number of modules in progress (at least 1 activity done) */
  inProgressModules: number
  /** Per-module breakdown */
  modules: ModuleProgress[]
}

/** Progress for a single module */
export interface ModuleProgress {
  id: string
  title: string
  trimester: string
  done: number
  total: number
  percentage: number
}

/** Learning statistics */
export interface LearningStats {
  /** Total exercises completed */
  exercisesCompleted: number
  /** Total QCMs completed */
  qcmsCompleted: number
  /** Total lessons viewed */
  lessonsCompleted: number
  /** Average QCM score (0–100), null if no QCMs done */
  averageQcmScore: number | null
  /** Total attempts across all activities */
  totalAttempts: number
  /** Number of days with activity in the last 30 days */
  activeDaysLast30: number
  /** Date of last activity (ISO string), null if none */
  lastActivityDate: string | null
  /** Streak: consecutive recent days with activity */
  currentStreak: number
}

/** A strength or weakness tag */
export interface LearningTag {
  /** Tag name (e.g. "angles", "algebre") */
  tag: string
  /** Associated module IDs */
  moduleIds: string[]
  /** Average score on related activities (0–100) */
  averageScore: number
  /** Number of activities attempted */
  activitiesAttempted: number
  /** Number of activities succeeded */
  activitiesSucceeded: number
}

/** Strengths and weaknesses synthesis */
export interface StrengthsAnalysis {
  /** Tags where the user performs well */
  strengths: LearningTag[]
  /** Tags where the user needs improvement */
  weaknesses: LearningTag[]
}

/** A recommended revision series */
export interface RecommendedSeries {
  slug: string
  title: string
  difficulty: number
  estimatedMinutes: number
  trimestre: 1 | 2 | 3
  /** Completion percentage for this series */
  completionPercentage: number
  /** Why this series is recommended */
  reason: 'in-progress' | 'weak-area' | 'not-started' | 'review'
}

/** Analysis status */
export interface AnalysisStatus {
  /** When the synthesis was last computed (ISO string) */
  lastComputedAt: string
  /** Number of activities completed since last computation */
  pendingActivities: number
  /** Whether the synthesis is considered up-to-date */
  isUpToDate: boolean
}

// =============================================================================
// Full dashboard state
// =============================================================================

/** Complete dashboard data computed from progress + content */
export interface DashboardData {
  nextActivity: NextActivity | null
  globalProgress: GlobalProgress
  learningStats: LearningStats
  strengths: StrengthsAnalysis
  recommendedSeries: RecommendedSeries[]
  analysisStatus: AnalysisStatus
}
