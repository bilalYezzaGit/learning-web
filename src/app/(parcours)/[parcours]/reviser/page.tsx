/**
 * Réviser Page (Parcours-specific)
 *
 * Practice hub with series from filesystem.
 * Filtered by parcours — only shows series belonging to the matching programme.
 * Public - playable without authentication (score not saved).
 */

import { BookOpen } from 'lucide-react'

import { Card, CardContent, CardHeader, CardTitle } from '@/components/ui/card'
import { getAllProgrammes, getSerie, resolveSerieActivities } from '@/lib/content'
import { getParcoursConfig } from '@/lib/parcours'
import { ReviserStats, SeriesListItem } from './reviser-client'

interface PageProps {
  params: Promise<{ parcours: string }>
}

export default async function ReviserPage({ params }: PageProps) {
  const { parcours } = await params
  const parcoursConfig = getParcoursConfig(parcours)

  // Find the programme matching this parcours
  const allProgrammes = getAllProgrammes()
  const programme = parcoursConfig
    ? allProgrammes.find(
        (p) => p.levelSlug === parcoursConfig.level && p.sectionSlug === parcoursConfig.section
      )
    : undefined

  // Get series belonging to this programme
  const seriesSlugs = programme?.series ?? []
  const seriesList = seriesSlugs.map((slug) => getSerie(slug))

  // Resolve activity IDs for each serie (for progress tracking)
  const activityIdsMap = new Map(
    seriesList.map((serie) => [
      serie.slug,
      resolveSerieActivities(serie.slug).map((a) => a.id),
    ])
  )

  // Map to catalog entries for the list items
  const catalogEntries = seriesList.map((serie) => ({
    id: serie.slug,
    title: serie.title,
    description: serie.description,
    difficulty: serie.difficulty,
    estimatedMinutes: serie.estimatedMinutes,
    tags: serie.tags,
    activityCount: resolveSerieActivities(serie.slug).length,
  }))

  return (
    <div className="px-4 lg:px-6">
      <div className="mb-8">
        <h1 className="font-serif text-2xl font-semibold text-foreground">Réviser</h1>
        <p className="mt-1 text-muted-foreground">
          Entraînez-vous avec des séries d&apos;exercices thématiques
        </p>
      </div>

      {/* Stats Cards - Client Component */}
      <ReviserStats />

      {/* Series List */}
      {catalogEntries.length === 0 ? (
        <Card>
          <CardContent className="py-12 text-center text-muted-foreground">
            <BookOpen className="mx-auto mb-4 h-12 w-12 opacity-50" />
            <p className="text-lg font-medium">Aucune série disponible</p>
            <p className="mt-1 text-sm">Les séries d&apos;exercices arrivent bientôt</p>
          </CardContent>
        </Card>
      ) : (
        <Card>
          <CardHeader>
            <CardTitle>Séries disponibles</CardTitle>
          </CardHeader>
          <CardContent className="p-0">
            {catalogEntries.map((serie) => (
              <SeriesListItem
                key={serie.id}
                serie={serie}
                activityIds={activityIdsMap.get(serie.id) ?? []}
                parcours={parcours}
              />
            ))}
          </CardContent>
        </Card>
      )}
    </div>
  )
}
