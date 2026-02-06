/**
 * Auth Service
 *
 * Firebase Authentication wrapper.
 * Client-side only.
 */

import {
  signInAnonymously,
  signInWithEmailAndPassword,
  createUserWithEmailAndPassword,
  sendPasswordResetEmail,
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
 * Get current user (synchronous, may be null)
 */
export function getCurrentUser(): User | null {
  const auth = getAuthInstance()
  return auth.currentUser
}

/**
 * Subscribe to auth state changes
 */
export function subscribeToAuthState(listener: AuthStateListener): Unsubscribe {
  const auth = getAuthInstance()
  return onAuthStateChanged(auth, listener)
}

/**
 * Sign in anonymously
 */
export async function signInAnonymouslyFn(): Promise<User> {
  const auth = getAuthInstance()
  const result = await signInAnonymously(auth)
  return result.user
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
 * Sign out
 */
export async function signOut(): Promise<void> {
  const auth = getAuthInstance()
  await firebaseSignOut(auth)
}

/**
 * Send password reset email
 */
export async function resetPassword(email: string): Promise<void> {
  const auth = getAuthInstance()
  await sendPasswordResetEmail(auth, email)
}

/**
 * Check if user is authenticated
 */
export function isAuthenticated(): boolean {
  return getCurrentUser() !== null
}

/**
 * Get current user ID (throws if not authenticated)
 */
export function getUserId(): string {
  const user = getCurrentUser()
  if (!user) {
    throw new Error('User not authenticated')
  }
  return user.uid
}

