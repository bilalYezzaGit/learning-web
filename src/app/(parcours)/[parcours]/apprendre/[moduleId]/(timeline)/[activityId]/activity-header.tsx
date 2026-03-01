'use client'

/**
 * Activity Header
 *
 * Slim mobile header with integrated timeline toggle.
 * Hidden on desktop (sidebar has the info).
 */

import { PanelLeft } from 'lucide-react'

import { Button } from '@/components/ui/button'
import { Badge } from '@/components/ui/badge'
import { useTimeline } from '@/lib/context/timeline-context'
import type { AtomType } from '@/types/content'
import { getAtomTypeLabel } from '@/types/content'

interface ActivityHeaderProps {
  title: string
  type: AtomType
}

export function ActivityHeader({ title, type }: ActivityHeaderProps) {
  const timeline = useTimeline()

  return (
    <header className="flex items-center gap-2 border-b px-3 py-2 lg:hidden">
      <Button
        variant="ghost"
        size="icon"
        className="h-8 w-8 shrink-0"
        onClick={() => timeline?.openTimeline()}
      >
        <PanelLeft className="h-4 w-4" aria-hidden="true" />
        <span className="sr-only">Ouvrir le sommaire</span>
      </Button>
      <div className="min-w-0 flex-1 flex items-center gap-2">
        <span className="truncate text-sm font-medium">{title}</span>
        <Badge variant="outline" className="shrink-0 text-[10px] capitalize">
          {getAtomTypeLabel(type)}
        </Badge>
      </div>
    </header>
  )
}
