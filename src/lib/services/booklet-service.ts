/**
 * Booklet Service — Firestore operations for booklet pairing.
 *
 * Manages users/{uid}/booklets/{code} subcollection.
 * Client-side only.
 */

import {
  collection,
  doc,
  getDocs,
  setDoc,
  serverTimestamp,
} from 'firebase/firestore'

import { getDbInstance } from '@/lib/firebase/client'
import type { UserBooklet } from '@/types/booklet'

/**
 * Pair a booklet with the current user.
 * Creates or updates the document at users/{uid}/booklets/{code}.
 */
export async function pairBooklet(
  userId: string,
  booklet: { code: string; livretSlug: string; programmeId: string },
): Promise<void> {
  const db = getDbInstance()
  const ref = doc(db, 'users', userId, 'booklets', booklet.code)

  await setDoc(ref, {
    code: booklet.code,
    livretSlug: booklet.livretSlug,
    programmeId: booklet.programmeId,
    pairedAt: serverTimestamp(),
    lastOpenedAt: serverTimestamp(),
  }, { merge: true })
}

/**
 * Get all booklets paired by a user.
 */
export async function getUserBooklets(userId: string): Promise<UserBooklet[]> {
  const db = getDbInstance()
  const colRef = collection(db, 'users', userId, 'booklets')
  const snapshot = await getDocs(colRef)

  return snapshot.docs.map((d) => {
    const data = d.data()
    return {
      code: d.id,
      livretSlug: (data.livretSlug ?? data.moduleSlug) as string,
      programmeId: data.programmeId as string,
      pairedAt: toISOString(data.pairedAt),
      lastOpenedAt: toISOString(data.lastOpenedAt),
    }
  })
}


// ── Helpers ────────────────────────────────────────────────────────────────

function toISOString(value: unknown): string {
  if (value && typeof value === 'object' && 'toDate' in value) {
    return (value as { toDate: () => Date }).toDate().toISOString()
  }
  if (typeof value === 'string') return value
  return new Date().toISOString()
}
