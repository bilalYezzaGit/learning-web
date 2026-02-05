/**
 * Firebase Configuration
 *
 * Reads Firebase config from environment variables.
 * All variables are prefixed with NEXT_PUBLIC_ to be available client-side.
 *
 * Setup:
 * 1. Copy .env.example to .env.local
 * 2. Fill in your Firebase project values from firebase_options.dart or Firebase console
 */

// Lazy config - only evaluated when getFirebaseConfig() is called
let _config: ReturnType<typeof buildConfig> | null = null

function buildConfig() {
  return {
    apiKey: process.env.NEXT_PUBLIC_FIREBASE_API_KEY ?? '',
    authDomain: process.env.NEXT_PUBLIC_FIREBASE_AUTH_DOMAIN ?? '',
    projectId: process.env.NEXT_PUBLIC_FIREBASE_PROJECT_ID ?? '',
    storageBucket: process.env.NEXT_PUBLIC_FIREBASE_STORAGE_BUCKET ?? '',
    messagingSenderId: process.env.NEXT_PUBLIC_FIREBASE_MESSAGING_SENDER_ID ?? '',
    appId: process.env.NEXT_PUBLIC_FIREBASE_APP_ID ?? '',
    measurementId: process.env.NEXT_PUBLIC_FIREBASE_MEASUREMENT_ID ?? '',
  }
}

/**
 * Get Firebase configuration (lazy loaded)
 */
export function getFirebaseConfig() {
  if (!_config) {
    _config = buildConfig()
  }

  // Validate in browser only
  if (typeof window !== 'undefined' && !_config.apiKey) {
    console.error(
      'Firebase not configured. Make sure .env.local has NEXT_PUBLIC_FIREBASE_* variables.'
    )
  }

  return _config
}

/**
 * Check if Firebase is properly configured
 */
export function isFirebaseConfigured(): boolean {
  const config = getFirebaseConfig()
  return Boolean(config.apiKey && config.projectId)
}

// For backwards compatibility - but prefer using getFirebaseConfig()
export const firebaseConfig = {
  get apiKey() { return getFirebaseConfig().apiKey },
  get authDomain() { return getFirebaseConfig().authDomain },
  get projectId() { return getFirebaseConfig().projectId },
  get storageBucket() { return getFirebaseConfig().storageBucket },
  get messagingSenderId() { return getFirebaseConfig().messagingSenderId },
  get appId() { return getFirebaseConfig().appId },
  get measurementId() { return getFirebaseConfig().measurementId },
}
