/**
 * Content reading layer
 *
 * Reads atoms (MDX) and molecules (YAML) directly from the filesystem.
 * Replaces the old build pipeline + content-service + Firebase CDN.
 *
 * All functions are cached with React.cache() — one read per request.
 */

import fs from 'fs'
import path from 'path'
import { cache } from 'react'
import matter from 'gray-matter'
import { parse as parseYaml } from 'yaml'

import type {
  AtomMeta,
  Atom,
  CoursMolecule,
  SeriesMolecule,
  Programme,
  Step,
  ResolvedActivity,
  CompiledQCMQuestion,
  CompiledQuiz,
  Trimestre,
  SeriesType,
} from '@/types/content'
import { extractAtomIds, isQuizStep } from '@/types/content'
import {
  atomMetaSchema,
  coursMoleculeSchema,
  seriesMoleculeSchema,
  programmeSchema,
} from '@/lib/schemas/content'

// =============================================================================
// Paths
// =============================================================================

const CONTENT_DIR = path.join(process.cwd(), 'content')
const ATOMS_DIR = path.join(CONTENT_DIR, 'atoms')
const MOLECULES_DIR = path.join(CONTENT_DIR, 'molecules')

// =============================================================================
// Internal helpers
// =============================================================================

function readYaml(filePath: string): Record<string, unknown> {
  const raw = fs.readFileSync(filePath, 'utf-8')
  return parseYaml(raw) as Record<string, unknown>
}

function parseAtomMeta(fileName: string): AtomMeta {
  const id = fileName.replace('.mdx', '')
  const raw = fs.readFileSync(path.join(ATOMS_DIR, fileName), 'utf-8')
  const { data } = matter(raw)
  const parsed = atomMetaSchema.parse(data)

  return { id, ...parsed }
}

// =============================================================================
// Atoms
// =============================================================================

/**
 * Get all atom metadata (frontmatter only, no MDX content).
 * Used for listings, filtering, admin dashboard.
 */
export const getAllAtoms = cache((): AtomMeta[] => {
  const files = fs.readdirSync(ATOMS_DIR).filter(f => f.endsWith('.mdx'))
  return files.map(parseAtomMeta)
})

/**
 * Get a single atom with its full MDX content.
 * Used for rendering an activity page.
 */
export const getAtom = cache((id: string): Atom => {
  const filePath = path.join(ATOMS_DIR, `${id}.mdx`)
  const raw = fs.readFileSync(filePath, 'utf-8')
  const { data, content } = matter(raw)
  const parsed = atomMetaSchema.parse(data)

  return { id, ...parsed, content }
})

/**
 * Check if an atom exists.
 */
export const atomExists = cache((id: string): boolean => {
  return fs.existsSync(path.join(ATOMS_DIR, `${id}.mdx`))
})

// =============================================================================
// Molecules — Cours
// =============================================================================

/**
 * Get all cours molecules (metadata only).
 */
export const getAllCours = cache((): CoursMolecule[] => {
  const dir = path.join(MOLECULES_DIR, 'cours')
  if (!fs.existsSync(dir)) return []

  return fs.readdirSync(dir)
    .filter(f => f.endsWith('.yaml'))
    .map(f => {
      const slug = f.replace('.yaml', '')
      const data = coursMoleculeSchema.parse(readYaml(path.join(dir, f)))
      return { slug, ...data }
    })
    .sort((a, b) => a.order - b.order)
})

/**
 * Get a single cours molecule.
 */
export const getCours = cache((slug: string): CoursMolecule => {
  const filePath = path.join(MOLECULES_DIR, 'cours', `${slug}.yaml`)
  const data = coursMoleculeSchema.parse(readYaml(filePath))
  return { slug, ...data }
})

// =============================================================================
// Molecules — Series
// =============================================================================

/**
 * Get all series molecules.
 */
export const getAllSeries = cache((): SeriesMolecule[] => {
  const dir = path.join(MOLECULES_DIR, 'series')
  if (!fs.existsSync(dir)) return []

  return fs.readdirSync(dir)
    .filter(f => f.endsWith('.yaml'))
    .map(f => {
      const slug = f.replace('.yaml', '')
      const data = seriesMoleculeSchema.parse(readYaml(path.join(dir, f)))
      return { slug, ...data }
    })
})

