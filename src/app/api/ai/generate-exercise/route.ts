/**
 * Exercise Generator API Route
 *
 * Generates a new exercise similar to a given one, with adjustable difficulty.
 * The generated exercise includes a problem statement and step-by-step solution.
 *
 * POST /api/ai/generate-exercise
 */

import { NextResponse } from 'next/server'
import Anthropic from '@anthropic-ai/sdk'

import type { GenerateExerciseRequest, GenerateExerciseResponse } from '@/types/ai'

const anthropic = new Anthropic()

const SYSTEM_PROMPT = `Tu es un professeur de mathématiques expert pour lycéens tunisiens.
Tu dois générer un NOUVEL exercice inspiré d'un exercice donné.

Règles :
- Utiliser le LaTeX ($..$ inline, $$...$$ block)
- L'exercice doit être DIFFÉRENT de l'original (autres nombres, variante du problème)
- L'énoncé doit être clair et autonome
- La solution doit être détaillée étape par étape
- Adapter la difficulté selon la variation demandée :
  - "similar" : même niveau, autres valeurs numériques
  - "easier" : simplifier (moins d'étapes, nombres plus simples)
  - "harder" : complexifier (étapes supplémentaires, cas particuliers)
- Le difficultyLabel décrit le niveau en français

Utilise le tool submit_exercise pour répondre.`

const GENERATE_TOOL: Anthropic.Tool = {
  name: 'submit_exercise',
  description: "Soumet l'exercice généré",
  input_schema: {
    type: 'object' as const,
    properties: {
      enonce: {
        type: 'string',
        description: "Énoncé du nouvel exercice avec LaTeX",
      },
      solution: {
        type: 'string',
        description: 'Solution détaillée étape par étape avec LaTeX',
      },
      difficultyLabel: {
        type: 'string',
        description: 'Niveau de difficulté en français (ex: "Facile", "Moyen", "Difficile")',
      },
    },
    required: ['enonce', 'solution', 'difficultyLabel'],
  },
}

export async function POST(request: Request) {
  try {
    const body = (await request.json()) as GenerateExerciseRequest

    if (!body.originalExercise) {
      return NextResponse.json(
        { error: 'Missing required fields' },
        { status: 400 }
      )
    }

    const variationLabel = {
      similar: 'similaire (même niveau, autres valeurs)',
      easier: 'plus facile (simplifier)',
      harder: 'plus difficile (complexifier)',
    }[body.variation]

    const message = await anthropic.messages.create({
      model: 'claude-sonnet-4-5-20250929',
      max_tokens: 1024,
      tools: [GENERATE_TOOL],
      tool_choice: { type: 'tool', name: 'submit_exercise' },
      system: SYSTEM_PROMPT,
      messages: [
        {
          role: 'user',
          content: `Exercice original :\n\n${body.originalExercise}\n\nTags : ${body.tags.join(', ')}\nDifficulté originale : ${body.difficulty}/3\n\nGénère un exercice ${variationLabel}.`,
        },
      ],
    })

    const toolBlock = message.content.find((b) => b.type === 'tool_use')
    if (!toolBlock || toolBlock.type !== 'tool_use') {
      return NextResponse.json({ error: 'No response from AI' }, { status: 500 })
    }

    const result = toolBlock.input as GenerateExerciseResponse
    return NextResponse.json(result)
  } catch (e) {
    console.error('Generate exercise error:', e)
    const errorMessage = e instanceof Error ? e.message : 'Unknown error'
    return NextResponse.json({ error: errorMessage }, { status: 500 })
  }
}
