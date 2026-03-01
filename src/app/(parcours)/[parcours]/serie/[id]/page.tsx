/**
 * Serie Detail Page — Welcome screen
 */

import type { Metadata } from 'next'
import { notFound } from 'next/navigation'

import { PageNav } from '@/components/page-nav'
import { getSerie, getSerieActivities } from '@/lib/content-loader'
import { SerieWelcome } from '@/components/patterns/serie-welcome'

interface PageProps {
  params: Promise<{ parcours: string; id: string }>
}

export async function generateMetadata({ params }: PageProps): Promise<Metadata> {
  const { id } = await params
  try {
    const serie = getSerie(id)
    return {
      title: serie.title,
      description: serie.description ?? `Serie de revision — ${serie.title}`,
    }
  } catch {
    return { title: 'Serie' }
  }
}

export default async function SerieDetailPage({ params }: PageProps) {
  const { parcours, id } = await params

  let serie
  try {
    serie = getSerie(id)
  } catch {
    notFound()
  }

  const activities = getSerieActivities(id)

  return (
    <div className="flex h-full flex-col">
      <PageNav
        items={[{ label: 'Accueil', href: `/${parcours}` }]}
        current={serie.title}
      />
      <SerieWelcome
        title={serie.title}
        description={serie.description}
        activityCount={activities.length}
        estimatedMinutes={serie.estimatedMinutes}
        playUrl={`/${parcours}/serie/${id}/play`}
      />
    </div>
  )
}
