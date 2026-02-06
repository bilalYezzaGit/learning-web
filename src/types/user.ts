/**
 * User-related types
 *
 * UserProfile, OnboardingState
 * Mapped from Flutter lib/core/models/
 */

// =============================================================================
// UserProfile
// =============================================================================

/**
 * User profile stored in Firestore
 *
 * Firestore path: users/{uid}
 */
export interface UserProfile {
  /** User's first name (optional) */
  firstName?: string
  /** Profile creation date */
  createdAt: string
  /** Last update date */
  updatedAt?: string
  /** Selected level slug */
  levelSlug?: string
  /** Selected section slug */
  sectionSlug?: string
  /** Selected programme ID */
  programmeId?: string
}


