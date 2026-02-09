import { NextResponse } from 'next/server'
import type { NextRequest } from 'next/server'
import { ACTIVE_PARCOURS_SLUGS } from '@/lib/parcours/config'

/**
 * Active parcours slugs — only these have working routes
 */
const VALID_PARCOURS = ACTIVE_PARCOURS_SLUGS

/**
 * Global routes that don't require parcours prefix
 */
const GLOBAL_ROUTES = [
  '/',
  '/login',
  '/signup',
  '/reset-password',
  '/parametres',
  '/select-parcours',
  '/terms',
  '/privacy',
]

/**
 * Check if a pathname is a global route
 */
function isGlobalRoute(pathname: string): boolean {
  // Exact match
  if (GLOBAL_ROUTES.includes(pathname)) {
    return true
  }
  // Check for static files and API routes
  if (
    pathname.startsWith('/_next') ||
    pathname.startsWith('/api') ||
    pathname.startsWith('/icons') ||
    pathname.includes('.') // Static files like favicon.ico, manifest.json
  ) {
    return true
  }
  return false
}

export function middleware(request: NextRequest) {
  const pathname = request.nextUrl.pathname

  // Skip global routes
  if (isGlobalRoute(pathname)) {
    return NextResponse.next()
  }

  // Extract potential parcours slug (first segment)
  const segments = pathname.split('/').filter(Boolean)
  const potentialParcours = segments[0]

  // If first segment is a valid parcours, allow the request
  if (potentialParcours && VALID_PARCOURS.includes(potentialParcours)) {
    return NextResponse.next()
  }

  // Invalid parcours slug - redirect to home
  return NextResponse.redirect(new URL('/', request.url))
}

export const config = {
  matcher: [
    /*
     * Match all request paths except:
     * - _next/static (static files)
     * - _next/image (image optimization files)
     * - favicon.ico (favicon file)
     * - public folder
     */
    '/((?!_next/static|_next/image|favicon.ico|icons|manifest.json).*)',
  ],
}
