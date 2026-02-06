/**
 * Services barrel export
 */

export {
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
  subscribeToAuthState,
  signInWithEmail,
  createAccount,
  signOut,
  type AuthStateListener,
} from './auth-service'
