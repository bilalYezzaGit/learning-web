import type { Metadata } from 'next'

import type { ResolvedActivity } from '@/types/content'
import {
  getAllProgrammes,
  getAllCours,
  getAllSeries,
  type GeneratedCoursSection,
} from '@/lib/content-loader'

import { ViewerClient } from './viewer-client'

export const metadata: Metadata = {
  title: 'Molecule Viewer',
}

export const dynamic = 'force-dynamic'

export interface MoleculeEntry {
  slug: string
  kind: 'cours' | 'serie'
  programmeId: string
  title: string
  visible: boolean
  description: string
  trimester?: string
  order?: number
  estimatedMinutes: number
  difficulty?: number
  objectives?: string[]
  sections?: GeneratedCoursSection[]
  activities?: ResolvedActivity[]
  totalActivities: number
  tags?: string[]
  type?: string
  modules?: string[]
}

export default function ViewerPage() {
  const programmes = getAllProgrammes()
  const allCours = getAllCours()
  const allSeries = getAllSeries()

  const molecules: MoleculeEntry[] = []

  for (const prog of programmes) {
    // Add cours for this programme
    for (const coursSlug of prog.cours) {
      const cours = allCours.find((c) => c.slug === coursSlug)
      if (!cours) continue
      molecules.push({
        slug: cours.slug,
        kind: 'cours',
        programmeId: prog.id,
        title: cours.title,
        visible: cours.visible,
        description: cours.description,
        trimester: cours.trimester,
        order: cours.order,
        estimatedMinutes: cours.estimatedMinutes,
        objectives: cours.objectives,
        sections: cours.sections,
        totalActivities: cours.totalActivities,
      })
    }

    // Add series for this programme
    for (const serieSlug of prog.series) {
      const serie = allSeries.find((s) => s.slug === serieSlug)
      if (!serie) continue
      molecules.push({
        slug: serie.slug,
        kind: 'serie',
        programmeId: prog.id,
        title: serie.title,
        visible: serie.visible,
        description: serie.description,
        trimester: String(serie.trimestre),
        estimatedMinutes: serie.estimatedMinutes,
        difficulty: serie.difficulty,
        activities: serie.activities,
        totalActivities: serie.totalActivities,
        tags: serie.tags,
        type: serie.type,
        modules: serie.modules,
      })
    }
  }

  return (
    <ViewerClient
      programmes={programmes.map((p) => ({ id: p.id, label: p.label }))}
      molecules={molecules}
    />
  )
}
