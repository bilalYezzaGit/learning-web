/**
 * AI Feature Types
 *
 * Types for all AI-powered features:
 * - Math Tutor Chat
 * - Progressive Hints
 * - Exercise Generator
 * - Solution Explainer
 * - Concept Simplifier
 * - Summary Generator
 * - Weakness Analyzer
 */

// =============================================================================
// Chat Tutor
// =============================================================================

export interface ChatMessage {
  role: 'user' | 'assistant'
  content: string
  timestamp: number
}

export interface ChatRequest {
  messages: ChatMessage[]
  context?: string
  topic?: string
}

export interface ChatResponse {
  reply: string
}

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

// =============================================================================
// Concept Simplifier
// =============================================================================

export interface SimplifyRequest {
  concept: string
  lessonContent?: string
}

export interface SimplifyResponse {
  simpleExplanation: string
  analogy: string
  realWorldExample: string
  visualDescription: string
  keyPoints: string[]
}

// =============================================================================
// Summary Generator
// =============================================================================

export interface SummaryRequest {
  lessonContent: string
  title: string
  includeFormulas?: boolean
  includeExamples?: boolean
}

export interface SummaryResponse {
  summary: string
  keyFormulas: string[]
  keyDefinitions: Array<{ term: string; definition: string }>
  mnemonics: string[]
  reviewQuestions: string[]
}

// =============================================================================
// Weakness Analyzer
// =============================================================================

export interface ProgressEntry {
  activityId: string
  activityType: 'exercise' | 'qcm' | 'lesson'
  status: string
  score?: number
  total?: number
  attempts: number
  tags?: string[]
  title?: string
}

export interface WeaknessRequest {
  progressData: ProgressEntry[]
  parcours: string
}

export interface WeaknessArea {
  topic: string
  severity: 'faible' | 'moyen' | 'critique'
  description: string
  suggestedActions: string[]
}

export interface WeaknessResponse {
  strengths: string[]
  weaknesses: WeaknessArea[]
  overallAnalysis: string
  studyPlan: string[]
  encouragement: string
}
