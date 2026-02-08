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
        <div
          className="my-4 overflow-x-auto rounded-lg bg-stone-50 px-4 py-6 text-center dark:bg-stone-900"
          dangerouslySetInnerHTML={{ __html: html }}
        />
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
      <code className="rounded bg-red-100 px-1 font-mono text-sm text-red-700 dark:bg-red-900/30 dark:text-red-400">
        {decoded}
      </code>
    )
  }
  /* eslint-enable react-hooks/error-boundaries */
}
