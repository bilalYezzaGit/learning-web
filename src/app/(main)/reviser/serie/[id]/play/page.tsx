'use client'

/**
 * Serie Player Page
 *
 * Interactive player for going through serie activities.
 * Handles lessons, exercises, and QCMs with progress saving.
 *
 * Features:
 * - QCM interactive play with keyboard shortcuts
 * - Exercise completion tracking
 * - Progress saved to Firestore for authenticated users
 */

import * as React from 'react'
import Link from 'next/link'
import { useRouter, useSearchParams } from 'next/navigation'
import { ArrowLeft, ArrowRight, CheckCircle, CheckCircle2, Lightbulb, X } from 'lucide-react'

import { Button } from '@/components/ui/button'
import { Badge } from '@/components/ui/badge'
import { Progress } from '@/components/ui/progress'
import { QCMPlayer, type QCMResult } from '@/components/patterns/qcm-player'
import { ContentRenderer } from '@/content'
import { useAuth } from '@/lib/context'
import { useProgress } from '@/lib/hooks/use-progress'
import { fetchSerie } from '@/lib/services/content-service'
import type { Serie } from '@/types/series'
import type { Activity, Exercise, QCM } from '@/types/activity'

interface PageProps {
  params: Promise<{ id: string }>
}

// =============================================================================
// Sub-components
// =============================================================================

function CollapsibleSection({
  title,
  icon: Icon,
  children,
  variant = 'default',
}: {
  title: string
  icon: React.ComponentType<{ className?: string }>
  children: React.ReactNode
  variant?: 'default' | 'solution'
}) {
  const bgColor = variant === 'solution' ? 'bg-green-50 dark:bg-green-950/20' : 'bg-amber-50 dark:bg-amber-950/20'
  const borderColor = variant === 'solution' ? 'border-green-200 dark:border-green-800' : 'border-amber-200 dark:border-amber-800'
  const iconColor = variant === 'solution' ? 'text-green-600' : 'text-amber-600'

  return (
    <details className={`mt-6 rounded-lg border ${borderColor} ${bgColor}`}>
      <summary className="flex cursor-pointer items-center gap-2 px-4 py-3 font-medium">
        <Icon className={`h-5 w-5 ${iconColor}`} />
        {title}
      </summary>
      <div className="border-t px-4 py-4">{children}</div>
    </details>
  )
}

function ExerciseContent({
  exercise,
  onComplete,
  isCompleted,
}: {
  exercise: Exercise
  onComplete: () => void
  isCompleted: boolean
}) {
  return (
    <>
      <ContentRenderer html={exercise.enonce} />

      {exercise.hint && (
        <CollapsibleSection title="Indice" icon={Lightbulb} variant="default">
          <ContentRenderer html={exercise.hint} />
        </CollapsibleSection>
      )}

      {exercise.solution && (
        <CollapsibleSection title="Voir la solution" icon={CheckCircle} variant="solution">
          <ContentRenderer html={exercise.solution} />
        </CollapsibleSection>
      )}

      {/* Mark as complete button */}
      <div className="mt-6 flex items-center justify-center">
        {isCompleted ? (
          <div className="flex items-center gap-2 text-green-600">
            <CheckCircle2 className="h-5 w-5" />
            <span className="font-medium">Exercice terminé</span>
          </div>
        ) : (
          <Button onClick={onComplete} variant="outline">
            <CheckCircle2 className="mr-2 h-4 w-4" />
            J&apos;ai compris
          </Button>
        )}
      </div>
    </>
  )
}

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

// =============================================================================
// Main Component
// =============================================================================

