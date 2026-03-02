/**
 * Booklet types — data model for the paper-first experience.
 *
 * A Booklet represents a physical printed booklet that a user pairs
 * with the app via QR code. The app then provides summaries, corrections,
 * and QCM sessions tied to that booklet's content.
 */

/**
 * Booklet definition — derived from a cours molecule.
 * Not stored in DB; computed from the content pipeline output.
 */
export interface BookletDefinition {
  /** Short pairing code (e.g. "CONT-3M-001") */
  code: string
  /** Cours molecule slug (e.g. "continuite") */
  moduleSlug: string
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
  moduleSlug: string
  programmeId: string
  lastOpenedAt: string
}

/**
 * QR code pairing payload — encoded in the QR code URL.
 * URL format: https://www.aylansolutions.com/app/scan?code=CONT-3M-001
 */
export interface PairingPayload {
  code: string
  moduleSlug: string
  programmeId: string
  version: number
}

/**
 * Quick QCM session configuration.
 */
export interface QcmSessionConfig {
  /** Module to draw questions from (or "all" for mixed) */
  moduleSlug: string | 'all'
  /** Number of questions */
  questionCount: 5 | 10 | 20
  /** Time limit in minutes (0 = no limit) */
  timeLimitMinutes: number
}

/**
 * Generate a booklet code from module + programme.
 */
export function generateBookletCode(moduleSlug: string, programmeId: string): string {
  const modulePrefix = moduleSlug.slice(0, 4).toUpperCase()
  const programmePrefix = programmeId.replace(/-/g, '').slice(0, 2).toUpperCase()
  return `${modulePrefix}-${programmePrefix}-001`
}
