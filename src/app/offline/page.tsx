'use client'

/**
 * Offline Fallback Page
 *
 * Shown when the user is offline and the requested page is not cached.
 * Registered as the PWA offline fallback via next-pwa configuration.
 */

import { BookOpen, WifiOff } from 'lucide-react'

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
            Pas de connexion Internet pour le moment.
          </p>

          <div className="mx-auto mt-6 flex items-start gap-3 rounded-lg border border-primary/20 bg-primary/5 px-4 py-3 text-left">
            <BookOpen className="mt-0.5 h-5 w-5 shrink-0 text-primary" aria-hidden="true" />
            <p className="text-sm text-muted-foreground">
              Ton livret papier marche toujours, meme sans Internet.
              Continue tes exercices et scanne-les quand tu seras reconnecte.
            </p>
          </div>

          <Button
            className="mt-6"
            onClick={() => {
              if (typeof window !== 'undefined') {
                window.location.reload()
              }
            }}
          >
            Reessayer
          </Button>
        </CardContent>
      </Card>
    </div>
  )
}
