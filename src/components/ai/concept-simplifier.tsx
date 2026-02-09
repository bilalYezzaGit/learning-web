'use client'

/**
 * Concept Simplifier Button
 *
 * Added to lesson concept blocks (Definition, Theorem, Property, Attention).
 * When clicked, asks AI to explain the concept differently with:
 * - A simplified explanation
 * - An everyday analogy
 * - A mini worked example
 *
 * Renders inline within the lesson flow.
 */

import * as React from 'react'
import { Sparkles, Loader2, Lightbulb, Heart, PenLine } from 'lucide-react'

import { Button } from '@/components/ui/button'
import { cn } from '@/lib/utils'
import { requestSimplify } from '@/lib/ai/client'
import { LatexRenderer } from './latex-renderer'
import type { SimplifyResponse } from '@/types/ai'

interface ConceptSimplifierProps {
  conceptContent: string
  conceptType: 'definition' | 'theorem' | 'property' | 'attention'
  lessonTitle: string
  className?: string
}

export function ConceptSimplifier({
  conceptContent,
  conceptType,
  lessonTitle,
  className,
}: ConceptSimplifierProps) {
  const [result, setResult] = React.useState<SimplifyResponse | null>(null)
  const [loading, setLoading] = React.useState(false)
  const [error, setError] = React.useState<string | null>(null)

  const handleSimplify = async () => {
    setLoading(true)
    setError(null)

    try {
      const response = await requestSimplify({
        conceptContent,
        conceptType,
        lessonTitle,
      })
      setResult(response)
    } catch {
      setError('Impossible de simplifier. Réessaie.')
    } finally {
      setLoading(false)
    }
  }

  if (!result && !loading) {
    return (
      <div className={cn('mt-3', className)}>
        <Button
          variant="ghost"
          size="sm"
          onClick={handleSimplify}
          className="gap-1.5 text-xs text-muted-foreground hover:text-primary"
        >
          <Sparkles className="h-3.5 w-3.5" />
          Explique-moi autrement
        </Button>
        {error && <p className="mt-1 text-xs text-destructive">{error}</p>}
      </div>
    )
  }

  if (loading) {
    return (
      <div className={cn('mt-3 flex items-center gap-2 px-2 py-2', className)}>
        <Loader2 className="h-4 w-4 animate-spin text-primary" />
        <span className="text-xs text-muted-foreground">Reformulation en cours...</span>
      </div>
    )
  }

  if (!result) return null

  return (
    <div className={cn('mt-3 space-y-2.5 rounded-lg border border-primary/20 bg-primary/5 p-4', className)}>
      <div className="flex items-center gap-1.5">
        <Sparkles className="h-3.5 w-3.5 text-primary" aria-hidden="true" />
        <span className="text-xs font-bold uppercase tracking-wider text-primary">
          Explication alternative
        </span>
      </div>

      {/* Simplified explanation */}
      <div className="space-y-1">
        <div className="flex items-center gap-1.5">
          <Lightbulb className="h-3 w-3 text-amber-500" aria-hidden="true" />
          <span className="text-xs font-semibold text-amber-700 dark:text-amber-400">En plus simple</span>
        </div>
        <LatexRenderer
          content={result.simplifiedExplanation}
          className="text-sm leading-relaxed text-stone-700 dark:text-stone-300"
        />
      </div>

      {/* Analogy */}
      <div className="space-y-1">
        <div className="flex items-center gap-1.5">
          <Heart className="h-3 w-3 text-rose-500" aria-hidden="true" />
          <span className="text-xs font-semibold text-rose-700 dark:text-rose-400">Analogie</span>
        </div>
        <LatexRenderer
          content={result.analogy}
          className="text-sm leading-relaxed text-stone-700 dark:text-stone-300"
        />
      </div>

      {/* Mini example */}
      <div className="space-y-1">
        <div className="flex items-center gap-1.5">
          <PenLine className="h-3 w-3 text-emerald-500" aria-hidden="true" />
          <span className="text-xs font-semibold text-emerald-700 dark:text-emerald-400">Mini-exemple</span>
        </div>
        <LatexRenderer
          content={result.miniExample}
          className="text-sm leading-relaxed text-stone-700 dark:text-stone-300"
        />
      </div>
    </div>
  )
}
