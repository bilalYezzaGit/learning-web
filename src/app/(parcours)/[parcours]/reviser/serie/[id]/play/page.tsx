/**
 * Serie Player Page
 *
 * Server Component that pre-resolves all activities and passes
 * pre-compiled content to the interactive client player.
 */

import { notFound } from 'next/navigation'

import { getSerie, getSerieActivities, getCompiledQuiz, getAtomHtml } from '@/lib/content-loader'
import type { CompiledQuiz } from '@/types/content'
import { SeriePlayer } from './serie-player'

interface PageProps {
  params: Promise<{ parcours: string; id: string }>
}

export default async function SeriePlayPage({ params }: PageProps) {
  const { parcours, id } = await params

  let serie
  try {
    serie = getSerie(id)
  } catch {
    notFound()
  }

  const activities = getSerieActivities(id)

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
      serieSlug={id}
      serieTitle={serie.title}
      activities={compiledActivities}
      parcours={parcours}
    />
  )
}
