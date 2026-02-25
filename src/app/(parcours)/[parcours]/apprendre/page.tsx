/**
 * Apprendre Page (Parcours-specific)
 *
 * Learning hub with sequential module list grouped by trimester.
 * Server Component fetches and groups data, client component handles progress.
 */

import type { Metadata } from 'next'
import { BookOpen } from 'lucide-react'

import { Card, CardContent } from '@/components/ui/card'
import { getAllProgrammes, getCours, getCoursActivities } from '@/lib/content-loader'
import { getParcoursConfig } from '@/lib/parcours/config'

import { ApprendreClient } from './apprendre-client'

interface PageProps {
  params: Promise<{ parcours: string }>
}

export async function generateMetadata({ params }: PageProps): Promise<Metadata> {
  const { parcours } = await params
  const config = getParcoursConfig(parcours)
  const label = config?.label ?? 'Apprendre'
  return {
    title: `Apprendre — ${label}`,
    description: `Explorez les modules de mathématiques du parcours ${label}. Cours structurés, exercices corrigés et QCM interactifs.`,
  }
}

export default async function ApprendrePage({ params }: PageProps) {
  const { parcours } = await params
  const parcoursConfig = getParcoursConfig(parcours)

  // Get programmes matching this parcours
  const allProgrammes = getAllProgrammes()
  const programmes = parcoursConfig
    ? allProgrammes.filter(
        (p) => p.levelSlug === parcoursConfig.level && p.sectionSlug === parcoursConfig.section
      )
    : allProgrammes

  // Resolve enriched module data from all programmes
  const modules = programmes.flatMap((programme) =>
    programme.cours.map((slug) => {
      const cours = getCours(slug)
      const activities = getCoursActivities(slug)
      return {
        id: cours.slug,
        title: cours.title,
        description: cours.description,
        trimester: cours.trimester,
        order: cours.order,
        estimatedMinutes: cours.estimatedMinutes,
        sectionsCount: cours.sections.length,
        activityIds: activities.map((a) => a.id),
      }
    })
  )

  // Group by trimester
  const trimesterGroups = ['T1', 'T2', 'T3']
    .map((key) => ({
      key,
      label: `Trimestre ${key.slice(1)}`,
      modules: modules
        .filter((m) => m.trimester === key)
        .sort((a, b) => a.order - b.order),
    }))
    .filter((g) => g.modules.length > 0)

  return (
    <div className="px-4 lg:px-6">
      <div className="mb-8">
        <h1 className="text-balance font-serif text-2xl font-semibold text-foreground">
          Apprendre
        </h1>
        <p className="mt-1 text-muted-foreground">
          Explorez les modules et progressez à votre rythme
        </p>
      </div>

      {trimesterGroups.length === 0 ? (
        <Card>
          <CardContent className="py-12 text-center text-muted-foreground">
            <BookOpen className="mx-auto mb-4 h-12 w-12 opacity-50" aria-hidden="true" />
            <p className="text-lg font-medium">Aucun module disponible</p>
          </CardContent>
        </Card>
      ) : (
        <ApprendreClient parcours={parcours} trimesterGroups={trimesterGroups} />
      )}
    </div>
  )
}
