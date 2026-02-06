/**
 * Series types
 *
 * Editorial series of activities for specific learning goals.
 * Mapped from Flutter lib/core/models/series.dart
 */

import type { Activity } from './activity'

// =============================================================================
// Serie
// =============================================================================

/**
 * Serie - editorial collection of activities for a learning goal
 *
 * Unlike modules, series are cross-cutting and can reference
 * activities from any module. Activities are embedded inline.
 */
export interface Serie {
  id: string
  title: string
  description?: string
  difficulty: number
  estimatedMinutes: number
  tags: string[]
  /** Inline activities (resolved, not references) */
  activities: Activity[]
}

// =============================================================================
// Catalog types
// =============================================================================

/** Lightweight serie metadata (from catalog index) */
export interface SeriesCatalogEntry {
  id: string
  title: string
  description?: string
  difficulty: number
  estimatedMinutes: number
  tags: string[]
  activityCount: number
}

/** Catalog of all series (index.json) */
export interface SeriesCatalog {
  version: number
  updatedAt: string
  /** List of series entries */
  series: SeriesCatalogEntry[]
}

