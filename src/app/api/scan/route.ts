/**
 * Scan Analysis API Route
 *
 * Receives a photo of student work + exercise content,
 * calls Claude Vision to analyze correctness, returns structured feedback.
 *
 * Uses tool_use to guarantee structured JSON output.
 *
 * POST /api/scan
 * Body (JSON): { imageBase64: string, activityId: string, exerciseContent: string }
 */

import { NextResponse } from 'next/server'
import Anthropic from '@anthropic-ai/sdk'

const anthropic = new Anthropic()

const SYSTEM_PROMPT = `Tu es un professeur de mathématiques bienveillant et rigoureux pour des lycéens tunisiens.

On te donne :
1. L'énoncé d'un exercice de maths (format MDX/LaTeX)
2. Une photo du travail manuscrit de l'élève

Ta mission :
- Analyser si le travail de l'élève est correct
- Donner un feedback clair et encourageant en français
- Proposer des suggestions d'amélioration si nécessaire

Règles :
- Si le travail est globalement correct avec des erreurs mineures, isCorrect = true mais mentionne les erreurs dans le feedback
- Si tu ne peux pas lire la photo ou si elle n'est pas pertinente, confidence = 0 et isCorrect = false
- Maximum 3 suggestions
- Sois encourageant, jamais condescendant

Utilise le tool submit_analysis pour retourner ton analyse.`

const ANALYSIS_TOOL: Anthropic.Tool = {
  name: 'submit_analysis',
  description: "Soumet l'analyse du travail de l'élève avec feedback structuré",
  input_schema: {
    type: 'object' as const,
    properties: {
      isCorrect: {
        type: 'boolean',
        description: 'true si le travail est globalement correct',
      },
      confidence: {
        type: 'number',
        description: 'Niveau de confiance entre 0 et 1',
      },
      feedback: {
        type: 'string',
        description: 'Retour clair et encourageant en français',
      },
      suggestions: {
        type: 'array',
        items: { type: 'string' },
        description: "Suggestions d'amélioration (max 3)",
      },
    },
    required: ['isCorrect', 'confidence', 'feedback', 'suggestions'],
  },
}

interface AnalysisResult {
  isCorrect: boolean
  confidence: number
  feedback: string
  suggestions: string[]
}

interface ScanRequest {
  imageBase64: string
  activityId: string
  exerciseContent: string
}

export async function POST(request: Request) {
  try {
    const body = (await request.json()) as ScanRequest

    if (!body.imageBase64 || !body.activityId || !body.exerciseContent) {
      return NextResponse.json(
        { error: 'Missing required fields: imageBase64, activityId, exerciseContent' },
        { status: 400 }
      )
    }

    const message = await anthropic.messages.create({
      model: 'claude-sonnet-4-5-20250929',
      max_tokens: 1024,
      tools: [ANALYSIS_TOOL],
      tool_choice: { type: 'tool', name: 'submit_analysis' },
      messages: [
        {
          role: 'user',
          content: [
            {
              type: 'text',
              text: `Voici l'énoncé de l'exercice :\n\n${body.exerciseContent}`,
            },
            {
              type: 'image',
              source: {
                type: 'base64',
                media_type: 'image/jpeg',
                data: body.imageBase64,
              },
            },
            {
              type: 'text',
              text: "Analyse le travail de l'élève sur cette photo par rapport à l'énoncé ci-dessus.",
            },
          ],
        },
      ],
      system: SYSTEM_PROMPT,
    })

    const toolBlock = message.content.find((b) => b.type === 'tool_use')
    if (!toolBlock || toolBlock.type !== 'tool_use') {
      return NextResponse.json({ error: 'No structured response from AI' }, { status: 500 })
    }

    const result = toolBlock.input as AnalysisResult

    return NextResponse.json({
      activityId: body.activityId,
      isCorrect: result.isCorrect,
      confidence: result.confidence,
      feedback: result.feedback,
      suggestions: result.suggestions ?? [],
    })
  } catch (e) {
    console.error('Scan analysis error:', e)
    const message = e instanceof Error ? e.message : 'Unknown error'
    return NextResponse.json({ error: message }, { status: 500 })
  }
}
