/**
 * AI Weakness Analyzer API
 *
 * Analyzes student progress data to identify strengths, weaknesses,
 * and generate a personalized study plan.
 *
 * POST /api/ai/analyze-weakness
 */

import { NextResponse } from 'next/server'
import Anthropic from '@anthropic-ai/sdk'

import type { WeaknessRequest } from '@/types/ai'

const anthropic = new Anthropic()

const WEAKNESS_TOOL: Anthropic.Tool = {
  name: 'submit_analysis',
  description: "Soumet l'analyse des forces et faiblesses de l'élève",
  input_schema: {
    type: 'object' as const,
    properties: {
      strengths: {
        type: 'array',
        items: { type: 'string' },
        description: "Points forts de l'élève",
      },
      weaknesses: {
        type: 'array',
        items: {
          type: 'object',
          properties: {
            topic: { type: 'string', description: 'Sujet concerné' },
            severity: {
              type: 'string',
              enum: ['faible', 'moyen', 'critique'],
              description: 'Gravité de la faiblesse',
            },
            description: { type: 'string', description: 'Description du problème' },
            suggestedActions: {
              type: 'array',
              items: { type: 'string' },
              description: 'Actions suggérées pour améliorer',
            },
          },
          required: ['topic', 'severity', 'description', 'suggestedActions'],
        },
        description: 'Points faibles identifiés',
      },
      overallAnalysis: {
        type: 'string',
        description: "Analyse globale du niveau de l'élève",
      },
      studyPlan: {
        type: 'array',
        items: { type: 'string' },
        description: "Plan d'étude recommandé (étapes ordonnées)",
      },
      encouragement: {
        type: 'string',
        description: "Message d'encouragement personnalisé",
      },
    },
    required: ['strengths', 'weaknesses', 'overallAnalysis', 'studyPlan', 'encouragement'],
  },
}

const SYSTEM_PROMPT = `Tu es un conseiller pédagogique expert pour des lycéens tunisiens en mathématiques.

On te donne les données de progression d'un élève (exercices, QCM, leçons visitées).
Tu dois analyser ses performances pour identifier :

1. Ses POINTS FORTS (sujets maîtrisés)
2. Ses FAIBLESSES (sujets à travailler) avec un niveau de gravité
3. Une analyse globale
4. Un PLAN D'ÉTUDE personnalisé
5. Un message d'ENCOURAGEMENT

Règles :
- Base ton analyse sur les scores QCM, les exercices réussis/échoués, et les tentatives
- Un score QCM < 50% = faiblesse potentielle
- Des exercices avec beaucoup de tentatives = difficulté
- Des exercices non tentés dans un module = lacune potentielle
- Sois constructif et bienveillant
- Le plan d'étude doit être concret et actionnable
- Maximum 5 faiblesses, 5 forces

Utilise le tool submit_analysis pour retourner ton analyse.`

export async function POST(request: Request) {
  try {
    const body = (await request.json()) as WeaknessRequest

    if (!body.progressData || body.progressData.length === 0) {
      return NextResponse.json(
        { error: 'progressData is required and must not be empty' },
        { status: 400 }
      )
    }

    const progressSummary = body.progressData.map((entry) => {
      let line = `- ${entry.title ?? entry.activityId} (${entry.activityType})`
      if (entry.score !== undefined && entry.total) {
        line += ` : ${entry.score}/${entry.total} (${Math.round((entry.score / entry.total) * 100)}%)`
      }
      line += ` | Statut: ${entry.status} | Tentatives: ${entry.attempts}`
      if (entry.tags?.length) {
        line += ` | Tags: ${entry.tags.join(', ')}`
      }
      return line
    }).join('\n')

    const response = await anthropic.messages.create({
      model: 'claude-sonnet-4-5-20250929',
      max_tokens: 2048,
      tools: [WEAKNESS_TOOL],
      tool_choice: { type: 'tool', name: 'submit_analysis' },
      system: SYSTEM_PROMPT,
      messages: [
        {
          role: 'user',
          content: `Parcours : ${body.parcours}

Données de progression de l'élève :
${progressSummary}

Analyse les forces et faiblesses de cet élève.`,
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

    return NextResponse.json(toolBlock.input)
  } catch (e) {
    console.error('AI Weakness analysis error:', e)
    const message = e instanceof Error ? e.message : 'Unknown error'
    return NextResponse.json({ error: message }, { status: 500 })
  }
}
