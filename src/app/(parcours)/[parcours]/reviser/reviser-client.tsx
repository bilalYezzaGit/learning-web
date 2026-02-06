'use client'

/**
 * Réviser Client Components
 *
 * Client-side components for displaying progress on series.
 */

import * as React from 'react'
import Link from 'next/link'
import { Check, ChevronRight, Clock, GraduationCap, RotateCcw, Trophy } from 'lucide-react'

import { Card, CardContent } from '@/components/ui/card'
import { Badge } from '@/components/ui/badge'
import { Progress } from '@/components/ui/progress'
import { useAuth } from '@/lib/context'
import { useProgress } from '@/lib/hooks/use-progress'

/** Lightweight serie metadata for the list */
interface SeriesCatalogEntry {
  id: string
  title: string
  description?: string
  difficulty: number
  estimatedMinutes: number
  tags: string[]
  activityCount: number
}

// =============================================================================
// Stats Cards
// =============================================================================

export function ReviserStats() {
  const { userId } = useAuth()
  const { progress } = useProgress(userId ?? undefined)

  // Calculate stats from progress
  const stats = React.useMemo(() => {
    let completed = 0
    let totalScore = 0
    let totalPossible = 0
    let exercisesDone = 0

    progress.forEach((p) => {
      if (p.status === 'success' || p.status === 'retry') {
        completed++
        if (p.activityType === 'exercise') {
          exercisesDone++
        }
        if (p.score !== undefined && p.total) {
          totalScore += p.score
          totalPossible += p.total
        }
      }
    })

    const avgScore = totalPossible > 0 ? Math.round((totalScore / totalPossible) * 100) : 0

    return { completed, avgScore, exercisesDone }
  }, [progress])

  return (
    <div className="mb-8 grid gap-4 sm:grid-cols-3">
      <Card>
        <CardContent className="flex items-center gap-4 py-4">
          <div className="flex h-10 w-10 items-center justify-center rounded-lg bg-primary/10">
            <Trophy className="h-5 w-5 text-primary" />
          </div>
          <div>
            <p className="tabular-nums text-2xl font-bold">{stats.completed}</p>
            <p className="text-sm text-muted-foreground">Activités complétées</p>
          </div>
        </CardContent>
      </Card>
      <Card>
        <CardContent className="flex items-center gap-4 py-4">
          <div className="flex h-10 w-10 items-center justify-center rounded-lg bg-green-100 dark:bg-green-900/20">
            <GraduationCap className="h-5 w-5 text-green-600" />
          </div>
          <div>
            <p className="tabular-nums text-2xl font-bold">{stats.avgScore}%</p>
            <p className="text-sm text-muted-foreground">Score moyen QCM</p>
          </div>
        </CardContent>
      </Card>
      <Card>
        <CardContent className="flex items-center gap-4 py-4">
          <div className="flex h-10 w-10 items-center justify-center rounded-lg bg-blue-100 dark:bg-blue-900/20">
            <Check className="h-5 w-5 text-blue-600" />
          </div>
          <div>
            <p className="tabular-nums text-2xl font-bold">{stats.exercisesDone}</p>
            <p className="text-sm text-muted-foreground">Exercices résolus</p>
          </div>
        </CardContent>
      </Card>
    </div>
  )
}

// =============================================================================
// Series List Item
// =============================================================================

interface SeriesListItemProps {
  serie: SeriesCatalogEntry
  activityIds: string[]
  parcours: string
}

function getDifficultyLabel(difficulty: number): string {
  switch (difficulty) {
    case 1:
      return 'Facile'
    case 2:
      return 'Moyen'
    case 3:
      return 'Difficile'
    default:
      return 'Moyen'
  }
}

function getDifficultyColor(difficulty: number): string {
  switch (difficulty) {
    case 1:
      return 'bg-green-100 text-green-700 dark:bg-green-900/30 dark:text-green-400'
    case 2:
      return 'bg-amber-100 text-amber-700 dark:bg-amber-900/30 dark:text-amber-400'
    case 3:
      return 'bg-red-100 text-red-700 dark:bg-red-900/30 dark:text-red-400'
    default:
      return 'bg-muted text-muted-foreground'
  }
}

export function SeriesListItem({ serie, activityIds, parcours }: SeriesListItemProps) {
  const { userId } = useAuth()
  const { progress, isCompleted, isSuccess } = useProgress(userId ?? undefined)

  // Calculate progress for this serie
  const serieProgress = React.useMemo(() => {
    let completed = 0
    let success = 0

    activityIds.forEach((id) => {
      if (isCompleted(id)) {
        completed++
        if (isSuccess(id)) {
          success++
        }
      }
    })

    const total = activityIds.length
    const percentage = total > 0 ? Math.round((completed / total) * 100) : 0

    return { completed, success, total, percentage }
  }, [activityIds, isCompleted, isSuccess, progress])

  const isSerieComplete = serieProgress.completed === serieProgress.total && serieProgress.total > 0

  return (
    <Link
      href={`/${parcours}/reviser/serie/${serie.id}`}
      className="flex items-center gap-4 border-b px-6 py-4 transition-colors last:border-b-0 hover:bg-muted/50"
    >
      <div
        className={`flex h-10 w-10 items-center justify-center rounded-lg ${
          isSerieComplete
            ? 'bg-green-100 dark:bg-green-900/20'
            : 'bg-primary/10'
        }`}
      >
        {isSerieComplete ? (
          <Check className="h-5 w-5 text-green-600" />
        ) : serieProgress.completed > 0 ? (
          <RotateCcw className="h-5 w-5 text-primary" />
        ) : (
          <GraduationCap className="h-5 w-5 text-primary" />
        )}
      </div>

      <div className="min-w-0 flex-1">
        <div className="flex items-center gap-2">
          <p className="font-medium">{serie.title}</p>
          {isSerieComplete && (
            <Badge variant="default" className="bg-green-600 text-xs">
              Terminé
            </Badge>
          )}
        </div>

        {serie.description && (
          <p className="mt-0.5 line-clamp-1 text-sm text-muted-foreground">
            {serie.description}
          </p>
        )}

        <div className="mt-2 flex flex-wrap items-center gap-2">
          <Badge
            variant="secondary"
            className={`text-xs ${getDifficultyColor(serie.difficulty)}`}
          >
            {getDifficultyLabel(serie.difficulty)}
          </Badge>
          <span className="flex items-center gap-1 text-xs text-muted-foreground">
            <Clock className="h-3 w-3" />
            {serie.estimatedMinutes} min
          </span>
          <span className="text-xs text-muted-foreground">
            {serieProgress.completed}/{serieProgress.total} activités
          </span>
        </div>

        {/* Progress bar */}
        {serieProgress.completed > 0 && !isSerieComplete && (
          <Progress value={serieProgress.percentage} className="mt-2 h-1.5" />
        )}
      </div>

      <ChevronRight className="h-5 w-5 text-muted-foreground" />
    </Link>
  )
}
