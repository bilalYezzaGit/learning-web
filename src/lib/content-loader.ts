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
  visible: boolean
  sections: GeneratedCoursSection[]
  totalActivities: number
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

// =============================================================================
// Cours
// =============================================================================

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

/**
 * Get raw MDX content for an exercise atom (used by scan/correction API).
 */
export const getAtomRawContent = cache((id: string): string | null => {
  const filePath = path.join(GENERATED_DIR, 'atoms', `${id}.mdx`)
  if (!fileExists(filePath)) return null
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