export default function SeriePlayerPage({ params }: PageProps) {
  const router = useRouter()
  const searchParams = useSearchParams()
  const { userId } = useAuth()
  const { completeExercise, completeQCM, isCompleted, getProgress } = useProgress(userId ?? undefined)

  const [serie, setSerie] = React.useState<Serie | null>(null)
  const [loading, setLoading] = React.useState(true)
  const [error, setError] = React.useState<string | null>(null)
  const [currentIndex, setCurrentIndex] = React.useState(0)
  const [resolvedParams, setResolvedParams] = React.useState<{ id: string } | null>(null)
  const [completedInSession, setCompletedInSession] = React.useState<Set<string>>(new Set())

  // Resolve params
  React.useEffect(() => {
    params.then(setResolvedParams)
  }, [params])

  // Load serie data
  React.useEffect(() => {
    if (!resolvedParams) return

    const startParam = searchParams.get('start')
    if (startParam) {
      setCurrentIndex(parseInt(startParam, 10) || 0)
    }

    fetchSerie(resolvedParams.id)
      .then(setSerie)
      .catch((e) => setError(e.message))
      .finally(() => setLoading(false))
  }, [resolvedParams, searchParams])

  // Loading state
  if (loading || !resolvedParams) {
    return (
      <div className="flex h-[calc(100vh-3.5rem)] items-center justify-center">
        <div className="text-muted-foreground">Chargement...</div>
      </div>
    )
  }

  // Error state
  if (error || !serie) {
    return (
      <div className="flex h-[calc(100vh-3.5rem)] items-center justify-center">
        <div className="text-center text-muted-foreground">
          <p className="text-lg font-medium">Erreur</p>
          <p className="mt-1">{error || 'Série non trouvée'}</p>
          <Button className="mt-4" asChild>
            <Link href="/reviser">Retour</Link>
          </Button>
        </div>
      </div>
    )
  }

  const totalActivities = serie.activities.length
  const currentActivity = serie.activities[currentIndex]

  // Invalid activity
  if (!currentActivity) {
    return (
      <div className="flex h-[calc(100vh-3.5rem)] items-center justify-center">
        <div className="text-center text-muted-foreground">
          <p className="text-lg font-medium">Activité non trouvée</p>
          <Button className="mt-4" asChild>
            <Link href={`/reviser/serie/${resolvedParams.id}`}>Retour</Link>
          </Button>
        </div>
      </div>
    )
  }

  const progressPercent = ((currentIndex + 1) / totalActivities) * 100
  const isFirst = currentIndex === 0
  const isLast = currentIndex === totalActivities - 1
  const activityCompleted = isCompleted(currentActivity.id) || completedInSession.has(currentActivity.id)

  // Handlers
  const handlePrevious = () => {
    if (!isFirst) setCurrentIndex(currentIndex - 1)
  }

  const handleNext = () => {
    if (!isLast) setCurrentIndex(currentIndex + 1)
  }

  const handleFinish = () => {
    router.push(`/reviser/serie/${resolvedParams.id}/result`)
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

  // QCM activities get full-screen treatment
  if (currentActivity.type === 'qcm') {
    const qcm = currentActivity as QCM
    const previousProgress = getProgress(currentActivity.id)

    return (
      <div className="flex h-[calc(100vh-3.5rem)] flex-col">
        {/* Minimal Header */}
        <header className="flex items-center gap-4 border-b px-4 py-3">
          <Button variant="ghost" size="icon" asChild>
            <Link href={`/reviser/serie/${resolvedParams.id}`}>
              <X className="h-5 w-5" />
              <span className="sr-only">Quitter</span>
            </Link>
          </Button>
          <div className="flex-1">
            <p className="text-sm text-muted-foreground">{serie.title}</p>
            <div className="mt-1 flex items-center gap-2">
              <Progress value={progressPercent} className="h-2 flex-1" />
              <span className="text-xs text-muted-foreground">
                {currentIndex + 1}/{totalActivities}
              </span>
            </div>
          </div>
        </header>

        {/* QCM Player */}
        <div className="flex-1 overflow-auto">
          <div className="mx-auto max-w-3xl px-4 lg:px-6 py-6">
            {previousProgress && previousProgress.score !== undefined && previousProgress.total ? (
              <div className="mb-6 rounded-lg border border-green-200 bg-green-50 p-4 dark:border-green-800 dark:bg-green-950/20">
                <p className="text-sm text-green-800 dark:text-green-200">
                  Déjà fait : {previousProgress.score}/{previousProgress.total} ({Math.round((previousProgress.score / previousProgress.total) * 100)}%)
                </p>
              </div>
            ) : null}
            <QCMPlayer
              qcm={qcm}
              onComplete={handleQCMComplete}
              onExit={() => router.push(`/reviser/serie/${resolvedParams.id}`)}
              showExit={false}
            />
          </div>
        </div>
      </div>
    )
  }

  // Lessons and Exercises
  return (
    <div className="flex h-[calc(100vh-3.5rem)] flex-col">
      {/* Header */}
      <header className="flex items-center gap-4 border-b px-4 py-3">
        <Button variant="ghost" size="icon" asChild>
          <Link href={`/reviser/serie/${resolvedParams.id}`}>
            <X className="h-5 w-5" />
            <span className="sr-only">Quitter</span>
          </Link>
        </Button>
        <div className="flex-1">
          <p className="text-sm text-muted-foreground">{serie.title}</p>
          <div className="mt-1 flex items-center gap-2">
            <Progress value={progressPercent} className="h-2 flex-1" />
            <span className="text-xs text-muted-foreground">
              {currentIndex + 1}/{totalActivities}
            </span>
          </div>
        </div>
      </header>

      {/* Activity Header */}
      <div className="border-b px-4 py-3">
        <div className="flex items-center gap-2">
          <Badge variant="outline" className="text-xs capitalize">
            {getActivityTypeLabel(currentActivity.type)}
          </Badge>
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
        <div className="mx-auto max-w-3xl px-4 lg:px-6 py-6">
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
      <footer className="flex items-center justify-between border-t px-4 py-3">
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
