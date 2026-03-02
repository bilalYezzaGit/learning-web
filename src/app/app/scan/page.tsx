/**
 * Scan / Pair Page — scan a QR code or enter a booklet code.
 *
 * PR1: manual code entry only.
 * PR2: camera QR scanner + Firestore pairing.
 */

'use client'

import * as React from 'react'
import { useRouter } from 'next/navigation'
import { QrCode, Keyboard, ArrowRight, AlertCircle } from 'lucide-react'

import { Button } from '@/components/ui/button'
import { Card, CardContent } from '@/components/ui/card'
import { Input } from '@/components/ui/input'

export default function ScanPage() {
  const router = useRouter()
  const [code, setCode] = React.useState('')
  const [error, setError] = React.useState<string | null>(null)
  const [mode, setMode] = React.useState<'camera' | 'manual'>('manual')

  const handleSubmit = (e: React.FormEvent) => {
    e.preventDefault()
    const trimmed = code.trim().toUpperCase()
    if (!trimmed) {
      setError('Entrez un code')
      return
    }
    // Navigate to the booklet — PR2 will validate against Firestore
    router.push(`/app/mes-livrets/${trimmed}`)
  }

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
        /* Camera placeholder — PR2 */
        <Card>
          <CardContent className="py-16 text-center">
            <QrCode className="mx-auto mb-4 h-16 w-16 text-muted-foreground/30" aria-hidden="true" />
            <p className="text-lg font-medium text-muted-foreground">
              Scanner QR
            </p>
            <p className="mt-2 text-sm text-muted-foreground">
              La camera sera disponible dans la prochaine version.
              <br />
              Utilisez le mode &laquo; Code manuel &raquo; pour l&apos;instant.
            </p>
          </CardContent>
        </Card>
      ) : (
        /* Manual code entry */
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
              <Button type="submit" className="w-full" size="lg">
                Associer le livret
                <ArrowRight className="ml-2 h-4 w-4" aria-hidden="true" />
              </Button>
            </form>
          </CardContent>
        </Card>
      )}
    </div>
  )
}
