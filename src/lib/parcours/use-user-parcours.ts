'use client'

/**
 * User Parcours Hook
 *
 * Fetches and manages user's parcours from Firestore.
 */

import * as React from 'react'
import { doc, getDoc, setDoc, onSnapshot } from 'firebase/firestore'

import { getDbInstance } from '@/lib/firebase/client'
import { useAuth } from '@/lib/context'
import { getParcoursConfig, type ParcoursConfig } from './config'

export interface UserParcours {
  slug: string
  selectedAt: string
}

interface UseUserParcoursReturn {
  /** User's current parcours slug */
  parcours: UserParcours | null
  /** Parcours config (label, description, etc.) */
  parcoursConfig: ParcoursConfig | null
  /** Loading state */
  isLoading: boolean
  /** Update user's parcours */
  setParcours: (slug: string) => Promise<void>
  /** Check if user needs to select parcours */
  needsParcoursSelection: boolean
}

/**
 * Hook for managing user's parcours
 *
 * @example
 * ```tsx
 * const { parcours, parcoursConfig, setParcours, needsParcoursSelection } = useUserParcours()
 *
 * if (needsParcoursSelection) {
 *   return <ParcoursSelector onSelect={setParcours} />
 * }
 * ```
 */
export function useUserParcours(): UseUserParcoursReturn {
  const { userId, isAuthenticated, isLoading: authLoading } = useAuth()
  const [parcours, setParcours] = React.useState<UserParcours | null>(null)
  const [isLoading, setIsLoading] = React.useState(true)

  // Subscribe to user's parcours in Firestore
  React.useEffect(() => {
    if (authLoading) return
    if (!isAuthenticated || !userId) {
      setIsLoading(false)
      setParcours(null)
      return
    }

    const db = getDbInstance()
    const userRef = doc(db, 'users', userId)

    const unsubscribe = onSnapshot(
      userRef,
      (snapshot) => {
        if (snapshot.exists()) {
          const data = snapshot.data()
          if (data.parcours?.slug) {
            setParcours({
              slug: data.parcours.slug,
              selectedAt: data.parcours.selectedAt || new Date().toISOString(),
            })
          } else {
            setParcours(null)
          }
        } else {
          setParcours(null)
        }
        setIsLoading(false)
      },
      (error) => {
        console.error('Error fetching user parcours:', error)
        setIsLoading(false)
      }
    )

    return () => unsubscribe()
  }, [userId, isAuthenticated, authLoading])

  // Update user's parcours
  const updateParcours = React.useCallback(
    async (slug: string) => {
      if (!userId) {
        throw new Error('User not authenticated')
      }

      const db = getDbInstance()
      const userRef = doc(db, 'users', userId)

      await setDoc(
        userRef,
        {
          parcours: {
            slug,
            selectedAt: new Date().toISOString(),
          },
          updatedAt: new Date().toISOString(),
        },
        { merge: true }
      )
    },
    [userId]
  )

  const parcoursConfig = parcours ? getParcoursConfig(parcours.slug) || null : null

  const needsParcoursSelection =
    !authLoading && isAuthenticated && !isLoading && !parcours

  return {
    parcours,
    parcoursConfig,
    isLoading: isLoading || authLoading,
    setParcours: updateParcours,
    needsParcoursSelection,
  }
}
