'use client'

/**
 * QR Scanner — uses BarcodeDetector API + getUserMedia to scan QR codes.
 *
 * Falls back to a "not supported" message on browsers without BarcodeDetector.
 */

import * as React from 'react'
import { Camera, CameraOff } from 'lucide-react'

import { Button } from '@/components/ui/button'

interface QrScannerProps {
  onScan: (code: string) => void
}

export function QrScanner({ onScan }: QrScannerProps) {
  const videoRef = React.useRef<HTMLVideoElement>(null)
  const streamRef = React.useRef<MediaStream | null>(null)
  const rafRef = React.useRef<number>(0)
  const [error, setError] = React.useState<string | null>(null)
  const [isActive, setIsActive] = React.useState(false)
  const hasScannedRef = React.useRef(false)

  const stopCamera = React.useCallback(() => {
    cancelAnimationFrame(rafRef.current)
    if (streamRef.current) {
      streamRef.current.getTracks().forEach((t) => t.stop())
      streamRef.current = null
    }
    setIsActive(false)
  }, [])

  const startCamera = React.useCallback(async () => {
    // Check BarcodeDetector support
    if (!('BarcodeDetector' in window)) {
      setError('Votre navigateur ne supporte pas le scanner QR. Utilisez Chrome ou Edge.')
      return
    }

    try {
      const stream = await navigator.mediaDevices.getUserMedia({
        video: { facingMode: 'environment' },
      })
      streamRef.current = stream

      if (videoRef.current) {
        videoRef.current.srcObject = stream
        await videoRef.current.play()
      }

      setIsActive(true)
      setError(null)

      // eslint-disable-next-line @typescript-eslint/no-explicit-any
      const detector = new (window as any).BarcodeDetector({ formats: ['qr_code'] })

      const scan = async () => {
        if (!videoRef.current || !streamRef.current || hasScannedRef.current) return

        try {
          const barcodes: Array<{ rawValue: string }> = await detector.detect(videoRef.current)
          if (barcodes.length > 0 && barcodes[0]) {
            const value = barcodes[0].rawValue
            // Extract code from URL or use raw value
            const code = extractCodeFromValue(value)
            if (code) {
              hasScannedRef.current = true
              stopCamera()
              onScan(code)
              return
            }
          }
        } catch {
          // Detection failed for this frame, continue scanning
        }

        rafRef.current = requestAnimationFrame(scan)
      }

      rafRef.current = requestAnimationFrame(scan)
    } catch (err) {
      const message = err instanceof Error ? err.message : 'Erreur camera'
      if (message.includes('NotAllowedError') || message.includes('Permission')) {
        setError('Acces camera refuse. Autorisez la camera dans les parametres du navigateur.')
      } else {
        setError(`Impossible d'acceder a la camera: ${message}`)
      }
    }
  }, [onScan, stopCamera])

  // Cleanup on unmount
  React.useEffect(() => {
    return () => {
      cancelAnimationFrame(rafRef.current)
      if (streamRef.current) {
        streamRef.current.getTracks().forEach((t) => t.stop())
      }
    }
  }, [])

  if (error) {
    return (
      <div className="flex flex-col items-center gap-4 py-12 text-center">
        <CameraOff className="h-12 w-12 text-muted-foreground/30" aria-hidden="true" />
        <p className="text-sm text-destructive" role="alert">{error}</p>
        <Button variant="outline" onClick={startCamera}>
          Reessayer
        </Button>
      </div>
    )
  }

  if (!isActive) {
    return (
      <div className="flex flex-col items-center gap-4 py-12 text-center">
        <Camera className="h-12 w-12 text-muted-foreground/30" aria-hidden="true" />
        <p className="text-sm text-muted-foreground">
          Placez le QR code du livret devant la camera
        </p>
        <Button onClick={startCamera}>
          <Camera className="mr-2 h-4 w-4" aria-hidden="true" />
          Activer la camera
        </Button>
      </div>
    )
  }

  return (
    <div className="relative overflow-hidden rounded-lg">
      <video
        ref={videoRef}
        className="w-full rounded-lg"
        playsInline
        muted
        aria-label="Camera pour scanner le QR code"
      />
      {/* Scan overlay */}
      <div className="pointer-events-none absolute inset-0 flex items-center justify-center">
        <div className="h-48 w-48 rounded-2xl border-2 border-primary/60 shadow-[0_0_0_9999px_rgba(0,0,0,0.3)]" />
      </div>
      <Button
        variant="secondary"
        size="sm"
        className="absolute bottom-3 right-3"
        onClick={stopCamera}
      >
        Arreter
      </Button>
    </div>
  )
}

/**
 * Extract booklet code from a QR value.
 * Supports:
 * - Direct code: "CONT-3M-001"
 * - URL with ?code= param: "https://aylansolutions.com/app/scan?code=CONT-3M-001"
 */
function extractCodeFromValue(value: string): string | null {
  // Try URL parse
  try {
    const url = new URL(value)
    const code = url.searchParams.get('code')
    if (code) return code.toUpperCase().trim()
  } catch {
    // Not a URL
  }

  // Raw code (uppercase alphanumeric with hyphens)
  const trimmed = value.toUpperCase().trim()
  if (/^[A-Z0-9-]+$/.test(trimmed) && trimmed.length >= 4) {
    return trimmed
  }

  return null
}
