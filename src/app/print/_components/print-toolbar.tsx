'use client'

/**
 * PrintToolbar — floating toolbar shown only on screen (hidden when printing).
 * Provides a print button and a back link.
 */

import { Printer, ArrowLeft } from 'lucide-react'

interface PrintToolbarProps {
  backHref: string
  title: string
}

export function PrintToolbar({ backHref, title }: PrintToolbarProps) {
  return (
    <div className="print:hidden fixed top-0 right-0 left-0 z-50 border-b bg-white/95 shadow-sm backdrop-blur-sm">
      <div className="mx-auto flex max-w-4xl items-center justify-between px-4 py-3">
        <div className="flex items-center gap-3">
          <a
            href={backHref}
            className="flex items-center gap-1.5 text-sm text-muted-foreground transition-colors hover:text-foreground"
          >
            <ArrowLeft className="h-4 w-4" aria-hidden="true" />
            Retour
          </a>
          <span className="text-muted-foreground/40">|</span>
          <span className="text-sm font-medium">{title}</span>
        </div>
        <button
          type="button"
          onClick={() => window.print()}
          className="flex items-center gap-2 rounded-lg bg-primary px-4 py-2 text-sm font-medium text-primary-foreground transition-colors hover:bg-primary/90"
        >
          <Printer className="h-4 w-4" aria-hidden="true" />
          Imprimer le livret
        </button>
      </div>
    </div>
  )
}
