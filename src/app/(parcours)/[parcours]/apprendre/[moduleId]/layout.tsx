/**
 * Module Layout (Split View)
 *
 * Provides split view structure for module and activity pages.
 * Desktop: sidebar with timeline + content area
 * Mobile: collapsible sidebar overlay
 */

import { notFound } from 'next/navigation'

import { fetchModule, ContentNotFoundError } from '@/lib/services/content-service'
import { CourseTimelineWrapper } from './course-timeline-wrapper'

interface LayoutProps {
  children: React.ReactNode
  params: Promise<{ parcours: string; moduleId: string }>
}

export default async function ModuleLayout({ children, params }: LayoutProps) {
  const { moduleId } = await params

  let module
  try {
    module = await fetchModule(moduleId)
  } catch (e) {
    if (e instanceof ContentNotFoundError) {
      notFound()
    }
    throw e
  }

  return (
    <div className="flex h-[calc(100vh-3.5rem)]">
      {/* Course Timeline Sidebar */}
      <CourseTimelineWrapper module={module} />

      {/* Content Area */}
      <main className="flex-1 overflow-auto">{children}</main>
    </div>
  )
}
