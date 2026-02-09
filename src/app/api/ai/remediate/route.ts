/**
 * AI QCM Remediation API
 *
 * When a student picks a WRONG answer in a QCM, this endpoint explains:
 * - Why the chosen answer is wrong (specific misconception)
 * - Why the correct answer is right
 * - What concept to review
 *
 * POST /api/ai/remediate
 */

import { NextResponse } from 'next/server'
import Anthropic from '@anthropic-ai/sdk'

const anthropic = new Anthropic()

interface RemediateRequest {
  questionText: string
  options: string[]
  chosenIndex: number
  correctIndex: number
  existingExplanation?: string
}

const REMEDIATE_TOOL: Anthropic.Tool = {
  name: 'submit_remediation',
  description: "Explique pourquoi la réponse choisie est fausse et pourquoi la bonne est correcte",
  input_schema: {
    type: 'object' as const,
    properties: {
      whyWrong: {
        type: 'string',
        description: "Explication ciblée de pourquoi la réponse choisie est fausse (max 2 phrases, en français)",
      },
      misconception: {
        type: 'string',
        description: "L'erreur de raisonnement probable de l'élève (1 phrase)",
      },
      whyCorrect: {
        type: 'string',
        description: 'Explication courte de pourquoi la bonne réponse est correcte (max 2 phrases)',
      },
      conceptToReview: {
        type: 'string',
        description: 'Le concept précis à réviser (ex: "Identité remarquable (a+b)²")',
      },
    },
    required: ['whyWrong', 'misconception', 'whyCorrect', 'conceptToReview'],
  },
}

const SYSTEM_PROMPT = `Tu es un diagnosticien pédagogique en mathématiques pour lycéens tunisiens.

Un élève vient de choisir une MAUVAISE réponse à un QCM. Tu dois :
1. Expliquer pourquoi SA réponse est fausse (ciblé sur l'option choisie)
2. Identifier l'erreur de raisonnement probable
3. Expliquer pourquoi la bonne réponse est correcte
4. Nommer le concept précis à réviser

Règles :
- Sois CONCIS (2 phrases max par champ)
- Utilise du LaTeX ($...$) pour les formules
- Sois bienveillant, pas condescendant
- Cible l'erreur SPÉCIFIQUE, pas une explication générale

Utilise le tool submit_remediation.`

export async function POST(request: Request) {
  try {
    const body = (await request.json()) as RemediateRequest

    if (body.chosenIndex === undefined || body.correctIndex === undefined) {
      return NextResponse.json(
        { error: 'chosenIndex and correctIndex are required' },
        { status: 400 }
      )
    }

    const chosenOption = body.options?.[body.chosenIndex] ?? 'Option inconnue'
    const correctOption = body.options?.[body.correctIndex] ?? 'Option inconnue'

    const response = await anthropic.messages.create({
      model: 'claude-sonnet-4-5-20250929',
      max_tokens: 512,
      tools: [REMEDIATE_TOOL],
      tool_choice: { type: 'tool', name: 'submit_remediation' },
      system: SYSTEM_PROMPT,
      messages: [
        {
          role: 'user',
          content: `Question : ${body.questionText}

L'élève a choisi : "${chosenOption}" (option ${body.chosenIndex + 1})
La bonne réponse est : "${correctOption}" (option ${body.correctIndex + 1})

${body.existingExplanation ? `Explication existante : ${body.existingExplanation}` : ''}

Analyse l'erreur spécifique de cet élève.`,
        },
      ],
    })

    const toolBlock = response.content.find((b) => b.type === 'tool_use')
    if (!toolBlock || toolBlock.type !== 'tool_use') {
      return NextResponse.json({ error: 'No structured response' }, { status: 500 })
    }

    return NextResponse.json(toolBlock.input)
  } catch (e) {
    console.error('AI Remediate error:', e)
    const message = e instanceof Error ? e.message : 'Unknown error'
    return NextResponse.json({ error: message }, { status: 500 })
  }
}
