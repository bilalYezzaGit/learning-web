/**
 * Content Service
 *
 * Fetches pedagogical content from Firebase Hosting CDN.
 * Works in both Server Components and Client Components.
 *
 * Endpoints:
 * - GET /content/programmes.json — programmes catalogue
 * - GET /content/cours/{id}.json — module with activities
 * - GET /content/series/index.json — series catalogue
 * - GET /content/series/{id}.json — serie with activities
 */

import type { Programme, Module } from '@/types/models'
import type { Serie, SeriesCatalog } from '@/types/series'

// =============================================================================
// Configuration
// =============================================================================

const BASE_URL = 'https://learning-os-platform.web.app/content'

// =============================================================================
// Error classes
// =============================================================================

export class ContentError extends Error {
  constructor(
    message: string,
    public statusCode?: number
  ) {
    super(message)
    this.name = 'ContentError'
  }
}

export class ContentNotFoundError extends ContentError {
  constructor(message: string) {
    super(message, 404)
    this.name = 'ContentNotFoundError'
  }
}

// =============================================================================
// Response types
// =============================================================================

export interface ProgrammesResponse {
  version: number
  updatedAt: string
  programmes: Programme[]
}

// =============================================================================
// Service functions
// =============================================================================

/**
 * Fetch programmes catalogue (modules without activities)
 */
export async function fetchProgrammes(): Promise<ProgrammesResponse> {
  const url = `${BASE_URL}/programmes.json`

  const response = await fetch(url, {
    next: { revalidate: 3600 }, // Cache for 1 hour
  })

  if (!response.ok) {
    throw new ContentError(
      `Failed to load programmes: ${response.status}`,
      response.status
    )
  }

  const data = await response.json()
  return data as ProgrammesResponse
}

/**
 * Fetch a single module by ID (with activities)
 */
export async function fetchModule(moduleId: string): Promise<Module> {
  const url = `${BASE_URL}/cours/${moduleId}.json`

  const response = await fetch(url, {
    next: { revalidate: 3600 }, // Cache for 1 hour
  })

  if (response.status === 404) {
    throw new ContentNotFoundError(`Module not found: ${moduleId}`)
  }

  if (!response.ok) {
    throw new ContentError(
      `Failed to load module ${moduleId}: ${response.status}`,
      response.status
    )
  }

  const data = await response.json()
  return data as Module
}

/**
 * Fetch series catalogue
 */
export async function fetchSeriesCatalog(): Promise<SeriesCatalog> {
  const url = `${BASE_URL}/series/index.json`

  const response = await fetch(url, {
    next: { revalidate: 3600 }, // Cache for 1 hour
  })

  if (!response.ok) {
    throw new ContentError(
      `Failed to load series catalog: ${response.status}`,
      response.status
    )
  }

  const data = await response.json()
  return data as SeriesCatalog
}

/**
 * Fetch a single serie by ID (with activities)
 */
export async function fetchSerie(serieId: string): Promise<Serie> {
  const url = `${BASE_URL}/series/${serieId}.json`

  const response = await fetch(url, {
    next: { revalidate: 3600 }, // Cache for 1 hour
  })

  if (response.status === 404) {
    throw new ContentNotFoundError(`Serie not found: ${serieId}`)
  }

  if (!response.ok) {
    throw new ContentError(
      `Failed to load serie ${serieId}: ${response.status}`,
      response.status
    )
  }

  const data = await response.json()
  return data as Serie
}

// =============================================================================
// Convenience exports
// =============================================================================

export const contentService = {
  fetchProgrammes,
  fetchModule,
  fetchSeriesCatalog,
  fetchSerie,
}
