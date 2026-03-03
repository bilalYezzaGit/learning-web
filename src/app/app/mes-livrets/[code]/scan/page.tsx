'use client'

/**
 * Booklet Scan Page — scanner within the context of a specific booklet.
 *
 * When the user scans an exercise QR from this page, they are redirected
 * to the exercise page within this booklet context.
 */

import * as React from 'react'
import { useParams, useRouter } from 'next/navigation'
import { QrCode, Keyboard, ArrowRight, AlertCircle } from 'lucide-react'

import { Button } from '@/components/ui/button'
import { Card, CardContent } from '@/components/ui/card'
import { Input } from '@/components/ui/input'
import { QrScanner, type ScanResult } from '@/app/app/_components/qr-scanner'
import { BookletBackHeader } from '@/app/app/_components/booklet-back-header'

export default function BookletScanPage() {
  const router = useRouter()
  const params = useParams<{ code: string }>()
  const bookletCode = params.code
  const [exerciseId, setExerciseId] = React.useState('')
  const [error, setError] = React.useState<string | null>(null)
  const [mode, setMode] = React.useState<'camera' | 'manual'>('camera')

  const handleQrScan = React.useCallback((result: ScanResult) => {
    if (result.type === 'exercise') {
      router.push(`/app/mes-livrets/${bookletCode}/exercice/${result.exerciseId}`)
      return
    }

    // Booklet QR scanned from booklet context — just show the code
    setError(`QR de livret detecte (${result.code}). Scannez un QR d'exercice.`)
  }, [bookletCode, router])

  const handleManualSubmit = (e: React.FormEvent) => {
    e.preventDefault()
    const trimmed = exerciseId.trim()
    if (!trimmed) {
      setError('Entrez un identifiant d\'exercice')
      return
    }
    router.push(`/app/mes-livrets/${bookletCode}/exercice/${trimmed}`)
  }

  return (
    <div>
      <BookletBackHeader
        title="Scanner un exercice"
        backHref={`/app/mes-livrets/${bookletCode}`}
        backLabel="Retour au livret"
      />

      <div className="px-4 py-5">
        <div className="mb-6">
          <h1 className="font-serif text-2xl font-semibold">Scanner un exercice</h1>
          <p className="mt-1 text-sm text-muted-foreground">
            Scannez le QR code a cote de l&apos;exercice dans votre livret
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
            Manuel
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
              <form onSubmit={handleManualSubmit} className="space-y-4">
                <div>
                  <label htmlFor="exercise-id" className="mb-1.5 block text-sm font-medium">
                    Identifiant de l&apos;exercice
                  </label>
                  <Input
                    id="exercise-id"
                    type="text"
                    placeholder="ex: ex-continuite-1"
                    value={exerciseId}
                    onChange={(e) => {
                      setExerciseId(e.target.value)
                      setError(null)
                    }}
                    className="text-center font-mono tracking-wider"
                    autoFocus
                    autoComplete="off"
                  />
                </div>
                <Button type="submit" className="w-full" size="lg">
                  Voir l&apos;exercice
                  <ArrowRight className="ml-2 h-4 w-4" aria-hidden="true" />
                </Button>
              </form>
            </CardContent>
          </Card>
        )}

        {error && (
          <div className="mt-4 flex items-center gap-1.5 text-sm text-destructive" role="alert">
            <AlertCircle className="h-3.5 w-3.5 shrink-0" aria-hidden="true" />
            {error}
          </div>
        )}
      </div>
    </div>
  )
}
