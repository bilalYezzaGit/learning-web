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
  ParsedQCMQuestion,
  ResolvedQuiz,
} from '@/types/content'
import { extractAtomIds, isQuizStep } from '@/types/content'

// =============================================================================
// Paths
// =============================================================================

const CONTENT_DIR = path.join(process.cwd(), 'content')
const ATOMS_DIR = path.join(CONTENT_DIR, 'atoms')
const MOLECULES_DIR = path.join(CONTENT_DIR, 'molecules')

// =============================================================================
// Internal helpers
// =============================================================================

function readYaml<T>(filePath: string): T {
  const raw = fs.readFileSync(filePath, 'utf-8')
  return parseYaml(raw) as T
}

function parseAtomMeta(fileName: string): AtomMeta {
  const id = fileName.replace('.mdx', '')
  const raw = fs.readFileSync(path.join(ATOMS_DIR, fileName), 'utf-8')
  const { data } = matter(raw)

  return {
    id,
    type: data.type,
    title: data.title,
    difficulty: data.difficulty ?? 1,
    timeMinutes: data.timeMinutes ?? 5,
    tags: data.tags ?? [],
    ...(data.category && { category: data.category }),
  }
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

  return {
    id,
    type: data.type,
    title: data.title,
    difficulty: data.difficulty ?? 1,
    timeMinutes: data.timeMinutes ?? 5,
    tags: data.tags ?? [],
    ...(data.category && { category: data.category }),
    content,
  }
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
      const data = readYaml<Omit<CoursMolecule, 'slug'>>(path.join(dir, f))
      return { slug, ...data }
    })
    .sort((a, b) => a.order - b.order)
})

/**
 * Get a single cours molecule.
 */
export const getCours = cache((slug: string): CoursMolecule => {
  const filePath = path.join(MOLECULES_DIR, 'cours', `${slug}.yaml`)
  const data = readYaml<Omit<CoursMolecule, 'slug'>>(filePath)
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
      const data = readYaml<Omit<SeriesMolecule, 'slug'>>(path.join(dir, f))
      return { slug, ...data }
    })
})

/**
 * Get a single series molecule.
 */
export const getSerie = cache((slug: string): SeriesMolecule => {
  const filePath = path.join(MOLECULES_DIR, 'series', `${slug}.yaml`)
  const data = readYaml<Omit<SeriesMolecule, 'slug'>>(filePath)
  return { slug, ...data }
})

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
      const data = readYaml<Omit<Programme, 'id'>>(path.join(dir, f))
      return { id, ...data, series: data.series ?? [] }
    })
    .sort((a, b) => a.order - b.order)
})

/**
 * Get a single programme.
 */
export const getProgramme = cache((id: string): Programme => {
  const filePath = path.join(MOLECULES_DIR, 'programmes', `${id}.yaml`)
  const data = readYaml<Omit<Programme, 'id'>>(filePath)
  return { id, ...data, series: data.series ?? [] }
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
// QCM parser
// =============================================================================

/**
 * Convert $...$ LaTeX to <math>...</math> tags for ContentRenderer.
 * Also converts $$...$$ to <math-block>...</math-block>.
 */
function latexToMathTags(text: string): string {
  // Block math: $$...$$ → <math-block>...</math-block>
  let result = text.replace(/\$\$([\s\S]+?)\$\$/g, '<math-block>$1</math-block>')
  // Inline math: $...$ → <math>...</math>
  result = result.replace(/\$(.+?)\$/g, '<math>$1</math>')
  return result
}

/**
 * Parse QCM atom MDX content into structured question data.
 *
 * Supports the component format (v2):
 * ```
 * <Question>Question text</Question>
 * <Option>Wrong</Option>
 * <Option correct>Correct</Option>
 * <Explanation>Why</Explanation>
 * ```
 */
export function parseQcmContent(atom: Atom): ParsedQCMQuestion {
  const raw = atom.content.trim()

  // Detect format: component-based (<Question>) vs legacy (checkbox)
  if (raw.includes('<Question>')) {
    return parseQcmComponents(atom, raw)
  }

  return parseQcmLegacy(atom, raw)
}

/**
 * Parse v2 component format using regex on raw MDX source.
 */
function parseQcmComponents(atom: Atom, raw: string): ParsedQCMQuestion {
  // Extract <Question>...</Question>
  const questionMatch = raw.match(/<Question>([\s\S]*?)<\/Question>/)
  const enonce = latexToMathTags((questionMatch?.[1] ?? '').trim())

  // Extract all <Option>...</Option> and <Option correct>...</Option>
  const options: string[] = []
  let correctIndex = 0
  const optionRegex = /<Option(\s+correct)?>([\s\S]*?)<\/Option>/g
  let match
  while ((match = optionRegex.exec(raw)) !== null) {
    if (match[1]) {
      correctIndex = options.length
    }
    options.push(latexToMathTags((match[2] ?? '').trim()))
  }

  // Extract <Explanation>...</Explanation>
  const explMatch = raw.match(/<Explanation>([\s\S]*?)<\/Explanation>/)
  const explication = explMatch?.[1]?.trim() || undefined

  return {
    id: atom.id,
    enonce,
    options,
    correctIndex,
    explication: explication ? latexToMathTags(explication) : undefined,
    timeMinutes: atom.timeMinutes,
  }
}

/**
 * Parse legacy checkbox format (v1).
 * ```
 * Question text
 * - [ ] Wrong
 * - [x] Correct
 * > Explanation
 * ```
 */
function parseQcmLegacy(atom: Atom, raw: string): ParsedQCMQuestion {
  const lines = raw.split('\n')

  const enonceLines: string[] = []
  const options: string[] = []
  let correctIndex = 0
  const explicLines: string[] = []
  let phase: 'enonce' | 'options' | 'explic' = 'enonce'

  for (const line of lines) {
    const trimmed = line.trim()

    // Check for option line
    const optionMatch = trimmed.match(/^-\s+\[([ x])\]\s+(.+)$/)
    if (optionMatch && optionMatch[2]) {
      phase = 'options'
      if (optionMatch[1] === 'x') {
        correctIndex = options.length
      }
      options.push(latexToMathTags(optionMatch[2]))
      continue
    }

    // Check for explanation (blockquote)
    if (trimmed.startsWith('>')) {
      phase = 'explic'
      explicLines.push(trimmed.replace(/^>\s*/, ''))
      continue
    }

    if (phase === 'enonce') {
      enonceLines.push(line)
    } else if (phase === 'explic') {
      explicLines.push(trimmed)
    }
  }

  const enonce = latexToMathTags(enonceLines.join('\n').trim())
  const explication = explicLines.join(' ').trim() || undefined

  return {
    id: atom.id,
    enonce,
    options,
    correctIndex,
    explication: explication ? latexToMathTags(explication) : undefined,
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
      getAtom(firstId) // validate existence
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
 * Build a ResolvedQuiz from a list of QCM atom IDs (for QCMPlayer).
 */
export function resolveQuiz(atomIds: string[]): ResolvedQuiz {
  const questions = atomIds.map(id => parseQcmContent(getAtom(id)))
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
