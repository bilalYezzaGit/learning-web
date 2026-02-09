/**
 * Lesson part components for MDX
 *
 * Used inside lesson atoms to structure content:
 * - <Definition> — Formal definition (indigo)
 * - <Theorem> — Theorem statement (violet)
 * - <Property> — Property / corollary (sky)
 * - <Example> — Worked example (emerald)
 * - <Remark> — Pedagogical note (amber)
 * - <Attention> — Common trap / warning (rose)
 *
 * Design: Left accent bar + subtle gradient background.
 * Always visible (aside elements) — no collapsible sections.
 */

import {
  BookText,
  ShieldCheck,
  Puzzle,
  PenLine,
  Info,
  TriangleAlert,
} from 'lucide-react'

import { cn } from '@/lib/utils'
import { SimplifiableBlock } from '@/components/ai/simplifiable-block'

interface LessonPartProps {
  children: React.ReactNode
  title?: string
}

interface LessonPartConfig {
  defaultTitle: string
  icon: React.ElementType
  accentClass: string
  bgClass: string
  iconClass: string
  badgeClass: string
  /** If set, enables the AI "Explique-moi autrement" feature */
  simplifiableType?: 'definition' | 'theorem' | 'property' | 'attention'
}

function LessonPart({
  children,
  title,
  config,
}: LessonPartProps & { config: LessonPartConfig }) {
  const Icon = config.icon

  const contentBlock = (
    <div className="prose prose-stone dark:prose-invert max-w-none px-5 pt-2 pb-5">
      {children}
    </div>
  )

  return (
    <aside
      className={cn(
        'not-prose my-8 rounded-r-xl rounded-l-sm border-l-[3.5px] shadow-sm',
        config.accentClass,
        config.bgClass,
      )}
    >
      <div className="px-5 pt-4 pb-1">
        <div className="flex items-center gap-2.5">
          <div
            className={cn(
              'flex h-7 w-7 shrink-0 items-center justify-center rounded-full',
              config.badgeClass,
            )}
          >
            <Icon className="h-3.5 w-3.5" aria-hidden="true" />
          </div>
          <span
            className={cn(
              'text-sm font-bold uppercase tracking-wider',
              config.iconClass,
            )}
          >
            {title ?? config.defaultTitle}
          </span>
        </div>
      </div>
      {config.simplifiableType ? (
        <div className="px-5 pt-2 pb-5">
          <SimplifiableBlock conceptType={config.simplifiableType}>
            <div className="prose prose-stone dark:prose-invert max-w-none">
              {children}
            </div>
          </SimplifiableBlock>
        </div>
      ) : (
        contentBlock
      )}
    </aside>
  )
}

const definitionConfig: LessonPartConfig = {
  defaultTitle: 'Définition',
  icon: BookText,
  accentClass: 'border-l-indigo-500 dark:border-l-indigo-400',
  bgClass:
    'bg-gradient-to-r from-indigo-50/80 to-indigo-50/20 dark:from-indigo-950/30 dark:to-indigo-950/5',
  iconClass: 'text-indigo-600 dark:text-indigo-400',
  badgeClass: 'bg-indigo-100 text-indigo-600 dark:bg-indigo-900/50 dark:text-indigo-400',
  simplifiableType: 'definition',
}

const theoremConfig: LessonPartConfig = {
  defaultTitle: 'Théorème',
  icon: ShieldCheck,
  accentClass: 'border-l-violet-500 dark:border-l-violet-400',
  bgClass:
    'bg-gradient-to-r from-violet-50/80 to-violet-50/20 dark:from-violet-950/30 dark:to-violet-950/5',
  iconClass: 'text-violet-600 dark:text-violet-400',
  badgeClass: 'bg-violet-100 text-violet-600 dark:bg-violet-900/50 dark:text-violet-400',
  simplifiableType: 'theorem',
}

const propertyConfig: LessonPartConfig = {
  defaultTitle: 'Propriété',
  icon: Puzzle,
  accentClass: 'border-l-sky-500 dark:border-l-sky-400',
  bgClass:
    'bg-gradient-to-r from-sky-50/80 to-sky-50/20 dark:from-sky-950/30 dark:to-sky-950/5',
  iconClass: 'text-sky-600 dark:text-sky-400',
  badgeClass: 'bg-sky-100 text-sky-600 dark:bg-sky-900/50 dark:text-sky-400',
  simplifiableType: 'property',
}

const exampleConfig: LessonPartConfig = {
  defaultTitle: 'Exemple',
  icon: PenLine,
  accentClass: 'border-l-emerald-500 dark:border-l-emerald-400',
  bgClass:
    'bg-gradient-to-r from-emerald-50/80 to-emerald-50/20 dark:from-emerald-950/30 dark:to-emerald-950/5',
  iconClass: 'text-emerald-600 dark:text-emerald-400',
  badgeClass:
    'bg-emerald-100 text-emerald-600 dark:bg-emerald-900/50 dark:text-emerald-400',
}

const remarkConfig: LessonPartConfig = {
  defaultTitle: 'Remarque',
  icon: Info,
  accentClass: 'border-l-amber-500 dark:border-l-amber-400',
  bgClass:
    'bg-gradient-to-r from-amber-50/80 to-amber-50/20 dark:from-amber-950/30 dark:to-amber-950/5',
  iconClass: 'text-amber-600 dark:text-amber-400',
  badgeClass: 'bg-amber-100 text-amber-600 dark:bg-amber-900/50 dark:text-amber-400',
}

const attentionConfig: LessonPartConfig = {
  defaultTitle: 'Attention',
  icon: TriangleAlert,
  accentClass: 'border-l-rose-500 dark:border-l-rose-400',
  bgClass:
    'bg-gradient-to-r from-rose-50/80 to-rose-50/20 dark:from-rose-950/30 dark:to-rose-950/5',
  iconClass: 'text-rose-600 dark:text-rose-400',
  badgeClass: 'bg-rose-100 text-rose-600 dark:bg-rose-900/50 dark:text-rose-400',
  simplifiableType: 'attention',
}

export function Definition(props: LessonPartProps) {
  return <LessonPart {...props} config={definitionConfig} />
}

export function Theorem(props: LessonPartProps) {
  return <LessonPart {...props} config={theoremConfig} />
}

export function Property(props: LessonPartProps) {
  return <LessonPart {...props} config={propertyConfig} />
}

export function Example(props: LessonPartProps) {
  return <LessonPart {...props} config={exampleConfig} />
}

export function Remark(props: LessonPartProps) {
  return <LessonPart {...props} config={remarkConfig} />
}

export function Attention(props: LessonPartProps) {
  return <LessonPart {...props} config={attentionConfig} />
}
