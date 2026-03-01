/**
 * Serie Player Page
 *
 * Pre-resolves all activities and passes pre-compiled content to the client player.
 */

import { notFound } from 'next/navigation'

import { getSerie, getSerieActivities } from '@/lib/content-loader'
import { compileSerieActivities } from '@/lib/content-helpers'
import { SeriePlayer } from '@/components/patterns/serie-player'

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
  const compiledActivities = compileSerieActivities(activities)

  return (
    <SeriePlayer
      serieSlug={id}
      serieTitle={serie.title}
      activities={compiledActivities}
      baseUrl={`/${parcours}/serie/${id}`}
    />
  )
}
