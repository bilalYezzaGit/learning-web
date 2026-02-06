/**
 * Module Layout (Split View)
 *
 * Provides split view structure for module and activity pages.
 * Desktop: sidebar with timeline + content area
 * Mobile: collapsible sidebar overlay
 */

import { notFound } from 'next/navigation'

import { getCours, resolveCoursActivities } from '@/lib/content'
import { CourseTimelineWrapper } from './course-timeline-wrapper'

interface LayoutProps {
  children: React.ReactNode
  params: Promise<{ parcours: string; moduleId: string }>
}

export default async function ModuleLayout({ children, params }: LayoutProps) {
  const { moduleId } = await params

  let cours
  try {
    cours = getCours(moduleId)
  } catch {
    notFound()
  }

  const activities = resolveCoursActivities(moduleId)
  const sections = cours.sections.map((s, i) => ({
    id: `section-${i}`,
    label: s.label,
    order: i,
  }))

  return (
    <div className="flex flex-1 min-h-0 overflow-hidden">
      {/* Course Timeline Sidebar */}
      <CourseTimelineWrapper
        coursSlug={cours.slug}
        title={cours.title}
        description={cours.description}
        estimatedMinutes={cours.estimatedMinutes}
        objectives={cours.objectives}
        activities={activities}
        sections={sections}
      />

      {/* Content Area */}
      <main id="main-content" className="flex-1 overflow-auto">{children}</main>
    </div>
  )
}
