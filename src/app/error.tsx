'use client'

import { useEffect } from 'react'
import Link from 'next/link'
import { Button } from '@/components/ui/button'
import { Card, CardContent } from '@/components/ui/card'
import { logError } from '@/lib/services/error-logger'

export default function Error({
  error,
  reset,
}: {
  error: Error & { digest?: string }
  reset: () => void
}) {
  useEffect(() => {
    logError(error, { component: 'RootErrorBoundary', metadata: { digest: error.digest } })
  }, [error])

  return (
    <div className="bg-muted flex min-h-svh flex-col items-center justify-center p-6">
      <Card className="mx-auto w-full max-w-md text-center">
        <CardContent className="space-y-6 py-12">
          <div className="space-y-2">
            <p className="font-serif text-6xl font-bold text-destructive">Oups</p>
            <h1 className="text-xl font-semibold">Une erreur est survenue</h1>
            <p className="text-sm text-muted-foreground">
              Quelque chose s&apos;est mal passé. Réessayez ou revenez à l&apos;accueil.
            </p>
          </div>
          <div className="flex flex-col gap-2 sm:flex-row sm:justify-center">
            <Button onClick={reset}>
              Réessayer
            </Button>
            <Button variant="outline" asChild>
              <Link href="/">Retour à l&apos;accueil</Link>
            </Button>
          </div>
        </CardContent>
      </Card>
    </div>
  )
}
