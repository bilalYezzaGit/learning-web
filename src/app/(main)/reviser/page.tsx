/**
 * Réviser Page
 *
 * Practice hub with series from Firebase.
 * Public - playable without authentication (score not saved).
 * Server Component with client components for progress display.
 */

import { BookOpen } from 'lucide-react'

import { Card, CardContent, CardHeader, CardTitle } from '@/components/ui/card'
import { fetchSeriesCatalog, fetchSerie } from '@/lib/services/content-service'
import { ReviserStats, SeriesListItem } from './reviser-client'

export default async function ReviserPage() {
  let catalog
  let seriesWithActivities: { id: string; activityIds: string[] }[] = []
  let error = null

  try {
    catalog = await fetchSeriesCatalog()

    // Fetch activity IDs for each serie (for progress tracking)
    // We do this in parallel for better performance
    const seriePromises = catalog.series.map(async (entry) => {
      try {
        const serie = await fetchSerie(entry.id)
        return {
          id: entry.id,
          activityIds: serie.activities.map((a) => a.id),
        }
      } catch {
        return { id: entry.id, activityIds: [] }
      }
    })

    seriesWithActivities = await Promise.all(seriePromises)
  } catch (e) {
    error = e instanceof Error ? e.message : 'Erreur de chargement'
  }

  // Create a map for quick lookup
  const activityIdsMap = new Map(seriesWithActivities.map((s) => [s.id, s.activityIds]))

  return (
    <div className="container max-w-6xl py-6">
      <div className="mb-8">
        <h1 className="font-serif text-2xl font-semibold text-foreground">Réviser</h1>
        <p className="mt-1 text-muted-foreground">
          Entraînez-vous avec des séries d&apos;exercices thématiques
        </p>
      </div>

      {/* Stats Cards - Client Component */}
      <ReviserStats />

      {/* Series List */}
      {error ? (
        <Card>
          <CardContent className="py-12 text-center text-muted-foreground">
            <BookOpen className="mx-auto mb-4 h-12 w-12 opacity-50" />
            <p className="text-lg font-medium">Erreur de chargement</p>
            <p className="mt-1 text-sm">{error}</p>
          </CardContent>
        </Card>
      ) : !catalog || catalog.series.length === 0 ? (
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
            {catalog.series.map((serie) => (
              <SeriesListItem
                key={serie.id}
                serie={serie}
                activityIds={activityIdsMap.get(serie.id) ?? []}
              />
            ))}
          </CardContent>
        </Card>
      )}
    </div>
  )
}
