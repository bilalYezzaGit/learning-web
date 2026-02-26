'use client'

import { useEffect } from 'react'
import Link from 'next/link'
import { Button } from '@/components/ui/button'
import { Card, CardContent } from '@/components/ui/card'
import { logError } from '@/lib/services/error-logger'

interface ErrorFallbackProps {
  error: Error & { digest?: string }
  reset: () => void
  /** Error boundary name for logging */
  boundary: string
  /** Heading text */
  heading: string
  /** Description text */
  message: string
  /** Back link href */
  backHref: string
  /** Back link label */
  backLabel: string
  /** Use full-screen height (root error) vs partial (nested) */
  fullScreen?: boolean
}

export function ErrorFallback({
  error,
  reset,
  boundary,
  heading,
  message,
  backHref,
  backLabel,
  fullScreen = false,
}: ErrorFallbackProps) {
  useEffect(() => {
    logError(error, { component: boundary, metadata: { digest: error.digest } })
  }, [error, boundary])

  return (
    <div className={`flex flex-col items-center justify-center p-6 ${fullScreen ? 'bg-muted min-h-svh' : 'min-h-[60vh]'}`}>
      <Card className="mx-auto w-full max-w-md text-center">
        <CardContent className="space-y-6 py-12">
          <div className="space-y-2">
            <p className={`font-serif font-bold text-destructive ${fullScreen ? 'text-6xl' : 'text-5xl'}`}>
              Oups
            </p>
            <h1 className="text-xl font-semibold">{heading}</h1>
            <p className="text-sm text-muted-foreground">{message}</p>
          </div>
          <div className="flex flex-col gap-2 sm:flex-row sm:justify-center">
            <Button onClick={reset}>Reessayer</Button>
            <Button variant="outline" asChild>
              <Link href={backHref}>{backLabel}</Link>
            </Button>
          </div>
        </CardContent>
      </Card>
    </div>
  )
}
