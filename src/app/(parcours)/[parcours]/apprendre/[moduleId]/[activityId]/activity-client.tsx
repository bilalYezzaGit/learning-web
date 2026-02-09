'use client'

/**
 * Activity Client Wrapper
 *
 * Handles progress tracking and exercise completion.
 * Wraps server-rendered content with client-side interactivity.
 */

import * as React from 'react'
import Link from 'next/link'
import { CheckCircle2 } from 'lucide-react'

import { Button } from '@/components/ui/button'
import { QCMPlayer, type QCMResult } from '@/components/patterns/qcm-player'
import { ScanUpload } from '@/components/patterns/scan-upload'
import { Separator } from '@/components/ui/separator'
import { useAuth } from '@/lib/context'
import { useProgress } from '@/lib/hooks/use-progress'
import { trackExerciseCompleted, trackQcmCompleted } from '@/lib/services/analytics-service'
import { toast } from 'sonner'
import type { AtomType, CompiledQuiz } from '@/types/content'

interface ActivityClientProps {
  activityId: string
  activityType: AtomType
  moduleId: string
  parcours: string
  quizData: CompiledQuiz | null
  exerciseContent?: string
  children: React.ReactNode
}

export function ActivityClient({
  activityId,
  activityType,
  moduleId,
  // eslint-disable-next-line @typescript-eslint/no-unused-vars
  parcours,
  quizData,
  exerciseContent,
  children,
}: ActivityClientProps) {
  const { userId } = useAuth()
  const { completeExercise, completeQCM, isCompleted, getProgress } = useProgress(userId ?? undefined)
  const [completedInSession, setCompletedInSession] = React.useState(false)
  const [qcmFinished, setQcmFinished] = React.useState(false)

  const activityCompleted = isCompleted(activityId) || completedInSession
  const previousProgress = getProgress(activityId)

  const handleExerciseComplete = async () => {
    setCompletedInSession(true)
    trackExerciseCompleted(activityId)

    if (userId) {
      try {
        await completeExercise({
          activityId,
          status: 'success',
          contextType: 'module',
          contextId: moduleId,
        })
      } catch {
        toast.error('Impossible de sauvegarder la progression.')
      }
    }
  }

  const handleLessonComplete = async () => {
    setCompletedInSession(true)

    if (userId) {
      try {
        await completeExercise({
          activityId,
          status: 'success',
          contextType: 'module',
          contextId: moduleId,
        })
      } catch {
        toast.error('Impossible de sauvegarder la progression.')
      }
    }
  }

  const handleQCMComplete = async (result: QCMResult) => {
    setCompletedInSession(true)
    setQcmFinished(true)
    trackQcmCompleted(activityId, result.score, result.total)

    if (userId) {
      try {
        await completeQCM({
          activityId,
          score: result.score,
          total: result.total,
          contextType: 'module',
          contextId: moduleId,
        })
      } catch {
        toast.error('Impossible de sauvegarder la progression.')
      }
    }
  }

  // For QCM activities, show the player
  if (activityType === 'qcm' && quizData) {
    if (qcmFinished) {
      return (
        <div className="text-center py-8">
          <div className="mx-auto mb-4 flex h-16 w-16 items-center justify-center rounded-full bg-success/10">
            <CheckCircle2 className="h-8 w-8 text-success" aria-hidden="true" />
          </div>
          <h2 className="text-xl font-bold">QCM terminé !</h2>
          <p className="mt-2 text-muted-foreground">
            Utilisez les boutons de navigation pour continuer.
          </p>
        </div>
      )
    }

    return (
      <div>
        {previousProgress && previousProgress.score !== undefined ? (
          <div className="mb-6 rounded-lg border border-success/25 bg-success/10 p-4">
            <p className="text-sm text-success-foreground">
              Déjà fait : {previousProgress.score}%
            </p>
            <Button
              variant="outline"
              size="sm"
              className="mt-2"
              onClick={() => setQcmFinished(false)}
            >
              Refaire le QCM
            </Button>
          </div>
        ) : null}
        <QCMPlayer qcm={quizData} onComplete={handleQCMComplete} showExit={false} />
      </div>
    )
  }

  // For exercises, add scan + completion button
  if (activityType === 'exercise') {
    return (
      <>
        {children}

        {/* Scan section */}
        <Separator className="my-8" />
        <div className="space-y-3">
          <h3 className="text-sm font-medium text-muted-foreground">
            Vérifier mon travail avec l&apos;IA
          </h3>
          <ScanUpload
            activityId={activityId}
            exerciseContent={exerciseContent ?? ''}
          />
        </div>

        {/* Completion section */}
        <div className="mt-8 flex flex-col items-center justify-center border-t pt-6">
          {activityCompleted ? (
            <div className="flex items-center gap-2 text-success">
              <CheckCircle2 className="h-5 w-5" aria-hidden="true" />
              <span className="font-medium">Exercice terminé</span>
            </div>
          ) : (
            <>
              <p className="mb-3 text-sm text-muted-foreground">
                Tu as fini cet exercice ?
              </p>
              <Button onClick={handleExerciseComplete} variant="outline">
                <CheckCircle2 className="mr-2 h-4 w-4" aria-hidden="true" />
                J&apos;ai compris
              </Button>
            </>
          )}

          {!userId && (
            <p className="mt-4 text-xs text-muted-foreground">
              <Link href="/login" className="underline hover:text-foreground">
                Connecte-toi
              </Link>{' '}
              pour sauvegarder ta progression.
            </p>
          )}
        </div>
      </>
    )
  }

  // For lessons, show content + completion button
  return (
    <>
      {children}

      <div className="mt-8 flex flex-col items-center justify-center border-t pt-6">
        {activityCompleted ? (
          <div className="flex items-center gap-2 text-success">
            <CheckCircle2 className="h-5 w-5" aria-hidden="true" />
            <span className="font-medium">Leçon terminée</span>
          </div>
        ) : (
          <>
            <p className="mb-3 text-sm text-muted-foreground">
              Tu as fini de lire cette leçon ?
            </p>
            <Button onClick={handleLessonComplete} variant="outline">
              <CheckCircle2 className="mr-2 h-4 w-4" aria-hidden="true" />
              J&apos;ai lu cette leçon
            </Button>
          </>
        )}

        {!userId && (
          <p className="mt-4 text-xs text-muted-foreground">
            <Link href="/login" className="underline hover:text-foreground">
              Connecte-toi
            </Link>{' '}
            pour sauvegarder ta progression.
          </p>
        )}
      </div>
    </>
  )
}
