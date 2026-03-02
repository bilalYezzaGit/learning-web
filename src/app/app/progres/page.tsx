/**
 * Progress Page — dashboard with real Firestore data.
 *
 * Shows:
 * - Summary stats (booklets, completed activities, QCM score)
 * - Module-by-module progress bars
 * - Empty states for unauthenticated or no-data users
 */

'use client'

import Link from 'next/link'
import { BarChart3, BookOpen, CheckCircle, Loader2, ScanLine, Target } from 'lucide-react'

import { Card, CardContent } from '@/components/ui/card'
import { Progress } from '@/components/ui/progress'
import { Button } from '@/components/ui/button'
import { useAuth } from '@/lib/context'
import { useBookletProgress } from '@/app/app/_components/use-booklet-progress'

export default function ProgresPage() {
  const { userId, isAuthenticated, isLoading: authLoading } = useAuth()
  const { stats, isLoading: progressLoading } = useBookletProgress(userId)

  const isLoading = authLoading || progressLoading

  return (
    <div className="px-4 py-5">
      <div className="mb-5">
        <h1 className="font-serif text-2xl font-semibold">Progres</h1>
        <p className="mt-1 text-sm text-muted-foreground">
          Suivi de ton travail sur les livrets
        </p>
      </div>

      {/* Unauthenticated state */}
      {!isAuthenticated && !authLoading ? (
        <Card>
          <CardContent className="py-12 text-center text-muted-foreground">
            <BarChart3 className="mx-auto mb-4 h-12 w-12 opacity-30" aria-hidden="true" />
            <p className="text-lg font-medium">Connecte-toi pour suivre tes progres</p>
            <p className="mt-1 text-sm">
              Ton avancement est enregistre automatiquement quand tu es connecte.
            </p>
            <Button asChild className="mt-4">
              <Link href="/login">Se connecter</Link>
            </Button>
          </CardContent>
        </Card>
      ) : isLoading ? (
        /* Loading state */
        <div className="flex items-center justify-center py-16">
          <Loader2 className="h-8 w-8 animate-spin text-muted-foreground" aria-label="Chargement" />
        </div>
      ) : stats.completedActivities === 0 ? (
        /* No progress yet */
        <Card>
          <CardContent className="py-12 text-center text-muted-foreground">
            <ScanLine className="mx-auto mb-4 h-12 w-12 opacity-30" aria-hidden="true" />
            <p className="text-lg font-medium">Pas encore de progres</p>
            <p className="mt-1 text-sm">
              Associe un livret et commence a travailler !
            </p>
            <Button asChild className="mt-4">
              <Link href="/app/scan">Associer un livret</Link>
            </Button>
          </CardContent>
        </Card>
      ) : (
        /* Real data */
        <div className="space-y-4">
          {/* Summary stats */}
          <div className="grid grid-cols-3 gap-3">
            <StatCard
              icon={<BookOpen className="h-5 w-5 text-primary" />}
              value={String(stats.totalBooklets)}
              label="Livrets"
            />
            <StatCard
              icon={<CheckCircle className="h-5 w-5 text-success" />}
              value={String(stats.completedActivities)}
              label="Termines"
            />
            <StatCard
              icon={<Target className="h-5 w-5 text-warning" />}
              value={stats.avgQcmScore !== null ? `${stats.avgQcmScore}%` : '--'}
              label="Score QCM"
            />
          </div>

          {/* Module progress */}
          {stats.modules.length > 0 && (
            <Card>
              <CardContent className="py-4">
                <h2 className="mb-3 text-sm font-medium text-muted-foreground">Par module</h2>
                <div className="space-y-3">
                  {stats.modules.map((mod) => (
                    <ProgressRow
                      key={mod.moduleSlug}
                      label={mod.label}
                      progress={mod.percentage}
                      total={`${mod.done} activites`}
                    />
                  ))}
                </div>
              </CardContent>
            </Card>
          )}
        </div>
      )}
    </div>
  )
}

function StatCard({ icon, value, label }: { icon: React.ReactNode; value: string; label: string }) {
  return (
    <Card>
      <CardContent className="flex flex-col items-center py-4 text-center">
        {icon}
        <span className="mt-1 text-xl font-bold tabular-nums">{value}</span>
        <span className="text-[10px] text-muted-foreground">{label}</span>
      </CardContent>
    </Card>
  )
}

function ProgressRow({ label, progress, total }: { label: string; progress: number; total: string }) {
  return (
    <div>
      <div className="mb-1 flex items-center justify-between text-sm">
        <span className="font-medium">{label}</span>
        <span className="text-xs text-muted-foreground">{total}</span>
      </div>
      <Progress value={progress} className="h-2" aria-label={`Progression ${label}`} />
    </div>
  )
}
