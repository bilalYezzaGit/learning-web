/**
 * Réviser Page (Parcours-specific)
 *
 * Practice hub with series organized by trimestre and type.
 * Features: tabs, filters, search, trimestre badges, type indicators.
 * Public - playable without authentication (score not saved).
 */

import type { Metadata } from 'next'
import { BookOpen } from 'lucide-react'

import { Card, CardContent } from '@/components/ui/card'
import { getAllProgrammes, getSerie, getSerieActivities } from '@/lib/content-loader'
import { getParcoursConfig } from '@/lib/parcours'
import { ReviserStats, ReviserContent } from './reviser-client'
import type { Trimestre } from '@/types/content'

interface PageProps {
  params: Promise<{ parcours: string }>
}

export async function generateMetadata({ params }: PageProps): Promise<Metadata> {
  const { parcours } = await params
  const config = getParcoursConfig(parcours)
  const label = config?.label ?? 'Réviser'
  return {
    title: `Réviser — ${label}`,
    description: `Séries de révision pour le parcours ${label}. Exercices thématiques et devoirs types classés par trimestre et difficulté.`,
  }
}

/** Determine the current trimestre based on the month (Tunisian school year) */
function getCurrentTrimestre(): Trimestre {
  const month = new Date().getMonth() + 1 // 1-12
  if (month >= 9 && month <= 12) return 1 // Sept-Dec
  if (month >= 1 && month <= 3) return 2  // Jan-Mar
  return 3                                 // Apr-Jun
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

  // Resolve activity IDs for each serie
  const activityIdsMap = new Map(
    seriesList.map((serie) => [
      serie.slug,
      getSerieActivities(serie.slug).map((a) => a.id),
    ])
  )

  // Build enriched catalog entries (exclude diagnostics — they appear on module pages)
  const catalogEntries = seriesList.filter((serie) => serie.type !== 'diagnostic' && serie.type !== 'mono-module').map((serie) => ({
    id: serie.slug,
    title: serie.title,
    description: serie.description,
    difficulty: serie.difficulty,
    estimatedMinutes: serie.estimatedMinutes,
    tags: serie.tags,
    activityCount: getSerieActivities(serie.slug).length,
    type: serie.type,
    trimestre: serie.trimestre,
    modules: serie.modules,
    priority: serie.priority,
  }))

  // Extract unique modules for filter options
  const moduleSet = new Set<string>()
  for (const entry of catalogEntries) {
    for (const mod of entry.modules) {
      moduleSet.add(mod)
    }
  }
  const availableModules = Array.from(moduleSet).sort()

  // Determine current trimestre
  const currentTrimestre = getCurrentTrimestre()

  return (
    <div className="px-4 lg:px-6">
      <div className="mb-8">
        <h1 className="text-balance font-serif text-2xl font-semibold text-foreground">Réviser</h1>
        <p className="mt-1 text-muted-foreground">
          Entraînez-vous avec des séries d&apos;exercices thématiques
        </p>
      </div>

      {/* Stats Cards - Client Component */}
      <ReviserStats />

      {/* Series Content */}
      {catalogEntries.length === 0 ? (
        <Card>
          <CardContent className="py-12 text-center text-muted-foreground">
            <BookOpen className="mx-auto mb-4 h-12 w-12 opacity-50" aria-hidden="true" />
            <p className="text-lg font-medium">Aucune série disponible</p>
            <p className="mt-1 text-sm">Les séries d&apos;exercices arrivent bientôt</p>
          </CardContent>
        </Card>
      ) : (
        <ReviserContent
          entries={catalogEntries}
          activityIdsMap={Object.fromEntries(activityIdsMap)}
          parcours={parcours}
          currentTrimestre={currentTrimestre}
          availableModules={availableModules}
        />
      )}
    </div>
  )
}
