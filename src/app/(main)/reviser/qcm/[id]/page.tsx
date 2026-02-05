'use client'

/**
 * QCM Player Page
 *
 * Interactive QCM with keyboard shortcuts.
 * Public - playable without auth, score not saved for guests.
 *
 * Keyboard shortcuts:
 * - 1, 2, 3, 4: Select option
 * - Enter: Validate answer
 * - Space: Next question (after validation)
 */

import * as React from 'react'
import Link from 'next/link'
import { useRouter } from 'next/navigation'
import { ArrowRight, Check, ChevronLeft, X } from 'lucide-react'

import { Button } from '@/components/ui/button'
import { Card, CardContent } from '@/components/ui/card'
import { Progress } from '@/components/ui/progress'
import { cn } from '@/lib/utils'

// Mock QCM data
const mockQCM = {
  id: 'qcm-fonctions-1',
  title: 'QCM - Les fonctions',
  questions: [
    {
      id: 'q1',
      text: 'Quelle est la dérivée de f(x) = x² ?',
      options: ["f'(x) = x", "f'(x) = 2x", "f'(x) = 2", "f'(x) = x²"],
      correctIndex: 1,
    },
    {
      id: 'q2',
      text: 'Si f(x) = 3x + 2, quelle est f(1) ?',
      options: ['3', '4', '5', '6'],
      correctIndex: 2,
    },
    {
      id: 'q3',
      text: 'Une fonction est croissante sur un intervalle si :',
      options: [
        "Sa dérivée est négative",
        "Sa dérivée est positive",
        "Sa dérivée est nulle",
        "Sa dérivée n'existe pas",
      ],
      correctIndex: 1,
    },
  ],
}

type QCMState = 'answering' | 'validated' | 'finished'

export default function QCMPlayerPage() {
  const router = useRouter()
  const [currentIndex, setCurrentIndex] = React.useState(0)
  const [selectedOption, setSelectedOption] = React.useState<number | null>(null)
  const [state, setState] = React.useState<QCMState>('answering')
  const [score, setScore] = React.useState(0)
  const [answers, setAnswers] = React.useState<number[]>([])

  const qcm = mockQCM
  const currentQuestion = qcm.questions[currentIndex]
  const isLastQuestion = currentIndex === qcm.questions.length - 1
  const progress = ((currentIndex + 1) / qcm.questions.length) * 100

  // Keyboard shortcuts
  React.useEffect(() => {
    const handleKeyDown = (e: KeyboardEvent) => {
      if (state === 'answering') {
        // Number keys to select option
        const num = parseInt(e.key)
        if (num >= 1 && num <= 4 && currentQuestion) {
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
  }, [state, selectedOption, currentIndex])

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
      setState('finished')
    } else {
      setCurrentIndex((i) => i + 1)
      setSelectedOption(null)
      setState('answering')
    }
  }

  if (state === 'finished') {
    return (
      <div className="mx-auto max-w-lg px-4 lg:px-6 py-12">
        <Card>
          <CardContent className="py-8 text-center">
            <div className="mx-auto mb-4 flex h-16 w-16 items-center justify-center rounded-full bg-primary/10">
              <Check className="h-8 w-8 text-primary" />
            </div>
            <h1 className="text-2xl font-bold">QCM terminé !</h1>
            <p className="mt-2 text-4xl font-bold text-primary">
              {score} / {qcm.questions.length}
            </p>
            <p className="mt-1 text-muted-foreground">
              {Math.round((score / qcm.questions.length) * 100)}% de bonnes réponses
            </p>

            {/* Call to action for guests */}
            <div className="mt-6 rounded-lg bg-muted p-4">
              <p className="text-sm text-muted-foreground">
                Connectez-vous pour sauvegarder votre score
              </p>
              <Button className="mt-2" size="sm" asChild>
                <Link href="/login">Se connecter</Link>
              </Button>
            </div>

            <div className="mt-6 flex justify-center gap-4">
              <Button variant="outline" asChild>
                <Link href="/reviser">Retour</Link>
              </Button>
              <Button onClick={() => window.location.reload()}>
                Recommencer
              </Button>
            </div>
          </CardContent>
        </Card>
      </div>
    )
  }

  if (!currentQuestion) return null

  return (
    <div className="flex h-[calc(100vh-3.5rem)] flex-col">
      {/* Header */}
      <header className="flex items-center gap-4 border-b px-4 py-3">
        <Button variant="ghost" size="icon" asChild>
          <Link href="/reviser">
            <ChevronLeft className="h-5 w-5" />
          </Link>
        </Button>
        <div className="flex-1">
          <h1 className="font-medium">{qcm.title}</h1>
          <div className="mt-1 flex items-center gap-2">
            <Progress value={progress} className="h-2 flex-1" />
            <span className="text-sm text-muted-foreground">
              {currentIndex + 1}/{qcm.questions.length}
            </span>
          </div>
        </div>
      </header>

      {/* Question */}
      <div className="flex-1 overflow-auto">
        <div className="mx-auto max-w-2xl px-4 lg:px-6 py-8">
          <h2 className="text-lg font-medium">{currentQuestion.text}</h2>

          <div className="mt-6 space-y-3">
            {currentQuestion.options.map((option, index) => {
              const isSelected = selectedOption === index
              const isCorrect = index === currentQuestion.correctIndex
              const showResult = state === 'validated'

              return (
                <button
                  key={index}
                  onClick={() => state === 'answering' && setSelectedOption(index)}
                  disabled={state === 'validated'}
                  className={cn(
                    'flex w-full items-center gap-3 rounded-lg border p-4 text-left transition-colors',
                    state === 'answering' && [
                      isSelected
                        ? 'border-primary bg-primary/5'
                        : 'hover:border-primary/50 hover:bg-muted/50',
                    ],
                    showResult && [
                      isCorrect && 'border-green-500 bg-green-50 dark:bg-green-950/20',
                      isSelected && !isCorrect && 'border-red-500 bg-red-50 dark:bg-red-950/20',
                    ]
                  )}
                >
                  <div
                    className={cn(
                      'flex h-8 w-8 items-center justify-center rounded-full border text-sm font-medium',
                      state === 'answering' && [
                        isSelected
                          ? 'border-primary bg-primary text-primary-foreground'
                          : 'border-muted-foreground/30',
                      ],
                      showResult && [
                        isCorrect && 'border-green-500 bg-green-500 text-white',
                        isSelected && !isCorrect && 'border-red-500 bg-red-500 text-white',
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
                  <span className="flex-1">{option}</span>
                  <kbd className="hidden rounded border bg-muted px-2 py-0.5 text-xs text-muted-foreground sm:inline-block">
                    {index + 1}
                  </kbd>
                </button>
              )
            })}
          </div>
        </div>
      </div>

      {/* Footer */}
      <footer className="flex items-center justify-between border-t px-4 py-3">
        <p className="text-sm text-muted-foreground">
          Score: {score}/{currentIndex + (state === 'validated' ? 1 : 0)}
        </p>

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
            <ArrowRight className="ml-2 h-4 w-4" />
          </Button>
        )}
      </footer>
    </div>
  )
}
