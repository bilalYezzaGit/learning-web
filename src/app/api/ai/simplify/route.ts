/**
 * Lesson Concept Simplifier API Route
 *
 * Takes a math concept (definition, theorem, property) and explains it
 * in simpler terms with an analogy and a mini example.
 *
 * POST /api/ai/simplify
 */

import { NextResponse } from 'next/server'
import Anthropic from '@anthropic-ai/sdk'

import type { SimplifyRequest, SimplifyResponse } from '@/types/ai'

const anthropic = new Anthropic()

const SYSTEM_PROMPT = `Tu es un professeur de mathématiques créatif pour lycéens tunisiens.
Un élève ne comprend pas un concept mathématique. Tu dois l'expliquer AUTREMENT.

Règles :
- Utiliser le LaTeX ($..$ inline, $$...$$ block)
- Parler en français simple et accessible
- L'explication simplifiée doit être DIFFÉRENTE de l'originale, pas juste reformulée
- L'analogie doit être liée à la vie quotidienne (sport, cuisine, technologie, etc.)
- Le mini-exemple doit être numérique et concret, différent de ceux du cours
- Être concis : chaque partie fait 2-4 phrases max

Utilise le tool submit_simplification pour répondre.`

const SIMPLIFY_TOOL: Anthropic.Tool = {
  name: 'submit_simplification',
  description: 'Soumet la simplification du concept',
  input_schema: {
    type: 'object' as const,
    properties: {
      simplifiedExplanation: {
        type: 'string',
        description: 'Explication simplifiée du concept, en français avec LaTeX',
      },
      analogy: {
        type: 'string',
        description: 'Analogie avec la vie quotidienne',
      },
      miniExample: {
        type: 'string',
        description: 'Mini exemple numérique concret avec LaTeX',
      },
    },
    required: ['simplifiedExplanation', 'analogy', 'miniExample'],
  },
}

export async function POST(request: Request) {
  try {
    const body = (await request.json()) as SimplifyRequest

    if (!body.conceptContent || !body.conceptType) {
      return NextResponse.json(
        { error: 'Missing required fields' },
        { status: 400 }
      )
    }

    const typeLabel = {
      definition: 'Définition',
      theorem: 'Théorème',
      property: 'Propriété',
      attention: 'Point important',
    }[body.conceptType]

    const message = await anthropic.messages.create({
      model: 'claude-sonnet-4-5-20250929',
      max_tokens: 600,
      tools: [SIMPLIFY_TOOL],
      tool_choice: { type: 'tool', name: 'submit_simplification' },
      system: SYSTEM_PROMPT,
      messages: [
        {
          role: 'user',
          content: `Cours : "${body.lessonTitle}"\n\n${typeLabel} à simplifier :\n${body.conceptContent}\n\nExplique ce concept autrement, avec une analogie et un mini-exemple.`,
        },
      ],
    })

    const toolBlock = message.content.find((b) => b.type === 'tool_use')
    if (!toolBlock || toolBlock.type !== 'tool_use') {
      return NextResponse.json({ error: 'No response from AI' }, { status: 500 })
    }

    const result = toolBlock.input as SimplifyResponse
    return NextResponse.json(result)
  } catch (e) {
    console.error('Simplify error:', e)
    const errorMessage = e instanceof Error ? e.message : 'Unknown error'
    return NextResponse.json({ error: errorMessage }, { status: 500 })
  }
}
