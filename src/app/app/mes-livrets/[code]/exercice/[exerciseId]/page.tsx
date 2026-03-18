/**
 * Atom Page — displays exercise, lesson, or QCM content.
 *
 * - Exercises: paper-first banner + enonce + solution + AI scan card
 * - Lessons: compiled HTML (definitions, theorems, etc.)
 * - QCM: consultation mode (question + correct answer + explanation)
 * - All types: prev/next navigation within the booklet
 */

import type { Metadata } from 'next'
import Link from 'next/link'
import { notFound } from 'next/navigation'
import {
  ArrowLeft,
  ArrowRight,
  BookOpen,
  CheckCircle2,
  XCircle,
} from 'lucide-react'

import { Button } from '@/components/ui/button'
import { Card, CardContent } from '@/components/ui/card'
import { getBookletByCode } from '@/lib/booklet'
import { getAtomHtml, getAtomRawContent, getCompiledQcm, getLivret } from '@/lib/content-loader'
import { BookletBackHeader } from '@/app/app/_components/booklet-back-header'
import { ExerciseScanCard } from './exercise-scan-card'
import type { CompiledQCMQuestion, ResolvedActivity } from '@/types/content'

interface PageProps {
  params: Promise<{ code: string; exerciseId: string }>
}

export async function generateMetadata({ params }: PageProps): Promise<Metadata> {
  const { exerciseId } = await params
  const label = exerciseId
    .replace(/^(lesson|ex|qcm)-/, '')
    .replace(/-/g, ' ')
  return { title: label }
}

/**
 * Get prev/next activities relative to the current one.
 */
function getAdjacentActivities(
  livretSlug: string,
  currentId: string,
): { prev: ResolvedActivity | null; next: ResolvedActivity | null } {
  try {
    const livret = getLivret(livretSlug)
    const allActivities = livret.sections.flatMap(s => s.activities)
    const index = allActivities.findIndex(a => a.id === currentId)
    if (index === -1) return { prev: null, next: null }
    return {
      prev: index > 0 ? allActivities[index - 1] ?? null : null,
      next: index < allActivities.length - 1 ? allActivities[index + 1] ?? null : null,
    }
  } catch {
    return { prev: null, next: null }
  }
}

export default async function AtomPage({ params }: PageProps) {
  const { code, exerciseId } = await params
  const booklet = getBookletByCode(code)

  if (!booklet) {
    notFound()
  }

  const isQcm = exerciseId.startsWith('qcm-')
  const isExercise = exerciseId.startsWith('ex-')

  const { prev, next } = getAdjacentActivities(booklet.livretSlug, exerciseId)

  // QCM consultation mode
  if (isQcm) {
    const questions = loadQcmQuestions(booklet.livretSlug, exerciseId)
    if (questions.length === 0) notFound()

    return (
      <div>
        <BookletBackHeader
          title={booklet.title}
          backHref={`/app/mes-livrets/${booklet.code}`}
          backLabel="Retour au livret"
        />
        <div className="px-4 py-5 space-y-4">
          {questions.map((q, i) => (
            <QcmQuestionCard key={q.id} question={q} index={i + 1} total={questions.length} />
          ))}
          <ActivityNav prev={prev} next={next} bookletCode={booklet.code} />
        </div>
      </div>
    )
  }

  // Lesson / Exercise — render compiled HTML
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
        title={booklet.title}
        backHref={`/app/mes-livrets/${booklet.code}`}
        backLabel="Retour au livret"
      />

      <div className="px-4 py-5 space-y-6">
        {/* Paper-first banner for exercises */}
        {isExercise && <PaperFirstBanner />}

        <div
          className="prose prose-stone max-w-none"
          dangerouslySetInnerHTML={{ __html: html }}
        />

        {isExercise && (
          <ExerciseScanCard
            exerciseId={exerciseId}
            exerciseContent={rawContent}
          />
        )}

        <ActivityNav prev={prev} next={next} bookletCode={booklet.code} />
      </div>
    </div>
  )
}

// ── Paper-first banner ──────────────────────────────────────────────────────

function PaperFirstBanner() {
  return (
    <div className="flex items-start gap-3 rounded-lg border border-primary/20 bg-primary/5 px-4 py-3">
      <BookOpen className="mt-0.5 h-5 w-5 shrink-0 text-primary" aria-hidden="true" />
      <div>
        <p className="text-sm font-medium text-foreground">
          Travaille d&apos;abord sur ton livret
        </p>
        <p className="mt-0.5 text-xs text-muted-foreground">
          Fais l&apos;exercice sur papier, puis scanne ta reponse pour une correction IA.
        </p>
      </div>
    </div>
  )
}

// ── Prev / Next navigation ──────────────────────────────────────────────────

const ACTIVITY_TYPE_LABEL: Record<string, string> = {
  lesson: 'Cours',
  exercise: 'Exercice',
  qcm: 'QCM',
}

