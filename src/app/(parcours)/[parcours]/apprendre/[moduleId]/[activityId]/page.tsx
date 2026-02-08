/**
 * Activity Content Page
 *
 * Shows activity content with navigation and progress tracking.
 * Uses compileMdx for lessons/exercises, QCMPlayer for quizzes.
 */

import Link from 'next/link'
import { notFound } from 'next/navigation'
import { ArrowLeft, ArrowRight, ChevronLeft } from 'lucide-react'

import { Button } from '@/components/ui/button'
import { Badge } from '@/components/ui/badge'
import { compileMdx } from '@/lib/mdx'
import { getAtom, resolveCoursActivities, findQuizGroup, compileQuiz } from '@/lib/content'
import { getAtomTypeLabel } from '@/types/content'
import { ActivityClient } from './activity-client'

interface PageProps {
  params: Promise<{ parcours: string; moduleId: string; activityId: string }>
}

export default async function ActivityPage({ params }: PageProps) {
  const { parcours, moduleId, activityId } = await params

  // Resolve the ordered activity list for navigation
  let activities
  try {
    activities = resolveCoursActivities(moduleId)
  } catch {
    notFound()
  }

  // Find current activity in the resolved list
  const currentIndex = activities.findIndex((a) => a.id === activityId)
  if (currentIndex === -1) {
    notFound()
  }

  const currentActivity = activities[currentIndex]!
  const prevActivity = currentIndex > 0 ? activities[currentIndex - 1] : null
  const nextActivity = currentIndex < activities.length - 1 ? activities[currentIndex + 1] : null

  // Render content based on type
  let content: React.ReactNode = null
  let quizData = null

  if (currentActivity.type === 'qcm') {
    // Quiz group: compile all QCM atoms
    const quizAtomIds = currentActivity.quizAtomIds ?? findQuizGroup(moduleId, activityId) ?? [activityId]
    quizData = await compileQuiz(quizAtomIds)
  } else {
    // Lesson or exercise: compile MDX
    const atom = getAtom(activityId)
    content = await compileMdx(atom.content)
  }

  return (
    <div className="flex h-full flex-col">
      {/* Header - Mobile back button + title */}
      <header className="flex items-center gap-4 border-b px-4 py-3 md:border-b-0">
        <Button variant="ghost" size="icon" className="md:hidden" asChild>
          <Link href={`/${parcours}/apprendre/${moduleId}`}>
            <ChevronLeft className="h-5 w-5" />
            <span className="sr-only">Retour au module</span>
          </Link>
        </Button>
        <div className="min-w-0 flex-1">
          <h1 className="truncate font-medium">{currentActivity.title}</h1>
          <Badge variant="outline" className="mt-1 text-xs capitalize">
            {getAtomTypeLabel(currentActivity.type)}
          </Badge>
        </div>
      </header>

      {/* Content */}
      <div className="flex-1 overflow-auto">
        <div className="mx-auto max-w-3xl px-4 py-6">
          <ActivityClient
            activityId={activityId}
            activityType={currentActivity.type}
            moduleId={moduleId}
            parcours={parcours}
            quizData={quizData}
          >
            {content && (
              <article className="prose prose-stone dark:prose-invert max-w-none">
                {content}
              </article>
            )}
          </ActivityClient>
        </div>
      </div>

      {/* Navigation Footer */}
      <footer className="flex items-center justify-between border-t px-4 py-3">
        {prevActivity ? (
          <Button variant="outline" asChild>
            <Link href={`/${parcours}/apprendre/${moduleId}/${prevActivity.id}`}>
              <ArrowLeft className="mr-2 h-4 w-4" />
              Précédent
            </Link>
          </Button>
        ) : (
          <div />
        )}

        {nextActivity ? (
          <Button asChild>
            <Link href={`/${parcours}/apprendre/${moduleId}/${nextActivity.id}`}>
              Suivant
              <ArrowRight className="ml-2 h-4 w-4" />
            </Link>
          </Button>
        ) : (
          <Button asChild>
            <Link href={`/${parcours}/apprendre/${moduleId}`}>Terminer</Link>
          </Button>
        )}
      </footer>
    </div>
  )
}
