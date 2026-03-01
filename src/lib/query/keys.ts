/**
 * React Query Keys
 *
 * Centralized query keys for cache management.
 *
 * @see https://tanstack.com/query/latest/docs/react/guides/query-keys
 */

export const queryKeys = {
  progress: {
    all: ['progress'] as const,
    user: (userId: string) => ['progress', userId] as const,
  },
} as const
