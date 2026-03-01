'use client'

/**
 * Accueil Client Component
 *
 * Main landing page for a parcours: modules grouped by trimester + cross-module series.
 */

import Link from 'next/link'
import { ChevronRight, FileText } from 'lucide-react'

import { Badge } from '@/components/ui/badge'
import { Card, CardContent } from '@/components/ui/card'
import { Separator } from '@/components/ui/separator'
import { ModuleListItem } from '@/app/(parcours)/_components/module-list-item'
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
    <div className="space-y-8">
      {/* Programme — modules grouped by trimester */}
      <section aria-labelledby="programme-heading">
        <div className="mb-4 flex items-center gap-3">
          <h2 id="programme-heading" className="font-serif text-xl font-semibold">
            Programme
          </h2>
          <Separator className="flex-1" />
        </div>

        <div className="space-y-6">
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
              <div key={group.key}>
                {/* Trimester sub-header */}
                <div className="mb-3 flex items-center gap-3">
                  <h3 className="text-sm font-semibold text-muted-foreground">
                    {group.label}
                  </h3>
                  <Badge variant={allCompleted ? 'default' : 'secondary'} className={allCompleted ? 'bg-success' : ''}>
                    {hasStarted ? `${completedCount}/${group.modules.length} modules` : `${group.modules.length} modules`}
                  </Badge>
                  <span className="text-xs text-muted-foreground">~{formatDuration(totalMinutes)}</span>
                </div>

                {/* Module cards */}
                <Card>
                  <CardContent className="p-0">
                    {group.modules.map((mod) => {
                      const stat = moduleStats.get(mod.id)
                      return (
                        <ModuleListItem
                          key={mod.id}
                          module={mod}
                          status={stat?.status ?? 'not-started'}
                          done={stat?.done ?? 0}
                          total={stat?.total ?? 0}
                          percentage={stat?.percentage ?? 0}
                          parcours={parcours}
                          meta={
                            <>
                              <span>{mod.lessonCount} cours</span>
                              <span>·</span>
                              <span>{mod.exerciseCount} exercices</span>
                              <span>·</span>
                              <span>{mod.qcmCount} QCM</span>
                              <span>·</span>
                              <span>{formatDuration(mod.estimatedMinutes)}</span>
                            </>
                          }
                        />
                      )
                    })}
                  </CardContent>
                </Card>
              </div>
            )
          })}
        </div>
      </section>

      {/* Cross-module series */}
      {crossModuleSeries.length > 0 && (
        <section aria-labelledby="revisions-heading">
          <div className="mb-4 flex items-center gap-3">
            <h2 id="revisions-heading" className="font-serif text-xl font-semibold">
              Revisions transversales
            </h2>
            <Separator className="flex-1" />
          </div>

          <div className="grid gap-4 sm:grid-cols-2">
            {crossModuleSeries.map((serie) => (
              <Link key={serie.id} href={`/${parcours}/serie/${serie.id}`}>
                <Card className="h-full transition-colors hover:bg-muted/50">
                  <CardContent className="py-4">
                    <div className="flex items-start gap-3">
                      <div className="flex h-10 w-10 shrink-0 items-center justify-center rounded-lg bg-muted">
                        <FileText className="h-5 w-5 text-muted-foreground" aria-hidden="true" />
                      </div>
                      <div className="min-w-0 flex-1">
                        <div className="flex flex-wrap items-center gap-2">
                          <p className="font-medium">{serie.title}</p>
                          <Badge variant="secondary" className="text-xs">
                            {getSerieTypeLabel(serie.type)}
                          </Badge>
                        </div>
                        {serie.description && (
                          <p className="mt-1 line-clamp-1 text-sm text-muted-foreground">
                            {serie.description}
                          </p>
                        )}
                        <div className="mt-2 flex flex-wrap items-center gap-2 text-xs text-muted-foreground">
                          <span>{serie.activityCount} activites</span>
                          <span>·</span>
                          <span>{formatDuration(serie.estimatedMinutes)}</span>
                          <span>·</span>
                          <span>{getDifficultyLabel(serie.difficulty)}</span>
                          <span>·</span>
                          <span>T{serie.trimestre}</span>
                        </div>
                      </div>
                      <ChevronRight className="mt-1 h-5 w-5 shrink-0 text-muted-foreground" aria-hidden="true" />
                    </div>
                  </CardContent>
                </Card>
              </Link>
            ))}
          </div>
        </section>
      )}
    </div>
  )
}
