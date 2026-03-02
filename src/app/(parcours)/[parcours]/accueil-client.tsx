'use client'

/**
 * Accueil Client Component
 *
 * Main landing page for a parcours: modules grouped by trimester + cross-module series.
 * Redesigned with card grid layout and module image placeholders.
 */

import Link from 'next/link'
import { Clock, FileText, Layers } from 'lucide-react'

import { Badge } from '@/components/ui/badge'
import { Progress } from '@/components/ui/progress'
import { ModuleCard } from '@/app/(parcours)/_components/module-card'
import { useAuth } from '@/lib/context'
import { useProgress } from '@/lib/hooks/use-progress'
import { useModuleProgress } from '@/lib/hooks/use-module-progress'
import { formatDuration, getDifficultyLabel } from '@/lib/utils/format'

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
  lessonCount: number
  exerciseCount: number
  qcmCount: number
}

interface TrimesterGroup {
  key: string
  label: string
  modules: ModuleEntry[]
}

interface CrossModuleSerie {
  id: string
  title: string
  description: string
  type: string
  trimestre: number
  difficulty: number
  estimatedMinutes: number
  activityCount: number
}

interface AccueilClientProps {
  parcours: string
  trimesterGroups: TrimesterGroup[]
  crossModuleSeries: CrossModuleSerie[]
}

// =============================================================================
// Helpers
// =============================================================================

function getSerieTypeLabel(type: string): string {
  switch (type) {
    case 'cross-module':
      return 'Revision'
    case 'devoir-controle':
      return 'Devoir controle'
    case 'devoir-synthese':
      return 'Devoir synthese'
    case 'diagnostic':
      return 'Diagnostic'
    default:
      return type
  }
}

// =============================================================================
// Main Component
// =============================================================================

export function AccueilClient({ parcours, trimesterGroups, crossModuleSeries }: AccueilClientProps) {
  const { userId } = useAuth()
  const { progress } = useProgress(userId ?? undefined)

  const allModules = trimesterGroups.flatMap((g) => g.modules)
  const moduleStats = useModuleProgress(allModules, progress)

  return (
    <div className="space-y-10">
      {/* Programme — modules grouped by trimester */}
      <section aria-labelledby="programme-heading">
        <div className="space-y-8">
          {trimesterGroups.map((group) => {
            const completedCount = group.modules.filter(
              (m) => moduleStats.get(m.id)?.status === 'completed'
            ).length
            const totalMinutes = group.modules.reduce((sum, m) => sum + m.estimatedMinutes, 0)
            const allCompleted = completedCount === group.modules.length
            const hasStarted = group.modules.some(
              (m) => moduleStats.get(m.id)?.status !== 'not-started'
            )
            const groupPercentage = group.modules.length > 0
              ? Math.round((completedCount / group.modules.length) * 100)
              : 0

            return (
              <div key={group.key}>
                {/* Trimester header */}
                <div className="mb-4 flex flex-wrap items-center gap-3">
                  <div className="flex items-center gap-2">
                    <Layers className="h-4 w-4 text-primary" aria-hidden="true" />
                    <h3 className="font-serif text-lg font-semibold text-foreground">
                      {group.label}
                    </h3>
                  </div>
                  <Badge variant={allCompleted ? 'default' : 'secondary'} className={allCompleted ? 'bg-success' : ''}>
                    {hasStarted ? `${completedCount}/${group.modules.length} modules` : `${group.modules.length} modules`}
                  </Badge>
                  <span className="inline-flex items-center gap-1 text-xs text-muted-foreground">
                    <Clock className="h-3 w-3" aria-hidden="true" />
                    ~{formatDuration(totalMinutes)}
                  </span>
                  {/* Trimester progress */}
                  {hasStarted && !allCompleted && (
                    <div className="flex items-center gap-2">
                      <Progress
                        value={groupPercentage}
                        className="h-1.5 w-20"
                        aria-label={`Progression ${group.label} : ${groupPercentage}%`}
                      />
                      <span className="tabular-nums text-xs font-medium text-primary">
                        {groupPercentage}%
                      </span>
                    </div>
                  )}
                </div>

                {/* Module cards grid */}
                <div className="grid gap-4 sm:grid-cols-2 lg:grid-cols-3">
                  {group.modules.map((mod) => {
                    const stat = moduleStats.get(mod.id)
                    return (
                      <ModuleCard
                        key={mod.id}
                        module={mod}
                        status={stat?.status ?? 'not-started'}
                        done={stat?.done ?? 0}
                        total={stat?.total ?? 0}
                        percentage={stat?.percentage ?? 0}
                        parcours={parcours}
                      />
                    )
                  })}
                </div>
              </div>
            )
          })}
        </div>
      </section>

      {/* Cross-module series */}
      {crossModuleSeries.length > 0 && (
        <section aria-labelledby="revisions-heading">
          <div className="mb-4 flex items-center gap-2">
            <FileText className="h-4 w-4 text-primary" aria-hidden="true" />
            <h2 id="revisions-heading" className="font-serif text-lg font-semibold">
              Revisions transversales
            </h2>
          </div>

          <div className="grid gap-4 sm:grid-cols-2 lg:grid-cols-3">
            {crossModuleSeries.map((serie) => (
              <Link
                key={serie.id}
                href={`/${parcours}/serie/${serie.id}`}
                className="group flex flex-col overflow-hidden rounded-xl border bg-card shadow-sm transition-shadow hover:shadow-md focus-visible:border-ring focus-visible:ring-ring/50 focus-visible:ring-[3px]"
              >
                {/* Colored top stripe */}
                <div className="h-2 bg-gradient-to-r from-info/60 to-info/30" />

                <div className="flex flex-1 flex-col p-4">
                  <div className="flex items-start gap-3">
                    <div className="flex h-10 w-10 shrink-0 items-center justify-center rounded-lg bg-info/10">
                      <FileText className="h-5 w-5 text-info" aria-hidden="true" />
                    </div>
                    <div className="min-w-0 flex-1">
                      <p className="font-medium leading-snug group-hover:text-primary transition-colors">
                        {serie.title}
                      </p>
                      <Badge variant="secondary" className="mt-1 text-xs">
                        {getSerieTypeLabel(serie.type)}
                      </Badge>
                    </div>
                  </div>

                  {serie.description && (
                    <p className="mt-3 line-clamp-2 text-sm text-muted-foreground">
                      {serie.description}
                    </p>
                  )}

                  <div className="mt-auto flex flex-wrap items-center gap-2 pt-3 text-xs text-muted-foreground">
                    <span>{serie.activityCount} activites</span>
                    <span>·</span>
                    <span>{formatDuration(serie.estimatedMinutes)}</span>
                    <span>·</span>
                    <span>{getDifficultyLabel(serie.difficulty)}</span>
                    <span>·</span>
                    <span>T{serie.trimestre}</span>
                  </div>
                </div>
              </Link>
            ))}
          </div>
        </section>
      )}
    </div>
  )
}
