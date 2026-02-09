'use client'

/**
 * AI Concept Simplifier
 *
 * Makes complex math concepts accessible through:
 * - Simple explanations
 * - Real-world analogies
 * - Concrete examples
 * - Visual descriptions
 * - Key points to remember
 */

import * as React from 'react'
import { Zap, Loader2, Lightbulb, Globe, Eye, ListChecks } from 'lucide-react'

import { Button } from '@/components/ui/button'
import { Card, CardContent } from '@/components/ui/card'
import { cn } from '@/lib/utils'
import { simplifyConcept, AIError } from '@/lib/services/ai-service'
import { trackAIConceptSimplified } from '@/lib/services/analytics-service'
import type { SimplifyResponse } from '@/types/ai'

interface AIConceptSimplifierProps {
  concept: string
  lessonContent?: string
  className?: string
}

export function AIConceptSimplifier({ concept, lessonContent, className }: AIConceptSimplifierProps) {
  const [result, setResult] = React.useState<SimplifyResponse | null>(null)
  const [isLoading, setIsLoading] = React.useState(false)
  const [error, setError] = React.useState<string | null>(null)

  const handleSimplify = async () => {
    setIsLoading(true)
    setError(null)

    try {
      trackAIConceptSimplified(concept)
      const response = await simplifyConcept({ concept, lessonContent })
      setResult(response)
    } catch (e) {
      const msg = e instanceof AIError ? e.message : 'Erreur lors de la simplification'
      setError(msg)
    } finally {
      setIsLoading(false)
    }
  }

  if (!result) {
    return (
      <div className={cn(className)}>
        <Button
          variant="outline"
          size="sm"
          onClick={handleSimplify}
          disabled={isLoading}
          className="gap-2"
        >
          {isLoading ? (
            <Loader2 className="h-4 w-4 animate-spin" />
          ) : (
            <Zap className="h-4 w-4" />
          )}
          {isLoading ? 'Simplification...' : 'Simplifier ce concept'}
        </Button>
        {error && <p className="mt-1 text-xs text-destructive">{error}</p>}
      </div>
    )
  }

  const sections = [
    {
      icon: Zap,
      title: 'Explication simple',
      content: result.simpleExplanation,
      color: 'text-blue-600 dark:text-blue-400',
      bg: 'bg-blue-500/5',
    },
    {
      icon: Lightbulb,
      title: 'Analogie',
      content: result.analogy,
      color: 'text-amber-600 dark:text-amber-400',
      bg: 'bg-amber-500/5',
    },
    {
      icon: Globe,
      title: 'Exemple concret',
      content: result.realWorldExample,
      color: 'text-green-600 dark:text-green-400',
      bg: 'bg-green-500/5',
    },
    {
      icon: Eye,
      title: 'Vision géométrique',
      content: result.visualDescription,
      color: 'text-purple-600 dark:text-purple-400',
      bg: 'bg-purple-500/5',
    },
  ]

  return (
    <div className={cn('space-y-3', className)}>
      <h3 className="flex items-center gap-2 text-sm font-semibold">
        <Zap className="h-4 w-4 text-primary" />
        Concept simplifié : {concept}
      </h3>

      {sections.map((section) => (
        <Card key={section.title}>
          <CardContent className={cn('p-3', section.bg)}>
            <h4 className={cn('mb-1 flex items-center gap-1.5 text-xs font-semibold', section.color)}>
              <section.icon className="h-3.5 w-3.5" />
              {section.title}
            </h4>
            <p className="text-sm text-foreground/90 whitespace-pre-wrap">{section.content}</p>
          </CardContent>
        </Card>
      ))}

      {/* Key points */}
      {result.keyPoints.length > 0 && (
        <Card>
          <CardContent className="p-3">
            <h4 className="mb-2 flex items-center gap-1.5 text-xs font-semibold text-primary">
              <ListChecks className="h-3.5 w-3.5" />
              Points clés à retenir
            </h4>
            <ul className="space-y-1">
              {result.keyPoints.map((point, i) => (
                <li key={i} className="flex items-start gap-2 text-sm">
                  <span className="mt-0.5 flex h-5 w-5 shrink-0 items-center justify-center rounded-full bg-primary/10 text-[10px] font-bold text-primary">
                    {i + 1}
                  </span>
                  <span className="text-foreground/90">{point}</span>
                </li>
              ))}
            </ul>
          </CardContent>
        </Card>
      )}

      <Button variant="ghost" size="sm" onClick={() => setResult(null)} className="text-xs">
        Fermer
      </Button>
    </div>
  )
}
