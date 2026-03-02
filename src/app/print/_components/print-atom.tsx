/**
 * PrintAtom — renders a single atom in print layout.
 *
 * - Lessons: full content
 * - Exercises: enonce only + writing space (no solution)
 * - QCM: question + options as checkboxes (no correct answer marked)
 *
 * Each atom has a small QR code linking to its online version.
 */

import type { CompiledQCMQuestion } from '@/types/content'

// ─── Exercise print ─────────────────────────────────────────────────────────

interface PrintExerciseProps {
  title: string
  html: string
  qrCodeSvg: string
  exerciseNumber: number
}

/**
 * Renders an exercise for print: enonce only, no solution.
 * The HTML from the pipeline has <details> for solution/methode/hint
 * which we strip server-side to only keep the <section> enonce.
 */
export function PrintExercise({ title, html, qrCodeSvg, exerciseNumber }: PrintExerciseProps) {
  // Extract only the enonce section, strip collapsibles (details elements)
  const enonceHtml = extractEnonce(html)

  return (
    <div className="print-atom print-exercise break-inside-avoid-page mb-8">
      {/* Header with title + QR */}
      <div className="mb-3 flex items-start justify-between gap-3">
        <div className="flex items-center gap-2.5">
          <span className="flex h-7 w-7 shrink-0 items-center justify-center rounded-full bg-stone-100 text-xs font-bold text-stone-600">
            {exerciseNumber}
          </span>
          <h3 className="text-sm font-semibold text-stone-800">{title}</h3>
        </div>
        <div
          className="shrink-0 rounded border border-stone-200 bg-white p-0.5"
          dangerouslySetInnerHTML={{ __html: qrCodeSvg }}
        />
      </div>

      {/* Enonce content */}
      <div className="prose prose-stone prose-sm max-w-none pl-10">
        <div dangerouslySetInnerHTML={{ __html: enonceHtml }} />
      </div>

      {/* Writing space */}
      <div className="mt-4 ml-10">
        <div className="rounded-lg border border-dashed border-stone-300 bg-stone-50/50 px-4 py-2">
          <p className="mb-2 text-[10px] font-medium uppercase tracking-wider text-stone-400">
            Reponse
          </p>
          <div className="print-writing-lines">
            {Array.from({ length: 8 }).map((_, i) => (
              <div
                key={i}
                className="border-b border-stone-200/60"
                style={{ height: '1.8em' }}
              />
            ))}
          </div>
        </div>
      </div>
    </div>
  )
}

// ─── Lesson print ───────────────────────────────────────────────────────────

interface PrintLessonProps {
  title: string
  html: string
  qrCodeSvg: string
}

/**
 * Renders a lesson for print: full content with all lesson parts visible.
 */
export function PrintLesson({ title, html, qrCodeSvg }: PrintLessonProps) {
  return (
    <div className="print-atom print-lesson mb-8">
      {/* Header with title + QR */}
      <div className="mb-3 flex items-start justify-between gap-3">
        <div className="flex items-center gap-2.5">
          <span className="flex h-5 w-5 shrink-0 items-center justify-center rounded-full bg-primary/10">
            <svg xmlns="http://www.w3.org/2000/svg" width="12" height="12" viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="2" strokeLinecap="round" strokeLinejoin="round" className="text-primary" aria-hidden="true"><path d="M4 19.5v-15A2.5 2.5 0 0 1 6.5 2H19a1 1 0 0 1 1 1v18a1 1 0 0 1-1 1H6.5a1 1 0 0 1 0-5H20"/></svg>
          </span>
          <h3 className="text-sm font-semibold text-stone-800">{title}</h3>
        </div>
        <div
          className="shrink-0 rounded border border-stone-200 bg-white p-0.5"
          dangerouslySetInnerHTML={{ __html: qrCodeSvg }}
        />
      </div>

      {/* Full lesson content */}
      <div
        className="prose prose-stone prose-sm max-w-none"
        dangerouslySetInnerHTML={{ __html: html }}
      />
    </div>
  )
}

// ─── QCM print ──────────────────────────────────────────────────────────────

interface PrintQcmProps {
  questions: CompiledQCMQuestion[]
  qrCodeSvg: string
  qcmNumber: number
}

/**
 * Renders a QCM group for print: questions with empty checkboxes.
 * Does NOT mark the correct answer.
 */
export function PrintQcm({ questions, qrCodeSvg, qcmNumber }: PrintQcmProps) {
  return (
    <div className="print-atom print-qcm break-inside-avoid-page mb-8">
      {/* Header */}
      <div className="mb-3 flex items-start justify-between gap-3">
        <div className="flex items-center gap-2.5">
          <span className="flex h-7 w-7 shrink-0 items-center justify-center rounded-full bg-stone-100 text-xs font-bold text-stone-600">
            Q{qcmNumber}
          </span>
          <h3 className="text-sm font-semibold text-stone-800">
            QCM ({questions.length} question{questions.length > 1 ? 's' : ''})
          </h3>
        </div>
        <div
          className="shrink-0 rounded border border-stone-200 bg-white p-0.5"
          dangerouslySetInnerHTML={{ __html: qrCodeSvg }}
        />
      </div>

      {/* Questions */}
      <div className="space-y-5 pl-10">
        {questions.map((q, qIdx) => (
          <div key={q.id} className="break-inside-avoid">
            {/* Question text */}
            <div className="mb-2 flex gap-2">
              {questions.length > 1 && (
                <span className="text-xs font-medium text-stone-500">
                  {qIdx + 1}.
                </span>
              )}
              <div
                className="prose prose-stone prose-sm max-w-none"
                dangerouslySetInnerHTML={{ __html: q.enonce }}
              />
            </div>

            {/* Options with empty checkboxes */}
            <div className="mt-2 space-y-1.5 pl-4">
              {q.options.map((option, oIdx) => (
                <label key={oIdx} className="flex items-start gap-2.5">
                  <span className="mt-0.5 flex h-4 w-4 shrink-0 items-center justify-center rounded border border-stone-400">
                    {/* Empty checkbox for print */}
                  </span>
                  <span
                    className="prose prose-stone prose-sm max-w-none text-sm"
                    dangerouslySetInnerHTML={{ __html: option }}
                  />
                </label>
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
  // The pipeline wraps enonce in <section class="mt-2">...</section>
  // and solution/methode/hint/erreurs in <details>...</details>
  // We keep only the <section> content
  const sectionMatch = html.match(/<section[^>]*>([\s\S]*?)<\/section>/)
  if (sectionMatch) {
    return sectionMatch[1] ?? html
  }
  // Fallback: strip all <details> blocks
  return html.replace(/<details[\s\S]*?<\/details>/g, '')
}
