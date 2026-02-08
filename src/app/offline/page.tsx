'use client'

/**
 * Offline Fallback Page
 *
 * Shown when the user is offline and the requested page is not cached.
 * Registered as the PWA offline fallback via next-pwa configuration.
 */

import { WifiOff } from 'lucide-react'

import { Button } from '@/components/ui/button'
import { Card, CardContent } from '@/components/ui/card'

export default function OfflinePage() {
  return (
    <div className="flex min-h-svh items-center justify-center px-4">
      <Card className="w-full max-w-md text-center">
        <CardContent className="py-12">
          <div className="mx-auto mb-6 flex h-16 w-16 items-center justify-center rounded-full bg-muted">
            <WifiOff className="h-8 w-8 text-muted-foreground" aria-hidden="true" />
          </div>
          <h1 className="font-serif text-2xl font-semibold">Hors connexion</h1>
          <p className="mt-2 text-muted-foreground">
            Vous n&apos;êtes pas connecté à Internet. Vérifiez votre connexion et réessayez.
          </p>
          <p className="mt-1 text-sm text-muted-foreground">
            Les pages déjà visitées restent disponibles hors ligne.
          </p>
          <Button
            className="mt-6"
            onClick={() => {
              if (typeof window !== 'undefined') {
                window.location.reload()
              }
            }}
          >
            Réessayer
          </Button>
        </CardContent>
      </Card>
    </div>
  )
}
