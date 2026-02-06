/**
 * Services barrel export
 */

export {
  contentService,
  fetchProgrammes,
  fetchModule,
  fetchSeriesCatalog,
  fetchSerie,
  ContentError,
  ContentNotFoundError,
  type ProgrammesResponse,
} from './content-service'

export { ProgressService, type ProgressMap, type ProgressListener } from './progress-service'

export {
  getCurrentUser,
  subscribeToAuthState,
  signInWithEmail,
  createAccount,
  signOut,
  isAuthenticated,
  getUserId,
  type AuthStateListener,
} from './auth-service'
