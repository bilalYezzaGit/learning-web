'use client'

/**
 * Serie Activity Page
 *
 * Shows a single activity within the serie layout.
 * Handles lessons, exercises, and QCMs.
 */

import * as React from 'react'
import Link from 'next/link'
import { useRouter, useParams } from 'next/navigation'
import { ArrowLeft, ArrowRight, CheckCircle, CheckCircle2 } from 'lucide-react'

import { Button } from '@/components/ui/button'
import { Badge } from '@/components/ui/badge'
import { QCMPlayer, type QCMResult } from '@/components/patterns/qcm-player'
import { ExerciseContent, getActivityTypeLabel } from '@/components/patterns/activity-content'
import { ContentRenderer } from '@/content'
import { useAuth } from '@/lib/context'
import { useProgress } from '@/lib/hooks/use-progress'
import { fetchSerie } from '@/lib/services/content-service'
import type { Serie } from '@/types/series'
import type { QCM } from '@/types/activity'

interface PageProps {
  params: Promise<{ parcours: string; id: string; activityId: string }>
}

// =============================================================================
// Main Component
// =============================================================================

export default function SerieActivityPage({ params }: PageProps) {
  const router = useRouter()
  const routeParams = useParams()
  const parcours = routeParams.parcours as string
  const { userId } = useAuth()
  const {
    completeExercise,
    completeQCM,
    isCompleted: checkCompleted,
    getProgress,
  } = useProgress(userId ?? undefined)

  const [serie, setSerie] = React.useState<Serie | null>(null)
  const [loading, setLoading] = React.useState(true)
  const [error, setError] = React.useState<string | null>(null)
  const [resolvedParams, setResolvedParams] = React.useState<{
    parcours: string
    id: string
    activityId: string
  } | null>(null)
  const [completedInSession, setCompletedInSession] = React.useState<
    Set<string>
  >(new Set())

  // Resolve params
  React.useEffect(() => {
    params.then(setResolvedParams)
  }, [params])

  // Load serie data
  React.useEffect(() => {
    if (!resolvedParams) return

    fetchSerie(resolvedParams.id)
      .then(setSerie)
      .catch((e) => setError(e.message))
      .finally(() => setLoading(false))
  }, [resolvedParams])

  // Loading state
  if (loading || !resolvedParams) {
    return (
      <div className="flex h-full items-center justify-center">
        <div className="text-muted-foreground">Chargement...</div>
      </div>
    )
  }

  // Error state
  if (error || !serie) {
    return (
      <div className="flex h-full items-center justify-center">
        <div className="text-center text-muted-foreground">
          <p className="text-lg font-medium">Erreur</p>
          <p className="mt-1">{error || 'Série non trouvée'}</p>
          <Button className="mt-4" asChild>
            <Link href={`/${parcours}/reviser`}>Retour</Link>
          </Button>
        </div>
      </div>
    )
  }

  // Find current activity
  const currentIndex = serie.activities.findIndex(
    (a) => a.id === resolvedParams.activityId
  )
  const currentActivity = serie.activities[currentIndex]

  // Activity not found
  if (!currentActivity || currentIndex === -1) {
    return (
      <div className="flex h-full items-center justify-center">
        <div className="text-center text-muted-foreground">
          <p className="text-lg font-medium">Activité non trouvée</p>
          <Button className="mt-4" asChild>
            <Link href={`/${parcours}/reviser/serie/${resolvedParams.id}`}>Retour</Link>
          </Button>
        </div>
      </div>
    )
  }

  const isFirst = currentIndex === 0
  const isLast = currentIndex === serie.activities.length - 1
  const prevActivity = !isFirst ? serie.activities[currentIndex - 1] : null
  const nextActivity = !isLast ? serie.activities[currentIndex + 1] : null
  const activityCompleted =
    checkCompleted(currentActivity.id) ||
    completedInSession.has(currentActivity.id)

  // Handlers
  const handlePrevious = () => {
    if (prevActivity) {
      router.push(`/${parcours}/reviser/serie/${resolvedParams.id}/${prevActivity.id}`)
    }
  }

  const handleNext = () => {
    if (nextActivity) {
      router.push(`/${parcours}/reviser/serie/${resolvedParams.id}/${nextActivity.id}`)
    }
  }

  const handleFinish = () => {
    router.push(`/${parcours}/reviser/serie/${resolvedParams.id}/result`)
  }

  const handleExerciseComplete = async () => {
    // Mark as completed in session immediately (optimistic)
    setCompletedInSession((prev) => new Set(prev).add(currentActivity.id))

    // Save to Firestore if authenticated
    if (userId) {
      try {
        await completeExercise({
          activityId: currentActivity.id,
          status: 'success',
          contextType: 'serie',
          contextId: resolvedParams.id,
        })
      } catch (e) {
        console.error('Failed to save exercise progress:', e)
      }
    }
  }

  const handleQCMComplete = async (result: QCMResult) => {
    // Mark as completed in session
    setCompletedInSession((prev) => new Set(prev).add(currentActivity.id))

    // Save to Firestore if authenticated
    if (userId) {
      try {
        await completeQCM({
          activityId: currentActivity.id,
          score: result.score,
          total: result.total,
          contextType: 'serie',
          contextId: resolvedParams.id,
        })
      } catch (e) {
        console.error('Failed to save QCM progress:', e)
      }
    }

    // Auto-advance after a short delay
    setTimeout(() => {
      if (isLast) {
        handleFinish()
      } else {
        handleNext()
      }
    }, 2000)
  }

  // Render QCM
  if (currentActivity.type === 'qcm') {
    const qcm = currentActivity as QCM
    const previousProgress = getProgress(currentActivity.id)

    return (
      <div className="flex h-full flex-col">
        {/* Activity Header */}
        <div className="border-b px-4 py-3 lg:px-6">
          <div className="flex items-center gap-2">
            <Badge variant="outline" className="text-xs capitalize">
              {getActivityTypeLabel(currentActivity.type)}
            </Badge>
            <span className="text-xs text-muted-foreground">
              {currentIndex + 1} / {serie.activities.length}
            </span>
          </div>
          <h1 className="mt-1 font-medium">{currentActivity.title}</h1>
        </div>

        {/* QCM Player */}
        <div className="flex-1 overflow-auto">
          <div className="mx-auto max-w-3xl px-4 py-6 lg:px-6">
            {previousProgress &&
            previousProgress.score !== undefined &&
            previousProgress.total ? (
              <div className="mb-6 rounded-lg border border-green-200 bg-green-50 p-4 dark:border-green-800 dark:bg-green-950/20">
                <p className="text-sm text-green-800 dark:text-green-200">
                  Déjà fait : {previousProgress.score}/{previousProgress.total} (
                  {Math.round(
                    (previousProgress.score / previousProgress.total) * 100
                  )}
                  %)
                </p>
              </div>
            ) : null}
            <QCMPlayer
              qcm={qcm}
              onComplete={handleQCMComplete}
              onExit={() =>
                router.push(`/${parcours}/reviser/serie/${resolvedParams.id}`)
              }
              showExit={false}
            />
          </div>
        </div>
      </div>
    )
  }

  // Render Lesson or Exercise
  return (
    <div className="flex h-full flex-col">
      {/* Activity Header */}
      <div className="border-b px-4 py-3 lg:px-6">
        <div className="flex items-center gap-2">
          <Badge variant="outline" className="text-xs capitalize">
            {getActivityTypeLabel(currentActivity.type)}
          </Badge>
          <span className="text-xs text-muted-foreground">
            {currentIndex + 1} / {serie.activities.length}
          </span>
          {activityCompleted && (
            <Badge variant="default" className="bg-green-600 text-xs">
              <CheckCircle2 className="mr-1 h-3 w-3" />
              Fait
            </Badge>
          )}
        </div>
        <h1 className="mt-1 font-medium">{currentActivity.title}</h1>
      </div>

      {/* Content */}
      <div className="flex-1 overflow-auto">
        <div className="mx-auto max-w-3xl px-4 py-6 lg:px-6">
          {currentActivity.type === 'lesson' && (
            <ContentRenderer html={currentActivity.body} />
          )}
          {currentActivity.type === 'exercise' && (
            <ExerciseContent
              exercise={currentActivity}
              onComplete={handleExerciseComplete}
              isCompleted={activityCompleted}
            />
          )}
        </div>
      </div>

      {/* Navigation Footer */}
      <footer className="flex items-center justify-between border-t px-4 py-3 lg:px-6">
        <Button variant="outline" onClick={handlePrevious} disabled={isFirst}>
          <ArrowLeft className="mr-2 h-4 w-4" />
          Précédent
        </Button>

        {isLast ? (
          <Button onClick={handleFinish}>
            Terminer
            <CheckCircle className="ml-2 h-4 w-4" />
          </Button>
        ) : (
          <Button onClick={handleNext}>
            Suivant
            <ArrowRight className="ml-2 h-4 w-4" />
          </Button>
        )}
      </footer>
    </div>
  )
}
