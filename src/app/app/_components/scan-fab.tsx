'use client'

/**
 * ScanFab — floating action button that opens a QR scanner sheet.
 *
 * Visible on all app pages. Opens a bottom sheet with camera active directly.
 * On successful scan → navigates to the content (exercise or booklet hub).
 */

import * as React from 'react'
import { useRouter, usePathname } from 'next/navigation'
import { ScanLine } from 'lucide-react'

import { Button } from '@/components/ui/button'
import {
  Sheet,
  SheetContent,
  SheetHeader,
  SheetTitle,
  SheetDescription,
} from '@/components/ui/sheet'
import { QrScanner, type ScanResult } from '@/app/app/_components/qr-scanner'

export function ScanFab() {
  const router = useRouter()
  const pathname = usePathname()
  const [open, setOpen] = React.useState(false)

  // Hide on exercise pages (user is already viewing content)
  const isExercisePage = /\/exercice\//.test(pathname)

  const handleScan = React.useCallback((result: ScanResult) => {
    setOpen(false)
    if (result.type === 'exercise') {
      router.push(`/app/ex?b=${encodeURIComponent(result.bookletCode)}&e=${encodeURIComponent(result.exerciseId)}`)
    } else {
      router.push(`/app/mes-livrets/${encodeURIComponent(result.code)}`)
    }
  }, [router])

  if (isExercisePage) return null

  return (
    <>
      <Button
        className="fixed bottom-6 right-4 z-40 h-12 gap-2 rounded-full px-5 shadow-lg"
        onClick={() => setOpen(true)}
      >
        <ScanLine className="h-5 w-5" aria-hidden="true" />
        <span className="text-sm font-medium">Scanner</span>
      </Button>

      <Sheet open={open} onOpenChange={setOpen}>
        <SheetContent side="bottom" className="rounded-t-2xl">
          <SheetHeader className="pb-2">
            <SheetTitle>Scanner un QR code</SheetTitle>
            <SheetDescription>
              Place le QR code de ton livret devant la caméra
            </SheetDescription>
          </SheetHeader>
          <div className="pb-6">
            {open && <QrScanner onScan={handleScan} autoStart />}
          </div>
        </SheetContent>
      </Sheet>
    </>
  )
}
