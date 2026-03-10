/**
 * PDF generation stage
 *
 * For each visible programme → for each livret:
 * 1. Convert atom rawContent to Typst via mdx-to-typst
 * 2. Assemble livret with cover, sections
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
  ResolvedLivret,
} from '../types.js'
import { convertMdxToTypst, extractQcmOptions } from '../pdf/mdx-to-typst.js'
import { generateLivretTypst } from '../pdf/livret-template.js'
import type { LivretSection } from '../pdf/livret-template.js'
import { compileTypstToPdf } from '../pdf/compile-pdf.js'
import {
  generateExerciseQrTypst,
  generateBookletQrTypst,
} from '../pdf/qr-generator.js'

const PDFS_DIR = path.join(PROJECT_ROOT, 'public', 'pdfs')

/**
 * Generate a booklet code from module slug + programme ID.
 * Mirrors src/types/booklet.ts generateBookletCode().
 */
function generateBookletCode(moduleSlug: string, programmeId: string): string {
  const modulePrefix = moduleSlug.replace(/-/g, '').toUpperCase()
  const programmePrefix = programmeId.replace(/-/g, '').slice(0, 2).toUpperCase()
  return `${modulePrefix}-${programmePrefix}-001`
}

interface GeneratePdfsInput {
  atoms: RawAtom[]
  resolvedLivrets: ResolvedLivret[]
  programmes: RawProgramme[]
}

/**
 * Convert a single atom's raw content to Typst, wrapped in the appropriate frame.
 */
async function convertAtomToTypst(
  atom: RawAtom,
  exerciseNumber: { value: number },
  bookletCode?: string,
): Promise<string> {
  if (atom.type === 'lesson') {
    return convertMdxToTypst(atom.rawContent, 'lesson')
  }

  if (atom.type === 'exercise') {
    const content = convertMdxToTypst(atom.rawContent, 'exercise')
    const num = exerciseNumber.value++
    if (bookletCode) {
      const qrTypst = await generateExerciseQrTypst(bookletCode, atom.id)
      return `#exercise-frame(${num}, [${atom.title}], [\n${content}\n], qr: ${qrTypst})`
    }
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
 * Process all steps in a section and produce Typst content.
 */
async function processSteps(
  steps: RawStep[],
  atomMap: Map<string, RawAtom>,
  exerciseCounter: { value: number },
  qcmCounter: { value: number },
  bookletCode?: string,
): Promise<string> {
  const parts: string[] = []

  for (const step of steps) {
    if (typeof step === 'object' && 'quiz' in step) {
      const typst = convertQcmGroup(step.quiz, atomMap, qcmCounter)
      if (typst) parts.push(typst)
    } else {
      const atom = atomMap.get(step)
      if (!atom) continue
      const typst = await convertAtomToTypst(atom, exerciseCounter, bookletCode)
      if (typst) parts.push(typst)
    }
  }

  return parts.join('\n\n')
}

/**
 * Generate all PDFs for all visible programmes.
 */
export async function generateAllPdfs(input: GeneratePdfsInput): Promise<number> {
  const { atoms, resolvedLivrets, programmes } = input
  const atomMap = new Map(atoms.map(a => [a.id, a]))

  // Ensure output directory exists
  fs.mkdirSync(PDFS_DIR, { recursive: true })

  let pdfCount = 0

  for (const programme of programmes) {
    if (!programme.visible) continue

    // Find all visible livrets for this programme
    const progLivrets = resolvedLivrets.filter(
      l => l.programme === programme.id && l.visible,
    )

    for (const livret of progLivrets) {
      // ── Reconstruct steps from resolved activities ──
      const rawSections: { label: string; steps: RawStep[] }[] = []
      for (const section of livret.sections) {
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

      // ── Compute booklet code ──
      const bookletCode = generateBookletCode(livret.slug, programme.id)

      // ── Build sections ──
      const exerciseCounter = { value: 1 }
      const qcmCounter = { value: 1 }

      const sections: LivretSection[] = []
      for (const section of rawSections) {
        sections.push({
          label: section.label,
          content: await processSteps(section.steps, atomMap, exerciseCounter, qcmCounter, bookletCode),
        })
      }

      // ── Generate cover QR ──
      const coverQr = await generateBookletQrTypst(bookletCode)

      // ── Assemble livret ──
      const typstSource = generateLivretTypst({
        title: livret.title,
        programme: programme.id,
        programmeLabel: programme.label,
        trimester: livret.trimester,
        objectives: livret.objectives,
        estimatedMinutes: livret.estimatedMinutes,
        totalActivities: livret.totalActivities,
        sections,
        series: [],
        coverQr,
        bookletCode,
      })

      // ── Compile to PDF ──
      try {
        const pdf = await compileTypstToPdf(typstSource)
        const outputPath = path.join(PDFS_DIR, `${livret.slug}.pdf`)
        fs.writeFileSync(outputPath, pdf)
        pdfCount++
        console.log(`      ✓ ${livret.slug}.pdf`)
      } catch (err) {
        console.error(`      ✗ ${livret.slug}.pdf — ${err instanceof Error ? err.message : err}`)
      }
    }
  }

  return pdfCount
}
