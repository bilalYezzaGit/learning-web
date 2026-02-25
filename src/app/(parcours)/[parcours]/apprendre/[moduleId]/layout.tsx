/**
 * Module Layout (Split View)
 *
 * Provides split view structure for module and activity pages.
 * Desktop: sidebar with timeline + content area
 * Mobile: collapsible sidebar overlay
 */

import { notFound } from 'next/navigation'

import { getCours, getCoursActivities } from '@/lib/content-loader'
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

  const activities = getCoursActivities(moduleId)
  const sections = cours.sections.map((s, i) => ({
    id: s.id,
    label: s.label,
    order: i,
  }))

  return (
    <div className="-my-4 md:-my-6 flex flex-1 min-h-0 overflow-hidden">
      <CourseTimelineWrapper
        coursSlug={cours.slug}
        title={cours.title}
        description={cours.description}
        estimatedMinutes={cours.estimatedMinutes}
        objectives={cours.objectives}
        activities={activities}
        sections={sections}
      >
        <div className="flex-1 min-w-0 overflow-auto">{children}</div>
      </CourseTimelineWrapper>
    </div>
  )
}
