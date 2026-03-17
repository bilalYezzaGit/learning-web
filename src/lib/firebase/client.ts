/**
 * Firebase Client — Auth only
 *
 * Initializes Firebase app and exports Auth instance.
 * Uses lazy initialization to avoid issues with SSR.
 */

import { initializeApp, getApps, type FirebaseApp } from 'firebase/app'
import { getAuth, type Auth } from 'firebase/auth'

import { getFirebaseConfig } from './config'

// Initialize Firebase app (singleton)
function getApp(): FirebaseApp {
  const existingApps = getApps()
  if (existingApps.length > 0) {
    return existingApps[0]!
  }
  return initializeApp(getFirebaseConfig())
}

let _auth: Auth | null = null

/**
 * Firebase Authentication instance
 */
export function getAuthInstance(): Auth {
  if (!_auth) {
    _auth = getAuth(getApp())
  }
  return _auth
}
