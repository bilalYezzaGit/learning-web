/**
 * Serie Detail Page
 *
 * Shows serie with activities list and progress.
 * Server Component - fetches data directly.
 */

import Link from 'next/link'
import { notFound } from 'next/navigation'
import { ArrowLeft, BookOpen, CheckCircle, ChevronRight, Clock, Play } from 'lucide-react'

import { Button } from '@/components/ui/button'
import { Badge } from '@/components/ui/badge'
import { Card, CardContent, CardHeader, CardTitle } from '@/components/ui/card'
import { Progress } from '@/components/ui/progress'
import { fetchSerie, ContentNotFoundError } from '@/lib/services/content-service'
import type { Activity } from '@/types/activity'

interface PageProps {
  params: Promise<{ id: string }>
}

/**
 * Get difficulty label from number
 */
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

/**
 * Get activity type label
 */
function getActivityTypeLabel(type: Activity['type']): string {
  switch (type) {
    case 'lesson':
      return 'Cours'
    case 'exercise':
      return 'Exercice'
    case 'qcm':
      return 'QCM'
  }
}

/**
 * Get activity type badge variant
 */
function getActivityTypeBadgeClass(type: Activity['type']): string {
  switch (type) {
    case 'lesson':
      return 'bg-blue-100 text-blue-700 dark:bg-blue-900/30 dark:text-blue-400'
    case 'exercise':
      return 'bg-amber-100 text-amber-700 dark:bg-amber-900/30 dark:text-amber-400'
    case 'qcm':
      return 'bg-green-100 text-green-700 dark:bg-green-900/30 dark:text-green-400'
  }
}

export default async function SerieDetailPage({ params }: PageProps) {
  const { id } = await params

  let serie
  try {
    serie = await fetchSerie(id)
  } catch (e) {
    if (e instanceof ContentNotFoundError) {
      notFound()
    }
    throw e
  }

  // Calculate stats
  const totalActivities = serie.activities.length
  const completedActivities = 0 // TODO: from user progress
  const progressPercent = totalActivities > 0 ? (completedActivities / totalActivities) * 100 : 0

  return (
    <div className="container max-w-4xl py-6">
      {/* Back button */}
      <Button variant="ghost" size="sm" className="mb-4" asChild>
        <Link href="/reviser">
          <ArrowLeft className="mr-2 h-4 w-4" />
          Retour aux séries
        </Link>
      </Button>

      {/* Header */}
      <div className="mb-6">
        <h1 className="font-serif text-2xl font-semibold">{serie.title}</h1>
        {serie.description && (
          <p className="mt-2 text-muted-foreground">{serie.description}</p>
        )}
        <div className="mt-4 flex flex-wrap items-center gap-4">
          <Badge variant="secondary">
            {getDifficultyLabel(serie.difficulty)}
          </Badge>
          <span className="flex items-center gap-1 text-sm text-muted-foreground">
            <Clock className="h-4 w-4" />
            {serie.estimatedMinutes} min estimées
          </span>
          <span className="flex items-center gap-1 text-sm text-muted-foreground">
            <BookOpen className="h-4 w-4" />
            {totalActivities} activités
          </span>
        </div>
      </div>

      {/* Progress Card */}
      <Card className="mb-6">
        <CardContent className="py-4">
          <div className="flex items-center justify-between">
            <div>
              <p className="font-medium">Progression</p>
              <p className="text-sm text-muted-foreground">
                {completedActivities} / {totalActivities} activités complétées
              </p>
            </div>
            <div className="text-right">
              <p className="text-2xl font-bold">{Math.round(progressPercent)}%</p>
            </div>
          </div>
          <Progress value={progressPercent} className="mt-3" />
          {completedActivities === 0 && (
            <Button className="mt-4 w-full" asChild>
              <Link href={`/reviser/serie/${id}/play`}>
                <Play className="mr-2 h-4 w-4" />
                Commencer la série
              </Link>
            </Button>
          )}
        </CardContent>
      </Card>

      {/* Activities List */}
      <Card>
        <CardHeader>
          <CardTitle>Activités</CardTitle>
        </CardHeader>
        <CardContent className="p-0">
          {serie.activities.map((activity, index) => {
            const isCompleted = false // TODO: from user progress

            return (
              <Link
                key={activity.id}
                href={`/reviser/serie/${id}/play?start=${index}`}
                className="flex items-center gap-4 border-b px-6 py-4 transition-colors last:border-b-0 hover:bg-muted/50"
              >
                <div className="flex h-8 w-8 items-center justify-center rounded-full bg-muted text-sm font-medium">
                  {isCompleted ? (
                    <CheckCircle className="h-5 w-5 text-green-600" />
                  ) : (
                    index + 1
                  )}
                </div>
                <div className="flex-1 min-w-0">
                  <p className={`font-medium ${isCompleted ? 'text-muted-foreground' : ''}`}>
                    {activity.title}
                  </p>
                  <div className="mt-1 flex items-center gap-2">
                    <Badge
                      variant="secondary"
                      className={`text-xs ${getActivityTypeBadgeClass(activity.type)}`}
                    >
                      {getActivityTypeLabel(activity.type)}
                    </Badge>
                    {activity.timeMinutes > 0 && (
                      <span className="text-xs text-muted-foreground">
                        {activity.timeMinutes} min
                      </span>
                    )}
                  </div>
                </div>
                <ChevronRight className="h-5 w-5 text-muted-foreground" />
              </Link>
            )
          })}
        </CardContent>
      </Card>
    </div>
  )
}
