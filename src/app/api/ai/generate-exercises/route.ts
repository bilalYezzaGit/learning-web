/**
 * AI Exercise Generator API
 *
 * Generates similar exercises based on a given exercise, with adjustable difficulty.
 *
 * POST /api/ai/generate-exercises
 */

import { NextResponse } from 'next/server'
import Anthropic from '@anthropic-ai/sdk'

import type { GenerateExerciseRequest } from '@/types/ai'

const anthropic = new Anthropic()

const GENERATE_TOOL: Anthropic.Tool = {
  name: 'submit_exercises',
  description: 'Soumet les exercices générés',
  input_schema: {
    type: 'object' as const,
    properties: {
      exercises: {
        type: 'array',
        items: {
          type: 'object',
          properties: {
            enonce: {
              type: 'string',
              description: "L'énoncé de l'exercice en format texte avec LaTeX",
            },
            solution: {
              type: 'string',
              description: 'La solution détaillée avec les étapes en LaTeX',
            },
            difficulty: {
              type: 'string',
              enum: ['plus_facile', 'similaire', 'plus_difficile'],
              description: "Le niveau de difficulté de l'exercice",
            },
          },
          required: ['enonce', 'solution', 'difficulty'],
        },
        description: 'Liste des exercices générés',
      },
    },
    required: ['exercises'],
  },
}

const SYSTEM_PROMPT = `Tu es un professeur de mathématiques expert qui crée des exercices pour des lycéens tunisiens.

Quand on te donne un exercice de référence, tu dois en générer de nouveaux qui :
- Testent les mêmes compétences et concepts
- Ont des valeurs numériques différentes
- Sont adaptés au niveau demandé (plus facile, similaire, ou plus difficile)
- Ont des solutions complètes et détaillées

Règles :
- Utilise du LaTeX ($...$) pour toutes les formules
- Les énoncés doivent être clairs et bien structurés
- Les solutions doivent montrer CHAQUE étape du raisonnement
- Adapte la difficulté :
  * plus_facile : nombres plus simples, moins d'étapes
  * similaire : même complexité, valeurs différentes
  * plus_difficile : plus d'étapes, concepts combinés, cas particuliers
- Suis le programme tunisien

Utilise le tool submit_exercises pour retourner tes exercices.`

export async function POST(request: Request) {
  try {
    const body = (await request.json()) as GenerateExerciseRequest

    if (!body.originalExercise || !body.topic) {
      return NextResponse.json(
        { error: 'originalExercise and topic are required' },
        { status: 400 }
      )
    }

    const count = Math.min(body.count ?? 2, 5)
    const difficulty = body.difficulty || 'similaire'

    const response = await anthropic.messages.create({
      model: 'claude-sonnet-4-5-20250929',
      max_tokens: 4096,
      tools: [GENERATE_TOOL],
      tool_choice: { type: 'tool', name: 'submit_exercises' },
      system: SYSTEM_PROMPT,
      messages: [
        {
          role: 'user',
          content: `Sujet : ${body.topic}

Exercice de référence :
${body.originalExercise}

Génère ${count} exercice(s) de difficulté "${difficulty}".`,
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

    const result = toolBlock.input as { exercises: Array<{ enonce: string; solution: string; difficulty: string }> }

    return NextResponse.json({ exercises: result.exercises })
  } catch (e) {
    console.error('AI Generate error:', e)
    const message = e instanceof Error ? e.message : 'Unknown error'
    return NextResponse.json({ error: message }, { status: 500 })
  }
}
