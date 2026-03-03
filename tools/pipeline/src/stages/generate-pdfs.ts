/**
 * PDF generation stage
 *
 * For each visible programme → for each cours:
 * 1. Convert atom rawContent to Typst via mdx-to-typst
 * 2. Assemble livret with cover, sections, series
 * 3. Compile to PDF via Typst WASM
 * 4. Write to public/pdfs/{slug}.pdf
 */

import fs from 'fs'
import path from 'path'
import { PROJECT_ROOT } from '../config.js'
import type {
  RawAtom,
  RawProgramme,
  RawStep,
  ResolvedCours,
  ResolvedSerie,
} from '../types.js'
import { convertMdxToTypst, extractQcmOptions } from '../pdf/mdx-to-typst.js'
import { generateLivretTypst } from '../pdf/livret-template.js'
import type { LivretSection, LivretSerie } from '../pdf/livret-template.js'
import { compileTypstToPdf } from '../pdf/compile-pdf.js'

const PDFS_DIR = path.join(PROJECT_ROOT, 'public', 'pdfs')

interface GeneratePdfsInput {
  atoms: RawAtom[]
  resolvedCours: ResolvedCours[]
  resolvedSeries: ResolvedSerie[]
  programmes: RawProgramme[]
}

/**
 * Convert a single atom's raw content to Typst, wrapped in the appropriate frame.
 */
function convertAtomToTypst(
  atom: RawAtom,
  exerciseNumber: { value: number },
): string {
  if (atom.type === 'lesson') {
    return convertMdxToTypst(atom.rawContent, 'lesson')
  }

  if (atom.type === 'exercise') {
    const content = convertMdxToTypst(atom.rawContent, 'exercise')
    const num = exerciseNumber.value++
    return `#exercise-frame(${num}, [${atom.title}], [\n${content}\n])`
  }

  // QCM atoms are handled at the group level, not individually
  return ''
}

/**
 * Convert a QCM group (multiple qcm atoms) to Typst with empty circles.
 */
function convertQcmGroup(
  atomIds: string[],
  atomMap: Map<string, RawAtom>,
  qcmGroupNumber: { value: number },
): string {
  const questions: string[] = []
  let questionNum = 1

  for (const id of atomIds) {
    const atom = atomMap.get(id)
    if (!atom) continue

    const { question, options } = extractQcmOptions(atom.rawContent)
    // Convert the question text through the MDX→Typst pipeline
    const questionTypst = convertMdxToTypst(question, 'qcm')
    // Convert each option text
    const optionsTypst = options.map(opt => {
      const converted = convertMdxToTypst(opt, 'qcm')
      return `[${converted}]`
    })

    questions.push(
      `#qcm-question(${questionNum}, [\n${questionTypst}\n], (${optionsTypst.join(', ')}))`,
    )
    questionNum++
  }

  if (questions.length === 0) return ''

  const groupNum = qcmGroupNumber.value++
  return `\n=== QCM ${groupNum}\n\n${questions.join('\n\n')}`
}

/**
 * Process all steps in a section/serie and produce Typst content.
 */
function processSteps(
  steps: RawStep[],
  atomMap: Map<string, RawAtom>,
  exerciseCounter: { value: number },
  qcmCounter: { value: number },
): string {
  const parts: string[] = []

  for (const step of steps) {
    if (typeof step === 'object' && 'quiz' in step) {
      const typst = convertQcmGroup(step.quiz, atomMap, qcmCounter)
      if (typst) parts.push(typst)
    } else {
      const atom = atomMap.get(step)
      if (!atom) continue
      const typst = convertAtomToTypst(atom, exerciseCounter)
      if (typst) parts.push(typst)
    }
  }

  return parts.join('\n\n')
}

/**
 * Find the RawCours that matches a ResolvedCours slug.
 * We need the raw cours to access its sections.steps (which contain atom IDs).
 */
function findRawCoursSections(
  resolvedCours: ResolvedCours,
): { rawSections: { label: string; steps: RawStep[] }[] } | undefined {
  // We need to reconstruct the steps from ResolvedCours activities
  // Each activity has an id and optionally quizAtomIds
  const rawSections: { label: string; steps: RawStep[] }[] = []

  for (const section of resolvedCours.sections) {
    const steps: RawStep[] = []
    for (const activity of section.activities) {
      if (activity.type === 'qcm' && activity.quizAtomIds) {
        steps.push({ quiz: activity.quizAtomIds })
      } else {
        steps.push(activity.id)
      }
    }
    rawSections.push({ label: section.label, steps })
  }

  return { rawSections }
}

/**
 * Generate all PDFs for all visible programmes.
 */
export async function generateAllPdfs(input: GeneratePdfsInput): Promise<number> {
  const { atoms, resolvedCours, resolvedSeries, programmes } = input
  const atomMap = new Map(atoms.map(a => [a.id, a]))

  // Ensure output directory exists
  fs.mkdirSync(PDFS_DIR, { recursive: true })

  let pdfCount = 0

  for (const programme of programmes) {
    if (!programme.visible) continue

    // Find all visible cours for this programme
    const progCours = resolvedCours.filter(
      c => c.programme === programme.id && c.visible,
    )

    for (const cours of progCours) {
      const coursData = findRawCoursSections(cours)
      if (!coursData) continue

      // ── Build sections ──
      const exerciseCounter = { value: 1 }
      const qcmCounter = { value: 1 }

      const sections: LivretSection[] = coursData.rawSections.map(section => ({
        label: section.label,
        content: processSteps(section.steps, atomMap, exerciseCounter, qcmCounter),
      }))

      // ── Find related series ──
      const relatedSeries = resolvedSeries.filter(
        s => s.visible && s.modules.includes(cours.slug),
      )

      // Build series content using the same approach
      const seriesData: LivretSerie[] = relatedSeries.map(serie => {
        // Reconstruct steps from activities
        const steps: RawStep[] = serie.activities.map(a => {
          if (a.type === 'qcm' && a.quizAtomIds) {
            return { quiz: a.quizAtomIds }
          }
          return a.id
        })

        const serieExerciseCounter = { value: 1 }
        const serieQcmCounter = { value: 1 }

        return {
          title: serie.title,
          description: serie.description,
          difficulty: serie.difficulty,
          content: processSteps(steps, atomMap, serieExerciseCounter, serieQcmCounter),
        }
      })

      // ── Assemble livret ──
      const typstSource = generateLivretTypst({
        title: cours.title,
        programme: programme.id,
        programmeLabel: programme.label,
        trimester: cours.trimester,
        objectives: cours.objectives,
        estimatedMinutes: cours.estimatedMinutes,
        totalActivities: cours.totalActivities,
        sections,
        series: seriesData,
      })

      // ── Compile to PDF ──
      try {
        const pdf = await compileTypstToPdf(typstSource)
        const outputPath = path.join(PDFS_DIR, `${cours.slug}.pdf`)
        fs.writeFileSync(outputPath, pdf)
        pdfCount++
        console.log(`      ✓ ${cours.slug}.pdf`)
      } catch (err) {
        console.error(`      ✗ ${cours.slug}.pdf — ${err instanceof Error ? err.message : err}`)
      }
    }
  }

  return pdfCount
}
