/**
 * React Query Keys
 *
 * Centralized query keys for cache management.
 * Using factory pattern for type-safe, composable keys.
 *
 * @see https://tanstack.com/query/latest/docs/react/guides/query-keys
 */

export const queryKeys = {
  // ==========================================================================
  // Progress
  // ==========================================================================

  progress: {
    all: ['progress'] as const,
    user: (userId: string) => [...queryKeys.progress.all, userId] as const,
    activity: (userId: string, activityId: string) =>
      [...queryKeys.progress.user(userId), activityId] as const,
  },

  // ==========================================================================
  // User
  // ==========================================================================

  user: {
    all: ['user'] as const,
    profile: (userId: string) => [...queryKeys.user.all, 'profile', userId] as const,
    preferences: (userId: string) =>
      [...queryKeys.user.all, 'preferences', userId] as const,
  },

  // ==========================================================================
  // Auth
  // ==========================================================================

  auth: {
    all: ['auth'] as const,
    session: () => [...queryKeys.auth.all, 'session'] as const,
  },
} as const

// Type helper for query key extraction
export type QueryKeys = typeof queryKeys
