/**
 * Scan / Pair Page — scan a QR code or enter a booklet code.
 *
 * Features:
 * - Camera QR scanning via BarcodeDetector API
 * - Manual code entry
 * - Firestore pairing for authenticated users
 * - Booklet validation against content pipeline
 */

'use client'

import * as React from 'react'
import { useRouter } from 'next/navigation'
import { QrCode, Keyboard, ArrowRight, AlertCircle, Loader2 } from 'lucide-react'

import { Button } from '@/components/ui/button'
import { Card, CardContent } from '@/components/ui/card'
import { Input } from '@/components/ui/input'
import { useAuth } from '@/lib/context'
import { pairBooklet } from '@/lib/services/booklet-service'
import { QrScanner } from '@/app/app/_components/qr-scanner'

export default function ScanPage() {
  const router = useRouter()
  const { userId } = useAuth()
  const [code, setCode] = React.useState('')
  const [error, setError] = React.useState<string | null>(null)
  const [isPairing, setIsPairing] = React.useState(false)
  const [mode, setMode] = React.useState<'camera' | 'manual'>('manual')

  const handlePairAndNavigate = React.useCallback(async (bookletCode: string) => {
    const trimmed = bookletCode.trim().toUpperCase()
    if (!trimmed) {
      setError('Entrez un code')
      return
    }

    setIsPairing(true)
    setError(null)

    try {
      // For authenticated users, save pairing to Firestore
      if (userId) {
        const parts = trimmed.split('-')
        const moduleSlug = parts[0]?.toLowerCase() ?? ''
        const programmePrefix = parts[1]?.toLowerCase() ?? ''
        // Reconstruct programmeId (e.g. "3M" -> "3eme-math")
        const programmeId = programmePrefix.startsWith('3')
          ? '3eme-math'
          : programmePrefix.startsWith('2')
            ? '2nde-math'
            : '1ere-tc'

        await pairBooklet(userId, {
          code: trimmed,
          moduleSlug,
          programmeId,
        })
      }

      router.push(`/app/mes-livrets/${trimmed}`)
    } catch {
      setError('Erreur lors de l\'association. Reessayez.')
      setIsPairing(false)
    }
  }, [userId, router])

  const handleSubmit = (e: React.FormEvent) => {
    e.preventDefault()
    handlePairAndNavigate(code)
  }

  const handleQrScan = React.useCallback((scannedCode: string) => {
    setCode(scannedCode)
    handlePairAndNavigate(scannedCode)
  }, [handlePairAndNavigate])

  return (
    <div className="px-4 py-5">
      <div className="mb-6">
        <h1 className="font-serif text-2xl font-semibold">Associer un livret</h1>
        <p className="mt-1 text-sm text-muted-foreground">
          Scannez le QR code de votre livret ou entrez le code manuellement
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
                  placeholder="ex: CONT-3M-001"
                  value={code}
                  onChange={(e) => {
                    setCode(e.target.value)
                    setError(null)
                  }}
                  className="text-center font-mono text-lg uppercase tracking-wider"
                  autoFocus
                  autoComplete="off"
                  disabled={isPairing}
                />
                {error && (
                  <p className="mt-1.5 flex items-center gap-1.5 text-sm text-destructive" role="alert">
                    <AlertCircle className="h-3.5 w-3.5" aria-hidden="true" />
                    {error}
                  </p>
                )}
              </div>
              <p className="text-xs text-muted-foreground">
                Le code se trouve sur la couverture ou au dos de votre livret.
              </p>
              <Button type="submit" className="w-full" size="lg" disabled={isPairing}>
                {isPairing ? (
                  <>
                    <Loader2 className="mr-2 h-4 w-4 animate-spin" aria-hidden="true" />
                    Association…
                  </>
                ) : (
                  <>
                    Associer le livret
                    <ArrowRight className="ml-2 h-4 w-4" aria-hidden="true" />
                  </>
                )}
              </Button>
            </form>
          </CardContent>
        </Card>
      )}
    </div>
  )
}
