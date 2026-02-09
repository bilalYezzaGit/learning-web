/**
 * QCM Wrong Answer Explainer API Route
 *
 * When a student picks a wrong answer in a QCM, this gives a detailed
 * explanation of WHY their answer is wrong and WHY the correct one is right.
 *
 * POST /api/ai/qcm-explain
 */

import { NextResponse } from 'next/server'
import Anthropic from '@anthropic-ai/sdk'

import type { QcmExplainRequest, QcmExplainResponse } from '@/types/ai'

const anthropic = new Anthropic()

const SYSTEM_PROMPT = `Tu es un professeur de mathématiques bienveillant pour lycéens tunisiens.
Un élève vient de se tromper sur une question QCM. Tu dois l'aider à comprendre son erreur.

Règles :
- Utiliser le LaTeX ($..$ inline, $$...$$ block)
- Parler en français, ton encourageant et pédagogique
- Expliquer POURQUOI sa réponse est fausse (l'erreur de raisonnement)
- Expliquer POURQUOI la bonne réponse est correcte
- Identifier le concept clé à revoir
- Être concis mais clair

Utilise le tool submit_explanation pour répondre.`

const EXPLAIN_TOOL: Anthropic.Tool = {
  name: 'submit_explanation',
  description: "Soumet l'explication de l'erreur QCM",
  input_schema: {
    type: 'object' as const,
    properties: {
      whyWrong: {
        type: 'string',
        description: "Explication de pourquoi la réponse de l'élève est fausse",
      },
      whyCorrect: {
        type: 'string',
        description: 'Explication de pourquoi la bonne réponse est correcte',
      },
      conceptToReview: {
        type: 'string',
        description: 'Le concept clé à revoir (court, 1-2 phrases)',
      },
    },
    required: ['whyWrong', 'whyCorrect', 'conceptToReview'],
  },
}

export async function POST(request: Request) {
  try {
    const body = (await request.json()) as QcmExplainRequest

    if (body.selectedOptionIndex === undefined || body.correctOptionIndex === undefined) {
      return NextResponse.json(
        { error: 'Missing required fields' },
        { status: 400 }
      )
    }

    const optionsText = body.options
      .map((opt, i) => {
        const marker = i === body.correctOptionIndex
          ? '(CORRECTE)'
          : i === body.selectedOptionIndex
            ? '(CHOISIE PAR L\'ÉLÈVE)'
            : ''
        return `  ${i + 1}. ${opt} ${marker}`
      })
      .join('\n')

    const existingContext = body.existingExplanation
      ? `\n\nExplication existante du QCM : ${body.existingExplanation}`
      : ''

    const message = await anthropic.messages.create({
      model: 'claude-sonnet-4-5-20250929',
      max_tokens: 600,
      tools: [EXPLAIN_TOOL],
      tool_choice: { type: 'tool', name: 'submit_explanation' },
      system: SYSTEM_PROMPT,
      messages: [
        {
          role: 'user',
          content: `Question :\n${body.questionText}\n\nOptions :\n${optionsText}${existingContext}\n\nExplique à l'élève pourquoi sa réponse (option ${body.selectedOptionIndex + 1}) est fausse et pourquoi l'option ${body.correctOptionIndex + 1} est la bonne.`,
        },
      ],
    })

    const toolBlock = message.content.find((b) => b.type === 'tool_use')
    if (!toolBlock || toolBlock.type !== 'tool_use') {
      return NextResponse.json({ error: 'No response from AI' }, { status: 500 })
    }

    const result = toolBlock.input as QcmExplainResponse
    return NextResponse.json(result)
  } catch (e) {
    console.error('QCM explain error:', e)
    const errorMessage = e instanceof Error ? e.message : 'Unknown error'
    return NextResponse.json({ error: errorMessage }, { status: 500 })
  }
}
