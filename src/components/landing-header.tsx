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
    <header className="bg-[oklch(0.065_0.005_264)]">
      <div className="mx-auto flex h-14 w-full max-w-7xl items-center justify-between px-4 md:px-6">
        <Link
          href="/"
          className="font-heading text-lg font-bold tracking-tight text-white"
        >
          Learning OS
        </Link>

        {isLoading ? (
          <div className="flex items-center gap-2">
            <Skeleton className="h-8 w-24 rounded-md bg-white/10" />
            <Skeleton className="h-8 w-8 rounded-full bg-white/10" />
          </div>
        ) : isAuthenticated ? (
          <div className="flex items-center gap-2">
            <Button size="sm" asChild>
              <Link href={dashboardHref}>Mon parcours</Link>
            </Button>
            <Avatar className="h-8 w-8 border border-white/20">
              <AvatarFallback className="bg-white/10 text-xs text-white">
                {initials}
              </AvatarFallback>
            </Avatar>
          </div>
        ) : (
          <div className="flex items-center gap-2">
            <Button
              variant="ghost"
              size="sm"
              className="text-white/70 hover:bg-white/10 hover:text-white"
              asChild
            >
              <Link href="/login">Se connecter</Link>
            </Button>
            <Button size="sm" asChild>
              <Link href="/signup">S&apos;inscrire</Link>
            </Button>
          </div>
        )}
      </div>
    </header>
  )
}
