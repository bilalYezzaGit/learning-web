/**
 * Serie Activity Page
 *
 * Server Component that renders a single activity within the serie layout.
 * Reads pre-compiled HTML/JSON from generated content.
 */

import Link from 'next/link'
import { notFound } from 'next/navigation'
import { ArrowLeft, ArrowRight, CheckCircle } from 'lucide-react'

import { Button } from '@/components/ui/button'
import { Badge } from '@/components/ui/badge'
import { getSerieActivities, findSerieQuizGroup, getCompiledQuiz, getAtomHtml } from '@/lib/content-loader'
import { ContentRenderer } from '@/components/content/content-renderer'
import { getAtomTypeLabel } from '@/types/content'
import { ActivityClient } from '@/components/patterns/activity-client'

interface PageProps {
  params: Promise<{ parcours: string; id: string; activityId: string }>
}

export default async function SerieActivityPage({ params }: PageProps) {
  const { parcours, id, activityId } = await params

  let activities
  try {
    activities = getSerieActivities(id)
  } catch {
    notFound()
  }

  const currentIndex = activities.findIndex((a) => a.id === activityId)
  if (currentIndex === -1) {
    notFound()
  }

  const currentActivity = activities[currentIndex]!
  const isFirst = currentIndex === 0
  const isLast = currentIndex === activities.length - 1
  const prevActivity = !isFirst ? activities[currentIndex - 1] : null
  const nextActivity = !isLast ? activities[currentIndex + 1] : null

  // Render content
  let htmlContent: string | null = null
  let quizData = null

  if (currentActivity.type === 'qcm') {
    const quizAtomIds = currentActivity.quizAtomIds ?? findSerieQuizGroup(id, activityId) ?? [activityId]
    quizData = getCompiledQuiz(quizAtomIds)
  } else {
    htmlContent = getAtomHtml(activityId)
  }

  return (
    <div className="flex h-full flex-col">
      {/* Activity Header */}
      <div className="border-b px-4 py-3 lg:px-6">
        <div className="flex items-center gap-2">
          <Badge variant="outline" className="text-xs capitalize">
            {getAtomTypeLabel(currentActivity.type)}
          </Badge>
          <span className="text-xs text-muted-foreground">
            {currentIndex + 1} / {activities.length}
          </span>
        </div>
        <h1 className="mt-1 font-medium">{currentActivity.title}</h1>
      </div>

      {/* Content */}
      <div className="flex-1 overflow-auto">
        <div className="mx-auto max-w-3xl px-4 py-6 lg:px-6">
          <ActivityClient
            activityId={activityId}
            activityType={currentActivity.type}
            contextType="serie"
            contextId={id}
            quizData={quizData}
            exitUrl={`/${parcours}/reviser/serie/${id}`}
          >
            {htmlContent && <ContentRenderer html={htmlContent} />}
          </ActivityClient>
        </div>
      </div>

      {/* Navigation Footer */}
      <footer className="flex items-center justify-between border-t px-4 py-3 lg:px-6">
        {prevActivity ? (
          <Button variant="outline" asChild>
            <Link href={`/${parcours}/reviser/serie/${id}/${prevActivity.id}`}>
              <ArrowLeft className="mr-2 h-4 w-4" />
              Précédent
            </Link>
          </Button>
        ) : (
          <div />
        )}

        {isLast ? (
          <Button asChild>
            <Link href={`/${parcours}/reviser/serie/${id}/result`}>
              Terminer
              <CheckCircle className="ml-2 h-4 w-4" />
            </Link>
          </Button>
        ) : nextActivity ? (
          <Button asChild>
            <Link href={`/${parcours}/reviser/serie/${id}/${nextActivity.id}`}>
              Suivant
              <ArrowRight className="ml-2 h-4 w-4" />
            </Link>
          </Button>
        ) : null}
      </footer>
    </div>
  )
}
