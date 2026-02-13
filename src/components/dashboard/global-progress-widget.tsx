'use client'

/**
 * Global Progress Widget
 *
 * Visual overview of the learner's overall progression:
 * percentage, modules completed/in-progress, total activities.
 * Includes per-module progress bars.
 */

import Link from 'next/link'

import { Badge } from '@/components/ui/badge'
import { Card, CardContent, CardHeader, CardTitle } from '@/components/ui/card'
import { Progress } from '@/components/ui/progress'
import type { GlobalProgress } from '@/types/dashboard'

interface GlobalProgressWidgetProps {
  data: GlobalProgress
  parcours: string
}

export function GlobalProgressWidget({ data, parcours }: GlobalProgressWidgetProps) {
  return (
    <Card>
      <CardHeader className="pb-3">
        <CardTitle className="text-base">Progression globale</CardTitle>
      </CardHeader>
      <CardContent className="space-y-4">
        {/* Main percentage */}
        <div className="flex items-center gap-4">
          <div className="relative flex h-16 w-16 shrink-0 items-center justify-center">
            <svg className="h-16 w-16 -rotate-90" viewBox="0 0 64 64" aria-hidden="true">
              <circle
                cx="32" cy="32" r="28"
                fill="none"
                stroke="currentColor"
                strokeWidth="6"
                className="text-muted/30"
              />
              <circle
                cx="32" cy="32" r="28"
                fill="none"
                stroke="currentColor"
                strokeWidth="6"
                strokeDasharray={`${data.percentage * 1.76} 176`}
                strokeLinecap="round"
                className="text-primary transition-all"
              />
            </svg>
            <span className="absolute text-sm font-bold tabular-nums">{data.percentage}%</span>
          </div>
          <div className="min-w-0">
            <p className="text-sm text-muted-foreground">
              {data.completedActivities}/{data.totalActivities} activit&eacute;s
            </p>
            <p className="text-sm text-muted-foreground">
              {data.completedModules} module{data.completedModules > 1 ? 's' : ''} termin&eacute;{data.completedModules > 1 ? 's' : ''}
              {data.inProgressModules > 0 && (
                <> &middot; {data.inProgressModules} en cours</>
              )}
            </p>
          </div>
        </div>

        {/* Per-module bars */}
        <div className="space-y-2">
          {data.modules
            .filter((m) => m.done > 0)
            .map((mod) => (
              <Link key={mod.id} href={`/${parcours}/apprendre/${mod.id}`} className="block group">
                <div className="flex items-center justify-between text-xs">
                  <span className="truncate text-muted-foreground group-hover:text-foreground transition-colors">
                    {mod.title}
                  </span>
                  {mod.done === mod.total ? (
                    <Badge variant="default" className="ml-2 bg-success text-xs">Termin&eacute;</Badge>
                  ) : (
                    <span className="ml-2 shrink-0 tabular-nums text-muted-foreground">
                      {mod.done}/{mod.total}
                    </span>
                  )}
                </div>
                <Progress value={mod.percentage} className="mt-1 h-1.5" />
              </Link>
            ))}
        </div>
      </CardContent>
    </Card>
  )
}
