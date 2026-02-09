/**
 * AI feature types
 *
 * Shared types for all AI-powered features in the app.
 */

// =============================================================================
// Smart Hints
// =============================================================================

export interface HintRequest {
  exerciseContent: string
  activityId: string
  /** Which hint level (1 = gentle nudge, 2 = method hint, 3 = detailed guide) */
  hintLevel: 1 | 2 | 3
  /** Previous hints already shown (to avoid repetition) */
  previousHints?: string[]
}

export interface HintResponse {
  hint: string
  hintLevel: 1 | 2 | 3
}

// =============================================================================
// QCM Wrong Answer Explainer
// =============================================================================

export interface QcmExplainRequest {
  questionText: string
  options: string[]
  selectedOptionIndex: number
  correctOptionIndex: number
  /** Existing explanation from the QCM if available */
  existingExplanation?: string
}

export interface QcmExplainResponse {
  /** Why the student's answer is wrong */
  whyWrong: string
  /** Why the correct answer is right */
  whyCorrect: string
  /** The key concept to review */
  conceptToReview: string
}

// =============================================================================
// Lesson Concept Simplifier
// =============================================================================

export interface SimplifyRequest {
  /** The concept block content (definition, theorem, property) */
  conceptContent: string
  /** The type of block */
  conceptType: 'definition' | 'theorem' | 'property' | 'attention'
  /** Broader lesson context */
  lessonTitle: string
}

export interface SimplifyResponse {
  /** Simplified explanation */
  simplifiedExplanation: string
  /** A concrete everyday analogy */
  analogy: string
  /** A mini worked example */
  miniExample: string
}

// =============================================================================
// Solution Decomposer
// =============================================================================

export interface DecomposeRequest {
  exerciseContent: string
  activityId: string
}

export interface SolutionStep {
  stepNumber: number
  title: string
  explanation: string
  /** Math expression for this step, if applicable */
  math?: string
}

export interface DecomposeResponse {
  steps: SolutionStep[]
  /** Key method/strategy name */
  methodName: string
}

// =============================================================================
// Performance Coach
// =============================================================================

export interface CoachRequest {
  /** Summary of student progress */
  progressSummary: {
    totalActivities: number
    completedActivities: number
    qcmResults: Array<{ activityId: string; score: number; total: number; tags: string[] }>
    exercisesCompleted: string[]
    /** Tags from completed activities */
    completedTags: string[]
    /** Tags from failed/retry activities */
    weakTags: string[]
  }
  /** Available modules in the programme */
  availableModules: Array<{ slug: string; title: string; tags: string[] }>
}

export interface CoachResponse {
  /** Overall assessment (1-2 sentences) */
  overallAssessment: string
  /** Strengths identified */
  strengths: string[]
  /** Areas needing work */
  areasToImprove: string[]
  /** Specific next steps (max 3) */
  recommendations: Array<{
    action: string
    reason: string
    /** Module slug to link to, if applicable */
    moduleSlug?: string
  }>
}

// =============================================================================
// Exercise Generator
// =============================================================================

export interface GenerateExerciseRequest {
  /** The original exercise content for reference */
  originalExercise: string
  /** Tags from the exercise */
  tags: string[]
  /** Difficulty level */
  difficulty: number
  /** Whether to make it easier or harder */
  variation: 'similar' | 'easier' | 'harder'
}

export interface GenerateExerciseResponse {
  /** The generated problem statement */
  enonce: string
  /** Step-by-step solution */
  solution: string
  /** Difficulty label */
  difficultyLabel: string
}
