/**
 * Scan page client component
 *
 * Renders the exercise statement and the ScanUpload component.
 * Handles the full QR code → correction flow on mobile.
 */

'use client'

import { Camera } from 'lucide-react'

import { ScanUpload } from '@/components/patterns/scan-upload'
import type { AtomType } from '@/types/content'

interface ScanPageClientProps {
  atomId: string
  title: string
  type: AtomType
  /** Raw MDX content for the API */
  exerciseContent: string
  /** Pre-compiled React content for display */
  compiledContent: React.ReactNode
}

export function ScanPageClient({
  atomId,
  title,
  type,
  exerciseContent,
  compiledContent,
}: ScanPageClientProps) {
  const typeLabel = type === 'exercise' ? 'Exercice' : 'QCM'

  return (
    <div className="mx-auto max-w-lg px-4 py-8">
      {/* Header */}
      <div className="mb-6 text-center">
        <div className="mx-auto mb-4 flex h-14 w-14 items-center justify-center rounded-full bg-primary/10">
          <Camera className="h-7 w-7 text-primary" />
        </div>
        <div className="text-sm font-medium uppercase tracking-wider text-muted-foreground">
          {typeLabel}
        </div>
        <h1 className="mt-1 text-xl font-bold text-foreground">
          {title}
        </h1>
        <p className="mt-2 text-sm text-muted-foreground">
          Prenez en photo votre travail pour obtenir une correction
        </p>
      </div>

      {/* Exercise statement */}
      <div className="mb-6 rounded-lg border border-border bg-card p-4">
        <div className="mb-2 text-xs font-semibold uppercase tracking-wider text-muted-foreground">
          Énoncé
        </div>
        <div className="prose prose-stone prose-sm max-w-none">
          {compiledContent}
        </div>
      </div>

      {/* Scan upload */}
      <ScanUpload
        activityId={atomId}
        exerciseContent={exerciseContent}
      />
    </div>
  )
}
