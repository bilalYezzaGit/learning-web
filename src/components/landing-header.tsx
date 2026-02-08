'use client'

import Link from 'next/link'

import { useAuth } from '@/lib/context'
import { useUserParcours } from '@/lib/parcours/use-user-parcours'
import { Avatar, AvatarFallback } from '@/components/ui/avatar'
import { Button } from '@/components/ui/button'
import { Skeleton } from '@/components/ui/skeleton'

export function LandingHeader() {
  const { user, isLoading: authLoading, isAuthenticated } = useAuth()
  const { parcours, isLoading: parcoursLoading } = useUserParcours()

  const isLoading = authLoading || (isAuthenticated && parcoursLoading)

  const dashboardHref = parcours?.slug ? `/${parcours.slug}` : '/select-parcours'

  const initials = user?.email
    ? user.email.slice(0, 2).toUpperCase()
    : '?'

  return (
    <header className="sticky top-0 z-50 border-b border-border/50 bg-background/80 backdrop-blur-lg">
      <div className="mx-auto flex h-16 w-full max-w-7xl items-center justify-between px-4 md:px-6">
        <Link href="/" className="flex items-center gap-2.5 transition-opacity hover:opacity-80">
          <div className="flex h-9 w-9 items-center justify-center rounded-xl bg-gradient-to-br from-violet to-pink text-lg font-bold text-white shadow-md">
            L
          </div>
          <span className="font-heading text-xl font-bold tracking-tight text-foreground">
            Learning OS
          </span>
        </Link>

        {isLoading ? (
          <div className="flex items-center gap-2">
            <Skeleton className="h-9 w-28 rounded-xl" />
            <Skeleton className="h-9 w-9 rounded-full" />
          </div>
        ) : isAuthenticated ? (
          <div className="flex items-center gap-2">
            <Button size="sm" className="rounded-xl font-heading font-semibold" asChild>
              <Link href={dashboardHref}>Mon parcours</Link>
            </Button>
            <Avatar className="h-9 w-9 ring-2 ring-violet/20">
              <AvatarFallback className="bg-violet-light text-xs font-semibold text-violet">
                {initials}
              </AvatarFallback>
            </Avatar>
          </div>
        ) : (
          <div className="flex items-center gap-2">
            <Button variant="ghost" size="sm" className="rounded-xl font-heading font-semibold" asChild>
              <Link href="/login">Se connecter</Link>
            </Button>
            <Button size="sm" className="rounded-xl bg-gradient-to-r from-violet to-pink font-heading font-semibold text-white shadow-md hover:shadow-lg hover:brightness-110" asChild>
              <Link href="/signup">S&apos;inscrire</Link>
            </Button>
          </div>
        )}
      </div>
    </header>
  )
}
