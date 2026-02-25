/** Raw atom read from MDX file (frontmatter + raw content) */
export interface RawAtom {
  id: string
  type: 'lesson' | 'exercise' | 'qcm'
  title: string
  difficulty: number
  timeMinutes: number
  tags: string[]
  category?: string
  correctOption?: number
  rawContent: string
}

/** Raw cours molecule from YAML */
export interface RawCours {
  slug: string
  title: string
  description: string
  programme: string
  trimester: string
  order: number
  estimatedMinutes: number
  objectives: string[]
  sections: { label: string; steps: RawStep[] }[]
}

/** Raw series molecule from YAML */
export interface RawSerie {
  slug: string
  title: string
  description: string
  difficulty: number
  estimatedMinutes: number
  tags: string[]
  steps: RawStep[]
  type: string
  trimestre: number
  modules: string[]
  priority: number
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
  cours: string[]
  series: string[]
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
  sectionId?: string
  quizAtomIds?: string[]
}

/** Resolved cours JSON */
export interface ResolvedCours {
  slug: string
  title: string
  description: string
  programme: string
  trimester: string
  order: number
  estimatedMinutes: number
  objectives: string[]
  sections: {
    id: string
    label: string
    activities: ResolvedActivity[]
  }[]
  totalActivities: number
}

/** Resolved serie JSON */
export interface ResolvedSerie {
  slug: string
  title: string
  description: string
  difficulty: number
  estimatedMinutes: number
  tags: string[]
  type: string
  trimestre: number
  modules: string[]
  priority: number
  activities: ResolvedActivity[]
  totalActivities: number
  successThreshold: number
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
  modules: {
    slug: string
    title: string
    trimester: string
    order: number
    totalActivities: number
    estimatedMinutes: number
    activityIds: string[]
  }[]
  series: {
    slug: string
    title: string
    difficulty: number
    type: string
    trimestre: number
    totalActivities: number
    estimatedMinutes: number
    modules: string[]
  }[]
}

export interface ValidationError {
  source: string
  message: string
  severity: 'error' | 'warning'
}
