/**
 * Content types — used by the app to consume pre-compiled content
 *
 * Raw atom/molecule types live in the pipeline (tools/pipeline/src/types.ts).
 * This file only contains types needed at runtime by the web app.
 */

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
  visible: boolean
  description?: string
  /** Ordered list of cours molecule slugs */
  cours: string[]
  /** Ordered list of series molecule slugs */
  series: string[]
}

// =============================================================================
// Resolved types (for pages)
// =============================================================================

/** Flat activity entry in a resolved molecule (for navigation) */
export interface ResolvedActivity {
  id: string
  type: 'lesson' | 'exercise' | 'qcm' | 'resume'
  title: string
  timeMinutes: number
  sectionId?: string
  /** For quiz groups, the list of QCM atom IDs */
  quizAtomIds?: string[]
}

/** Compiled QCM question — pre-compiled HTML strings */
export interface CompiledQCMQuestion {
  id: string
  title: string
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
