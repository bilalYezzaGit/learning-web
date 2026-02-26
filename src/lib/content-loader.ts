/**
 * Content loader — reads pre-compiled content from src/generated/
 *
 * Replaces the old content.ts that read raw MDX/YAML from the filesystem.
 * All content is pre-compiled by the pipeline (tools/pipeline/).
 */

import fs from 'fs'
import path from 'path'
import { cache } from 'react'

import type {
  ResolvedActivity,
  Programme,
  Trimestre,
  SeriesType,
  CompiledQCMQuestion,
  CompiledQuiz,
} from '@/types/content'

// =============================================================================
// Types for generated JSON structures
// =============================================================================

export interface GeneratedCoursSection {
  id: string
  label: string
  activities: ResolvedActivity[]
}

export interface GeneratedCours {
  slug: string
  title: string
  description: string
  programme: string
  trimester: string
  order: number
  estimatedMinutes: number
  objectives: string[]
  sections: GeneratedCoursSection[]
  totalActivities: number
}

export interface GeneratedSerie {
  slug: string
  title: string
  description: string
  difficulty: number
  estimatedMinutes: number
  tags: string[]
  type: SeriesType
  trimestre: Trimestre
  modules: string[]
  priority: number
  activities: ResolvedActivity[]
  totalActivities: number
  successThreshold: number
}


// =============================================================================
// Paths
// =============================================================================

const GENERATED_DIR = path.join(process.cwd(), 'src', 'generated')

// =============================================================================
// Internal helpers
// =============================================================================

function readJson<T>(filePath: string): T {
  const raw = fs.readFileSync(filePath, 'utf-8')
  return JSON.parse(raw) as T
}

function fileExists(filePath: string): boolean {
  return fs.existsSync(filePath)
}

// =============================================================================
// Programmes
// =============================================================================

export const getAllProgrammes = cache((): Programme[] => {
  return readJson<Programme[]>(path.join(GENERATED_DIR, 'programmes.json'))
})

export const getProgramme = cache((id: string): Programme => {
  const programmes = getAllProgrammes()
  const found = programmes.find(p => p.id === id)
  if (!found) throw new Error(`Programme "${id}" not found`)
  return found
})

// =============================================================================
// Cours
// =============================================================================

export const getAllCours = cache((): GeneratedCours[] => {
  const dir = path.join(GENERATED_DIR, 'cours')
  if (!fs.existsSync(dir)) return []
  return fs.readdirSync(dir)
    .filter(f => f.endsWith('.json'))
    .map(f => readJson<GeneratedCours>(path.join(dir, f)))
    .sort((a, b) => a.order - b.order)
})

export const getCours = cache((slug: string): GeneratedCours => {
  const filePath = path.join(GENERATED_DIR, 'cours', `${slug}.json`)
  if (!fileExists(filePath)) throw new Error(`Cours "${slug}" not found`)
  return readJson<GeneratedCours>(filePath)
})

export const getCoursActivities = cache((slug: string): ResolvedActivity[] => {
  const cours = getCours(slug)
  return cours.sections.flatMap(s => s.activities)
})

// =============================================================================
// Series
// =============================================================================

export const getAllSeries = cache((): GeneratedSerie[] => {
  const dir = path.join(GENERATED_DIR, 'series')
  if (!fs.existsSync(dir)) return []
  return fs.readdirSync(dir)
    .filter(f => f.endsWith('.json'))
    .map(f => readJson<GeneratedSerie>(path.join(dir, f)))
})

export const getSerie = cache((slug: string): GeneratedSerie => {
  const filePath = path.join(GENERATED_DIR, 'series', `${slug}.json`)
  if (!fileExists(filePath)) throw new Error(`Serie "${slug}" not found`)
  return readJson<GeneratedSerie>(filePath)
})

export const getSerieActivities = cache((slug: string): ResolvedActivity[] => {
  return getSerie(slug).activities
})


// =============================================================================
// Atoms
// =============================================================================

/**
 * Get pre-compiled HTML for a lesson or exercise atom.
 */
export const getAtomHtml = cache((id: string): string => {
  const filePath = path.join(GENERATED_DIR, 'atoms', `${id}.html`)
  if (!fileExists(filePath)) throw new Error(`Atom HTML "${id}" not found`)
  return fs.readFileSync(filePath, 'utf-8')
})


// =============================================================================
// QCM
// =============================================================================

/**
 * Read a pre-compiled QCM question from generated JSON.
 */
export const getCompiledQcm = cache((id: string): CompiledQCMQuestion => {
  const filePath = path.join(GENERATED_DIR, 'atoms', `${id}.json`)
  if (!fileExists(filePath)) throw new Error(`QCM "${id}" not found`)
  return readJson<CompiledQCMQuestion>(filePath)
})

/**
 * Assemble a quiz from pre-compiled QCM questions.
 */
export function getCompiledQuiz(atomIds: string[]): CompiledQuiz {
  const questions = atomIds.map(id => getCompiledQcm(id))
  const firstId = atomIds[0] ?? 'quiz'
  return {
    id: firstId,
    title: `QCM (${atomIds.length} questions)`,
    questions,
  }
}

// =============================================================================
// Quiz group finders
// =============================================================================

/**
 * Find the quiz group containing a given activity ID in a cours.
 */
export function findQuizGroup(coursSlug: string, activityId: string): string[] | undefined {
  const cours = getCours(coursSlug)
  for (const section of cours.sections) {
    for (const activity of section.activities) {
      if (activity.type === 'qcm' && activity.quizAtomIds?.includes(activityId)) {
        return activity.quizAtomIds
      }
    }
  }
  return undefined
}

/**
 * Find the quiz group containing a given activity ID in a serie.
 */
export function findSerieQuizGroup(serieSlug: string, activityId: string): string[] | undefined {
  const serie = getSerie(serieSlug)
  for (const activity of serie.activities) {
    if (activity.type === 'qcm' && activity.quizAtomIds?.includes(activityId)) {
      return activity.quizAtomIds
    }
  }
  return undefined
}
