/**
 * Parcours Layout
 *
 * Server component layout for all parcours-specific pages.
 * Reads programme modules from filesystem for the sidebar.
 */

import { AppSidebar } from '@/components/app-sidebar'
import { SiteHeader } from '@/components/site-header'
import { ParcoursBanner } from '@/components/parcours-banner'
import { EmailVerificationBanner } from '@/components/email-verification-banner'
import { MobileBottomNav } from '@/components/mobile-bottom-nav'
import { SidebarInset, SidebarProvider } from '@/components/ui/sidebar'
import { getParcoursConfig } from '@/lib/parcours'
import { getAllProgrammes, getCours } from '@/lib/content'

interface ParcoursLayoutProps {
  children: React.ReactNode
  params: Promise<{ parcours: string }>
}

export default async function ParcoursLayout({
  children,
  params,
}: ParcoursLayoutProps) {
  const { parcours } = await params
  const parcoursConfig = getParcoursConfig(parcours)

  // Resolve sidebar modules from filesystem
  const modules = (() => {
    if (!parcoursConfig) return []

    const programme = getAllProgrammes().find(
      (p) => p.levelSlug === parcoursConfig.level && p.sectionSlug === parcoursConfig.section
    )
    if (!programme) return []

    return programme.cours.map((slug) => {
      const cours = getCours(slug)
      return { id: slug, title: cours.title }
    })
  })()

  return (
    <SidebarProvider>
      <AppSidebar parcours={parcours} modules={modules} />
      <SidebarInset className="max-h-[calc(100svh-3.5rem)] md:max-h-svh overflow-hidden">
        <SiteHeader parcours={parcours} modules={modules} />
        <EmailVerificationBanner />
        <ParcoursBanner urlParcours={parcours} />
        <div className="flex flex-1 min-h-0 flex-col overflow-auto">
          <div id="main-content" className="@container/main flex flex-1 min-h-0 flex-col gap-2">
            <div className="flex flex-1 min-h-0 flex-col gap-4 py-4 md:gap-6 md:py-6">
              {children}
            </div>
          </div>
        </div>
      </SidebarInset>
      <MobileBottomNav parcours={parcours} />
    </SidebarProvider>
  )
}
