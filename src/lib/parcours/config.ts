/**
 * Parcours Configuration
 *
 * Static configuration for available parcours (user journeys).
 * Only 1ère TC has content ready for the MVP launch.
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
 * All parcours — only 1ere-tc is available for MVP
 */
export const PARCOURS_LIST: ParcoursConfig[] = [
  {
    slug: '3eme-math',
    label: '3ème Maths',
    level: '3eme',
    section: 'math',
    description: 'Programme de mathématiques pour la 3ème année',
    order: 1,
    available: false,
  },
  {
    slug: '2nde-math',
    label: '2nde Maths',
    level: '2nde',
    section: 'math',
    description: 'Programme de mathématiques pour la 2nde année',
    order: 2,
    available: false,
  },
  {
    slug: '1ere-tc',
    label: '1ère TC',
    level: '1ere',
    section: 'tc',
    description: 'Programme de mathématiques pour la 1ère année Tronc Commun',
    order: 3,
    available: true,
  },
  {
    slug: '1ere-math',
    label: '1ère Maths',
    level: '1ere',
    section: 'math',
    description: 'Programme de mathématiques pour la 1ère année section Maths',
    order: 4,
    available: false,
  },
  {
    slug: 'term-math',
    label: 'Terminale Maths',
    level: 'term',
    section: 'math',
    description: 'Programme de mathématiques pour la Terminale',
    order: 5,
    available: false,
  },
]

/**
 * Valid parcours slugs for route matching (only available ones)
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
 * Get available parcours for display (only those with content)
 */
export function getAvailableParcours(): ParcoursConfig[] {
  return PARCOURS_LIST.filter((p) => p.available).sort((a, b) => a.order - b.order)
}

/**
 * Get all parcours sorted by order (including unavailable)
 */
export function getAllParcours(): ParcoursConfig[] {
  return [...PARCOURS_LIST].sort((a, b) => a.order - b.order)
}
