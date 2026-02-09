/**
 * Solution Decomposer API Route
 *
 * Takes an exercise with its solution and breaks it down into
 * clear, numbered steps that students can reveal one at a time.
 *
 * POST /api/ai/decompose
 */

import { NextResponse } from 'next/server'
import Anthropic from '@anthropic-ai/sdk'

import type { DecomposeRequest, DecomposeResponse } from '@/types/ai'

const anthropic = new Anthropic()

const SYSTEM_PROMPT = `Tu es un professeur de mathématiques méthodique pour lycéens tunisiens.
Tu dois décomposer la solution d'un exercice en étapes claires et numérotées.

Règles :
- Utiliser le LaTeX ($..$ inline, $$...$$ block)
- Chaque étape doit être autonome et compréhensible
- Le titre de chaque étape résume l'action (ex: "Identifier les données", "Appliquer le théorème")
- L'explication détaille le raisonnement
- Le champ math contient la formule/calcul clé de l'étape (optionnel)
- Le methodName résume la stratégie globale en 2-5 mots
- 3 à 6 étapes maximum
- Français courant, ton pédagogique

Utilise le tool submit_decomposition pour répondre.`

const DECOMPOSE_TOOL: Anthropic.Tool = {
  name: 'submit_decomposition',
  description: 'Soumet la décomposition de la solution en étapes',
  input_schema: {
    type: 'object' as const,
    properties: {
      steps: {
        type: 'array',
        items: {
          type: 'object',
          properties: {
            stepNumber: { type: 'number' },
            title: { type: 'string', description: "Titre court de l'étape" },
            explanation: { type: 'string', description: 'Explication détaillée avec LaTeX' },
            math: { type: 'string', description: "Formule/calcul clé (optionnel)" },
          },
          required: ['stepNumber', 'title', 'explanation'],
        },
        description: 'Les étapes de la solution (3-6)',
      },
      methodName: {
        type: 'string',
        description: 'Nom de la méthode/stratégie (2-5 mots)',
      },
    },
    required: ['steps', 'methodName'],
  },
}

export async function POST(request: Request) {
  try {
    const body = (await request.json()) as DecomposeRequest

    if (!body.exerciseContent) {
      return NextResponse.json(
        { error: 'Missing required fields' },
        { status: 400 }
      )
    }

    const message = await anthropic.messages.create({
      model: 'claude-sonnet-4-5-20250929',
      max_tokens: 1024,
      tools: [DECOMPOSE_TOOL],
      tool_choice: { type: 'tool', name: 'submit_decomposition' },
      system: SYSTEM_PROMPT,
      messages: [
        {
          role: 'user',
          content: `Voici l'exercice complet (énoncé + solution) :\n\n${body.exerciseContent}\n\nDécompose la solution en étapes claires et numérotées.`,
        },
      ],
    })

    const toolBlock = message.content.find((b) => b.type === 'tool_use')
    if (!toolBlock || toolBlock.type !== 'tool_use') {
      return NextResponse.json({ error: 'No response from AI' }, { status: 500 })
    }

    const result = toolBlock.input as DecomposeResponse
    return NextResponse.json(result)
  } catch (e) {
    console.error('Decompose error:', e)
    const errorMessage = e instanceof Error ? e.message : 'Unknown error'
    return NextResponse.json({ error: errorMessage }, { status: 500 })
  }
}
