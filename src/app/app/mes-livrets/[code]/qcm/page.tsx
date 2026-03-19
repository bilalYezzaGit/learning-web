/**
 * Booklet QCM Page — QCM session in the context of a booklet.
 *
 * Two modes:
 * - /qcm              → random questions from the entire livret (QCM rapide)
 * - /qcm?group=qcm-id → specific quiz group from the PDF (QR scan)
 *
 * Uses the shared QcmSessionPlayer with booklet-specific navigation.
 */

import type { Metadata } from 'next'
import { notFound } from 'next/navigation'
import { Zap } from 'lucide-react'

import { Card, CardContent } from '@/components/ui/card'
import { getBookletByCode } from '@/lib/booklet'
import { selectRandomQuestions, getQcmGroupQuestions } from '@/lib/qcm-loader'
import { BookletBackHeader } from '@/app/app/_components/booklet-back-header'
import { QcmSessionPlayer } from '@/app/app/qcm/_components/qcm-session-player'

interface PageProps {
  params: Promise<{ code: string }>
  searchParams: Promise<{ group?: string }>
}

export async function generateMetadata({ params }: PageProps): Promise<Metadata> {
  const { code } = await params
  const booklet = getBookletByCode(code)
  if (!booklet) return { title: 'QCM' }
  return { title: `QCM — ${booklet.title}` }
}

export default async function BookletQcmPage({ params, searchParams }: PageProps) {
  const { code } = await params
  const { group } = await searchParams
  const booklet = getBookletByCode(code)

  if (!booklet) {
    notFound()
  }

  // Mode 1: specific quiz group (from QR scan on PDF)
  // Mode 2: random questions from the entire livret
  const isGroupMode = !!group
  const questions = isGroupMode
    ? getQcmGroupQuestions(booklet.livretSlug, group)
    : selectRandomQuestions(booklet.livretSlug, 10)

  const title = isGroupMode ? 'QCM — Vérification' : 'QCM rapide'
  const timeLimit = isGroupMode ? Math.max(questions.length * 2, 5) : 10

  return (
    <div>
      <BookletBackHeader
        title={title}
        backHref={`/app/mes-livrets/${booklet.code}`}
        backLabel="Retour au livret"
      />

      <div className="px-4 py-5">
        {questions.length === 0 ? (
          <Card>
            <CardContent className="py-16 text-center">
              <Zap className="mx-auto mb-4 h-16 w-16 text-primary/30" aria-hidden="true" />
              <h1 className="text-xl font-semibold">Aucun QCM disponible</h1>
              <p className="mt-2 text-sm text-muted-foreground">
                Ce livret n&apos;a pas encore de questions QCM.
              </p>
            </CardContent>
          </Card>
        ) : (
          <QcmSessionPlayer
            moduleTitle={booklet.title}
            questions={questions}
            timeLimitMinutes={timeLimit}
            restartHref={`/app/mes-livrets/${booklet.code}/qcm${isGroupMode ? `?group=${group}` : ''}`}
            exitHref={`/app/mes-livrets/${booklet.code}`}
            exitLabel="Retour au livret"
          />
        )}
      </div>
    </div>
  )
}
