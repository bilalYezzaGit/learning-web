/**
 * Print view for a cours (module)
 *
 * Renders all sections and activities in a print-optimized layout:
 * - Lessons: fully expanded with all content visible
 * - Exercises: enonce + answer zone with QR code (solution hidden)
 * - QCMs: questions with numbered options + answer zone with QR code
 *
 * QR codes link to /scan/{atomId} for correction via the app.
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
  params: Promise<{ parcours: string; slug: string }>
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
        // Compile each QCM question
        const questions = await Promise.all(
          activity.quizAtomIds.map(async (qcmId) => {
            const atom = getAtom(qcmId)
            const compiled = await compileQcmContent(atom)
            return { ...compiled, atomId: qcmId }
          })
        )
        return { activity, type: 'qcm' as const, questions }
      }

      // Lesson or exercise
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
    <div className="print-page">
      <PrintToolbar title={`${cours.title} — Version imprimable`} />

      <div className="mx-auto max-w-4xl px-6 py-8 print:px-0 print:py-0">
        {/* Header */}
        <header className="mb-10 border-b-2 border-foreground pb-6 print:mb-8">
          <h1 className="text-3xl font-bold text-foreground print:text-2xl">
            {cours.title}
          </h1>
          {cours.description && (
            <p className="mt-2 text-base text-muted-foreground">{cours.description}</p>
          )}
          <div className="mt-4 flex gap-4 text-sm text-muted-foreground">
            <span>{cours.sections.length} sections</span>
            <span>·</span>
            <span>{activities.length} activités</span>
            {cours.estimatedMinutes && (
              <>
                <span>·</span>
                <span>{cours.estimatedMinutes} min estimées</span>
              </>
            )}
          </div>

          {/* Objectives */}
          {cours.objectives.length > 0 && (
            <div className="mt-4">
              <div className="text-sm font-semibold text-foreground">Objectifs :</div>
              <ul className="mt-1 list-inside list-disc text-sm text-muted-foreground">
                {cours.objectives.map((obj, i) => (
                  <li key={i}>{obj}</li>
                ))}
              </ul>
            </div>
          )}
        </header>

        {/* Sections */}
        {sections.map((section, sectionIdx) => (
          <section key={sectionIdx} className="mb-12 print:mb-8">
            <h2 className="mb-6 border-b border-border pb-2 text-xl font-bold text-foreground print:text-lg">
              {sectionIdx + 1}. {section.label}
            </h2>

            {section.activities.map((ca, actIdx) => {
              if (ca.type === 'lesson') {
                return (
                  <article key={actIdx} className="mb-8 break-inside-avoid-page print:mb-6">
                    <h3 className="mb-3 text-base font-semibold text-foreground">
                      {ca.activity.title}
                    </h3>
                    <div className="prose prose-stone max-w-none prose-sm">
                      {ca.content}
                    </div>
                  </article>
                )
              }

              if (ca.type === 'exercise') {
                exerciseCounter++
                return (
                  <article key={actIdx} className="mb-8 break-inside-avoid-page print:mb-6">
                    <h3 className="mb-3 flex items-center gap-2 text-base font-semibold text-foreground">
                      <span className="inline-flex h-6 w-6 items-center justify-center rounded-full bg-primary/10 text-xs font-bold text-primary">
                        {exerciseCounter}
                      </span>
                      {ca.activity.title}
                      <span className="text-xs font-normal text-muted-foreground">
                        ({ca.activity.timeMinutes} min)
                      </span>
                    </h3>
                    <div className="prose prose-stone max-w-none prose-sm">
                      {ca.content}
                    </div>
                    <AnswerZone
                      atomId={ca.activity.id}
                      baseUrl={baseUrl}
                      lines={8}
                    />
                  </article>
                )
              }

              if (ca.type === 'qcm') {
                return (
                  <article key={actIdx} className="mb-8 break-inside-avoid-page print:mb-6">
                    <h3 className="mb-4 text-base font-semibold text-foreground">
                      QCM — {ca.questions.length} questions
                    </h3>
                    {ca.questions.map((q) => {
                      qcmCounter++
                      return (
                        <div key={q.atomId} className="mb-6 break-inside-avoid rounded border border-border bg-muted/50 p-4 print:mb-4">
                          <div className="mb-3 flex items-start justify-between gap-3">
                            <div className="flex-1">
                              <div className="mb-2 text-sm font-semibold text-muted-foreground">
                                Question {qcmCounter}
                              </div>
                              <div className="prose prose-stone max-w-none prose-sm">
                                {q.enonce}
                              </div>
                            </div>
                            <div className="shrink-0 print:block hidden">
                              <QRCodeSVG
                                value={`${baseUrl}/scan/${q.atomId}`}
                                size={48}
                                errorCorrectionLevel="M"
                              />
                            </div>
                          </div>

                          {/* Options */}
                          <div className="mt-3 space-y-2">
                            {q.options.map((opt, optIdx) => (
                              <label
                                key={optIdx}
                                className="flex items-start gap-2 text-sm text-foreground"
                              >
                                <span className="mt-0.5 inline-flex h-5 w-5 shrink-0 items-center justify-center rounded-full border border-border text-xs font-medium">
                                  {String.fromCharCode(65 + optIdx)}
                                </span>
                                <span className="prose prose-stone prose-sm flex-1">
                                  {opt}
                                </span>
                              </label>
                            ))}
                          </div>

                          {/* Small answer line for QCM */}
                          <div className="mt-3 border-t border-dotted border-border pt-2">
                            <span className="text-xs text-muted-foreground">
                              Réponse : ______
                            </span>
                          </div>
                        </div>
                      )
                    })}
                  </article>
                )
              }

              return null
            })}
          </section>
        ))}

        {/* Footer */}
        <footer className="mt-12 border-t border-border pt-4 text-center text-xs text-muted-foreground print:mt-8">
          <p>
            Généré depuis l&apos;application · Scannez les QR codes pour corriger vos exercices
          </p>
        </footer>
      </div>
    </div>
  )
}
