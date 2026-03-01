/**
 * Module Serie Detail Page — Welcome screen
 */

import type { Metadata } from 'next'
import { notFound } from 'next/navigation'

import { PageNav } from '@/components/page-nav'
import { getSerie, getSerieActivities, getCours } from '@/lib/content-loader'
import { SerieWelcome } from '@/components/patterns/serie-welcome'

interface PageProps {
  params: Promise<{ parcours: string; moduleId: string; serieId: string }>
}

export async function generateMetadata({ params }: PageProps): Promise<Metadata> {
  const { serieId } = await params
  try {
    const serie = getSerie(serieId)
    return {
      title: serie.title,
      description: serie.description ?? `Serie — ${serie.title}`,
    }
  } catch {
    return { title: 'Serie' }
  }
}

export default async function ModuleSerieDetailPage({ params }: PageProps) {
  const { parcours, moduleId, serieId } = await params

  let serie
  try {
    serie = getSerie(serieId)
  } catch {
    notFound()
  }

  const activities = getSerieActivities(serieId)

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
        ]}
        current={serie.title}
        compact
      />
      <SerieWelcome
        title={serie.title}
        description={serie.description}
        activityCount={activities.length}
        estimatedMinutes={serie.estimatedMinutes}
        playUrl={`/${parcours}/apprendre/${moduleId}/serie/${serieId}/play`}
      />
    </div>
  )
}
