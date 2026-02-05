/**
 * Main Layout
 *
 * Layout for all main pages (dashboard, apprendre, reviser, profil).
 * Wraps content with AppShell (sidebar + header).
 */

import { AppShell } from '@/components/layout'

export default function MainLayout({
  children,
}: {
  children: React.ReactNode
}) {
  return <AppShell>{children}</AppShell>
}
