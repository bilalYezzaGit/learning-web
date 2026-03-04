'use client'

import Link from 'next/link'

import { useAuth } from '@/lib/context'
import { Avatar, AvatarFallback } from '@/components/ui/avatar'
import { Button } from '@/components/ui/button'
import { Skeleton } from '@/components/ui/skeleton'

export function LandingHeader() {
  const { user, isLoading, isAuthenticated } = useAuth()

  const initials = user?.email
    ? user.email.slice(0, 2).toUpperCase()
    : '?'

  return (
    <header className="border-b bg-background/80 backdrop-blur-sm">
      <div className="mx-auto flex h-14 w-full max-w-7xl items-center justify-between px-4 md:px-6">
        <Link href="/" className="font-serif text-lg font-bold text-foreground">
          Aylan
        </Link>

        <nav className="flex items-center gap-2">
          {isLoading ? (
            <div className="flex items-center gap-2">
              <Skeleton className="h-8 w-24 rounded-md" />
              <Skeleton className="h-8 w-8 rounded-full" />
            </div>
          ) : isAuthenticated ? (
            <div className="flex items-center gap-2">
              <Button size="sm" asChild>
                <Link href="/app/mes-livrets">Mes livrets</Link>
              </Button>
              <Avatar className="h-8 w-8">
                <AvatarFallback className="text-xs">{initials}</AvatarFallback>
              </Avatar>
            </div>
          ) : (
            <>
              <Button variant="ghost" size="sm" asChild>
                <Link href="/login">Se connecter</Link>
              </Button>
              <Button size="sm" asChild>
                <Link href="/signup">S&apos;inscrire</Link>
              </Button>
            </>
          )}
        </nav>
      </div>
    </header>
  )
}
