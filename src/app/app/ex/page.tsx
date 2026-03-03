/**
 * Exercise QR Redirect — lightweight route for QR code scanning.
 *
 * QR codes encode: /app/ex?b=CONTINUITE3E001&e=ex-continuite-1
 * This page reconstitutes the booklet code and redirects to the
 * full exercise page at /app/mes-livrets/[code]/exercice/[exerciseId].
 */

import { redirect, notFound } from 'next/navigation'

import { getAllBooklets } from '@/lib/booklet'

interface PageProps {
  searchParams: Promise<{ b?: string; e?: string }>
}

/**
 * Find a booklet by its compact code (hyphens removed).
 */
function findBookletByCompactCode(compact: string) {
  const normalized = compact.toUpperCase().replace(/-/g, '')
  return getAllBooklets().find(
    (b) => b.code.replace(/-/g, '') === normalized,
  )
}

export default async function ExerciseRedirectPage({ searchParams }: PageProps) {
  const { b, e } = await searchParams

  if (!b || !e) {
    notFound()
  }

  const booklet = findBookletByCompactCode(b)
  if (!booklet) {
    notFound()
  }

  redirect(`/app/mes-livrets/${booklet.code}/exercice/${e}`)
}
