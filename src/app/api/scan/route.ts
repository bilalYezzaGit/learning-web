/**
 * Scan Analysis API Route
 *
 * Receives a photo of student work + exercise content,
 * calls Claude Vision to analyze correctness, returns feedback.
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

Réponds UNIQUEMENT en JSON valide avec ce format exact :
{
  "isCorrect": boolean,
  "confidence": number entre 0 et 1,
  "feedback": "string — retour clair en français",
  "suggestions": ["string — suggestion 1", "string — suggestion 2"]
}

Règles :
- Si le travail est globalement correct avec des erreurs mineures, isCorrect = true mais mentionne les erreurs dans le feedback
- Si tu ne peux pas lire la photo ou si elle n'est pas pertinente, confidence = 0 et isCorrect = false
- Maximum 3 suggestions
- Sois encourageant, jamais condescendant`

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

    const textBlock = message.content.find((b) => b.type === 'text')
    if (!textBlock || textBlock.type !== 'text') {
      return NextResponse.json({ error: 'No response from AI' }, { status: 500 })
    }

    const parsed = JSON.parse(textBlock.text) as {
      isCorrect: boolean
      confidence: number
      feedback: string
      suggestions: string[]
    }

    return NextResponse.json({
      activityId: body.activityId,
      isCorrect: parsed.isCorrect,
      confidence: parsed.confidence,
      feedback: parsed.feedback,
      suggestions: parsed.suggestions ?? [],
    })
  } catch (e) {
    console.error('Scan analysis error:', e)
    const message = e instanceof Error ? e.message : 'Unknown error'
    return NextResponse.json({ error: message }, { status: 500 })
  }
}
