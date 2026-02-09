'use client'

/**
 * Simplifiable Block Wrapper
 *
 * Client component that wraps lesson concept content (Definition, Theorem, etc.)
 * and adds an "Explique-moi autrement" AI button.
 *
 * Uses a ref to extract the text content from the rendered children,
 * then passes it to the ConceptSimplifier when activated.
 *
 * Can be embedded inside Server Components (lesson-parts.tsx).
 */

import * as React from 'react'

import { ConceptSimplifier } from './concept-simplifier'

interface SimplifiableBlockProps {
  children: React.ReactNode
  conceptType: 'definition' | 'theorem' | 'property' | 'attention'
  lessonTitle?: string
}

export function SimplifiableBlock({ children, conceptType, lessonTitle = '' }: SimplifiableBlockProps) {
  const contentRef = React.useRef<HTMLDivElement>(null)
  const [conceptText, setConceptText] = React.useState<string | null>(null)

  const handleActivate = () => {
    if (contentRef.current) {
      setConceptText(contentRef.current.innerText)
    }
  }

  return (
    <>
      <div ref={contentRef}>
        {children}
      </div>
      {conceptText === null ? (
        <div className="mt-2 px-0">
          <button
            onClick={handleActivate}
            className="inline-flex items-center gap-1.5 rounded-md px-2 py-1 text-xs text-muted-foreground transition-colors hover:bg-primary/10 hover:text-primary"
          >
            <svg className="h-3.5 w-3.5" viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="2" strokeLinecap="round" strokeLinejoin="round">
              <path d="m12 3-1.912 5.813a2 2 0 0 1-1.275 1.275L3 12l5.813 1.912a2 2 0 0 1 1.275 1.275L12 21l1.912-5.813a2 2 0 0 1 1.275-1.275L21 12l-5.813-1.912a2 2 0 0 1-1.275-1.275L12 3Z" />
            </svg>
            Explique-moi autrement
          </button>
        </div>
      ) : (
        <ConceptSimplifier
          conceptContent={conceptText}
          conceptType={conceptType}
          lessonTitle={lessonTitle}
        />
      )}
    </>
  )
}
