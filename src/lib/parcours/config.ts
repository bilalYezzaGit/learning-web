/**
 * Parcours Configuration
 *
 * Static configuration for available parcours (user journeys).
 */

export interface ParcoursConfig {
  slug: string
  label: string
  level: string
  section: string
  description?: string
  order: number
  available: boolean
}

/**
 * All available parcours
 */
export const PARCOURS_LIST: ParcoursConfig[] = [
  {
    slug: '3eme-math',
    label: '3ème Maths',
    level: '3eme',
    section: 'math',
    description: 'Programme de mathématiques pour la 3ème année',
    order: 1,
    available: true,
  },
  {
    slug: '2nde-math',
    label: '2nde Maths',
    level: '2nde',
    section: 'math',
    description: 'Programme de mathématiques pour la 2nde année',
    order: 2,
    available: true,
  },
  {
    slug: '1ere-math',
    label: '1ère Maths',
    level: '1ere',
    section: 'math',
    description: 'Programme de mathématiques pour la 1ère année',
    order: 3,
    available: true,
  },
  {
    slug: 'term-math',
    label: 'Terminale Maths',
    level: 'term',
    section: 'math',
    description: 'Programme de mathématiques pour la Terminale',
    order: 4,
    available: true,
  },
]

/**
 * Valid parcours slugs for route matching
 */
export const VALID_PARCOURS_SLUGS = PARCOURS_LIST.filter((p) => p.available).map(
  (p) => p.slug
)

/**
 * Get parcours config by slug
 */
export function getParcoursConfig(slug: string): ParcoursConfig | undefined {
  return PARCOURS_LIST.find((p) => p.slug === slug)
}

/**
 * Check if a slug is a valid parcours
 */
export function isValidParcours(slug: string): boolean {
  return VALID_PARCOURS_SLUGS.includes(slug)
}

/**
 * Get available parcours for display
 */
export function getAvailableParcours(): ParcoursConfig[] {
  return PARCOURS_LIST.filter((p) => p.available).sort((a, b) => a.order - b.order)
}
