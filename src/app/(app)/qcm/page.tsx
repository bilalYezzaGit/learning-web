/**
 * Quick QCM Launcher — pick a module and duration for a quick quiz session.
 *
 * PR1: module selection + duration picker + placeholder launch.
 * PR2: real QCM session with timer, random question selection, results.
 */

import type { Metadata } from 'next'
import Link from 'next/link'
import { Zap, Clock, BookOpen, ChevronRight } from 'lucide-react'

import { Card, CardContent } from '@/components/ui/card'
import { Badge } from '@/components/ui/badge'
import { getAllBooklets } from '@/lib/booklet'

export const metadata: Metadata = {
  title: 'QCM rapide',
}

const DURATIONS = [
  { minutes: 5, label: '5 min', questions: '~5 questions' },
  { minutes: 10, label: '10 min', questions: '~10 questions' },
  { minutes: 20, label: '20 min', questions: '~20 questions' },
]

export default function QcmLauncherPage() {
  const booklets = getAllBooklets()

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
            <div
              key={d.minutes}
              className="flex flex-1 flex-col items-center rounded-lg border border-primary/20 bg-primary/5 px-3 py-3 text-center"
            >
              <Clock className="mb-1 h-4 w-4 text-primary" aria-hidden="true" />
              <span className="text-sm font-semibold">{d.label}</span>
              <span className="text-[10px] text-muted-foreground">{d.questions}</span>
            </div>
          ))}
        </div>
      </div>

      {/* Module picker */}
      <div>
        <h2 className="mb-2 text-sm font-medium text-muted-foreground">Choisis un module</h2>
        <div className="grid gap-2">
          {booklets.filter((b) => b.qcmCount > 0).map((booklet) => (
            <Link
              key={booklet.code}
              href={`/app/qcm/session/${booklet.moduleSlug}`}
            >
              <Card className="transition-colors hover:bg-muted/50">
                <CardContent className="py-3">
                  <div className="flex items-center gap-3">
                    <div className="flex h-9 w-9 shrink-0 items-center justify-center rounded-lg bg-primary/10">
                      <BookOpen className="h-4 w-4 text-primary" aria-hidden="true" />
                    </div>
                    <div className="min-w-0 flex-1">
                      <p className="text-sm font-medium">{booklet.title}</p>
                      <Badge variant="secondary" className="mt-0.5 text-[10px]">
                        {booklet.qcmCount} questions
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

          {booklets.filter((b) => b.qcmCount > 0).length === 0 && (
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
