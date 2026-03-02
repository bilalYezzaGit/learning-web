/**
 * Booklet Detail Page — the core paper-first screen.
 *
 * PR1: shows booklet info + placeholder sections.
 * PR2: will show real summaries, corrections, QCM sessions, and scan upload.
 *
 * Sections:
 * 1. Short course summary (1-2 screens)
 * 2. Corrections per exercise
 * 3. Quick QCM
 * 4. Scan your work
 */

import type { Metadata } from 'next'
import Link from 'next/link'
import { notFound } from 'next/navigation'
import {
  BookOpen,
  ChevronRight,
  FileText,
  Lightbulb,
  Printer,
  ScanLine,
  Zap,
} from 'lucide-react'

import { Card, CardContent } from '@/components/ui/card'
import { Badge } from '@/components/ui/badge'
import { Button } from '@/components/ui/button'
import { getBookletByCode } from '@/lib/booklet'

interface PageProps {
  params: Promise<{ code: string }>
}

export async function generateMetadata({ params }: PageProps): Promise<Metadata> {
  const { code } = await params
  const booklet = getBookletByCode(code)
  if (!booklet) return { title: 'Livret' }
  return { title: booklet.title }
}

export default async function BookletDetailPage({ params }: PageProps) {
  const { code } = await params
  const booklet = getBookletByCode(code)

  if (!booklet) {
    notFound()
  }

  return (
    <div className="px-4 py-5">
      {/* Header */}
      <div className="mb-5">
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
        {/* Resume du cours */}
        <ActionCard
          icon={<Lightbulb className="h-5 w-5 text-amber-600" />}
          bgClass="bg-amber-50"
          title="Resume du cours"
          description="L'essentiel en 2 minutes"
          href={`/app/mes-livrets/${booklet.code}#resume`}
          badge="Bientot"
        />

        {/* Corrections */}
        <ActionCard
          icon={<FileText className="h-5 w-5 text-emerald-600" />}
          bgClass="bg-emerald-50"
          title="Corrections"
          description={`Solutions des ${booklet.exerciseCount} exercices`}
          href={`/app/mes-livrets/${booklet.code}#corrections`}
          badge="Bientot"
        />

        {/* Quick QCM */}
        <ActionCard
          icon={<Zap className="h-5 w-5 text-blue-600" />}
          bgClass="bg-blue-50"
          title="QCM rapide"
          description={`${booklet.qcmCount} questions disponibles`}
          href="/app/qcm"
        />

        {/* Scan */}
        <ActionCard
          icon={<ScanLine className="h-5 w-5 text-violet-600" />}
          bgClass="bg-violet-50"
          title="Scanner mon travail"
          description="Photo → correction IA"
          href="/app/scan"
        />
      </div>

      {/* Secondary actions */}
      <div className="mt-6 grid gap-2">
        <Button variant="outline" asChild className="w-full justify-start">
          <Link href={`/print/cours/${booklet.moduleSlug}`}>
            <Printer className="mr-2 h-4 w-4" aria-hidden="true" />
            Reimprimer le livret
          </Link>
        </Button>
        <Button variant="ghost" asChild className="w-full justify-start text-muted-foreground">
          <Link href={`/3eme-math/apprendre/${booklet.moduleSlug}`}>
            <BookOpen className="mr-2 h-4 w-4" aria-hidden="true" />
            Voir le cours complet (version web)
          </Link>
        </Button>
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
  badge,
}: {
  icon: React.ReactNode
  bgClass: string
  title: string
  description: string
  href: string
  badge?: string
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
              <div className="flex items-center gap-2">
                <p className="font-medium">{title}</p>
                {badge && (
                  <Badge variant="secondary" className="text-[10px]">
                    {badge}
                  </Badge>
                )}
              </div>
              <p className="text-sm text-muted-foreground">{description}</p>
            </div>
            <ChevronRight className="h-4 w-4 shrink-0 text-muted-foreground" aria-hidden="true" />
          </div>
        </CardContent>
      </Card>
    </Link>
  )
}
