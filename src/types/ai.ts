/**
 * AI Feature Types
 *
 * Types for deeply integrated AI features:
 * - Progressive Hints (exercise)
 * - Exercise Generator (exercise)
 * - Solution Explainer (exercise)
 * - QCM Remediation (qcm-player)
 * - Inline Concept Help (lesson parts)
 * - Comprehension Check (lesson end)
 */

// =============================================================================
// Hint System
// =============================================================================

export interface HintRequest {
  exerciseContent: string
  hintLevel: number
  previousHints?: string[]
  studentWork?: string
}

export interface HintResponse {
  hint: string
  hintLevel: number
  hasMoreHints: boolean
}

// =============================================================================
// Exercise Generator
// =============================================================================

export type GeneratedDifficulty = 'plus_facile' | 'similaire' | 'plus_difficile'

export interface GenerateExerciseRequest {
  originalExercise: string
  topic: string
  difficulty: GeneratedDifficulty
  count?: number
}

export interface GeneratedExercise {
  enonce: string
  solution: string
  difficulty: GeneratedDifficulty
}

export interface GenerateExerciseResponse {
  exercises: GeneratedExercise[]
}

// =============================================================================
// Solution Explainer
// =============================================================================

export interface ExplainRequest {
  exerciseContent: string
  studentAnswer?: string
}

export interface ExplainStep {
  stepNumber: number
  title: string
  content: string
  latex?: string
}

export interface ExplainResponse {
  steps: ExplainStep[]
  keyConceptsUsed: string[]
  commonMistakes: string[]
}
