'use client'

/**
 * Activity List Client Component
 *
 * Renders activity list with:
 * - Active state highlighting based on current URL
 * - Progress indicators (completed/retry status)
 */

import Link from 'next/link'
import { usePathname } from 'next/navigation'
import { Check, ChevronRight, RotateCcw } from 'lucide-react'

import { Badge } from '@/components/ui/badge'
import { useAuth } from '@/lib/context'
import { useProgress } from '@/lib/hooks/use-progress'

interface ActivityItem {
  id: string
  title: string
  type: 'lesson' | 'exercise' | 'qcm'
  index: number
}

interface ActivityListClientProps {
  moduleId: string
  activities: ActivityItem[]
}

function getTypeLabel(type: ActivityItem['type']): string {
  switch (type) {
    case 'lesson':
      return 'Cours'
    case 'exercise':
      return 'Exercice'
    case 'qcm':
      return 'QCM'
  }
}

export function ActivityListClient({ moduleId, activities }: ActivityListClientProps) {
  const pathname = usePathname()
  const { userId } = useAuth()
  const { isCompleted, isSuccess, getProgress } = useProgress(userId ?? undefined)

  return (
    <>
      {activities.map((activity) => {
        const href = `/apprendre/${moduleId}/${activity.id}`
        const isActive = pathname === href
        const completed = isCompleted(activity.id)
        const success = isSuccess(activity.id)
        const progress = getProgress(activity.id)

        return (
          <Link
            key={activity.id}
            href={href}
            className={`flex items-center gap-3 border-b px-4 py-3 transition-colors hover:bg-muted/50 ${
              isActive ? 'border-l-2 border-l-primary bg-primary/5' : ''
            }`}
          >
            {/* Status indicator */}
            <div
              className={`flex h-6 w-6 items-center justify-center rounded-full text-xs font-medium ${
                completed
                  ? success
                    ? 'bg-green-500 text-white'
                    : 'bg-orange-500 text-white'
                  : isActive
                    ? 'bg-primary text-primary-foreground'
                    : 'bg-muted'
              }`}
            >
              {completed ? (
                success ? (
                  <Check className="h-3.5 w-3.5" />
                ) : (
                  <RotateCcw className="h-3.5 w-3.5" />
                )
              ) : (
                activity.index
              )}
            </div>

            {/* Activity info */}
            <div className="min-w-0 flex-1">
              <p className={`truncate text-sm font-medium ${isActive ? 'text-primary' : ''}`}>
                {activity.title}
              </p>
              <div className="mt-1 flex items-center gap-2">
                <Badge variant="outline" className="text-xs">
                  {getTypeLabel(activity.type)}
                </Badge>
                {/* Show score for QCMs */}
                {completed && activity.type === 'qcm' && progress?.score !== undefined && progress.total && (
                  <span className={`text-xs ${success ? 'text-green-600' : 'text-orange-600'}`}>
                    {progress.score}/{progress.total}
                  </span>
                )}
              </div>
            </div>

            <ChevronRight
              className={`h-4 w-4 ${isActive ? 'text-primary' : 'text-muted-foreground'}`}
            />
          </Link>
        )
      })}
    </>
  )
}
