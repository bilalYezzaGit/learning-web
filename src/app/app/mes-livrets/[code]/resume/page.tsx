/**
 * Booklet Resume Page — compiled course summary.
 *
 * Renders the pre-compiled HTML from the resume atom
 * with full KaTeX math, styled definition/theorem blocks, etc.
 */

import type { Metadata } from 'next'
import { notFound } from 'next/navigation'

import { getBookletByCode } from '@/lib/booklet'
import { getAtomHtml } from '@/lib/content-loader'
import { BookletBackHeader } from '@/app/app/_components/booklet-back-header'

interface PageProps {
  params: Promise<{ code: string }>
}

export async function generateMetadata({ params }: PageProps): Promise<Metadata> {
  const { code } = await params
  const booklet = getBookletByCode(code)
  if (!booklet) return { title: 'Resume' }
  return { title: `Resume — ${booklet.title}` }
}

export default async function BookletResumePage({ params }: PageProps) {
  const { code } = await params
  const booklet = getBookletByCode(code)

  if (!booklet) {
    notFound()
  }

  let resumeHtml: string
  try {
    resumeHtml = getAtomHtml(`resume-${booklet.moduleSlug}`)
  } catch {
    notFound()
  }

  return (
    <div>
      <BookletBackHeader
        title="Resume du cours"
        backHref={`/app/mes-livrets/${booklet.code}`}
        backLabel="Retour au livret"
      />

      <div className="px-4 py-5">
        <div
          className="prose prose-stone max-w-none"
          dangerouslySetInnerHTML={{ __html: resumeHtml }}
        />
      </div>
    </div>
  )
}
