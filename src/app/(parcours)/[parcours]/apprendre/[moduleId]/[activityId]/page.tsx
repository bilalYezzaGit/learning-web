/**
 * Activity Content Page
 *
 * Shows activity content with navigation and progress tracking.
 * Uses compileMdx for lessons/exercises, QCMPlayer for quizzes.
 */

import type { Metadata } from 'next'
import Link from 'next/link'
import { notFound } from 'next/navigation'
import { ArrowLeft, ArrowRight } from 'lucide-react'

import { Button } from '@/components/ui/button'
import { compileMdx } from '@/lib/mdx'
import { getAtom, atomExists, resolveCoursActivities, findQuizGroup, compileQuiz } from '@/lib/content'
import { ActivityClient } from './activity-client'
import { ActivityHeader } from './activity-header'

interface PageProps {
  params: Promise<{ parcours: string; moduleId: string; activityId: string }>
}

export async function generateMetadata({ params }: PageProps): Promise<Metadata> {
  const { activityId } = await params
  try {
    if (!atomExists(activityId)) return { title: 'Activité' }
    const atom = getAtom(activityId)
    return {
      title: atom.title,
      description: `${atom.type === 'lesson' ? 'Cours' : atom.type === 'exercise' ? 'Exercice' : 'QCM'} — ${atom.title}`,
    }
  } catch {
    return { title: 'Activité' }
  }
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
  let exerciseContent: string | undefined

  if (currentActivity.type === 'qcm') {
    // Quiz group: compile all QCM atoms
    const quizAtomIds = currentActivity.quizAtomIds ?? findQuizGroup(moduleId, activityId) ?? [activityId]
    quizData = await compileQuiz(quizAtomIds)
  } else {
    // Lesson or exercise: compile MDX
    const atom = getAtom(activityId)
    content = await compileMdx(atom.content)
    if (currentActivity.type === 'exercise') {
      exerciseContent = atom.content
    }
  }

  return (
    <div className="flex h-full flex-col">
      {/* Slim mobile header with timeline toggle — hidden on desktop */}
      <ActivityHeader title={currentActivity.title} type={currentActivity.type} />

      {/* Content */}
      <div className="flex-1 overflow-auto">
        <div className="mx-auto max-w-3xl px-4 py-4 lg:py-6">
          <ActivityClient
            activityId={activityId}
            activityType={currentActivity.type}
            moduleId={moduleId}
            parcours={parcours}
            quizData={quizData}
            exerciseContent={exerciseContent}
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
