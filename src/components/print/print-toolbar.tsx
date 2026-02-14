/**
 * Print toolbar — sticky bar with download/print button
 *
 * Client component: uses window.print() to trigger browser print dialog.
 * Hidden when actually printing via @media print CSS.
 */

'use client'

import { ArrowLeft, Printer } from 'lucide-react'
import { useRouter } from 'next/navigation'

import { Button } from '@/components/ui/button'

interface PrintToolbarProps {
  title: string
}

export function PrintToolbar({ title }: PrintToolbarProps) {
  const router = useRouter()

  return (
    <div className="print-hide sticky top-0 z-50 border-b bg-background/95 backdrop-blur-sm">
      <div className="mx-auto flex max-w-4xl items-center justify-between px-6 py-3">
        <div className="flex items-center gap-3">
          <Button
            variant="ghost"
            size="sm"
            onClick={() => router.back()}
          >
            <ArrowLeft className="mr-2 h-4 w-4" />
            Retour
          </Button>
          <span className="text-sm font-medium text-muted-foreground">
            {title}
          </span>
        </div>
        <Button
          onClick={() => window.print()}
          size="sm"
        >
          <Printer className="mr-2 h-4 w-4" />
          Imprimer / Enregistrer en PDF
        </Button>
      </div>
    </div>
  )
}
