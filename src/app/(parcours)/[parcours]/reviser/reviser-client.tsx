'use client'

/**
 * Réviser Client Components
 *
 * Client-side components for the revision page:
 * - ReviserStats: progress overview cards
 * - ReviserContent: tabs, filters, search, and series list
 * - SeriesListItem: individual serie card with badges
 */

import * as React from 'react'
import Link from 'next/link'
import { Check, ChevronRight, Clock, GraduationCap, RotateCcw, Search, Trophy } from 'lucide-react'

import { Badge } from '@/components/ui/badge'
import { Card, CardContent, CardHeader, CardTitle } from '@/components/ui/card'
import { Input } from '@/components/ui/input'
import { Progress } from '@/components/ui/progress'
import { Select, SelectContent, SelectItem, SelectTrigger, SelectValue } from '@/components/ui/select'
import { Tabs, TabsContent, TabsList, TabsTrigger } from '@/components/ui/tabs'
import { useAuth } from '@/lib/context'
import { useProgress } from '@/lib/hooks/use-progress'
import type { SeriesType, Trimestre } from '@/types/content'

/** Enriched serie metadata for the list */
interface SeriesCatalogEntry {
  id: string
  title: string
  description?: string
  difficulty: number
  estimatedMinutes: number
  tags: string[]
  activityCount: number
  type: SeriesType
  trimestre: Trimestre
  modules: string[]
  priority: number
}

// =============================================================================
// Label helpers
// =============================================================================

function getDifficultyLabel(difficulty: number): string {
  switch (difficulty) {
    case 1: return 'Facile'
    case 2: return 'Moyen'
    case 3: return 'Difficile'
    default: return 'Moyen'
  }
}

function getDifficultyVariant(difficulty: number): 'default' | 'secondary' | 'destructive' {
  switch (difficulty) {
    case 1: return 'secondary'
    case 2: return 'default'
    case 3: return 'destructive'
    default: return 'secondary'
  }
}

function getTypeLabel(type: SeriesType): string {
  switch (type) {
    case 'mono-module': return 'Module'
    case 'cross-module': return 'Multi-module'
    case 'devoir-controle': return 'Devoir de contrôle'
    case 'devoir-synthese': return 'Devoir de synthèse'
    case 'diagnostic': return 'Diagnostic'
  }
}

function getTrimestreLabel(trimestre: Trimestre): string {
  return `T${trimestre}`
}

function formatModuleName(mod: string): string {
  return mod
    .split('-')
    .map(word => word.charAt(0).toUpperCase() + word.slice(1))
    .join(' ')
}

// =============================================================================
// Stats Cards
// =============================================================================

export function ReviserStats() {
  const { userId } = useAuth()
  const { progress } = useProgress(userId ?? undefined)

  const stats = React.useMemo(() => {
    let completed = 0
    let totalPercentage = 0
    let qcmCount = 0
    let exercisesDone = 0

    progress.forEach((p) => {
      if (p.status === 'success' || p.status === 'retry') {
        completed++
        if (p.activityType === 'exercise') {
          exercisesDone++
        }
        if (p.activityType === 'qcm' && p.score !== undefined) {
          totalPercentage += p.score
          qcmCount++
        }
      }
    })

    const avgScore = qcmCount > 0 ? Math.min(Math.round(totalPercentage / qcmCount), 100) : 0

    return { completed, avgScore, exercisesDone }
  }, [progress])

  return (
    <div className="mb-8 grid gap-4 sm:grid-cols-3">
      <Card>
        <CardContent className="flex items-center gap-4 py-4">
          <div className="flex h-10 w-10 items-center justify-center rounded-lg bg-primary/10">
            <Trophy className="h-5 w-5 text-primary" aria-hidden="true" />
          </div>
          <div>
            <p className="tabular-nums text-2xl font-bold">{stats.completed}</p>
            <p className="text-sm text-muted-foreground">Activités complétées</p>
          </div>
        </CardContent>
      </Card>
      <Card>
        <CardContent className="flex items-center gap-4 py-4">
          <div className="flex h-10 w-10 items-center justify-center rounded-lg bg-success/10">
            <GraduationCap className="h-5 w-5 text-success" aria-hidden="true" />
          </div>
          <div>
            <p className="tabular-nums text-2xl font-bold">{stats.avgScore}%</p>
            <p className="text-sm text-muted-foreground">Score moyen QCM</p>
          </div>
        </CardContent>
      </Card>
      <Card>
        <CardContent className="flex items-center gap-4 py-4">
          <div className="flex h-10 w-10 items-center justify-center rounded-lg bg-info/10">
            <Check className="h-5 w-5 text-info" aria-hidden="true" />
          </div>
          <div>
            <p className="tabular-nums text-2xl font-bold">{stats.exercisesDone}</p>
            <p className="text-sm text-muted-foreground">Exercices résolus</p>
          </div>
        </CardContent>
      </Card>
    </div>
  )
}

