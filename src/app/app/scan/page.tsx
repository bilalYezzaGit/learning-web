'use client'

/**
 * Scan Page — scan a QR code or enter a booklet code to navigate to content.
 *
 * Flow:
 * 1. User scans QR or enters code manually
 * 2. Redirect to the corresponding content page (exercise or booklet hub)
 */

import * as React from 'react'
import { useRouter } from 'next/navigation'
import { QrCode, Keyboard, ArrowRight } from 'lucide-react'

import { Button } from '@/components/ui/button'
import { Card, CardContent } from '@/components/ui/card'
import { Input } from '@/components/ui/input'
import { QrScanner, type ScanResult } from '@/app/app/_components/qr-scanner'

export default function ScanPage() {
  const router = useRouter()
  const [code, setCode] = React.useState('')
  const [mode, setMode] = React.useState<'camera' | 'manual'>('manual')

  const handleQrScan = React.useCallback((result: ScanResult) => {
    if (result.type === 'exercise') {
      router.push(`/app/ex?b=${encodeURIComponent(result.bookletCode)}&e=${encodeURIComponent(result.exerciseId)}`)
    } else {
      router.push(`/app/mes-livrets/${encodeURIComponent(result.code)}`)
    }
  }, [router])

  const handleSubmit = (e: React.FormEvent) => {
    e.preventDefault()
    const trimmed = code.trim().toUpperCase()
    if (!trimmed) return
    router.push(`/app/mes-livrets/${encodeURIComponent(trimmed)}`)
  }

  return (
    <div className="px-4 py-5">
      <div className="mb-6">
        <h1 className="font-serif text-2xl font-semibold">Scanner</h1>
        <p className="mt-1 text-sm text-muted-foreground">
          Scannez un QR code de votre livret ou entrez le code manuellement
        </p>
      </div>

      {/* Mode switcher */}
      <div className="mb-5 flex gap-2">
        <Button
          variant={mode === 'camera' ? 'default' : 'outline'}
          className="flex-1"
          onClick={() => setMode('camera')}
        >
          <QrCode className="mr-2 h-4 w-4" aria-hidden="true" />
          Scanner
        </Button>
        <Button
          variant={mode === 'manual' ? 'default' : 'outline'}
          className="flex-1"
          onClick={() => setMode('manual')}
        >
          <Keyboard className="mr-2 h-4 w-4" aria-hidden="true" />
          Code manuel
        </Button>
      </div>

      {mode === 'camera' ? (
        <Card>
          <CardContent className="py-4">
            <QrScanner onScan={handleQrScan} />
          </CardContent>
        </Card>
      ) : (
        <Card>
          <CardContent className="py-6">
            <form onSubmit={handleSubmit} className="space-y-4">
              <div>
                <label htmlFor="booklet-code" className="mb-1.5 block text-sm font-medium">
                  Code du livret
                </label>
                <Input
                  id="booklet-code"
                  type="text"
                  placeholder="ex: CONTINUITE-3E-001"
                  value={code}
                  onChange={(e) => setCode(e.target.value)}
                  className="text-center font-mono text-lg uppercase tracking-wider"
                  autoFocus
                  autoComplete="off"
                />
              </div>
              <p className="text-xs text-muted-foreground">
                Le code se trouve sur la couverture ou au dos de votre livret.
              </p>
              <Button type="submit" className="w-full" size="lg" disabled={!code.trim()}>
                Voir le livret
                <ArrowRight className="ml-2 h-4 w-4" aria-hidden="true" />
              </Button>
            </form>
          </CardContent>
        </Card>
      )}
    </div>
  )
}
