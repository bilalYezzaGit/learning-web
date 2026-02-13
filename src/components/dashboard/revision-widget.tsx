'use client'

/**
 * Revision Recommendation Widget
 *
 * Highlights relevant revision series: in-progress, weak areas, or new.
 */

import Link from 'next/link'
import { ArrowRight, Clock, RotateCcw, AlertTriangle, BookMarked } from 'lucide-react'

import { Badge } from '@/components/ui/badge'
import { Card, CardContent, CardHeader, CardTitle } from '@/components/ui/card'
import { Progress } from '@/components/ui/progress'
import type { RecommendedSeries } from '@/types/dashboard'

interface RevisionWidgetProps {
  series: RecommendedSeries[]
  parcours: string
}

const reasonConfig: Record<RecommendedSeries['reason'], {
  label: string
  icon: typeof RotateCcw
  variant: 'default' | 'secondary' | 'destructive' | 'outline'
}> = {
  'in-progress': { label: 'En cours', icon: RotateCcw, variant: 'default' },
  'weak-area': { label: 'A renforcer', icon: AlertTriangle, variant: 'destructive' },
  'not-started': { label: 'A d\u00e9couvrir', icon: BookMarked, variant: 'secondary' },
  'review': { label: 'R\u00e9vision', icon: RotateCcw, variant: 'outline' },
}

export function RevisionWidget({ series, parcours }: RevisionWidgetProps) {
  if (series.length === 0) {
    return (
      <Card>
        <CardHeader className="pb-3">
          <CardTitle className="text-base">R&eacute;vision recommand&eacute;e</CardTitle>
        </CardHeader>
        <CardContent>
          <p className="text-sm text-muted-foreground">
            Aucune s&eacute;rie de r&eacute;vision recommand&eacute;e pour le moment.
          </p>
        </CardContent>
      </Card>
    )
  }

  return (
    <Card>
      <CardHeader className="pb-3">
        <div className="flex items-center justify-between">
          <CardTitle className="text-base">R&eacute;vision recommand&eacute;e</CardTitle>
          <Link
            href={`/${parcours}/reviser`}
            className="flex items-center gap-1 text-xs text-muted-foreground transition-colors hover:text-foreground"
          >
            Tout voir
            <ArrowRight className="h-3 w-3" aria-hidden="true" />
          </Link>
        </div>
      </CardHeader>
      <CardContent className="space-y-2">
        {series.map((s) => {
          const config = reasonConfig[s.reason]
          const Icon = config.icon

          return (
            <Link
              key={s.slug}
              href={`/${parcours}/reviser/serie/${s.slug}`}
              className="group block"
            >
              <div className="rounded-lg border p-3 transition-colors group-hover:bg-muted/50">
                <div className="flex items-start justify-between gap-2">
                  <div className="min-w-0 flex-1">
                    <div className="flex items-center gap-2">
                      <Badge variant={config.variant} className="shrink-0 text-xs">
                        <Icon className="mr-1 h-3 w-3" aria-hidden="true" />
                        {config.label}
                      </Badge>
                      <span className="truncate text-xs text-muted-foreground">
                        T{s.trimestre}
                      </span>
                    </div>
                    <p className="mt-1 truncate text-sm font-medium">{s.title}</p>
                  </div>
                  <div className="flex shrink-0 items-center gap-1 text-xs text-muted-foreground">
                    <Clock className="h-3 w-3" aria-hidden="true" />
                    {s.estimatedMinutes}min
                  </div>
                </div>
                {s.completionPercentage > 0 && (
                  <Progress value={s.completionPercentage} className="mt-2 h-1" />
                )}
              </div>
            </Link>
          )
        })}
      </CardContent>
    </Card>
  )
}
