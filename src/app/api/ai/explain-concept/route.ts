/**
 * AI Inline Concept Help API
 *
 * When a student clicks "?" on a Definition/Theorem/Property,
 * generates a targeted, simple explanation of THAT specific concept.
 *
 * POST /api/ai/explain-concept
 */

import { NextResponse } from 'next/server'
import Anthropic from '@anthropic-ai/sdk'

const anthropic = new Anthropic()

interface ExplainConceptRequest {
  conceptType: 'definition' | 'theorem' | 'property'
  conceptTitle: string
  conceptContent: string
}

const CONCEPT_TOOL: Anthropic.Tool = {
  name: 'submit_explanation',
  description: 'Soumet l\'explication simplifiée du concept',
  input_schema: {
    type: 'object' as const,
    properties: {
      simpleVersion: {
        type: 'string',
        description: 'Reformulation simple du concept (comme si tu expliquais à un ami, max 3 phrases)',
      },
      intuition: {
        type: 'string',
        description: 'L\'intuition derrière ce concept (pourquoi c\'est vrai/utile, 1-2 phrases)',
      },
      quickExample: {
        type: 'string',
        description: 'Un micro-exemple numérique rapide pour illustrer (1-2 lignes)',
      },
    },
    required: ['simpleVersion', 'intuition', 'quickExample'],
  },
}

const SYSTEM_PROMPT = `Tu es un tuteur de maths pour lycéens tunisiens. Un élève ne comprend pas un concept dans sa leçon.

Tu dois fournir une explication EN 3 PARTIES ULTRA-COURTES :
1. Reformulation simple (comme à un ami, PAS du jargon)
2. L'intuition (pourquoi ça marche / à quoi ça sert)
3. Un micro-exemple numérique concret

Règles :
- MAXIMUM 3 phrases par partie
- Utilise du LaTeX ($...$) pour les formules
- Pas de répétition du contenu original
- Sois concret, pas abstrait

Utilise le tool submit_explanation.`

export async function POST(request: Request) {
  try {
    const body = (await request.json()) as ExplainConceptRequest

    if (!body.conceptContent) {
      return NextResponse.json(
        { error: 'conceptContent is required' },
        { status: 400 }
      )
    }

    const typeLabel = {
      definition: 'Définition',
      theorem: 'Théorème',
      property: 'Propriété',
    }[body.conceptType] ?? 'Concept'

    const response = await anthropic.messages.create({
      model: 'claude-sonnet-4-5-20250929',
      max_tokens: 512,
      tools: [CONCEPT_TOOL],
      tool_choice: { type: 'tool', name: 'submit_explanation' },
      system: SYSTEM_PROMPT,
      messages: [
        {
          role: 'user',
          content: `${typeLabel} : ${body.conceptTitle ?? 'Sans titre'}\n\nContenu :\n${body.conceptContent}\n\nExplique-moi ça simplement.`,
        },
      ],
    })

    const toolBlock = response.content.find((b) => b.type === 'tool_use')
    if (!toolBlock || toolBlock.type !== 'tool_use') {
      return NextResponse.json({ error: 'No structured response' }, { status: 500 })
    }

    return NextResponse.json(toolBlock.input)
  } catch (e) {
    console.error('AI Explain concept error:', e)
    const message = e instanceof Error ? e.message : 'Unknown error'
    return NextResponse.json({ error: message }, { status: 500 })
  }
}
