'use client'

/**
 * QCM Session Player — timed QCM with random questions.
 *
 * Features:
 * - Countdown timer
 * - Question-by-question flow
 * - Score summary at the end
 * - Keyboard shortcuts (1-4, Enter, Space)
 * - Rendered HTML with KaTeX math
 */

import * as React from 'react'
import Link from 'next/link'
import { ArrowLeft, ArrowRight, Check, Clock, Trophy, X } from 'lucide-react'

import { Button } from '@/components/ui/button'
import { Card, CardContent } from '@/components/ui/card'
import { Progress } from '@/components/ui/progress'
import { cn } from '@/lib/utils'

// ── Types ──────────────────────────────────────────────────────────────────

interface Question {
  id: string
  title: string
  questionHtml: string
  optionHtmls: string[]
  correctIndex: number
  explanationHtml?: string
}

interface QcmSessionPlayerProps {
  moduleTitle: string
  questions: Question[]
  timeLimitMinutes: number
  restartHref: string
  exitHref: string
  exitLabel: string
}

type SessionState = 'playing' | 'validated' | 'finished' | 'timeout'

// ── Component ──────────────────────────────────────────────────────────────

export function QcmSessionPlayer({
  moduleTitle,
  questions,
  timeLimitMinutes,
  restartHref,
  exitHref,
  exitLabel,
}: QcmSessionPlayerProps) {
  const [currentIndex, setCurrentIndex] = React.useState(0)
  const [selectedOption, setSelectedOption] = React.useState<number | null>(null)
  const [state, setState] = React.useState<SessionState>('playing')
  const [score, setScore] = React.useState(0)
  const [timeLeft, setTimeLeft] = React.useState(timeLimitMinutes * 60)
  const startTimeRef = React.useRef(0)

  // Initialize start time on mount
  React.useEffect(() => {
    startTimeRef.current = Date.now()
  }, [])

  const currentQuestion = questions[currentIndex]
  const isLastQuestion = currentIndex === questions.length - 1
  const progressPercent = ((currentIndex + (state === 'validated' ? 1 : 0)) / questions.length) * 100

  // Timer countdown
  React.useEffect(() => {
    if (state === 'finished' || state === 'timeout' || timeLimitMinutes === 0) return

    const interval = setInterval(() => {
      const elapsed = Math.floor((Date.now() - startTimeRef.current) / 1000)
      const remaining = timeLimitMinutes * 60 - elapsed

      if (remaining <= 0) {
        setState('timeout')
        setTimeLeft(0)
        clearInterval(interval)
      } else {
        setTimeLeft(remaining)
      }
    }, 1000)

    return () => clearInterval(interval)
  }, [state, timeLimitMinutes])

  const handleValidate = React.useCallback(() => {
    if (selectedOption === null || !currentQuestion) return

    const isCorrect = selectedOption === currentQuestion.correctIndex
    if (isCorrect) setScore((s) => s + 1)
    setState('validated')
  }, [selectedOption, currentQuestion])

  const handleNext = React.useCallback(() => {
    if (isLastQuestion) {
      setState('finished')
    } else {
      setCurrentIndex((i) => i + 1)
      setSelectedOption(null)
      setState('playing')
    }
  }, [isLastQuestion])

  // Keyboard shortcuts
  React.useEffect(() => {
    const handleKeyDown = (e: KeyboardEvent) => {
      if (state === 'finished' || state === 'timeout') return

      if (state === 'playing' && currentQuestion) {
        const num = parseInt(e.key)
        if (num >= 1 && num <= currentQuestion.optionHtmls.length) {
          setSelectedOption(num - 1)
        }
        if (e.key === 'Enter' && selectedOption !== null) {
          handleValidate()
        }
      } else if (state === 'validated') {
        if (e.key === ' ' || e.key === 'Enter') {
          e.preventDefault()
          handleNext()
        }
      }
    }

    window.addEventListener('keydown', handleKeyDown)
    return () => window.removeEventListener('keydown', handleKeyDown)
  }, [state, selectedOption, currentQuestion, handleValidate, handleNext])

  // Format time as MM:SS
  const formatTime = (seconds: number) => {
    const m = Math.floor(seconds / 60)
    const s = seconds % 60
    return `${m}:${s.toString().padStart(2, '0')}`
  }

  // Timeout screen
  if (state === 'timeout') {
    const answeredCount = currentIndex + (selectedOption !== null ? 1 : 0)
    return (
      <ResultScreen
        score={score}
        total={answeredCount}
        restartHref={restartHref}
        exitHref={exitHref}
        exitLabel={exitLabel}
        title="Temps ecoule !"
        subtitle={`Tu as repondu a ${answeredCount} question${answeredCount > 1 ? 's' : ''} sur ${questions.length}`}
      />
    )
  }

  // Finished screen
  if (state === 'finished') {
    return (
      <ResultScreen
        score={score}
        total={questions.length}
        restartHref={restartHref}
        exitHref={exitHref}
        exitLabel={exitLabel}
        title={score / questions.length >= 0.7 ? 'Bravo !' : 'Continue tes efforts !'}
      />
    )
  }

  if (!currentQuestion) return null

  return (
    <div className="flex flex-col">
      {/* Header: timer + progress */}
      <div className="mb-4">
        <div className="flex items-center justify-between text-sm">
          <span className="font-medium">{moduleTitle}</span>
          <div className="flex items-center gap-1.5">
            <Clock className={cn('h-4 w-4', timeLeft < 60 ? 'text-destructive' : 'text-muted-foreground')} aria-hidden="true" />
            <span className={cn('tabular-nums font-mono text-sm', timeLeft < 60 && 'font-bold text-destructive')}>
              {formatTime(timeLeft)}
            </span>
          </div>
        </div>
        <div className="mt-2 flex items-center gap-2">
          <Progress value={progressPercent} className="h-2 flex-1" aria-label={`Question ${currentIndex + 1} sur ${questions.length}`} />
          <span className="tabular-nums text-xs text-muted-foreground">
            {currentIndex + 1}/{questions.length}
          </span>
        </div>
      </div>

      {/* Question */}
      <Card>
        <CardContent className="py-5">
          <div
            className="prose prose-stone max-w-none text-sm"
            dangerouslySetInnerHTML={{ __html: currentQuestion.questionHtml }}
          />
        </CardContent>
      </Card>

      {/* Options */}
      <div className="mt-4 space-y-2">
        {currentQuestion.optionHtmls.map((optionHtml, index) => {
          const isSelected = selectedOption === index
          const isCorrect = index === currentQuestion.correctIndex
          const showResult = state === 'validated'

          return (
            <button
              key={index}
              onClick={() => state === 'playing' && setSelectedOption(index)}
              disabled={state === 'validated'}
              className={cn(
                'flex w-full items-center gap-3 rounded-lg border p-3.5 text-left text-sm transition-colors focus-visible:outline-none focus-visible:ring-2 focus-visible:ring-ring',
                state === 'playing' && [
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
                  'flex h-7 w-7 shrink-0 items-center justify-center rounded-full border text-xs font-medium',
                  state === 'playing' && [
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
                  <Check className="h-3.5 w-3.5" />
                ) : showResult && isSelected && !isCorrect ? (
                  <X className="h-3.5 w-3.5" />
                ) : (
                  index + 1
                )}
              </div>
              <span
                className="prose prose-stone flex-1 text-sm [&_p]:m-0"
                dangerouslySetInnerHTML={{ __html: optionHtml }}
              />
            </button>
          )
        })}
      </div>

      {/* Explanation */}
      {state === 'validated' && currentQuestion.explanationHtml && (
        <div aria-live="polite" className="mt-4 rounded-lg border border-blue-200 bg-blue-50 p-3">
          <p className="text-xs font-medium text-blue-600">Explication</p>
          <div
            className="prose prose-stone mt-1 max-w-none text-sm text-blue-900 [&_p]:m-0"
            dangerouslySetInnerHTML={{ __html: currentQuestion.explanationHtml }}
          />
        </div>
      )}

      {/* Footer */}
      <div className="mt-5 flex items-center justify-between">
        <p aria-live="polite" className="text-sm text-muted-foreground">
          Score: {score}/{currentIndex + (state === 'validated' ? 1 : 0)}
        </p>

        {state === 'playing' ? (
          <Button onClick={handleValidate} disabled={selectedOption === null}>
            Valider
          </Button>
        ) : (
          <Button onClick={handleNext}>
            {isLastQuestion ? 'Terminer' : 'Suivant'}
            <ArrowRight className="ml-2 h-4 w-4" aria-hidden="true" />
          </Button>
        )}
      </div>
    </div>
  )
}

// ── Result Screen ──────────────────────────────────────────────────────────

function ResultScreen({
  score,
  total,
  restartHref,
  exitHref,
  exitLabel,
  title,
  subtitle,
}: {
  score: number
  total: number
  restartHref: string
  exitHref: string
  exitLabel: string
  title: string
  subtitle?: string
}) {
  const percentage = total > 0 ? Math.round((score / total) * 100) : 0
  const isSuccess = percentage >= 70

  return (
    <div className="py-8" role="status" aria-live="polite">
      <Card className="mx-auto max-w-sm">
        <CardContent className="py-8 text-center">
          <div
            className={cn(
              'mx-auto mb-4 flex h-16 w-16 items-center justify-center rounded-full',
              isSuccess ? 'bg-success/10' : 'bg-warning/10'
            )}
          >
            {isSuccess ? (
              <Trophy className="h-8 w-8 text-success" aria-hidden="true" />
            ) : (
              <X className="h-8 w-8 text-warning" aria-hidden="true" />
            )}
          </div>
          <h2 className="text-xl font-bold">{title}</h2>
          {subtitle && (
            <p className="mt-1 text-sm text-muted-foreground">{subtitle}</p>
          )}
          <p className="mt-3 tabular-nums text-4xl font-bold text-primary">
            {score} / {total}
          </p>
          <p className="mt-1 tabular-nums text-muted-foreground">
            {percentage}% de bonnes reponses
          </p>

          <div className="mt-6 flex flex-col gap-2">
            <Button asChild>
              <Link href={restartHref}>
                Recommencer
              </Link>
            </Button>
            <Button variant="outline" asChild>
              <Link href={exitHref}>
                <ArrowLeft className="mr-2 h-4 w-4" aria-hidden="true" />
                {exitLabel}
              </Link>
            </Button>
          </div>
        </CardContent>
      </Card>
    </div>
  )
}
