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

// =============================================================================
// OnboardingState
// =============================================================================

/** Total number of onboarding steps */
export const ONBOARDING_TOTAL_STEPS = 4

/**
 * Onboarding state
 *
 * Steps:
 * - Step 0: Email signup
 * - Step 1: Level selection
 * - Step 2: Section selection
 * - Step 3: Welcome
 */
export interface OnboardingState {
  /** Current step (0-based) */
  currentStep: number
  /** First name entered (step 0) */
  firstName?: string
  /** Selected level (step 1) */
  selectedLevelSlug?: string
  selectedLevelName?: string
  /** Selected section (step 2) */
  selectedSectionSlug?: string
  selectedSectionName?: string
  /** Programme ID (derived from level + section) */
  programmeId?: string
}

// =============================================================================
// Helpers
// =============================================================================

/** Create initial onboarding state */
export function initialOnboardingState(): OnboardingState {
  return {
    currentStep: 0,
  }
}

/** Check if user has a first name */
export function hasFirstName(profile: UserProfile): boolean {
  return !!profile.firstName && profile.firstName.length > 0
}

/** Get display name (first name or default) */
export function getDisplayName(profile: UserProfile): string {
  return hasFirstName(profile) ? profile.firstName! : 'Utilisateur'
}

/** Check if onboarding can proceed to next step */
export function canProceed(state: OnboardingState): boolean {
  switch (state.currentStep) {
    case 0:
      // Email signup handled externally
      return true
    case 1:
      return !!state.selectedLevelSlug
    case 2:
      return !!state.selectedSectionSlug && !!state.programmeId
    case 3:
      return isOnboardingComplete(state)
    default:
      return false
  }
}

/** Check if onboarding is complete */
export function isOnboardingComplete(state: OnboardingState): boolean {
  return (
    !!state.selectedLevelSlug &&
    !!state.selectedSectionSlug &&
    !!state.programmeId
  )
}

/** Get onboarding progress (0.0 - 1.0) */
export function getOnboardingProgress(state: OnboardingState): number {
  return (state.currentStep + 1) / ONBOARDING_TOTAL_STEPS
}

/** Get current step label */
export function getStepLabel(step: number): string {
  switch (step) {
    case 0:
      return 'Compte'
    case 1:
      return 'Niveau'
    case 2:
      return 'Section'
    case 3:
      return 'Bienvenue'
    default:
      return ''
  }
}
