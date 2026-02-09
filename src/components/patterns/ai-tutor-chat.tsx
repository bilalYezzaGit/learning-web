'use client'

/**
 * AI Math Tutor Chat
 *
 * Conversational interface for students to ask math questions.
 * Contextual: aware of the current lesson/exercise topic.
 * Uses the Socratic method — guides rather than gives answers.
 */

import * as React from 'react'
import { Bot, Send, Loader2, X, Sparkles, Trash2 } from 'lucide-react'

import { Button } from '@/components/ui/button'
import { Card, CardContent, CardHeader } from '@/components/ui/card'
import { ScrollArea } from '@/components/ui/scroll-area'
import { cn } from '@/lib/utils'
import { chatWithTutor, AIError } from '@/lib/services/ai-service'
import { trackAIChatMessage } from '@/lib/services/analytics-service'
import type { ChatMessage } from '@/types/ai'

interface AITutorChatProps {
  context?: string
  topic?: string
  className?: string
  onClose?: () => void
}

export function AITutorChat({ context, topic, className, onClose }: AITutorChatProps) {
  const [messages, setMessages] = React.useState<ChatMessage[]>([])
  const [input, setInput] = React.useState('')
  const [isLoading, setIsLoading] = React.useState(false)
  const [error, setError] = React.useState<string | null>(null)
  const scrollRef = React.useRef<HTMLDivElement>(null)
  const inputRef = React.useRef<HTMLTextAreaElement>(null)

  const scrollToBottom = React.useCallback(() => {
    if (scrollRef.current) {
      scrollRef.current.scrollTop = scrollRef.current.scrollHeight
    }
  }, [])

  React.useEffect(() => {
    scrollToBottom()
  }, [messages, scrollToBottom])

  const handleSend = async () => {
    const trimmed = input.trim()
    if (!trimmed || isLoading) return

    const userMessage: ChatMessage = {
      role: 'user',
      content: trimmed,
      timestamp: Date.now(),
    }

    const updatedMessages = [...messages, userMessage]
    setMessages(updatedMessages)
    setInput('')
    setError(null)
    setIsLoading(true)

    try {
      trackAIChatMessage(topic)
      const response = await chatWithTutor({
        messages: updatedMessages,
        context,
        topic,
      })

      const assistantMessage: ChatMessage = {
        role: 'assistant',
        content: response.reply,
        timestamp: Date.now(),
      }
      setMessages((prev) => [...prev, assistantMessage])
    } catch (e) {
      const msg = e instanceof AIError ? e.message : 'Erreur de connexion'
      setError(msg)
    } finally {
      setIsLoading(false)
      inputRef.current?.focus()
    }
  }

  const handleKeyDown = (e: React.KeyboardEvent<HTMLTextAreaElement>) => {
    if (e.key === 'Enter' && !e.shiftKey) {
      e.preventDefault()
      handleSend()
    }
  }

  const handleClear = () => {
    setMessages([])
    setError(null)
  }

  const suggestedQuestions = React.useMemo(() => {
    if (messages.length > 0) return []
    return [
      'Peux-tu m\'expliquer ce concept simplement ?',
      'Je ne comprends pas cette formule, aide-moi',
      'Donne-moi un exemple concret',
      'Comment résoudre ce type d\'exercice ?',
    ]
  }, [messages.length])

  return (
    <Card className={cn('flex flex-col', className)}>
      <CardHeader className="flex flex-row items-center gap-2 border-b px-4 py-3">
        <div className="flex h-8 w-8 items-center justify-center rounded-full bg-primary/10">
          <Bot className="h-4 w-4 text-primary" />
        </div>
        <div className="flex-1">
          <h3 className="text-sm font-semibold">Tuteur IA</h3>
          {topic && (
            <p className="text-xs text-muted-foreground">{topic}</p>
          )}
        </div>
        <div className="flex gap-1">
          {messages.length > 0 && (
            <Button variant="ghost" size="icon" className="h-7 w-7" onClick={handleClear}>
              <Trash2 className="h-3.5 w-3.5" />
              <span className="sr-only">Effacer la conversation</span>
            </Button>
          )}
          {onClose && (
            <Button variant="ghost" size="icon" className="h-7 w-7" onClick={onClose}>
              <X className="h-3.5 w-3.5" />
              <span className="sr-only">Fermer</span>
            </Button>
          )}
        </div>
      </CardHeader>

      <CardContent className="flex flex-1 flex-col p-0">
        {/* Messages */}
        <ScrollArea className="flex-1 p-4" ref={scrollRef}>
          <div className="space-y-4">
            {messages.length === 0 && (
              <div className="py-6 text-center">
                <Sparkles className="mx-auto mb-3 h-10 w-10 text-primary/30" />
                <p className="text-sm font-medium">Pose-moi une question !</p>
                <p className="mt-1 text-xs text-muted-foreground">
                  Je suis ton tuteur de maths personnel.
                  {topic ? ` On travaille sur : ${topic}` : ''}
                </p>
              </div>
            )}

            {messages.map((msg, i) => (
              <div
                key={i}
                className={cn(
                  'flex gap-2',
                  msg.role === 'user' ? 'flex-row-reverse' : 'flex-row'
                )}
              >
                <div
                  className={cn(
                    'flex h-7 w-7 shrink-0 items-center justify-center rounded-full',
                    msg.role === 'user'
                      ? 'bg-primary text-primary-foreground'
                      : 'bg-muted'
                  )}
                >
                  {msg.role === 'user' ? (
                    <span className="text-xs font-bold">T</span>
                  ) : (
                    <Bot className="h-3.5 w-3.5" />
                  )}
                </div>
                <div
                  className={cn(
                    'max-w-[85%] rounded-2xl px-3 py-2 text-sm',
                    msg.role === 'user'
                      ? 'bg-primary text-primary-foreground'
                      : 'bg-muted'
                  )}
                >
                  <div className="whitespace-pre-wrap">{msg.content}</div>
                </div>
              </div>
            ))}

            {isLoading && (
              <div className="flex gap-2">
                <div className="flex h-7 w-7 shrink-0 items-center justify-center rounded-full bg-muted">
                  <Bot className="h-3.5 w-3.5" />
                </div>
                <div className="rounded-2xl bg-muted px-3 py-2">
                  <Loader2 className="h-4 w-4 animate-spin" />
                </div>
              </div>
            )}

            {error && (
              <div className="rounded-lg bg-destructive/10 px-3 py-2 text-sm text-destructive">
                {error}
              </div>
            )}
          </div>
        </ScrollArea>

        {/* Suggested questions */}
        {suggestedQuestions.length > 0 && (
          <div className="flex flex-wrap gap-1.5 border-t px-4 py-2">
            {suggestedQuestions.map((q, i) => (
              <button
                key={i}
                className="rounded-full border bg-background px-3 py-1 text-xs text-muted-foreground transition-colors hover:bg-muted hover:text-foreground"
                onClick={() => {
                  setInput(q)
                  inputRef.current?.focus()
                }}
              >
                {q}
              </button>
            ))}
          </div>
        )}

        {/* Input */}
        <div className="border-t p-3">
          <div className="flex gap-2">
            <textarea
              ref={inputRef}
              value={input}
              onChange={(e) => setInput(e.target.value)}
              onKeyDown={handleKeyDown}
              placeholder="Pose ta question..."
              className="flex-1 resize-none rounded-lg border bg-background px-3 py-2 text-sm placeholder:text-muted-foreground focus:outline-none focus:ring-2 focus:ring-primary/50"
              rows={1}
              disabled={isLoading}
            />
            <Button
              size="icon"
              onClick={handleSend}
              disabled={!input.trim() || isLoading}
            >
              <Send className="h-4 w-4" />
              <span className="sr-only">Envoyer</span>
            </Button>
          </div>
        </div>
      </CardContent>
    </Card>
  )
}
