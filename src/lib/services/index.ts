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

export { logError } from './error-logger'

export { getLocalProgress, setLocalActivityComplete } from './local-progress'

export { analyzeScan, ScanError, type ScanResult } from './scan-service'
