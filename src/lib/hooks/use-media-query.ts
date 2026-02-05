'use client'

/**
 * Hook for responsive breakpoints
 */

import * as React from 'react'

/**
 * Subscribe to a media query and return whether it matches
 *
 * @example
 * ```tsx
 * const isMobile = useMediaQuery('(max-width: 768px)')
 * const prefersDark = useMediaQuery('(prefers-color-scheme: dark)')
 * ```
 */
export function useMediaQuery(query: string): boolean {
  const [matches, setMatches] = React.useState(false)

  React.useEffect(() => {
    const mediaQuery = window.matchMedia(query)

    // Set initial value
    setMatches(mediaQuery.matches)

    // Listen for changes
    const handler = (event: MediaQueryListEvent) => {
      setMatches(event.matches)
    }

    mediaQuery.addEventListener('change', handler)
    return () => mediaQuery.removeEventListener('change', handler)
  }, [query])

  return matches
}

// =============================================================================
// Convenience hooks for common breakpoints
// =============================================================================

/** Mobile: < 640px */
export function useIsMobile(): boolean {
  return useMediaQuery('(max-width: 639px)')
}

/** Tablet: 640px - 1023px */
export function useIsTablet(): boolean {
  return useMediaQuery('(min-width: 640px) and (max-width: 1023px)')
}

/** Desktop: >= 1024px */
export function useIsDesktop(): boolean {
  return useMediaQuery('(min-width: 1024px)')
}

/** Prefers dark color scheme */
export function usePrefersDarkMode(): boolean {
  return useMediaQuery('(prefers-color-scheme: dark)')
}

/** Prefers reduced motion */
export function usePrefersReducedMotion(): boolean {
  return useMediaQuery('(prefers-reduced-motion: reduce)')
}
