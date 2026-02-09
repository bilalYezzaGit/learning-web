'use client'

/**
 * Dashboard Client Components
 *
 * Shows user progress: last activity, stats overview, and module progress.
 */

import * as React from 'react'
import Link from 'next/link'
import { ArrowRight, BookOpen, CheckCircle2, Clock, Sparkles, Trophy } from 'lucide-react'

import { Badge } from '@/components/ui/badge'
import { Button } from '@/components/ui/button'
import { Card, CardContent } from '@/components/ui/card'
import { Progress } from '@/components/ui/progress'
import { useAuth } from '@/lib/context'
import { useProgress } from '@/lib/hooks/use-progress'

interface ModuleInfo {
  id: string
  title: string
  activityIds: string[]
}

interface DashboardClientProps {
  parcours: string
  modules: ModuleInfo[]
}

export function DashboardClient({ parcours, modules }: DashboardClientProps) {
  const { userId } = useAuth()
  const { progress, isCompleted } = useProgress(userId ?? undefined)

  const stats = React.useMemo(() => {
    const totalActivities = modules.reduce((sum, m) => sum + m.activityIds.length, 0)
    let completedCount = 0
    let lastActivity: { id: string; doneAt: string; moduleId: string; moduleTitle: string } | null = null

    for (const mod of modules) {
      for (const actId of mod.activityIds) {
        if (isCompleted(actId)) {
          completedCount++
        }
      }
    }

    // Find last activity across all progress entries
    for (const p of progress.values()) {
      if (p.lastDoneAt) {
        // Find which module this activity belongs to
        const ownerModule = modules.find((m) => m.activityIds.includes(p.activityId))
        if (ownerModule) {
          if (!lastActivity || p.lastDoneAt > lastActivity.doneAt) {
            lastActivity = {
              id: p.activityId,
              doneAt: p.lastDoneAt,
              moduleId: ownerModule.id,
              moduleTitle: ownerModule.title,
            }
          }
        }
      }
    }

    // Find the next uncompleted activity in the last module
    let nextActivityId: string | null = null
    if (lastActivity) {
      const lastMod = modules.find((m) => m.id === lastActivity?.moduleId)
      if (lastMod) {
        const lastIdx = lastMod.activityIds.indexOf(lastActivity.id)
        // Try the next activity after the last one
        for (let i = lastIdx + 1; i < lastMod.activityIds.length; i++) {
          const aid = lastMod.activityIds[i]
          if (aid && !isCompleted(aid)) {
            nextActivityId = aid
            break
          }
        }
        // If no next in this module, try the same activity (maybe they want to redo)
        if (!nextActivityId) {
          nextActivityId = lastActivity.id
        }
      }
    }

    // Per-module progress
    const moduleProgress = modules.map((mod) => {
      const done = mod.activityIds.filter((id) => isCompleted(id)).length
      const total = mod.activityIds.length
      return {
        ...mod,
        done,
        total,
        percentage: total > 0 ? Math.round((done / total) * 100) : 0,
      }
    })

    return {
      totalActivities,
      completedCount,
      percentage: totalActivities > 0 ? Math.round((completedCount / totalActivities) * 100) : 0,
      lastActivity,
      nextActivityId,
      moduleProgress,
      modulesCompleted: moduleProgress.filter((m) => m.done === m.total && m.total > 0).length,
    }
  }, [modules, progress, isCompleted])

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

  // First visit: no progress yet
  const hasProgress = stats.completedCount > 0

  return (
    <div className="space-y-6">
      {/* "Continue where you left off" or "Start your journey" */}
      {hasProgress && stats.lastActivity && stats.nextActivityId ? (
        <Card className="border-primary/20 bg-primary/5">
          <CardContent className="py-6">
            <div className="flex flex-col gap-4 sm:flex-row sm:items-center sm:justify-between">
              <div className="flex items-center gap-4">
                <div className="flex h-14 w-14 items-center justify-center rounded-xl bg-primary text-primary-foreground">
                  <BookOpen className="h-7 w-7" aria-hidden="true" />
                </div>
                <div>
                  <p className="text-sm text-muted-foreground">Reprendre</p>
                  <p className="text-lg font-semibold">{stats.lastActivity.moduleTitle}</p>
                  <p className="text-sm text-muted-foreground">
                    {stats.completedCount} activit&eacute;s compl&eacute;t&eacute;es sur {stats.totalActivities}
                  </p>
                </div>
              </div>
              <Button size="lg" asChild>
                <Link href={`/${parcours}/apprendre/${stats.lastActivity.moduleId}/${stats.nextActivityId}`}>
                  Continuer
                  <ArrowRight className="ml-2 h-4 w-4" aria-hidden="true" />
                </Link>
              </Button>
            </div>
          </CardContent>
        </Card>
      ) : (
        <Card className="border-primary/20 bg-primary/5">
          <CardContent className="py-6">
            <div className="flex flex-col gap-4 sm:flex-row sm:items-center sm:justify-between">
              <div className="flex items-center gap-4">
                <div className="flex h-14 w-14 items-center justify-center rounded-xl bg-primary text-primary-foreground">
                  <Sparkles className="h-7 w-7" aria-hidden="true" />
                </div>
                <div>
                  <p className="text-lg font-semibold">Commencez votre parcours</p>
                  <p className="text-sm text-muted-foreground">
                    {stats.totalActivities} activit&eacute;s &middot; {modules.length} modules &middot; Progressez &agrave; votre rythme
                  </p>
                </div>
              </div>
              <Button size="lg" asChild>
                <Link href={`/${parcours}/apprendre`}>
                  Commencer
                  <ArrowRight className="ml-2 h-4 w-4" aria-hidden="true" />
                </Link>
              </Button>
            </div>
          </CardContent>
        </Card>
      )}

      {/* Stats strip — only show when user has started */}
      {hasProgress && <div className="grid gap-4 sm:grid-cols-3">
        <Card>
          <CardContent className="flex items-center gap-4 py-4">
            <div className="flex h-10 w-10 items-center justify-center rounded-lg bg-primary/10">
              <Trophy className="h-5 w-5 text-primary" aria-hidden="true" />
            </div>
            <div>
              <p className="tabular-nums text-2xl font-bold">{stats.completedCount}</p>
              <p className="text-sm text-muted-foreground">Activités complétées</p>
            </div>
          </CardContent>
        </Card>
        <Card>
          <CardContent className="flex items-center gap-4 py-4">
            <div className="flex h-10 w-10 items-center justify-center rounded-lg bg-success/10">
              <CheckCircle2 className="h-5 w-5 text-success" aria-hidden="true" />
            </div>
            <div>
              <p className="tabular-nums text-2xl font-bold">{stats.modulesCompleted}</p>
              <p className="text-sm text-muted-foreground">Modules terminés</p>
            </div>
          </CardContent>
        </Card>
        <Card>
          <CardContent className="flex items-center gap-4 py-4">
            <div className="flex h-10 w-10 items-center justify-center rounded-lg bg-info/10">
              <Clock className="h-5 w-5 text-info" aria-hidden="true" />
            </div>
            <div>
              <p className="tabular-nums text-2xl font-bold">{stats.percentage}%</p>
              <p className="text-sm text-muted-foreground">Progression globale</p>
            </div>
          </CardContent>
        </Card>
      </div>}

      {/* Module progress */}
      {stats.moduleProgress.some((m) => m.done > 0) && (
        <div className="space-y-3">
          <h2 className="text-sm font-semibold text-muted-foreground">Progression par module</h2>
          <div className="grid gap-3 sm:grid-cols-2">
            {stats.moduleProgress
              .filter((m) => m.done > 0)
              .map((mod) => (
                <Link key={mod.id} href={`/${parcours}/apprendre/${mod.id}`}>
                  <Card className="transition-colors hover:bg-muted/50">
                    <CardContent className="py-4">
                      <div className="flex items-center justify-between">
                        <p className="text-sm font-medium">{mod.title}</p>
                        {mod.done === mod.total ? (
                          <Badge variant="default" className="bg-success text-xs">Terminé</Badge>
                        ) : (
                          <span className="text-xs text-muted-foreground">{mod.done}/{mod.total}</span>
                        )}
                      </div>
                      <Progress value={mod.percentage} className="mt-2 h-1.5" />
                    </CardContent>
                  </Card>
                </Link>
              ))}
          </div>
        </div>
      )}
    </div>
  )
}
