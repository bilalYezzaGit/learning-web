/**
 * MDX component registry
 *
 * Maps custom JSX tags used in MDX atoms to React components.
 * Passed to compileMDX() to handle:
 *
 * Exercise parts:  <Enonce>, <Solution>, <Methode>, <Hint>, <Erreurs>
 * Lesson parts:    <Definition>, <Theorem>, <Property>, <Example>, <Remark>, <Attention>
 * QCM parts:       <Question>, <Option>, <Explanation>
 * Variations:      <Variations var="x" intervals="[...]"><Row .../></Variations>
 * Graphs:          <Graph function="..." range="[...]" />
 * Video:           <YouTube id="..." title="..." />
 */

import React from 'react'

import { Enonce, Solution, Methode, Hint, Erreurs } from './exercise-parts'
import { Definition, Theorem, Property, Example, Remark, Attention } from './lesson-parts'
import { Question, Option, Explanation } from './qcm-parts'
import { Graph as GraphBase } from '@/content/extensions/graph'
import { YouTube as YouTubeBase } from '@/content/extensions/youtube'
import { VariationsTable } from '@/content/extensions/variations'

// =============================================================================
// Utilities
// =============================================================================

function parseList(listStr: string): string[] {
  const cleaned = listStr.replace(/^\[/, '').replace(/\]$/, '').trim()
  if (!cleaned) return []
  return cleaned.split(',').map(s => s.trim())
}

// =============================================================================
// Variations + Row (compound component pattern)
// =============================================================================

interface RowProps {
  label: string
  kind: 'sign' | 'var'
  values: string
}

/**
 * Data carrier — content is extracted by parent <Variations>.
 */
function Row(_props: RowProps) {
  return null
}

interface VariationsAdapterProps {
  var?: string
  intervals: string
  children?: React.ReactNode
}

/**
 * MDX adapter for VariationsTable.
 * Reads <Row> children props and delegates to VariationsTable.
 */
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
// Graph adapter
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

/**
 * MDX adapter for Graph.
 * Normalizes MDX attribute names to Graph component props.
 */
function Graph(props: GraphAdapterProps) {
  const expression = props.function || props.fn || ''
  const yRange = props.yRange || props['y-range']
  const hideFormula =
    props.hideFormula === true ||
    props.hideFormula === 'true' ||
    props['hide-formula'] === 'true'

  return (
    <GraphBase
      expression={expression}
      range={props.range}
      yRange={yRange}
      points={props.points}
      hideFormula={hideFormula}
    />
  )
}

// =============================================================================
// YouTube adapter
// =============================================================================

interface YouTubeAdapterProps {
  id: string
  title?: string
}

/**
 * MDX adapter for YouTube.
 * Maps `id` prop to `videoId`.
 */
function YouTube({ id, title }: YouTubeAdapterProps) {
  return <YouTubeBase videoId={id} title={title} />
}

// =============================================================================
// Export registry
// =============================================================================

export const mdxComponents = {
  // Exercise parts
  Enonce,
  Solution,
  Methode,
  Hint,
  Erreurs,
  // Lesson parts
  Definition,
  Theorem,
  Property,
  Example,
  Remark,
  Attention,
  // QCM parts
  Question,
  Option,
  Explanation,
  // Interactive content
  Variations,
  Row,
  Graph,
  YouTube,
}
