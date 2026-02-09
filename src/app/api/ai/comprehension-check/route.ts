/**
 * AI Lesson Comprehension Check API
 *
 * Generates 2-3 quick comprehension questions at the end of a lesson.
 * Questions are designed to verify understanding, not to trick.
 *
 * POST /api/ai/comprehension-check
 */

import { NextResponse } from 'next/server'
import Anthropic from '@anthropic-ai/sdk'

const anthropic = new Anthropic()

interface ComprehensionCheckRequest {
  lessonContent: string
  title: string
}

const CHECK_TOOL: Anthropic.Tool = {
  name: 'submit_questions',
  description: 'Soumet les questions de compréhension',
  input_schema: {
    type: 'object' as const,
    properties: {
      questions: {
        type: 'array',
        items: {
          type: 'object',
          properties: {
            question: {
              type: 'string',
              description: 'La question de compréhension',
            },
            answer: {
              type: 'string',
              description: 'La réponse attendue (courte)',
            },
            hint: {
              type: 'string',
              description: 'Un petit indice si l\'élève bloque',
            },
          },
          required: ['question', 'answer', 'hint'],
        },
      },
    },
    required: ['questions'],
  },
}

const SYSTEM_PROMPT = `Tu es un professeur de mathématiques pour lycéens tunisiens.

Tu dois créer 3 questions RAPIDES de compréhension pour vérifier qu'un élève a bien compris une leçon.

Règles :
- Questions COURTES et DIRECTES (pas de calculs longs)
- Tester la COMPRÉHENSION, pas la mémoire
- Mélanger : 1 question conceptuelle, 1 question "vrai/faux avec justification", 1 application rapide
- Réponses en 1-2 phrases max
- Utilise du LaTeX ($...$) pour les formules
- Questions en français

Utilise le tool submit_questions.`

export async function POST(request: Request) {
  try {
    const body = (await request.json()) as ComprehensionCheckRequest

    if (!body.lessonContent || !body.title) {
      return NextResponse.json(
        { error: 'lessonContent and title are required' },
        { status: 400 }
      )
    }

    const response = await anthropic.messages.create({
      model: 'claude-sonnet-4-5-20250929',
      max_tokens: 1024,
      tools: [CHECK_TOOL],
      tool_choice: { type: 'tool', name: 'submit_questions' },
      system: SYSTEM_PROMPT,
      messages: [
        {
          role: 'user',
          content: `Leçon : ${body.title}\n\nContenu :\n${body.lessonContent}\n\nGénère 3 questions de compréhension rapides.`,
        },
      ],
    })

    const toolBlock = response.content.find((b) => b.type === 'tool_use')
    if (!toolBlock || toolBlock.type !== 'tool_use') {
      return NextResponse.json({ error: 'No structured response' }, { status: 500 })
    }

    return NextResponse.json(toolBlock.input)
  } catch (e) {
    console.error('AI Comprehension check error:', e)
    const message = e instanceof Error ? e.message : 'Unknown error'
    return NextResponse.json({ error: message }, { status: 500 })
  }
}
