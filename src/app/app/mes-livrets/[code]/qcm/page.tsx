/**
 * Booklet QCM Page — QCM session in the context of a booklet.
 *
 * Uses the shared QcmSessionPlayer with booklet-specific navigation
 * (back to booklet hub instead of global QCM list).
 */

import type { Metadata } from 'next'
import { notFound } from 'next/navigation'
import { Zap } from 'lucide-react'

import { Card, CardContent } from '@/components/ui/card'
import { getBookletByCode } from '@/lib/booklet'
import { selectRandomQuestions } from '@/lib/qcm-loader'
import { BookletBackHeader } from '@/app/app/_components/booklet-back-header'
import { QcmSessionPlayer } from '@/app/app/qcm/_components/qcm-session-player'

interface PageProps {
  params: Promise<{ code: string }>
}

export async function generateMetadata({ params }: PageProps): Promise<Metadata> {
  const { code } = await params
  const booklet = getBookletByCode(code)
  if (!booklet) return { title: 'QCM' }
  return { title: `QCM — ${booklet.title}` }
}

export default async function BookletQcmPage({ params }: PageProps) {
  const { code } = await params
  const booklet = getBookletByCode(code)

  if (!booklet) {
    notFound()
  }

  const questions = selectRandomQuestions(booklet.moduleSlug, 10)

  return (
    <div>
      <BookletBackHeader
        title="QCM rapide"
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
            timeLimitMinutes={10}
            restartHref={`/app/mes-livrets/${booklet.code}/qcm`}
            exitHref={`/app/mes-livrets/${booklet.code}`}
            exitLabel="Retour au livret"
          />
        )}
      </div>
    </div>
  )
}
