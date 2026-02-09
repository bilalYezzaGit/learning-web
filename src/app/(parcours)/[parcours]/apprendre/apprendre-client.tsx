'use client'

/**
 * Apprendre Client Components
 *
 * Sequential list grouped by trimester with 3 visual states:
 * - Not started: muted number circle
 * - In progress: primary play circle + progress bar
 * - Completed: success check circle + "Terminé" badge
 */

import * as React from 'react'
import Link from 'next/link'
import { ArrowRight, BookOpen, Check, ChevronRight, Play } from 'lucide-react'

import { Badge } from '@/components/ui/badge'
import { Button } from '@/components/ui/button'
import { Card, CardContent } from '@/components/ui/card'
import { Progress } from '@/components/ui/progress'
import { Separator } from '@/components/ui/separator'
import { useAuth } from '@/lib/context'
import { useProgress } from '@/lib/hooks/use-progress'

// =============================================================================
// Types
// =============================================================================

interface ModuleEntry {
  id: string
  title: string
  description: string
  trimester: string
  order: number
  estimatedMinutes: number
  sectionsCount: number
  activityIds: string[]
}

interface TrimesterGroup {
  key: string
  label: string
  modules: ModuleEntry[]
}

interface ApprendreClientProps {
  parcours: string
  trimesterGroups: TrimesterGroup[]
}

// =============================================================================
// Helpers
// =============================================================================

function formatDuration(minutes: number): string {
  if (minutes < 60) return `${minutes} min`
  const hours = Math.floor(minutes / 60)
  const remaining = minutes % 60
  if (remaining === 0) return `${hours}h`
  return `${hours}h${remaining.toString().padStart(2, '0')}`
}

type ModuleStatus = 'not-started' | 'in-progress' | 'completed'

// =============================================================================
// Main Component
// =============================================================================

export function ApprendreClient({ parcours, trimesterGroups }: ApprendreClientProps) {
  const { userId } = useAuth()
  const { progress } = useProgress(userId ?? undefined)

  // Compute progress per module
  const moduleStats = React.useMemo(() => {
    const stats = new Map<string, { done: number; total: number; percentage: number; status: ModuleStatus }>()

    for (const group of trimesterGroups) {
      for (const mod of group.modules) {
        const total = mod.activityIds.length
        const done = mod.activityIds.filter((id) => progress.has(id)).length
        const percentage = total > 0 ? Math.round((done / total) * 100) : 0
        let status: ModuleStatus = 'not-started'
        if (done > 0 && done < total) status = 'in-progress'
        if (done > 0 && done >= total) status = 'completed'
        stats.set(mod.id, { done, total, percentage, status })
      }
    }

    return stats
  }, [trimesterGroups, progress])

  // Find the current module (first incomplete)
  const currentModuleId = React.useMemo(() => {
    for (const group of trimesterGroups) {
      for (const mod of group.modules) {
        const stat = moduleStats.get(mod.id)
        if (!stat || stat.status !== 'completed') return mod.id
      }
    }
    return null
  }, [trimesterGroups, moduleStats])

  // Global stats
  const globalStats = React.useMemo(() => {
    let totalDone = 0
    let totalActivities = 0
    for (const stat of moduleStats.values()) {
      totalDone += stat.done
      totalActivities += stat.total
    }
    const percentage = totalActivities > 0 ? Math.round((totalDone / totalActivities) * 100) : 0
    return { totalDone, totalActivities, percentage }
  }, [moduleStats])

  // Current module data for the "Reprendre" card (derived from memoized values)
  let currentModule: (ModuleEntry & { stat: { done: number; total: number; percentage: number } }) | null = null
  if (currentModuleId) {
    for (const group of trimesterGroups) {
      const mod = group.modules.find((m) => m.id === currentModuleId)
      if (mod) {
        const stat = moduleStats.get(mod.id)
        if (stat) {
          currentModule = { ...mod, stat }
        }
        break
      }
    }
  }

  const hasProgress = globalStats.totalDone > 0

  return (
    <div className="space-y-8">
      {/* Stats Card — "Reprendre" */}
      {hasProgress && currentModule && currentModule.stat && (
        <Card className="border-primary/20 bg-primary/5">
          <CardContent className="py-6">
            <div className="flex flex-col gap-4 sm:flex-row sm:items-center sm:justify-between">
              <div className="flex items-center gap-4">
                <div className="flex h-14 w-14 items-center justify-center rounded-xl bg-primary text-primary-foreground">
                  <BookOpen className="h-7 w-7" aria-hidden="true" />
                </div>
                <div>
                  <p className="text-sm text-muted-foreground">Reprendre</p>
                  <p className="text-lg font-semibold">{currentModule.title}</p>
                  <div className="mt-1 flex items-center gap-3">
                    <Progress
                      value={currentModule.stat.percentage}
                      className="h-1.5 w-32"
                      aria-label={`Progression : ${currentModule.stat.percentage}%`}
                    />
                    <span className="tabular-nums text-sm text-muted-foreground">
                      {currentModule.stat.done}/{currentModule.stat.total} activit&eacute;s &middot; {currentModule.stat.percentage}%
                    </span>
                  </div>
                </div>
              </div>
              <Button size="lg" asChild>
                <Link href={`/${parcours}/apprendre/${currentModule.id}`}>
                  Continuer
                  <ArrowRight className="ml-2 h-4 w-4" aria-hidden="true" />
                </Link>
              </Button>
            </div>
          </CardContent>
        </Card>
      )}

      {/* Trimester Groups */}
      {trimesterGroups.map((group) => {
        const completedCount = group.modules.filter(
          (m) => moduleStats.get(m.id)?.status === 'completed'
        ).length
        const totalMinutes = group.modules.reduce((sum, m) => sum + m.estimatedMinutes, 0)
        const allCompleted = completedCount === group.modules.length
        const hasStarted = group.modules.some(
          (m) => moduleStats.get(m.id)?.status !== 'not-started'
        )

        return (
          <section key={group.key} aria-labelledby={`trimestre-${group.key}`}>
            {/* Trimester Header */}
            <div className="mb-3 flex items-center gap-3">
              <h2 id={`trimestre-${group.key}`} className="font-serif text-lg font-semibold">
                {group.label}
              </h2>
              <Separator className="flex-1" />
              <Badge variant={allCompleted ? 'default' : 'secondary'} className={allCompleted ? 'bg-success' : ''}>
                {hasStarted ? `${completedCount}/${group.modules.length} modules` : 'À venir'}
              </Badge>
              <span className="text-sm text-muted-foreground">~{formatDuration(totalMinutes)}</span>
            </div>

            {/* Module List */}
            <Card>
              <CardContent className="p-0">
                {group.modules.map((mod) => {
                  const stat = moduleStats.get(mod.id)
                  const isCurrent = mod.id === currentModuleId
                  const status = stat?.status ?? 'not-started'

                  return (
                    <ModuleListItem
                      key={mod.id}
                      module={mod}
                      status={status}
                      done={stat?.done ?? 0}
                      total={stat?.total ?? 0}
                      percentage={stat?.percentage ?? 0}
                      isCurrent={isCurrent}
                      parcours={parcours}
                    />
                  )
                })}
              </CardContent>
            </Card>
          </section>
        )
      })}
    </div>
  )
}

