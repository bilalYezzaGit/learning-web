/**
 * Réviser Page (Parcours-specific)
 *
 * Practice hub with series from filesystem.
 * Public - playable without authentication (score not saved).
 */

import { BookOpen } from 'lucide-react'

import { Card, CardContent, CardHeader, CardTitle } from '@/components/ui/card'
import { getAllSeries, resolveSerieActivities } from '@/lib/content'
import { ReviserStats, SeriesListItem } from './reviser-client'

interface PageProps {
  params: Promise<{ parcours: string }>
}

export default async function ReviserPage({ params }: PageProps) {
  const { parcours } = await params

  const allSeries = getAllSeries()

  // Resolve activity IDs for each serie (for progress tracking)
  const seriesWithActivities = allSeries.map((serie) => ({
    id: serie.slug,
    activityIds: resolveSerieActivities(serie.slug).map((a) => a.id),
  }))

  const activityIdsMap = new Map(seriesWithActivities.map((s) => [s.id, s.activityIds]))

  // Map to catalog entries for the list items
  const catalogEntries = allSeries.map((serie) => ({
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
