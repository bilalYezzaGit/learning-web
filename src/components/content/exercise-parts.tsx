/**
 * Exercise part components for MDX
 *
 * Used inside exercise atoms to structure content:
 * - <Enonce> — Exercise statement
 * - <Solution> — Collapsible solution
 * - <Methode> — Collapsible method tip
 * - <Hint> — Collapsible hint
 * - <Erreurs> — Collapsible common errors
 *
 * Design: Left accent bar + custom chevron animation.
 * All collapsible sections use native <details> — no client JS needed.
 */

import { BookOpen, CheckCircle, ChevronRight, Lightbulb, AlertTriangle } from 'lucide-react'

import { cn } from '@/lib/utils'

interface PartProps {
  children: React.ReactNode
}

interface CollapsibleConfig {
  label: string
  icon: React.ElementType
  accentClass: string
  bgClass: string
  iconClass: string
  borderClass: string
}

function CollapsiblePart({
  children,
  config,
}: PartProps & { config: CollapsibleConfig }) {
  const Icon = config.icon

  return (
    <details
      className={cn(
        'not-prose group/details mt-8 rounded-r-xl rounded-l-sm border-l-[3px] shadow-sm',
        config.accentClass,
        config.bgClass,
      )}
    >
      <summary className="flex cursor-pointer select-none items-center gap-2.5 px-4 py-3 font-medium [&::-webkit-details-marker]:hidden [&::marker]:hidden">
        <ChevronRight
          className="h-4 w-4 shrink-0 text-muted-foreground transition-transform duration-200 group-open/details:rotate-90"
          aria-hidden="true"
        />
        <Icon
          className={cn('h-5 w-5 shrink-0', config.iconClass)}
          aria-hidden="true"
        />
        <span className="text-sm font-semibold">{config.label}</span>
      </summary>
      <div
        className={cn(
          'prose prose-stone dark:prose-invert max-w-none border-t px-5 py-4',
          config.borderClass,
        )}
      >
        {children}
      </div>
    </details>
  )
}

const solutionConfig: CollapsibleConfig = {
  label: 'Voir la solution',
  icon: CheckCircle,
  accentClass: 'border-l-emerald-500 dark:border-l-emerald-400',
  bgClass:
    'bg-gradient-to-r from-emerald-50/60 to-emerald-50/10 dark:from-emerald-950/20 dark:to-emerald-950/5',
  iconClass: 'text-emerald-600 dark:text-emerald-400',
  borderClass: 'border-emerald-200/50 dark:border-emerald-800/30',
}

const methodeConfig: CollapsibleConfig = {
  label: 'Méthode',
  icon: BookOpen,
  accentClass: 'border-l-sky-500 dark:border-l-sky-400',
  bgClass:
    'bg-gradient-to-r from-sky-50/60 to-sky-50/10 dark:from-sky-950/20 dark:to-sky-950/5',
  iconClass: 'text-sky-600 dark:text-sky-400',
  borderClass: 'border-sky-200/50 dark:border-sky-800/30',
}

const hintConfig: CollapsibleConfig = {
  label: 'Indice',
  icon: Lightbulb,
  accentClass: 'border-l-amber-500 dark:border-l-amber-400',
  bgClass:
    'bg-gradient-to-r from-amber-50/60 to-amber-50/10 dark:from-amber-950/20 dark:to-amber-950/5',
  iconClass: 'text-amber-600 dark:text-amber-400',
  borderClass: 'border-amber-200/50 dark:border-amber-800/30',
}

const erreursConfig: CollapsibleConfig = {
  label: 'Erreurs courantes',
  icon: AlertTriangle,
  accentClass: 'border-l-rose-500 dark:border-l-rose-400',
  bgClass:
    'bg-gradient-to-r from-rose-50/60 to-rose-50/10 dark:from-rose-950/20 dark:to-rose-950/5',
  iconClass: 'text-rose-600 dark:text-rose-400',
  borderClass: 'border-rose-200/50 dark:border-rose-800/30',
}

export function Enonce({ children }: PartProps) {
  return <section className="mt-2">{children}</section>
}

export function Solution({ children }: PartProps) {
  return <CollapsiblePart config={solutionConfig}>{children}</CollapsiblePart>
}

export function Methode({ children }: PartProps) {
  return <CollapsiblePart config={methodeConfig}>{children}</CollapsiblePart>
}

export function Hint({ children }: PartProps) {
  return <CollapsiblePart config={hintConfig}>{children}</CollapsiblePart>
}

export function Erreurs({ children }: PartProps) {
  return <CollapsiblePart config={erreursConfig}>{children}</CollapsiblePart>
}
