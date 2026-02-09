'use client'

/**
 * AI Performance Coach
 *
 * Displays on the parcours dashboard. Analyzes the student's progress
 * data and provides personalized coaching insights:
 * - Overall assessment
 * - Strengths
 * - Areas to improve
 * - Concrete recommendations with links to modules
 *
 * Only appears for authenticated users with some progress data.
 */

import * as React from 'react'
import Link from 'next/link'
import { BrainCircuit, Loader2, TrendingUp, Target, ArrowRight, RefreshCw, Trophy } from 'lucide-react'

import { Button } from '@/components/ui/button'
import { Card, CardContent } from '@/components/ui/card'
import { cn } from '@/lib/utils'
import { useAuth } from '@/lib/context'
import { useProgress } from '@/lib/hooks/use-progress'
import { requestCoachInsights } from '@/lib/ai/client'
import type { CoachResponse } from '@/types/ai'

interface PerformanceCoachProps {
  parcours: string
  /** Available modules for recommendations */
  modules: Array<{ slug: string; title: string; tags: string[] }>
  /** Total number of activities in programme */
  totalActivities: number
  className?: string
}

export function PerformanceCoach({ parcours, modules, totalActivities, className }: PerformanceCoachProps) {
  const { userId } = useAuth()
  const { progress: progressMap } = useProgress(userId ?? undefined)
  const [insights, setInsights] = React.useState<CoachResponse | null>(null)
  const [loading, setLoading] = React.useState(false)
  const [error, setError] = React.useState<string | null>(null)

  // Need some progress to analyze
  const hasProgress = progressMap.size > 0

  const handleAnalyze = async () => {
    setLoading(true)
    setError(null)

    try {
      // Build progress summary from real data
      const qcmResults: Array<{ activityId: string; score: number; total: number; tags: string[] }> = []
      const exercisesCompleted: string[] = []
      const completedTags: string[] = []
      const weakTags: string[] = []

      progressMap.forEach((progress, activityId) => {
        if (progress.activityType === 'qcm' && progress.score !== undefined && progress.total !== undefined) {
          qcmResults.push({
            activityId,
            score: progress.score,
            total: progress.total,
            tags: [], // We don't have tags in progress data, but that's fine
          })
          if (progress.status === 'success') {
            completedTags.push(activityId)
          } else {
            weakTags.push(activityId)
          }
        }
        if (progress.activityType === 'exercise' && progress.status === 'success') {
          exercisesCompleted.push(activityId)
          completedTags.push(activityId)
        }
      })

      const result = await requestCoachInsights({
        progressSummary: {
          totalActivities,
          completedActivities: progressMap.size,
          qcmResults,
          exercisesCompleted,
          completedTags,
          weakTags,
        },
        availableModules: modules,
      })

      setInsights(result)
    } catch {
      setError('Impossible de générer les conseils.')
    } finally {
      setLoading(false)
    }
  }

  // Not logged in or no progress
  if (!userId) return null

  // Invite to get AI analysis
  if (!insights && !loading) {
    return (
      <Card className={cn('overflow-hidden border-primary/20', className)}>
        <CardContent className="py-5">
          <div className="flex flex-col gap-4 sm:flex-row sm:items-center sm:justify-between">
            <div className="flex items-center gap-3">
              <div className="flex h-10 w-10 items-center justify-center rounded-xl bg-gradient-to-br from-violet-500 to-indigo-500 text-white">
                <BrainCircuit className="h-5 w-5" aria-hidden="true" />
              </div>
              <div>
                <p className="font-medium">Coach IA</p>
                <p className="text-sm text-muted-foreground">
                  {hasProgress
                    ? 'Analyse tes résultats et donne des conseils personnalisés'
                    : 'Commence des activités pour recevoir des conseils personnalisés'}
                </p>
              </div>
            </div>
            {hasProgress && (
              <Button
                onClick={handleAnalyze}
                className="gap-2 bg-gradient-to-r from-violet-600 to-indigo-600 hover:from-violet-700 hover:to-indigo-700"
              >
                <BrainCircuit className="h-4 w-4" />
                Analyser ma progression
              </Button>
            )}
          </div>
          {error && <p className="mt-3 text-sm text-destructive">{error}</p>}
        </CardContent>
      </Card>
    )
  }

  // Loading state
  if (loading) {
    return (
      <Card className={cn('border-primary/20', className)}>
        <CardContent className="flex items-center gap-3 py-8">
          <Loader2 className="h-5 w-5 animate-spin text-violet-600" />
          <span className="text-sm text-muted-foreground">
            Analyse de ta progression en cours...
          </span>
        </CardContent>
      </Card>
    )
  }

  if (!insights) return null

  return (
    <Card className={cn('overflow-hidden border-primary/20', className)}>
      <CardContent className="p-0">
        {/* Header */}
        <div className="flex items-center justify-between border-b bg-gradient-to-r from-violet-50 to-indigo-50 px-5 py-3 dark:from-violet-950/30 dark:to-indigo-950/30">
          <div className="flex items-center gap-2">
            <BrainCircuit className="h-4 w-4 text-violet-600 dark:text-violet-400" aria-hidden="true" />
            <span className="text-sm font-bold text-violet-700 dark:text-violet-400">Coach IA</span>
          </div>
          <Button
            variant="ghost"
            size="sm"
            onClick={handleAnalyze}
            className="h-7 gap-1 px-2 text-xs text-muted-foreground"
          >
            <RefreshCw className="h-3 w-3" />
            Actualiser
          </Button>
        </div>

        <div className="space-y-4 p-5">
          {/* Overall assessment */}
          <p className="text-sm font-medium leading-relaxed">{insights.overallAssessment}</p>

          {/* Strengths & Areas */}
          <div className="grid gap-3 sm:grid-cols-2">
            {insights.strengths.length > 0 && (
              <div className="rounded-lg bg-emerald-50/60 p-3 dark:bg-emerald-950/20">
                <div className="mb-2 flex items-center gap-1.5">
                  <Trophy className="h-3.5 w-3.5 text-emerald-600 dark:text-emerald-400" aria-hidden="true" />
                  <span className="text-xs font-bold uppercase tracking-wider text-emerald-700 dark:text-emerald-400">
                    Points forts
                  </span>
                </div>
                <ul className="space-y-1">
                  {insights.strengths.map((s, i) => (
                    <li key={i} className="text-sm text-stone-700 dark:text-stone-300">
                      {s}
                    </li>
                  ))}
                </ul>
              </div>
            )}

            {insights.areasToImprove.length > 0 && (
              <div className="rounded-lg bg-amber-50/60 p-3 dark:bg-amber-950/20">
                <div className="mb-2 flex items-center gap-1.5">
                  <Target className="h-3.5 w-3.5 text-amber-600 dark:text-amber-400" aria-hidden="true" />
                  <span className="text-xs font-bold uppercase tracking-wider text-amber-700 dark:text-amber-400">
                    À améliorer
                  </span>
                </div>
                <ul className="space-y-1">
                  {insights.areasToImprove.map((a, i) => (
                    <li key={i} className="text-sm text-stone-700 dark:text-stone-300">
                      {a}
                    </li>
                  ))}
                </ul>
              </div>
            )}
          </div>

          {/* Recommendations */}
          {insights.recommendations.length > 0 && (
            <div>
              <div className="mb-2 flex items-center gap-1.5">
                <TrendingUp className="h-3.5 w-3.5 text-primary" aria-hidden="true" />
                <span className="text-xs font-bold uppercase tracking-wider text-primary">
                  Prochaines étapes
                </span>
              </div>
              <div className="space-y-2">
                {insights.recommendations.map((rec, i) => (
                  <div key={i} className="flex items-start gap-3 rounded-lg border bg-card p-3">
                    <span className="flex h-6 w-6 shrink-0 items-center justify-center rounded-full bg-primary/10 text-xs font-bold text-primary">
                      {i + 1}
                    </span>
                    <div className="flex-1">
                      <p className="text-sm font-medium">{rec.action}</p>
                      <p className="mt-0.5 text-xs text-muted-foreground">{rec.reason}</p>
                      {rec.moduleSlug && (
                        <Link
                          href={`/${parcours}/apprendre/${rec.moduleSlug}`}
                          className="mt-1.5 inline-flex items-center gap-1 text-xs font-medium text-primary hover:underline"
                        >
                          Aller au module
                          <ArrowRight className="h-3 w-3" />
                        </Link>
                      )}
                    </div>
                  </div>
                ))}
              </div>
            </div>
          )}
        </div>
      </CardContent>
    </Card>
  )
}

/**
 * Lightweight placeholder for non-logged-in users.
 * Shown on dashboard to tease the AI coach feature.
 */
export function PerformanceCoachTeaser({ className }: { className?: string }) {
  return (
    <Card className={cn('border-dashed border-primary/20', className)}>
      <CardContent className="py-5">
        <div className="flex items-center gap-3">
          <div className="flex h-10 w-10 items-center justify-center rounded-xl bg-gradient-to-br from-violet-500/20 to-indigo-500/20 text-violet-500">
            <BrainCircuit className="h-5 w-5" aria-hidden="true" />
          </div>
          <div>
            <p className="font-medium text-muted-foreground">Coach IA</p>
            <p className="text-sm text-muted-foreground">
              <Link href="/login" className="underline hover:text-foreground">
                Connecte-toi
              </Link>
              {' '}pour des conseils personnalisés basés sur ta progression.
            </p>
          </div>
        </div>
      </CardContent>
    </Card>
  )
}
