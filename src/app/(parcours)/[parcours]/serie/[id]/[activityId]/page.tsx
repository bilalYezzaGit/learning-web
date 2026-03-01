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
import { PageNav } from '@/app/(parcours)/_components/page-nav'
import { getSerie, getSerieActivities, findSerieQuizGroup, getCompiledQuiz, getAtomHtml } from '@/lib/content-loader'
import { ContentRenderer } from '@/app/(parcours)/_components/content-renderer'
import { getAtomTypeLabel } from '@/types/content'
import { ActivityClient } from '@/app/(parcours)/_components/activity-client'

interface PageProps {
  params: Promise<{ parcours: string; id: string; activityId: string }>
}

export default async function SerieActivityPage({ params }: PageProps) {
  const { parcours, id, activityId } = await params

  let serie
  try {
    serie = getSerie(id)
  } catch {
    notFound()
  }

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
      <PageNav
        items={[
          { label: 'Accueil', href: `/${parcours}` },
          { label: serie.title, href: `/${parcours}/serie/${id}` },
        ]}
        current={currentActivity.title}
        compact
      />

      {/* Activity subheader */}
      <div className="border-b px-4 py-2 lg:px-6">
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
            exitUrl={`/${parcours}/serie/${id}`}
          >
            {htmlContent && <ContentRenderer html={htmlContent} />}
          </ActivityClient>
        </div>
      </div>

      {/* Navigation Footer */}
      <footer className="flex items-center justify-between border-t px-4 py-3 lg:px-6">
        {prevActivity ? (
          <Button variant="outline" asChild>
            <Link href={`/${parcours}/serie/${id}/${prevActivity.id}`}>
              <ArrowLeft className="mr-2 h-4 w-4" />
              Precedent
            </Link>
          </Button>
        ) : (
          <div />
        )}

        {isLast ? (
          <Button asChild>
            <Link href={`/${parcours}/serie/${id}/result`}>
              Terminer
              <CheckCircle className="ml-2 h-4 w-4" />
            </Link>
          </Button>
        ) : nextActivity ? (
          <Button asChild>
            <Link href={`/${parcours}/serie/${id}/${nextActivity.id}`}>
              Suivant
              <ArrowRight className="ml-2 h-4 w-4" />
            </Link>
          </Button>
        ) : null}
      </footer>
    </div>
  )
}
