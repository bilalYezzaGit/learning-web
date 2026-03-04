/**
 * App Layout — shell for the paper-first mobile experience.
 *
 * Provides:
 * - Lightweight header (brand + user)
 * - Bottom navigation (mobile only, hidden on booklet detail)
 * - Conditional bottom padding via AppMain
 */

import { AppHeader } from '@/app/app/_components/app-header'
import { AppMain } from '@/app/app/_components/app-main'
import { BottomNav } from '@/app/app/_components/bottom-nav'
import { OnboardingOverlay } from '@/app/app/_components/onboarding-overlay'

export default function AppLayout({
  children,
}: Readonly<{ children: React.ReactNode }>) {
  return (
    <div className="flex h-svh flex-col">
      <AppHeader />
      <AppMain>{children}</AppMain>
      <BottomNav />
      <OnboardingOverlay />
    </div>
  )
}
