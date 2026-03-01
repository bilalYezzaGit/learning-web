/**
 * Module Serie Layout (Split View)
 *
 * Provides split view structure for serie pages within a module context.
 * Timeline sidebar + content area.
 */

import { notFound } from 'next/navigation'

import { getSerie, getSerieActivities } from '@/lib/content-loader'
import { TimelineWrapper } from '@/app/(parcours)/_components/timeline-wrapper'

interface LayoutProps {
  children: React.ReactNode
  params: Promise<{ parcours: string; moduleId: string; serieId: string }>
}

export default async function ModuleSerieLayout({ children, params }: LayoutProps) {
  const { parcours, moduleId, serieId } = await params

  let serie
  try {
    serie = getSerie(serieId)
  } catch {
    notFound()
  }

  const activities = getSerieActivities(serieId)

  return (
    <div className="flex flex-1 min-h-0">
      <TimelineWrapper
        slug={serie.slug}
        title={serie.title}
        description={serie.description}
        estimatedMinutes={serie.estimatedMinutes}
        activities={activities}
        baseUrl={`/${parcours}/apprendre/${moduleId}/serie/${serieId}`}
        difficulty={serie.difficulty}
      />
      <div className="flex-1 overflow-auto">{children}</div>
    </div>
  )
}
