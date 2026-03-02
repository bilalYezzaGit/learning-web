/**
 * Print page for a Cours molecule.
 *
 * Renders a complete printable booklet containing:
 * - Cover page with title, description, objectives, QR code
 * - Sections with headers
 * - All lessons (full content)
 * - All exercises with writing space (no solutions)
 * - All QCMs with empty checkboxes (no correct answers)
 * - Small QR code per atom linking to the online version
 * - Footer with stats and main QR code
 */

import type { Metadata } from 'next'
import { notFound } from 'next/navigation'

import {
  getCours,
  getAtomHtml,
  getCompiledQcm,
  getAllProgrammes,
} from '@/lib/content-loader'
import { generateQrSvg, buildAtomUrl, buildMoleculeUrl } from '@/lib/qr'
import { PrintToolbar } from '@/app/print/_components/print-toolbar'
import { PrintCover } from '@/app/print/_components/print-cover'
import { PrintPageHeader } from '@/app/print/_components/print-page-header'
import { PrintExercise, PrintLesson, PrintQcm } from '@/app/print/_components/print-atom'
import { PrintSectionHeader } from '@/app/print/_components/print-section-header'
import { PrintFooter } from '@/app/print/_components/print-footer'

interface PageProps {
  params: Promise<{ slug: string }>
}

export async function generateMetadata({ params }: PageProps): Promise<Metadata> {
  const { slug } = await params
  try {
    const cours = getCours(slug)
    return { title: `Livret — ${cours.title}` }
  } catch {
    return { title: 'Livret' }
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

  // Find the parcours for this cours to build URLs
  const parcours = findParcoursForCours(slug, cours.programme)
  const context = { type: 'cours' as const, moduleId: slug }
  const moleculeUrl = buildMoleculeUrl(parcours, context)

  // Generate cover QR code
  const coverQrSvg = await generateQrSvg(moleculeUrl, 80)

  // Find programme label
  const programmeLabel = findProgrammeLabel(cours.programme)

  // Counters for the whole booklet
  let globalExerciseCounter = 0
  let globalQcmCounter = 0
  let totalLessons = 0
  let totalExercises = 0
  let totalQcmQuestions = 0

  // Process all sections
  const renderedSections: React.ReactNode[] = []

  for (let sIdx = 0; sIdx < cours.sections.length; sIdx++) {
    const section = cours.sections[sIdx]!
    const sectionNodes: React.ReactNode[] = []

    sectionNodes.push(
      <PrintSectionHeader
        key={`section-${section.id}`}
        label={section.label}
        sectionNumber={sIdx + 1}
      />
    )

    for (const activity of section.activities) {
      const atomUrl = buildAtomUrl(parcours, context, activity.id)
      const qrSvg = await generateQrSvg(atomUrl, 40)

      if (activity.type === 'exercise') {
        globalExerciseCounter++
        totalExercises++
        const html = getAtomHtml(activity.id)
        sectionNodes.push(
          <PrintExercise
            key={activity.id}
            title={activity.title}
            html={html}
            qrCodeSvg={qrSvg}
            exerciseNumber={globalExerciseCounter}
          />
        )
      } else if (activity.type === 'qcm') {
        globalQcmCounter++
        const atomIds = activity.quizAtomIds ?? [activity.id]
        const questions = atomIds.map((id) => getCompiledQcm(id))
        totalQcmQuestions += questions.length
        sectionNodes.push(
          <PrintQcm
            key={activity.id}
            questions={questions}
            qrCodeSvg={qrSvg}
            qcmNumber={globalQcmCounter}
          />
        )
      } else {
        // lesson
        totalLessons++
        const html = getAtomHtml(activity.id)
        sectionNodes.push(
          <PrintLesson
            key={activity.id}
            title={activity.title}
            html={html}
            qrCodeSvg={qrSvg}
          />
        )
      }
    }

    renderedSections.push(
      <div key={`section-wrap-${section.id}`}>
        {sectionNodes}
      </div>
    )
  }

  const totalActivities = cours.sections.reduce(
    (sum, s) => sum + s.activities.length,
    0
  )

  // Footer QR code (larger)
  const footerQrSvg = await generateQrSvg(moleculeUrl, 100)

  return (
    <>
      <PrintToolbar
        backHref={`/${parcours}/apprendre/${slug}`}
        title={cours.title}
      />

      <PrintCover
        title={cours.title}
        description={cours.description}
        kind="cours"
        programme={programmeLabel}
        metadata={{
          estimatedMinutes: cours.estimatedMinutes,
          activityCount: totalActivities,
          trimester: cours.trimester,
        }}
        qrCodeSvg={coverQrSvg}
        onlineUrl={`aylansolutions.com${moleculeUrl}`}
      />

      <div className="print-page-content">
        <PrintPageHeader title={cours.title} kind="cours" />
        {renderedSections}
      </div>

      <div className="print-booklet-footer">
        <PrintFooter
          title={cours.title}
          activityCount={totalActivities}
          exerciseCount={totalExercises}
          qcmCount={totalQcmQuestions}
          lessonCount={totalLessons}
          qrCodeSvg={footerQrSvg}
          onlineUrl={`aylansolutions.com${moleculeUrl}`}
        />
      </div>
    </>
  )
}

/**
 * Find the parcours slug for a given cours.
 */
function findParcoursForCours(coursSlug: string, programmeId: string): string {
  const programmes = getAllProgrammes()
  // Try matching by programme ID first
  const byProgramme = programmes.find((p) => p.id === programmeId)
  if (byProgramme) return byProgramme.id

  // Try finding by cours reference
  for (const p of programmes) {
    if (p.cours.includes(coursSlug)) {
      return p.id
    }
  }
  return programmes[0]?.id ?? '3eme-math'
}

/**
 * Find the programme label.
 */
function findProgrammeLabel(programmeId: string): string {
  const programmes = getAllProgrammes()
  return programmes.find((p) => p.id === programmeId)?.label ?? ''
}
