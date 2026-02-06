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
import { Badge } from '@/components/ui/badge'
import { QCMPlayer, type QCMResult } from '@/components/patterns/qcm-player'
import { useAuth } from '@/lib/context'
import { useProgress } from '@/lib/hooks/use-progress'
import type { Activity, QCM } from '@/types/activity'

interface ActivityClientProps {
  activity: Activity
  moduleId: string
  parcours: string
  children: React.ReactNode
}

export function ActivityClient({ activity, moduleId, parcours, children }: ActivityClientProps) {
  const { userId } = useAuth()
  const { completeExercise, completeQCM, isCompleted, isSuccess, getProgress } = useProgress(userId ?? undefined)
  const [completedInSession, setCompletedInSession] = React.useState(false)
  const [qcmFinished, setQcmFinished] = React.useState(false)

  const activityCompleted = isCompleted(activity.id) || completedInSession
  const previousProgress = getProgress(activity.id)

  const handleExerciseComplete = async () => {
    setCompletedInSession(true)

    if (userId) {
      try {
        await completeExercise({
          activityId: activity.id,
          status: 'success',
          contextType: 'module',
          contextId: moduleId,
        })
      } catch (e) {
        console.error('Failed to save exercise progress:', e)
      }
    }
  }

  const handleQCMComplete = async (result: QCMResult) => {
    setCompletedInSession(true)
    setQcmFinished(true)

    if (userId) {
      try {
        await completeQCM({
          activityId: activity.id,
          score: result.score,
          total: result.total,
          contextType: 'module',
          contextId: moduleId,
        })
      } catch (e) {
        console.error('Failed to save QCM progress:', e)
      }
    }
  }

  // For QCM activities, show the player
  if (activity.type === 'qcm') {
    const qcm = activity as QCM

    if (qcmFinished) {
      return (
        <div className="text-center py-8">
          <div className="mx-auto mb-4 flex h-16 w-16 items-center justify-center rounded-full bg-green-100 dark:bg-green-950/30">
            <CheckCircle2 className="h-8 w-8 text-green-600" />
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
        {previousProgress && previousProgress.score !== undefined && previousProgress.total ? (
          <div className="mb-6 rounded-lg border border-green-200 bg-green-50 p-4 dark:border-green-800 dark:bg-green-950/20">
            <p className="text-sm text-green-800 dark:text-green-200">
              Déjà fait : {previousProgress.score}/{previousProgress.total} (
              {Math.round((previousProgress.score / previousProgress.total) * 100)}%)
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
        <QCMPlayer qcm={qcm} onComplete={handleQCMComplete} showExit={false} />
      </div>
    )
  }

  // For exercises, add completion button
  if (activity.type === 'exercise') {
    return (
      <>
        {children}

        {/* Completion section */}
        <div className="mt-8 flex flex-col items-center justify-center border-t pt-6">
          {activityCompleted ? (
            <div className="flex items-center gap-2 text-green-600">
              <CheckCircle2 className="h-5 w-5" />
              <span className="font-medium">Exercice terminé</span>
            </div>
          ) : (
            <>
              <p className="mb-3 text-sm text-muted-foreground">
                Tu as fini cet exercice ?
              </p>
              <Button onClick={handleExerciseComplete} variant="outline">
                <CheckCircle2 className="mr-2 h-4 w-4" />
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

  // For lessons, just show the content
  return <>{children}</>
}

/**
 * Progress badge to show completion status
 */
export function ProgressBadge({ activityId }: { activityId: string }) {
  const { userId } = useAuth()
  const { isCompleted, isSuccess } = useProgress(userId ?? undefined)

  if (!isCompleted(activityId)) return null

  const success = isSuccess(activityId)

  return (
    <Badge
      variant="default"
      className={success ? 'bg-green-600' : 'bg-orange-500'}
    >
      <CheckCircle2 className="mr-1 h-3 w-3" />
      {success ? 'Fait' : 'À revoir'}
    </Badge>
  )
}