// =============================================================================
// Reviser Content (tabs, filters, search, series list)
// =============================================================================

interface ReviserContentProps {
  entries: SeriesCatalogEntry[]
  activityIdsMap: Record<string, string[]>
  parcours: string
  currentTrimestre: Trimestre
  availableModules: string[]
}

export function ReviserContent({
  entries,
  activityIdsMap,
  parcours,
  currentTrimestre,
  availableModules,
}: ReviserContentProps) {
  const [search, setSearch] = React.useState('')
  const [selectedModule, setSelectedModule] = React.useState<string>('all')
  const [selectedDifficulty, setSelectedDifficulty] = React.useState<string>('all')
  const [sortBy, setSortBy] = React.useState<string>('priority')

  // Filter and sort entries
  const filterEntries = React.useCallback(
    (items: SeriesCatalogEntry[]) => {
      const filtered = items.filter((entry) => {
        // Search filter
        if (search) {
          const q = search.toLowerCase()
          const matchesTitle = entry.title.toLowerCase().includes(q)
          const matchesDesc = entry.description?.toLowerCase().includes(q) ?? false
          const matchesTags = entry.tags.some((t) => t.toLowerCase().includes(q))
          const matchesModule = entry.modules.some((m) => m.toLowerCase().includes(q))
          if (!matchesTitle && !matchesDesc && !matchesTags && !matchesModule) return false
        }

        // Module filter
        if (selectedModule !== 'all' && !entry.modules.includes(selectedModule)) return false

        // Difficulty filter
        if (selectedDifficulty !== 'all' && entry.difficulty !== Number(selectedDifficulty)) return false

        return true
      })

      // Sort
      if (sortBy === 'difficulty') {
        filtered.sort((a, b) => a.difficulty - b.difficulty)
      } else if (sortBy === 'duration') {
        filtered.sort((a, b) => a.estimatedMinutes - b.estimatedMinutes)
      } else if (sortBy === 'difficulty-desc') {
        filtered.sort((a, b) => b.difficulty - a.difficulty)
      }

      return filtered
    },
    [search, selectedModule, selectedDifficulty, sortBy]
  )

  // Group entries by trimestre
  const byTrimestre = React.useMemo(() => {
    const grouped: Record<number, SeriesCatalogEntry[]> = { 1: [], 2: [], 3: [] }
    for (const entry of entries) {
      grouped[entry.trimestre]?.push(entry)
    }
    // Sort by priority within each trimestre
    for (const key of [1, 2, 3]) {
      grouped[key]?.sort((a, b) => a.priority - b.priority)
    }
    return grouped
  }, [entries])

  // Highlighted series for current trimestre
  const highlightedEntries = React.useMemo(
    () => filterEntries(byTrimestre[currentTrimestre] ?? []),
    [filterEntries, byTrimestre, currentTrimestre]
  )

  // All entries filtered (for "Tout" tab)
  const allFiltered = React.useMemo(
    () => filterEntries(entries),
    [filterEntries, entries]
  )

  // Filtered by trimestre tabs
  const t1Filtered = React.useMemo(() => filterEntries(byTrimestre[1] ?? []), [filterEntries, byTrimestre])
  const t2Filtered = React.useMemo(() => filterEntries(byTrimestre[2] ?? []), [filterEntries, byTrimestre])
  const t3Filtered = React.useMemo(() => filterEntries(byTrimestre[3] ?? []), [filterEntries, byTrimestre])

  return (
    <div className="space-y-6">
      {/* Search + Filters */}
      <div className="flex flex-col gap-3 sm:flex-row sm:items-center">
        <div className="relative flex-1">
          <Search className="absolute left-3 top-1/2 h-4 w-4 -translate-y-1/2 text-muted-foreground" aria-hidden="true" />
          <Input
            placeholder="Rechercher une série…"
            value={search}
            onChange={(e) => setSearch(e.target.value)}
            className="pl-9"
            aria-label="Rechercher une série"
          />
        </div>
        <div className="flex gap-2">
          <Select value={selectedModule} onValueChange={setSelectedModule}>
            <SelectTrigger aria-label="Filtrer par module">
              <SelectValue placeholder="Tous les modules" />
            </SelectTrigger>
            <SelectContent>
              <SelectItem value="all">Tous les modules</SelectItem>
              {availableModules.map((mod) => (
                <SelectItem key={mod} value={mod}>{formatModuleName(mod)}</SelectItem>
              ))}
            </SelectContent>
          </Select>
          <Select value={selectedDifficulty} onValueChange={setSelectedDifficulty}>
            <SelectTrigger aria-label="Filtrer par difficulté">
              <SelectValue placeholder="Toute difficulté" />
            </SelectTrigger>
            <SelectContent>
              <SelectItem value="all">Toute difficulté</SelectItem>
              <SelectItem value="1">Facile</SelectItem>
              <SelectItem value="2">Moyen</SelectItem>
              <SelectItem value="3">Difficile</SelectItem>
            </SelectContent>
          </Select>
          <Select value={sortBy} onValueChange={setSortBy}>
            <SelectTrigger aria-label="Trier par">
              <SelectValue placeholder="Par défaut" />
            </SelectTrigger>
            <SelectContent>
              <SelectItem value="priority">Par défaut</SelectItem>
              <SelectItem value="difficulty">Difficulté croissante</SelectItem>
              <SelectItem value="difficulty-desc">Difficulté décroissante</SelectItem>
              <SelectItem value="duration">Durée croissante</SelectItem>
            </SelectContent>
          </Select>
        </div>
      </div>

      {/* Highlighted: "Pour toi maintenant" */}
      {highlightedEntries.length > 0 && !search && selectedModule === 'all' && selectedDifficulty === 'all' && (
        <Card className="border-primary/20 bg-primary/5">
          <CardHeader className="pb-3">
            <CardTitle className="text-base">
              Pour toi maintenant — Trimestre {currentTrimestre}
            </CardTitle>
          </CardHeader>
          <CardContent className="p-0">
            {highlightedEntries.slice(0, 4).map((serie) => (
              <SeriesListItem
                key={serie.id}
                serie={serie}
                activityIds={activityIdsMap[serie.id] ?? []}
                parcours={parcours}
              />
            ))}
          </CardContent>
        </Card>
      )}

      {/* Tabs by trimestre */}
      <Tabs defaultValue="all">
        <TabsList className="w-full sm:w-auto">
          <TabsTrigger value="all">
            Tout ({allFiltered.length})
          </TabsTrigger>
          <TabsTrigger value="t1">
            T1 ({t1Filtered.length})
          </TabsTrigger>
          <TabsTrigger value="t2">
            T2 ({t2Filtered.length})
          </TabsTrigger>
          <TabsTrigger value="t3">
            T3 ({t3Filtered.length})
          </TabsTrigger>
        </TabsList>

        <TabsContent value="all">
          <SeriesList
            entries={allFiltered}
            activityIdsMap={activityIdsMap}
            parcours={parcours}
          />
        </TabsContent>
        <TabsContent value="t1">
          <SeriesList
            entries={t1Filtered}
            activityIdsMap={activityIdsMap}
            parcours={parcours}
          />
        </TabsContent>
        <TabsContent value="t2">
          <SeriesList
            entries={t2Filtered}
            activityIdsMap={activityIdsMap}
            parcours={parcours}
          />
        </TabsContent>
        <TabsContent value="t3">
          <SeriesList
            entries={t3Filtered}
            activityIdsMap={activityIdsMap}
            parcours={parcours}
          />
        </TabsContent>
      </Tabs>
    </div>
  )
}