function ActivityNav({
  prev,
  next,
  bookletCode,
}: {
  prev: ResolvedActivity | null
  next: ResolvedActivity | null
  bookletCode: string
}) {
  if (!prev && !next) return null

  return (
    <nav className="flex items-stretch gap-3 border-t pt-5" aria-label="Navigation entre activites">
      {prev ? (
        <Button variant="outline" className="h-auto flex-1 justify-start py-3 text-left" asChild>
          <Link href={`/app/mes-livrets/${bookletCode}/exercice/${prev.id}`}>
            <ArrowLeft className="mr-2 h-4 w-4 shrink-0" aria-hidden="true" />
            <div className="min-w-0">
              <p className="text-[10px] text-muted-foreground">
                {ACTIVITY_TYPE_LABEL[prev.type] ?? 'Precedent'}
              </p>
              <p className="truncate text-sm">{prev.title}</p>
            </div>
          </Link>
        </Button>
      ) : (
        <div className="flex-1" />
      )}
      {next ? (
        <Button variant="outline" className="h-auto flex-1 justify-end py-3 text-right" asChild>
          <Link href={`/app/mes-livrets/${bookletCode}/exercice/${next.id}`}>
            <div className="min-w-0">
              <p className="text-[10px] text-muted-foreground">
                {ACTIVITY_TYPE_LABEL[next.type] ?? 'Suivant'}
              </p>
              <p className="truncate text-sm">{next.title}</p>
            </div>
            <ArrowRight className="ml-2 h-4 w-4 shrink-0" aria-hidden="true" />
          </Link>
        </Button>
      ) : (
        <div className="flex-1" />
      )}
    </nav>
  )
}

// ── QCM helpers ─────────────────────────────────────────────────────────────

/**
 * Load QCM questions for consultation.
 * If the atom is part of a quiz group in the livret, load all questions in the group.
 * Otherwise, load just the single question.
 */
function loadQcmQuestions(livretSlug: string, atomId: string): CompiledQCMQuestion[] {
  // Try to find the quiz group in the livret
  try {
    const livret = getLivret(livretSlug)
    const activity = livret.sections
      .flatMap(s => s.activities)
      .find(a => a.id === atomId)

    if (activity?.quizAtomIds && activity.quizAtomIds.length > 0) {
      return activity.quizAtomIds
        .map(id => { try { return getCompiledQcm(id) } catch { return null } })
        .filter((q): q is CompiledQCMQuestion => q !== null)
    }
  } catch {
    // Livret not found — fall through to single question
  }

  // Single question fallback
  try {
    return [getCompiledQcm(atomId)]
  } catch {
    return []
  }
}

function QcmQuestionCard({
  question,
  index,
  total,
}: {
  question: CompiledQCMQuestion
  index: number
  total: number
}) {
  return (
    <Card>
      <CardContent className="py-5 space-y-4">
        {/* Question header */}
        <div className="flex items-center gap-2">
          <span className="flex h-7 w-7 shrink-0 items-center justify-center rounded-full bg-primary/10 text-xs font-bold text-primary">
            {index}
          </span>
          <span className="text-xs text-muted-foreground">
            Question {index}{total > 1 ? ` / ${total}` : ''}
          </span>
        </div>

        {/* Question text */}
        <div
          className="prose prose-stone max-w-none text-sm"
          dangerouslySetInnerHTML={{ __html: question.enonce }}
        />

        {/* Options */}
        <div className="space-y-2">
          {question.options.map((option, i) => {
            const isCorrect = i === question.correctIndex
            return (
              <div
                key={i}
                className={`flex items-start gap-3 rounded-lg border px-3 py-2.5 ${
                  isCorrect
                    ? 'border-success/40 bg-success/10'
                    : 'border-border bg-background'
                }`}
              >
                <span className="mt-0.5 shrink-0">
                  {isCorrect ? (
                    <CheckCircle2 className="h-4 w-4 text-success-foreground" aria-hidden="true" />
                  ) : (
                    <XCircle className="h-4 w-4 text-muted-foreground/30" aria-hidden="true" />
                  )}
                </span>
                <div
                  className="prose prose-stone max-w-none text-sm"
                  dangerouslySetInnerHTML={{ __html: option }}
                />
              </div>
            )
          })}
        </div>

        {/* Explanation */}
        {question.explication && (
          <div className="rounded-lg border-l-[3px] border-l-warning bg-gradient-to-r from-warning/15 to-warning/5 px-4 py-3">
            <p className="mb-1 text-xs font-semibold text-warning-foreground">Explication</p>
            <div
              className="prose prose-stone max-w-none text-sm"
              dangerouslySetInnerHTML={{ __html: question.explication }}
            />
          </div>
        )}
      </CardContent>
    </Card>
  )
}
