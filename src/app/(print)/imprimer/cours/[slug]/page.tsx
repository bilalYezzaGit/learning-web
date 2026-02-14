/**
 * Print view for a cours (module) — Booklet format
 *
 * Lives outside the (parcours) route group so it renders without
 * sidebar, header, or height constraints. Content flows naturally
 * across multiple printed pages.
 *
 * Layout:
 * - Cover page with title, description, objectives
 * - Sections with lessons fully expanded
 * - Exercises with answer zones + QR codes
 * - QCMs with options + QR codes
 * - Footer on last page
 */

import type { Metadata } from 'next'
import { notFound } from 'next/navigation'

import { getCours, resolveCoursActivities, getAtom, compileQcmContent } from '@/lib/content'
import { compileMdxForPrint } from '@/lib/mdx-print'
import { getBaseUrl } from '@/lib/utils/get-base-url'
import { PrintToolbar } from '@/components/print/print-toolbar'
import { AnswerZone } from '@/components/print/answer-zone'
import { QRCodeSVG } from '@/components/print/qr-code'

interface PageProps {
  params: Promise<{ slug: string }>
}

export async function generateMetadata({ params }: PageProps): Promise<Metadata> {
  const { slug } = await params
  try {
    const cours = getCours(slug)
    return {
      title: `${cours.title} — Version imprimable`,
      description: `Version PDF imprimable du cours ${cours.title}`,
    }
  } catch {
    return { title: 'Cours — Version imprimable' }
  }
}

