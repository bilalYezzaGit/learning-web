/**
 * Firebase Client — Auth only
 *
 * Initializes Firebase app and exports Auth instance.
 * Uses lazy initialization to avoid issues with SSR.
 */

import { initializeApp, getApps, type FirebaseApp } from 'firebase/app'
import { getAuth, type Auth } from 'firebase/auth'
import { getAnalytics, isSupported, type Analytics } from 'firebase/analytics'

import { getFirebaseConfig } from './config'

// Initialize Firebase app (singleton)
function getApp(): FirebaseApp {
  const existingApps = getApps()
  if (existingApps.length > 0) {
    return existingApps[0]!
  }
  return initializeApp(getFirebaseConfig())
}

// Lazy-initialized instances
let _auth: Auth | null = null
let _analytics: Analytics | null = null

/**
 * Firebase Authentication instance
 */
export function getAuthInstance(): Auth {
  if (!_auth) {
    _auth = getAuth(getApp())
  }
  return _auth
}

/**
 * Firebase Analytics instance (browser only)
 * Returns null if analytics is not supported (SSR, privacy blockers)
 */
export async function getAnalyticsInstance(): Promise<Analytics | null> {
  if (_analytics) return _analytics

  const supported = await isSupported()
  if (!supported) return null

  _analytics = getAnalytics(getApp())
  return _analytics
}
