'use client'

/**
 * BottomNav — mobile bottom navigation bar (Scribzee-style).
 *
 * Three tabs: Mes Livrets (left), Scanner FAB (center, elevated), Progres (right).
 * Hidden on desktop (lg breakpoint) and on booklet detail pages.
 */

import Link from 'next/link'
import { usePathname } from 'next/navigation'
import { BookOpen, ScanLine, BarChart3 } from 'lucide-react'
import { cn } from '@/lib/utils'

export function BottomNav() {
  const pathname = usePathname()

  // Hide bottom nav when inside a booklet detail page (full-screen experience)
  const isBookletDetail = /^\/app\/mes-livrets\/[^/]+/.test(pathname)
  if (isBookletDetail) return null

  const isLivretsActive = pathname.startsWith('/app/mes-livrets')
  const isScanActive = pathname.startsWith('/app/scan')
  const isProgresActive = pathname.startsWith('/app/progres')

  return (
    <nav
      className="fixed right-0 bottom-0 left-0 z-40 border-t bg-background/95 backdrop-blur-sm lg:hidden"
      style={{ paddingBottom: 'env(safe-area-inset-bottom)' }}
      aria-label="Navigation principale"
    >
      <div className="mx-auto grid h-14 max-w-lg grid-cols-3">
        {/* Left tab — Mes Livrets */}
        <Link
          href="/app/mes-livrets"
          className={cn(
            'flex flex-col items-center justify-center gap-0.5 text-[10px] font-medium transition-colors',
            isLivretsActive
              ? 'text-primary'
              : 'text-muted-foreground hover:text-foreground'
          )}
        >
          <BookOpen className="h-5 w-5" aria-hidden="true" />
          <span>Livrets</span>
        </Link>

        {/* Center FAB — Scanner */}
        <div className="flex items-center justify-center">
          <Link
            href="/app/scan"
            className={cn(
              'flex h-14 w-14 -translate-y-6 flex-col items-center justify-center rounded-full bg-primary shadow-lg transition-colors',
              isScanActive
                ? 'bg-primary/90'
                : 'hover:bg-primary/90'
            )}
          >
            <ScanLine className="h-6 w-6 text-primary-foreground" aria-hidden="true" />
            <span className="text-[9px] font-medium text-primary-foreground">Scan</span>
          </Link>
        </div>

        {/* Right tab — Progres */}
        <Link
          href="/app/progres"
          className={cn(
            'flex flex-col items-center justify-center gap-0.5 text-[10px] font-medium transition-colors',
            isProgresActive
              ? 'text-primary'
              : 'text-muted-foreground hover:text-foreground'
          )}
        >
          <BarChart3 className="h-5 w-5" aria-hidden="true" />
          <span>Progres</span>
        </Link>
      </div>
    </nav>
  )
}