export default async function PrintCoursPage({ params }: PageProps) {
  const { slug } = await params

  let cours
  try {
    cours = getCours(slug)
  } catch {
    notFound()
  }

  const activities = resolveCoursActivities(slug)
  const baseUrl = await getBaseUrl()

  // Pre-compile all content in parallel
  const compiledActivities = await Promise.all(
    activities.map(async (activity) => {
      if (activity.type === 'qcm' && activity.quizAtomIds) {
        const questions = await Promise.all(
          activity.quizAtomIds.map(async (qcmId) => {
            const atom = getAtom(qcmId)
            const compiled = await compileQcmContent(atom)
            return { ...compiled, atomId: qcmId }
          })
        )
        return { activity, type: 'qcm' as const, questions }
      }

      const atom = getAtom(activity.id)
      const content = await compileMdxForPrint(atom.content)
      return { activity, type: atom.type as 'lesson' | 'exercise', content }
    })
  )

  // Group activities by section
  const sections = cours.sections.map((section, sectionIndex) => {
    const sectionId = `section-${sectionIndex}`
    const sectionActivities = compiledActivities.filter(
      (ca) => ca.activity.sectionId === sectionId
    )
    return { label: section.label, activities: sectionActivities }
  })

  let exerciseCounter = 0
  let qcmCounter = 0

  return (
    <>
      <PrintToolbar title={`${cours.title} — Version imprimable`} />

      <article className="print-booklet mx-auto max-w-3xl px-8 py-10 print:max-w-none print:px-0 print:py-0">
        {/* ── Cover page ── */}
        <header className="print-cover mb-12 flex min-h-[50vh] flex-col justify-center border-b-2 border-foreground pb-8 print:min-h-0 print:break-after-page print:border-b-0 print:pb-0">
          <div className="text-sm font-medium uppercase tracking-widest text-muted-foreground">
            Cours
          </div>
          <h1 className="mt-2 text-4xl font-bold leading-tight text-foreground print:text-3xl">
            {cours.title}
          </h1>
          {cours.description && (
            <p className="mt-4 text-lg leading-relaxed text-muted-foreground">
              {cours.description}
            </p>
          )}

          <div className="mt-8 flex gap-6 text-sm text-muted-foreground">
            <span>{cours.sections.length} sections</span>
            <span>{activities.length} activités</span>
            {cours.estimatedMinutes && (
              <span>~{cours.estimatedMinutes} min</span>
            )}
          </div>

          {cours.objectives.length > 0 && (
            <div className="mt-8 rounded border border-border bg-muted/30 p-5">
              <div className="mb-3 text-sm font-bold uppercase tracking-wider text-foreground">
                Objectifs du cours
              </div>
              <ul className="space-y-1.5 text-sm text-muted-foreground">
                {cours.objectives.map((obj, i) => (
                  <li key={i} className="flex items-start gap-2">
                    <span className="mt-1 text-primary">&#x2022;</span>
                    {obj}
                  </li>
                ))}
              </ul>
            </div>
          )}
        </header>

        {/* ── Sections ── */}
        {sections.map((section, sectionIdx) => (
          <section key={sectionIdx} className="mb-16 print:mb-0">
            {/* Section title — starts on new page in print */}
            <div className="mb-8 print:break-before-page print:pt-4">
              <div className="text-sm font-medium uppercase tracking-widest text-muted-foreground">
                Section {sectionIdx + 1}
              </div>
              <h2 className="mt-1 text-2xl font-bold text-foreground print:text-xl">
                {section.label}
              </h2>
              <div className="mt-2 h-0.5 w-16 bg-primary/40" />
            </div>

            {section.activities.map((ca, actIdx) => {
              if (ca.type === 'lesson') {
                return (
                  <div key={actIdx} className="mb-10 print:mb-8">
                    <h3 className="mb-4 text-lg font-semibold text-foreground">
                      {ca.activity.title}
                    </h3>
                    <div className="prose prose-stone max-w-none">
                      {ca.content}
                    </div>
                  </div>
                )
              }

              if (ca.type === 'exercise') {
                exerciseCounter++
                return (
                  <div key={actIdx} className="mb-10 break-inside-avoid-page print:mb-8">
                    <h3 className="mb-4 flex items-center gap-3 text-lg font-semibold text-foreground">
                      <span className="inline-flex h-7 w-7 items-center justify-center rounded-full bg-primary/10 text-sm font-bold text-primary">
                        {exerciseCounter}
                      </span>
                      {ca.activity.title}
                      <span className="text-sm font-normal text-muted-foreground">
                        ({ca.activity.timeMinutes} min)
                      </span>
                    </h3>
                    <div className="prose prose-stone max-w-none">
                      {ca.content}
                    </div>
                    <AnswerZone
                      atomId={ca.activity.id}
                      baseUrl={baseUrl}
                      lines={8}
                    />
                  </div>
                )
              }

              if (ca.type === 'qcm') {
                return (
                  <div key={actIdx} className="mb-10 print:mb-8">
                    <h3 className="mb-5 text-lg font-semibold text-foreground">
                      QCM — {ca.questions.length} questions
                    </h3>
                    {ca.questions.map((q) => {
                      qcmCounter++
                      return (
                        <div key={q.atomId} className="mb-6 break-inside-avoid rounded-lg border border-border bg-muted/30 p-5 print:mb-5">
                          <div className="flex items-start justify-between gap-4">
                            <div className="flex-1">
                              <div className="mb-2 text-sm font-bold text-muted-foreground">
                                Question {qcmCounter}
                              </div>
                              <div className="prose prose-stone max-w-none prose-sm">
                                {q.enonce}
                              </div>
                            </div>
                            <div className="shrink-0">
                              <QRCodeSVG
                                value={`${baseUrl}/scan/${q.atomId}`}
                                size={48}
                                errorCorrectionLevel="M"
                              />
                            </div>
                          </div>

                          <div className="mt-4 space-y-2.5">
                            {q.options.map((opt, optIdx) => (
                              <div
                                key={optIdx}
                                className="flex items-start gap-3 text-sm"
                              >
                                <span className="mt-0.5 inline-flex h-6 w-6 shrink-0 items-center justify-center rounded-full border border-border text-xs font-semibold">
                                  {String.fromCharCode(65 + optIdx)}
                                </span>
                                <span className="prose prose-stone prose-sm flex-1">
                                  {opt}
                                </span>
                              </div>
                            ))}
                          </div>

                          <div className="mt-4 border-t border-dotted border-border pt-3">
                            <span className="text-xs text-muted-foreground">
                              Réponse : ______
                            </span>
                          </div>
                        </div>
                      )
                    })}
                  </div>
                )
              }

              return null
            })}
          </section>
        ))}

        {/* ── Footer ── */}
        <footer className="mt-16 border-t border-border pt-6 text-center print:mt-8 print:break-before-avoid">
          <p className="text-xs text-muted-foreground">
            Généré depuis Learning OS · Scannez les QR codes pour corriger vos exercices dans l&apos;application
          </p>
        </footer>
      </article>
    </>
  )
}
