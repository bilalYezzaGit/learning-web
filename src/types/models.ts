/**
 * Core content models
 *
 * Programme, Module, Section, CourseContent
 * Mapped from Flutter lib/core/models/
 */

import type { Activity } from './activity'

// =============================================================================
// Section
// =============================================================================

/**
 * A section (thematic grouping) within a module
 *
 * Example:
 * - "Continuité en un point" (exercises on definition)
 * - "Prolongement par continuité" (exercises on extension)
 */
export interface Section {
  /** Unique identifier (e.g., "cont-point", "cont-prolongement") */
  id: string
  /** Display label */
  label: string
  /** Display order (0 = first) */
  order: number
}

// =============================================================================
// CourseContent
// =============================================================================

/** Course content (cours or resume) */
export interface CourseContent {
  title: string
  body: string
}

// =============================================================================
// Module
// =============================================================================

/**
 * Module - complete learning unit with all content
 *
 * A module represents a learning unit containing:
 * - Course content (cours, resume)
 * - Inline activities (exercises, QCMs, lessons)
 * - Sections for organizing activities by concept
 * - coursePath for sequential learning
 */
export interface Module {
  id: string
  /** Human-readable slug used by activities to reference this module */
  slug: string
  programmeId: string
  title: string
  description: string
  icon?: string
  trimester: string
  order: number
  version: number
  updatedAt?: string
  estimatedTime: number
  prerequisites: string[]
  objectives: string[]
  tags: string[]

  /** Course content */
  cours?: CourseContent
  resume?: CourseContent

  /** Inline activities belonging to this module */
  activities: Activity[]

  /** Sections for organizing activities by concept */
  sections: Section[]

  /**
   * Ordered list of activity IDs for the course path
   * This defines the pedagogical sequence for the "Cours" tab
   */
  coursePath: string[]

  /** Whether the module is available (false = greyed out, coming soon) */
  available: boolean
}

// =============================================================================
// Programme
// =============================================================================

/**
 * Programme - represents a learning path (e.g., "3ème Math")
 *
 * Contains full modules with inline activities (loaded from cours.json).
 */
export interface Programme {
  id: string
  label: string
  levelSlug: string
  sectionSlug: string
  levelName: string
  sectionName: string
  description: string
  order: number
  color: string
  icon: string
  available: boolean
  modules: Module[]
}

