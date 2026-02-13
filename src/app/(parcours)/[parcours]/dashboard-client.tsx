'use client'

/**
 * Dashboard Client — "Cockpit de progression"
 *
 * Enriched dashboard that shows:
 * - Next activity recommendation
 * - Global progress overview
 * - Learning statistics
 * - Strengths & weaknesses
 * - Revision recommendations
 * - Analysis status
 *
 * Only authenticated users see the full dashboard.
 * Anonymous users see a welcome CTA.
 */

import Link from 'next/link'
import { ArrowRight, Sparkles } from 'lucide-react'

import { Button } from '@/components/ui/button'
import { Card, CardContent } from '@/components/ui/card'
import {
  NextActivityWidget,
  GlobalProgressWidget,
  LearningStatsWidget,
  StrengthsWidget,
  RevisionWidget,
  AnalysisStatusWidget,
} from '@/components/dashboard'
import { useAuth } from '@/lib/context'
import { useDashboard } from '@/lib/hooks/use-dashboard'
import type { DashboardModuleInfo, DashboardSeriesInfo } from '@/types/dashboard'
import type { DashboardAtomInfo } from '@/lib/dashboard'

interface DashboardClientProps {
  parcours: string
  modules: DashboardModuleInfo[]
  series: DashboardSeriesInfo[]
  atoms: DashboardAtomInfo[]
}

export function DashboardClient({ parcours, modules, series, atoms }: DashboardClientProps) {
  const { userId } = useAuth()
  const { data, isLoading, refresh, lastRefreshedAt } = useDashboard({
    userId: userId ?? undefined,
    modules,
    series,
    atoms,
  })

  // Welcome card for unauthenticated users
  if (!userId) {
    return (
      <Card className="border-primary/20 bg-primary/5">
        <CardContent className="py-6">
          <div className="flex flex-col gap-4 sm:flex-row sm:items-center sm:justify-between">
            <div className="flex items-center gap-4">
              <div className="flex h-14 w-14 items-center justify-center rounded-xl bg-primary text-primary-foreground">
                <Sparkles className="h-7 w-7" aria-hidden="true" />
              </div>
              <div>
                <p className="text-lg font-semibold">Bienvenue sur Learning OS</p>
                <p className="text-sm text-muted-foreground">
                  {modules.length} modules disponibles &middot; Connectez-vous pour sauvegarder votre progression
                </p>
              </div>
            </div>
            <Button size="lg" asChild>
              <Link href={`/${parcours}/apprendre`}>
                Explorer les cours
                <ArrowRight className="ml-2 h-4 w-4" aria-hidden="true" />
              </Link>
            </Button>
          </div>
        </CardContent>
      </Card>
    )
  }

  // Loading state
  if (isLoading || !data) {
    return (
      <div className="space-y-4">
        <div className="h-24 animate-pulse rounded-xl bg-muted" />
        <div className="grid gap-4 md:grid-cols-2">
          <div className="h-64 animate-pulse rounded-xl bg-muted" />
          <div className="h-64 animate-pulse rounded-xl bg-muted" />
        </div>
      </div>
    )
  }

  const hasProgress = data.globalProgress.completedActivities > 0

  return (
    <div className="space-y-6">
      {/* Analysis Status */}
      <AnalysisStatusWidget
        isUpToDate={data.analysisStatus.isUpToDate}
        pendingActivities={data.analysisStatus.pendingActivities}
        lastRefreshedAt={lastRefreshedAt}
        onRefresh={refresh}
      />

      {/* Next Activity (hero card) */}
      {data.nextActivity && (
        <NextActivityWidget activity={data.nextActivity} parcours={parcours} />
      )}

      {/* Main widgets grid — only when user has started */}
      {hasProgress && (
        <div className="grid gap-4 md:grid-cols-2">
          {/* Left column */}
          <div className="space-y-4">
            <GlobalProgressWidget data={data.globalProgress} parcours={parcours} />
            <StrengthsWidget data={data.strengths} />
          </div>

          {/* Right column */}
          <div className="space-y-4">
            <LearningStatsWidget data={data.learningStats} />
            <RevisionWidget series={data.recommendedSeries} parcours={parcours} />
          </div>
        </div>
      )}
    </div>
  )
}
