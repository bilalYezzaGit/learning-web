/**
 * App Layout — shell for the paper-first mobile experience.
 *
 * Provides:
 * - Lightweight header (brand + user)
 * - Floating scan button (QR scanner)
 * - First-time onboarding overlay
 */

import { AppHeader } from '@/app/app/_components/app-header'
import { AppMain } from '@/app/app/_components/app-main'
import { ScanFab } from '@/app/app/_components/scan-fab'
import { OnboardingOverlay } from '@/app/app/_components/onboarding-overlay'

export default function AppLayout({
  children,
}: Readonly<{ children: React.ReactNode }>) {
  return (
    <div className="flex h-svh flex-col">
      <AppHeader />
      <AppMain>{children}</AppMain>
      <ScanFab />
      <OnboardingOverlay />
    </div>
  )
}
