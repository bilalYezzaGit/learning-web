import Link from 'next/link'
import { BookOpen, Check, FlaskConical, HelpCircle, Play } from 'lucide-react'

import { Progress } from '@/components/ui/progress'
import type { ModuleStatus } from '@/lib/hooks/use-module-progress'
import { formatDuration } from '@/lib/utils/format'

interface ModuleCardProps {
  module: {
    id: string
    title: string
    description: string
    order: number
    estimatedMinutes: number
    lessonCount: number
    exerciseCount: number
    qcmCount: number
  }
  status: ModuleStatus
  done: number
  total: number
  percentage: number
  parcours: string
}

/**
 * Gradient palette for module card headers.
 * Cycles through warm, educational-friendly color pairs.
 */
const MODULE_GRADIENTS = [
  'from-primary/80 to-primary/50',
  'from-info/70 to-info/40',
  'from-success/70 to-success/40',
  'from-warning/70 to-warning/40',
  'from-chart-5/70 to-chart-5/40',
  'from-chart-4/70 to-chart-4/40',
] as const

export function ModuleCard({
  module: mod,
  status,
  done,
  total,
  percentage,
  parcours,
}: ModuleCardProps) {
  const gradientIndex = (mod.order - 1) % MODULE_GRADIENTS.length
  const gradient = MODULE_GRADIENTS[gradientIndex]

  return (
    <Link
      href={`/${parcours}/apprendre/${mod.id}`}
      className="group flex flex-col overflow-hidden rounded-xl border bg-card shadow-sm transition-shadow hover:shadow-md focus-visible:border-ring focus-visible:ring-ring/50 focus-visible:ring-[3px]"
    >
      {/* Visual header with gradient placeholder */}
      <div className={`relative h-32 bg-gradient-to-br ${gradient}`}>
        {/* Decorative pattern */}
        <div className="absolute inset-0 opacity-10">
          <svg className="h-full w-full" viewBox="0 0 100 100" preserveAspectRatio="none" aria-hidden="true">
            <circle cx="80" cy="20" r="30" fill="currentColor" className="text-white" />
            <circle cx="10" cy="80" r="20" fill="currentColor" className="text-white" />
          </svg>
        </div>

        {/* Module number */}
        <div className="absolute left-3 top-3">
          <span className="inline-flex h-8 w-8 items-center justify-center rounded-lg bg-white/20 text-sm font-bold text-white backdrop-blur-sm">
            {mod.order.toString().padStart(2, '0')}
          </span>
        </div>

        {/* Status badge */}
        {status === 'completed' && (
          <div className="absolute right-3 top-3">
            <span className="inline-flex items-center gap-1 rounded-full bg-success px-2.5 py-1 text-xs font-medium text-white">
              <Check className="h-3 w-3" aria-hidden="true" />
              Termine
            </span>
          </div>
        )}
        {status === 'in-progress' && (
          <div className="absolute right-3 top-3">
            <span className="inline-flex items-center gap-1 rounded-full bg-white/20 px-2.5 py-1 text-xs font-medium text-white backdrop-blur-sm">
              <Play className="h-3 w-3" aria-hidden="true" />
              En cours
            </span>
          </div>
        )}

        {/* Centered icon */}
        <div className="flex h-full items-center justify-center">
          <BookOpen className="h-10 w-10 text-white/60" aria-hidden="true" />
        </div>
      </div>

      {/* Content */}
      <div className="flex flex-1 flex-col p-4">
        <h4 className="line-clamp-2 font-serif text-base font-semibold leading-snug text-foreground group-hover:text-primary transition-colors">
          {mod.title}
        </h4>

        {mod.description && (
          <p className="mt-1.5 line-clamp-2 text-sm leading-relaxed text-muted-foreground">
            {mod.description}
          </p>
        )}

        {/* Meta info */}
        <div className="mt-3 flex flex-wrap items-center gap-x-3 gap-y-1 text-xs text-muted-foreground">
          <span className="inline-flex items-center gap-1">
            <BookOpen className="h-3 w-3" aria-hidden="true" />
            {mod.lessonCount} cours
          </span>
          <span className="inline-flex items-center gap-1">
            <FlaskConical className="h-3 w-3" aria-hidden="true" />
            {mod.exerciseCount} exercices
          </span>
          <span className="inline-flex items-center gap-1">
            <HelpCircle className="h-3 w-3" aria-hidden="true" />
            {mod.qcmCount} QCM
          </span>
        </div>

        {/* Duration */}
        <div className="mt-2 text-xs text-muted-foreground">
          {formatDuration(mod.estimatedMinutes)}
        </div>

        {/* Progress bar for in-progress modules */}
        {status === 'in-progress' && (
          <div className="mt-3 space-y-1">
            <div className="flex items-center justify-between text-xs">
              <span className="text-muted-foreground">
                {done}/{total} completees
              </span>
              <span className="tabular-nums font-medium text-primary">
                {percentage}%
              </span>
            </div>
            <Progress
              value={percentage}
              className="h-1.5"
              aria-label={`Progression du module ${mod.title} : ${percentage}%`}
            />
          </div>
        )}
      </div>
    </Link>
  )
}