// =============================================================================
// Series List
// =============================================================================

interface SeriesListProps {
  entries: SeriesCatalogEntry[]
  activityIdsMap: Record<string, string[]>
  parcours: string
}

function SeriesList({ entries, activityIdsMap, parcours }: SeriesListProps) {
  if (entries.length === 0) {
    return (
      <Card>
        <CardContent className="py-8 text-center text-muted-foreground">
          <p>Aucune série ne correspond à vos critères</p>
        </CardContent>
      </Card>
    )
  }

  return (
    <Card>
      <CardContent className="p-0">
        {entries.map((serie) => (
          <SeriesListItem
            key={serie.id}
            serie={serie}
            activityIds={activityIdsMap[serie.id] ?? []}
            parcours={parcours}
          />
        ))}
      </CardContent>
    </Card>
  )
}

// =============================================================================
// Series List Item
// =============================================================================

interface SeriesListItemProps {
  serie: SeriesCatalogEntry
  activityIds: string[]
  parcours: string
}

function SeriesListItem({ serie, activityIds, parcours }: SeriesListItemProps) {
  const { userId } = useAuth()
  const { isCompleted, isSuccess } = useProgress(userId ?? undefined)

  const serieProgress = React.useMemo(() => {
    let completed = 0
    let success = 0

    activityIds.forEach((id) => {
      if (isCompleted(id)) {
        completed++
        if (isSuccess(id)) {
          success++
        }
      }
    })

    const total = activityIds.length
    const percentage = total > 0 ? Math.round((completed / total) * 100) : 0

    return { completed, success, total, percentage }
  }, [activityIds, isCompleted, isSuccess])

  const isSerieComplete = serieProgress.completed === serieProgress.total && serieProgress.total > 0

  return (
    <Link
      href={`/${parcours}/reviser/serie/${serie.id}`}
      className="flex items-center gap-4 border-b px-6 py-4 transition-colors last:border-b-0 hover:bg-muted/50"
    >
      <div
        className={`flex h-10 w-10 items-center justify-center rounded-lg ${
          isSerieComplete ? 'bg-success/10' : 'bg-primary/10'
        }`}
      >
        {isSerieComplete ? (
          <Check className="h-5 w-5 text-success" aria-hidden="true" />
        ) : serieProgress.completed > 0 ? (
          <RotateCcw className="h-5 w-5 text-primary" aria-hidden="true" />
        ) : (
          <GraduationCap className="h-5 w-5 text-primary" aria-hidden="true" />
        )}
      </div>

      <div className="min-w-0 flex-1">
        <div className="flex flex-wrap items-center gap-2">
          <p className="font-medium">{serie.title}</p>
          {isSerieComplete && (
            <Badge variant="default" className="bg-success text-xs">
              Terminé
            </Badge>
          )}
        </div>

        {serie.description && (
          <p className="mt-0.5 line-clamp-1 text-sm text-muted-foreground">
            {serie.description}
          </p>
        )}

        <div className="mt-2 flex flex-wrap items-center gap-2">
          {/* Trimestre badge */}
          <Badge variant="outline" className="text-xs">
            {getTrimestreLabel(serie.trimestre)}
          </Badge>

          {/* Type badge (only if not mono-module) */}
          {serie.type !== 'mono-module' && (
            <Badge variant="secondary" className="text-xs">
              {getTypeLabel(serie.type)}
            </Badge>
          )}

          {/* Difficulty badge */}
          <Badge variant={getDifficultyVariant(serie.difficulty)} className="text-xs">
            {getDifficultyLabel(serie.difficulty)}
          </Badge>

          <span className="flex items-center gap-1 text-xs text-muted-foreground">
            <Clock className="h-3 w-3" aria-hidden="true" />
            {serie.estimatedMinutes} min
          </span>
          <span className="text-xs text-muted-foreground">
            {serieProgress.completed}/{serieProgress.total} activités
          </span>
        </div>

        {/* Progress bar */}
        {serieProgress.completed > 0 && !isSerieComplete && (
          <Progress value={serieProgress.percentage} className="mt-2 h-1.5" />
        )}
      </div>

      <ChevronRight className="h-5 w-5 shrink-0 text-muted-foreground" aria-hidden="true" />
    </Link>
  )
}
