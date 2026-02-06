/**
 * Serie Layout (Split View)
 *
 * Provides split view structure for serie pages.
 * Timeline sidebar + content area.
 */

import { notFound } from 'next/navigation'

import { getSerie, resolveSerieActivities } from '@/lib/content'
import { SerieTimelineWrapper } from './serie-timeline-wrapper'

interface LayoutProps {
  children: React.ReactNode
  params: Promise<{ parcours: string; id: string }>
}

export default async function SerieLayout({ children, params }: LayoutProps) {
  const { id } = await params

  let serie
  try {
    serie = getSerie(id)
  } catch {
    notFound()
  }

  const activities = resolveSerieActivities(id)

  return (
    <div className="flex h-[calc(100vh-3.5rem)]">
      {/* Timeline Sidebar */}
      <SerieTimelineWrapper
        serieSlug={serie.slug}
        title={serie.title}
        description={serie.description}
        estimatedMinutes={serie.estimatedMinutes}
        difficulty={serie.difficulty}
        activities={activities}
      />

      {/* Content Area */}
      <main className="flex-1 overflow-auto">{children}</main>
    </div>
  )
}
