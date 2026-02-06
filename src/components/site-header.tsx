"use client"

import { usePathname } from "next/navigation"
import { Separator } from "@/components/ui/separator"
import { SidebarTrigger } from "@/components/ui/sidebar"

interface SiteHeaderProps {
  parcours?: string
}

export function SiteHeader({ parcours }: SiteHeaderProps) {
  const pathname = usePathname()

  // Get the title based on the current path
  const getTitle = () => {
    // Build page titles with parcours prefix
    const base = parcours ? `/${parcours}` : ''
    const pageTitles: Record<string, string> = {
      [base || '/']: 'Dashboard',
      [`${base}/apprendre`]: 'Apprendre',
      [`${base}/reviser`]: 'Réviser',
      '/profil': 'Profil',
    }

    // Exact match first
    if (pageTitles[pathname]) {
      return pageTitles[pathname]
    }
    // Check for sub-routes
    for (const [path, title] of Object.entries(pageTitles)) {
      if (path !== "/" && path !== base && pathname.startsWith(path)) {
        return title
      }
    }
    return "Learning"
  }

  return (
    <header className="flex h-(--header-height) shrink-0 items-center gap-2 border-b transition-[width,height] ease-linear group-has-data-[collapsible=icon]/sidebar-wrapper:h-(--header-height)">
      <div className="flex w-full items-center gap-1 px-4 lg:gap-2 lg:px-6">
        <SidebarTrigger className="-ml-1" />
        <Separator
          orientation="vertical"
          className="mx-2 data-[orientation=vertical]:h-4"
        />
        <h1 className="text-base font-medium">{getTitle()}</h1>
      </div>
    </header>
  )
}
