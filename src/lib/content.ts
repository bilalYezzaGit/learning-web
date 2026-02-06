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
} from '@/types/content'
import { extractAtomIds } from '@/types/content'

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
      return { id, ...data }
    })
    .sort((a, b) => a.order - b.order)
})

/**
 * Get a single programme.
 */
export const getProgramme = cache((id: string): Programme => {
  const filePath = path.join(MOLECULES_DIR, 'programmes', `${id}.yaml`)
  const data = readYaml<Omit<Programme, 'id'>>(filePath)
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
