/**
 * KaTeX Math Extension
 *
 * Server-renderable math expressions using KaTeX.
 * Supports both inline <math> and block <math-block> tags.
 *
 * @example
 * ```html
 * <p>The formula <math>x^2 + y^2 = r^2</math> represents a circle.</p>
 * <math-block>\frac{-b \pm \sqrt{b^2-4ac}}{2a}</math-block>
 * ```
 */

import katex from 'katex'
import 'katex/dist/katex.min.css'

import { decodeHtmlEntities } from '../utils'

interface MathProps {
  latex: string
  block?: boolean
}

/**
 * Server Component - renders KaTeX to HTML string
 */
export function Math({ latex, block = false }: MathProps) {
  const decoded = decodeHtmlEntities(latex.trim())

  /* eslint-disable react-hooks/error-boundaries */
  try {
    const html = katex.renderToString(decoded, {
      displayMode: block,
      throwOnError: false,
      strict: false,
      trust: true,
    })

    if (block) {
      return (
        <div className="not-prose my-6 flex items-stretch overflow-hidden rounded-lg border border-stone-200/80 bg-gradient-to-r from-stone-50 to-white shadow-sm">
          <div className="w-1 shrink-0 bg-primary/60" aria-hidden="true" />
          <div
            className="flex-1 overflow-x-auto px-6 py-5 text-center"
            dangerouslySetInnerHTML={{ __html: html }}
          />
        </div>
      )
    }

    return (
      <span
        className="mx-0.5 inline-block align-middle"
        dangerouslySetInnerHTML={{ __html: html }}
      />
    )
  } catch {
    // Fallback for parse errors
    return (
      <code className="rounded bg-red-100 px-1 font-mono text-sm text-red-700">
        {decoded}
      </code>
    )
  }
  /* eslint-enable react-hooks/error-boundaries */
}
