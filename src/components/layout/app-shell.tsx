'use client'

/**
 * App Shell
 *
 * Main layout wrapper with sidebar (desktop) and mobile nav.
 * Provides the structure for all main pages.
 */

import * as React from 'react'

import { Sidebar } from './sidebar'
import { Header } from './header'
import { MobileNav } from './mobile-nav'
import { CommandMenu } from '@/components/patterns/command-menu'

interface AppShellProps {
  children: React.ReactNode
}

export function AppShell({ children }: AppShellProps) {
  const [mobileNavOpen, setMobileNavOpen] = React.useState(false)
  const [commandOpen, setCommandOpen] = React.useState(false)

  return (
    <div className="relative flex min-h-screen">
      {/* Desktop Sidebar */}
      <Sidebar className="hidden md:flex" />

      {/* Mobile Navigation */}
      <MobileNav open={mobileNavOpen} onOpenChange={setMobileNavOpen} />

      {/* Main Content */}
      <div className="flex flex-1 flex-col">
        <Header
          onMenuClick={() => setMobileNavOpen(true)}
          onSearchClick={() => setCommandOpen(true)}
        />
        <main className="flex-1 overflow-auto">{children}</main>
      </div>

      {/* Command Menu (Cmd+K) */}
      <CommandMenu open={commandOpen} onOpenChange={setCommandOpen} />
    </div>
  )
}
