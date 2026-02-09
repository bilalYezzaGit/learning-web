'use client'

/**
 * AI Weakness Dashboard
 *
 * Analyzes student progress data to identify strengths,
 * weaknesses, and generate personalized study plans.
 */

import * as React from 'react'
import {
  BarChart3,
  Loader2,
  TrendingUp,
  TrendingDown,
  Target,
  Star,
  AlertTriangle,
  CheckCircle2,
  BookOpen,
} from 'lucide-react'

import { Button } from '@/components/ui/button'
import { Card, CardContent, CardHeader } from '@/components/ui/card'
import { Progress } from '@/components/ui/progress'
import { cn } from '@/lib/utils'
import { analyzeWeaknesses, AIError } from '@/lib/services/ai-service'
import { trackAIWeaknessAnalyzed } from '@/lib/services/analytics-service'
import type { WeaknessResponse, ProgressEntry } from '@/types/ai'

interface AIWeaknessDashboardProps {
  progressData: ProgressEntry[]
  parcours: string
  className?: string
}

const severityConfig = {
  faible: {
    label: 'Faible',
    color: 'text-amber-600 dark:text-amber-400',
    bg: 'bg-amber-500/10',
    progress: 66,
  },
  moyen: {
    label: 'Moyen',
    color: 'text-orange-600 dark:text-orange-400',
    bg: 'bg-orange-500/10',
    progress: 33,
  },
  critique: {
    label: 'Critique',
    color: 'text-red-600 dark:text-red-400',
    bg: 'bg-red-500/10',
    progress: 10,
  },
} as const

