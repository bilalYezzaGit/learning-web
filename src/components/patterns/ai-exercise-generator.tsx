'use client'

/**
 * AI Exercise Generator
 *
 * Generates similar exercises with adjustable difficulty.
 * Students can practice more with AI-generated problems.
 */

import * as React from 'react'
import { Dices, Loader2, ChevronDown, ChevronUp, Sparkles } from 'lucide-react'

import { Button } from '@/components/ui/button'
import { Card, CardContent, CardHeader } from '@/components/ui/card'
import { cn } from '@/lib/utils'
import { generateExercises, AIError } from '@/lib/services/ai-service'
import { trackAIExerciseGenerated } from '@/lib/services/analytics-service'
import type { GeneratedExercise, GeneratedDifficulty } from '@/types/ai'

interface AIExerciseGeneratorProps {
  originalExercise: string
  topic: string
  className?: string
}

const difficultyConfig: Record<GeneratedDifficulty, { label: string; color: string }> = {
  plus_facile: { label: 'Plus facile', color: 'bg-green-500/10 text-green-700 dark:text-green-400' },
  similaire: { label: 'Similaire', color: 'bg-blue-500/10 text-blue-700 dark:text-blue-400' },
  plus_difficile: { label: 'Plus difficile', color: 'bg-red-500/10 text-red-700 dark:text-red-400' },
}

export function AIExerciseGenerator({ originalExercise, topic, className }: AIExerciseGeneratorProps) {
  const [exercises, setExercises] = React.useState<GeneratedExercise[]>([])
  const [isLoading, setIsLoading] = React.useState(false)
  const [error, setError] = React.useState<string | null>(null)
  const [selectedDifficulty, setSelectedDifficulty] = React.useState<GeneratedDifficulty>('similaire')
  const [expandedSolution, setExpandedSolution] = React.useState<number | null>(null)

  const handleGenerate = async () => {
    setIsLoading(true)
    setError(null)

    try {
      trackAIExerciseGenerated(topic, selectedDifficulty)
      const response = await generateExercises({
        originalExercise,
        topic,
        difficulty: selectedDifficulty,
        count: 2,
      })

      setExercises(response.exercises)
      setExpandedSolution(null)
    } catch (e) {
      const msg = e instanceof AIError ? e.message : 'Erreur lors de la génération'
      setError(msg)
    } finally {
      setIsLoading(false)
    }
  }

  return (
    <div className={cn('space-y-4', className)}>
      <Card>
        <CardHeader className="px-4 py-3">
          <div className="flex items-center gap-2">
            <Dices className="h-4 w-4 text-primary" />
            <h3 className="text-sm font-semibold">Générateur d&apos;exercices IA</h3>
          </div>
          <p className="text-xs text-muted-foreground">
            Génère des exercices similaires pour t&apos;entraîner davantage
          </p>
        </CardHeader>
        <CardContent className="px-4 pb-4 pt-0">
          {/* Difficulty selector */}
          <div className="mb-3 flex gap-1.5">
            {(Object.entries(difficultyConfig) as Array<[GeneratedDifficulty, { label: string; color: string }]>).map(
              ([key, config]) => (
                <button
                  key={key}
                  onClick={() => setSelectedDifficulty(key)}
                  className={cn(
                    'rounded-full px-3 py-1 text-xs font-medium transition-all',
                    selectedDifficulty === key
                      ? cn(config.color, 'ring-1 ring-current')
                      : 'bg-muted text-muted-foreground hover:text-foreground'
                  )}
                >
                  {config.label}
                </button>
              )
            )}
          </div>

          <Button
            onClick={handleGenerate}
            disabled={isLoading}
            size="sm"
            className="w-full gap-2"
          >
            {isLoading ? (
              <Loader2 className="h-4 w-4 animate-spin" />
            ) : (
              <Sparkles className="h-4 w-4" />
            )}
            {isLoading ? 'Génération...' : 'Générer des exercices'}
          </Button>

          {error && (
            <p className="mt-2 text-xs text-destructive">{error}</p>
          )}
        </CardContent>
      </Card>

      {/* Generated exercises */}
      {exercises.map((exercise, i) => (
        <Card key={i}>
          <CardContent className="p-4">
            <div className="mb-2 flex items-center gap-2">
              <span className="text-xs font-bold text-muted-foreground">
                Exercice {i + 1}
              </span>
              <span
                className={cn(
                  'rounded-full px-2 py-0.5 text-[10px] font-medium',
                  difficultyConfig[exercise.difficulty]?.color ?? 'bg-muted'
                )}
              >
                {difficultyConfig[exercise.difficulty]?.label ?? exercise.difficulty}
              </span>
            </div>

            <div className="prose prose-sm dark:prose-invert max-w-none text-sm whitespace-pre-wrap">
              {exercise.enonce}
            </div>

            {/* Solution toggle */}
            <button
              onClick={() => setExpandedSolution(expandedSolution === i ? null : i)}
              className="mt-3 flex w-full items-center gap-1 text-xs font-medium text-primary hover:underline"
            >
              {expandedSolution === i ? (
                <>
                  <ChevronUp className="h-3 w-3" />
                  Masquer la solution
                </>
              ) : (
                <>
                  <ChevronDown className="h-3 w-3" />
                  Voir la solution
                </>
              )}
            </button>

            {expandedSolution === i && (
              <div className="mt-2 rounded-lg border bg-muted/30 p-3">
                <div className="prose prose-sm dark:prose-invert max-w-none text-sm whitespace-pre-wrap">
                  {exercise.solution}
                </div>
              </div>
            )}
          </CardContent>
        </Card>
      ))}
    </div>
  )
}
