'use client'

/**
 * AI Solution Explainer
 *
 * Provides step-by-step solution explanations for exercises.
 * Shows key concepts used and common mistakes to avoid.
 */

import * as React from 'react'
import { BookOpen, Loader2, AlertTriangle, Tag, ChevronRight } from 'lucide-react'

import { Button } from '@/components/ui/button'
import { Card, CardContent } from '@/components/ui/card'
import { cn } from '@/lib/utils'
import { explainSolution, AIError } from '@/lib/services/ai-service'
import { trackAISolutionExplained } from '@/lib/services/analytics-service'
import type { ExplainResponse } from '@/types/ai'

interface AISolutionExplainerProps {
  activityId: string
  exerciseContent: string
  className?: string
}

export function AISolutionExplainer({ activityId, exerciseContent, className }: AISolutionExplainerProps) {
  const [explanation, setExplanation] = React.useState<ExplainResponse | null>(null)
  const [isLoading, setIsLoading] = React.useState(false)
  const [error, setError] = React.useState<string | null>(null)
  const [visibleSteps, setVisibleSteps] = React.useState(0)

  const handleExplain = async () => {
    setIsLoading(true)
    setError(null)

    try {
      trackAISolutionExplained(activityId)
      const result = await explainSolution({ exerciseContent })
      setExplanation(result)
      setVisibleSteps(1)
    } catch (e) {
      const msg = e instanceof AIError ? e.message : 'Erreur lors de l\'explication'
      setError(msg)
    } finally {
      setIsLoading(false)
    }
  }

  const handleShowNextStep = () => {
    if (explanation && visibleSteps < explanation.steps.length) {
      setVisibleSteps((prev) => prev + 1)
    }
  }

  const handleShowAllSteps = () => {
    if (explanation) {
      setVisibleSteps(explanation.steps.length)
    }
  }

  if (!explanation) {
    return (
      <div className={cn('space-y-2', className)}>
        <Button
          variant="outline"
          size="sm"
          onClick={handleExplain}
          disabled={isLoading}
          className="gap-2"
        >
          {isLoading ? (
            <Loader2 className="h-4 w-4 animate-spin" />
          ) : (
            <BookOpen className="h-4 w-4" />
          )}
          {isLoading ? 'Analyse en cours...' : 'Expliquer la solution pas-à-pas'}
        </Button>
        {error && <p className="text-xs text-destructive">{error}</p>}
      </div>
    )
  }

  return (
    <div className={cn('space-y-4', className)}>
      <h3 className="flex items-center gap-2 text-sm font-semibold">
        <BookOpen className="h-4 w-4 text-primary" />
        Solution pas-à-pas
      </h3>

      {/* Steps */}
      <div className="space-y-3">
        {explanation.steps.slice(0, visibleSteps).map((step) => (
          <Card key={step.stepNumber}>
            <CardContent className="p-3">
              <div className="mb-1 flex items-center gap-2">
                <span className="flex h-6 w-6 items-center justify-center rounded-full bg-primary text-[11px] font-bold text-primary-foreground">
                  {step.stepNumber}
                </span>
                <span className="text-sm font-medium">{step.title}</span>
              </div>
              <p className="ml-8 text-sm text-foreground/90 whitespace-pre-wrap">{step.content}</p>
            </CardContent>
          </Card>
        ))}
      </div>

      {/* Show more steps */}
      {visibleSteps < explanation.steps.length && (
        <div className="flex gap-2">
          <Button variant="outline" size="sm" onClick={handleShowNextStep} className="gap-1">
            <ChevronRight className="h-3 w-3" />
            Étape suivante ({visibleSteps + 1}/{explanation.steps.length})
          </Button>
          <Button variant="ghost" size="sm" onClick={handleShowAllSteps} className="text-xs">
            Tout afficher
          </Button>
        </div>
      )}

      {/* Key concepts */}
      {visibleSteps === explanation.steps.length && (
        <>
          {explanation.keyConceptsUsed.length > 0 && (
            <div className="rounded-lg border bg-blue-500/5 p-3">
              <h4 className="mb-2 flex items-center gap-1.5 text-xs font-semibold text-blue-700 dark:text-blue-400">
                <Tag className="h-3.5 w-3.5" />
                Concepts clés utilisés
              </h4>
              <div className="flex flex-wrap gap-1.5">
                {explanation.keyConceptsUsed.map((concept, i) => (
                  <span
                    key={i}
                    className="rounded-full bg-blue-500/10 px-2.5 py-0.5 text-xs text-blue-700 dark:text-blue-400"
                  >
                    {concept}
                  </span>
                ))}
              </div>
            </div>
          )}

          {/* Common mistakes */}
          {explanation.commonMistakes.length > 0 && (
            <div className="rounded-lg border bg-amber-500/5 p-3">
              <h4 className="mb-2 flex items-center gap-1.5 text-xs font-semibold text-amber-700 dark:text-amber-400">
                <AlertTriangle className="h-3.5 w-3.5" />
                Erreurs courantes à éviter
              </h4>
              <ul className="space-y-1">
                {explanation.commonMistakes.map((mistake, i) => (
                  <li key={i} className="text-xs text-foreground/80">
                    • {mistake}
                  </li>
                ))}
              </ul>
            </div>
          )}
        </>
      )}
    </div>
  )
}
