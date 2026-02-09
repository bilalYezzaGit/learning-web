'use client'

/**
 * QCM Player Component
 *
 * Reusable interactive QCM player with keyboard shortcuts.
 * Can be used in modules, series, or standalone pages.
 *
 * Features:
 * - Keyboard shortcuts (1-4 to select, Enter to validate, Space to continue)
 * - Immediate feedback after validation
 * - Progress tracking and score
 * - Optional save callback for authenticated users
 */

import * as React from 'react'
import { ArrowRight, Check, X } from 'lucide-react'

import { Button } from '@/components/ui/button'
import { Card, CardContent } from '@/components/ui/card'
import { Progress } from '@/components/ui/progress'
import { cn } from '@/lib/utils'
import type { CompiledQuiz } from '@/types/content'

// =============================================================================
// Types
// =============================================================================

export interface QCMResult {
  qcmId: string
  score: number
  total: number
  percentage: number
  answers: number[]
  timeSeconds: number
}

export interface QCMPlayerProps {
  /** The compiled quiz data to play */
  qcm: CompiledQuiz
  /** Called when QCM is finished with results */
  onComplete?: (result: QCMResult) => void
  /** Called when user wants to exit */
  onExit?: () => void
  /** Show exit button */
  showExit?: boolean
  /** Custom class name */
  className?: string
}

type QCMState = 'answering' | 'validated' | 'finished'

// =============================================================================
// Component
// =============================================================================

