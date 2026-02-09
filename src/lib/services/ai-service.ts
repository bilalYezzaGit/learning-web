/**
 * AI Service — Client-side
 *
 * Calls Next.js API routes for all AI features.
 * Each function maps to a specific API endpoint.
 */

import type {
  ChatMessage,
  ChatResponse,
  HintResponse,
  GenerateExerciseResponse,
  GeneratedDifficulty,
  ExplainResponse,
  SimplifyResponse,
  SummaryResponse,
  WeaknessResponse,
  ProgressEntry,
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
// Chat Tutor
// =============================================================================

export async function chatWithTutor({
  messages,
  context,
  topic,
}: {
  messages: ChatMessage[]
  context?: string
  topic?: string
}): Promise<ChatResponse> {
  return fetchAI<ChatResponse>('chat', { messages, context, topic })
}

// =============================================================================
// Hint System
// =============================================================================

export async function getHint({
  exerciseContent,
  hintLevel,
  previousHints,
  studentWork,
}: {
  exerciseContent: string
  hintLevel: number
  previousHints?: string[]
  studentWork?: string
}): Promise<HintResponse> {
  return fetchAI<HintResponse>('hint', {
    exerciseContent,
    hintLevel,
    previousHints,
    studentWork,
  })
}

// =============================================================================
// Exercise Generator
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

// =============================================================================
// Solution Explainer
// =============================================================================

export async function explainSolution({
  exerciseContent,
  studentAnswer,
}: {
  exerciseContent: string
  studentAnswer?: string
}): Promise<ExplainResponse> {
  return fetchAI<ExplainResponse>('explain', {
    exerciseContent,
    studentAnswer,
  })
}

// =============================================================================
// Concept Simplifier
// =============================================================================

export async function simplifyConcept({
  concept,
  lessonContent,
}: {
  concept: string
  lessonContent?: string
}): Promise<SimplifyResponse> {
  return fetchAI<SimplifyResponse>('simplify', {
    concept,
    lessonContent,
  })
}

// =============================================================================
// Summary Generator
// =============================================================================

export async function generateSummary({
  lessonContent,
  title,
  includeFormulas,
  includeExamples,
}: {
  lessonContent: string
  title: string
  includeFormulas?: boolean
  includeExamples?: boolean
}): Promise<SummaryResponse> {
  return fetchAI<SummaryResponse>('summary', {
    lessonContent,
    title,
    includeFormulas,
    includeExamples,
  })
}

// =============================================================================
// Weakness Analyzer
// =============================================================================

export async function analyzeWeaknesses({
  progressData,
  parcours,
}: {
  progressData: ProgressEntry[]
  parcours: string
}): Promise<WeaknessResponse> {
  return fetchAI<WeaknessResponse>('analyze-weakness', {
    progressData,
    parcours,
  })
}
