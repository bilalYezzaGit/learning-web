'use client'

/**
 * PWA Install Prompt
 *
 * Shows a dismissible banner suggesting the user install the app on their home screen.
 * Uses the `beforeinstallprompt` event for Chrome/Edge and falls back to
 * instructions for iOS Safari.
 */

import * as React from 'react'
import { Download, X } from 'lucide-react'

import { Button } from '@/components/ui/button'
import { Card, CardContent } from '@/components/ui/card'

interface BeforeInstallPromptEvent extends Event {
  prompt(): Promise<void>
  userChoice: Promise<{ outcome: 'accepted' | 'dismissed' }>
}

const DISMISSED_KEY = 'pwa-install-dismissed'

export function PwaInstallPrompt() {
  const [deferredPrompt, setDeferredPrompt] = React.useState<BeforeInstallPromptEvent | null>(null)
  const [showPrompt, setShowPrompt] = React.useState(false)
  const [isIos, setIsIos] = React.useState(false)

  React.useEffect(() => {
    // Don't show if already dismissed or already installed
    if (sessionStorage.getItem(DISMISSED_KEY)) return
    if (window.matchMedia('(display-mode: standalone)').matches) return

    // Detect iOS
    const ua = navigator.userAgent
    const isIosDevice = /iPad|iPhone|iPod/.test(ua) && !('MSStream' in window)
    setIsIos(isIosDevice)

    // Listen for the install prompt (Chrome/Edge)
    const handler = (e: Event) => {
      e.preventDefault()
      setDeferredPrompt(e as BeforeInstallPromptEvent)
      setShowPrompt(true)
    }

    window.addEventListener('beforeinstallprompt', handler)

    // For iOS, show the prompt after a delay (no beforeinstallprompt event)
    if (isIosDevice) {
      const timer = setTimeout(() => setShowPrompt(true), 3000)
      return () => {
        clearTimeout(timer)
        window.removeEventListener('beforeinstallprompt', handler)
      }
    }

    return () => window.removeEventListener('beforeinstallprompt', handler)
  }, [])

  const handleInstall = async () => {
    if (!deferredPrompt) return
    await deferredPrompt.prompt()
    const { outcome } = await deferredPrompt.userChoice
    if (outcome === 'accepted') {
      setShowPrompt(false)
    }
    setDeferredPrompt(null)
  }

  const handleDismiss = () => {
    setShowPrompt(false)
    sessionStorage.setItem(DISMISSED_KEY, '1')
  }

  if (!showPrompt) return null

  return (
    <div className="fixed inset-x-0 bottom-4 z-50 px-4 sm:bottom-6 sm:px-6">
      <Card className="mx-auto max-w-sm border-primary/20 bg-background/95 shadow-lg backdrop-blur-sm">
        <CardContent className="flex items-start gap-3 py-4">
          <div className="flex h-10 w-10 shrink-0 items-center justify-center rounded-lg bg-primary/10">
            <Download className="h-5 w-5 text-primary" aria-hidden="true" />
          </div>
          <div className="min-w-0 flex-1">
            <p className="text-sm font-medium">Installer l&apos;application</p>
            {isIos ? (
              <p className="mt-0.5 text-xs text-muted-foreground">
                Appuyez sur le bouton Partager puis &quot;Sur l&apos;écran d&apos;accueil&quot;
              </p>
            ) : (
              <p className="mt-0.5 text-xs text-muted-foreground">
                Accédez à vos cours même hors connexion
              </p>
            )}
            {!isIos && deferredPrompt && (
              <Button size="sm" className="mt-2" onClick={handleInstall}>
                Installer
              </Button>
            )}
          </div>
          <Button
            variant="ghost"
            size="icon"
            className="h-8 w-8 shrink-0"
            onClick={handleDismiss}
          >
            <X className="h-4 w-4" aria-hidden="true" />
            <span className="sr-only">Fermer</span>
          </Button>
        </CardContent>
      </Card>
    </div>
  )
}
