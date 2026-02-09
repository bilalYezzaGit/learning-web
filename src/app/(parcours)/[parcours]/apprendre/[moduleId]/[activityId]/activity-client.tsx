'use client'

/**
 * Activity Client Wrapper
 *
 * Handles progress tracking and exercise completion.
 * Wraps server-rendered content with client-side interactivity.
 * Integrates AI features: hints, solution explainer, exercise generator,
 * concept simplifier, summary generator, and floating tutor chat.
 */

import * as React from 'react'
import Link from 'next/link'
import { CheckCircle2, Sparkles } from 'lucide-react'

import { Button } from '@/components/ui/button'
import { Separator } from '@/components/ui/separator'
import { QCMPlayer, type QCMResult } from '@/components/patterns/qcm-player'
import { ScanUpload } from '@/components/patterns/scan-upload'
import { AIHintButton } from '@/components/patterns/ai-hint-button'
import { AISolutionExplainer } from '@/components/patterns/ai-solution-explainer'
import { AIExerciseGenerator } from '@/components/patterns/ai-exercise-generator'
import { AIConceptSimplifier } from '@/components/patterns/ai-concept-simplifier'
import { AISummaryGenerator } from '@/components/patterns/ai-summary-generator'
import { AIFloatingButton } from '@/components/patterns/ai-floating-button'
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
  const [showAITools, setShowAITools] = React.useState(false)

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
          <AIFloatingButton
            context={exerciseContent ?? lessonContent}
            topic={topicFromTags}
          />
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
        <AIFloatingButton
          context={exerciseContent ?? lessonContent}
          topic={topicFromTags}
        />
      </div>
    )
  }

  // For exercises, add AI tools + scan + completion
  if (activityType === 'exercise') {
    return (
      <>
        {children}

        {/* AI Tools Section */}
        <Separator className="my-8" />
        <div className="space-y-4">
          <div className="flex items-center justify-between">
            <h3 className="flex items-center gap-2 text-sm font-medium text-muted-foreground">
              <Sparkles className="h-4 w-4 text-primary" />
              Outils IA
            </h3>
            <Button
              variant="ghost"
              size="sm"
              onClick={() => setShowAITools(!showAITools)}
              className="text-xs"
            >
              {showAITools ? 'Masquer' : 'Afficher tout'}
            </Button>
          </div>

          {/* Hint system — always visible for exercises */}
          <AIHintButton
            activityId={activityId}
            exerciseContent={exerciseContent ?? ''}
          />

          {/* Solution explainer */}
          <AISolutionExplainer
            activityId={activityId}
            exerciseContent={exerciseContent ?? ''}
          />

          {showAITools && (
            <>
              {/* Exercise generator */}
              <AIExerciseGenerator
                originalExercise={exerciseContent ?? ''}
                topic={topicFromTags}
              />
            </>
          )}
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

        {/* Floating AI button */}
        <AIFloatingButton
          context={exerciseContent}
          topic={topicFromTags}
        />
      </>
    )
  }

  // For lessons, show content + AI features for lessons
  return (
    <>
      {children}

      {/* Lesson AI tools */}
      <Separator className="my-8" />
      <div className="space-y-4">
        <h3 className="flex items-center gap-2 text-sm font-medium text-muted-foreground">
          <Sparkles className="h-4 w-4 text-primary" />
          Outils IA pour cette leçon
        </h3>

        {/* Concept simplifier */}
        <AIConceptSimplifier
          concept={activityTitle ?? topicFromTags}
          lessonContent={lessonContent}
        />

        {/* Summary generator */}
        <AISummaryGenerator
          lessonContent={lessonContent ?? ''}
          title={activityTitle ?? 'Leçon'}
        />
      </div>

      {/* Floating AI button */}
      <AIFloatingButton
        context={lessonContent}
        topic={topicFromTags}
      />
    </>
  )
}