export function AIWeaknessDashboard({ progressData, parcours, className }: AIWeaknessDashboardProps) {
  const [analysis, setAnalysis] = React.useState<WeaknessResponse | null>(null)
  const [isLoading, setIsLoading] = React.useState(false)
  const [error, setError] = React.useState<string | null>(null)

  const handleAnalyze = async () => {
    setIsLoading(true)
    setError(null)

    try {
      trackAIWeaknessAnalyzed(parcours)
      const result = await analyzeWeaknesses({ progressData, parcours })
      setAnalysis(result)
    } catch (e) {
      const msg = e instanceof AIError ? e.message : 'Erreur lors de l\'analyse'
      setError(msg)
    } finally {
      setIsLoading(false)
    }
  }

  if (!analysis) {
    return (
      <Card className={cn(className)}>
        <CardContent className="py-8 text-center">
          <BarChart3 className="mx-auto mb-3 h-10 w-10 text-primary/30" />
          <h3 className="text-sm font-semibold">Analyse IA de ta progression</h3>
          <p className="mt-1 text-xs text-muted-foreground">
            L&apos;IA analyse tes résultats pour identifier tes forces et faiblesses
          </p>
          <Button
            onClick={handleAnalyze}
            disabled={isLoading || progressData.length === 0}
            size="sm"
            className="mt-4 gap-2"
          >
            {isLoading ? (
              <Loader2 className="h-4 w-4 animate-spin" />
            ) : (
              <Target className="h-4 w-4" />
            )}
            {isLoading ? 'Analyse en cours...' : 'Analyser ma progression'}
          </Button>
          {progressData.length === 0 && (
            <p className="mt-2 text-xs text-muted-foreground">
              Complète des exercices et QCM pour débloquer l&apos;analyse
            </p>
          )}
          {error && <p className="mt-2 text-xs text-destructive">{error}</p>}
        </CardContent>
      </Card>
    )
  }

  return (
    <div className={cn('space-y-4', className)}>
      {/* Encouragement */}
      <Card className="border-primary/20 bg-primary/5">
        <CardContent className="p-4">
          <div className="flex items-start gap-3">
            <Star className="mt-0.5 h-5 w-5 shrink-0 text-primary" />
            <p className="text-sm text-foreground/90">{analysis.encouragement}</p>
          </div>
        </CardContent>
      </Card>

      {/* Overall analysis */}
      <Card>
        <CardHeader className="px-4 py-3">
          <h3 className="flex items-center gap-2 text-sm font-semibold">
            <BarChart3 className="h-4 w-4 text-primary" />
            Analyse globale
          </h3>
        </CardHeader>
        <CardContent className="px-4 pb-4 pt-0">
          <p className="text-sm text-foreground/90 whitespace-pre-wrap">{analysis.overallAnalysis}</p>
        </CardContent>
      </Card>

      {/* Strengths */}
      {analysis.strengths.length > 0 && (
        <Card>
          <CardHeader className="px-4 py-3">
            <h3 className="flex items-center gap-2 text-sm font-semibold text-green-700 dark:text-green-400">
              <TrendingUp className="h-4 w-4" />
              Points forts
            </h3>
          </CardHeader>
          <CardContent className="px-4 pb-4 pt-0">
            <ul className="space-y-1.5">
              {analysis.strengths.map((strength, i) => (
                <li key={i} className="flex items-start gap-2 text-sm">
                  <CheckCircle2 className="mt-0.5 h-3.5 w-3.5 shrink-0 text-green-600 dark:text-green-400" />
                  <span>{strength}</span>
                </li>
              ))}
            </ul>
          </CardContent>
        </Card>
      )}

      {/* Weaknesses */}
      {analysis.weaknesses.length > 0 && (
        <Card>
          <CardHeader className="px-4 py-3">
            <h3 className="flex items-center gap-2 text-sm font-semibold text-amber-700 dark:text-amber-400">
              <TrendingDown className="h-4 w-4" />
              Points à travailler
            </h3>
          </CardHeader>
          <CardContent className="px-4 pb-4 pt-0 space-y-3">
            {analysis.weaknesses.map((weakness, i) => {
              const config = severityConfig[weakness.severity]
              return (
                <div key={i} className={cn('rounded-lg border p-3', config.bg)}>
                  <div className="mb-1 flex items-center justify-between">
                    <span className={cn('text-sm font-medium', config.color)}>
                      {weakness.topic}
                    </span>
                    <span className={cn('rounded-full px-2 py-0.5 text-[10px] font-medium', config.bg, config.color)}>
                      {config.label}
                    </span>
                  </div>
                  <Progress value={config.progress} className="mb-2 h-1" />
                  <p className="text-xs text-foreground/80">{weakness.description}</p>
                  {weakness.suggestedActions.length > 0 && (
                    <ul className="mt-2 space-y-0.5">
                      {weakness.suggestedActions.map((action, j) => (
                        <li key={j} className="flex items-start gap-1.5 text-xs text-foreground/70">
                          <AlertTriangle className="mt-0.5 h-3 w-3 shrink-0" />
                          {action}
                        </li>
                      ))}
                    </ul>
                  )}
                </div>
              )
            })}
          </CardContent>
        </Card>
      )}

      {/* Study plan */}
      {analysis.studyPlan.length > 0 && (
        <Card>
          <CardHeader className="px-4 py-3">
            <h3 className="flex items-center gap-2 text-sm font-semibold text-primary">
              <BookOpen className="h-4 w-4" />
              Plan d&apos;étude recommandé
            </h3>
          </CardHeader>
          <CardContent className="px-4 pb-4 pt-0">
            <ol className="space-y-2">
              {analysis.studyPlan.map((step, i) => (
                <li key={i} className="flex items-start gap-2 text-sm">
                  <span className="flex h-5 w-5 shrink-0 items-center justify-center rounded-full bg-primary text-[10px] font-bold text-primary-foreground">
                    {i + 1}
                  </span>
                  <span className="text-foreground/90">{step}</span>
                </li>
              ))}
            </ol>
          </CardContent>
        </Card>
      )}

      <Button variant="ghost" size="sm" onClick={() => setAnalysis(null)} className="w-full text-xs">
        Relancer l&apos;analyse
      </Button>
    </div>
  )
}
