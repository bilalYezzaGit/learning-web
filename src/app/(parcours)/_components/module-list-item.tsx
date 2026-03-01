import Link from 'next/link'
import { Check, ChevronRight, Play } from 'lucide-react'

import { Badge } from '@/components/ui/badge'
import { Progress } from '@/components/ui/progress'
import type { ModuleStatus } from '@/lib/hooks/use-module-progress'
import { formatDuration } from '@/lib/utils/format'

interface ModuleListItemProps {
  module: {
    id: string
    title: string
    description: string
    order: number
    estimatedMinutes: number
  }
  status: ModuleStatus
  done: number
  total: number
  percentage: number
  parcours: string
  meta?: React.ReactNode
}

export function ModuleListItem({
  module: mod,
  status,
  done,
  total,
  percentage,
  parcours,
  meta,
}: ModuleListItemProps) {
  return (
    <Link
      href={`/${parcours}/apprendre/${mod.id}`}
      className="flex items-center gap-4 border-b px-6 py-4 transition-colors last:border-b-0 hover:bg-muted/50"
    >
      {/* Left Icon */}
      <div
        className={`flex h-10 w-10 shrink-0 items-center justify-center rounded-lg ${
          status === 'completed'
            ? 'bg-success/10'
            : status === 'in-progress'
              ? 'bg-primary/10'
              : 'bg-muted'
        }`}
      >
        {status === 'completed' ? (
          <Check className="h-5 w-5 text-success" aria-hidden="true" />
        ) : status === 'in-progress' ? (
          <Play className="h-5 w-5 text-primary" aria-hidden="true" />
        ) : (
          <span className="text-sm font-medium text-muted-foreground" aria-hidden="true">
            {mod.order.toString().padStart(2, '0')}
          </span>
        )}
      </div>

      {/* Content */}
      <div className="min-w-0 flex-1">
        <div className="flex flex-wrap items-center gap-2">
          <p className={`font-medium ${status === 'completed' ? 'text-muted-foreground' : ''}`}>
            {mod.title}
          </p>
          {status === 'completed' && (
            <Badge variant="default" className="bg-success text-xs">
              Termine
            </Badge>
          )}
        </div>

        {mod.description && (
          <p className="mt-0.5 line-clamp-1 text-sm text-muted-foreground">
            {mod.description}
          </p>
        )}

        <div className="mt-2 flex flex-wrap items-center gap-2 text-xs text-muted-foreground">
          {meta ?? (
            <>
              <span>{formatDuration(mod.estimatedMinutes)}</span>
              <span>·</span>
              <span>{total} activites</span>
            </>
          )}
          {status === 'in-progress' && (
            <>
              <span>·</span>
              <span className="tabular-nums">
                {done}/{total} completees
              </span>
            </>
          )}
        </div>

        {/* Progress bar for in-progress modules */}
        {status === 'in-progress' && (
          <div className="mt-2 flex items-center gap-2">
            <Progress
              value={percentage}
              className="h-1.5 flex-1"
              aria-label={`Progression du module ${mod.title} : ${percentage}%`}
            />
            <span className="tabular-nums text-xs font-medium text-primary">
              {percentage}%
            </span>
          </div>
        )}
      </div>

      <ChevronRight className="h-5 w-5 shrink-0 text-muted-foreground" aria-hidden="true" />
    </Link>
  )
}
