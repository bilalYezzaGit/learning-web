/**
 * Progress Page — lightweight progress dashboard.
 *
 * PR1: placeholder with mock data.
 * PR2: real progress from Firestore, grouped by booklet/module.
 */

'use client'

import { BarChart3, BookOpen, CheckCircle, Target } from 'lucide-react'

import { Card, CardContent } from '@/components/ui/card'
import { Progress } from '@/components/ui/progress'
import { useAuth } from '@/lib/context'

export default function ProgresPage() {
  const { isAuthenticated, isLoading } = useAuth()

  return (
    <div className="px-4 py-5">
      <div className="mb-5">
        <h1 className="font-serif text-2xl font-semibold">Progres</h1>
        <p className="mt-1 text-sm text-muted-foreground">
          Suivi de ton travail sur les livrets
        </p>
      </div>

      {!isAuthenticated && !isLoading ? (
        <Card>
          <CardContent className="py-12 text-center text-muted-foreground">
            <BarChart3 className="mx-auto mb-4 h-12 w-12 opacity-30" aria-hidden="true" />
            <p className="text-lg font-medium">Connecte-toi pour suivre tes progres</p>
            <p className="mt-1 text-sm">
              Ton avancement est enregistre automatiquement quand tu es connecte.
            </p>
          </CardContent>
        </Card>
      ) : (
        <div className="space-y-4">
          {/* Summary stats */}
          <div className="grid grid-cols-3 gap-3">
            <StatCard icon={<BookOpen className="h-5 w-5 text-primary" />} value="--" label="Livrets" />
            <StatCard icon={<CheckCircle className="h-5 w-5 text-success" />} value="--" label="Termines" />
            <StatCard icon={<Target className="h-5 w-5 text-warning" />} value="--%" label="Score QCM" />
          </div>

          {/* Module progress placeholder */}
          <Card>
            <CardContent className="py-4">
              <h2 className="mb-3 text-sm font-medium text-muted-foreground">Par module</h2>
              <div className="space-y-3">
                <ProgressRow label="Continuite" progress={0} total="-- activites" />
                <ProgressRow label="Derivation" progress={0} total="-- activites" />
                <ProgressRow label="Fonctions" progress={0} total="-- activites" />
              </div>
              <p className="mt-4 text-center text-xs text-muted-foreground">
                Les donnees reelles seront disponibles dans la prochaine version.
              </p>
            </CardContent>
          </Card>
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
