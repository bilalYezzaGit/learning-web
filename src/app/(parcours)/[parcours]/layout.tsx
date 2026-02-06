'use client'

/**
 * Parcours Layout
 *
 * Layout for all parcours-specific pages.
 * Includes sidebar with parcours indicator and banner for out-of-parcours navigation.
 */

import { useParams } from 'next/navigation'

import { AppSidebar } from '@/components/app-sidebar'
import { SiteHeader } from '@/components/site-header'
import { ParcoursBanner } from '@/components/parcours-banner'
import { SidebarInset, SidebarProvider } from '@/components/ui/sidebar'

export default function ParcoursLayout({
  children,
}: {
  children: React.ReactNode
}) {
  const params = useParams()
  const parcours = params.parcours as string

  return (
    <SidebarProvider>
      <AppSidebar parcours={parcours} />
      <SidebarInset>
        <SiteHeader parcours={parcours} />
        <ParcoursBanner urlParcours={parcours} />
        <div className="flex flex-1 flex-col">
          <div className="@container/main flex flex-1 flex-col gap-2">
            <div className="flex flex-col gap-4 py-4 md:gap-6 md:py-6">
              {children}
            </div>
          </div>
        </div>
      </SidebarInset>
    </SidebarProvider>
  )
}
