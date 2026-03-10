/**
 * Booklet Hub Page — action cards for a paired booklet.
 *
 * Each card navigates to a dedicated sub-page (resume, QCM, scan).
 */

import type { Metadata } from 'next'
import Link from 'next/link'
import { notFound } from 'next/navigation'
import {
  ChevronRight,
  Lightbulb,
  ScanLine,
  Zap,
} from 'lucide-react'

import { Card, CardContent } from '@/components/ui/card'
import { Badge } from '@/components/ui/badge'
import { getBookletByCode } from '@/lib/booklet'
import { getAtomHtml } from '@/lib/content-loader'
import { BookletBackHeader } from '@/app/app/_components/booklet-back-header'

interface PageProps {
  params: Promise<{ code: string }>
}

export async function generateMetadata({ params }: PageProps): Promise<Metadata> {
  const { code } = await params
  const booklet = getBookletByCode(code)
  if (!booklet) return { title: 'Livret' }
  return { title: booklet.title }
}

function hasResume(livretSlug: string): boolean {
  try {
    getAtomHtml(`resume-${livretSlug}`)
    return true
  } catch {
    return false
  }
}

export default async function BookletHubPage({ params }: PageProps) {
  const { code } = await params
  const booklet = getBookletByCode(code)

  if (!booklet) {
    notFound()
  }

  const resumeAvailable = hasResume(booklet.livretSlug)

  return (
    <div>
      <BookletBackHeader title={booklet.title} />

      <div className="px-4 py-5">
        {/* Header */}
        <div className="mb-6">
          <Badge variant="outline" className="mb-2 text-xs">
            {booklet.code}
          </Badge>
          <h1 className="font-serif text-2xl font-semibold">{booklet.title}</h1>
          <p className="mt-1 text-sm text-muted-foreground">
            {booklet.description}
          </p>
          <div className="mt-3 flex flex-wrap gap-2 text-xs text-muted-foreground">
            <span>{booklet.lessonCount} lecons</span>
            <span>&middot;</span>
            <span>{booklet.exerciseCount} exercices</span>
            <span>&middot;</span>
            <span>{booklet.qcmCount} QCM</span>
          </div>
        </div>

        {/* Action cards */}
        <div className="grid gap-3">
          {resumeAvailable && (
            <ActionCard
              icon={<Lightbulb className="h-5 w-5 text-amber-600" />}
              bgClass="bg-amber-50"
              title="Resume du cours"
              description="L'essentiel en 2 minutes"
              href={`/app/mes-livrets/${booklet.code}/resume`}
            />
          )}
          <ActionCard
            icon={<Zap className="h-5 w-5 text-blue-600" />}
            bgClass="bg-blue-50"
            title="QCM rapide"
            description={`${booklet.qcmCount} questions disponibles`}
            href={`/app/mes-livrets/${booklet.code}/qcm`}
          />
          <ActionCard
            icon={<ScanLine className="h-5 w-5 text-violet-600" />}
            bgClass="bg-violet-50"
            title="Scanner mon travail"
            description="Photo → correction IA"
            href={`/app/mes-livrets/${booklet.code}/scan`}
          />
        </div>
      </div>
    </div>
  )
}

function ActionCard({
  icon,
  bgClass,
  title,
  description,
  href,
}: {
  icon: React.ReactNode
  bgClass: string
  title: string
  description: string
  href: string
}) {
  return (
    <Link href={href}>
      <Card className="transition-colors hover:bg-muted/50">
        <CardContent className="py-4">
          <div className="flex items-center gap-3">
            <div className={`flex h-10 w-10 shrink-0 items-center justify-center rounded-lg ${bgClass}`}>
              {icon}
            </div>
            <div className="min-w-0 flex-1">
              <p className="font-medium">{title}</p>
              <p className="text-sm text-muted-foreground">{description}</p>
            </div>
            <ChevronRight className="h-4 w-4 shrink-0 text-muted-foreground" aria-hidden="true" />
          </div>
        </CardContent>
      </Card>
    </Link>
  )
}
