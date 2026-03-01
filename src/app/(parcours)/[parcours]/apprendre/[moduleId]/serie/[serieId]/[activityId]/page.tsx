/**
 * Module Serie Activity Page
 *
 * Server Component that renders a single activity within the module serie layout.
 * Reads pre-compiled HTML/JSON from generated content.
 */

import Link from 'next/link'
import { notFound } from 'next/navigation'
import { ArrowLeft, ArrowRight, CheckCircle } from 'lucide-react'

import { Button } from '@/components/ui/button'
import { Badge } from '@/components/ui/badge'
import { PageNav } from '@/app/(parcours)/_components/page-nav'
import { getSerie, getSerieActivities, getCours, findSerieQuizGroup, getCompiledQuiz, getAtomHtml } from '@/lib/content-loader'
import { ContentRenderer } from '@/app/(parcours)/_components/content-renderer'
import { getAtomTypeLabel } from '@/types/content'
import { ActivityClient } from '@/app/(parcours)/_components/activity-client'

interface PageProps {
  params: Promise<{ parcours: string; moduleId: string; serieId: string; activityId: string }>
}

export default async function ModuleSerieActivityPage({ params }: PageProps) {
  const { parcours, moduleId, serieId, activityId } = await params

  let serie
  try {
    serie = getSerie(serieId)
  } catch {
    notFound()
  }

  let activities
  try {
    activities = getSerieActivities(serieId)
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

  const baseUrl = `/${parcours}/apprendre/${moduleId}/serie/${serieId}`

  // Render content
  let htmlContent: string | null = null
  let quizData = null

  if (currentActivity.type === 'qcm') {
    const quizAtomIds = currentActivity.quizAtomIds ?? findSerieQuizGroup(serieId, activityId) ?? [activityId]
    quizData = getCompiledQuiz(quizAtomIds)
  } else {
    htmlContent = getAtomHtml(activityId)
  }

  let coursTitle = moduleId
  try {
    coursTitle = getCours(moduleId).title
  } catch { /* fallback to moduleId */ }

  return (
    <div className="flex h-full flex-col">
      <PageNav
        items={[
          { label: 'Accueil', href: `/${parcours}` },
          { label: coursTitle, href: `/${parcours}/apprendre/${moduleId}` },
          { label: serie.title, href: baseUrl },
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
            contextId={serieId}
            quizData={quizData}
            exitUrl={baseUrl}
          >
            {htmlContent && <ContentRenderer html={htmlContent} />}
          </ActivityClient>
        </div>
      </div>

      {/* Navigation Footer */}
      <footer className="flex items-center justify-between border-t px-4 py-3 lg:px-6">
        {prevActivity ? (
          <Button variant="outline" asChild>
            <Link href={`${baseUrl}/${prevActivity.id}`}>
              <ArrowLeft className="mr-2 h-4 w-4" aria-hidden="true" />
              Precedent
            </Link>
          </Button>
        ) : (
          <div />
        )}

        {isLast ? (
          <Button asChild>
            <Link href={`${baseUrl}/result`}>
              Terminer
              <CheckCircle className="ml-2 h-4 w-4" aria-hidden="true" />
            </Link>
          </Button>
        ) : nextActivity ? (
          <Button asChild>
            <Link href={`${baseUrl}/${nextActivity.id}`}>
              Suivant
              <ArrowRight className="ml-2 h-4 w-4" aria-hidden="true" />
            </Link>
          </Button>
        ) : null}
      </footer>
    </div>
  )
}