export function QCMPlayer({
  qcm,
  onComplete,
  onExit,
  showExit = true,
  className,
}: QCMPlayerProps) {
  const [currentIndex, setCurrentIndex] = React.useState(0)
  const [selectedOption, setSelectedOption] = React.useState<number | null>(null)
  const [state, setState] = React.useState<QCMState>('answering')
  const [score, setScore] = React.useState(0)
  const [answers, setAnswers] = React.useState<number[]>([])
  const [startTime] = React.useState(() => Date.now())

  const currentQuestion = qcm.questions[currentIndex]
  const isLastQuestion = currentIndex === qcm.questions.length - 1
  const progressPercent = ((currentIndex + 1) / qcm.questions.length) * 100

  const handleValidate = () => {
    if (selectedOption === null || !currentQuestion) return

    const isCorrect = selectedOption === currentQuestion.correctIndex
    if (isCorrect) {
      setScore((s) => s + 1)
    }
    setAnswers((a) => [...a, selectedOption])
    setState('validated')
  }

  const handleNext = () => {
    if (isLastQuestion) {
      const timeSeconds = Math.round((Date.now() - startTime) / 1000)
      const total = qcm.questions.length
      const result: QCMResult = {
        qcmId: qcm.id,
        score: score + (selectedOption === currentQuestion?.correctIndex ? 1 : 0),
        total,
        percentage: Math.round(((score + (selectedOption === currentQuestion?.correctIndex ? 1 : 0)) / total) * 100),
        answers: [...answers, selectedOption ?? 0],
        timeSeconds,
      }
      setState('finished')
      onComplete?.(result)
    } else {
      setCurrentIndex((i) => i + 1)
      setSelectedOption(null)
      setState('answering')
    }
  }

  // Keyboard shortcuts
  React.useEffect(() => {
    const handleKeyDown = (e: KeyboardEvent) => {
      if (state === 'finished') return

      if (state === 'answering' && currentQuestion) {
        // Number keys to select option
        const num = parseInt(e.key)
        const optionCount = currentQuestion.options?.length ?? 0
        if (num >= 1 && num <= optionCount) {
          setSelectedOption(num - 1)
        }
        // Enter to validate
        if (e.key === 'Enter' && selectedOption !== null) {
          handleValidate()
        }
      } else if (state === 'validated') {
        // Space or Enter to continue
        if (e.key === ' ' || e.key === 'Enter') {
          e.preventDefault()
          handleNext()
        }
      }
    }

    window.addEventListener('keydown', handleKeyDown)
    return () => window.removeEventListener('keydown', handleKeyDown)
    // eslint-disable-next-line react-hooks/exhaustive-deps
  }, [state, selectedOption, currentIndex, currentQuestion])

  // Finished state - show score
  if (state === 'finished') {
    const finalScore = score
    const total = qcm.questions.length
    const percentage = Math.round((finalScore / total) * 100)
    const isSuccess = percentage >= 70

    return (
      <div className={cn('py-8', className)} role="status" aria-live="polite">
        <Card className="mx-auto max-w-lg">
          <CardContent className="py-8 text-center">
            <div
              className={cn(
                'mx-auto mb-4 flex h-16 w-16 items-center justify-center rounded-full',
                isSuccess ? 'bg-success/10' : 'bg-warning/10'
              )}
            >
              {isSuccess ? (
                <Check className="h-8 w-8 text-success" aria-hidden="true" />
              ) : (
                <X className="h-8 w-8 text-warning" aria-hidden="true" />
              )}
            </div>
            <h2 className="text-2xl font-bold">
              {isSuccess ? 'Bravo !' : 'Continue tes efforts !'}
            </h2>
            <p className="mt-2 tabular-nums text-4xl font-bold text-primary">
              {finalScore} / {total}
            </p>
            <p className="mt-1 tabular-nums text-muted-foreground">
              {percentage}% de bonnes réponses
            </p>
            {!isSuccess && (
              <p className="mt-2 text-sm text-muted-foreground">
                Il faut 70% pour valider ce QCM.
              </p>
            )}
          </CardContent>
        </Card>
      </div>
    )
  }

  if (!currentQuestion) return null

  // Handle different question types
  const options = currentQuestion.options ?? []

  return (
    <div className={cn('flex flex-col', className)}>
      {/* Progress Header */}
      <div className="mb-6">
        <div className="flex items-center justify-between text-sm">
          <span className="font-medium">{qcm.title}</span>
          <span className="tabular-nums text-muted-foreground">
            {currentIndex + 1}/{qcm.questions.length}
          </span>
        </div>
        <Progress value={progressPercent} className="mt-2 h-2" aria-label={`Question ${currentIndex + 1} sur ${qcm.questions.length}`} />
      </div>

      {/* Question */}
      <div className="flex-1">
        <div className="prose prose-sm dark:prose-invert max-w-none">
          {currentQuestion.enonce}
        </div>

        <div className="mt-6 space-y-3">
          {options.map((option, index) => {
            const isSelected = selectedOption === index
            const isCorrect = index === currentQuestion.correctIndex
            const showResult = state === 'validated'

            return (
              <button
                key={index}
                onClick={() => state === 'answering' && setSelectedOption(index)}
                disabled={state === 'validated'}
                className={cn(
                  'flex w-full items-center gap-3 rounded-lg border p-4 text-left transition-colors focus-visible:outline-none focus-visible:ring-2 focus-visible:ring-ring',
                  state === 'answering' && [
                    isSelected
                      ? 'border-primary bg-primary/5'
                      : 'hover:border-primary/50 hover:bg-muted/50',
                  ],
                  showResult && [
                    isCorrect && 'border-success bg-success/10',
                    isSelected && !isCorrect && 'border-destructive bg-destructive/10',
                  ]
                )}
              >
                <div
                  className={cn(
                    'flex h-8 w-8 shrink-0 items-center justify-center rounded-full border text-sm font-medium',
                    state === 'answering' && [
                      isSelected
                        ? 'border-primary bg-primary text-primary-foreground'
                        : 'border-muted-foreground/30',
                    ],
                    showResult && [
                      isCorrect && 'border-success bg-success text-white',
                      isSelected && !isCorrect && 'border-destructive bg-destructive text-white',
                    ]
                  )}
                >
                  {showResult && isCorrect ? (
                    <Check className="h-4 w-4" />
                  ) : showResult && isSelected && !isCorrect ? (
                    <X className="h-4 w-4" />
                  ) : (
                    index + 1
                  )}
                </div>
                <span className="flex-1">
                  {option}
                </span>
                <kbd className="hidden rounded border bg-muted px-2 py-0.5 text-xs text-muted-foreground sm:inline-block">
                  {index + 1}
                </kbd>
              </button>
            )
          })}
        </div>

        {/* Explanation after validation */}
        {state === 'validated' && currentQuestion.explication && (
          <div aria-live="polite" className="mt-4 rounded-lg border border-info/25 bg-info/10 p-4">
            <p className="text-sm font-medium text-info-foreground">Explication</p>
            <div className="mt-1 text-sm text-info-foreground">
              {currentQuestion.explication}
            </div>
          </div>
        )}
      </div>

      {/* Footer */}
      <div className="mt-6 flex items-center justify-between border-t pt-4">
        <p aria-live="polite" className="text-sm text-muted-foreground">
          Score: {score}/{currentIndex + (state === 'validated' ? 1 : 0)}
        </p>

        <div className="flex gap-2">
          {showExit && onExit && (
            <Button variant="ghost" onClick={onExit}>
              Quitter
            </Button>
          )}

          {state === 'answering' ? (
            <Button onClick={handleValidate} disabled={selectedOption === null}>
              Valider
              <kbd className="ml-2 hidden rounded border bg-primary-foreground/20 px-1.5 text-xs sm:inline-block">
                ↵
              </kbd>
            </Button>
          ) : (
            <Button onClick={handleNext}>
              {isLastQuestion ? 'Terminer' : 'Suivant'}
              <ArrowRight className="ml-2 h-4 w-4" aria-hidden="true" />
            </Button>
          )}
        </div>
      </div>
    </div>
  )
}
