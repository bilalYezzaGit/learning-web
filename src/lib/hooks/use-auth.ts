'use client'

/**
 * Hook for Firebase Authentication state
 */

import * as React from 'react'
import { type User } from 'firebase/auth'
import {
  subscribeToAuthState,
  signOut as authSignOut,
  signInWithEmail,
  createAccount,
} from '@/lib/services'

interface AuthState {
  user: User | null
  isLoading: boolean
  isAuthenticated: boolean
}

/**
 * Hook for accessing auth state and actions
 *
 * @example
 * ```tsx
 * const { user, isLoading, isAuthenticated, signOut } = useAuth()
 *
 * if (isLoading) return <Spinner />
 * if (!isAuthenticated) return <LoginPage />
 *
 * return <Dashboard user={user} />
 * ```
 */
export function useAuth() {
  const [state, setState] = React.useState<AuthState>({
    user: null,
    isLoading: true,
    isAuthenticated: false,
  })

  React.useEffect(() => {
    const unsubscribe = subscribeToAuthState((user) => {
      setState({
        user,
        isLoading: false,
        isAuthenticated: user !== null,
      })
    })

    return () => unsubscribe()
  }, [])

  const signOut = React.useCallback(async () => {
    await authSignOut()
  }, [])

  const signIn = React.useCallback(async (email: string, password: string) => {
    return signInWithEmail(email, password)
  }, [])

  const signUp = React.useCallback(async (email: string, password: string) => {
    return createAccount(email, password)
  }, [])

  return {
    ...state,
    signOut,
    signIn,
    signUp,
    userId: state.user?.uid ?? null,
  }
}
