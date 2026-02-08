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
    <header className="fixed top-0 z-50 w-full border-b border-white/5 bg-background/80 backdrop-blur-xl">
      <div className="mx-auto flex h-14 w-full max-w-7xl items-center justify-between px-4 md:px-6">
        <Link href="/" className="flex items-center gap-2">
          <div className="flex h-8 w-8 items-center justify-center rounded-lg bg-primary/20 font-mono text-sm font-bold text-primary">
            L
          </div>
          <span className="text-lg font-semibold tracking-tight">
            Learning <span className="text-primary">OS</span>
          </span>
        </Link>

        {isLoading ? (
          <div className="flex items-center gap-2">
            <Skeleton className="h-8 w-24 rounded-md" />
            <Skeleton className="h-8 w-8 rounded-full" />
          </div>
        ) : isAuthenticated ? (
          <div className="flex items-center gap-3">
            <Button size="sm" variant="outline" className="border-white/10 hover:bg-white/5" asChild>
              <Link href="/1ere-tc/apprendre">Explorer le parcours</Link>
            </Button>
            <Button size="sm" asChild>
              <Link href={dashboardHref}>Mon parcours</Link>
            </Button>
            <Avatar className="h-8 w-8 border border-white/10">
              <AvatarFallback className="bg-primary/10 text-xs text-primary">{initials}</AvatarFallback>
            </Avatar>
          </div>
        ) : (
          <div className="flex items-center gap-3">
            <Button variant="ghost" size="sm" className="text-muted-foreground hover:text-foreground" asChild>
              <Link href="/login">Se connecter</Link>
            </Button>
            <Button size="sm" className="bg-primary text-primary-foreground hover:bg-primary/90" asChild>
              <Link href="/1ere-tc/apprendre">Explorer</Link>
            </Button>
          </div>
        )}
      </div>
    </header>
  )
}
