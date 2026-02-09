'use client'

/**
 * Solution Decomposer Component
 *
 * Breaks down an exercise solution into clear, numbered steps
 * that the student can reveal one at a time.
 *
 * This is different from just showing the full solution — it
 * teaches the METHOD by decomposing the reasoning process.
 *
 * Integrated into the exercise workflow.
 */

import * as React from 'react'
import { ListOrdered, Loader2, ChevronRight, CheckCircle2 } from 'lucide-react'

import { Button } from '@/components/ui/button'
import { cn } from '@/lib/utils'
import { requestDecompose } from '@/lib/ai/client'
import { LatexRenderer } from './latex-renderer'
import type { DecomposeResponse, SolutionStep } from '@/types/ai'

interface SolutionDecomposerProps {
  activityId: string
  exerciseContent: string
  className?: string
}

export function SolutionDecomposer({ activityId, exerciseContent, className }: SolutionDecomposerProps) {
  const [data, setData] = React.useState<DecomposeResponse | null>(null)
  const [visibleSteps, setVisibleSteps] = React.useState(0)
  const [loading, setLoading] = React.useState(false)
  const [error, setError] = React.useState<string | null>(null)

  const handleDecompose = async () => {
    setLoading(true)
    setError(null)

    try {
      const result = await requestDecompose({
        exerciseContent,
        activityId,
      })
      setData(result)
      setVisibleSteps(1) // Show first step immediately
    } catch {
      setError('Impossible de décomposer la solution.')
    } finally {
      setLoading(false)
    }
  }

  const handleRevealNext = () => {
    if (data && visibleSteps < data.steps.length) {
      setVisibleSteps(prev => prev + 1)
    }
  }

  // Initial state - button to trigger decomposition
  if (!data && !loading) {
    return (
      <div className={cn('mt-4', className)}>
        <Button
          variant="outline"
          onClick={handleDecompose}
          className="gap-2 border-sky-200 bg-sky-50/50 text-sky-700 hover:bg-sky-100/70 dark:border-sky-800 dark:bg-sky-950/30 dark:text-sky-400 dark:hover:bg-sky-950/50"
        >
          <ListOrdered className="h-4 w-4" />
          Décomposer la solution étape par étape
        </Button>
        {error && <p className="mt-2 text-sm text-destructive">{error}</p>}
      </div>
    )
  }

  // Loading
  if (loading) {
    return (
      <div className={cn('mt-4 flex items-center gap-2 rounded-lg border border-sky-200/50 bg-sky-50/30 px-4 py-3 dark:border-sky-800/50 dark:bg-sky-950/20', className)}>
        <Loader2 className="h-4 w-4 animate-spin text-sky-600 dark:text-sky-400" />
        <span className="text-sm text-sky-700 dark:text-sky-400">Décomposition en cours...</span>
      </div>
    )
  }

  if (!data) return null

  return (
    <div className={cn('mt-4 space-y-3', className)}>
      {/* Method name header */}
      <div className="flex items-center gap-2 rounded-lg border border-sky-200/50 bg-sky-50/50 px-4 py-2.5 dark:border-sky-800/50 dark:bg-sky-950/20">
        <ListOrdered className="h-4 w-4 text-sky-600 dark:text-sky-400" aria-hidden="true" />
        <span className="text-sm font-bold text-sky-700 dark:text-sky-400">
          Méthode : {data.methodName}
        </span>
        <span className="ml-auto text-xs text-muted-foreground">
          {visibleSteps}/{data.steps.length} étapes
        </span>
      </div>

      {/* Steps */}
      {data.steps.slice(0, visibleSteps).map((step: SolutionStep, index: number) => (
        <StepCard key={index} step={step} isLast={index === data.steps.length - 1} />
      ))}

      {/* Reveal next step button */}
      {visibleSteps < data.steps.length && (
        <Button
          variant="outline"
          size="sm"
          onClick={handleRevealNext}
          className="gap-1.5 border-sky-200 text-sky-700 hover:bg-sky-50 dark:border-sky-800 dark:text-sky-400"
        >
          <ChevronRight className="h-3.5 w-3.5" />
          Étape suivante ({visibleSteps + 1}/{data.steps.length})
        </Button>
      )}

      {/* All steps revealed */}
      {visibleSteps >= data.steps.length && (
        <div className="flex items-center gap-2 text-sm text-emerald-600 dark:text-emerald-400">
          <CheckCircle2 className="h-4 w-4" aria-hidden="true" />
          Toutes les étapes sont affichées
        </div>
      )}
    </div>
  )
}

function StepCard({ step, isLast }: { step: SolutionStep; isLast: boolean }) {
  return (
    <div className={cn(
      'relative rounded-r-xl rounded-l-sm border-l-[3px] border-l-sky-400 bg-gradient-to-r from-sky-50/60 to-sky-50/10 px-4 py-3 dark:border-l-sky-500 dark:from-sky-950/20 dark:to-sky-950/5',
      !isLast && 'mb-0'
    )}>
      <div className="mb-1.5 flex items-center gap-2">
        <span className="flex h-6 w-6 items-center justify-center rounded-full bg-sky-100 text-xs font-bold text-sky-700 dark:bg-sky-900 dark:text-sky-300">
          {step.stepNumber}
        </span>
        <span className="text-sm font-semibold text-sky-800 dark:text-sky-300">
          {step.title}
        </span>
      </div>
      <LatexRenderer
        content={step.explanation}
        className="text-sm leading-relaxed text-stone-700 dark:text-stone-300"
      />
      {step.math && (
        <div className="mt-2 rounded-lg bg-white/60 px-3 py-2 dark:bg-stone-900/40">
          <LatexRenderer
            content={`$$${step.math}$$`}
            className="text-center text-sm"
          />
        </div>
      )}
    </div>
  )
}
