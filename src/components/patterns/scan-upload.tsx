'use client'

/**
 * Scan Upload Component
 *
 * Allows user to upload or capture a photo of their work.
 * Shows analysis results with feedback.
 */

import * as React from 'react'
import { Camera, Check, Loader2, Upload, X, AlertCircle, Lightbulb } from 'lucide-react'

import { Button } from '@/components/ui/button'
import { Card, CardContent } from '@/components/ui/card'
import { Progress } from '@/components/ui/progress'
import { cn } from '@/lib/utils'
import { analyzeScan, type ScanResult, ScanError } from '@/lib/services/scan-service'

interface ScanUploadProps {
  activityId: string
  moduleId: string
  onResult?: (result: ScanResult) => void
  className?: string
}

type ScanState = 'idle' | 'uploading' | 'analyzing' | 'success' | 'error'

export function ScanUpload({ activityId, moduleId, onResult, className }: ScanUploadProps) {
  const [state, setState] = React.useState<ScanState>('idle')
  const [error, setError] = React.useState<string | null>(null)
  const [result, setResult] = React.useState<ScanResult | null>(null)
  const [preview, setPreview] = React.useState<string | null>(null)
  const fileInputRef = React.useRef<HTMLInputElement>(null)

  const handleFileSelect = async (file: File) => {
    // Validate file type
    if (!file.type.startsWith('image/')) {
      setError('Veuillez sélectionner une image')
      return
    }

    // Show preview
    const reader = new FileReader()
    reader.onload = (e) => setPreview(e.target?.result as string)
    reader.readAsDataURL(file)

    // Analyze
    setState('analyzing')
    setError(null)

    try {
      const scanResult = await analyzeScan({
        imageFile: file,
        activityId,
        moduleId,
      })

      setResult(scanResult)
      setState('success')
      onResult?.(scanResult)
    } catch (e) {
      const message = e instanceof ScanError ? e.message : 'Erreur lors de l\'analyse'
      setError(message)
      setState('error')
    }
  }

  const handleInputChange = (e: React.ChangeEvent<HTMLInputElement>) => {
    const file = e.target.files?.[0]
    if (file) {
      handleFileSelect(file)
    }
  }

  const handleDrop = (e: React.DragEvent) => {
    e.preventDefault()
    const file = e.dataTransfer.files[0]
    if (file) {
      handleFileSelect(file)
    }
  }

  const handleReset = () => {
    setState('idle')
    setError(null)
    setResult(null)
    setPreview(null)
    if (fileInputRef.current) {
      fileInputRef.current.value = ''
    }
  }

  // Success view
  if (state === 'success' && result) {
    return (
      <Card className={cn('overflow-hidden', className)}>
        <CardContent className="p-0">
          {/* Result header */}
          <div
            className={cn(
              'flex items-center gap-3 px-4 py-3',
              result.isCorrect
                ? 'bg-green-50 dark:bg-green-950/20'
                : 'bg-orange-50 dark:bg-orange-950/20'
            )}
          >
            <div
              className={cn(
                'flex h-10 w-10 items-center justify-center rounded-full',
                result.isCorrect ? 'bg-green-500' : 'bg-orange-500'
              )}
            >
              {result.isCorrect ? (
                <Check className="h-5 w-5 text-white" />
              ) : (
                <X className="h-5 w-5 text-white" />
              )}
            </div>
            <div>
              <p className="font-medium">
                {result.isCorrect ? 'Correct !' : 'À revoir'}
              </p>
              <p className="text-sm text-muted-foreground">
                Confiance: {Math.round(result.confidence * 100)}%
              </p>
            </div>
          </div>

          {/* Feedback */}
          <div className="p-4">
            <p className="text-sm">{result.feedback}</p>

            {/* Suggestions */}
            {result.suggestions.length > 0 && (
              <div className="mt-4">
                <p className="flex items-center gap-1.5 text-sm font-medium text-amber-600">
                  <Lightbulb className="h-4 w-4" />
                  Suggestions
                </p>
                <ul className="mt-2 space-y-1">
                  {result.suggestions.map((suggestion, i) => (
                    <li key={i} className="text-sm text-muted-foreground">
                      • {suggestion}
                    </li>
                  ))}
                </ul>
              </div>
            )}

            {/* Reset button */}
            <Button variant="outline" className="mt-4 w-full" onClick={handleReset}>
              Analyser une autre photo
            </Button>
          </div>
        </CardContent>
      </Card>
    )
  }

  // Analyzing view
  if (state === 'analyzing') {
    return (
      <Card className={cn(className)}>
        <CardContent aria-live="polite" className="py-8 text-center">
          {preview && (
            <img
              src={preview}
              alt="Preview"
              className="mx-auto mb-4 max-h-32 rounded-lg object-contain"
            />
          )}
          <Loader2 className="mx-auto mb-3 h-8 w-8 animate-spin text-primary" />
          <p className="font-medium">Analyse en cours...</p>
          <p className="mt-1 text-sm text-muted-foreground">
            L&apos;IA analyse votre travail
          </p>
        </CardContent>
      </Card>
    )
  }

  // Error view
  if (state === 'error') {
    return (
      <Card className={cn(className)}>
        <CardContent className="py-8 text-center">
          <AlertCircle className="mx-auto mb-3 h-8 w-8 text-destructive" />
          <p className="font-medium text-destructive">Erreur</p>
          <p className="mt-1 text-sm text-muted-foreground">{error}</p>
          <Button variant="outline" className="mt-4" onClick={handleReset}>
            Réessayer
          </Button>
        </CardContent>
      </Card>
    )
  }

  // Upload view (idle)
  return (
    <Card className={cn(className)}>
      <CardContent className="p-4">
        <input
          ref={fileInputRef}
          type="file"
          accept="image/*"
          capture="environment"
          onChange={handleInputChange}
          className="hidden"
          aria-label="Choisir une photo à analyser"
        />

        {/* Drop zone */}
        <div
          onDrop={handleDrop}
          onDragOver={(e) => e.preventDefault()}
          className="flex flex-col items-center justify-center rounded-lg border-2 border-dashed border-muted-foreground/25 bg-muted/30 px-6 py-8 text-center transition-colors hover:border-primary/50 hover:bg-muted/50"
        >
          <Upload className="mb-3 h-8 w-8 text-muted-foreground" />
          <p className="font-medium">Déposez une photo ici</p>
          <p className="mt-1 text-sm text-muted-foreground">ou utilisez les boutons ci-dessous</p>
        </div>

        {/* Action buttons */}
        <div className="mt-4 flex gap-2">
          <Button
            variant="outline"
            className="flex-1"
            onClick={() => fileInputRef.current?.click()}
          >
            <Upload className="mr-2 h-4 w-4" />
            Choisir un fichier
          </Button>
          <Button
            variant="default"
            className="flex-1"
            onClick={() => {
              if (fileInputRef.current) {
                fileInputRef.current.capture = 'environment'
                fileInputRef.current.click()
              }
            }}
          >
            <Camera className="mr-2 h-4 w-4" />
            Prendre une photo
          </Button>
        </div>
      </CardContent>
    </Card>
  )
}
