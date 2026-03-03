import { NextResponse } from 'next/server'
import type { NextRequest } from 'next/server'

/**
 * Known routes that should pass through.
 * Everything else gets redirected to home.
 */
const KNOWN_PREFIXES = [
  '/',          // landing
  '/login',
  '/signup',
  '/reset-password',
  '/terms',
  '/privacy',
  '/viewer',
  '/app',       // paper-first app
  '/_next',
  '/api',
  '/icons',
]

function isKnownRoute(pathname: string): boolean {
  // Exact root match
  if (pathname === '/') return true

  // Prefix match for known routes
  for (const prefix of KNOWN_PREFIXES) {
    if (prefix !== '/' && (pathname === prefix || pathname.startsWith(prefix + '/'))) {
      return true
    }
  }

  // Static files (favicon.ico, manifest.json, etc.)
  if (pathname.includes('.')) return true

  return false
}

export function middleware(request: NextRequest) {
  const pathname = request.nextUrl.pathname

  if (isKnownRoute(pathname)) {
    return NextResponse.next()
  }

  // Unknown route — redirect to home
  return NextResponse.redirect(new URL('/', request.url))
}

export const config = {
  matcher: [
    '/((?!_next/static|_next/image|favicon.ico|icons|manifest.json).*)',
  ],
}
