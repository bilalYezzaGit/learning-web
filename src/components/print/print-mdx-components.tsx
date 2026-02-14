/**
 * Print-optimized MDX component registry
 *
 * Variant of mdx-components.tsx for printable PDF views:
 * - Exercise solutions are hidden (students answer on paper)
 * - Lesson parts are always visible with print-friendly styling
 * - QCM parts are data carriers (same as normal)
 * - Interactive components (Graph, YouTube, TviExplorer) show fallbacks
 */

import React from 'react'

import { cn } from '@/lib/utils'
import { VariationsTable } from '@/content/extensions/variations'

// =============================================================================
// Exercise parts — print version
// =============================================================================

interface PartProps {
  children: React.ReactNode
}

/** Enonce: always visible */
function Enonce({ children }: PartProps) {
  return <section className="mt-2">{children}</section>
}

/** Solution: hidden in print (student writes on paper) */
function Solution({ children }: PartProps) {
  return (
    <div className="print-solution-hidden" aria-hidden="true">
      {children}
    </div>
  )
}

/** Methode: shown as a subtle hint box */
function Methode({ children }: PartProps) {
  return (
    <aside className="my-4 rounded-sm border-l-[3px] border-l-sky-500 bg-sky-50 px-4 py-3">
      <div className="mb-1 text-xs font-bold uppercase tracking-wider text-sky-600">
        Méthode
      </div>
      <div className="prose prose-sm max-w-none text-stone-700">
        {children}
      </div>
    </aside>
  )
}

/** Hint: shown as a subtle hint box */
function Hint({ children }: PartProps) {
  return (
    <aside className="my-4 rounded-sm border-l-[3px] border-l-amber-500 bg-amber-50 px-4 py-3">
      <div className="mb-1 text-xs font-bold uppercase tracking-wider text-amber-600">
        Indice
      </div>
      <div className="prose prose-sm max-w-none text-stone-700">
        {children}
      </div>
    </aside>
  )
}

/** Erreurs: hidden in print */
function Erreurs({ children }: PartProps) {
  return (
    <div className="print-solution-hidden" aria-hidden="true">
      {children}
    </div>
  )
}

// =============================================================================
// Lesson parts — print version (always visible, simplified)
// =============================================================================

interface LessonPartProps {
  children: React.ReactNode
  title?: string
}

interface PrintLessonConfig {
  defaultTitle: string
  borderColor: string
  bgColor: string
  titleColor: string
}

function PrintLessonPart({
  children,
  title,
  config,
}: LessonPartProps & { config: PrintLessonConfig }) {
  return (
    <aside
      className={cn(
        'my-6 rounded-sm border-l-[3px] px-4 py-3',
        config.borderColor,
        config.bgColor,
      )}
    >
      <div
        className={cn(
          'mb-1 text-xs font-bold uppercase tracking-wider',
          config.titleColor,
        )}
      >
        {title ?? config.defaultTitle}
      </div>
      <div className="prose prose-sm max-w-none text-stone-800">
        {children}
      </div>
    </aside>
  )
}

function Definition(props: LessonPartProps) {
  return (
    <PrintLessonPart
      {...props}
      config={{
        defaultTitle: 'Définition',
        borderColor: 'border-l-indigo-500',
        bgColor: 'bg-indigo-50',
        titleColor: 'text-indigo-600',
      }}
    />
  )
}

function Theorem(props: LessonPartProps) {
  return (
    <PrintLessonPart
      {...props}
      config={{
        defaultTitle: 'Théorème',
        borderColor: 'border-l-violet-500',
        bgColor: 'bg-violet-50',
        titleColor: 'text-violet-600',
      }}
    />
  )
}

function Property(props: LessonPartProps) {
  return (
    <PrintLessonPart
      {...props}
      config={{
        defaultTitle: 'Propriété',
        borderColor: 'border-l-sky-500',
        bgColor: 'bg-sky-50',
        titleColor: 'text-sky-600',
      }}
    />
  )
}

function Example(props: LessonPartProps) {
  return (
    <PrintLessonPart
      {...props}
      config={{
        defaultTitle: 'Exemple',
        borderColor: 'border-l-emerald-500',
        bgColor: 'bg-emerald-50',
        titleColor: 'text-emerald-600',
      }}
    />
  )
}

