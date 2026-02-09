/**
 * AI Hint API Route
 *
 * Generates progressive hints for exercises.
 * Level 1: gentle nudge (which concept/method to use)
 * Level 2: method hint (outline of the approach)
 * Level 3: detailed guide (step-by-step without full answer)
 *
 * POST /api/ai/hint
 */

import { NextResponse } from 'next/server'
import Anthropic from '@anthropic-ai/sdk'

import type { HintRequest, HintResponse } from '@/types/ai'

const anthropic = new Anthropic()

const SYSTEM_PROMPT = `Tu es un tuteur de mathématiques pour lycéens tunisiens (1ère année secondaire).
Tu dois donner un INDICE à l'élève, PAS la solution.

Règles strictes :
- JAMAIS donner la réponse directe
- Utiliser le LaTeX ($..$ pour inline, $$...$$ pour block) pour les formules
- Parler en français, ton encourageant
- Adapter le niveau de détail selon le niveau d'indice demandé

Niveaux d'indice :
- Niveau 1 (coup de pouce) : Indique quel concept ou théorème utiliser, sans détailler comment
- Niveau 2 (méthode) : Explique la méthode/approche à suivre, les étapes sans les calculs
- Niveau 3 (guide détaillé) : Guide pas à pas avec début des calculs, mais laisse l'élève finir

Utilise le tool submit_hint pour répondre.`

const HINT_TOOL: Anthropic.Tool = {
  name: 'submit_hint',
  description: "Soumet l'indice pour l'élève",
  input_schema: {
    type: 'object' as const,
    properties: {
      hint: {
        type: 'string',
        description: "L'indice adapté au niveau demandé, en français avec LaTeX",
      },
      hintLevel: {
        type: 'number',
        description: 'Le niveau de l\'indice (1, 2 ou 3)',
      },
    },
    required: ['hint', 'hintLevel'],
  },
}

export async function POST(request: Request) {
  try {
    const body = (await request.json()) as HintRequest

    if (!body.exerciseContent || !body.hintLevel) {
      return NextResponse.json(
        { error: 'Missing required fields' },
        { status: 400 }
      )
    }

    const previousHintsContext = body.previousHints?.length
      ? `\n\nIndices déjà donnés (ne PAS répéter) :\n${body.previousHints.map((h, i) => `- Indice ${i + 1}: ${h}`).join('\n')}`
      : ''

    const message = await anthropic.messages.create({
      model: 'claude-sonnet-4-5-20250929',
      max_tokens: 512,
      tools: [HINT_TOOL],
      tool_choice: { type: 'tool', name: 'submit_hint' },
      system: SYSTEM_PROMPT,
      messages: [
        {
          role: 'user',
          content: `Voici l'exercice :\n\n${body.exerciseContent}\n\nDonne un indice de NIVEAU ${body.hintLevel}.${previousHintsContext}`,
        },
      ],
    })

    const toolBlock = message.content.find((b) => b.type === 'tool_use')
    if (!toolBlock || toolBlock.type !== 'tool_use') {
      return NextResponse.json({ error: 'No response from AI' }, { status: 500 })
    }

    const result = toolBlock.input as HintResponse
    return NextResponse.json(result)
  } catch (e) {
    console.error('Hint API error:', e)
    const errorMessage = e instanceof Error ? e.message : 'Unknown error'
    return NextResponse.json({ error: errorMessage }, { status: 500 })
  }
}
