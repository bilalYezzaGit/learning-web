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

interface LessonPartProps {
  children: React.ReactNode
  title?: string
}

export function Definition({ children, title }: LessonPartProps) {
  return (
    <aside className="not-prose my-6 overflow-hidden rounded-lg border border-indigo-200 bg-indigo-50 dark:border-indigo-800 dark:bg-indigo-950/20">
      <div className="flex items-center gap-2 border-b border-indigo-200 px-4 py-2.5 dark:border-indigo-800">
        <BookText className="h-5 w-5 shrink-0 text-indigo-600 dark:text-indigo-400" aria-hidden="true" />
        <span className="text-sm font-semibold tracking-wide text-indigo-600 dark:text-indigo-400">
          {title ?? 'Definition'}
        </span>
      </div>
      <div className="prose prose-stone dark:prose-invert max-w-none px-4 py-4">
        {children}
      </div>
    </aside>
  )
}

export function Theorem({ children, title }: LessonPartProps) {
  return (
    <aside className="not-prose my-6 overflow-hidden rounded-lg border border-violet-200 bg-violet-50 dark:border-violet-800 dark:bg-violet-950/20">
      <div className="flex items-center gap-2 border-b border-violet-200 px-4 py-2.5 dark:border-violet-800">
        <ShieldCheck className="h-5 w-5 shrink-0 text-violet-600 dark:text-violet-400" aria-hidden="true" />
        <span className="text-sm font-semibold tracking-wide text-violet-600 dark:text-violet-400">
          {title ?? 'Theoreme'}
        </span>
      </div>
      <div className="prose prose-stone dark:prose-invert max-w-none px-4 py-4">
        {children}
      </div>
    </aside>
  )
}

export function Property({ children, title }: LessonPartProps) {
  return (
    <aside className="not-prose my-6 overflow-hidden rounded-lg border border-sky-200 bg-sky-50 dark:border-sky-800 dark:bg-sky-950/20">
      <div className="flex items-center gap-2 border-b border-sky-200 px-4 py-2.5 dark:border-sky-800">
        <Puzzle className="h-5 w-5 shrink-0 text-sky-600 dark:text-sky-400" aria-hidden="true" />
        <span className="text-sm font-semibold tracking-wide text-sky-600 dark:text-sky-400">
          {title ?? 'Propriete'}
        </span>
      </div>
      <div className="prose prose-stone dark:prose-invert max-w-none px-4 py-4">
        {children}
      </div>
    </aside>
  )
}

export function Example({ children, title }: LessonPartProps) {
  return (
    <aside className="not-prose my-6 overflow-hidden rounded-lg border border-emerald-200 bg-emerald-50 dark:border-emerald-800 dark:bg-emerald-950/20">
      <div className="flex items-center gap-2 border-b border-emerald-200 px-4 py-2.5 dark:border-emerald-800">
        <PenLine className="h-5 w-5 shrink-0 text-emerald-600 dark:text-emerald-400" aria-hidden="true" />
        <span className="text-sm font-semibold tracking-wide text-emerald-600 dark:text-emerald-400">
          {title ?? 'Exemple'}
        </span>
      </div>
      <div className="prose prose-stone dark:prose-invert max-w-none px-4 py-4">
        {children}
      </div>
    </aside>
  )
}

export function Remark({ children, title }: LessonPartProps) {
  return (
    <aside className="not-prose my-6 overflow-hidden rounded-lg border border-amber-200 bg-amber-50 dark:border-amber-800 dark:bg-amber-950/20">
      <div className="flex items-center gap-2 border-b border-amber-200 px-4 py-2.5 dark:border-amber-800">
        <Info className="h-5 w-5 shrink-0 text-amber-600 dark:text-amber-400" aria-hidden="true" />
        <span className="text-sm font-semibold tracking-wide text-amber-600 dark:text-amber-400">
          {title ?? 'Remarque'}
        </span>
      </div>
      <div className="prose prose-stone dark:prose-invert max-w-none px-4 py-4">
        {children}
      </div>
    </aside>
  )
}

export function Attention({ children, title }: LessonPartProps) {
  return (
    <aside className="not-prose my-6 overflow-hidden rounded-lg border border-rose-200 bg-rose-50 dark:border-rose-800 dark:bg-rose-950/20">
      <div className="flex items-center gap-2 border-b border-rose-200 px-4 py-2.5 dark:border-rose-800">
        <TriangleAlert className="h-5 w-5 shrink-0 text-rose-600 dark:text-rose-400" aria-hidden="true" />
        <span className="text-sm font-semibold tracking-wide text-rose-600 dark:text-rose-400">
          {title ?? 'Attention'}
        </span>
      </div>
      <div className="prose prose-stone dark:prose-invert max-w-none px-4 py-4">
        {children}
      </div>
    </aside>
  )
}
