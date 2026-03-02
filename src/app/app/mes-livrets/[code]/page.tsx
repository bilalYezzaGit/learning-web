/**
 * Booklet Detail Page — the core paper-first screen.
 *
 * Sections:
 * 1. Action cards (summary, corrections, QCM, scan)
 * 2. Course summary — first paragraph of each lesson
 * 3. Corrections — exercise solutions in expandable details
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
import { Separator } from '@/components/ui/separator'
import { getBookletByCode } from '@/lib/booklet'
import { getLessonSummaries, getExerciseSolutions } from '@/lib/content-reader'

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

  const summaries = getLessonSummaries(booklet.moduleSlug)
  const solutions = getExerciseSolutions(booklet.moduleSlug)

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
        <ActionCard
          icon={<Lightbulb className="h-5 w-5 text-amber-600" />}
          bgClass="bg-amber-50"
          title="Resume du cours"
          description="L'essentiel en 2 minutes"
          href={`/app/mes-livrets/${booklet.code}#resume`}
        />
        <ActionCard
          icon={<FileText className="h-5 w-5 text-emerald-600" />}
          bgClass="bg-emerald-50"
          title="Corrections"
          description={`Solutions des ${booklet.exerciseCount} exercices`}
          href={`/app/mes-livrets/${booklet.code}#corrections`}
        />
        <ActionCard
          icon={<Zap className="h-5 w-5 text-blue-600" />}
          bgClass="bg-blue-50"
          title="QCM rapide"
          description={`${booklet.qcmCount} questions disponibles`}
          href={`/app/qcm/session/${booklet.moduleSlug}`}
        />
        <ActionCard
          icon={<ScanLine className="h-5 w-5 text-violet-600" />}
          bgClass="bg-violet-50"
          title="Scanner mon travail"
          description="Photo → correction IA"
          href="/app/scan"
        />
      </div>

      {/* Course Summary Section */}
      {summaries.length > 0 && (
        <>
          <Separator className="my-6" />
          <section id="resume" className="scroll-mt-16">
            <div className="mb-4 flex items-center gap-2">
              <Lightbulb className="h-5 w-5 text-amber-600" aria-hidden="true" />
              <h2 className="font-serif text-xl font-semibold">Resume du cours</h2>
            </div>
            <div className="space-y-4">
              {summaries.map((lesson) => (
                <Card key={lesson.id}>
                  <CardContent className="py-4">
                    <h3 className="mb-1.5 text-sm font-semibold">{lesson.title}</h3>
                    <p className="text-sm leading-relaxed text-muted-foreground">
                      {lesson.firstParagraph}
                    </p>
                  </CardContent>
                </Card>
              ))}
            </div>
          </section>
        </>
      )}

      {/* Corrections Section */}
      {solutions.length > 0 && (
        <>
          <Separator className="my-6" />
          <section id="corrections" className="scroll-mt-16">
            <div className="mb-4 flex items-center gap-2">
              <FileText className="h-5 w-5 text-emerald-600" aria-hidden="true" />
              <h2 className="font-serif text-xl font-semibold">Corrections</h2>
            </div>
            <div className="space-y-3">
              {solutions.map((ex) => (
                <details key={ex.id} className="group rounded-lg border">
                  <summary className="flex cursor-pointer items-center gap-3 px-4 py-3 text-sm font-medium hover:bg-muted/50 [&::-webkit-details-marker]:hidden">
                    <ChevronRight className="h-4 w-4 shrink-0 text-muted-foreground transition-transform group-open:rotate-90" aria-hidden="true" />
                    <span className="flex-1">{ex.title}</span>
                  </summary>
                  <div className="border-t px-4 py-4">
                    {ex.enonce && (
                      <div className="mb-3 rounded-md bg-muted/50 p-3">
                        <p className="mb-1 text-xs font-medium text-muted-foreground">Enonce</p>
                        <p className="text-sm">{ex.enonce}</p>
                      </div>
                    )}
                    <div>
                      <p className="mb-1 text-xs font-medium text-emerald-600">Solution</p>
                      <p className="whitespace-pre-line text-sm leading-relaxed">{ex.solution}</p>
                    </div>
                    {ex.methode && (
                      <div className="mt-3 rounded-md border border-blue-200 bg-blue-50 p-3">
                        <p className="mb-1 text-xs font-medium text-blue-600">Methode</p>
                        <p className="text-sm text-blue-900">{ex.methode}</p>
                      </div>
                    )}
                  </div>
                </details>
              ))}
            </div>
          </section>
        </>
      )}

      {/* Secondary actions */}
      <div className="mt-6 grid gap-2">
        <Button variant="outline" asChild className="w-full justify-start">
          <Link href={`/print/cours/${booklet.moduleSlug}`}>
            <Printer className="mr-2 h-4 w-4" aria-hidden="true" />
            Reimprimer le livret
          </Link>
        </Button>
        <Button variant="ghost" asChild className="w-full justify-start text-muted-foreground">
          <Link href={`/${booklet.programmeId}/apprendre/${booklet.moduleSlug}`}>
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
