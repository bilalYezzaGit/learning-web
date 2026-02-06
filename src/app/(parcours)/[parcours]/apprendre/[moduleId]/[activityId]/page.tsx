/**
 * Activity Content Page
 *
 * Shows activity content with navigation and progress tracking.
 * Uses ContentRenderer for HTML with custom extensions.
 * Server Component with client wrapper for interactivity.
 */

import Link from 'next/link'
import { notFound } from 'next/navigation'
import { ArrowLeft, ArrowRight, ChevronLeft } from 'lucide-react'

import { Button } from '@/components/ui/button'
import { Badge } from '@/components/ui/badge'
import { ContentRenderer } from '@/content'
import { ExerciseContent, getActivityTypeLabel } from '@/components/patterns/activity-content'
import { fetchModule, ContentNotFoundError } from '@/lib/services/content-service'
import type { Activity } from '@/types/activity'
import { ActivityClient } from './activity-client'

interface PageProps {
  params: Promise<{ parcours: string; moduleId: string; activityId: string }>
}

export default async function ActivityPage({ params }: PageProps) {
  const { parcours, moduleId, activityId } = await params

  // Fetch module (which contains activities)
  let module
  try {
    module = await fetchModule(moduleId)
  } catch (e) {
    if (e instanceof ContentNotFoundError) {
      notFound()
    }
    throw e
  }

  // Find activity in module
  const activity = module.activities.find((a) => a.id === activityId)
  if (!activity) {
    notFound()
  }

  // Build ordered activities list using coursePath
  const orderedActivityIds = module.coursePath || []
  const activitiesMap = new Map(module.activities.map((a) => [a.id, a]))
  const orderedActivities = [
    ...orderedActivityIds
      .map((id) => activitiesMap.get(id))
      .filter((a): a is Activity => a !== undefined),
    ...module.activities.filter((a) => !orderedActivityIds.includes(a.id)),
  ]

  // Find current index and prev/next
  const currentIndex = orderedActivities.findIndex((a) => a.id === activityId)
  const prevActivity = currentIndex > 0 ? orderedActivities[currentIndex - 1] : null
  const nextActivity =
    currentIndex < orderedActivities.length - 1 ? orderedActivities[currentIndex + 1] : null

  // Render content based on type (for server rendering)
  const renderContent = () => {
    switch (activity.type) {
      case 'lesson':
        return <ContentRenderer html={activity.body} />
      case 'exercise':
        return <ExerciseContent exercise={activity} />
      case 'qcm':
        // QCM is handled entirely by ActivityClient
        return null
    }
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
          <h1 className="truncate font-medium">{activity.title}</h1>
          <Badge variant="outline" className="mt-1 text-xs capitalize">
            {getActivityTypeLabel(activity.type)}
          </Badge>
        </div>
      </header>

      {/* Content */}
      <div className="flex-1 overflow-auto">
        <div className="mx-auto max-w-3xl px-4 py-6">
          <ActivityClient activity={activity} moduleId={moduleId} parcours={parcours}>
            {renderContent()}
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
