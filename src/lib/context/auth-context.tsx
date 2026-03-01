'use client'

/**
 * Auth Hook
 *
 * Module-level singleton for Firebase Auth state.
 * Uses useSyncExternalStore — no Context or Provider needed.
 */

import { useSyncExternalStore } from 'react'
import { type User } from 'firebase/auth'
import {
  subscribeToAuthState,
  signOut as authSignOut,
  signInWithEmail,
  createAccount,
} from '@/lib/services'

// ── Module-level singleton ──────────────────────────────────────────────────

interface AuthSnapshot {
  user: User | null
  isLoading: boolean
}

let snapshot: AuthSnapshot = { user: null, isLoading: true }
const listeners = new Set<() => void>()
let initialized = false

function init() {
  if (initialized) return
  initialized = true
  subscribeToAuthState((user) => {
    snapshot = { user, isLoading: false }
    listeners.forEach((l) => l())
  })
}

function subscribe(callback: () => void) {
  init()
  listeners.add(callback)
  return () => {
    listeners.delete(callback)
  }
}

function getSnapshot() {
  return snapshot
}

// ── Hook ────────────────────────────────────────────────────────────────────

export function useAuth() {
  const { user, isLoading } = useSyncExternalStore(subscribe, getSnapshot, getSnapshot)

  return {
    user,
    userId: user?.uid ?? null,
    isLoading,
    isAuthenticated: user !== null,
    signIn: signInWithEmail,
    signUp: createAccount,
    signOut: authSignOut,
  }
}
