/**
 * Auth Service
 *
 * Firebase Authentication wrapper.
 * Client-side only.
 */

import {
  signInWithEmailAndPassword,
  createUserWithEmailAndPassword,
  sendPasswordResetEmail as firebaseSendPasswordResetEmail,
  signOut as firebaseSignOut,
  onAuthStateChanged,
  type User,
  type Unsubscribe,
} from 'firebase/auth'

import { getAuthInstance } from '@/lib/firebase/client'

// =============================================================================
// Types
// =============================================================================

export type AuthStateListener = (user: User | null) => void

// =============================================================================
// Service functions
// =============================================================================

/**
 * Subscribe to auth state changes
 */
export function subscribeToAuthState(listener: AuthStateListener): Unsubscribe {
  const auth = getAuthInstance()
  return onAuthStateChanged(auth, listener)
}

/**
 * Sign in with email and password
 */
export async function signInWithEmail(
  email: string,
  password: string
): Promise<User> {
  const auth = getAuthInstance()
  const result = await signInWithEmailAndPassword(auth, email, password)
  return result.user
}

/**
 * Create account with email and password
 */
export async function createAccount(
  email: string,
  password: string
): Promise<User> {
  const auth = getAuthInstance()
  const result = await createUserWithEmailAndPassword(auth, email, password)
  return result.user
}

/**
 * Send password reset email
 */
export async function resetPassword(email: string): Promise<void> {
  const auth = getAuthInstance()
  await firebaseSendPasswordResetEmail(auth, email)
}

/**
 * Sign out
 */
export async function signOut(): Promise<void> {
  const auth = getAuthInstance()
  await firebaseSignOut(auth)
}


