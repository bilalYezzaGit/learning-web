'use client'

/**
 * Exercise AI Toolbar
 *
 * Compact, integrated AI toolbar for exercises.
 * Three inline tools: progressive hints, step-by-step solution, generate similar.
 * Renders directly below the exercise content — no modals or floating elements.
 */

import * as React from 'react'
import { Lightbulb, GraduationCap, Shuffle, Loader2, ChevronUp } from 'lucide-react'

import { Button } from '@/components/ui/button'
import { cn } from '@/lib/utils'
import {
  getHint,
  explainSolution,
  generateExercises,
  AIError,
} from '@/lib/services/ai-service'
import type { ExplainResponse, GenerateExerciseResponse } from '@/types/ai'

interface ExerciseAIToolbarProps {
  exerciseContent: string
  topic: string
  className?: string
}

const DIFFICULTY_LABELS: Record<string, string> = {
  plus_facile: 'Plus facile',
  similaire: 'Même niveau',
  plus_difficile: 'Plus difficile',
}

export function ExerciseAIToolbar({
  exerciseContent,
  topic,
  className,
}: ExerciseAIToolbarProps) {
  // Hints state
  const [hints, setHints] = React.useState<string[]>([])
  const [hintLoading, setHintLoading] = React.useState(false)
  const [hintError, setHintError] = React.useState<string | null>(null)
  const [showHints, setShowHints] = React.useState(false)

  // Solution state
  const [solution, setSolution] = React.useState<ExplainResponse | null>(null)
  const [solutionLoading, setSolutionLoading] = React.useState(false)
  const [solutionError, setSolutionError] = React.useState<string | null>(null)
  const [showSolution, setShowSolution] = React.useState(false)

  // Generate state
  const [generated, setGenerated] = React.useState<GenerateExerciseResponse | null>(null)
  const [generateLoading, setGenerateLoading] = React.useState(false)
  const [generateError, setGenerateError] = React.useState<string | null>(null)
  const [showGenerated, setShowGenerated] = React.useState(false)

  const handleHint = async () => {
    if (hints.length >= 3) {
      setShowHints(!showHints)
      return
    }
    if (hints.length > 0 && !showHints) {
      setShowHints(true)
      return
    }
    setShowHints(true)
    setHintLoading(true)
    setHintError(null)
    try {
      const result = await getHint({
        exerciseContent,
        hintLevel: hints.length + 1,
        previousHints: hints,
      })
      setHints(prev => [...prev, result.hint])
    } catch (e) {
      setHintError(e instanceof AIError ? e.message : 'Erreur')
    } finally {
      setHintLoading(false)
    }
  }

  const handleSolution = async () => {
    if (solution) {
      setShowSolution(!showSolution)
      return
    }
    setShowSolution(true)
    setSolutionLoading(true)
    setSolutionError(null)
    try {
      const result = await explainSolution({ exerciseContent })
      setSolution(result)
    } catch (e) {
      setSolutionError(e instanceof AIError ? e.message : 'Erreur')
    } finally {
      setSolutionLoading(false)
    }
  }

  const handleGenerate = async () => {
    if (generated) {
      setShowGenerated(!showGenerated)
      return
    }
    setShowGenerated(true)
    setGenerateLoading(true)
    setGenerateError(null)
    try {
      const result = await generateExercises({
        originalExercise: exerciseContent,
        topic,
        difficulty: 'similaire',
        count: 2,
      })
      setGenerated(result)
    } catch (e) {
      setGenerateError(e instanceof AIError ? e.message : 'Erreur')
    } finally {
      setGenerateLoading(false)
    }
  }

  return (
    <div className={cn('space-y-3', className)}>
      {/* Toolbar buttons */}
      <div className="flex flex-wrap gap-2">
        <Button
          variant="outline"
          size="sm"
          onClick={handleHint}
          disabled={hintLoading}
          className="gap-1.5 text-xs"
        >
          {hintLoading ? (
            <Loader2 className="h-3 w-3 animate-spin" />
          ) : (
            <Lightbulb className="h-3 w-3" />
          )}
          {hints.length === 0
            ? 'Indice'
            : hints.length >= 3
              ? `${hints.length} indices`
              : `Indice ${hints.length + 1}/3`}
        </Button>

        <Button
          variant="outline"
          size="sm"
          onClick={handleSolution}
          disabled={solutionLoading}
          className="gap-1.5 text-xs"
        >
          {solutionLoading ? (
            <Loader2 className="h-3 w-3 animate-spin" />
          ) : (
            <GraduationCap className="h-3 w-3" />
          )}
          Solution détaillée
        </Button>

        <Button
          variant="outline"
          size="sm"
          onClick={handleGenerate}
          disabled={generateLoading}
          className="gap-1.5 text-xs"
        >
          {generateLoading ? (
            <Loader2 className="h-3 w-3 animate-spin" />
          ) : (
            <Shuffle className="h-3 w-3" />
          )}
          Exercice similaire
        </Button>
      </div>

      {/* Hints panel */}
      {showHints && hints.length > 0 && (
        <div className="rounded-lg border border-amber-500/20 bg-amber-500/5 p-3">
          <button
            onClick={() => setShowHints(false)}
            className="flex w-full items-center justify-between text-xs font-semibold uppercase tracking-wider text-amber-600 dark:text-amber-400"
          >
            Indices ({hints.length}/3)
            <ChevronUp className="h-3 w-3" />
          </button>
          <div className="mt-2 space-y-2">
            {hints.map((hint, i) => (
              <div key={i} className="flex gap-2 text-sm">
                <span className="shrink-0 font-medium text-amber-600 dark:text-amber-400">
                  {i + 1}.
                </span>
                <p className="text-foreground/90">{hint}</p>
              </div>
            ))}
          </div>
          {hintError && <p className="mt-2 text-xs text-destructive">{hintError}</p>}
          {hints.length < 3 && (
            <button
              onClick={handleHint}
              disabled={hintLoading}
              className="mt-2 text-xs font-medium text-amber-600 hover:text-amber-700 dark:text-amber-400 disabled:opacity-50"
            >
              {hintLoading ? 'Chargement...' : `Indice suivant (${hints.length + 1}/3)`}
            </button>
          )}
        </div>
      )}

      {/* Solution panel */}
      {showSolution && (
        <div className="rounded-lg border border-primary/20 bg-primary/5 p-3">
          <button
            onClick={() => setShowSolution(false)}
            className="flex w-full items-center justify-between text-xs font-semibold uppercase tracking-wider text-primary"
          >
            Solution détaillée
            <ChevronUp className="h-3 w-3" />
          </button>
          {solutionLoading && (
            <div className="mt-2 flex items-center gap-2 text-sm text-muted-foreground">
              <Loader2 className="h-3 w-3 animate-spin" />
              Génération de la solution...
            </div>
          )}
          {solution && (
            <div className="mt-2 space-y-3">
              {solution.steps.map((step, i) => (
                <div key={i} className="flex gap-2 text-sm">
                  <span className="flex h-5 w-5 shrink-0 items-center justify-center rounded-full bg-primary/10 text-[10px] font-bold text-primary">
                    {step.stepNumber}
                  </span>
                  <div>
                    <p className="font-medium">{step.title}</p>
                    <p className="mt-0.5 text-foreground/80">{step.content}</p>
                  </div>
                </div>
              ))}
              {solution.keyConceptsUsed.length > 0 && (
                <div className="flex flex-wrap gap-1.5 border-t pt-2">
                  {solution.keyConceptsUsed.map((concept, i) => (
                    <span key={i} className="rounded-full bg-primary/10 px-2 py-0.5 text-[10px] font-medium text-primary">
                      {concept}
                    </span>
                  ))}
                </div>
              )}
              {solution.commonMistakes.length > 0 && (
                <div className="rounded bg-amber-500/10 px-2 py-1.5">
                  <p className="text-[10px] font-semibold uppercase tracking-wider text-amber-600 dark:text-amber-400">
                    Erreurs courantes
                  </p>
                  <ul className="mt-1 space-y-0.5">
                    {solution.commonMistakes.map((mistake, i) => (
                      <li key={i} className="text-xs text-foreground/80">• {mistake}</li>
                    ))}
                  </ul>
                </div>
              )}
            </div>
          )}
          {solutionError && <p className="mt-2 text-xs text-destructive">{solutionError}</p>}
        </div>
      )}

      {/* Generated exercises panel */}
      {showGenerated && (
        <div className="rounded-lg border border-violet-500/20 bg-violet-500/5 p-3">
          <button
            onClick={() => setShowGenerated(false)}
            className="flex w-full items-center justify-between text-xs font-semibold uppercase tracking-wider text-violet-600 dark:text-violet-400"
          >
            Exercices similaires
            <ChevronUp className="h-3 w-3" />
          </button>
          {generateLoading && (
            <div className="mt-2 flex items-center gap-2 text-sm text-muted-foreground">
              <Loader2 className="h-3 w-3 animate-spin" />
              Génération d&apos;exercices...
            </div>
          )}
          {generated && (
            <div className="mt-2 space-y-4">
              {generated.exercises.map((ex, i) => (
                <div key={i} className="rounded border border-violet-500/10 bg-background/50 p-3">
                  <p className="text-xs font-medium text-violet-600 dark:text-violet-400">
                    Exercice {i + 1} — {DIFFICULTY_LABELS[ex.difficulty] ?? ex.difficulty}
                  </p>
                  <p className="mt-1 whitespace-pre-line text-sm">{ex.enonce}</p>
                  <details className="mt-2">
                    <summary className="cursor-pointer text-xs text-muted-foreground hover:text-foreground">
                      Voir la solution
                    </summary>
                    <p className="mt-1 whitespace-pre-line text-sm text-foreground/80">{ex.solution}</p>
                  </details>
                </div>
              ))}
            </div>
          )}
          {generateError && <p className="mt-2 text-xs text-destructive">{generateError}</p>}
        </div>
      )}
    </div>
  )
}
