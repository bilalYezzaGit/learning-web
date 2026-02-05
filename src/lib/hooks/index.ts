/**
 * Hooks barrel export
 */

// Data hooks
export { useProgrammes } from './use-programmes'
export { useModule } from './use-module'
export { useProgress } from './use-progress'
export { useAuth } from './use-auth'

// Utility hooks
export {
  useMediaQuery,
  useIsMobile,
  useIsTablet,
  useIsDesktop,
  usePrefersDarkMode,
  usePrefersReducedMotion,
} from './use-media-query'

export { useLocalStorage } from './use-local-storage'
