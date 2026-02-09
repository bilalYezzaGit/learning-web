/**
 * AI Progressive Hint API
 *
 * Provides increasingly detailed hints for exercises.
 * Level 1: vague direction, Level 2: method hint, Level 3: detailed guide
 *
 * POST /api/ai/hint
 */

import { NextResponse } from 'next/server'
import Anthropic from '@anthropic-ai/sdk'

import type { HintRequest } from '@/types/ai'

const anthropic = new Anthropic()

const HINT_TOOL: Anthropic.Tool = {
  name: 'submit_hint',
  description: "Fournit un indice progressif pour aider l'élève",
  input_schema: {
    type: 'object' as const,
    properties: {
      hint: {
        type: 'string',
        description: "L'indice adapté au niveau demandé",
      },
      hintLevel: {
        type: 'number',
        description: 'Le niveau actuel de l\'indice (1-3)',
      },
      hasMoreHints: {
        type: 'boolean',
        description: 'true s\'il reste des indices plus détaillés disponibles',
      },
    },
    required: ['hint', 'hintLevel', 'hasMoreHints'],
  },
}

function getSystemPrompt(level: number): string {
  const levelDescriptions: Record<number, string> = {
    1: `NIVEAU 1 - Indice VAGUE : Donne une direction générale sans révéler la méthode.
Par exemple : "Pense à la propriété fondamentale des dérivées" ou "Quel théorème relie ces deux concepts ?"
Maximum 2 phrases.`,
    2: `NIVEAU 2 - Indice MÉTHODOLOGIQUE : Indique la méthode ou le théorème à utiliser, sans donner les calculs.
Par exemple : "Utilise la formule de dérivation d'un produit : (uv)' = u'v + uv'"
Maximum 3 phrases.`,
    3: `NIVEAU 3 - Indice DÉTAILLÉ : Guide l'élève étape par étape avec les premières étapes résolues,
mais laisse-lui la fin à compléter. Utilise du LaTeX pour les formules.
Maximum 5 phrases.`,
  }

  return `Tu es un assistant de mathématiques pour lycéens tunisiens.
Tu dois fournir un INDICE pour aider l'élève à résoudre l'exercice.

${levelDescriptions[level] ?? levelDescriptions[3]}

Règles :
- NE DONNE JAMAIS la solution complète
- Adapte la difficulté de l'indice au niveau demandé
- Utilise du LaTeX ($...$) pour les formules
- Sois encourageant
- Si l'élève a fourni du travail, commente-le

Utilise le tool submit_hint pour retourner ton indice.`
}

export async function POST(request: Request) {
  try {
    const body = (await request.json()) as HintRequest

    if (!body.exerciseContent) {
      return NextResponse.json(
        { error: 'exerciseContent is required' },
        { status: 400 }
      )
    }

    const level = Math.min(Math.max(body.hintLevel || 1, 1), 3)

    const previousHintsText = body.previousHints?.length
      ? `\n\nIndices déjà donnés :\n${body.previousHints.map((h, i) => `Indice ${i + 1}: ${h}`).join('\n')}`
      : ''

    const studentWorkText = body.studentWork
      ? `\n\nTravail de l'élève : ${body.studentWork}`
      : ''

    const response = await anthropic.messages.create({
      model: 'claude-sonnet-4-5-20250929',
      max_tokens: 512,
      tools: [HINT_TOOL],
      tool_choice: { type: 'tool', name: 'submit_hint' },
      system: getSystemPrompt(level),
      messages: [
        {
          role: 'user',
          content: `Exercice :\n${body.exerciseContent}${previousHintsText}${studentWorkText}\n\nDonne-moi un indice de niveau ${level}.`,
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

    const result = toolBlock.input as { hint: string; hintLevel: number; hasMoreHints: boolean }

    return NextResponse.json({
      hint: result.hint,
      hintLevel: result.hintLevel,
      hasMoreHints: level < 3,
    })
  } catch (e) {
    console.error('AI Hint error:', e)
    const message = e instanceof Error ? e.message : 'Unknown error'
    return NextResponse.json({ error: message }, { status: 500 })
  }
}
