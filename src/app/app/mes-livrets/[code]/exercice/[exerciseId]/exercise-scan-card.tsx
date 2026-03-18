'use client'

/**
 * ExerciseScanCard — photo capture + AI correction for exercises.
 *
 * Shows a login CTA when user is not authenticated.
 * States (when authenticated): idle → capturing → analyzing → result
 */

import * as React from 'react'
import Link from 'next/link'
import {
  Camera,
  CheckCircle2,
  XCircle,
  Loader2,
  LogIn,
  RotateCcw,
  Send,
  AlertCircle,
  Sparkles,
} from 'lucide-react'

import { Badge } from '@/components/ui/badge'
import { Button } from '@/components/ui/button'
import { Card, CardContent } from '@/components/ui/card'
import { useAuth } from '@/lib/context'
import { toast } from 'sonner'

type ScanState = 'idle' | 'capturing' | 'analyzing' | 'result'

interface AnalysisResult {
  isCorrect: boolean
  confidence: number
  feedback: string
  suggestions: string[]
}

interface ExerciseScanCardProps {
  exerciseId: string
  exerciseContent: string
}

export function ExerciseScanCard({ exerciseId, exerciseContent }: ExerciseScanCardProps) {
  const { user, isAuthenticated, isLoading } = useAuth()
  const [state, setState] = React.useState<ScanState>('idle')
  const [imageData, setImageData] = React.useState<string | null>(null)
  const [result, setResult] = React.useState<AnalysisResult | null>(null)
  const [error, setError] = React.useState<string | null>(null)
  const fileInputRef = React.useRef<HTMLInputElement>(null)

  const handleFileSelect = (e: React.ChangeEvent<HTMLInputElement>) => {
    const file = e.target.files?.[0]
    if (!file) return

    const reader = new FileReader()
    reader.onload = () => {
      const dataUrl = reader.result as string
      setImageData(dataUrl)
      setState('capturing')
      setError(null)
    }
    reader.readAsDataURL(file)

    // Reset the input so the same file can be re-selected
    e.target.value = ''
  }

  const handleSubmit = async () => {
    if (!imageData || !user) return

    setState('analyzing')
    setError(null)

    try {
      const token = await user.getIdToken()

      // Extract base64 data from the data URL
      const base64 = imageData.split(',')[1]

      const res = await fetch('/api/scan', {
        method: 'POST',
        headers: {
          'Content-Type': 'application/json',
          Authorization: `Bearer ${token}`,
        },
        body: JSON.stringify({
          imageBase64: base64,
          activityId: exerciseId,
          exerciseContent,
        }),
      })

      if (!res.ok) {
        const data = await res.json().catch(() => ({ error: 'Erreur serveur' }))
        throw new Error(data.error || `Erreur ${res.status}`)
      }

      const data: AnalysisResult = await res.json()
      setResult(data)
      setState('result')
      toast.success('Analyse termin\u00e9e')
    } catch (err) {
      const message = err instanceof Error ? err.message : 'Erreur inconnue'
      setError(message)
      toast.error('Erreur lors de l\'analyse')
      setState('capturing')
    }
  }

  const handleReset = () => {
    setState('idle')
    setImageData(null)
    setResult(null)
    setError(null)
  }

  // Don't render anything while auth is loading
  if (isLoading) return null

  // Unauthenticated — show login gate
  if (!isAuthenticated) {
    return (
      <Card className="border-dashed">
        <CardContent className="py-5">
          <div className="flex flex-col items-center gap-3 py-4 text-center">
            <div className="flex h-12 w-12 items-center justify-center rounded-full bg-primary/10">
              <Sparkles className="h-6 w-6 text-primary" aria-hidden="true" />
            </div>
            <div>
              <div className="mb-2 flex items-center justify-center gap-2">
                <p className="font-medium">Correction IA</p>
                <Badge variant="secondary" className="text-xs">Compte requis</Badge>
              </div>
              <p className="text-sm text-muted-foreground">
                Connecte-toi pour prendre en photo ton travail et recevoir une correction personnalisée.
              </p>
            </div>
            <Button asChild variant="outline" className="mt-1">
              <Link href="/login">
                <LogIn className="mr-2 h-4 w-4" aria-hidden="true" />
                Se connecter
              </Link>
            </Button>
          </div>
        </CardContent>
      </Card>
    )
  }

  return (
    <Card>
      <CardContent className="py-5">
        {/* Hidden file input */}
        <input
          ref={fileInputRef}
          type="file"
          accept="image/*"
          capture="environment"
          onChange={handleFileSelect}
          className="hidden"
          aria-label="Capturer une photo du travail"
        />

        {/* Idle state */}
        {state === 'idle' && (
          <div className="flex flex-col items-center gap-4 py-6 text-center">
            <div className="flex h-12 w-12 items-center justify-center rounded-full bg-primary/10">
              <Sparkles className="h-6 w-6 text-primary" aria-hidden="true" />
            </div>
            <div>
              <p className="font-medium">Correction IA</p>
              <p className="mt-1 text-sm text-muted-foreground">
                Prends en photo ton travail pour obtenir une correction personnalisée
              </p>
            </div>
            <Button onClick={() => fileInputRef.current?.click()}>
              <Camera className="mr-2 h-4 w-4" aria-hidden="true" />
              Prendre en photo
            </Button>
          </div>
        )}

        {/* Capturing state — preview + send/retake */}
        {state === 'capturing' && imageData && (
          <div className="space-y-4">
            {/* eslint-disable-next-line @next/next/no-img-element -- data URL from camera capture, not optimizable */}
            <img
              src={imageData}
              alt="Apercu du travail capture"
              className="w-full rounded-lg border"
            />
            {error && (
              <p className="flex items-center gap-1.5 text-sm text-destructive" role="alert">
                <AlertCircle className="h-3.5 w-3.5 shrink-0" aria-hidden="true" />
                {error}
              </p>
            )}
            <div className="flex gap-2">
              <Button
                variant="outline"
                className="flex-1"
                onClick={() => fileInputRef.current?.click()}
              >
                <RotateCcw className="mr-2 h-4 w-4" aria-hidden="true" />
                Reprendre
              </Button>
              <Button className="flex-1" onClick={handleSubmit}>
                <Send className="mr-2 h-4 w-4" aria-hidden="true" />
                Envoyer
              </Button>
            </div>
          </div>
        )}

        {/* Analyzing state */}
        {state === 'analyzing' && (
          <div className="flex flex-col items-center gap-4 py-8 text-center">
            <Loader2 className="h-8 w-8 animate-spin text-primary" aria-hidden="true" />
            <p className="text-sm text-muted-foreground">Analyse en cours&hellip;</p>
          </div>
        )}

        {/* Result state */}
        {state === 'result' && result && (
          <div className="space-y-4">
            <div className="flex items-start gap-3">
              {result.isCorrect ? (
                <CheckCircle2 className="mt-0.5 h-6 w-6 shrink-0 text-success-foreground" aria-hidden="true" />
              ) : (
                <XCircle className="mt-0.5 h-6 w-6 shrink-0 text-destructive" aria-hidden="true" />
              )}
              <div>
                <p className="font-medium">
                  {result.isCorrect ? 'Correct' : 'A revoir'}
                </p>
                <p className="mt-1 text-sm text-muted-foreground">
                  {result.feedback}
                </p>
              </div>
            </div>

            {result.suggestions.length > 0 && (
              <div className="rounded-lg bg-muted p-3">
                <p className="mb-2 text-sm font-medium">Suggestions</p>
                <ul className="space-y-1 text-sm text-muted-foreground">
                  {result.suggestions.map((s, i) => (
                    <li key={i} className="flex items-start gap-2">
                      <span className="mt-1.5 h-1 w-1 shrink-0 rounded-full bg-muted-foreground/50" aria-hidden="true" />
                      {s}
                    </li>
                  ))}
                </ul>
              </div>
            )}

            <Button variant="outline" className="w-full" onClick={handleReset}>
              <RotateCcw className="mr-2 h-4 w-4" aria-hidden="true" />
              Rescanner
            </Button>
          </div>
        )}
      </CardContent>
    </Card>
  )
}
