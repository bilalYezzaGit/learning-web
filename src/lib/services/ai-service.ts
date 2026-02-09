/**
 * AI Service — Client-side
 *
 * Calls Next.js API routes for deeply-integrated AI features.
 * Each function maps to a specific learning workflow.
 */

import type {
  HintResponse,
  GenerateExerciseResponse,
  GeneratedDifficulty,
  ExplainResponse,
} from '@/types/ai'

// =============================================================================
// Helpers
// =============================================================================

export class AIError extends Error {
  constructor(message: string) {
    super(message)
    this.name = 'AIError'
  }
}

async function fetchAI<T>(endpoint: string, body: unknown): Promise<T> {
  const response = await fetch(`/api/ai/${endpoint}`, {
    method: 'POST',
    headers: { 'Content-Type': 'application/json' },
    body: JSON.stringify(body),
  })

  if (!response.ok) {
    const data = (await response.json().catch(() => ({ error: 'Unknown error' }))) as { error?: string }
    throw new AIError(data.error ?? `HTTP ${response.status}`)
  }

  return response.json() as Promise<T>
}

// =============================================================================
// QCM Wrong Answer Remediation
// =============================================================================

export interface RemediationResult {
  whyWrong: string
  misconception: string
  whyCorrect: string
  conceptToReview: string
}

export async function remediateWrongAnswer({
  questionText,
  options,
  chosenIndex,
  correctIndex,
  existingExplanation,
}: {
  questionText: string
  options: string[]
  chosenIndex: number
  correctIndex: number
  existingExplanation?: string
}): Promise<RemediationResult> {
  return fetchAI<RemediationResult>('remediate', {
    questionText,
    options,
    chosenIndex,
    correctIndex,
    existingExplanation,
  })
}

// =============================================================================
// Inline Concept Help (Definition/Theorem/Property)
// =============================================================================

export interface ConceptExplanation {
  simpleVersion: string
  intuition: string
  quickExample: string
}

export async function explainConcept({
  conceptType,
  conceptTitle,
  conceptContent,
}: {
  conceptType: 'definition' | 'theorem' | 'property'
  conceptTitle: string
  conceptContent: string
}): Promise<ConceptExplanation> {
  return fetchAI<ConceptExplanation>('explain-concept', {
    conceptType,
    conceptTitle,
    conceptContent,
  })
}

// =============================================================================
// Lesson Comprehension Check
// =============================================================================

export interface ComprehensionQuestion {
  question: string
  answer: string
  hint: string
}

export interface ComprehensionCheckResult {
  questions: ComprehensionQuestion[]
}

export async function generateComprehensionCheck({
  lessonContent,
  title,
}: {
  lessonContent: string
  title: string
}): Promise<ComprehensionCheckResult> {
  return fetchAI<ComprehensionCheckResult>('comprehension-check', {
    lessonContent,
    title,
  })
}

// =============================================================================
// Exercise: Progressive Hints
// =============================================================================

export async function getHint({
  exerciseContent,
  hintLevel,
  previousHints,
}: {
  exerciseContent: string
  hintLevel: number
  previousHints?: string[]
}): Promise<HintResponse> {
  return fetchAI<HintResponse>('hint', {
    exerciseContent,
    hintLevel,
    previousHints,
  })
}

// =============================================================================
// Exercise: Step-by-step Solution
// =============================================================================

export async function explainSolution({
  exerciseContent,
}: {
  exerciseContent: string
}): Promise<ExplainResponse> {
  return fetchAI<ExplainResponse>('explain', { exerciseContent })
}

// =============================================================================
// Exercise: Generate Similar
// =============================================================================

export async function generateExercises({
  originalExercise,
  topic,
  difficulty,
  count,
}: {
  originalExercise: string
  topic: string
  difficulty: GeneratedDifficulty
  count?: number
}): Promise<GenerateExerciseResponse> {
  return fetchAI<GenerateExerciseResponse>('generate-exercises', {
    originalExercise,
    topic,
    difficulty,
    count,
  })
}
