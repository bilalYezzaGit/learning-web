/**
 * Content types — used by the app to consume pre-compiled content
 *
 * Raw atom/molecule types live in the pipeline (tools/pipeline/src/types.ts).
 * This file only contains types needed at runtime by the web app.
 */

// =============================================================================
// Core enums
// =============================================================================

/** Activity types */
export type AtomType = 'lesson' | 'exercise' | 'qcm'

/** Series type */
export type SeriesType = 'mono-module' | 'cross-module' | 'devoir-controle' | 'devoir-synthese'

/** Trimestre */
export type Trimestre = 1 | 2 | 3

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

/** Get atom type label in French */
export function getAtomTypeLabel(type: AtomType): string {
  switch (type) {
    case 'exercise': return 'Exercice'
    case 'qcm': return 'QCM'
    case 'lesson': return 'Cours'
  }
}
