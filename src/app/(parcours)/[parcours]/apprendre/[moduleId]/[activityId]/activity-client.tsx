'use client'

/**
 * Activity Client Wrapper
 *
 * Handles progress tracking and exercise completion.
 * Integrates AI features deeply into each activity type:
 * - QCM: AI remediation handled inside QCMPlayer
 * - Exercise: Compact AI toolbar (hints, solution, generate similar) + scan
 * - Lesson: Comprehension check at end (inline concept help on components)
 */

import * as React from 'react'
import Link from 'next/link'
import { CheckCircle2, Sparkles } from 'lucide-react'

import { Button } from '@/components/ui/button'
import { Separator } from '@/components/ui/separator'
import { QCMPlayer, type QCMResult } from '@/components/patterns/qcm-player'
import { ScanUpload } from '@/components/patterns/scan-upload'
import { ExerciseAIToolbar } from '@/components/patterns/exercise-ai-toolbar'
import { AIComprehensionCheck } from '@/components/patterns/ai-comprehension-check'
import { useAuth } from '@/lib/context'
import { useProgress } from '@/lib/hooks/use-progress'
import { trackExerciseCompleted, trackQcmCompleted } from '@/lib/services/analytics-service'
import type { AtomType, CompiledQuiz } from '@/types/content'

interface ActivityClientProps {
  activityId: string
  activityType: AtomType
  moduleId: string
  parcours: string
  quizData: CompiledQuiz | null
  exerciseContent?: string
  lessonContent?: string
  activityTitle?: string
  activityTags?: string[]
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
  lessonContent,
  activityTitle,
  activityTags,
  children,
}: ActivityClientProps) {
  const { userId } = useAuth()
  const { completeExercise, completeQCM, isCompleted, getProgress } = useProgress(userId ?? undefined)
  const [completedInSession, setCompletedInSession] = React.useState(false)
  const [qcmFinished, setQcmFinished] = React.useState(false)

  const activityCompleted = isCompleted(activityId) || completedInSession
  const previousProgress = getProgress(activityId)

  const topicFromTags = activityTags?.[0] ?? activityTitle ?? ''

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
      } catch (e) {
        console.error('Failed to save exercise progress:', e)
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
      } catch (e) {
        console.error('Failed to save QCM progress:', e)
      }
    }
  }

  // For QCM activities — AI remediation is built into QCMPlayer
  if (activityType === 'qcm' && quizData) {
    if (qcmFinished) {
      return (
        <div className="py-8 text-center">
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
        {previousProgress && previousProgress.score !== undefined && previousProgress.total ? (
          <div className="mb-6 rounded-lg border border-success/25 bg-success/10 p-4">
            <p className="text-sm text-success-foreground">
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
        <QCMPlayer qcm={quizData} onComplete={handleQCMComplete} showExit={false} />
      </div>
    )
  }

  // For exercises — compact AI toolbar + scan
  if (activityType === 'exercise') {
    return (
      <>
        {children}

        {/* Integrated AI toolbar */}
        <Separator className="my-8" />
        <div className="space-y-3">
          <h3 className="flex items-center gap-2 text-sm font-medium text-muted-foreground">
            <Sparkles className="h-4 w-4 text-primary" />
            Outils IA
          </h3>
          <ExerciseAIToolbar
            exerciseContent={exerciseContent ?? ''}
            topic={topicFromTags}
          />
        </div>

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

  // For lessons — content + comprehension check at end
  return (
    <>
      {children}

      {/* Comprehension check at end of lesson */}
      <Separator className="my-8" />
      <AIComprehensionCheck
        lessonContent={lessonContent ?? ''}
        title={activityTitle ?? 'Leçon'}
      />
    </>
  )
}
