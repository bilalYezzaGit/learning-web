/**
 * Atom Page — displays exercise, lesson, or QCM content.
 *
 * - Exercises: enonce + solution (collapsible) + AI scan card
 * - Lessons: compiled HTML (definitions, theorems, etc.)
 * - QCM: consultation mode (question + correct answer + explanation)
 */

import type { Metadata } from 'next'
import { notFound } from 'next/navigation'
import { CheckCircle2, XCircle } from 'lucide-react'

import { Card, CardContent } from '@/components/ui/card'
import { getBookletByCode } from '@/lib/booklet'
import { getAtomHtml, getAtomRawContent, getCompiledQcm, getLivret } from '@/lib/content-loader'
import { BookletBackHeader } from '@/app/app/_components/booklet-back-header'
import { ExerciseScanCard } from './exercise-scan-card'
import type { CompiledQCMQuestion } from '@/types/content'

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

export default async function AtomPage({ params }: PageProps) {
  const { code, exerciseId } = await params
  const booklet = getBookletByCode(code)

  if (!booklet) {
    notFound()
  }

  const isQcm = exerciseId.startsWith('qcm-')
  const isExercise = exerciseId.startsWith('ex-')

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
      </div>
    </div>
  )
}

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
                    ? 'border-emerald-300 bg-emerald-50'
                    : 'border-border bg-background'
                }`}
              >
                <span className="mt-0.5 shrink-0">
                  {isCorrect ? (
                    <CheckCircle2 className="h-4 w-4 text-emerald-600" aria-hidden="true" />
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
          <div className="rounded-lg border-l-[3px] border-l-amber-500 bg-gradient-to-r from-amber-50/60 to-amber-50/10 px-4 py-3">
            <p className="mb-1 text-xs font-semibold text-amber-700">Explication</p>
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
