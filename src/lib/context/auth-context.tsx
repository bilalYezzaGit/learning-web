'use client'

/**
 * Auth Context Provider
 *
 * Provides Firebase Auth state globally to avoid multiple subscriptions.
 * Wrap your app with this provider to access auth state anywhere via useAuth().
 */

import * as React from 'react'
import { type User } from 'firebase/auth'
import { subscribeToAuthState, signInAnonymouslyFn, signOut as authSignOut } from '@/lib/services'

// =============================================================================
// Types
// =============================================================================

interface AuthContextValue {
  user: User | null
  userId: string | null
  isLoading: boolean
  isAuthenticated: boolean
  isAnonymous: boolean
  signInAnonymously: () => Promise<void>
  signOut: () => Promise<void>
}

// =============================================================================
// Context
// =============================================================================

const AuthContext = React.createContext<AuthContextValue | null>(null)

// =============================================================================
// Provider
// =============================================================================

export function AuthProvider({ children }: { children: React.ReactNode }) {
  const [user, setUser] = React.useState<User | null>(null)
  const [isLoading, setIsLoading] = React.useState(true)

  React.useEffect(() => {
    const unsubscribe = subscribeToAuthState((newUser) => {
      setUser(newUser)
      setIsLoading(false)
    })

    return () => unsubscribe()
  }, [])

  const signInAnonymously = React.useCallback(async () => {
    await signInAnonymouslyFn()
  }, [])

  const signOut = React.useCallback(async () => {
    await authSignOut()
  }, [])

  const value = React.useMemo<AuthContextValue>(
    () => ({
      user,
      userId: user?.uid ?? null,
      isLoading,
      isAuthenticated: user !== null,
      isAnonymous: user?.isAnonymous ?? false,
      signInAnonymously,
      signOut,
    }),
    [user, isLoading, signInAnonymously, signOut]
  )

  return <AuthContext.Provider value={value}>{children}</AuthContext.Provider>
}

// =============================================================================
// Hook
// =============================================================================

/**
 * Hook for accessing auth state from context
 *
 * Must be used within AuthProvider.
 *
 * @example
 * ```tsx
 * const { userId, isAuthenticated, signOut } = useAuth()
 *
 * if (!isAuthenticated) {
 *   return <LoginPrompt />
 * }
 * ```
 */
export function useAuth(): AuthContextValue {
  const context = React.useContext(AuthContext)
  if (!context) {
    throw new Error('useAuth must be used within AuthProvider')
  }
  return context
}
