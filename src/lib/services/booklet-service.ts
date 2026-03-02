/**
 * Booklet Service — Firestore operations for booklet pairing.
 *
 * Manages users/{uid}/booklets/{code} subcollection.
 * Client-side only.
 */

import {
  collection,
  doc,
  getDoc,
  getDocs,
  setDoc,
  deleteDoc,
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
  booklet: { code: string; moduleSlug: string; programmeId: string },
): Promise<void> {
  const db = getDbInstance()
  const ref = doc(db, 'users', userId, 'booklets', booklet.code)

  await setDoc(ref, {
    code: booklet.code,
    moduleSlug: booklet.moduleSlug,
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
      moduleSlug: data.moduleSlug as string,
      programmeId: data.programmeId as string,
      pairedAt: toISOString(data.pairedAt),
      lastOpenedAt: toISOString(data.lastOpenedAt),
    }
  })
}

/**
 * Check if a user has paired a specific booklet.
 */
export async function isBookletPaired(userId: string, code: string): Promise<boolean> {
  const db = getDbInstance()
  const ref = doc(db, 'users', userId, 'booklets', code)
  const snap = await getDoc(ref)
  return snap.exists()
}

/**
 * Update the lastOpenedAt timestamp for a paired booklet.
 */
export async function touchBooklet(userId: string, code: string): Promise<void> {
  const db = getDbInstance()
  const ref = doc(db, 'users', userId, 'booklets', code)
  await setDoc(ref, { lastOpenedAt: serverTimestamp() }, { merge: true })
}

/**
 * Unpair a booklet from a user.
 */
export async function unpairBooklet(userId: string, code: string): Promise<void> {
  const db = getDbInstance()
  const ref = doc(db, 'users', userId, 'booklets', code)
  await deleteDoc(ref)
}

// ── Helpers ────────────────────────────────────────────────────────────────

function toISOString(value: unknown): string {
  if (value && typeof value === 'object' && 'toDate' in value) {
    return (value as { toDate: () => Date }).toDate().toISOString()
  }
  if (typeof value === 'string') return value
  return new Date().toISOString()
}
