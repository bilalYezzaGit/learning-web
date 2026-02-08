'use client'

/**
 * Parcours Banner
 *
 * Shows a banner when user is browsing a parcours different from their profile parcours.
 * Uses shadcn Alert component.
 */

import Link from 'next/link'
import { Info, ArrowRight } from 'lucide-react'

import { Alert, AlertDescription } from '@/components/ui/alert'
import { Button } from '@/components/ui/button'
import { useUserParcours, getParcoursConfig } from '@/lib/parcours'

interface ParcoursBannerProps {
  urlParcours: string
}

export function ParcoursBanner({ urlParcours }: ParcoursBannerProps) {
  const { parcours: userParcours, isLoading } = useUserParcours()

  // Don't show banner while loading or if user has no parcours
  if (isLoading || !userParcours) {
    return null
  }

  // Don't show banner if user is in their own parcours
  if (userParcours.slug === urlParcours) {
    return null
  }

  const urlParcoursConfig = getParcoursConfig(urlParcours)
  const userParcoursConfig = getParcoursConfig(userParcours.slug)

  if (!urlParcoursConfig || !userParcoursConfig) {
    return null
  }

  return (
    <Alert className="mx-4 mt-4 border-info/25 bg-info/10 lg:mx-6">
      <Info className="h-4 w-4 text-info" aria-hidden="true" />
      <AlertDescription className="flex flex-wrap items-center gap-x-2 gap-y-1 text-info-foreground">
        <span>Vous consultez &quot;{urlParcoursConfig.label}&quot;.</span>
        <span className="text-info">
          Votre parcours : {userParcoursConfig.label}
        </span>
        <Button
          variant="link"
          size="sm"
          className="h-auto p-0 text-info"
          asChild
        >
          <Link href={`/${userParcours.slug}`}>
            Aller à mon parcours
            <ArrowRight className="ml-1 h-3 w-3" aria-hidden="true" />
          </Link>
        </Button>
      </AlertDescription>
    </Alert>
  )
}