/**
 * Get a single series molecule.
 */
export const getSerie = cache((slug: string): SeriesMolecule => {
  const filePath = path.join(MOLECULES_DIR, 'series', `${slug}.yaml`)
  const data = seriesMoleculeSchema.parse(readYaml(filePath))
  return { slug, ...data }
})

/**
 * Get series filtered by trimestre.
 */
export function getSeriesByTrimestre(trimestre: Trimestre): SeriesMolecule[] {
  return getAllSeries().filter(s => s.trimestre === trimestre)
}

/**
 * Get series filtered by type.
 */
export function getSeriesByType(type: SeriesType): SeriesMolecule[] {
  return getAllSeries().filter(s => s.type === type)
}

// =============================================================================
// Programmes
// =============================================================================

/**
 * Get all programmes.
 */
export const getAllProgrammes = cache((): Programme[] => {
  const dir = path.join(MOLECULES_DIR, 'programmes')
  if (!fs.existsSync(dir)) return []

  return fs.readdirSync(dir)
    .filter(f => f.endsWith('.yaml'))
    .map(f => {
      const id = f.replace('.yaml', '')
      const data = programmeSchema.parse(readYaml(path.join(dir, f)))
      return { id, ...data }
    })
    .sort((a, b) => a.order - b.order)
})

/**
 * Get a single programme.
 */
export const getProgramme = cache((id: string): Programme => {
  const filePath = path.join(MOLECULES_DIR, 'programmes', `${id}.yaml`)
  const data = programmeSchema.parse(readYaml(filePath))
  return { id, ...data }
})

// =============================================================================
// Cross-cutting queries
// =============================================================================

/**
 * Get all atom IDs referenced by any molecule (cours or series).
 */
export const getReferencedAtomIds = cache((): Set<string> => {
  const ids = new Set<string>()

  for (const cours of getAllCours()) {
    for (const section of cours.sections) {
      for (const id of extractAtomIds(section.steps)) {
        ids.add(id)
      }
    }
  }

  for (const serie of getAllSeries()) {
    for (const id of extractAtomIds(serie.steps)) {
      ids.add(id)
    }
  }

  return ids
})

/**
 * Get atoms that are not referenced by any molecule.
 * Useful for the admin dashboard to spot unlinked content.
 */
export const getOrphanAtoms = cache((): AtomMeta[] => {
  const referenced = getReferencedAtomIds()
  return getAllAtoms().filter(atom => !referenced.has(atom.id))
})

/**
 * Get all unique tags used across all atoms, with their count.
 */
export const getAllTags = cache((): Map<string, number> => {
  const tagCounts = new Map<string, number>()

  for (const atom of getAllAtoms()) {
    for (const tag of atom.tags) {
      tagCounts.set(tag, (tagCounts.get(tag) ?? 0) + 1)
    }
  }

  return tagCounts
})

// =============================================================================
// QCM compiler
// =============================================================================

import { compileMdx } from '@/lib/mdx'

/**
 * Compile a QCM atom into a CompiledQCMQuestion.
 *
 * Extracts question, options, and explanation via regex on raw MDX source,
 * then compiles each part through compileMdx() for proper LaTeX rendering.
 * correctIndex comes from frontmatter (atom.correctOption).
 */
