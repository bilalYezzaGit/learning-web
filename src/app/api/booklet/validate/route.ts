/**
 * Booklet Validation API Route
 *
 * Validates a booklet code against the content pipeline.
 * Returns the booklet definition if valid, 404 otherwise.
 *
 * GET /api/booklet/validate?code=CONT-3M-001
 */

import { NextResponse } from 'next/server'
import { getBookletByCode } from '@/lib/booklet'

export async function GET(request: Request) {
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
