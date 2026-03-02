'use client'

/**
 * PrintToolbar — floating toolbar shown only on screen (hidden when printing).
 *
 * Provides a print button, a back link, and the booklet title.
 */

import { Printer, ArrowLeft, Download } from 'lucide-react'

interface PrintToolbarProps {
  backHref: string
  title: string
}

export function PrintToolbar({ backHref, title }: PrintToolbarProps) {
  return (
    <div className="print-toolbar fixed top-0 right-0 left-0 z-50 border-b border-stone-200 bg-white/95 shadow-sm backdrop-blur-sm">
      <div className="mx-auto flex max-w-5xl items-center justify-between px-4 py-2.5">
        <div className="flex items-center gap-3">
          <a
            href={backHref}
            className="flex items-center gap-1.5 rounded-md px-2 py-1 text-sm text-stone-500 transition-colors hover:bg-stone-100 hover:text-stone-700"
          >
            <ArrowLeft className="h-4 w-4" aria-hidden="true" />
            Retour
          </a>
          <span className="text-stone-200">|</span>
          <div className="flex items-center gap-2">
            <Download className="h-3.5 w-3.5 text-stone-400" aria-hidden="true" />
            <span className="text-sm font-medium text-stone-700">{title}</span>
          </div>
        </div>
        <button
          type="button"
          onClick={() => window.print()}
          className="flex items-center gap-2 rounded-lg bg-stone-800 px-5 py-2 text-sm font-medium text-white transition-colors hover:bg-stone-700"
        >
          <Printer className="h-4 w-4" aria-hidden="true" />
          Imprimer le livret
        </button>
      </div>
    </div>
  )
}
