'use client'

import { useEffect } from 'react'
import Link from 'next/link'
import { useParams } from 'next/navigation'
import { Button } from '@/components/ui/button'
import { Card, CardContent } from '@/components/ui/card'
import { logError } from '@/lib/services/error-logger'

export default function ApprendreError({
  error,
  reset,
}: {
  error: Error & { digest?: string }
  reset: () => void
}) {
  const { parcours } = useParams<{ parcours: string }>()

  useEffect(() => {
    logError(error, { component: 'ApprendreErrorBoundary', metadata: { digest: error.digest } })
  }, [error])

  return (
    <div className="flex min-h-[60vh] flex-col items-center justify-center p-6">
      <Card className="mx-auto w-full max-w-md text-center">
        <CardContent className="space-y-6 py-12">
          <div className="space-y-2">
            <p className="font-serif text-5xl font-bold text-destructive">Oups</p>
            <h1 className="text-xl font-semibold">Erreur de chargement</h1>
            <p className="text-sm text-muted-foreground">
              Le contenu de ce module n&apos;a pas pu etre charge. Reessayez ou revenez a la liste des modules.
            </p>
          </div>
          <div className="flex flex-col gap-2 sm:flex-row sm:justify-center">
            <Button onClick={reset}>
              Reessayer
            </Button>
            <Button variant="outline" asChild>
              <Link href={`/${parcours}/apprendre`}>Retour aux modules</Link>
            </Button>
          </div>
        </CardContent>
      </Card>
    </div>
  )
}
