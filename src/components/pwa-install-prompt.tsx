'use client'

/**
 * PWA Install Prompt
 *
 * Shows a dismissible banner suggesting the user install the app on their home screen.
 * Uses the `beforeinstallprompt` event for Chrome/Edge and falls back to
 * instructions for iOS Safari.
 *
 * Dismiss persists 30 days in localStorage.
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
const THIRTY_DAYS = 30 * 24 * 60 * 60 * 1000

function isDismissed(): boolean {
  try {
    const dismissedAt = localStorage.getItem(DISMISSED_KEY)
    if (!dismissedAt) return false
    return Date.now() - Number(dismissedAt) < THIRTY_DAYS
  } catch {
    return false
  }
}

function persistDismiss(): void {
  try {
    localStorage.setItem(DISMISSED_KEY, Date.now().toString())
  } catch {
    // localStorage unavailable (private browsing, etc.)
  }
}

export function PwaInstallPrompt() {
  const [deferredPrompt, setDeferredPrompt] = React.useState<BeforeInstallPromptEvent | null>(null)
  const [showPrompt, setShowPrompt] = React.useState(false)
  const [isIos, setIsIos] = React.useState(false)
  const dismissedRef = React.useRef(false)

  React.useEffect(() => {
    // Don't show if already dismissed (within 30 days) or already installed
    if (isDismissed()) {
      dismissedRef.current = true
      return
    }
    if (window.matchMedia('(display-mode: standalone)').matches) {
      dismissedRef.current = true
      return
    }

    // Detect iOS
    const ua = navigator.userAgent
    const isIosDevice = /iPad|iPhone|iPod/.test(ua) && !('MSStream' in window)
    setIsIos(isIosDevice)

    // Listen for the install prompt (Chrome/Edge)
    const handler = (e: Event) => {
      e.preventDefault()
      // Guard: don't show if user already dismissed during this session
      if (dismissedRef.current) return
      setDeferredPrompt(e as BeforeInstallPromptEvent)
      setShowPrompt(true)
    }

    window.addEventListener('beforeinstallprompt', handler)

    // For iOS, show the prompt after a delay (no beforeinstallprompt event)
    if (isIosDevice) {
      const timer = setTimeout(() => {
        if (!dismissedRef.current) setShowPrompt(true)
      }, 3000)
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
      dismissedRef.current = true
      setShowPrompt(false)
      persistDismiss()
    }
    setDeferredPrompt(null)
  }

  const handleDismiss = () => {
    dismissedRef.current = true
    setShowPrompt(false)
    persistDismiss()
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
            className="h-10 w-10 shrink-0"
            onClick={handleDismiss}
            aria-label="Fermer le bandeau d'installation"
          >
            <X className="h-4 w-4" aria-hidden="true" />
          </Button>
        </CardContent>
      </Card>
    </div>
  )
}
