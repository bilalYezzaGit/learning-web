/**
 * Parcours Configuration
 *
 * Single source of truth for all parcours (user journeys).
 *
 * - `visible`: shown on landing page, signup, etc. (even if not yet active = "coming soon")
 * - `active`: routes work, content is navigable, users can select it
 */

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

export const PARCOURS_LIST: ParcoursConfig[] = [
  {
    slug: '3eme-math',
    label: '3eme Maths',
    level: '3eme',
    section: 'math',
    description: 'Programme de mathematiques pour la 3eme annee',
    order: 1,
    visible: true,
    active: false,
  },
  {
    slug: '2nde-math',
    label: '2nde Maths',
    level: '2nde',
    section: 'math',
    description: 'Programme de mathematiques pour la 2nde annee',
    order: 2,
    visible: true,
    active: false,
  },
  {
    slug: '1ere-tc',
    label: '1ere TC',
    level: '1ere',
    section: 'tc',
    description: 'Programme de mathematiques pour la 1ere annee Tronc Commun',
    order: 3,
    visible: true,
    active: true,
  },
  {
    slug: '1ere-math',
    label: '1ere Maths',
    level: '1ere',
    section: 'math',
    description: 'Programme de mathematiques pour la 1ere annee section Maths',
    order: 4,
    visible: true,
    active: false,
  },
  {
    slug: 'term-math',
    label: 'Terminale Maths',
    level: 'term',
    section: 'math',
    description: 'Programme de mathematiques pour la Terminale',
    order: 5,
    visible: true,
    active: false,
  },
]

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
