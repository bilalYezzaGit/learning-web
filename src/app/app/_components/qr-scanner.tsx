'use client'

/**
 * QR Scanner — uses qr-scanner (Nimiq) for cross-browser QR scanning.
 *
 * Works on iOS Safari, Android Chrome, and desktop browsers.
 * Uses native BarcodeDetector when available, falls back to JS-based WebWorker decoding.
 *
 * Requires CSP `worker-src 'self' blob:` for the WebWorker fallback.
 */

import * as React from 'react'
import QrScannerLib from 'qr-scanner'
import { Camera, CameraOff } from 'lucide-react'

import { Button } from '@/components/ui/button'

export type ScanResult =
  | { type: 'booklet'; code: string }
  | { type: 'exercise'; bookletCode: string; exerciseId: string }

interface QrScannerProps {
  onScan: (result: ScanResult) => void
}

export function QrScanner({ onScan }: QrScannerProps) {
  const videoRef = React.useRef<HTMLVideoElement>(null)
  const scannerRef = React.useRef<QrScannerLib | null>(null)
  const [error, setError] = React.useState<string | null>(null)
  const [isActive, setIsActive] = React.useState(false)
  const hasScannedRef = React.useRef(false)

  const stopCamera = React.useCallback(() => {
    scannerRef.current?.stop()
    setIsActive(false)
  }, [])

  const startCamera = React.useCallback(async () => {
    if (!videoRef.current) return

    // Reset state for re-scans
    hasScannedRef.current = false

    try {
      const scanner = new QrScannerLib(
        videoRef.current,
        (result) => {
          if (hasScannedRef.current) return
          const parsed = parseScanResult(result.data)
          if (parsed) {
            hasScannedRef.current = true
            scanner.stop()
            setIsActive(false)
            onScan(parsed)
          }
        },
        {
          preferredCamera: 'environment',
          highlightScanRegion: true,
          highlightCodeOutline: true,
          returnDetailedScanResult: true,
        },
      )

      scannerRef.current = scanner
      await scanner.start()
      setIsActive(true)
      setError(null)
    } catch (err) {
      const message = err instanceof Error ? err.message : String(err)
      if (message.includes('NotAllowedError') || message.includes('Permission') || message.includes('denied')) {
        setError('Acces camera refuse. Autorisez la camera dans les parametres du navigateur.')
      } else if (message.includes('not found') || message.includes('Requested device not found')) {
        setError('Aucune camera detectee. Verifiez que votre appareil a une camera.')
      } else {
        setError(`Impossible d'acceder a la camera: ${message}`)
      }
    }
  }, [onScan])

  // Cleanup on unmount
  React.useEffect(() => {
    return () => {
      scannerRef.current?.destroy()
      scannerRef.current = null
    }
  }, [])

  return (
    <div>
      {/* Video is always mounted so the ref is available for qr-scanner */}
      <div className={isActive ? 'relative overflow-hidden rounded-lg' : 'hidden'}>
        <video
          ref={videoRef}
          className="w-full rounded-lg"
          aria-label="Camera pour scanner le QR code"
        />
        <Button
          variant="secondary"
          size="sm"
          className="absolute bottom-3 right-3 z-10"
          onClick={stopCamera}
        >
          Arreter
        </Button>
      </div>

      {/* Error state */}
      {!isActive && error && (
        <div className="flex flex-col items-center gap-4 py-12 text-center">
          <CameraOff className="h-12 w-12 text-muted-foreground/30" aria-hidden="true" />
          <p className="text-sm text-destructive" role="alert">{error}</p>
          <Button variant="outline" onClick={() => { setError(null); startCamera() }}>
            Reessayer
          </Button>
        </div>
      )}

      {/* Initial state */}
      {!isActive && !error && (
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
      )}
    </div>
  )
}

/**
 * Parse a QR value into a scan result.
 * Supports:
 * - Exercise URL: /app/ex?b=CODE&e=EXERCISE_ID
 * - Pairing URL: /app/scan?code=CODE
 * - Direct code: "CONT-3M-001"
 */
function parseScanResult(value: string): ScanResult | null {
  // Try URL parse
  try {
    const url = new URL(value)

    // Exercise QR: /app/ex?b=...&e=...
    if (url.pathname === '/app/ex') {
      const b = url.searchParams.get('b')
      const e = url.searchParams.get('e')
      if (b && e) {
        return { type: 'exercise', bookletCode: b.toUpperCase().trim(), exerciseId: e.trim() }
      }
    }

    // Pairing QR: /app/scan?code=...
    const code = url.searchParams.get('code')
    if (code) {
      return { type: 'booklet', code: code.toUpperCase().trim() }
    }
  } catch {
    // Not a URL
  }

  // Raw code (uppercase alphanumeric with hyphens)
  const trimmed = value.toUpperCase().trim()
  if (/^[A-Z0-9-]+$/.test(trimmed) && trimmed.length >= 4) {
    return { type: 'booklet', code: trimmed }
  }

  return null
}
