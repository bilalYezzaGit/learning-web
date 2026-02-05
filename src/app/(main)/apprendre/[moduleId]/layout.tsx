/**
 * Module Layout (Split View)
 *
 * Provides split view structure for module and activity pages.
 * Desktop: sidebar with activities list + content area
 * Mobile: just renders children (full page navigation)
 */

import Link from 'next/link'
import { notFound } from 'next/navigation'
import { BookOpen, CheckCircle2, ChevronRight, Target } from 'lucide-react'

import { Progress } from '@/components/ui/progress'
import { fetchModule, ContentNotFoundError } from '@/lib/services/content-service'
import { ActivityListClient } from './activity-list-client'

interface LayoutProps {
  children: React.ReactNode
  params: Promise<{ moduleId: string }>
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

  // Use coursePath for ordered activities, fallback to all activities
  const orderedActivityIds = module.coursePath || []
  const activitiesMap = new Map(module.activities.map((a) => [a.id, a]))

  // Get activities in coursePath order, then append any not in coursePath
  const orderedActivities = [
    ...orderedActivityIds
      .map((id) => activitiesMap.get(id))
      .filter((a): a is NonNullable<typeof a> => a !== undefined),
    ...module.activities.filter((a) => !orderedActivityIds.includes(a.id)),
  ]

  return (
    <div className="flex h-[calc(100vh-3.5rem)] flex-col md:flex-row">
      {/* Activity List (Left Panel) - Hidden on mobile when viewing activity */}
      <div className="hidden w-80 flex-shrink-0 border-r md:block lg:w-96">
        <div className="flex h-full flex-col">
          <div className="p-4">
            {/* Module Header */}
            <Link href={`/apprendre/${moduleId}`} className="block">
              <h1 className="font-serif text-xl font-semibold hover:text-primary">
                {module.title}
              </h1>
            </Link>
            <p className="mt-1 text-sm text-muted-foreground line-clamp-2">
              {module.description}
            </p>

            {/* Module Objectives */}
            {module.objectives && module.objectives.length > 0 && (
              <div className="mt-3">
                <div className="flex items-center gap-1.5 text-xs font-medium text-muted-foreground">
                  <Target className="h-3.5 w-3.5" />
                  Objectifs
                </div>
                <ul className="mt-1.5 space-y-1">
                  {module.objectives.slice(0, 3).map((objective, i) => (
                    <li key={i} className="flex items-start gap-1.5 text-xs text-muted-foreground">
                      <CheckCircle2 className="mt-0.5 h-3 w-3 shrink-0 text-green-600" />
                      <span className="line-clamp-1">{objective}</span>
                    </li>
                  ))}
                  {module.objectives.length > 3 && (
                    <li className="text-xs text-muted-foreground/70">
                      +{module.objectives.length - 3} autres
                    </li>
                  )}
                </ul>
              </div>
            )}

            {/* Progress - placeholder, needs user progress data */}
            <div className="mt-4">
              <div className="mb-1 flex justify-between text-sm">
                <span>Progression</span>
                <span className="text-muted-foreground">0%</span>
              </div>
              <Progress value={0} />
            </div>
          </div>

          {/* Activity List */}
          <nav className="flex-1 overflow-auto border-t">
            {orderedActivities.length === 0 ? (
              <div className="p-4 text-center text-muted-foreground">
                <BookOpen className="mx-auto mb-2 h-8 w-8 opacity-50" />
                <p className="text-sm">Aucune activité disponible</p>
              </div>
            ) : (
              <ActivityListClient
                moduleId={moduleId}
                activities={orderedActivities.map((a, index) => ({
                  id: a.id,
                  title: a.title,
                  type: a.type,
                  index: index + 1,
                }))}
              />
            )}
          </nav>
        </div>
      </div>

      {/* Content Area (Right Panel) */}
      <div className="flex-1 overflow-auto">
        {children}
      </div>
    </div>
  )
}
