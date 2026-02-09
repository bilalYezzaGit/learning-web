/**
 * AI Client Service
 *
 * Client-side functions for calling AI API routes.
 * Each function corresponds to a specific AI feature.
 */

import type {
  HintRequest,
  HintResponse,
  QcmExplainRequest,
  QcmExplainResponse,
  SimplifyRequest,
  SimplifyResponse,
  DecomposeRequest,
  DecomposeResponse,
  CoachRequest,
  CoachResponse,
  GenerateExerciseRequest,
  GenerateExerciseResponse,
} from '@/types/ai'

class AIError extends Error {
  constructor(message: string) {
    super(message)
    this.name = 'AIError'
  }
}

async function aiPost<TReq, TRes>(endpoint: string, body: TReq): Promise<TRes> {
  const response = await fetch(endpoint, {
    method: 'POST',
    headers: { 'Content-Type': 'application/json' },
    body: JSON.stringify(body),
  })

  if (!response.ok) {
    const data = await response.json().catch(() => ({ error: 'Erreur inconnue' })) as { error?: string }
    throw new AIError(data.error ?? `HTTP ${response.status}`)
  }

  return response.json() as Promise<TRes>
}

export async function requestHint(params: HintRequest): Promise<HintResponse> {
  return aiPost<HintRequest, HintResponse>('/api/ai/hint', params)
}

export async function requestQcmExplanation(params: QcmExplainRequest): Promise<QcmExplainResponse> {
  return aiPost<QcmExplainRequest, QcmExplainResponse>('/api/ai/qcm-explain', params)
}

export async function requestSimplify(params: SimplifyRequest): Promise<SimplifyResponse> {
  return aiPost<SimplifyRequest, SimplifyResponse>('/api/ai/simplify', params)
}

export async function requestDecompose(params: DecomposeRequest): Promise<DecomposeResponse> {
  return aiPost<DecomposeRequest, DecomposeResponse>('/api/ai/decompose', params)
}

export async function requestCoachInsights(params: CoachRequest): Promise<CoachResponse> {
  return aiPost<CoachRequest, CoachResponse>('/api/ai/coach', params)
}

export async function requestGenerateExercise(params: GenerateExerciseRequest): Promise<GenerateExerciseResponse> {
  return aiPost<GenerateExerciseRequest, GenerateExerciseResponse>('/api/ai/generate-exercise', params)
}

export { AIError }
