'use client'

/**
 * App Shell
 *
 * Main layout wrapper using shadcn sidebar pattern.
 * Uses SidebarProvider for responsive sidebar behavior.
 */

import * as React from 'react'

import { AppSidebar } from '@/components/app-sidebar'
import { SiteHeader } from '@/components/site-header'
import { SidebarInset, SidebarProvider } from '@/components/ui/sidebar'
import { CommandMenu } from '@/components/patterns/command-menu'

interface AppShellProps {
  children: React.ReactNode
}

export function AppShell({ children }: AppShellProps) {
  const [commandOpen, setCommandOpen] = React.useState(false)

  return (
    <SidebarProvider>
      <AppSidebar onSearchClick={() => setCommandOpen(true)} />
      <SidebarInset>
        <SiteHeader />
        <main className="flex-1 overflow-auto">{children}</main>
      </SidebarInset>
      <CommandMenu open={commandOpen} onOpenChange={setCommandOpen} />
    </SidebarProvider>
  )
}
