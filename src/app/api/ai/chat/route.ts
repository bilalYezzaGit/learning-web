/**
 * AI Math Tutor Chat API
 *
 * Conversational math tutor that understands context.
 * Uses Claude to provide step-by-step help without giving answers directly.
 *
 * POST /api/ai/chat
 */

import { NextResponse } from 'next/server'
import Anthropic from '@anthropic-ai/sdk'

import type { ChatRequest } from '@/types/ai'

const anthropic = new Anthropic()

const SYSTEM_PROMPT = `Tu es un tuteur de mathématiques expert et bienveillant pour des lycéens tunisiens (1ère à 4ème année secondaire).

Ton rôle :
- Aider l'élève à COMPRENDRE les concepts, pas juste donner des réponses
- Utiliser la méthode socratique : poser des questions pour guider la réflexion
- Expliquer en français avec des formules LaTeX (syntaxe $...$ pour inline, $$...$$ pour display)
- Adapter ton niveau au programme tunisien
- Être encourageant et patient

Règles importantes :
- NE DONNE JAMAIS la solution complète directement, guide l'élève
- Si l'élève est bloqué, décompose en sous-étapes
- Utilise des exemples concrets quand possible
- Corrige les erreurs de raisonnement avec bienveillance
- Limite tes réponses à 300 mots maximum pour rester concis
- Utilise du LaTeX pour toutes les formules mathématiques`

export async function POST(request: Request) {
  try {
    const body = (await request.json()) as ChatRequest

    if (!body.messages || body.messages.length === 0) {
      return NextResponse.json(
        { error: 'Messages are required' },
        { status: 400 }
      )
    }

    const contextPrefix = body.context
      ? `[Contexte de la leçon/exercice actuel : ${body.context}]\n\n`
      : ''

    const topicPrefix = body.topic
      ? `[Sujet : ${body.topic}]\n\n`
      : ''

    const messages: Anthropic.MessageParam[] = body.messages.map((msg) => ({
      role: msg.role,
      content:
        msg.role === 'user' && msg === body.messages[0]
          ? `${contextPrefix}${topicPrefix}${msg.content}`
          : msg.content,
    }))

    const response = await anthropic.messages.create({
      model: 'claude-sonnet-4-5-20250929',
      max_tokens: 1024,
      system: SYSTEM_PROMPT,
      messages,
    })

    const textBlock = response.content.find((b) => b.type === 'text')
    if (!textBlock || textBlock.type !== 'text') {
      return NextResponse.json(
        { error: 'No response from AI' },
        { status: 500 }
      )
    }

    return NextResponse.json({ reply: textBlock.text })
  } catch (e) {
    console.error('AI Chat error:', e)
    const message = e instanceof Error ? e.message : 'Unknown error'
    return NextResponse.json({ error: message }, { status: 500 })
  }
}
