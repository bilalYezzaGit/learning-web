'use client'

/**
 * BookletBackHeader — sticky back navigation for the booklet detail view.
 *
 * Replaces the bottom nav context with a clear "back to list" action.
 */

import Link from 'next/link'
import { ArrowLeft } from 'lucide-react'

import { Button } from '@/components/ui/button'

export function BookletBackHeader({
  title,
  backHref = '/app/mes-livrets',
  backLabel = 'Retour aux livrets',
}: {
  title: string
  backHref?: string
  backLabel?: string
}) {
  return (
    <div className="sticky top-0 z-30 border-b bg-background/95 backdrop-blur-sm px-4 py-2.5">
      <div className="flex items-center gap-3">
        <Button variant="ghost" size="icon" className="h-8 w-8 shrink-0" asChild>
          <Link href={backHref} aria-label={backLabel}>
            <ArrowLeft className="h-4 w-4" />
          </Link>
        </Button>
        <span className="truncate text-sm font-medium">{title}</span>
      </div>
    </div>
  )
}
