/**
 * Booklet Validation API Route
 *
 * Validates a booklet code against the content pipeline.
 * Returns the booklet definition if valid, 404 otherwise.
 *
 * GET /api/booklet/validate?code=CONT-3M-001
 */

import { NextResponse } from 'next/server'
import { headers } from 'next/headers'
import { getBookletByCode } from '@/lib/booklet'

// Best-effort in-memory rate limiter: max 10 requests per IP per minute.
const MAX_RATE_ENTRIES = 10_000
const rateMap = new Map<string, { count: number; resetAt: number }>()
const RATE_LIMIT = 10
const RATE_WINDOW_MS = 60_000

function checkRateLimit(ip: string): boolean {
  const now = Date.now()
  const entry = rateMap.get(ip)

  if (!entry || now > entry.resetAt) {
    if (rateMap.size > MAX_RATE_ENTRIES) {
      for (const [key, val] of rateMap) {
        if (now > val.resetAt) rateMap.delete(key)
      }
    }
    rateMap.set(ip, { count: 1, resetAt: now + RATE_WINDOW_MS })
    return true
  }

  if (entry.count >= RATE_LIMIT) {
    return false
  }

  entry.count++
  return true
}

export async function GET(request: Request) {
  const headersList = await headers()
  const ip = headersList.get('x-forwarded-for')?.split(',')[0]?.trim() ?? 'unknown'
  if (!checkRateLimit(ip)) {
    return NextResponse.json({ error: 'Trop de requêtes' }, { status: 429 })
  }

  const { searchParams } = new URL(request.url)
  const code = searchParams.get('code')?.toUpperCase().trim()

  if (!code) {
    return NextResponse.json({ error: 'Code manquant' }, { status: 400 })
  }

  const booklet = getBookletByCode(code)

  if (!booklet) {
    return NextResponse.json({ error: 'Code invalide' }, { status: 404 })
  }

  return NextResponse.json({
    code: booklet.code,
    moduleSlug: booklet.moduleSlug,
    programmeId: booklet.programmeId,
    title: booklet.title,
  })
}
