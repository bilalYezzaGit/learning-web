/**
 * Activity types
 *
 * Unified representation for exercises, QCMs, and lessons.
 * Mapped from Flutter lib/core/models/activity.dart
 */

// =============================================================================
// Enums
// =============================================================================

/** Type of activity */
export type ActivityType = 'exercise' | 'qcm' | 'lesson'

/** Category of exercise */
export type ExerciseCategory =
  | 'application_directe'
  | 'approfondissement'
  | 'synthese'
  | 'probleme'

// =============================================================================
// Question types
// =============================================================================

/** A question within a multi-question exercise (probleme) */
export interface ExerciseQuestion {
  id: string
  enonce: string
  solution: string
  hint?: string
  dependsPrevious: boolean
}

/** A question within a QCM */
export interface QCMQuestion {
  id: string
  /** 'qcm' or 'vrai_faux' */
  questionType: 'qcm' | 'vrai_faux'
  timeMinutes: number
  enonce: string

  // For type: qcm
  options?: string[]
  correctIndex?: number
  explication?: string

  // For type: vrai_faux
  affirmations?: string[]
  reponses?: string[]
}

// =============================================================================
// Activity base interface
// =============================================================================

/** Common fields for all activities */
interface ActivityBase {
  id: string
  sectionId?: string
  tags: string[]
  /** Module IDs this activity belongs to */
  modules: string[]
  visible: boolean
  title: string
  difficulty: number
  timeMinutes: number
}

// =============================================================================
// Activity variants
// =============================================================================

/** Exercise with statement and solution */
export interface Exercise extends ActivityBase {
  type: 'exercise'
  enonce: string
  solution: string
  hint?: string
  methode?: string
  erreurs?: string
  category: ExerciseCategory
  contexte?: string
  questions: ExerciseQuestion[]
}

/** QCM (Quiz) with multiple questions */
export interface QCM extends ActivityBase {
  type: 'qcm'
  description?: string
  questions: QCMQuestion[]
}

/** Lesson (rappel de cours) with body content */
export interface Lesson extends ActivityBase {
  type: 'lesson'
  body: string
  summary?: string
}

/** Union type for all activities */
export type Activity = Exercise | QCM | Lesson

// =============================================================================
// Type guards
// =============================================================================

export function isExercise(activity: Activity): activity is Exercise {
  return activity.type === 'exercise'
}

export function isQCM(activity: Activity): activity is QCM {
  return activity.type === 'qcm'
}

export function isLesson(activity: Activity): activity is Lesson {
  return activity.type === 'lesson'
}

// =============================================================================
// Helpers
// =============================================================================

/** Get activity type label in French */
export function getActivityTypeLabel(type: ActivityType): string {
  switch (type) {
    case 'exercise':
      return 'Exercice'
    case 'qcm':
      return 'QCM'
    case 'lesson':
      return 'Cours'
  }
}

/** Check if exercise is a multi-question problem */
export function isProbleme(exercise: Exercise): boolean {
  return exercise.questions.length > 0
}

/** Get question count for QCM */
export function getQuestionCount(qcm: QCM): number {
  return qcm.questions.length
}
