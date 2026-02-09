/**
 * AI Solution Explainer API
 *
 * Provides step-by-step explanations for math exercises.
 *
 * POST /api/ai/explain
 */

import { NextResponse } from 'next/server'
import Anthropic from '@anthropic-ai/sdk'

import type { ExplainRequest } from '@/types/ai'

const anthropic = new Anthropic()

const EXPLAIN_TOOL: Anthropic.Tool = {
  name: 'submit_explanation',
  description: "Soumet l'explication pas-à-pas de l'exercice",
  input_schema: {
    type: 'object' as const,
    properties: {
      steps: {
        type: 'array',
        items: {
          type: 'object',
          properties: {
            stepNumber: { type: 'number', description: "Numéro de l'étape" },
            title: { type: 'string', description: "Titre court de l'étape" },
            content: { type: 'string', description: 'Explication détaillée avec LaTeX' },
          },
          required: ['stepNumber', 'title', 'content'],
        },
        description: 'Les étapes de résolution',
      },
      keyConceptsUsed: {
        type: 'array',
        items: { type: 'string' },
        description: 'Concepts clés utilisés dans la résolution',
      },
      commonMistakes: {
        type: 'array',
        items: { type: 'string' },
        description: 'Erreurs courantes à éviter',
      },
    },
    required: ['steps', 'keyConceptsUsed', 'commonMistakes'],
  },
}

const SYSTEM_PROMPT = `Tu es un professeur de mathématiques qui explique les solutions pas-à-pas pour des lycéens tunisiens.

Ta mission :
- Décomposer la résolution en étapes claires et numérotées
- Chaque étape doit avoir un titre et une explication détaillée
- Utiliser du LaTeX ($...$) pour toutes les formules
- Identifier les concepts clés utilisés
- Lister les erreurs courantes que les élèves font sur ce type d'exercice

Règles :
- Maximum 8 étapes
- Chaque étape doit justifier le passage à la suivante
- Utiliser un langage simple et accessible
- Si l'élève a fourni une réponse, commenter ses erreurs
- Inclure les théorèmes et propriétés utilisés

Utilise le tool submit_explanation pour retourner ton explication.`

export async function POST(request: Request) {
  try {
    const body = (await request.json()) as ExplainRequest

    if (!body.exerciseContent) {
      return NextResponse.json(
        { error: 'exerciseContent is required' },
        { status: 400 }
      )
    }

    const studentAnswerText = body.studentAnswer
      ? `\n\nRéponse de l'élève :\n${body.studentAnswer}`
      : ''

    const response = await anthropic.messages.create({
      model: 'claude-sonnet-4-5-20250929',
      max_tokens: 4096,
      tools: [EXPLAIN_TOOL],
      tool_choice: { type: 'tool', name: 'submit_explanation' },
      system: SYSTEM_PROMPT,
      messages: [
        {
          role: 'user',
          content: `Exercice :\n${body.exerciseContent}${studentAnswerText}\n\nExplique la solution pas-à-pas.`,
        },
      ],
    })

    const toolBlock = response.content.find((b) => b.type === 'tool_use')
    if (!toolBlock || toolBlock.type !== 'tool_use') {
      return NextResponse.json(
        { error: 'No structured response from AI' },
        { status: 500 }
      )
    }

    const result = toolBlock.input as {
      steps: Array<{ stepNumber: number; title: string; content: string }>
      keyConceptsUsed: string[]
      commonMistakes: string[]
    }

    return NextResponse.json(result)
  } catch (e) {
    console.error('AI Explain error:', e)
    const message = e instanceof Error ? e.message : 'Unknown error'
    return NextResponse.json({ error: message }, { status: 500 })
  }
}
