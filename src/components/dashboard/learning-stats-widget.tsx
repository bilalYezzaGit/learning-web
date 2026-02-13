'use client'

/**
 * Learning Stats Widget
 *
 * Simple statistics about recent learning activity:
 * exercises done, QCMs completed, average score, streak, regularity.
 */

import { BookOpen, CheckCircle2, HelpCircle, Target, Flame, Calendar } from 'lucide-react'

import { Card, CardContent, CardHeader, CardTitle } from '@/components/ui/card'
import type { LearningStats } from '@/types/dashboard'

interface LearningStatsWidgetProps {
  data: LearningStats
}

interface StatItemProps {
  icon: React.ReactNode
  label: string
  value: string | number
  colorClass: string
}

function StatItem({ icon, label, value, colorClass }: StatItemProps) {
  return (
    <div className="flex items-center gap-3">
      <div className={`flex h-9 w-9 shrink-0 items-center justify-center rounded-lg ${colorClass}`}>
        {icon}
      </div>
      <div className="min-w-0">
        <p className="tabular-nums text-lg font-bold">{value}</p>
        <p className="truncate text-xs text-muted-foreground">{label}</p>
      </div>
    </div>
  )
}

export function LearningStatsWidget({ data }: LearningStatsWidgetProps) {
  return (
    <Card>
      <CardHeader className="pb-3">
        <CardTitle className="text-base">Statistiques</CardTitle>
      </CardHeader>
      <CardContent>
        <div className="grid grid-cols-2 gap-4">
          <StatItem
            icon={<CheckCircle2 className="h-4 w-4 text-success" aria-hidden="true" />}
            label="Exercices"
            value={data.exercisesCompleted}
            colorClass="bg-success/10"
          />
          <StatItem
            icon={<HelpCircle className="h-4 w-4 text-info" aria-hidden="true" />}
            label="QCM"
            value={data.qcmsCompleted}
            colorClass="bg-info/10"
          />
          <StatItem
            icon={<Target className="h-4 w-4 text-primary" aria-hidden="true" />}
            label="Score moyen"
            value={data.averageQcmScore !== null ? `${data.averageQcmScore}%` : '–'}
            colorClass="bg-primary/10"
          />
          <StatItem
            icon={<BookOpen className="h-4 w-4 text-warning" aria-hidden="true" />}
            label="Cours vus"
            value={data.lessonsCompleted}
            colorClass="bg-warning/10"
          />
          <StatItem
            icon={<Flame className="h-4 w-4 text-destructive" aria-hidden="true" />}
            label="S&eacute;rie en cours"
            value={data.currentStreak > 0 ? `${data.currentStreak}j` : '–'}
            colorClass="bg-destructive/10"
          />
          <StatItem
            icon={<Calendar className="h-4 w-4 text-muted-foreground" aria-hidden="true" />}
            label="Jours actifs (30j)"
            value={data.activeDaysLast30}
            colorClass="bg-muted"
          />
        </div>
      </CardContent>
    </Card>
  )
}
