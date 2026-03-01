'use client'

/**
 * Activity Client Wrapper (shared)
 *
 * Handles progress tracking, QCM playback, and exercise completion.
 * Used by both module (apprendre) and serie (reviser) activity pages.
 */

import * as React from 'react'
import Link from 'next/link'
import { CheckCircle2 } from 'lucide-react'

import { Button } from '@/components/ui/button'
import { QCMPlayer, type QCMResult } from '@/app/(parcours)/_components/qcm-player'
import { ScanUpload } from '@/app/(parcours)/_components/scan-upload'
import { Separator } from '@/components/ui/separator'
import { useAuth } from '@/lib/context'
import { useProgress } from '@/lib/hooks/use-progress'
import { trackExerciseCompleted, trackQcmCompleted } from '@/lib/services/analytics-service'
import { toast } from 'sonner'
import type { AtomType, CompiledQuiz } from '@/types/content'

interface ActivityClientProps {
  activityId: string
  activityType: AtomType
  contextType: 'module' | 'serie'
  contextId: string
  quizData: CompiledQuiz | null
  /** Raw HTML content for ScanUpload (exercise only, optional) */
  exerciseContent?: string
  /** URL for QCM exit button (optional, serie only) */
  exitUrl?: string
  children: React.ReactNode
}

export function ActivityClient({
  activityId,
  activityType,
  contextType,
  contextId,
  quizData,
  exerciseContent,
  exitUrl,
  children,
}: ActivityClientProps) {
  const { userId } = useAuth()
  const { completeExercise, completeQCM, isCompleted, getProgress } = useProgress(userId ?? undefined)
  const [completedInSession, setCompletedInSession] = React.useState(false)
  const [qcmFinished, setQcmFinished] = React.useState(false)

  const activityCompleted = isCompleted(activityId) || completedInSession
  const previousProgress = getProgress(activityId)

  const handleComplete = async () => {
    setCompletedInSession(true)
    if (activityType === 'exercise') trackExerciseCompleted(activityId)

    if (userId) {
      try {
        await completeExercise({
          activityId,
          status: 'success',
          contextType,
          contextId,
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
          contextType,
          contextId,
        })
      } catch {
        toast.error('Impossible de sauvegarder la progression.')
      }
    }
  }

  // QCM
  if (activityType === 'qcm' && quizData) {
    if (qcmFinished) {
      return (
        <div className="text-center py-8">
          <div className="mx-auto mb-4 flex h-16 w-16 items-center justify-center rounded-full bg-success/10">
            <CheckCircle2 className="h-8 w-8 text-success" aria-hidden="true" />
          </div>
          <h2 className="text-xl font-bold">QCM termine !</h2>
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
              Deja fait : {previousProgress.score}%
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
        <QCMPlayer
          qcm={quizData}
          onComplete={handleQCMComplete}
          onExit={exitUrl ? () => window.location.assign(exitUrl) : undefined}
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

        {/* Scan section (module only — shown when exerciseContent is provided) */}
        {exerciseContent && (
          <>
            <Separator className="my-8" />
            <div className="space-y-3">
              <h3 className="text-sm font-medium text-muted-foreground">
                Verifier mon travail avec l&apos;IA
              </h3>
              <ScanUpload
                activityId={activityId}
                exerciseContent={exerciseContent}
              />
            </div>
          </>
        )}

        {/* Completion section */}
        <div className="mt-8 flex flex-col items-center justify-center border-t pt-6">
          {activityCompleted ? (
            <div className="flex items-center gap-2 text-success">
              <CheckCircle2 className="h-5 w-5" aria-hidden="true" />
              <span className="font-medium">Exercice termine</span>
            </div>
          ) : (
            <>
              <p className="mb-3 text-sm text-muted-foreground">
                Tu as fini cet exercice ?
              </p>
              <Button onClick={handleComplete} variant="outline">
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

  // Lesson
  return (
    <>
      {children}

      <div className="mt-8 flex flex-col items-center justify-center border-t pt-6">
        {activityCompleted ? (
          <div className="flex items-center gap-2 text-success">
            <CheckCircle2 className="h-5 w-5" aria-hidden="true" />
            <span className="font-medium">Lecon terminee</span>
          </div>
        ) : (
          <>
            <p className="mb-3 text-sm text-muted-foreground">
              Tu as fini de lire cette lecon ?
            </p>
            <Button onClick={handleComplete} variant="outline">
              <CheckCircle2 className="mr-2 h-4 w-4" aria-hidden="true" />
              J&apos;ai lu cette lecon
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
