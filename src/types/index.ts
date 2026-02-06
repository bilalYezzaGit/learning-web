/**
 * Types barrel export
 *
 * Re-exports all types for convenient imports:
 * import { Module, Activity, UserProfile } from '@/types'
 */

// Models
export type {
  Programme,
  Module,
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
} from './activity'

// Progress
export type {
  ActivityProgress,
  ProgressStatus,
  ProgressContext,
} from './progress'

// User
export type { UserProfile } from './user'

// Series
export type { Serie, SeriesCatalog, SeriesCatalogEntry } from './series'
