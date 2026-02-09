'use client'

/**
 * QCM Wrong Answer Explainer
 *
 * When a student picks the wrong answer in a QCM, this component
 * offers a detailed AI-powered explanation of:
 * - Why their answer is wrong
 * - Why the correct answer is right
 * - What concept to review
 *
 * Integrated into the QCM flow — appears after wrong answer validation.
 */

import * as React from 'react'
import { BrainCircuit, Loader2, BookOpen, XCircle, CheckCircle2 } from 'lucide-react'

import { Button } from '@/components/ui/button'
import { cn } from '@/lib/utils'
import { requestQcmExplanation } from '@/lib/ai/client'
import { LatexRenderer } from './latex-renderer'
import type { QcmExplainResponse } from '@/types/ai'

interface QcmExplainerProps {
  questionText: string
  options: string[]
  selectedOptionIndex: number
  correctOptionIndex: number
  existingExplanation?: string
  className?: string
}

export function QcmExplainer({
  questionText,
  options,
  selectedOptionIndex,
  correctOptionIndex,
  existingExplanation,
  className,
}: QcmExplainerProps) {
  const [explanation, setExplanation] = React.useState<QcmExplainResponse | null>(null)
  const [loading, setLoading] = React.useState(false)
  const [error, setError] = React.useState<string | null>(null)

  // Only show for wrong answers
  if (selectedOptionIndex === correctOptionIndex) return null

  const handleExplain = async () => {
    setLoading(true)
    setError(null)

    try {
      const result = await requestQcmExplanation({
        questionText,
        options,
        selectedOptionIndex,
        correctOptionIndex,
        existingExplanation,
      })
      setExplanation(result)
    } catch {
      setError('Impossible de générer l\'explication.')
    } finally {
      setLoading(false)
    }
  }

  if (!explanation && !loading) {
    return (
      <div className={cn('mt-3', className)}>
        <Button
          variant="outline"
          size="sm"
          onClick={handleExplain}
          className="gap-2 border-violet-200 bg-violet-50/50 text-violet-700 hover:bg-violet-100/70 dark:border-violet-800 dark:bg-violet-950/30 dark:text-violet-400 dark:hover:bg-violet-950/50"
        >
          <BrainCircuit className="h-4 w-4" />
          Comprendre mon erreur
        </Button>
      </div>
    )
  }

  if (loading) {
    return (
      <div className={cn('mt-3 flex items-center gap-2 rounded-lg border border-violet-200/50 bg-violet-50/30 px-4 py-3 dark:border-violet-800/50 dark:bg-violet-950/20', className)}>
        <Loader2 className="h-4 w-4 animate-spin text-violet-600 dark:text-violet-400" />
        <span className="text-sm text-violet-700 dark:text-violet-400">
          Analyse de ton erreur...
        </span>
      </div>
    )
  }

  if (error) {
    return (
      <div className={cn('mt-3', className)}>
        <p className="text-sm text-destructive">{error}</p>
        <Button variant="outline" size="sm" onClick={handleExplain} className="mt-2">
          Réessayer
        </Button>
      </div>
    )
  }

  if (!explanation) return null

  return (
    <div className={cn('mt-3 space-y-3 rounded-xl border border-violet-200/50 bg-violet-50/30 p-4 dark:border-violet-800/50 dark:bg-violet-950/20', className)}>
      <div className="flex items-center gap-2">
        <BrainCircuit className="h-4 w-4 text-violet-600 dark:text-violet-400" />
        <span className="text-sm font-bold text-violet-700 dark:text-violet-400">
          Analyse de ton erreur
        </span>
      </div>

      {/* Why wrong */}
      <div className="rounded-lg bg-red-50/60 p-3 dark:bg-red-950/20">
        <div className="mb-1 flex items-center gap-1.5">
          <XCircle className="h-3.5 w-3.5 text-red-500" aria-hidden="true" />
          <span className="text-xs font-semibold uppercase tracking-wider text-red-600 dark:text-red-400">
            Pourquoi ta réponse est fausse
          </span>
        </div>
        <LatexRenderer
          content={explanation.whyWrong}
          className="text-sm leading-relaxed text-stone-700 dark:text-stone-300"
        />
      </div>

      {/* Why correct */}
      <div className="rounded-lg bg-emerald-50/60 p-3 dark:bg-emerald-950/20">
        <div className="mb-1 flex items-center gap-1.5">
          <CheckCircle2 className="h-3.5 w-3.5 text-emerald-500" aria-hidden="true" />
          <span className="text-xs font-semibold uppercase tracking-wider text-emerald-600 dark:text-emerald-400">
            Pourquoi la bonne réponse est correcte
          </span>
        </div>
        <LatexRenderer
          content={explanation.whyCorrect}
          className="text-sm leading-relaxed text-stone-700 dark:text-stone-300"
        />
      </div>

      {/* Concept to review */}
      <div className="flex items-start gap-2 rounded-lg bg-blue-50/60 p-3 dark:bg-blue-950/20">
        <BookOpen className="mt-0.5 h-3.5 w-3.5 shrink-0 text-blue-500" aria-hidden="true" />
        <div>
          <span className="text-xs font-semibold uppercase tracking-wider text-blue-600 dark:text-blue-400">
            Concept à revoir
          </span>
          <LatexRenderer
            content={explanation.conceptToReview}
            className="mt-0.5 text-sm text-stone-700 dark:text-stone-300"
          />
        </div>
      </div>
    </div>
  )
}
