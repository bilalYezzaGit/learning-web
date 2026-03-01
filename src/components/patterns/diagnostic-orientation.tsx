'use client'

/**
 * Diagnostic Orientation
 *
 * Shows score-based orientation after a diagnostic quiz:
 * - < 40%: basics not acquired, review notions
 * - 40-69%: average level, keep practicing
 * - >= 70%: good level
 */

import * as React from 'react'
import Link from 'next/link'
import { AlertTriangle, CheckCircle, XCircle } from 'lucide-react'

import { Button } from '@/components/ui/button'
import { Card, CardContent } from '@/components/ui/card'
import { Progress } from '@/components/ui/progress'
import { useAuth } from '@/lib/context'
import { useProgress } from '@/lib/hooks/use-progress'

interface DiagnosticOrientationProps {
  parcours: string
  moduleId: string
  moduleTitle: string
  qcmActivityIds: string[]
}

export function DiagnosticOrientation({
  parcours,
  moduleId,
  moduleTitle,
  qcmActivityIds,
}: DiagnosticOrientationProps) {
  const { userId } = useAuth()
  const { getProgress } = useProgress(userId ?? undefined)

  // Compute aggregate score across all QCM activities
  const { score, total, percentage } = React.useMemo(() => {
    let s = 0
    let t = 0
    for (const id of qcmActivityIds) {
      const p = getProgress(id)
      if (p?.score !== undefined && p?.total !== undefined) {
        s += p.score
        t += p.total
      }
    }
    const pct = t > 0 ? Math.round((s / t) * 100) : 0
    return { score: s, total: t, percentage: pct }
  }, [qcmActivityIds, getProgress])

  // Determine orientation tier
  const tier = percentage >= 70 ? 'good' : percentage >= 40 ? 'average' : 'weak'

  const config = {
    weak: {
      icon: XCircle,
      iconClass: 'text-destructive',
      bgClass: 'bg-destructive/10',
      borderClass: 'border-destructive/20',
      title: 'Les bases ne sont pas encore acquises',
      message: `Revois les notions du module "${moduleTitle}" pour consolider tes bases avant de refaire le diagnostic.`,
      linkLabel: 'Revoir les notions',
      linkHref: `/${parcours}/apprendre/${moduleId}`,
    },
    average: {
      icon: AlertTriangle,
      iconClass: 'text-warning',
      bgClass: 'bg-warning/10',
      borderClass: 'border-warning/20',
      title: 'Niveau moyen, continue a progresser',
      message: `Tu as des acquis mais certaines notions meritent d'etre approfondies. Entraine-toi davantage sur le module "${moduleTitle}".`,
      linkLabel: "S'entrainer",
      linkHref: `/${parcours}/apprendre/${moduleId}`,
    },
    good: {
      icon: CheckCircle,
      iconClass: 'text-success',
      bgClass: 'bg-success/10',
      borderClass: 'border-success/20',
      title: 'Bon niveau !',
      message: `Tu maitrises bien les notions du module "${moduleTitle}". Continue comme ca !`,
      linkLabel: 'Retour au module',
      linkHref: `/${parcours}/apprendre/${moduleId}`,
    },
  } as const

  const c = config[tier]
  const Icon = c.icon

  if (total === 0) return null

  return (
    <Card className={c.borderClass}>
      <CardContent className="py-6">
        <div className="flex flex-col items-center text-center">
          {/* Icon */}
          <div className={`mb-4 flex h-16 w-16 items-center justify-center rounded-full ${c.bgClass}`}>
            <Icon className={`h-8 w-8 ${c.iconClass}`} aria-hidden="true" />
          </div>

          {/* Score */}
          <p className="mb-1 text-3xl font-bold tabular-nums">{percentage}%</p>
          <p className="mb-2 text-sm text-muted-foreground">
            {score}/{total} bonnes reponses
          </p>

          {/* Progress bar */}
          <Progress
            value={percentage}
            className="mb-4 h-2 w-48"
            aria-label={`Score : ${percentage}%`}
          />

          {/* Message */}
          <h2 className="mb-1 font-serif text-lg font-semibold">{c.title}</h2>
          <p className="mb-4 max-w-md text-sm text-muted-foreground">{c.message}</p>

          {/* CTA */}
          <Button asChild>
            <Link href={c.linkHref}>{c.linkLabel}</Link>
          </Button>
        </div>
      </CardContent>
    </Card>
  )
}
