'use client'

/**
 * BottomNav — mobile bottom navigation bar for the paper-first experience.
 *
 * Four tabs: Mes Livrets, Scanner, QCM, Progres.
 * Hidden on desktop (lg breakpoint), sticky at the bottom on mobile.
 */

import Link from 'next/link'
import { usePathname } from 'next/navigation'
import { BookOpen, ScanLine, Zap, BarChart3 } from 'lucide-react'
import { cn } from '@/lib/utils'

const NAV_ITEMS = [
  { href: '/app/mes-livrets', label: 'Livrets', icon: BookOpen },
  { href: '/app/scan', label: 'Scanner', icon: ScanLine },
  { href: '/app/qcm', label: 'QCM', icon: Zap },
  { href: '/app/progres', label: 'Progres', icon: BarChart3 },
] as const

export function BottomNav() {
  const pathname = usePathname()

  return (
    <nav
      className="fixed right-0 bottom-0 left-0 z-40 border-t bg-background/95 backdrop-blur-sm lg:hidden"
      aria-label="Navigation principale"
    >
      <div className="mx-auto flex max-w-lg items-stretch">
        {NAV_ITEMS.map(({ href, label, icon: Icon }) => {
          const isActive = pathname.startsWith(href)
          return (
            <Link
              key={href}
              href={href}
              className={cn(
                'flex flex-1 flex-col items-center gap-0.5 px-2 py-2.5 text-[10px] font-medium transition-colors',
                isActive
                  ? 'text-primary'
                  : 'text-muted-foreground hover:text-foreground'
              )}
            >
              <Icon
                className={cn('h-5 w-5', isActive && 'text-primary')}
                aria-hidden="true"
              />
              <span>{label}</span>
              {isActive && (
                <span className="absolute top-0 h-0.5 w-8 rounded-full bg-primary" />
              )}
            </Link>
          )
        })}
      </div>
    </nav>
  )
}
