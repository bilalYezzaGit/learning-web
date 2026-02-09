'use client'

/**
 * AI Exercise Generator
 *
 * After completing an exercise, students can generate a similar one
 * for extra practice. Supports three variations:
 * - Similar (same level, different numbers)
 * - Easier (fewer steps, simpler values)
 * - Harder (more steps, edge cases)
 *
 * Integrated into the exercise completion flow.
 */

import * as React from 'react'
import { Dices, Loader2, ChevronDown, ChevronUp, RotateCw } from 'lucide-react'

import { Button } from '@/components/ui/button'
import { cn } from '@/lib/utils'
import { requestGenerateExercise } from '@/lib/ai/client'
import { LatexRenderer } from './latex-renderer'
import type { GenerateExerciseResponse } from '@/types/ai'

interface ExerciseGeneratorProps {
  originalExercise: string
  tags: string[]
  difficulty: number
  className?: string
}

type Variation = 'similar' | 'easier' | 'harder'

const VARIATION_LABELS: Record<Variation, string> = {
  similar: 'Similaire',
  easier: 'Plus facile',
  harder: 'Plus difficile',
}

export function ExerciseGenerator({ originalExercise, tags, difficulty, className }: ExerciseGeneratorProps) {
  const [generated, setGenerated] = React.useState<GenerateExerciseResponse | null>(null)
  const [loading, setLoading] = React.useState(false)
  const [error, setError] = React.useState<string | null>(null)
  const [solutionVisible, setSolutionVisible] = React.useState(false)
  const [selectedVariation, setSelectedVariation] = React.useState<Variation>('similar')

  const handleGenerate = async (variation: Variation) => {
    setLoading(true)
    setError(null)
    setGenerated(null)
    setSolutionVisible(false)
    setSelectedVariation(variation)

    try {
      const result = await requestGenerateExercise({
        originalExercise,
        tags,
        difficulty,
        variation,
      })
      setGenerated(result)
    } catch {
      setError('Impossible de générer un exercice.')
    } finally {
      setLoading(false)
    }
  }

  // Initial state - generate buttons
  if (!generated && !loading) {
    return (
      <div className={cn('mt-6 rounded-xl border border-dashed border-primary/30 bg-primary/5 p-4', className)}>
        <div className="mb-3 flex items-center gap-2">
          <Dices className="h-4 w-4 text-primary" aria-hidden="true" />
          <span className="text-sm font-semibold">Envie de t&apos;entraîner encore ?</span>
        </div>
        <p className="mb-3 text-xs text-muted-foreground">
          L&apos;IA génère un exercice du même type avec des valeurs différentes.
        </p>
        <div className="flex flex-wrap gap-2">
          <Button
            variant="outline"
            size="sm"
            onClick={() => handleGenerate('easier')}
            className="gap-1.5 text-xs"
          >
            Plus facile
          </Button>
          <Button
            size="sm"
            onClick={() => handleGenerate('similar')}
            className="gap-1.5 text-xs"
          >
            <Dices className="h-3.5 w-3.5" />
            Exercice similaire
          </Button>
          <Button
            variant="outline"
            size="sm"
            onClick={() => handleGenerate('harder')}
            className="gap-1.5 text-xs"
          >
            Plus difficile
          </Button>
        </div>
        {error && <p className="mt-2 text-sm text-destructive">{error}</p>}
      </div>
    )
  }

  // Loading
  if (loading) {
    return (
      <div className={cn('mt-6 flex items-center gap-2 rounded-xl border border-primary/20 bg-primary/5 px-4 py-6', className)}>
        <Loader2 className="h-5 w-5 animate-spin text-primary" />
        <span className="text-sm text-muted-foreground">
          Génération d&apos;un exercice {VARIATION_LABELS[selectedVariation].toLowerCase()}...
        </span>
      </div>
    )
  }

  if (!generated) return null

  return (
    <div className={cn('mt-6 rounded-xl border border-primary/20 bg-card', className)}>
      {/* Header */}
      <div className="flex items-center justify-between border-b px-4 py-3">
        <div className="flex items-center gap-2">
          <Dices className="h-4 w-4 text-primary" aria-hidden="true" />
          <span className="text-sm font-bold">Exercice généré</span>
          <span className="rounded-full bg-primary/10 px-2 py-0.5 text-xs font-medium text-primary">
            {generated.difficultyLabel}
          </span>
        </div>
        <Button
          variant="ghost"
          size="sm"
          onClick={() => handleGenerate(selectedVariation)}
          className="h-7 gap-1 px-2 text-xs"
        >
          <RotateCw className="h-3 w-3" />
          Autre
        </Button>
      </div>

      {/* Problem statement */}
      <div className="p-4">
        <LatexRenderer
          content={generated.enonce}
          className="text-sm leading-relaxed"
        />
      </div>

      {/* Solution toggle */}
      <div className="border-t">
        <button
          onClick={() => setSolutionVisible(!solutionVisible)}
          className="flex w-full items-center gap-2 px-4 py-3 text-sm font-medium text-emerald-700 hover:bg-emerald-50/50 dark:text-emerald-400 dark:hover:bg-emerald-950/20"
        >
          {solutionVisible ? (
            <ChevronUp className="h-4 w-4" />
          ) : (
            <ChevronDown className="h-4 w-4" />
          )}
          {solutionVisible ? 'Masquer la solution' : 'Voir la solution'}
        </button>

        {solutionVisible && (
          <div className="border-t border-emerald-200/50 bg-emerald-50/30 px-4 py-4 dark:border-emerald-800/30 dark:bg-emerald-950/10">
            <LatexRenderer
              content={generated.solution}
              className="text-sm leading-relaxed text-stone-700 dark:text-stone-300"
            />
          </div>
        )}
      </div>

      {/* Generate another variation */}
      <div className="flex flex-wrap gap-2 border-t px-4 py-3">
        {(['easier', 'similar', 'harder'] as Variation[]).map(v => (
          <Button
            key={v}
            variant={v === selectedVariation ? 'default' : 'outline'}
            size="sm"
            onClick={() => handleGenerate(v)}
            className="h-7 text-xs"
            disabled={loading}
          >
            {VARIATION_LABELS[v]}
          </Button>
        ))}
      </div>
    </div>
  )
}
