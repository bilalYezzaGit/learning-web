'use client'

import { PanelLeft } from 'lucide-react'

import { Button } from '@/components/ui/button'
import { useTimeline } from '@/components/timeline-wrapper'

export function TimelineToggle() {
  const timeline = useTimeline()

  return (
    <Button
      variant="ghost"
      size="icon"
      className="h-8 w-8 shrink-0"
      onClick={() => timeline?.openTimeline()}
    >
      <PanelLeft className="h-4 w-4" aria-hidden="true" />
      <span className="sr-only">Ouvrir le sommaire</span>
    </Button>
  )
}
