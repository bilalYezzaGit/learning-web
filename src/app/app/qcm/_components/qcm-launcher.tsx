'use client'

/**
 * QCM Launcher — interactive duration + module picker.
 */

import * as React from 'react'
import Link from 'next/link'
import { Zap, Clock, BookOpen, ChevronRight } from 'lucide-react'

import { Card, CardContent } from '@/components/ui/card'
import { Badge } from '@/components/ui/badge'
import { cn } from '@/lib/utils'

interface Module {
  moduleSlug: string
  title: string
  qcmCount: number
}

const DEFAULT_DURATION = { minutes: 10, label: '10 min', count: 10 }

const DURATIONS = [
  { minutes: 5, label: '5 min', count: 5 },
  DEFAULT_DURATION,
  { minutes: 20, label: '20 min', count: 20 },
]

export function QcmLauncher({ modules }: { modules: Module[] }) {
  const [selectedDuration, setSelectedDuration] = React.useState(DEFAULT_DURATION)

  return (
    <div className="px-4 py-5">
      <div className="mb-5">
        <h1 className="font-serif text-2xl font-semibold">QCM rapide</h1>
        <p className="mt-1 text-sm text-muted-foreground">
          Teste tes connaissances en quelques minutes
        </p>
      </div>

      {/* Duration picker */}
      <div className="mb-6">
        <h2 className="mb-2 text-sm font-medium text-muted-foreground">Duree</h2>
        <div className="flex gap-2">
          {DURATIONS.map((d) => (
            <button
              key={d.minutes}
              onClick={() => setSelectedDuration(d)}
              className={cn(
                'flex flex-1 flex-col items-center rounded-lg border px-3 py-3 text-center transition-colors',
                selectedDuration.minutes === d.minutes
                  ? 'border-primary bg-primary/10'
                  : 'border-muted hover:border-primary/50 hover:bg-muted/50'
              )}
            >
              <Clock className={cn('mb-1 h-4 w-4', selectedDuration.minutes === d.minutes ? 'text-primary' : 'text-muted-foreground')} aria-hidden="true" />
              <span className="text-sm font-semibold">{d.label}</span>
              <span className="text-[10px] text-muted-foreground">~{d.count} questions</span>
            </button>
          ))}
        </div>
      </div>

      {/* Module picker */}
      <div>
        <h2 className="mb-2 text-sm font-medium text-muted-foreground">Choisis un module</h2>
        <div className="grid gap-2">
          {modules.map((mod) => (
            <Link
              key={mod.moduleSlug}
              href={`/app/qcm/session/${mod.moduleSlug}?count=${selectedDuration.count}&time=${selectedDuration.minutes}`}
            >
              <Card className="transition-colors hover:bg-muted/50">
                <CardContent className="py-3">
                  <div className="flex items-center gap-3">
                    <div className="flex h-9 w-9 shrink-0 items-center justify-center rounded-lg bg-primary/10">
                      <BookOpen className="h-4 w-4 text-primary" aria-hidden="true" />
                    </div>
                    <div className="min-w-0 flex-1">
                      <p className="text-sm font-medium">{mod.title}</p>
                      <Badge variant="secondary" className="mt-0.5 text-[10px]">
                        {mod.qcmCount} questions
                      </Badge>
                    </div>
                    <div className="flex items-center gap-1">
                      <Zap className="h-4 w-4 text-primary" aria-hidden="true" />
                      <ChevronRight className="h-4 w-4 text-muted-foreground" aria-hidden="true" />
                    </div>
                  </div>
                </CardContent>
              </Card>
            </Link>
          ))}

          {modules.length === 0 && (
            <Card>
              <CardContent className="py-8 text-center text-muted-foreground">
                <Zap className="mx-auto mb-3 h-10 w-10 opacity-30" aria-hidden="true" />
                <p>Aucun QCM disponible</p>
              </CardContent>
            </Card>
          )}
        </div>
      </div>
    </div>
  )
}
