'use client'

/**
 * Analysis Status Widget
 *
 * Indicates whether the dashboard synthesis is up-to-date or needs refresh.
 * Shows a refresh button when recent activities haven't been accounted for.
 */

import { CheckCircle2, RefreshCw, AlertCircle } from 'lucide-react'

import { Button } from '@/components/ui/button'

interface AnalysisStatusWidgetProps {
  isUpToDate: boolean
  pendingActivities: number
  lastRefreshedAt: string | null
  onRefresh: () => void
}

function formatRelativeTime(isoString: string): string {
  const diff = Date.now() - new Date(isoString).getTime()
  const minutes = Math.floor(diff / 60_000)

  if (minutes < 1) return '\u00e0 l\u2019instant'
  if (minutes < 60) return `il y a ${minutes}min`

  const hours = Math.floor(minutes / 60)
  if (hours < 24) return `il y a ${hours}h`

  const days = Math.floor(hours / 24)
  return `il y a ${days}j`
}

export function AnalysisStatusWidget({
  isUpToDate,
  pendingActivities,
  lastRefreshedAt,
  onRefresh,
}: AnalysisStatusWidgetProps) {
  if (isUpToDate) {
    return (
      <div className="flex items-center gap-2 text-xs text-muted-foreground">
        <CheckCircle2 className="h-3.5 w-3.5 text-success" aria-hidden="true" />
        <span>
          Analyse &agrave; jour
          {lastRefreshedAt && <> &middot; {formatRelativeTime(lastRefreshedAt)}</>}
        </span>
      </div>
    )
  }

  return (
    <div className="flex items-center gap-2">
      <div className="flex items-center gap-1.5 text-xs text-warning">
        <AlertCircle className="h-3.5 w-3.5" aria-hidden="true" />
        <span>
          {pendingActivities} activit&eacute;{pendingActivities > 1 ? 's' : ''} r&eacute;cente{pendingActivities > 1 ? 's' : ''} non
          prise{pendingActivities > 1 ? 's' : ''} en compte
        </span>
      </div>
      <Button variant="ghost" size="sm" className="h-6 px-2 text-xs" onClick={onRefresh}>
        <RefreshCw className="mr-1 h-3 w-3" aria-hidden="true" />
        Actualiser
      </Button>
    </div>
  )
}
