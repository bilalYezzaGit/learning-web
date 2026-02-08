'use client'

/**
 * Serie Player (Client Component)
 *
 * Interactive player for going through serie activities.
 * Receives pre-compiled content from the Server Component page.
 */

import * as React from 'react'
import Link from 'next/link'
import { useRouter } from 'next/navigation'
import { ArrowLeft, ArrowRight, CheckCircle, CheckCircle2, X } from 'lucide-react'

import { Button } from '@/components/ui/button'
import { Badge } from '@/components/ui/badge'
import { Progress } from '@/components/ui/progress'
import { QCMPlayer, type QCMResult } from '@/components/patterns/qcm-player'
import { useAuth } from '@/lib/context'
import { useProgress } from '@/lib/hooks/use-progress'
import { getAtomTypeLabel } from '@/types/content'
import type { AtomType, CompiledQuiz } from '@/types/content'

interface CompiledActivity {
  id: string
  type: AtomType
  title: string
  timeMinutes: number
  quiz: CompiledQuiz | null
  content: React.ReactNode
}

interface SeriePlayerProps {
  serieSlug: string
  serieTitle: string
  activities: CompiledActivity[]
  parcours: string
}

export function SeriePlayer({ serieSlug, serieTitle, activities, parcours }: SeriePlayerProps) {
  const router = useRouter()
  const { userId } = useAuth()
  const { completeExercise, completeQCM, isCompleted, getProgress } = useProgress(userId ?? undefined)

  const [currentIndex, setCurrentIndex] = React.useState(0)
  const [completedInSession, setCompletedInSession] = React.useState<Set<string>>(new Set())

  const totalActivities = activities.length
  const currentActivity = activities[currentIndex]

  if (!currentActivity) {
    return (
      <div className="flex h-[calc(100vh-3.5rem)] items-center justify-center">
        <div className="text-center text-muted-foreground">
          <p className="text-lg font-medium">Activité non trouvée</p>
          <Button className="mt-4" asChild>
            <Link href={`/${parcours}/reviser/serie/${serieSlug}`}>Retour</Link>
          </Button>
        </div>
      </div>
    )
  }

  const progressPercent = ((currentIndex + 1) / totalActivities) * 100
  const isFirst = currentIndex === 0
  const isLast = currentIndex === totalActivities - 1
  const activityCompleted = isCompleted(currentActivity.id) || completedInSession.has(currentActivity.id)

  const handlePrevious = () => {
    if (!isFirst) setCurrentIndex(currentIndex - 1)
  }

  const handleNext = () => {
    if (!isLast) setCurrentIndex(currentIndex + 1)
  }

  const handleFinish = () => {
    router.push(`/${parcours}/reviser/serie/${serieSlug}/result`)
  }

  const handleExerciseComplete = async () => {
    setCompletedInSession((prev) => new Set(prev).add(currentActivity.id))

    if (userId) {
      try {
        await completeExercise({
          activityId: currentActivity.id,
          status: 'success',
          contextType: 'serie',
          contextId: serieSlug,
        })
      } catch (e) {
        console.error('Failed to save exercise progress:', e)
      }
    }
  }

  const handleQCMComplete = async (result: QCMResult) => {
    setCompletedInSession((prev) => new Set(prev).add(currentActivity.id))

    if (userId) {
      try {
        await completeQCM({
          activityId: currentActivity.id,
          score: result.score,
          total: result.total,
          contextType: 'serie',
          contextId: serieSlug,
        })
      } catch (e) {
        console.error('Failed to save QCM progress:', e)
      }
    }

    setTimeout(() => {
      if (isLast) {
        handleFinish()
      } else {
        handleNext()
      }
    }, 2000)
  }

  // QCM activities
  if (currentActivity.type === 'qcm' && currentActivity.quiz) {
    const previousProgress = getProgress(currentActivity.id)

    return (
      <div className="flex h-[calc(100vh-3.5rem)] flex-col">
        <header className="flex items-center gap-4 border-b px-4 py-3">
          <Button variant="ghost" size="icon" asChild>
            <Link href={`/${parcours}/reviser/serie/${serieSlug}`}>
              <X className="h-5 w-5" />
              <span className="sr-only">Quitter</span>
            </Link>
          </Button>
          <div className="flex-1">
            <p className="text-sm text-muted-foreground">{serieTitle}</p>
            <div className="mt-1 flex items-center gap-2">
              <Progress value={progressPercent} className="h-2 flex-1" />
              <span className="text-xs text-muted-foreground">
                {currentIndex + 1}/{totalActivities}
              </span>
            </div>
          </div>
        </header>

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
              qcm={currentActivity.quiz}
              onComplete={handleQCMComplete}
              onExit={() => router.push(`/${parcours}/reviser/serie/${serieSlug}`)}
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
      <header className="flex items-center gap-4 border-b px-4 py-3">
        <Button variant="ghost" size="icon" asChild>
          <Link href={`/${parcours}/reviser/serie/${serieSlug}`}>
            <X className="h-5 w-5" />
            <span className="sr-only">Quitter</span>
          </Link>
        </Button>
        <div className="flex-1">
          <p className="text-sm text-muted-foreground">{serieTitle}</p>
          <div className="mt-1 flex items-center gap-2">
            <Progress value={progressPercent} className="h-2 flex-1" />
            <span className="text-xs text-muted-foreground">
              {currentIndex + 1}/{totalActivities}
            </span>
          </div>
        </div>
      </header>

      <div className="border-b px-4 py-3">
        <div className="flex items-center gap-2">
          <Badge variant="outline" className="text-xs capitalize">
            {getAtomTypeLabel(currentActivity.type)}
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

      <div className="flex-1 overflow-auto">
        <div className="mx-auto max-w-3xl px-4 lg:px-6 py-6">
          {/* Pre-compiled content from Server Component */}
          {currentActivity.content}

          {/* Exercise completion button */}
          {currentActivity.type === 'exercise' && (
            <div className="mt-6 flex items-center justify-center">
              {activityCompleted ? (
                <div className="flex items-center gap-2 text-green-600">
                  <CheckCircle2 className="h-5 w-5" />
                  <span className="font-medium">Exercice terminé</span>
                </div>
              ) : (
                <Button onClick={handleExerciseComplete} variant="outline">
                  <CheckCircle2 className="mr-2 h-4 w-4" />
                  J&apos;ai compris
                </Button>
              )}
            </div>
          )}
        </div>
      </div>

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
