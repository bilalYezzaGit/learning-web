/**
 * Preferences Store
 *
 * User preferences persisted to localStorage.
 * Includes level/section selection from onboarding.
 */

import { create } from 'zustand'
import { persist } from 'zustand/middleware'

// =============================================================================
// Types
// =============================================================================

interface PreferencesState {
  // Onboarding selections
  selectedLevelSlug: string | null
  selectedLevelName: string | null
  selectedSectionSlug: string | null
  selectedSectionName: string | null
  programmeId: string | null

  // User info
  firstName: string | null

  // Onboarding completed
  onboardingCompleted: boolean

  // Actions
  setLevel: (slug: string, name: string) => void
  setSection: (slug: string, name: string, programmeId: string) => void
  setFirstName: (name: string) => void
  completeOnboarding: () => void
  reset: () => void
}

// =============================================================================
// Initial state
// =============================================================================

const initialState = {
  selectedLevelSlug: null,
  selectedLevelName: null,
  selectedSectionSlug: null,
  selectedSectionName: null,
  programmeId: null,
  firstName: null,
  onboardingCompleted: false,
}

// =============================================================================
// Store
// =============================================================================

export const usePreferencesStore = create<PreferencesState>()(
  persist(
    (set) => ({
      ...initialState,

      setLevel: (slug, name) =>
        set({
          selectedLevelSlug: slug,
          selectedLevelName: name,
          // Reset section when level changes
          selectedSectionSlug: null,
          selectedSectionName: null,
          programmeId: null,
        }),

      setSection: (slug, name, programmeId) =>
        set({
          selectedSectionSlug: slug,
          selectedSectionName: name,
          programmeId,
        }),

      setFirstName: (name) => set({ firstName: name }),

      completeOnboarding: () => set({ onboardingCompleted: true }),

      reset: () => set(initialState),
    }),
    {
      name: 'learning-app-preferences',
    }
  )
)

// =============================================================================
// Convenience selectors
// =============================================================================

export const useProgrammeId = () =>
  usePreferencesStore((state) => state.programmeId)

export const useSelectedLevel = () =>
  usePreferencesStore((state) => ({
    slug: state.selectedLevelSlug,
    name: state.selectedLevelName,
  }))

export const useSelectedSection = () =>
  usePreferencesStore((state) => ({
    slug: state.selectedSectionSlug,
    name: state.selectedSectionName,
  }))

export const useOnboardingCompleted = () =>
  usePreferencesStore((state) => state.onboardingCompleted)
