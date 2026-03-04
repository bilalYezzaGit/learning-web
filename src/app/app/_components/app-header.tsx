'use client'

/**
 * AppHeader — lightweight header for the paper-first app shell.
 *
 * Shows brand + user avatar. Minimal, mobile-optimized.
 */

import Link from 'next/link'
import { BookOpen } from 'lucide-react'

import { NavUser } from '@/app/app/_components/nav-user'

export function AppHeader() {
  return (
    <header className="flex h-14 shrink-0 items-center justify-between border-b px-4">
      <Link href="/app/mes-livrets" className="flex items-center gap-2">
        <div className="flex h-8 w-8 items-center justify-center rounded-lg bg-primary text-primary-foreground">
          <BookOpen className="h-4 w-4" aria-hidden="true" />
        </div>
        <span className="font-serif text-lg font-semibold leading-none">Aylan</span>
      </Link>
      <NavUser />
    </header>
  )
}
