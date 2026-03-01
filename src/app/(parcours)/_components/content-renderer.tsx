'use client'

/**
 * ContentRenderer — renders pre-compiled HTML from the pipeline.
 *
 * Wraps the HTML in a prose article with dangerouslySetInnerHTML.
 * Handles hydration of interactive widget markers (data-widget).
 */

import * as React from 'react'
import { cn } from '@/lib/utils'

interface ContentRendererProps {
  html: string
  className?: string
}

export function ContentRenderer({ html, className }: ContentRendererProps) {
  return (
    <article
      className={cn('prose prose-stone max-w-none', className)}
      dangerouslySetInnerHTML={{ __html: html }}
    />
  )
}
