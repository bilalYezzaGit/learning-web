/**
 * Booklet types — data model for the paper-first experience.
 *
 * A Booklet represents a physical printed booklet that a user pairs
 * with the app via QR code. The app then provides summaries, corrections,
 * and QCM sessions tied to that booklet's content.
 */

/**
 * Booklet definition — derived from a livret molecule.
 * Not stored in DB; computed from the content pipeline output.
 */
export interface BookletDefinition {
  /** Short pairing code (e.g. "CONT-3M-001") */
  code: string
  /** Livret molecule slug (e.g. "continuite") */
  livretSlug: string
  /** Programme ID (e.g. "3eme-math") */
  programmeId: string
  /** Display title */
  title: string
  /** Description */
  description: string
  /** Booklet revision version */
  version: number
  /** Number of exercises in the booklet */
  exerciseCount: number
  /** Number of QCM questions */
  qcmCount: number
  /** Number of lessons */
  lessonCount: number
  /** Total estimated time in minutes */
  estimatedMinutes: number
}

/**
 * User's paired booklet — stored in Firestore (users/{uid}/booklets/{code}).
 */
export interface UserBooklet {
  code: string
  pairedAt: string
  livretSlug: string
  programmeId: string
  lastOpenedAt: string
}


/**
 * Generate a booklet code from livret slug + programme.
 *
 * Uses full slug (with hyphens removed) to avoid collisions between
 * variants like "continuite" vs "continuite-manuel-complet".
 *
 * Examples:
 *   continuite + 3eme-math           → CONTINUITE-3E-001
 *   continuite-manuel-complet + 3eme-math → CONTINUITEMANUELCOMPLET-3E-001
 *   derivation + 3eme-math           → DERIVATION-3E-001
 *   fonctions + 3eme-math            → FONCTIONS-3E-001
 */
export function generateBookletCode(livretSlug: string, programmeId: string): string {
  const livretPrefix = livretSlug.replace(/-/g, '').toUpperCase()
  const programmePrefix = programmeId.replace(/-/g, '').slice(0, 2).toUpperCase()
  return `${livretPrefix}-${programmePrefix}-001`
}
