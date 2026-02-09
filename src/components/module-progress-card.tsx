'use client'

import * as React from 'react'
import Link from 'next/link'
import { ChevronRight } from 'lucide-react'

import { Card, CardContent } from '@/components/ui/card'
import { Progress } from '@/components/ui/progress'
import { useAuth } from '@/lib/context'
import { useProgress } from '@/lib/hooks/use-progress'

interface ModuleProgressCardProps {
  moduleId: string
  title: string
  description?: string
  sectionsCount: number
  activityIds: string[]
  parcours: string
}

export function ModuleProgressCard({
  moduleId,
  title,
  description,
  sectionsCount,
  activityIds,
  parcours,
}: ModuleProgressCardProps) {
  const { userId } = useAuth()
  const { progress } = useProgress(userId ?? undefined)

  const progressPercent = React.useMemo(() => {
    if (activityIds.length === 0) return 0
    const done = activityIds.filter((id) => progress.has(id)).length
    return Math.round((done / activityIds.length) * 100)
  }, [activityIds, progress])

  return (
    <Link href={`/${parcours}/apprendre/${moduleId}`} className="group">
      <Card className="h-full transition-colors group-hover:border-primary/50">
        <CardContent className="p-4">
          <div className="flex items-start justify-between">
            <div className="flex-1">
              <h3 className="font-medium group-hover:text-primary">{title}</h3>
              {description && (
                <p className="mt-1 line-clamp-2 text-sm text-muted-foreground">{description}</p>
              )}
            </div>
            <ChevronRight className="h-5 w-5 text-muted-foreground transition-transform group-hover:translate-x-1" aria-hidden="true" />
          </div>
          <div className="mt-3 flex items-center gap-2">
            <Progress value={progressPercent} className="flex-1 h-1.5" />
            <span className="tabular-nums text-xs text-muted-foreground">{progressPercent}%</span>
          </div>
          <p className="mt-2 text-xs text-muted-foreground">{sectionsCount} sections</p>
        </CardContent>
      </Card>
    </Link>
  )
}
