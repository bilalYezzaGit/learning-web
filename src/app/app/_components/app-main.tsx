'use client'

/**
 * AppMain — main content area with conditional bottom padding.
 *
 * Removes bottom padding (for bottom nav) when inside a booklet detail page,
 * since the bottom nav is hidden there.
 */

import { usePathname } from 'next/navigation'

export function AppMain({ children }: { children: React.ReactNode }) {
  const pathname = usePathname()
  const isBookletDetail = /^\/app\/mes-livrets\/[^/]+/.test(pathname)

  return (
    <main
      id="main-content"
      className={`flex-1 overflow-auto ${isBookletDetail ? '' : 'pb-16 lg:pb-0'}`}
    >
      {children}
    </main>
  )
}
