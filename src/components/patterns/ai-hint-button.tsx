'use client'

/**
 * AI Hint System
 *
 * Progressive hint button that reveals increasingly detailed hints.
 * Level 1: vague direction
 * Level 2: method/theorem hint
 * Level 3: detailed guide with first steps
 */

import * as React from 'react'
import { Lightbulb, Loader2, ChevronRight } from 'lucide-react'

import { Button } from '@/components/ui/button'
import { Card, CardContent } from '@/components/ui/card'
import { cn } from '@/lib/utils'
import { getHint, AIError } from '@/lib/services/ai-service'
import { trackAIHintRequested } from '@/lib/services/analytics-service'

interface AIHintButtonProps {
  activityId: string
  exerciseContent: string
  className?: string
}

interface HintEntry {
  level: number
  text: string
}

export function AIHintButton({ activityId, exerciseContent, className }: AIHintButtonProps) {
  const [hints, setHints] = React.useState<HintEntry[]>([])
  const [isLoading, setIsLoading] = React.useState(false)
  const [error, setError] = React.useState<string | null>(null)
  const [showHints, setShowHints] = React.useState(false)

  const currentLevel = hints.length
  const hasMoreHints = currentLevel < 3

  const handleGetHint = async () => {
    if (isLoading || !hasMoreHints) return

    const nextLevel = currentLevel + 1
    setIsLoading(true)
    setError(null)

    try {
      trackAIHintRequested(activityId, nextLevel)
      const response = await getHint({
        exerciseContent,
        hintLevel: nextLevel,
        previousHints: hints.map((h) => h.text),
      })

      setHints((prev) => [...prev, { level: nextLevel, text: response.hint }])
      setShowHints(true)
    } catch (e) {
      const msg = e instanceof AIError ? e.message : 'Erreur lors de la récupération de l\'indice'
      setError(msg)
    } finally {
      setIsLoading(false)
    }
  }

  const levelLabels: Record<number, string> = {
    1: 'Direction générale',
    2: 'Méthode à utiliser',
    3: 'Guide détaillé',
  }

  const levelColors: Record<number, string> = {
    1: 'bg-blue-500/10 text-blue-700 dark:text-blue-400',
    2: 'bg-amber-500/10 text-amber-700 dark:text-amber-400',
    3: 'bg-purple-500/10 text-purple-700 dark:text-purple-400',
  }

  return (
    <div className={cn('space-y-3', className)}>
      {/* Hint button */}
      <Button
        variant="outline"
        size="sm"
        onClick={handleGetHint}
        disabled={isLoading || !hasMoreHints}
        className="gap-2"
      >
        {isLoading ? (
          <Loader2 className="h-4 w-4 animate-spin" />
        ) : (
          <Lightbulb className="h-4 w-4" />
        )}
        {hints.length === 0
          ? 'Obtenir un indice IA'
          : hasMoreHints
            ? `Indice suivant (${currentLevel + 1}/3)`
            : 'Tous les indices utilisés'}
      </Button>

      {/* Progress dots */}
      {hints.length > 0 && (
        <div className="flex items-center gap-1">
          {[1, 2, 3].map((level) => (
            <div
              key={level}
              className={cn(
                'h-1.5 w-8 rounded-full transition-colors',
                level <= currentLevel ? 'bg-primary' : 'bg-muted'
              )}
            />
          ))}
          <button
            className="ml-2 text-xs text-muted-foreground hover:text-foreground"
            onClick={() => setShowHints(!showHints)}
          >
            {showHints ? 'Masquer' : 'Afficher'}
          </button>
        </div>
      )}

      {/* Hints display */}
      {showHints && hints.length > 0 && (
        <div className="space-y-2">
          {hints.map((hint) => (
            <Card key={hint.level}>
              <CardContent className="p-3">
                <div className="mb-1.5 flex items-center gap-2">
                  <span
                    className={cn(
                      'inline-flex items-center gap-1 rounded-full px-2 py-0.5 text-[10px] font-medium',
                      levelColors[hint.level]
                    )}
                  >
                    <ChevronRight className="h-3 w-3" />
                    Indice {hint.level} — {levelLabels[hint.level]}
                  </span>
                </div>
                <p className="text-sm text-foreground/90 whitespace-pre-wrap">{hint.text}</p>
              </CardContent>
            </Card>
          ))}
        </div>
      )}

      {/* Error */}
      {error && (
        <p className="text-xs text-destructive">{error}</p>
      )}
    </div>
  )
}
