/**
 * Exercise QR Redirect — lightweight route for QR code scanning.
 *
 * QR codes encode:
 *   /app/ex?b=CONTINUITE3E001&e=ex-continuite-1          → exercise page
 *   /app/ex?b=CONTINUITE3E001&e=qcm-der-xxx&mode=quiz    → QCM player (group session)
 *
 * This page reconstitutes the booklet code and redirects to the
 * appropriate page based on the mode parameter.
 */

import { redirect, notFound } from 'next/navigation'

import { getAllBooklets } from '@/lib/booklet'

interface PageProps {
  searchParams: Promise<{ b?: string; e?: string; mode?: string }>
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
  const { b, e, mode } = await searchParams

  if (!b || !e) {
    notFound()
  }

  const booklet = findBookletByCompactCode(b)
  if (!booklet) {
    notFound()
  }

  // QCM group mode — redirect to QCM player with the specific group
  if (mode === 'quiz') {
    redirect(`/app/mes-livrets/${booklet.code}/qcm?group=${e}`)
  }

  redirect(`/app/mes-livrets/${booklet.code}/exercice/${e}`)
}
