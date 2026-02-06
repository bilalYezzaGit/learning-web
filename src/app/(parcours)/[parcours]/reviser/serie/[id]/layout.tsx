/**
 * Serie Layout (Split View)
 *
 * Provides split view structure for serie pages.
 * Timeline sidebar + content area.
 */

import { notFound } from 'next/navigation'

import { fetchSerie, ContentNotFoundError } from '@/lib/services/content-service'
import { SerieTimelineWrapper } from './serie-timeline-wrapper'

interface LayoutProps {
  children: React.ReactNode
  params: Promise<{ parcours: string; id: string }>
}

export default async function SerieLayout({ children, params }: LayoutProps) {
  const { id } = await params

  let serie
  try {
    serie = await fetchSerie(id)
  } catch (e) {
    if (e instanceof ContentNotFoundError) {
      notFound()
    }
    throw e
  }

  return (
    <div className="flex h-[calc(100vh-3.5rem)]">
      {/* Timeline Sidebar */}
      <SerieTimelineWrapper serie={serie} />

      {/* Content Area */}
      <main className="flex-1 overflow-auto">{children}</main>
    </div>
  )
}
