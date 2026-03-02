'use client'

/**
 * PaperFirstBanner — soft redirect banner shown on old parcours pages.
 *
 * Invites users to try the new paper-first experience at /app/.
 * Dismissible via localStorage. Non-blocking — the old pages still work.
 */

import * as React from 'react'
import Link from 'next/link'
import { BookOpen, X } from 'lucide-react'

const STORAGE_KEY = 'paper-first-banner-dismissed'

export function PaperFirstBanner() {
  const [dismissed, setDismissed] = React.useState(true) // hidden by default to avoid flash

  React.useEffect(() => {
    try {
      setDismissed(localStorage.getItem(STORAGE_KEY) === 'true')
    } catch {
      setDismissed(false)
    }
  }, [])

  const handleDismiss = () => {
    setDismissed(true)
    try {
      localStorage.setItem(STORAGE_KEY, 'true')
    } catch {
      // ignore
    }
  }

  if (dismissed) return null

  return (
    <div className="border-b bg-primary/5 px-4 py-3">
      <div className="flex items-start gap-3">
        <div className="flex h-8 w-8 shrink-0 items-center justify-center rounded-lg bg-primary/10">
          <BookOpen className="h-4 w-4 text-primary" aria-hidden="true" />
        </div>
        <div className="min-w-0 flex-1">
          <p className="text-sm font-medium">
            Nouvelle experience disponible
          </p>
          <p className="mt-0.5 text-xs text-muted-foreground">
            Associe ton livret papier et accede aux corrections, QCM rapides et bien plus.
          </p>
          <Link
            href="/app/mes-livrets"
            className="mt-1.5 inline-block text-xs font-semibold text-primary underline underline-offset-2"
          >
            Essayer maintenant
          </Link>
        </div>
        <button
          type="button"
          onClick={handleDismiss}
          className="shrink-0 rounded-md p-1 text-muted-foreground transition-colors hover:bg-muted hover:text-foreground"
          aria-label="Fermer"
        >
          <X className="h-4 w-4" />
        </button>
      </div>
    </div>
  )
}
