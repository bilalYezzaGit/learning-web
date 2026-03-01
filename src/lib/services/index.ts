/**
 * Services barrel export
 */

export {
  subscribeToAuthState,
  signInWithEmail,
  createAccount,
  resetPassword,
  signOut,
  type AuthStateListener,
} from './auth-service'

export { getUserParcoursSlug, saveUserParcours, sendVerificationEmail } from './user-service'

export { logError } from './error-logger'

export { getLocalProgress, setLocalActivityComplete } from './local-progress'

export {
  trackSerieStarted,
  trackQcmCompleted,
  trackExerciseCompleted,
  trackScanUploaded,
  trackParcoursSelected,
} from './analytics-service'

export { analyzeScan, ScanError, type ScanResult } from './scan-service'
