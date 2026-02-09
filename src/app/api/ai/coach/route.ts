/**
 * AI Performance Coach API Route
 *
 * Analyzes student progress data and provides personalized
 * insights, strengths, weaknesses, and recommendations.
 *
 * POST /api/ai/coach
 */

import { NextResponse } from 'next/server'
import Anthropic from '@anthropic-ai/sdk'

import type { CoachRequest, CoachResponse } from '@/types/ai'

const anthropic = new Anthropic()

const SYSTEM_PROMPT = `Tu es un coach pédagogique bienveillant spécialisé en mathématiques pour lycéens tunisiens (programme 1ère année).

On te donne les données de progression d'un élève. Tu dois analyser ses forces, faiblesses, et donner des recommandations concrètes.

Règles :
- Parler en français, ton motivant et bienveillant
- Être spécifique aux chapitres/concepts (pas de généralités vagues)
- Maximum 3 points forts, 3 axes d'amélioration, 3 recommandations
- Chaque recommandation doit avoir une action concrète et une raison
- Si peu de données, le mentionner et encourager à continuer
- L'évaluation globale fait 1-2 phrases max

Utilise le tool submit_coaching pour répondre.`

const COACH_TOOL: Anthropic.Tool = {
  name: 'submit_coaching',
  description: "Soumet l'analyse et les recommandations",
  input_schema: {
    type: 'object' as const,
    properties: {
      overallAssessment: {
        type: 'string',
        description: 'Évaluation globale (1-2 phrases)',
      },
      strengths: {
        type: 'array',
        items: { type: 'string' },
        description: 'Points forts identifiés (max 3)',
      },
      areasToImprove: {
        type: 'array',
        items: { type: 'string' },
        description: "Axes d'amélioration (max 3)",
      },
      recommendations: {
        type: 'array',
        items: {
          type: 'object',
          properties: {
            action: { type: 'string', description: 'Action concrète à faire' },
            reason: { type: 'string', description: 'Pourquoi cette action' },
            moduleSlug: { type: 'string', description: 'Slug du module suggéré (optionnel)' },
          },
          required: ['action', 'reason'],
        },
        description: 'Recommandations concrètes (max 3)',
      },
    },
    required: ['overallAssessment', 'strengths', 'areasToImprove', 'recommendations'],
  },
}

export async function POST(request: Request) {
  try {
    const body = (await request.json()) as CoachRequest

    if (!body.progressSummary) {
      return NextResponse.json(
        { error: 'Missing required fields' },
        { status: 400 }
      )
    }

    const { progressSummary, availableModules } = body

    const progressDescription = `
Données de progression de l'élève :
- Activités totales disponibles : ${progressSummary.totalActivities}
- Activités complétées : ${progressSummary.completedActivities}
- Résultats QCM : ${progressSummary.qcmResults.map(q => `${q.activityId} (${q.score}/${q.total}, tags: ${q.tags.join(', ')})`).join('; ') || 'Aucun'}
- Exercices terminés : ${progressSummary.exercisesCompleted.length} exercices
- Concepts maîtrisés (tags) : ${progressSummary.completedTags.join(', ') || 'Aucun encore'}
- Concepts à revoir (tags) : ${progressSummary.weakTags.join(', ') || 'Aucun identifié'}

Modules disponibles :
${availableModules.map(m => `- ${m.title} (${m.slug})`).join('\n')}
`

    const message = await anthropic.messages.create({
      model: 'claude-sonnet-4-5-20250929',
      max_tokens: 800,
      tools: [COACH_TOOL],
      tool_choice: { type: 'tool', name: 'submit_coaching' },
      system: SYSTEM_PROMPT,
      messages: [
        {
          role: 'user',
          content: progressDescription,
        },
      ],
    })

    const toolBlock = message.content.find((b) => b.type === 'tool_use')
    if (!toolBlock || toolBlock.type !== 'tool_use') {
      return NextResponse.json({ error: 'No response from AI' }, { status: 500 })
    }

    const result = toolBlock.input as CoachResponse
    return NextResponse.json(result)
  } catch (e) {
    console.error('Coach error:', e)
    const errorMessage = e instanceof Error ? e.message : 'Unknown error'
    return NextResponse.json({ error: errorMessage }, { status: 500 })
  }
}
