'use client'

/**
 * Select Parcours Page
 *
 * Page for authenticated users who haven't selected a parcours yet.
 */

import { useRouter } from 'next/navigation'
import { GraduationCap, ArrowRight } from 'lucide-react'

import { Button } from '@/components/ui/button'
import { CardContent, CardHeader, CardTitle } from '@/components/ui/card'
import { InteractiveCard } from '@/components/ui/interactive-card'
import { useAuth } from '@/lib/context'
import { useUserParcours, getAvailableParcours } from '@/lib/parcours'
import { trackParcoursSelected } from '@/lib/services/analytics-service'

export default function SelectParcoursPage() {
  const router = useRouter()
  const { isAuthenticated, isLoading: authLoading } = useAuth()
  const { setParcours, isLoading: parcoursLoading } = useUserParcours()
  const availableParcours = getAvailableParcours()

  const handleSelect = async (slug: string) => {
    try {
      trackParcoursSelected(slug)
      await setParcours(slug)
      router.push(`/${slug}`)
    } catch (e) {
      console.error('Failed to set parcours:', e)
    }
  }

  // Redirect if not authenticated
  if (!authLoading && !isAuthenticated) {
    router.push('/login')
    return null
  }

  if (authLoading || parcoursLoading) {
    return (
      <div className="flex min-h-svh items-center justify-center">
        <div className="text-muted-foreground">Chargement\u2026</div>
      </div>
    )
  }

  return (
    <div className="flex min-h-svh flex-col items-center justify-center p-6">
      <div className="mx-auto max-w-2xl text-center">
        <div className="mx-auto mb-6 flex h-20 w-20 items-center justify-center rounded-full bg-primary/10">
          <GraduationCap className="h-10 w-10 text-primary" aria-hidden="true" />
        </div>
        <h1 className="text-balance font-serif text-3xl font-bold">Bienvenue !</h1>
        <p className="mt-2 text-lg text-muted-foreground">
          Choisissez votre parcours pour commencer
        </p>

        <div className="mt-8 grid gap-4 sm:grid-cols-2">
          {availableParcours.map((parcours) => (
            <InteractiveCard
              key={parcours.slug}
              className="transition-[shadow,border-color] hover:border-primary hover:shadow-md"
              onClick={() => handleSelect(parcours.slug)}
            >
              <CardHeader className="pb-2">
                <CardTitle className="text-lg">{parcours.label}</CardTitle>
              </CardHeader>
              <CardContent>
                <p className="text-sm text-muted-foreground">{parcours.description}</p>
                <Button variant="link" className="mt-2 h-auto p-0 text-primary">
                  Choisir
                  <ArrowRight className="ml-1 h-4 w-4" />
                </Button>
              </CardContent>
            </InteractiveCard>
          ))}
        </div>
      </div>
    </div>
  )
}
