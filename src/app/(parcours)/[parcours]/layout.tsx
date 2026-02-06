/**
 * Parcours Layout
 *
 * Server component layout for all parcours-specific pages.
 * Prefetches programmes data so the sidebar modules render instantly.
 */

import { dehydrate, HydrationBoundary } from '@tanstack/react-query'

import { AppSidebar } from '@/components/app-sidebar'
import { SiteHeader } from '@/components/site-header'
import { ParcoursBanner } from '@/components/parcours-banner'
import { SidebarInset, SidebarProvider } from '@/components/ui/sidebar'
import { getQueryClient } from '@/lib/query/get-query-client'
import { queryKeys } from '@/lib/query/keys'
import { fetchProgrammes } from '@/lib/services'

interface ParcoursLayoutProps {
  children: React.ReactNode
  params: Promise<{ parcours: string }>
}

export default async function ParcoursLayout({
  children,
  params,
}: ParcoursLayoutProps) {
  const { parcours } = await params

  const queryClient = getQueryClient()
  await queryClient.prefetchQuery({
    queryKey: queryKeys.programmes.catalogue(),
    queryFn: fetchProgrammes,
  })

  return (
    <HydrationBoundary state={dehydrate(queryClient)}>
      <SidebarProvider>
        <AppSidebar parcours={parcours} />
        <SidebarInset className="max-h-svh overflow-hidden">
          <SiteHeader parcours={parcours} />
          <ParcoursBanner urlParcours={parcours} />
          <div className="flex flex-1 min-h-0 flex-col overflow-auto">
            <div className="@container/main flex flex-1 min-h-0 flex-col gap-2">
              <div className="flex flex-1 min-h-0 flex-col gap-4 py-4 md:gap-6 md:py-6">
                {children}
              </div>
            </div>
          </div>
        </SidebarInset>
      </SidebarProvider>
    </HydrationBoundary>
  )
}
