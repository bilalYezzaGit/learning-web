'use client'

/**
 * Client-side LaTeX renderer for AI responses.
 *
 * Parses text containing LaTeX ($..$ inline, $$...$$ block)
 * and renders them using KaTeX. Used for AI-generated content
 * that arrives as plain strings with LaTeX notation.
 */

import * as React from 'react'
import katex from 'katex'

interface LatexRendererProps {
  content: string
  className?: string
}

/**
 * Renders a string containing LaTeX math expressions.
 * Supports $...$ for inline math and $$...$$ for display math.
 */
export function LatexRenderer({ content, className }: LatexRendererProps) {
  const rendered = React.useMemo(() => renderLatex(content), [content])

  return (
    <div
      className={className}
      dangerouslySetInnerHTML={{ __html: rendered }}
    />
  )
}

function renderLatex(text: string): string {
  // First pass: replace $$...$$ (display math)
  let result = text.replace(/\$\$([\s\S]*?)\$\$/g, (_match, latex: string) => {
    try {
      return katex.renderToString(latex.trim(), {
        displayMode: true,
        throwOnError: false,
        strict: false,
      })
    } catch {
      return `<code>${latex}</code>`
    }
  })

  // Second pass: replace $...$ (inline math) — but not $$ which was already handled
  result = result.replace(/\$([^$\n]+?)\$/g, (_match, latex: string) => {
    try {
      return katex.renderToString(latex.trim(), {
        displayMode: false,
        throwOnError: false,
        strict: false,
      })
    } catch {
      return `<code>${latex}</code>`
    }
  })

  // Convert newlines to <br> for readability
  result = result.replace(/\n/g, '<br />')

  return result
}
