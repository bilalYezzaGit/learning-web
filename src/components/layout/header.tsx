'use client'

/**
 * Header
 *
 * Top bar with search trigger and user menu.
 * Search opens Command Menu (Cmd+K).
 */

import Link from 'next/link'
import { Menu, Search } from 'lucide-react'

import { Button } from '@/components/ui/button'
import { useAuth } from '@/lib/hooks/use-auth'

interface HeaderProps {
  onMenuClick?: () => void
  onSearchClick?: () => void
}

export function Header({ onMenuClick, onSearchClick }: HeaderProps) {
  const { user, isLoading, isAuthenticated } = useAuth()

  // Get user initials for avatar
  const getInitials = () => {
    if (!user) return '?'
    if (user.displayName) {
      return user.displayName.charAt(0).toUpperCase()
    }
    if (user.email) {
      return user.email.charAt(0).toUpperCase()
    }
    if (user.isAnonymous) {
      return 'A'
    }
    return '?'
  }

  return (
    <header className="sticky top-0 z-40 flex h-14 items-center gap-4 border-b bg-background/95 px-4 backdrop-blur supports-[backdrop-filter]:bg-background/60">
      {/* Mobile menu button */}
      <Button
        variant="ghost"
        size="icon"
        className="md:hidden"
        onClick={onMenuClick}
      >
        <Menu className="h-5 w-5" />
        <span className="sr-only">Menu</span>
      </Button>

      {/* Search bar trigger */}
      <Button
        variant="outline"
        className="relative h-9 w-full justify-start text-sm text-muted-foreground sm:w-64 md:w-80"
        onClick={onSearchClick}
      >
        <Search className="mr-2 h-4 w-4" />
        <span className="hidden sm:inline-flex">Rechercher...</span>
        <span className="inline-flex sm:hidden">Rechercher</span>
        <kbd className="pointer-events-none absolute right-2 hidden h-5 select-none items-center gap-1 rounded border bg-muted px-1.5 font-mono text-[10px] font-medium opacity-100 sm:flex">
          <span className="text-xs">⌘</span>K
        </kbd>
      </Button>

      {/* Spacer */}
      <div className="flex-1" />

      {/* User avatar */}
      {isLoading ? (
        <div className="h-8 w-8 animate-pulse rounded-full bg-muted" />
      ) : isAuthenticated ? (
        <Button variant="ghost" size="icon" className="rounded-full" asChild>
          <Link href="/profil">
            <div className="flex h-8 w-8 items-center justify-center rounded-full bg-primary text-sm font-medium text-primary-foreground">
              {getInitials()}
            </div>
            <span className="sr-only">Profil</span>
          </Link>
        </Button>
      ) : (
        <Button size="sm" asChild>
          <Link href="/login">Connexion</Link>
        </Button>
      )}
    </header>
  )
}
