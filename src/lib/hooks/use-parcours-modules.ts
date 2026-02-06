'use client'

/**
 * Hook for fetching modules of the active parcours
 */

import { useMemo } from 'react'
import { useProgrammes } from './use-programmes'
import { getParcoursConfig } from '@/lib/parcours'

interface ParcoursModule {
  id: string
  title: string
  order: number
}

export function useParcoursModules(parcours: string) {
  const { data, isLoading, error } = useProgrammes()
  const parcoursConfig = getParcoursConfig(parcours)

  const modules = useMemo<ParcoursModule[]>(() => {
    if (!data || !parcoursConfig) return []

    const programme = data.programmes.find(
      (p) =>
        p.levelSlug === parcoursConfig.level &&
        p.sectionSlug === parcoursConfig.section
    )

    if (!programme) return []

    return programme.modules
      .map((m) => ({ id: m.id, title: m.title, order: m.order }))
      .sort((a, b) => a.order - b.order)
  }, [data, parcoursConfig])

  return { modules, isLoading, error }
}
