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

const PARCOURS_LIST: ParcoursConfig[] = parcoursList as ParcoursConfig[]

/**
 * Get parcours config by slug
 */
export function getParcoursConfig(slug: string): ParcoursConfig | undefined {
  return PARCOURS_LIST.find((p) => p.slug === slug)
}
