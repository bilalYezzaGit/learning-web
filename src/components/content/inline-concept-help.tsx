'use client'

/**
 * Inline Concept Help
 *
 * Small "?" button embedded in Definition/Theorem/Property components.
 * When clicked, fetches a targeted AI simplification inline.
 * NOT a standalone panel — renders directly inside the lesson component.
 */

import * as React from 'react'
import { HelpCircle, Loader2 } from 'lucide-react'

import { cn } from '@/lib/utils'
import { explainConcept, AIError, type ConceptExplanation } from '@/lib/services/ai-service'

interface InlineConceptHelpProps {
  conceptType: 'definition' | 'theorem' | 'property'
  conceptTitle: string
  conceptContent?: string
}

export function InlineConceptHelp({
  conceptType,
  conceptTitle,
  conceptContent,
}: InlineConceptHelpProps) {
  const [explanation, setExplanation] = React.useState<ConceptExplanation | null>(null)
  const [isLoading, setIsLoading] = React.useState(false)
  const [error, setError] = React.useState<string | null>(null)
  const [isOpen, setIsOpen] = React.useState(false)
  const containerRef = React.useRef<HTMLDivElement>(null)

  const getContent = (): string => {
    if (conceptContent) return conceptContent
    const aside = containerRef.current?.closest('aside')
    return aside?.querySelector('.prose')?.textContent ?? conceptTitle
  }

  const handleExplain = async () => {
    if (explanation) {
      setIsOpen(!isOpen)
      return
    }

    setIsOpen(true)
    setIsLoading(true)
    setError(null)

    try {
      const result = await explainConcept({
        conceptType,
        conceptTitle,
        conceptContent: getContent(),
      })
      setExplanation(result)
    } catch (e) {
      setError(e instanceof AIError ? e.message : 'Erreur')
    } finally {
      setIsLoading(false)
    }
  }

  return (
    <div ref={containerRef} className="not-prose">
      {/* Trigger button — small, inline */}
      <button
        onClick={handleExplain}
        disabled={isLoading}
        className={cn(
          'inline-flex items-center gap-1 rounded-full px-2 py-0.5 text-[11px] font-medium transition-colors',
          isOpen
            ? 'bg-primary/10 text-primary'
            : 'text-muted-foreground hover:bg-muted hover:text-foreground'
        )}
        title="Expliquer simplement"
      >
        {isLoading ? (
          <Loader2 className="h-3 w-3 animate-spin" />
        ) : (
          <HelpCircle className="h-3 w-3" />
        )}
        {isLoading ? 'IA...' : isOpen && explanation ? 'Masquer' : 'Pas compris ?'}
      </button>

      {/* Inline explanation panel */}
      {isOpen && (
        <div className="mt-2 rounded-lg border border-primary/20 bg-primary/5 p-3 text-sm">
          {error && (
            <p className="text-xs text-destructive">{error}</p>
          )}

          {explanation && (
            <div className="space-y-2">
              <div>
                <p className="text-[10px] font-bold uppercase tracking-wider text-primary/70">En simple</p>
                <p className="mt-0.5 text-foreground/90">{explanation.simpleVersion}</p>
              </div>
              <div>
                <p className="text-[10px] font-bold uppercase tracking-wider text-primary/70">L&apos;intuition</p>
                <p className="mt-0.5 text-foreground/80">{explanation.intuition}</p>
              </div>
              <div>
                <p className="text-[10px] font-bold uppercase tracking-wider text-primary/70">Exemple rapide</p>
                <p className="mt-0.5 text-foreground/80">{explanation.quickExample}</p>
              </div>
            </div>
          )}
        </div>
      )}
    </div>
  )
}
