/**
 * Apprendre Page (Parcours-specific)
 *
 * Learning hub with modules grid.
 * Filtered by parcours.
 */

import type { Metadata } from 'next'
import { BookOpen } from 'lucide-react'

import { Card, CardContent } from '@/components/ui/card'
import { ModuleProgressCard } from '@/components/module-progress-card'
import { getAllProgrammes, getCours, resolveCoursActivities } from '@/lib/content'
import { getParcoursConfig } from '@/lib/parcours/config'

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

  // Resolve cours molecules for each programme
  const programmesWithCours = programmes.map((programme) => ({
    ...programme,
    modules: programme.cours.map((slug) => {
      const cours = getCours(slug)
      const activities = resolveCoursActivities(slug)
      return {
        id: cours.slug,
        title: cours.title,
        description: cours.description,
        sectionsCount: cours.sections.length,
        activityIds: activities.map((a) => a.id),
      }
    }),
  }))

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

      {programmesWithCours.length === 0 ? (
        <Card>
          <CardContent className="py-12 text-center text-muted-foreground">
            <BookOpen className="mx-auto mb-4 h-12 w-12 opacity-50" aria-hidden="true" />
            <p className="text-lg font-medium">Aucun module disponible</p>
          </CardContent>
        </Card>
      ) : (
        <div className="space-y-6">
          {programmesWithCours.map((programme) => (
            <div key={programme.id}>
              <h2 className="mb-4 font-serif text-lg font-semibold">
                {programme.label}
              </h2>
              <div className="grid gap-4 sm:grid-cols-2 lg:grid-cols-3">
                {programme.modules.map((mod) => (
                  <ModuleProgressCard
                    key={mod.id}
                    moduleId={mod.id}
                    title={mod.title}
                    description={mod.description}
                    sectionsCount={mod.sectionsCount}
                    activityIds={mod.activityIds}
                    parcours={parcours}
                  />
                ))}
              </div>
            </div>
          ))}
        </div>
      )}
    </div>
  )
}
