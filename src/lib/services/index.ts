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
