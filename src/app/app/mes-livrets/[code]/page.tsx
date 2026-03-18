/**
 * Booklet Hub Page — quick actions + table of contents for a booklet.
 */

import type { Metadata } from 'next'
import Link from 'next/link'
import { notFound } from 'next/navigation'
import {
  BookOpen,
  ChevronRight,
  FileText,
  Lightbulb,
  ScanLine,
  Zap,
} from 'lucide-react'

import { Card, CardContent } from '@/components/ui/card'
import { Badge } from '@/components/ui/badge'
import { getBookletByCode } from '@/lib/booklet'
import { getAtomHtml, getLivret } from '@/lib/content-loader'
import { BookletBackHeader } from '@/app/app/_components/booklet-back-header'
import type { ResolvedActivity } from '@/types/content'

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

const ACTIVITY_ICON: Record<string, { icon: typeof BookOpen; className: string }> = {
  lesson: { icon: BookOpen, className: 'text-warning-foreground' },
  exercise: { icon: FileText, className: 'text-info-foreground' },
  qcm: { icon: Zap, className: 'text-primary' },
}

const ACTIVITY_LABEL: Record<string, string> = {
  lesson: 'Cours',
  exercise: 'Exercice',
  qcm: 'QCM',
}

export default async function BookletHubPage({ params }: PageProps) {
  const { code } = await params
  const booklet = getBookletByCode(code)

  if (!booklet) {
    notFound()
  }

  const resumeAvailable = hasResume(booklet.livretSlug)

  let sections: { id: string; label: string; activities: ResolvedActivity[] }[] = []
  try {
    const livret = getLivret(booklet.livretSlug)
    sections = livret.sections
  } catch {
    // Livret data unavailable — show hub without TOC
  }

  return (
    <div>
      <BookletBackHeader title={booklet.title} />

      <div className="px-4 py-5">
        {/* Header */}
        <div className="mb-6">
          <Badge
            variant="outline"
            className="mb-2 gap-1.5 text-xs"
          >
            <span
              className="h-2 w-2 rounded-full"
              style={{ backgroundColor: booklet.programmeColor }}
              aria-hidden="true"
            />
            {booklet.programmeLabel}
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

        {/* Quick actions */}
        <div className="mb-6 grid gap-3 sm:grid-cols-2">
          {resumeAvailable && (
            <ActionCard
              icon={<Lightbulb className="h-5 w-5 text-warning-foreground" />}
              bgClass="bg-warning/10"
              title="Resume du cours"
              description="L'essentiel en 2 minutes"
              href={`/app/mes-livrets/${booklet.code}/resume`}
            />
          )}
          <ActionCard
            icon={<Zap className="h-5 w-5 text-info-foreground" />}
            bgClass="bg-info/10"
            title="QCM rapide"
            description={`${booklet.qcmCount} questions disponibles`}
            href={`/app/mes-livrets/${booklet.code}/qcm`}
          />
          <ActionCard
            icon={<ScanLine className="h-5 w-5 text-primary" />}
            bgClass="bg-primary/10"
            title="Scanner un exercice"
            description="Scanne le QR de ton livret"
            href={`/app/mes-livrets/${booklet.code}/scan`}
          />
        </div>

        {/* Table of contents */}
        {sections.length > 0 && (
          <div>
            <h2 className="mb-3 font-serif text-lg font-semibold">Sommaire</h2>
            <div className="space-y-4">
              {sections.map((section) => (
                <Card key={section.id}>
                  <CardContent className="py-4">
                    <h3 className="mb-3 text-sm font-medium text-muted-foreground">
                      {section.label}
                    </h3>
                    <div className="space-y-1">
                      {section.activities.map((activity) => (
                        <ActivityRow
                          key={activity.id}
                          activity={activity}
                          bookletCode={booklet.code}
                        />
                      ))}
                    </div>
                  </CardContent>
                </Card>
              ))}
            </div>
          </div>
        )}
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

function ActivityRow({
  activity,
  bookletCode,
}: {
  activity: ResolvedActivity
  bookletCode: string
}) {
  const fallback = { icon: FileText, className: 'text-blue-600' }
  const config = ACTIVITY_ICON[activity.type] ?? fallback
  const Icon = config.icon
  const label = ACTIVITY_LABEL[activity.type] ?? activity.type

  const href = `/app/mes-livrets/${bookletCode}/exercice/${activity.id}`

  return (
    <Link
      href={href}
      className="flex items-center gap-3 rounded-md px-2 py-2 transition-colors hover:bg-muted/50"
    >
      <Icon className={`h-4 w-4 shrink-0 ${config.className}`} aria-hidden="true" />
      <div className="min-w-0 flex-1">
        <p className="truncate text-sm">{activity.title}</p>
      </div>
      <Badge variant="secondary" className="shrink-0 text-[10px]">
        {label}
      </Badge>
    </Link>
  )
}
