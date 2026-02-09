'use client'

/**
 * Smart Hints Component
 *
 * Progressive AI-generated hints for exercises.
 * Level 1: gentle nudge (which concept to use)
 * Level 2: method hint (approach outline)
 * Level 3: detailed guide (step-by-step without answer)
 *
 * Integrated into the exercise workflow — students ask for help
 * before revealing the full solution.
 */

import * as React from 'react'
import { Lightbulb, Loader2, ChevronRight, Sparkles } from 'lucide-react'

import { Button } from '@/components/ui/button'
import { cn } from '@/lib/utils'
import { requestHint } from '@/lib/ai/client'
import { LatexRenderer } from './latex-renderer'

interface SmartHintsProps {
  activityId: string
  exerciseContent: string
  className?: string
}

interface HintData {
  level: 1 | 2 | 3
  text: string
}

const HINT_LABELS = {
  1: 'Coup de pouce',
  2: 'Méthode',
  3: 'Guide détaillé',
} as const

const HINT_DESCRIPTIONS = {
  1: 'Quel concept utiliser ?',
  2: 'Quelle approche suivre ?',
  3: 'Pas à pas (sans la réponse)',
} as const

export function SmartHints({ activityId, exerciseContent, className }: SmartHintsProps) {
  const [hints, setHints] = React.useState<HintData[]>([])
  const [loading, setLoading] = React.useState(false)
  const [error, setError] = React.useState<string | null>(null)

  const nextLevel = (hints.length + 1) as 1 | 2 | 3
  const canRequestMore = nextLevel <= 3

  const handleRequestHint = async () => {
    if (!canRequestMore || loading) return

    setLoading(true)
    setError(null)

    try {
      const result = await requestHint({
        exerciseContent,
        activityId,
        hintLevel: nextLevel,
        previousHints: hints.map(h => h.text),
      })

      setHints(prev => [...prev, { level: nextLevel, text: result.hint }])
    } catch {
      setError('Impossible de générer un indice. Réessaie.')
    } finally {
      setLoading(false)
    }
  }

  if (hints.length === 0 && !loading) {
    return (
      <div className={cn('mt-6', className)}>
        <Button
          variant="outline"
          onClick={handleRequestHint}
          className="gap-2 border-amber-200 bg-amber-50/50 text-amber-700 hover:bg-amber-100/70 hover:text-amber-800 dark:border-amber-800 dark:bg-amber-950/30 dark:text-amber-400 dark:hover:bg-amber-950/50"
        >
          <Sparkles className="h-4 w-4" />
          Besoin d&apos;un indice ?
        </Button>
      </div>
    )
  }

  return (
    <div className={cn('mt-6 space-y-3', className)}>
      {/* Displayed hints */}
      {hints.map((hint, index) => (
        <div
          key={index}
          className="rounded-r-xl rounded-l-sm border-l-[3px] border-l-amber-400 bg-gradient-to-r from-amber-50/80 to-amber-50/20 px-4 py-3 dark:border-l-amber-500 dark:from-amber-950/30 dark:to-amber-950/5"
        >
          <div className="mb-1.5 flex items-center gap-2">
            <Lightbulb className="h-4 w-4 text-amber-600 dark:text-amber-400" aria-hidden="true" />
            <span className="text-xs font-bold uppercase tracking-wider text-amber-600 dark:text-amber-400">
              {HINT_LABELS[hint.level]}
            </span>
          </div>
          <LatexRenderer
            content={hint.text}
            className="text-sm leading-relaxed text-stone-700 dark:text-stone-300"
          />
        </div>
      ))}

      {/* Loading state */}
      {loading && (
        <div className="flex items-center gap-2 rounded-lg border border-amber-200/50 bg-amber-50/30 px-4 py-3 dark:border-amber-800/50 dark:bg-amber-950/20">
          <Loader2 className="h-4 w-4 animate-spin text-amber-600 dark:text-amber-400" />
          <span className="text-sm text-amber-700 dark:text-amber-400">
            Réflexion en cours...
          </span>
        </div>
      )}

      {/* Error */}
      {error && (
        <p className="text-sm text-destructive">{error}</p>
      )}

      {/* Next hint button */}
      {canRequestMore && !loading && (
        <Button
          variant="outline"
          size="sm"
          onClick={handleRequestHint}
          className="gap-1.5 border-amber-200 text-amber-700 hover:bg-amber-50 dark:border-amber-800 dark:text-amber-400 dark:hover:bg-amber-950/30"
        >
          <ChevronRight className="h-3.5 w-3.5" />
          Indice suivant : {HINT_DESCRIPTIONS[nextLevel]}
        </Button>
      )}

      {/* All hints used */}
      {!canRequestMore && !loading && (
        <p className="text-xs text-muted-foreground">
          Tu as utilisé tous les indices. Consulte la solution si nécessaire.
        </p>
      )}
    </div>
  )
}