function Remark(props: LessonPartProps) {
  return (
    <PrintLessonPart
      {...props}
      config={{
        defaultTitle: 'Remarque',
        borderColor: 'border-l-amber-500',
        bgColor: 'bg-amber-50',
        titleColor: 'text-amber-600',
      }}
    />
  )
}

function Attention(props: LessonPartProps) {
  return (
    <PrintLessonPart
      {...props}
      config={{
        defaultTitle: 'Attention',
        borderColor: 'border-l-rose-500',
        bgColor: 'bg-rose-50',
        titleColor: 'text-rose-600',
      }}
    />
  )
}

// =============================================================================
// QCM parts — data carriers (same as normal, render nothing)
// =============================================================================

interface QuestionProps { children: React.ReactNode }
interface OptionProps { children: React.ReactNode; correct?: boolean }
interface ExplanationProps { children: React.ReactNode }

function Question(_props: QuestionProps) { return null } // eslint-disable-line @typescript-eslint/no-unused-vars
function Option(_props: OptionProps) { return null } // eslint-disable-line @typescript-eslint/no-unused-vars
function Explanation(_props: ExplanationProps) { return null } // eslint-disable-line @typescript-eslint/no-unused-vars

// =============================================================================
// Interactive components — print fallbacks
// =============================================================================

interface GraphAdapterProps {
  function?: string
  fn?: string
  range?: string
  yRange?: string
  'y-range'?: string
  points?: string
  hideFormula?: boolean | string
  'hide-formula'?: string
  children?: React.ReactNode
}

function Graph(props: GraphAdapterProps) {
  const expression = props.function || props.fn || ''
  return (
    <div className="my-4 rounded border border-stone-300 bg-stone-50 px-4 py-6 text-center text-sm text-stone-500">
      <div className="font-medium">Graphe interactif</div>
      {expression && (
        <div className="mt-1 font-mono text-xs">f(x) = {expression}</div>
      )}
      <div className="mt-1 text-xs">Disponible dans l&apos;application</div>
    </div>
  )
}

interface YouTubeAdapterProps {
  id: string
  title?: string
}

function YouTube({ id, title }: YouTubeAdapterProps) {
  return (
    <div className="my-4 rounded border border-stone-300 bg-stone-50 px-4 py-3 text-sm text-stone-500">
      <span className="font-medium">Vidéo : </span>
      {title ?? `youtube.com/watch?v=${id}`}
    </div>
  )
}

function TviExplorer() {
  return (
    <div className="my-4 rounded border border-stone-300 bg-stone-50 px-4 py-3 text-center text-sm text-stone-500">
      Explorateur TVI — disponible dans l&apos;application
    </div>
  )
}

// =============================================================================
// Variations — reuse existing component (it renders a static table)
// =============================================================================

function parseList(listStr: string): string[] {
  const cleaned = listStr.replace(/^\[/, '').replace(/\]$/, '').trim()
  if (!cleaned) return []
  return cleaned.split(',').map(s => s.trim())
}

interface RowProps {
  label: string
  kind: 'sign' | 'var'
  values: string
}

function Row(_props: RowProps) { return null } // eslint-disable-line @typescript-eslint/no-unused-vars

interface VariationsAdapterProps {
  var?: string
  intervals: string
  children?: React.ReactNode
}

function Variations({
  var: variable = 'x',
  intervals,
  children,
}: VariationsAdapterProps) {
  const rows: { label: string; kind: 'sign' | 'var'; values: string[] }[] = []

  React.Children.forEach(children, child => {
    if (React.isValidElement<RowProps>(child) && child.type === Row) {
      rows.push({
        label: child.props.label,
        kind: child.props.kind === 'var' ? 'var' : 'sign',
        values: parseList(child.props.values),
      })
    }
  })

  return (
    <VariationsTable
      variable={variable}
      intervals={parseList(intervals)}
      rows={rows}
    />
  )
}

// =============================================================================
// Export registry
// =============================================================================

export const printMdxComponents = {
  Enonce,
  Solution,
  Methode,
  Hint,
  Erreurs,
  Definition,
  Theorem,
  Property,
  Example,
  Remark,
  Attention,
  Question,
  Option,
  Explanation,
  Variations,
  Row,
  Graph,
  YouTube,
  TviExplorer,
}
