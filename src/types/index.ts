/**
 * Types barrel export
 *
 * Re-exports all types for convenient imports:
 * import { Module, Activity, UserProfile } from '@/types'
 */

// Models
export type {
  Programme,
  ProgrammeSummary,
  Module,
  ModuleSummary,
  Section,
  CourseContent,
} from './models'

// Activities
export type {
  Activity,
  Exercise,
  QCM,
  Lesson,
  ActivityType,
  ExerciseCategory,
  ExerciseQuestion,
  QCMQuestion,
} from './activity'

export {
  isExercise,
  isQCM,
  isLesson,
  getActivityTypeLabel,
  isProbleme,
  getQuestionCount,
} from './activity'

// Progress
export type {
  ActivityProgress,
  ModuleStats,
  ProgressStatus,
  ProgressContext,
} from './progress'

export {
  emptyModuleStats,
  isProgressSuccess,
  needsReview,
  isModuleComplete,
  getRemainingCount,
} from './progress'

// User
export type { UserProfile, OnboardingState } from './user'

export {
  ONBOARDING_TOTAL_STEPS,
  initialOnboardingState,
  hasFirstName,
  getDisplayName,
  canProceed,
  isOnboardingComplete,
  getOnboardingProgress,
  getStepLabel,
} from './user'

// Series
export type { Serie, SeriesCatalog, SeriesCatalogEntry } from './series'

export {
  findSeriesById,
  getSeriesExerciseCount,
  getSeriesQCMCount,
  getSeriesModuleIds,
} from './series'
