/**
 * Types barrel export
 *
 * Re-exports all types for convenient imports:
 * import { UserProfile } from '@/types'
 */

// Progress
export type {
  ActivityProgress,
  ProgressStatus,
  ProgressContext,
} from './progress'

// User
export type { UserProfile } from './user'

// Dashboard
export type {
  DashboardModuleInfo,
  DashboardSeriesInfo,
  NextActivity,
  GlobalProgress,
  ModuleProgress,
  LearningStats,
  LearningTag,
  StrengthsAnalysis,
  RecommendedSeries,
  AnalysisStatus,
  DashboardData,
} from './dashboard'
