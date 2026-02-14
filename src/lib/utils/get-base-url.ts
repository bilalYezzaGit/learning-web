/**
 * Get the base URL of the application.
 *
 * Uses Next.js headers() to detect the host in server components.
 * Falls back to localhost:3000 in development.
 */

import { headers } from 'next/headers'

export async function getBaseUrl(): Promise<string> {
  const headersList = await headers()
  const host = headersList.get('host') ?? 'localhost:3000'
  const proto = headersList.get('x-forwarded-proto') ?? 'http'
  return `${proto}://${host}`
}
