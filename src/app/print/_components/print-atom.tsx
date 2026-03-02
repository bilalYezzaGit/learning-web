/**
 * PrintAtom — renders atoms in print layout with professional framing.
 *
 * - Exercises: framed card with enonce + writing space, no solution
 * - QCM: framed card with styled question + radio circles
 * - Lessons: full content with accent bar
 *
 * Each atom has a small QR code badge linking to its online version.
 */

import type { CompiledQCMQuestion } from '@/types/content'

// ─── Exercise ──────────────────────────────────────────────────────────────

interface PrintExerciseProps {
  title: string
  html: string
  qrCodeSvg: string
  exerciseNumber: number
}

export function PrintExercise({ title, html, qrCodeSvg, exerciseNumber }: PrintExerciseProps) {
  const enonceHtml = extractEnonce(html)

  return (
    <div className="print-exercise-frame mb-6 rounded-lg border border-stone-200 bg-white shadow-sm">
      {/* Header bar */}
      <div className="print-exercise-header flex items-center justify-between rounded-t-lg border-b border-stone-200 bg-stone-50 px-4 py-2.5" data-print-color>
        <div className="flex items-center gap-2.5">
          <span className="flex h-7 w-7 shrink-0 items-center justify-center rounded-md bg-stone-800 text-xs font-bold text-white" data-print-color>
            {exerciseNumber}
          </span>
          <div>
            <span className="text-[10px] font-semibold uppercase tracking-wider text-stone-400">Exercice</span>
            <h3 className="text-sm font-semibold leading-tight text-stone-800">{title}</h3>
          </div>
        </div>
        <div
          className="print-qr-badge shrink-0 rounded-md border border-stone-200 bg-white p-0.5"
          dangerouslySetInnerHTML={{ __html: qrCodeSvg }}
        />
      </div>

      {/* Enonce */}
      <div className="px-5 pt-4 pb-3">
        <div
          className="prose prose-stone prose-sm max-w-none"
          dangerouslySetInnerHTML={{ __html: enonceHtml }}
        />
      </div>

      {/* Writing space */}
      <div className="print-writing-area mx-4 mb-4 rounded-md border border-dashed border-stone-300 bg-stone-50/30 px-4 pt-2 pb-1" data-print-color>
        <p className="mb-1.5 text-[9px] font-semibold uppercase tracking-widest text-stone-400">
          Reponse
        </p>
        {Array.from({ length: 8 }).map((_, i) => (
          <div
            key={i}
            className="border-b border-stone-200/70"
            style={{ height: '1.7em' }}
          />
        ))}
      </div>
    </div>
  )
}

// ─── Lesson ────────────────────────────────────────────────────────────────

interface PrintLessonProps {
  title: string
  html: string
  qrCodeSvg: string
}

export function PrintLesson({ title, html, qrCodeSvg }: PrintLessonProps) {
  return (
    <div className="print-lesson-frame mb-6">
      {/* Header with accent bar */}
      <div className="mb-3 flex items-start justify-between gap-3">
        <div className="flex items-center gap-2.5">
          <div className="print-lesson-accent h-6 w-1 rounded-full bg-stone-800" data-print-color />
          <div>
            <span className="text-[10px] font-semibold uppercase tracking-wider text-stone-400">Cours</span>
            <h3 className="text-sm font-semibold leading-tight text-stone-800">{title}</h3>
          </div>
        </div>
        <div
          className="print-qr-badge shrink-0 rounded-md border border-stone-200 bg-white p-0.5"
          dangerouslySetInnerHTML={{ __html: qrCodeSvg }}
        />
      </div>

      {/* Full lesson content */}
      <div
        className="prose prose-stone prose-sm max-w-none"
        dangerouslySetInnerHTML={{ __html: html }}
      />

      {/* Bottom separator */}
      <div className="mt-4 border-b border-stone-200" />
    </div>
  )
}

// ─── QCM ───────────────────────────────────────────────────────────────────

interface PrintQcmProps {
  questions: CompiledQCMQuestion[]
  qrCodeSvg: string
  qcmNumber: number
}

export function PrintQcm({ questions, qrCodeSvg, qcmNumber }: PrintQcmProps) {
  return (
    <div className="print-qcm-frame mb-6 rounded-lg border border-stone-200 bg-white shadow-sm">
      {/* Header bar */}
      <div className="print-qcm-header flex items-center justify-between rounded-t-lg border-b border-stone-200 bg-stone-50 px-4 py-2.5" data-print-color>
        <div className="flex items-center gap-2.5">
          <span className="flex h-7 w-7 shrink-0 items-center justify-center rounded-md bg-stone-600 text-xs font-bold text-white" data-print-color>
            Q{qcmNumber}
          </span>
          <div>
            <span className="text-[10px] font-semibold uppercase tracking-wider text-stone-400">QCM</span>
            <h3 className="text-sm font-semibold leading-tight text-stone-800">
              {questions.length} question{questions.length > 1 ? 's' : ''} &mdash; une seule reponse par question
            </h3>
          </div>
        </div>
        <div
          className="print-qr-badge shrink-0 rounded-md border border-stone-200 bg-white p-0.5"
          dangerouslySetInnerHTML={{ __html: qrCodeSvg }}
        />
      </div>

      {/* Questions */}
      <div className="divide-y divide-stone-100 px-5">
        {questions.map((q, qIdx) => (
          <div key={q.id} className="py-4">
            {/* Question text */}
            <div className="mb-3 flex gap-2">
              {questions.length > 1 && (
                <span className="flex h-5 w-5 shrink-0 items-center justify-center rounded-full bg-stone-100 text-[10px] font-bold text-stone-500" data-print-color>
                  {qIdx + 1}
                </span>
              )}
              <div
                className="prose prose-stone prose-sm max-w-none font-medium"
                dangerouslySetInnerHTML={{ __html: q.enonce }}
              />
            </div>

            {/* Options with radio circles */}
            <div className="ml-7 grid gap-2">
              {q.options.map((option, oIdx) => (
                <div key={oIdx} className="flex items-start gap-3 rounded-md border border-stone-200 bg-stone-50/50 px-3 py-2" data-print-color>
                  {/* Radio circle */}
                  <span className="mt-0.5 flex h-4 w-4 shrink-0 items-center justify-center rounded-full border-2 border-stone-400" data-print-color>
                    {/* Empty */}
                  </span>
                  {/* Option label */}
                  <span className="text-[10px] font-bold text-stone-400">{String.fromCharCode(65 + oIdx)}.</span>
                  {/* Option content */}
                  <span
                    className="prose prose-stone prose-sm max-w-none text-sm"
                    dangerouslySetInnerHTML={{ __html: option }}
                  />
                </div>
              ))}
            </div>
          </div>
        ))}
      </div>
    </div>
  )
}

// ─── Helpers ────────────────────────────────────────────────────────────────

/**
 * Extract only the enonce <section> from exercise HTML,
 * removing all <details> blocks (solution, methode, hint, erreurs).
 */
function extractEnonce(html: string): string {
  const sectionMatch = html.match(/<section[^>]*>([\s\S]*?)<\/section>/)
  if (sectionMatch) {
    return sectionMatch[1] ?? html
  }
  return html.replace(/<details[\s\S]*?<\/details>/g, '')
}
