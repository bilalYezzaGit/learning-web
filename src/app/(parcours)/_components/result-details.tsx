'use client'

import * as React from 'react'
import { CheckCircle, XCircle, Minus } from 'lucide-react'

import { Badge } from '@/components/ui/badge'
import { Card, CardContent, CardHeader, CardTitle } from '@/components/ui/card'
import { useAuth } from '@/lib/context'
import { useProgress } from '@/lib/hooks/use-progress'
import { getAtomTypeLabel } from '@/types/content'
import type { AtomType } from '@/types/content'

interface ActivityInfo {
  id: string
  title: string
  type: AtomType
}

interface ResultDetailsProps {
  activities: ActivityInfo[]
}

export function ResultDetails({ activities }: ResultDetailsProps) {
  const { userId } = useAuth()
  const { getProgress } = useProgress(userId ?? undefined)

  if (!userId) return null

  return (
    <Card>
      <CardHeader className="pb-3">
        <CardTitle className="text-base">Détail par activité</CardTitle>
      </CardHeader>
      <CardContent className="p-0">
        {activities.map((activity) => {
          const progress = getProgress(activity.id)
          const hasScore = progress?.score !== undefined && progress?.total !== undefined

          return (
            <div
              key={activity.id}
              className="flex items-center gap-3 border-b px-6 py-3 last:border-b-0"
            >
              {progress?.status === 'success' ? (
                <CheckCircle className="h-4 w-4 shrink-0 text-success" aria-hidden="true" />
              ) : progress?.status === 'retry' ? (
                <XCircle className="h-4 w-4 shrink-0 text-destructive" aria-hidden="true" />
              ) : (
                <Minus className="h-4 w-4 shrink-0 text-muted-foreground" aria-hidden="true" />
              )}
              <div className="flex-1 min-w-0">
                <p className="truncate text-sm font-medium">{activity.title}</p>
                <Badge variant="outline" className="mt-0.5 text-[10px]">
                  {getAtomTypeLabel(activity.type)}
                </Badge>
              </div>
              {hasScore && (
                <span className="tabular-nums text-sm text-muted-foreground">
                  {progress.score}/{progress.total}
                </span>
              )}
            </div>
          )
        })}
      </CardContent>
    </Card>
  )
}
