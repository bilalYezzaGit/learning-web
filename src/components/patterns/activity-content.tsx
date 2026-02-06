/**
 * Shared activity sub-components
 *
 * Used by both "apprendre" and "reviser" activity pages.
 */

import { CheckCircle, CheckCircle2, Lightbulb } from 'lucide-react'

import { Button } from '@/components/ui/button'
import { ContentRenderer } from '@/content'
import type { Activity, Exercise } from '@/types/activity'

/**
 * Collapsible section for hints and solutions
 */
export function CollapsibleSection({
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
  const bgColor =
    variant === 'solution'
      ? 'bg-green-50 dark:bg-green-950/20'
      : 'bg-amber-50 dark:bg-amber-950/20'
  const borderColor =
    variant === 'solution'
      ? 'border-green-200 dark:border-green-800'
      : 'border-amber-200 dark:border-amber-800'
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

/**
 * Exercise content with hint, solution, and optional completion button
 */
export function ExerciseContent({
  exercise,
  onComplete,
  isCompleted,
}: {
  exercise: Exercise
  onComplete?: () => void
  isCompleted?: boolean
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

      {onComplete && (
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
      )}
    </>
  )
}

/**
 * Get French label for activity type
 */
export function getActivityTypeLabel(type: Activity['type']): string {
  switch (type) {
    case 'lesson':
      return 'Cours'
    case 'exercise':
      return 'Exercice'
    case 'qcm':
      return 'QCM'
  }
}
