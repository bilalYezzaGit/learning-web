/**
 * AI Summary / Revision Sheet Generator API
 *
 * Generates concise revision sheets from lesson content.
 *
 * POST /api/ai/summary
 */

import { NextResponse } from 'next/server'
import Anthropic from '@anthropic-ai/sdk'

import type { SummaryRequest } from '@/types/ai'

const anthropic = new Anthropic()

const SUMMARY_TOOL: Anthropic.Tool = {
  name: 'submit_summary',
  description: 'Soumet la fiche de révision générée',
  input_schema: {
    type: 'object' as const,
    properties: {
      summary: {
        type: 'string',
        description: 'Résumé structuré de la leçon en format texte avec LaTeX',
      },
      keyFormulas: {
        type: 'array',
        items: { type: 'string' },
        description: 'Formules clés à retenir (en LaTeX)',
      },
      keyDefinitions: {
        type: 'array',
        items: {
          type: 'object',
          properties: {
            term: { type: 'string' },
            definition: { type: 'string' },
          },
          required: ['term', 'definition'],
        },
        description: 'Définitions importantes',
      },
      mnemonics: {
        type: 'array',
        items: { type: 'string' },
        description: 'Moyens mnémotechniques pour retenir les concepts',
      },
      reviewQuestions: {
        type: 'array',
        items: { type: 'string' },
        description: 'Questions de révision pour tester la compréhension',
      },
    },
    required: ['summary', 'keyFormulas', 'keyDefinitions', 'mnemonics', 'reviewQuestions'],
  },
}

const SYSTEM_PROMPT = `Tu es un expert en création de fiches de révision pour des lycéens tunisiens en mathématiques.

Ta mission : créer une fiche de révision COMPLÈTE et CONCISE à partir du contenu d'une leçon.

La fiche doit contenir :
1. Un résumé structuré (les points essentiels organisés logiquement)
2. Les formules clés (en LaTeX)
3. Les définitions importantes
4. Des moyens mnémotechniques créatifs
5. Des questions de révision pour s'auto-évaluer

Règles :
- Utilise du LaTeX ($...$) pour toutes les formules
- Le résumé ne doit PAS dépasser 500 mots
- Maximum 10 formules clés
- Maximum 8 définitions
- 3-5 moyens mnémotechniques
- 5-8 questions de révision
- Structure claire avec des titres et sous-titres en markdown

Utilise le tool submit_summary pour retourner ta fiche.`

export async function POST(request: Request) {
  try {
    const body = (await request.json()) as SummaryRequest

    if (!body.lessonContent || !body.title) {
      return NextResponse.json(
        { error: 'lessonContent and title are required' },
        { status: 400 }
      )
    }

    const options = []
    if (body.includeFormulas !== false) options.push('formules')
    if (body.includeExamples !== false) options.push('exemples')

    const response = await anthropic.messages.create({
      model: 'claude-sonnet-4-5-20250929',
      max_tokens: 4096,
      tools: [SUMMARY_TOOL],
      tool_choice: { type: 'tool', name: 'submit_summary' },
      system: SYSTEM_PROMPT,
      messages: [
        {
          role: 'user',
          content: `Titre de la leçon : ${body.title}

Contenu de la leçon :
${body.lessonContent}

Génère une fiche de révision complète${options.length ? ` en incluant : ${options.join(', ')}` : ''}.`,
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
      summary: string
      keyFormulas: string[]
      keyDefinitions: Array<{ term: string; definition: string }>
      mnemonics: string[]
      reviewQuestions: string[]
    }

    return NextResponse.json(result)
  } catch (e) {
    console.error('AI Summary error:', e)
    const message = e instanceof Error ? e.message : 'Unknown error'
    return NextResponse.json({ error: message }, { status: 500 })
  }
}
