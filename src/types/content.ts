/**
 * Content types — Atom / Molecule architecture
 *
 * Atoms: individual MDX content units (lesson, exercise, qcm question)
 * Molecules: YAML structures that assemble atoms into ordered views
 */

// =============================================================================
// Atoms
// =============================================================================

/** Activity types */
export type AtomType = 'lesson' | 'exercise' | 'qcm'

/** Exercise category */
export type ExerciseCategory =
  | 'application'
  | 'approfondissement'
  | 'synthese'
  | 'probleme'
  | 'demonstration'

/** Atom frontmatter (metadata only, no MDX content) */
export interface AtomMeta {
  id: string
  type: AtomType
  title: string
  difficulty: number
  timeMinutes: number
  tags: string[]
  /** Exercise-specific */
  category?: ExerciseCategory
  /** QCM-specific: 0-based index of the correct option */
  correctOption?: number
}

/** Full atom with raw MDX content */
export interface Atom extends AtomMeta {
  /** Raw MDX string (body after frontmatter) */
  content: string
}

// =============================================================================
// Molecules
// =============================================================================

/**
 * A step in a molecule.
 * Either an atom ID (string) or a quiz grouping (object with atom IDs).
 */
export type Step = string | { quiz: string[] }

/** A section within a cours molecule */
export interface MoleculeSection {
  label: string
  steps: Step[]
}

/** Cours molecule — timeline of a module */
export interface CoursMolecule {
  slug: string
  title: string
  description: string
  programme: string
  trimester: string
  order: number
  estimatedMinutes: number
  objectives: string[]
  sections: MoleculeSection[]
}

/** Series type */
export type SeriesType = 'mono-module' | 'cross-module' | 'devoir-controle' | 'devoir-synthese'

/** Trimestre */
export type Trimestre = 1 | 2 | 3

/** Series molecule — thematic revision */
export interface SeriesMolecule {
  slug: string
  title: string
  description: string
  difficulty: number
  estimatedMinutes: number
  tags: string[]
  steps: Step[]
  type: SeriesType
  trimestre: Trimestre
  modules: string[]
  priority: number
}

// =============================================================================
// Programmes
// =============================================================================

/** Programme — top-level learning path */
export interface Programme {
  id: string
  label: string
  levelSlug: string
  sectionSlug: string
  order: number
  color: string
  icon: string
  /** Ordered list of cours molecule slugs */
  cours: string[]
  /** Ordered list of series molecule slugs */
  series: string[]
}

// =============================================================================
// Resolved types (for pages + timeline)
// =============================================================================

/** Minimal activity data needed by CourseTimeline */
export interface TimelineActivity {
  id: string
  type: AtomType
  title: string
  timeMinutes: number
  sectionId?: string
}

/** Flat activity entry in a resolved molecule (for navigation) */
export interface ResolvedActivity extends TimelineActivity {
  /** For quiz groups, the list of QCM atom IDs */
  quizAtomIds?: string[]
}

/** Compiled QCM question — pre-compiled HTML strings */
export interface CompiledQCMQuestion {
  id: string
  enonce: string
  options: string[]
  correctIndex: number
  explication?: string
  timeMinutes: number
}

/** Compiled quiz group for QCMPlayer */
export interface CompiledQuiz {
  id: string
  title: string
  questions: CompiledQCMQuestion[]
}

// =============================================================================
// Helpers
// =============================================================================

/** Type guard: is this step a quiz grouping? */
export function isQuizStep(step: Step): step is { quiz: string[] } {
  return typeof step === 'object' && 'quiz' in step
}

/** Extract all atom IDs referenced by a list of steps */
export function extractAtomIds(steps: Step[]): string[] {
  return steps.flatMap(step =>
    isQuizStep(step) ? step.quiz : [step]
  )
}

/** Get atom type label in French */
export function getAtomTypeLabel(type: AtomType): string {
  switch (type) {
    case 'exercise': return 'Exercice'
    case 'qcm': return 'QCM'
    case 'lesson': return 'Cours'
  }
}
