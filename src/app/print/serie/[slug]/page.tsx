/**
 * Print page for a Serie molecule.
 *
 * Renders a complete printable booklet containing:
 * - Cover page with title, description, QR code
 * - All exercises with writing space (no solutions)
 * - All QCMs with empty checkboxes (no correct answers)
 * - All lessons (full content)
 * - Small QR code per atom linking to the online version
 * - Footer with stats and main QR code
 */

import type { Metadata } from 'next'
import { notFound } from 'next/navigation'

import {
  getSerie,
  getSerieActivities,
  getAtomHtml,
  getCompiledQcm,
  getAllProgrammes,
} from '@/lib/content-loader'
import { generateQrSvg, buildAtomUrl, buildMoleculeUrl } from '@/lib/qr'
import { PrintToolbar } from '@/app/print/_components/print-toolbar'
import { PrintCover } from '@/app/print/_components/print-cover'
import { PrintPageHeader } from '@/app/print/_components/print-page-header'
import { PrintExercise, PrintLesson, PrintQcm } from '@/app/print/_components/print-atom'
import { PrintFooter } from '@/app/print/_components/print-footer'

interface PageProps {
  params: Promise<{ slug: string }>
}

export async function generateMetadata({ params }: PageProps): Promise<Metadata> {
  const { slug } = await params
  try {
    const serie = getSerie(slug)
    return { title: `Livret — ${serie.title}` }
  } catch {
    return { title: 'Livret' }
  }
}

export default async function PrintSeriePage({ params }: PageProps) {
  const { slug } = await params

  let serie
  try {
    serie = getSerie(slug)
  } catch {
    notFound()
  }

  const activities = getSerieActivities(slug)

  // Find the parcours for this serie to build URLs
  const parcours = findParcoursForSerie(slug)
  const context = { type: 'serie' as const, serieSlug: slug }
  const moleculeUrl = buildMoleculeUrl(parcours, context)

  // Generate cover QR code
  const coverQrSvg = await generateQrSvg(moleculeUrl, 80)

  // Find programme label
  const programmeLabel = findProgrammeLabel(slug)

  // Process all activities and generate QR codes
  let exerciseCounter = 0
  let qcmCounter = 0
  let lessonCount = 0
  let exerciseCount = 0
  let qcmQuestionCount = 0

  const renderedAtoms: React.ReactNode[] = []

  for (const activity of activities) {
    const atomUrl = buildAtomUrl(parcours, context, activity.id)
    const qrSvg = await generateQrSvg(atomUrl, 40)

    if (activity.type === 'exercise') {
      exerciseCounter++
      exerciseCount++
      const html = getAtomHtml(activity.id)
      renderedAtoms.push(
        <PrintExercise
          key={activity.id}
          title={activity.title}
          html={html}
          qrCodeSvg={qrSvg}
          exerciseNumber={exerciseCounter}
        />
      )
    } else if (activity.type === 'qcm') {
      qcmCounter++
      const atomIds = activity.quizAtomIds ?? [activity.id]
      const questions = atomIds.map((id) => getCompiledQcm(id))
      qcmQuestionCount += questions.length
      renderedAtoms.push(
        <PrintQcm
          key={activity.id}
          questions={questions}
          qrCodeSvg={qrSvg}
          qcmNumber={qcmCounter}
        />
      )
    } else {
      // lesson
      lessonCount++
      const html = getAtomHtml(activity.id)
      renderedAtoms.push(
        <PrintLesson
          key={activity.id}
          title={activity.title}
          html={html}
          qrCodeSvg={qrSvg}
        />
      )
    }
  }

  // Footer QR code (larger)
  const footerQrSvg = await generateQrSvg(moleculeUrl, 100)

  return (
    <>
      <PrintToolbar
        backHref={`/${parcours}/serie/${slug}`}
        title={serie.title}
      />

      <PrintCover
        title={serie.title}
        description={serie.description}
        kind="serie"
        programme={programmeLabel}
        metadata={{
          estimatedMinutes: serie.estimatedMinutes,
          activityCount: activities.length,
          difficulty: serie.difficulty,
        }}
        qrCodeSvg={coverQrSvg}
        onlineUrl={`aylansolutions.com${moleculeUrl}`}
      />

      <div className="print-page-content">
        <PrintPageHeader title={serie.title} kind="serie" />
        {renderedAtoms}
      </div>

      <div className="print-booklet-footer">
        <PrintFooter
          title={serie.title}
          activityCount={activities.length}
          exerciseCount={exerciseCount}
          qcmCount={qcmQuestionCount}
          lessonCount={lessonCount}
          qrCodeSvg={footerQrSvg}
          onlineUrl={`aylansolutions.com${moleculeUrl}`}
        />
      </div>
    </>
  )
}

/**
 * Find the parcours slug that contains a given serie.
 */
function findParcoursForSerie(serieSlug: string): string {
  const programmes = getAllProgrammes()
  for (const p of programmes) {
    if (p.series.includes(serieSlug)) {
      return p.id
    }
  }
  // Fallback to first active programme
  return programmes[0]?.id ?? '3eme-math'
}

/**
 * Find the programme label for a given serie.
 */
function findProgrammeLabel(serieSlug: string): string {
  const programmes = getAllProgrammes()
  for (const p of programmes) {
    if (p.series.includes(serieSlug)) {
      return p.label
    }
  }
  return ''
}
