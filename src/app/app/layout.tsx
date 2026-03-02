/**
 * App Layout — shell for the paper-first mobile experience.
 *
 * Provides:
 * - Lightweight header (brand + user)
 * - Bottom navigation (mobile only)
 * - Safe area padding for bottom nav
 */

import { AppHeader } from '@/app/app/_components/app-header'
import { BottomNav } from '@/app/app/_components/bottom-nav'

export default function AppLayout({
  children,
}: Readonly<{ children: React.ReactNode }>) {
  return (
    <div className="flex h-svh flex-col">
      <AppHeader />
      <main id="main-content" className="flex-1 overflow-auto pb-16 lg:pb-0">
        {children}
      </main>
      <BottomNav />
    </div>
  )
}