// =============================================================================
// Module List Item
// =============================================================================

interface ModuleListItemProps {
  module: ModuleEntry
  status: ModuleStatus
  done: number
  total: number
  percentage: number
  isCurrent: boolean
  parcours: string
}

function ModuleListItem({
  module: mod,
  status,
  done,
  total,
  percentage,
  isCurrent,
  parcours,
}: ModuleListItemProps) {
  return (
    <Link
      href={`/${parcours}/apprendre/${mod.id}`}
      className={`flex items-center gap-4 border-b px-6 py-4 transition-colors last:border-b-0 hover:bg-muted/50 ${
        isCurrent ? 'border-l-4 border-l-primary bg-primary/5' : ''
      }`}
      {...(isCurrent ? { 'aria-current': 'step' as const } : {})}
    >
      {/* Left Icon */}
      <div
        className={`flex h-10 w-10 shrink-0 items-center justify-center rounded-lg ${
          status === 'completed'
            ? 'bg-success/10'
            : status === 'in-progress'
              ? 'bg-primary/10'
              : 'bg-muted'
        }`}
      >
        {status === 'completed' ? (
          <Check className="h-5 w-5 text-success" aria-hidden="true" />
        ) : status === 'in-progress' ? (
          <Play className="h-5 w-5 text-primary" aria-hidden="true" />
        ) : (
          <span className="text-sm font-medium text-muted-foreground" aria-hidden="true">
            {mod.order.toString().padStart(2, '0')}
          </span>
        )}
      </div>

      {/* Content */}
      <div className="min-w-0 flex-1">
        <div className="flex flex-wrap items-center gap-2">
          <p className={`font-medium ${status === 'completed' ? 'text-muted-foreground' : ''}`}>
            {mod.title}
          </p>
          {status === 'completed' && (
            <Badge variant="default" className="bg-success text-xs">
              Terminé
            </Badge>
          )}
        </div>

        {mod.description && (
          <p className="mt-0.5 line-clamp-1 text-sm text-muted-foreground">
            {mod.description}
          </p>
        )}

        <div className="mt-2 flex flex-wrap items-center gap-2">
          <span className="text-xs text-muted-foreground">
            {mod.sectionsCount} sections
          </span>
          <span className="text-xs text-muted-foreground">·</span>
          <span className="text-xs text-muted-foreground">
            {formatDuration(mod.estimatedMinutes)}
          </span>
          <span className="text-xs text-muted-foreground">·</span>
          <span className="text-xs text-muted-foreground">
            {total} activités
          </span>
          {status === 'in-progress' && (
            <>
              <span className="text-xs text-muted-foreground">·</span>
              <span className="tabular-nums text-xs text-muted-foreground">
                {done}/{total} complétées
              </span>
            </>
          )}
        </div>

        {/* Progress bar for in-progress modules */}
        {status === 'in-progress' && (
          <div className="mt-2 flex items-center gap-2">
            <Progress
              value={percentage}
              className="h-1.5 flex-1"
              aria-label={`Progression du module ${mod.title} : ${percentage}%`}
            />
            <span className="tabular-nums text-xs font-medium text-primary">
              {percentage}%
            </span>
          </div>
        )}
      </div>

      {/* Right action */}
      {isCurrent ? (
        <Badge variant="default" className="shrink-0">
          Continuer
        </Badge>
      ) : (
        <ChevronRight className="h-5 w-5 shrink-0 text-muted-foreground" aria-hidden="true" />
      )}
    </Link>
  )
}
