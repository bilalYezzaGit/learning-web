/**
 * User Service
 *
 * Encapsulates Firestore operations for user documents.
 * Client-side only.
 */

import { doc, getDoc, setDoc } from 'firebase/firestore'
import { sendEmailVerification, type User } from 'firebase/auth'

import { getDbInstance } from '@/lib/firebase/client'

/**
 * Get user's parcours slug from Firestore
 */
export async function getUserParcoursSlug(userId: string): Promise<string | undefined> {
  const db = getDbInstance()
  const userDoc = await getDoc(doc(db, 'users', userId))
  return userDoc.data()?.parcours?.slug as string | undefined
}

/**
 * Save user's parcours selection to Firestore
 */
export async function saveUserParcours(userId: string, parcoursSlug: string): Promise<void> {
  const db = getDbInstance()
  const userRef = doc(db, 'users', userId)
  await setDoc(userRef, {
    parcours: {
      slug: parcoursSlug,
      selectedAt: new Date().toISOString(),
    },
    createdAt: new Date().toISOString(),
  }, { merge: true })
}

/**
 * Send email verification to user
 */
export async function sendVerificationEmail(user: User): Promise<void> {
  await sendEmailVerification(user)
}
