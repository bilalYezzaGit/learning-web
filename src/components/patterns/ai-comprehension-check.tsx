'use client'

/**
 * AI Comprehension Check
 *
 * At the end of a lesson, generates 3 quick comprehension questions.
 * Students can test their understanding before moving on.
 * Purely self-assessment — not tracked in progress.
 */

import * as React from 'react'
import { BrainCircuit, Loader2, ChevronDown, ChevronUp, Lightbulb } from 'lucide-react'

import { Button } from '@/components/ui/button'
import { Card, CardContent } from '@/components/ui/card'
import { cn } from '@/lib/utils'
import {
  generateComprehensionCheck,
  AIError,
  type ComprehensionQuestion,
} from '@/lib/services/ai-service'

interface AIComprehensionCheckProps {
  lessonContent: string
  title: string
  className?: string
}

function QuestionCard({
  question,
  index,
}: {
  question: ComprehensionQuestion
  index: number
}) {
  const [showAnswer, setShowAnswer] = React.useState(false)
  const [showHint, setShowHint] = React.useState(false)

  return (
    <Card>
      <CardContent className="p-3">
        <div className="flex items-start gap-2">
          <span className="flex h-5 w-5 shrink-0 items-center justify-center rounded-full bg-primary text-[10px] font-bold text-primary-foreground">
            {index + 1}
          </span>
          <div className="flex-1">
            <p className="text-sm font-medium">{question.question}</p>

            <div className="mt-2 flex gap-2">
              {!showAnswer && (
                <button
                  onClick={() => setShowHint(!showHint)}
                  className="flex items-center gap-1 text-xs text-amber-600 hover:text-amber-700 dark:text-amber-400"
                >
                  <Lightbulb className="h-3 w-3" />
                  {showHint ? 'Masquer l\'indice' : 'Indice'}
                </button>
              )}
              <button
                onClick={() => setShowAnswer(!showAnswer)}
                className="flex items-center gap-1 text-xs text-primary hover:text-primary/80"
              >
                {showAnswer ? (
                  <ChevronUp className="h-3 w-3" />
                ) : (
                  <ChevronDown className="h-3 w-3" />
                )}
                {showAnswer ? 'Masquer' : 'Voir la réponse'}
              </button>
            </div>

            {showHint && !showAnswer && (
              <div className="mt-2 rounded bg-amber-500/10 px-2 py-1">
                <p className="text-xs text-amber-700 dark:text-amber-400">{question.hint}</p>
              </div>
            )}

            {showAnswer && (
              <div className="mt-2 rounded bg-success/10 px-2 py-1.5">
                <p className="text-xs font-medium text-success">Réponse :</p>
                <p className="mt-0.5 text-sm text-foreground/90">{question.answer}</p>
              </div>
            )}
          </div>
        </div>
      </CardContent>
    </Card>
  )
}

export function AIComprehensionCheck({ lessonContent, title, className }: AIComprehensionCheckProps) {
  const [questions, setQuestions] = React.useState<ComprehensionQuestion[]>([])
  const [isLoading, setIsLoading] = React.useState(false)
  const [error, setError] = React.useState<string | null>(null)

  const handleGenerate = async () => {
    setIsLoading(true)
    setError(null)

    try {
      const result = await generateComprehensionCheck({ lessonContent, title })
      setQuestions(result.questions)
    } catch (e) {
      setError(e instanceof AIError ? e.message : 'Erreur')
    } finally {
      setIsLoading(false)
    }
  }

  if (questions.length === 0) {
    return (
      <div className={cn('rounded-lg border border-dashed border-primary/30 bg-primary/5 p-4 text-center', className)}>
        <BrainCircuit className="mx-auto mb-2 h-6 w-6 text-primary/50" />
        <p className="text-sm font-medium">Tu as compris cette leçon ?</p>
        <p className="mt-0.5 text-xs text-muted-foreground">
          Teste-toi avec 3 questions rapides générées par l&apos;IA
        </p>
        <Button
          variant="outline"
          size="sm"
          onClick={handleGenerate}
          disabled={isLoading}
          className="mt-3 gap-1.5"
        >
          {isLoading ? (
            <Loader2 className="h-3.5 w-3.5 animate-spin" />
          ) : (
            <BrainCircuit className="h-3.5 w-3.5" />
          )}
          {isLoading ? 'Génération...' : 'Tester ma compréhension'}
        </Button>
        {error && <p className="mt-2 text-xs text-destructive">{error}</p>}
      </div>
    )
  }

  return (
    <div className={cn('space-y-3', className)}>
      <h3 className="flex items-center gap-2 text-sm font-semibold">
        <BrainCircuit className="h-4 w-4 text-primary" />
        Teste ta compréhension
      </h3>

      {questions.map((q, i) => (
        <QuestionCard key={i} question={q} index={i} />
      ))}

      <p className="text-center text-[10px] text-muted-foreground">
        Questions générées par l&apos;IA — non comptabilisées dans ta progression
      </p>
    </div>
  )
}
