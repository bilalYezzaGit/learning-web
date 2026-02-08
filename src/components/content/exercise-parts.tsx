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
    <details className="not-prose mt-6 rounded-lg border border-success/25 bg-success/10">
      <summary className="flex cursor-pointer select-none items-center gap-2 px-4 py-3 font-medium">
        <CheckCircle className="h-5 w-5 text-success" aria-hidden="true" />
        Voir la solution
      </summary>
      <div className="prose prose-stone dark:prose-invert max-w-none border-t border-success/25 px-4 py-4">
        {children}
      </div>
    </details>
  )
}

export function Methode({ children }: PartProps) {
  return (
    <details className="not-prose mt-6 rounded-lg border border-info/25 bg-info/10">
      <summary className="flex cursor-pointer select-none items-center gap-2 px-4 py-3 font-medium">
        <BookOpen className="h-5 w-5 text-info" aria-hidden="true" />
        Méthode
      </summary>
      <div className="prose prose-stone dark:prose-invert max-w-none border-t border-info/25 px-4 py-4">
        {children}
      </div>
    </details>
  )
}

export function Hint({ children }: PartProps) {
  return (
    <details className="not-prose mt-6 rounded-lg border border-warning/25 bg-warning/10">
      <summary className="flex cursor-pointer select-none items-center gap-2 px-4 py-3 font-medium">
        <Lightbulb className="h-5 w-5 text-warning" aria-hidden="true" />
        Indice
      </summary>
      <div className="prose prose-stone dark:prose-invert max-w-none border-t border-warning/25 px-4 py-4">
        {children}
      </div>
    </details>
  )
}

export function Erreurs({ children }: PartProps) {
  return (
    <details className="not-prose mt-6 rounded-lg border border-destructive/25 bg-destructive/10">
      <summary className="flex cursor-pointer select-none items-center gap-2 px-4 py-3 font-medium">
        <AlertTriangle className="h-5 w-5 text-destructive" aria-hidden="true" />
        Erreurs courantes
      </summary>
      <div className="prose prose-stone dark:prose-invert max-w-none border-t border-destructive/25 px-4 py-4">
        {children}
      </div>
    </details>
  )
}
