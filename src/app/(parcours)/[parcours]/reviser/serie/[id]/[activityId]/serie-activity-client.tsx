'use client'

/**
 * Serie Activity Client Wrapper
 *
 * Handles progress tracking and QCM playback for serie activities.
 */

import * as React from 'react'
import { useRouter } from 'next/navigation'
import { CheckCircle2 } from 'lucide-react'

import { Button } from '@/components/ui/button'
import { QCMPlayer, type QCMResult } from '@/components/patterns/qcm-player'
import { useAuth } from '@/lib/context'
import { useProgress } from '@/lib/hooks/use-progress'
import type { AtomType, CompiledQuiz } from '@/types/content'

interface SerieActivityClientProps {
  activityId: string
  activityType: AtomType
  serieSlug: string
  parcours: string
  quizData: CompiledQuiz | null
  children: React.ReactNode
}

export function SerieActivityClient({
  activityId,
  activityType,
  serieSlug,
  parcours,
  quizData,
  children,
}: SerieActivityClientProps) {
  const router = useRouter()
  const { userId } = useAuth()
  const { completeExercise, completeQCM, isCompleted, getProgress } = useProgress(userId ?? undefined)
  const [completedInSession, setCompletedInSession] = React.useState(false)

  const activityCompleted = isCompleted(activityId) || completedInSession

  const handleExerciseComplete = async () => {
    setCompletedInSession(true)

    if (userId) {
      try {
        await completeExercise({
          activityId,
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
    setCompletedInSession(true)

    if (userId) {
      try {
        await completeQCM({
          activityId,
          score: result.score,
          total: result.total,
          contextType: 'serie',
          contextId: serieSlug,
        })
      } catch (e) {
        console.error('Failed to save QCM progress:', e)
      }
    }
  }

  // QCM
  if (activityType === 'qcm' && quizData) {
    const previousProgress = getProgress(activityId)

    return (
      <div>
        {previousProgress && previousProgress.score !== undefined && previousProgress.total ? (
          <div className="mb-6 rounded-lg border border-success/20 bg-success/10 p-4">
            <p className="text-sm text-success-foreground">
              Déjà fait : {previousProgress.score}/{previousProgress.total} (
              {Math.round((previousProgress.score / previousProgress.total) * 100)}%)
            </p>
          </div>
        ) : null}
        <QCMPlayer
          qcm={quizData}
          onComplete={handleQCMComplete}
          onExit={() => router.push(`/${parcours}/reviser/serie/${serieSlug}`)}
          showExit={false}
        />
      </div>
    )
  }

  // Exercise
  if (activityType === 'exercise') {
    return (
      <>
        {children}
        <div className="mt-6 flex items-center justify-center">
          {activityCompleted ? (
            <div className="flex items-center gap-2 text-success">
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
      </>
    )
  }

  // Lesson
  return <>{children}</>
}