export async function compileQcmContent(atom: Atom): Promise<CompiledQCMQuestion> {
  const raw = atom.content.trim()

  // Extract <Question>...</Question>
  const questionMatch = raw.match(/<Question>([\s\S]*?)<\/Question>/)
  const questionText = (questionMatch?.[1] ?? '').trim()

  // Extract all <Option>...</Option> and <Option correct>...</Option>
  const optionTexts: string[] = []
  const optionRegex = /<Option(?:\s+correct)?>([\s\S]*?)<\/Option>/g
  let match
  while ((match = optionRegex.exec(raw)) !== null) {
    optionTexts.push((match[1] ?? '').trim())
  }

  // Extract <Explanation>...</Explanation>
  const explMatch = raw.match(/<Explanation>([\s\S]*?)<\/Explanation>/)
  const explanationText = explMatch?.[1]?.trim() || undefined

  // Compile all parts in parallel via compileMdx
  const [enonce, ...compiledOptions] = await Promise.all([
    compileMdx(questionText),
    ...optionTexts.map(text => compileMdx(text)),
  ])

  const explication = explanationText
    ? await compileMdx(explanationText)
    : undefined

  return {
    id: atom.id,
    enonce,
    options: compiledOptions,
    correctIndex: atom.correctOption ?? 0,
    explication,
    timeMinutes: atom.timeMinutes,
  }
}

// =============================================================================
// Molecule resolvers
// =============================================================================

/**
 * Resolve a list of molecule steps into a flat array of ResolvedActivity.
 * Each atom step becomes one entry. Each quiz step becomes one entry
 * with type 'qcm' and the list of QCM atom IDs.
 */
function resolveSteps(
  steps: Step[],
  sectionId?: string,
): ResolvedActivity[] {
  const activities: ResolvedActivity[] = []

  for (const step of steps) {
    if (isQuizStep(step)) {
      // Quiz group: use first QCM atom as the activity ID
      const firstId = step.quiz[0]
      if (!firstId) continue
      const firstAtom = getAtom(firstId)
      const totalTime = step.quiz.reduce((sum, id) => {
        const a = getAtom(id)
        return sum + a.timeMinutes
      }, 0)
      activities.push({
        id: firstId,
        type: 'qcm',
        title: `QCM (${step.quiz.length} questions)`,
        timeMinutes: totalTime,
        sectionId,
        quizAtomIds: step.quiz,
      })
    } else {
      // Single atom
      const atom = getAtom(step)
      activities.push({
        id: atom.id,
        type: atom.type,
        title: atom.title,
        timeMinutes: atom.timeMinutes,
        sectionId,
      })
    }
  }

  return activities
}

/**
 * Resolve a cours molecule into a flat list of activities for timeline and navigation.
 * Section IDs are generated as `section-{index}`.
 */
export const resolveCoursActivities = cache((slug: string): ResolvedActivity[] => {
  const cours = getCours(slug)
  const activities: ResolvedActivity[] = []

  for (let i = 0; i < cours.sections.length; i++) {
    const section = cours.sections[i]!
    const sectionId = `section-${i}`
    activities.push(...resolveSteps(section.steps, sectionId))
  }

  return activities
})

/**
 * Resolve a serie molecule into a flat list of activities.
 */
export const resolveSerieActivities = cache((slug: string): ResolvedActivity[] => {
  const serie = getSerie(slug)
  return resolveSteps(serie.steps)
})

/**
 * Compile a quiz from a list of QCM atom IDs.
 * Async because it uses compileMdx() for each question.
 */
export async function compileQuiz(atomIds: string[]): Promise<CompiledQuiz> {
  const questions = await Promise.all(
    atomIds.map(id => compileQcmContent(getAtom(id)))
  )
  const firstId = atomIds[0] ?? 'quiz'
  return {
    id: firstId,
    title: `QCM (${atomIds.length} questions)`,
    questions,
  }
}

/**
 * Find the quiz group that contains a given activity ID in a cours molecule.
 * Returns the list of QCM atom IDs, or undefined if not in a quiz group.
 */
export function findQuizGroup(slug: string, activityId: string): string[] | undefined {
  const cours = getCours(slug)
  for (const section of cours.sections) {
    for (const step of section.steps) {
      if (isQuizStep(step) && step.quiz.includes(activityId)) {
        return step.quiz
      }
    }
  }
  return undefined
}

/**
 * Find the quiz group that contains a given activity ID in a serie molecule.
 */
export function findSerieQuizGroup(slug: string, activityId: string): string[] | undefined {
  const serie = getSerie(slug)
  for (const step of serie.steps) {
    if (isQuizStep(step) && step.quiz.includes(activityId)) {
      return step.quiz
    }
  }
  return undefined
}
