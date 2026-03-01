'use client'

/**
 * Parcours Shell
 *
 * Header-only layout for parcours pages.
 * Brand + NavUser in header, content below.
 */

import Link from 'next/link'
import { BookOpen } from 'lucide-react'

import { Badge } from '@/components/ui/badge'
import { NavUser } from '@/app/(parcours)/_components/nav-user'
import { EmailVerificationBanner } from '@/app/(parcours)/_components/email-verification-banner'
import { getParcoursConfig } from '@/lib/parcours'

export interface ShellModule {
  id: string
  title: string
}

interface ParcoursShellProps {
  parcours: string
  modules: ShellModule[]
  children: React.ReactNode
}

export function ParcoursShell({ parcours, children }: ParcoursShellProps) {
  const parcoursConfig = getParcoursConfig(parcours)
  const base = `/${parcours}`

  return (
    <div className="flex h-svh flex-col">
      <header className="flex h-(--header-height) shrink-0 items-center justify-between border-b px-4 lg:px-6">
        {/* Brand */}
        <Link href={base} className="flex items-center gap-2">
          <div className="flex h-8 w-8 items-center justify-center rounded-lg bg-primary text-primary-foreground">
            <BookOpen className="h-4 w-4" aria-hidden="true" />
          </div>
          <div className="flex flex-col gap-0.5">
            <span className="font-serif text-lg font-semibold leading-none">Learning</span>
            {parcoursConfig && (
              <Badge variant="secondary" className="w-fit text-[10px] font-normal">
                {parcoursConfig.label}
              </Badge>
            )}
          </div>
        </Link>

        {/* User */}
        <NavUser />
      </header>

      <EmailVerificationBanner />

      <div id="main-content" className="@container/main flex flex-1 min-h-0 flex-col">
        {children}
      </div>
    </div>
  )
}
