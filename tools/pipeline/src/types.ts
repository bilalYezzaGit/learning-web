/** Raw atom read from MDX file (frontmatter + raw content) */
export interface RawAtom {
  id: string
  type: 'lesson' | 'exercise' | 'qcm'
  title: string
  difficulty: number
  timeMinutes: number
  tags: string[]
  category?: string
  source?: string
  rawContent: string
}

/** Raw livret molecule from YAML */
export interface RawLivret {
  slug: string
  kind: 'livret'
  visible: boolean
  title: string
  description: string
  programme: string
  trimester: string
  order: number
  difficulty?: number
  estimatedMinutes?: number
  tags: string[]
  objectives: string[]
  sections: { label: string; steps: RawStep[] }[]
}

/** Raw programme from YAML */
export interface RawProgramme {
  id: string
  label: string
  levelSlug: string
  sectionSlug: string
  order: number
  color: string
  icon: string
  visible: boolean
  description?: string
  livrets: string[]
}

/** A step: either a string atom ID or a quiz group */
export type RawStep = string | { quiz: string[] }

/** Compiled QCM question (all HTML strings) */
export interface CompiledQcm {
  id: string
  title: string
  enonce: string
  options: string[]
  correctIndex: number
  explication: string
  timeMinutes: number
}

/** Resolved activity in a timeline */
export interface ResolvedActivity {
  id: string
  type: 'lesson' | 'exercise' | 'qcm'
  title: string
  timeMinutes: number
  difficulty: number
  category?: string
  tags: string[]
  sectionId?: string
  quizAtomIds?: string[]
}

/** Resolved livret JSON */
export interface ResolvedLivret {
  slug: string
  title: string
  description: string
  programme: string
  trimester: string
  order: number
  difficulty?: number
  estimatedMinutes: number
  tags: string[]
  objectives: string[]
  visible: boolean
  sections: {
    id: string
    label: string
    activities: ResolvedActivity[]
  }[]
  totalActivities: number
}

/** Catalogue entry for a programme */
export interface Catalogue {
  id: string
  label: string
  levelSlug: string
  sectionSlug: string
  order: number
  color: string
  icon: string
  visible: boolean
  livrets: {
    slug: string
    title: string
    trimester: string
    order: number
    difficulty?: number
    totalActivities: number
    estimatedMinutes: number
    activityIds: string[]
    visible: boolean
  }[]
}

export interface ValidationError {
  source: string
  message: string
  severity: 'error' | 'warning'
}
