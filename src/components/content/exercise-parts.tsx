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
 * All collapsible sections use native <details> — no client JS needed.
 */

import { BookOpen, CheckCircle, Lightbulb, AlertTriangle } from 'lucide-react'

interface PartProps {
  children: React.ReactNode
}

export function Enonce({ children }: PartProps) {
  return <section className="mt-2">{children}</section>
}

export function Solution({ children }: PartProps) {
  return (
    <details className="not-prose mt-6 rounded-lg border border-green-200 bg-green-50 dark:border-green-800 dark:bg-green-950/20">
      <summary className="flex cursor-pointer select-none items-center gap-2 px-4 py-3 font-medium">
        <CheckCircle className="h-5 w-5 text-green-600" />
        Voir la solution
      </summary>
      <div className="prose prose-stone dark:prose-invert max-w-none border-t border-green-200 px-4 py-4 dark:border-green-800">
        {children}
      </div>
    </details>
  )
}

export function Methode({ children }: PartProps) {
  return (
    <details className="not-prose mt-6 rounded-lg border border-blue-200 bg-blue-50 dark:border-blue-800 dark:bg-blue-950/20">
      <summary className="flex cursor-pointer select-none items-center gap-2 px-4 py-3 font-medium">
        <BookOpen className="h-5 w-5 text-blue-600" />
        Methode
      </summary>
      <div className="prose prose-stone dark:prose-invert max-w-none border-t border-blue-200 px-4 py-4 dark:border-blue-800">
        {children}
      </div>
    </details>
  )
}

export function Hint({ children }: PartProps) {
  return (
    <details className="not-prose mt-6 rounded-lg border border-amber-200 bg-amber-50 dark:border-amber-800 dark:bg-amber-950/20">
      <summary className="flex cursor-pointer select-none items-center gap-2 px-4 py-3 font-medium">
        <Lightbulb className="h-5 w-5 text-amber-600" />
        Indice
      </summary>
      <div className="prose prose-stone dark:prose-invert max-w-none border-t border-amber-200 px-4 py-4 dark:border-amber-800">
        {children}
      </div>
    </details>
  )
}

export function Erreurs({ children }: PartProps) {
  return (
    <details className="not-prose mt-6 rounded-lg border border-red-200 bg-red-50 dark:border-red-800 dark:bg-red-950/20">
      <summary className="flex cursor-pointer select-none items-center gap-2 px-4 py-3 font-medium">
        <AlertTriangle className="h-5 w-5 text-red-600" />
        Erreurs courantes
      </summary>
      <div className="prose prose-stone dark:prose-invert max-w-none border-t border-red-200 px-4 py-4 dark:border-red-800">
        {children}
      </div>
    </details>
  )
}
