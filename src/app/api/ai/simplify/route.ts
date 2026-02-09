/**
 * AI Concept Simplifier API
 *
 * Simplifies complex math concepts with analogies and real-world examples.
 *
 * POST /api/ai/simplify
 */

import { NextResponse } from 'next/server'
import Anthropic from '@anthropic-ai/sdk'

import type { SimplifyRequest } from '@/types/ai'

const anthropic = new Anthropic()

const SIMPLIFY_TOOL: Anthropic.Tool = {
  name: 'submit_simplification',
  description: 'Soumet la simplification du concept mathématique',
  input_schema: {
    type: 'object' as const,
    properties: {
      simpleExplanation: {
        type: 'string',
        description: 'Explication simplifiée du concept (max 150 mots)',
      },
      analogy: {
        type: 'string',
        description: 'Analogie de la vie courante pour comprendre le concept',
      },
      realWorldExample: {
        type: 'string',
        description: 'Exemple concret du monde réel utilisant ce concept',
      },
      visualDescription: {
        type: 'string',
        description: 'Description visuelle ou géométrique du concept',
      },
      keyPoints: {
        type: 'array',
        items: { type: 'string' },
        description: 'Points clés à retenir (max 5)',
      },
    },
    required: ['simpleExplanation', 'analogy', 'realWorldExample', 'visualDescription', 'keyPoints'],
  },
}

const SYSTEM_PROMPT = `Tu es un vulgarisateur de mathématiques expert pour des lycéens tunisiens.

Ta mission : rendre les concepts mathématiques ACCESSIBLES et INTUITIFS.

Pour chaque concept, tu dois fournir :
1. Une explication simple (comme si tu parlais à un ami)
2. Une analogie de la vie quotidienne
3. Un exemple concret du monde réel
4. Une description visuelle ou géométrique
5. Les points clés à retenir

Règles :
- Pas de jargon inutile
- Utilise du LaTeX ($...$) uniquement quand nécessaire
- Les analogies doivent être adaptées à la culture tunisienne quand possible
- Sois créatif et mémorable
- Maximum 150 mots par section

Utilise le tool submit_simplification pour retourner ta simplification.`

export async function POST(request: Request) {
  try {
    const body = (await request.json()) as SimplifyRequest

    if (!body.concept) {
      return NextResponse.json(
        { error: 'concept is required' },
        { status: 400 }
      )
    }

    const lessonContext = body.lessonContent
      ? `\n\nContenu de la leçon :\n${body.lessonContent}`
      : ''

    const response = await anthropic.messages.create({
      model: 'claude-sonnet-4-5-20250929',
      max_tokens: 2048,
      tools: [SIMPLIFY_TOOL],
      tool_choice: { type: 'tool', name: 'submit_simplification' },
      system: SYSTEM_PROMPT,
      messages: [
        {
          role: 'user',
          content: `Concept à simplifier : ${body.concept}${lessonContext}\n\nExplique ce concept de manière simple et intuitive.`,
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
      simpleExplanation: string
      analogy: string
      realWorldExample: string
      visualDescription: string
      keyPoints: string[]
    }

    return NextResponse.json(result)
  } catch (e) {
    console.error('AI Simplify error:', e)
    const message = e instanceof Error ? e.message : 'Unknown error'
    return NextResponse.json({ error: message }, { status: 500 })
  }
}
