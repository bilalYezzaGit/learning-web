/**
 * Content Renderer
 *
 * Server Component that parses HTML content and replaces custom tags
 * with React components using html-react-parser.
 *
 * Supported extensions:
 * - <math>...</math> - Inline KaTeX math
 * - <math-block>...</math-block> - Block KaTeX math
 * - <graph function="..." range="[...]"/> - Function graphs (Recharts)
 * - <variations>...</variations> - Sign/variation tables
 * - <youtube id="..." title="..."/> - YouTube embeds
 *
 * @example
 * ```tsx
 * <ContentRenderer html="<p>The formula <math>x^2</math> is quadratic.</p>" />
 * ```
 */

import parse, {
  domToReact,
  HTMLReactParserOptions,
  type DOMNode,
  type Element,
} from 'html-react-parser'

import { isElement, getTextContent, getAttr, getBoolAttr, parseList } from './utils'
import { Math } from './extensions/math'
import { Graph } from './extensions/graph'
import { YouTube } from './extensions/youtube'
import { VariationsTable, createVariationsFromAttribs } from './extensions/variations'

interface ContentRendererProps {
  html: string
  className?: string
}

/**
 * Collect all <row> elements from a variations element (handles nested structure)
 */
function collectRows(
  element: Element
): Array<{ label: string; kind: string; values: string }> {
  const rows: Array<{ label: string; kind: string; values: string }> = []

  function traverse(node: DOMNode) {
    if (isElement(node)) {
      if (node.name === 'row') {
        rows.push({
          label: getAttr(node, 'label'),
          kind: getAttr(node, 'kind') || getAttr(node, 'type', 'sign'),
          values: getAttr(node, 'values'),
        })
      }
      // Traverse children
      if (node.children) {
        for (const child of node.children) {
          traverse(child as DOMNode)
        }
      }
    }
  }

  if (element.children) {
    for (const child of element.children) {
      traverse(child as DOMNode)
    }
  }

  return rows
}

/**
 * Parser options with custom tag replacements
 */
const parserOptions: HTMLReactParserOptions = {
  replace: (domNode) => {
    if (!isElement(domNode)) return

    const { name, attribs } = domNode

    // Inline math: <math>...</math>
    if (name === 'math') {
      const latex = getTextContent(domNode)
      return <Math latex={latex} />
    }

    // Block math: <math-block>...</math-block>
    if (name === 'math-block') {
      const latex = getTextContent(domNode)
      return <Math latex={latex} block />
    }

    // Function graph: <graph function="..." range="[...]" />
    if (name === 'graph') {
      return (
        <Graph
          expression={getAttr(domNode, 'function')}
          range={getAttr(domNode, 'range', '[-5,5]')}
          yRange={attribs['y-range']}
          points={attribs['points']}
          hideFormula={getBoolAttr(domNode, 'hide-formula')}
        />
      )
    }

    // Variations table: <variations var="x" intervals="[...]">...</variations>
    if (name === 'variations') {
      const rowElements = collectRows(domNode)
      const props = createVariationsFromAttribs(attribs, rowElements)
      return <VariationsTable {...props} />
    }

    // YouTube embed: <youtube id="..." title="..." />
    if (name === 'youtube') {
      return (
        <YouTube
          videoId={getAttr(domNode, 'id')}
          title={attribs['title']}
        />
      )
    }

    // Skip <row> tags (handled by variations)
    if (name === 'row') {
      return <></>
    }

    // Return undefined to let parser handle other tags normally
    return undefined
  },
}

/**
 * Server Component that renders HTML content with custom extensions
 */
export function ContentRenderer({ html, className }: ContentRendererProps) {
  if (!html) return null

  return (
    <article
      className={`prose prose-stone max-w-none dark:prose-invert prose-headings:font-semibold prose-p:leading-relaxed prose-pre:bg-stone-100 dark:prose-pre:bg-stone-800 ${className ?? ''}`}
    >
      {parse(html, parserOptions)}
    </article>
  )
}

/**
 * Re-export extensions for direct use if needed
 */
export { Math, Graph, YouTube, VariationsTable }
