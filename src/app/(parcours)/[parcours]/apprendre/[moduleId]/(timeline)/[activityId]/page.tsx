/**
 * Activity Content Page
 *
 * Shows activity content with navigation and progress tracking.
 * Reads pre-compiled HTML/JSON from generated content.
 */

import type { Metadata } from 'next'
import Link from 'next/link'
import { notFound } from 'next/navigation'
import { ArrowLeft, ArrowRight } from 'lucide-react'

import { Button } from '@/components/ui/button'
import {
  Breadcrumb,
  BreadcrumbItem,
  BreadcrumbLink,
  BreadcrumbList,
  BreadcrumbPage,
  BreadcrumbSeparator,
} from '@/components/ui/breadcrumb'
import { getCoursActivities, getCours, findQuizGroup, getCompiledQuiz, getAtomHtml } from '@/lib/content-loader'
import { ContentRenderer } from '@/components/content/content-renderer'
import { ActivityClient } from '@/components/patterns/activity-client'
import { ActivityHeader } from './activity-header'

interface PageProps {
  params: Promise<{ parcours: string; moduleId: string; activityId: string }>
}

export async function generateMetadata({ params }: PageProps): Promise<Metadata> {
  const { moduleId, activityId } = await params
  try {
    const activities = getCoursActivities(moduleId)
    const activity = activities.find(a => a.id === activityId)
    if (!activity) return { title: 'Activité' }
    return {
      title: activity.title,
      description: `${activity.type === 'lesson' ? 'Cours' : activity.type === 'exercise' ? 'Exercice' : 'QCM'} — ${activity.title}`,
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
    activities = getCoursActivities(moduleId)
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
  let htmlContent: string | null = null
  let quizData = null

  if (currentActivity.type === 'qcm') {
    // Quiz group: read pre-compiled QCM data
    const quizAtomIds = currentActivity.quizAtomIds ?? findQuizGroup(moduleId, activityId) ?? [activityId]
    quizData = getCompiledQuiz(quizAtomIds)
  } else {
    // Lesson or exercise: read pre-compiled HTML
    htmlContent = getAtomHtml(activityId)
  }

  let coursTitle = moduleId
  try {
    coursTitle = getCours(moduleId).title
  } catch { /* fallback to moduleId */ }

  return (
    <div className="flex h-full flex-col">
      {/* Breadcrumb — desktop only (mobile has ActivityHeader) */}
      <div className="hidden border-b px-4 py-3 lg:block lg:px-6">
        <Breadcrumb>
          <BreadcrumbList>
            <BreadcrumbItem>
              <BreadcrumbLink href={`/${parcours}`}>Accueil</BreadcrumbLink>
            </BreadcrumbItem>
            <BreadcrumbSeparator />
            <BreadcrumbItem>
              <BreadcrumbLink href={`/${parcours}/apprendre/${moduleId}`}>{coursTitle}</BreadcrumbLink>
            </BreadcrumbItem>
            <BreadcrumbSeparator />
            <BreadcrumbItem>
              <BreadcrumbPage>{currentActivity.title}</BreadcrumbPage>
            </BreadcrumbItem>
          </BreadcrumbList>
        </Breadcrumb>
      </div>

      {/* Slim mobile header with timeline toggle — hidden on desktop */}
      <ActivityHeader title={currentActivity.title} type={currentActivity.type} />

      {/* Content */}
      <div className="flex-1 overflow-auto">
        <div className="mx-auto max-w-3xl px-4 py-4 lg:py-6">
          <ActivityClient
            activityId={activityId}
            activityType={currentActivity.type}
            contextType="module"
            contextId={moduleId}
            quizData={quizData}
            exerciseContent={htmlContent ?? undefined}
          >
            {htmlContent && <ContentRenderer html={htmlContent} />}
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
