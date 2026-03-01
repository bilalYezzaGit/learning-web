/**
 * Parcours Configuration
 *
 * Reads from generated parcours.json (produced by the pipeline).
 *
 * - `visible`: shown on landing page, signup, etc. (even if not yet active = "coming soon")
 * - `active`: routes work, content is navigable, users can select it
 */

import parcoursList from '@/generated/parcours.json'

export interface ParcoursConfig {
  slug: string
  label: string
  level: string
  section: string
  description?: string
  order: number
  visible: boolean
  active: boolean
}

export const PARCOURS_LIST: ParcoursConfig[] = parcoursList as ParcoursConfig[]

/**
 * Active parcours slugs — only these have working routes
 */
export const ACTIVE_PARCOURS_SLUGS = PARCOURS_LIST.filter((p) => p.active).map(
  (p) => p.slug
)

/**
 * Default parcours slug — first active parcours, used for CTAs and fallback links
 */
export const DEFAULT_PARCOURS_SLUG = ACTIVE_PARCOURS_SLUGS[0]!

/**
 * Get parcours config by slug
 */
export function getParcoursConfig(slug: string): ParcoursConfig | undefined {
  return PARCOURS_LIST.find((p) => p.slug === slug)
}

/**
 * Check if a slug is an active parcours (routes work)
 */
export function isActiveParcours(slug: string): boolean {
  return ACTIVE_PARCOURS_SLUGS.includes(slug)
}

/**
 * Get active parcours — selectable, navigable, with content
 */
export function getActiveParcours(): ParcoursConfig[] {
  return PARCOURS_LIST.filter((p) => p.active).sort((a, b) => a.order - b.order)
}

/**
 * Get visible parcours — shown on UI (includes coming soon)
 */
export function getVisibleParcours(): ParcoursConfig[] {
  return PARCOURS_LIST.filter((p) => p.visible).sort((a, b) => a.order - b.order)
}

/**
 * Get all parcours sorted by order
 */
export function getAllParcours(): ParcoursConfig[] {
  return [...PARCOURS_LIST].sort((a, b) => a.order - b.order)
}
