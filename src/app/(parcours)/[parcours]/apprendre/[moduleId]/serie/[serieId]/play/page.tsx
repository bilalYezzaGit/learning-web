/**
 * Module Serie Player Page
 *
 * Server Component that pre-resolves all activities and passes
 * pre-compiled content to the interactive client player.
 * Module context: URLs point back to the module.
 */

import { notFound } from 'next/navigation'

import { getSerie, getSerieActivities, getCompiledQuiz, getAtomHtml } from '@/lib/content-loader'
import type { CompiledQuiz } from '@/types/content'
import { SeriePlayer } from '@/components/patterns/serie-player'

interface PageProps {
  params: Promise<{ parcours: string; moduleId: string; serieId: string }>
}

export default async function ModuleSeriePlayPage({ params }: PageProps) {
  const { parcours, moduleId, serieId } = await params

  let serie
  try {
    serie = getSerie(serieId)
  } catch {
    notFound()
  }

  const activities = getSerieActivities(serieId)

  // Pre-load all activity content
  const compiledActivities = activities.map((activity) => {
    if (activity.type === 'qcm' && activity.quizAtomIds) {
      // Quiz: read pre-compiled data
      const quiz = getCompiledQuiz(activity.quizAtomIds)
      return {
        id: activity.id,
        type: activity.type,
        title: activity.title,
        timeMinutes: activity.timeMinutes,
        quiz,
        htmlContent: null as string | null,
      }
    } else {
      // Lesson or exercise: read pre-compiled HTML
      const htmlContent = getAtomHtml(activity.id)
      return {
        id: activity.id,
        type: activity.type,
        title: activity.title,
        timeMinutes: activity.timeMinutes,
        quiz: null as CompiledQuiz | null,
        htmlContent,
      }
    }
  })

  return (
    <SeriePlayer
      serieSlug={serieId}
      serieTitle={serie.title}
      activities={compiledActivities}
      baseUrl={`/${parcours}/apprendre/${moduleId}/serie/${serieId}`}
    />
  )
}
