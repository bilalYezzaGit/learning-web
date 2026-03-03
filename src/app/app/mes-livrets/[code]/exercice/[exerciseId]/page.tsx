/**
 * Exercise Page — displays exercise content + photo capture for AI correction.
 *
 * Server component that renders the exercise statement and delegates
 * the scan/correction flow to the client ExerciseScanCard component.
 */

import type { Metadata } from 'next'
import { notFound } from 'next/navigation'

import { getBookletByCode } from '@/lib/booklet'
import { getAtomHtml, getAtomRawContent } from '@/lib/content-loader'
import { BookletBackHeader } from '@/app/app/_components/booklet-back-header'
import { ExerciseScanCard } from './exercise-scan-card'

interface PageProps {
  params: Promise<{ code: string; exerciseId: string }>
}

export async function generateMetadata({ params }: PageProps): Promise<Metadata> {
  const { exerciseId } = await params
  return { title: `Exercice — ${exerciseId}` }
}

export default async function ExercisePage({ params }: PageProps) {
  const { code, exerciseId } = await params
  const booklet = getBookletByCode(code)

  if (!booklet) {
    notFound()
  }

  let html: string
  try {
    html = getAtomHtml(exerciseId)
  } catch {
    notFound()
  }

  const rawContent = getAtomRawContent(exerciseId) ?? ''

  return (
    <div>
      <BookletBackHeader
        title={`Exercice`}
        backHref={`/app/mes-livrets/${booklet.code}`}
        backLabel="Retour au livret"
      />

      <div className="px-4 py-5 space-y-6">
        {/* Exercise statement */}
        <div>
          <h1 className="font-serif text-xl font-semibold mb-4">
            {exerciseId.replace(/^ex-/, '').replace(/-/g, ' ')}
          </h1>
          <div
            className="prose prose-stone max-w-none"
            dangerouslySetInnerHTML={{ __html: html }}
          />
        </div>

        {/* Photo capture + AI correction */}
        <ExerciseScanCard
          exerciseId={exerciseId}
          exerciseContent={rawContent}
        />
      </div>
    </div>
  )
}
