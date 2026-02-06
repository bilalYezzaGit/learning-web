'use client'

/**
 * Auth Context Provider
 *
 * Provides Firebase Auth state globally to avoid multiple subscriptions.
 * Wrap your app with this provider to access auth state anywhere via useAuth().
 */

import * as React from 'react'
import { type User } from 'firebase/auth'
import {
  subscribeToAuthState,
  signOut as authSignOut,
  signInWithEmail,
  createAccount,
} from '@/lib/services'

// =============================================================================
// Types
// =============================================================================

interface AuthContextValue {
  user: User | null
  userId: string | null
  isLoading: boolean
  isAuthenticated: boolean
  signIn: (email: string, password: string) => Promise<User>
  signUp: (email: string, password: string) => Promise<User>
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

  const signIn = React.useCallback(async (email: string, password: string) => {
    return signInWithEmail(email, password)
  }, [])

  const signUp = React.useCallback(async (email: string, password: string) => {
    return createAccount(email, password)
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
      signIn,
      signUp,
      signOut,
    }),
    [user, isLoading, signIn, signUp, signOut]
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
