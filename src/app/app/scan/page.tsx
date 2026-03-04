'use client'

/**
 * Scan / Pair Page — scan a QR code or enter a booklet code.
 *
 * Flow:
 * 1. User scans QR or enters code manually
 * 2. Code is validated server-side via /api/booklet/validate
 * 3. If valid + user authenticated, pairing is saved to Firestore
 * 4. Redirect to booklet detail page
 */

import * as React from 'react'
import { useRouter } from 'next/navigation'
import { QrCode, Keyboard, ArrowRight, AlertCircle, Loader2 } from 'lucide-react'

import { Button } from '@/components/ui/button'
import { Card, CardContent } from '@/components/ui/card'
import { Input } from '@/components/ui/input'
import { useAuth } from '@/lib/context'
import { toast } from 'sonner'
import { pairBooklet } from '@/lib/services/booklet-service'
import { QrScanner, type ScanResult } from '@/app/app/_components/qr-scanner'

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
      // 1. Validate the code server-side
      const res = await fetch(`/api/booklet/validate?code=${encodeURIComponent(trimmed)}`)
      if (!res.ok) {
        setError('Code invalide. Verifiez le code sur votre livret.')
        setIsPairing(false)
        return
      }

      const booklet: { code: string; moduleSlug: string; programmeId: string } = await res.json()

      // 2. Pair to Firestore if authenticated
      if (userId) {
        await pairBooklet(userId, {
          code: booklet.code,
          moduleSlug: booklet.moduleSlug,
          programmeId: booklet.programmeId,
        })
      }

      // 3. Navigate to booklet detail
      router.push(`/app/mes-livrets/${booklet.code}`)
      toast.success('Livret associ\u00e9 avec succ\u00e8s !')
    } catch (err) {
      const message = err instanceof Error ? err.message : 'Erreur inconnue'
      setError(`Erreur lors de l'association: ${message}`)
      toast.error('Erreur lors de l\'association')
      setIsPairing(false)
    }
  }, [userId, router])

  const handleSubmit = (e: React.FormEvent) => {
    e.preventDefault()
    handlePairAndNavigate(code)
  }

  const handleQrScan = React.useCallback((result: ScanResult) => {
    if (result.type === 'exercise') {
      // Exercise QR — redirect to exercise page via the /app/ex redirect
      router.push(`/app/ex?b=${encodeURIComponent(result.bookletCode)}&e=${encodeURIComponent(result.exerciseId)}`)
      return
    }

    // Booklet pairing QR
    setCode(result.code)
    handlePairAndNavigate(result.code)
  }, [handlePairAndNavigate, router])

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
                  placeholder="ex: CONTINUITE-3E-001"
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
                    <AlertCircle className="h-3.5 w-3.5 shrink-0" aria-hidden="true" />
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
