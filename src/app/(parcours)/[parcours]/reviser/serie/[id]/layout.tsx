/**
 * Serie Layout (Split View)
 *
 * Provides split view structure for serie pages.
 * Timeline sidebar + content area.
 */

import { notFound } from 'next/navigation'

import { getSerie, getSerieActivities } from '@/lib/content-loader'
import { TimelineWrapper } from '@/components/timeline-wrapper'

interface LayoutProps {
  children: React.ReactNode
  params: Promise<{ parcours: string; id: string }>
}

export default async function SerieLayout({ children, params }: LayoutProps) {
  const { parcours, id } = await params

  let serie
  try {
    serie = getSerie(id)
  } catch {
    notFound()
  }

  const activities = getSerieActivities(id)

  return (
    <div className="flex h-[calc(100svh-3.5rem)]">
      <TimelineWrapper
        slug={serie.slug}
        title={serie.title}
        description={serie.description}
        estimatedMinutes={serie.estimatedMinutes}
        activities={activities}
        baseUrl={`/${parcours}/reviser/serie/${id}`}
        difficulty={serie.difficulty}
      />
      <div className="flex-1 overflow-auto">{children}</div>
    </div>
  )
}
