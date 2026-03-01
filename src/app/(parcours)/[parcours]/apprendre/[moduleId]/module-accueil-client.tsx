'use client'

/**
 * Module Accueil Client
 *
 * Two-section layout:
 * 1. Notions du chapitre — sections linking directly into timeline
 * 2. S'entrainer — series cards linking to /reviser/serie/{id}
 */

import * as React from 'react'
import Link from 'next/link'
import {
  BookOpen,
  Check,
  ChevronRight,
  Dumbbell,
  FileText,
  Play,
  Target,
  Zap,
} from 'lucide-react'

import { Badge } from '@/components/ui/badge'
import { Card, CardContent } from '@/components/ui/card'
import { Progress } from '@/components/ui/progress'
import { useAuth } from '@/lib/context'
import { useProgress } from '@/lib/hooks/use-progress'

// =============================================================================
// Types
// =============================================================================

interface SectionEntry {
  id: string
  label: string
  order: number
  lessonCount: number
  exerciseCount: number
  qcmCount: number
  firstActivityId: string | null
  activityIds: string[]
}

interface SerieEntry {
  id: string
  title: string
  description: string
  difficulty: number
  estimatedMinutes: number
  activityCount: number
}

interface CoursInfo {
  title: string
  description: string
  objectives: string[]
  estimatedMinutes: number
}

interface DiagnosticEntry {
  id: string
  title: string
  description: string
  estimatedMinutes: number
  questionCount: number
}

interface ModuleAccueilClientProps {
  parcours: string
  moduleId: string
  coursInfo: CoursInfo
  sections: SectionEntry[]
  totalActivities: number
  moduleSeries: SerieEntry[]
  diagnostic: DiagnosticEntry | null
}

// =============================================================================
// Helpers
// =============================================================================

function formatDuration(minutes: number): string {
  if (minutes < 60) return `${minutes} min`
  const hours = Math.floor(minutes / 60)
  const remaining = minutes % 60
  if (remaining === 0) return `${hours}h`
  return `${hours}h${remaining.toString().padStart(2, '0')}`
}

function getDifficultyLabel(d: number): string {
  if (d <= 1) return 'Facile'
  if (d <= 2) return 'Moyen'
  return 'Difficile'
}

// =============================================================================
// Main Component
// =============================================================================

export function ModuleAccueilClient({
  parcours,
  moduleId,
  coursInfo,
  sections,
  totalActivities,
  moduleSeries,
  diagnostic,
}: ModuleAccueilClientProps) {
  const { userId } = useAuth()
  const { progress } = useProgress(userId ?? undefined)

  return (
    <div className="space-y-8">
      {/* Header */}
      <div>
        <h1 className="text-balance font-serif text-2xl font-semibold">{coursInfo.title}</h1>
        {coursInfo.description && (
          <p className="mt-1 text-muted-foreground">{coursInfo.description}</p>
        )}
        <div className="mt-3 flex flex-wrap gap-2">
          <Badge variant="secondary">{sections.length} sections</Badge>
          <Badge variant="secondary">{totalActivities} activites</Badge>
          {coursInfo.estimatedMinutes > 0 && (
            <Badge variant="outline">{formatDuration(coursInfo.estimatedMinutes)}</Badge>
          )}
        </div>
      </div>

      {/* Diagnostic CTA */}
      {diagnostic && (
        <Link href={`/${parcours}/apprendre/${moduleId}/serie/${diagnostic.id}/play`}>
          <Card className="border-primary/20 bg-primary/5 transition-colors hover:bg-primary/10">
            <CardContent className="py-4">
              <div className="flex items-center gap-4">
                <div className="flex h-12 w-12 shrink-0 items-center justify-center rounded-lg bg-primary/10">
                  <Zap className="h-6 w-6 text-primary" aria-hidden="true" />
                </div>
                <div className="min-w-0 flex-1">
                  <p className="font-serif text-lg font-semibold">Se tester rapidement</p>
                  <p className="text-sm text-muted-foreground">{diagnostic.description}</p>
                  <p className="mt-1 text-xs text-muted-foreground">
                    {diagnostic.questionCount} questions &middot; ~{diagnostic.estimatedMinutes} min
                  </p>
                </div>
                <ChevronRight className="h-5 w-5 shrink-0 text-muted-foreground" aria-hidden="true" />
              </div>
            </CardContent>
          </Card>
        </Link>
      )}

      {/* SECTION 1: Notions du chapitre */}
      <section>
        <div className="mb-3 flex items-center gap-2">
          <BookOpen className="h-5 w-5 text-primary" aria-hidden="true" />
          <h2 className="font-serif text-lg font-semibold">Notions du chapitre</h2>
        </div>

        <Card className="p-0">
          <CardContent className="p-0">
            {sections.map((section) => {
              const doneCount = section.activityIds.filter((id) => progress.has(id)).length
              const total = section.activityIds.length
              const percentage = total > 0 ? Math.round((doneCount / total) * 100) : 0
              const isComplete = doneCount >= total && total > 0
              const isInProgress = doneCount > 0 && !isComplete

              return (
                <Link
                  key={section.id}
                  href={
                    section.firstActivityId
                      ? `/${parcours}/apprendre/${moduleId}/${section.firstActivityId}`
                      : `/${parcours}/apprendre/${moduleId}`
                  }
                  className="flex items-center gap-3 border-b px-4 py-3 transition-colors last:border-b-0 hover:bg-muted/50"
                >
                  {/* Status icon */}
                  <div
                    className={`flex h-8 w-8 shrink-0 items-center justify-center rounded-lg ${
                      isComplete
                        ? 'bg-success/10'
                        : isInProgress
                          ? 'bg-primary/10'
                          : 'bg-muted'
                    }`}
                  >
                    {isComplete ? (
                      <Check className="h-4 w-4 text-success" aria-hidden="true" />
                    ) : isInProgress ? (
                      <Play className="h-3.5 w-3.5 text-primary" aria-hidden="true" />
                    ) : (
                      <span className="text-sm font-medium text-muted-foreground" aria-hidden="true">
                        {section.order}
                      </span>
                    )}
                  </div>

                  {/* Label + metadata */}
                  <div className="min-w-0 flex-1">
                    <p className={`font-medium ${isComplete ? 'text-muted-foreground' : ''}`}>
                      {section.label}
                    </p>
                    <div className="mt-0.5 flex flex-wrap items-center gap-1.5 text-xs text-muted-foreground">
                      {section.lessonCount > 0 && <span>{section.lessonCount} cours</span>}
                      {section.lessonCount > 0 && (section.exerciseCount > 0 || section.qcmCount > 0) && (
                        <span>&middot;</span>
                      )}
                      {section.exerciseCount > 0 && <span>{section.exerciseCount} ex</span>}
                      {section.exerciseCount > 0 && section.qcmCount > 0 && <span>&middot;</span>}
                      {section.qcmCount > 0 && <span>{section.qcmCount} QCM</span>}
                    </div>

                    {isInProgress && (
                      <div className="mt-1.5 flex items-center gap-2">
                        <Progress
                          value={percentage}
                          className="h-1 w-24"
                          aria-label={`Progression : ${percentage}%`}
                        />
                        <span className="tabular-nums text-xs font-medium text-primary">
                          {percentage}%
                        </span>
                      </div>
                    )}
                  </div>

                  <ChevronRight className="h-5 w-5 shrink-0 text-muted-foreground" aria-hidden="true" />
                </Link>
              )
            })}
          </CardContent>
        </Card>
      </section>

      {/* SECTION 2: S'entrainer (hidden if no series) */}
      {moduleSeries.length > 0 && (
        <section>
          <div className="mb-1 flex items-center gap-2">
            <Dumbbell className="h-5 w-5 text-primary" aria-hidden="true" />
            <h2 className="font-serif text-lg font-semibold">S&apos;entrainer sur le module</h2>
          </div>
          <p className="mb-3 text-sm text-muted-foreground">
            Consolide tes acquis avec des series d&apos;exercices
          </p>

          <div className="grid gap-4 sm:grid-cols-2">
            {moduleSeries.map((serie) => (
              <Link key={serie.id} href={`/${parcours}/apprendre/${moduleId}/serie/${serie.id}`}>
                <Card className="h-full transition-colors hover:bg-muted/50">
                  <CardContent className="py-4">
                    <div className="flex items-start gap-3">
                      <div className="flex h-10 w-10 shrink-0 items-center justify-center rounded-lg bg-muted">
                        <FileText className="h-5 w-5 text-muted-foreground" aria-hidden="true" />
                      </div>
                      <div className="min-w-0 flex-1">
                        <div className="flex flex-wrap items-center gap-2">
                          <p className="font-medium">{serie.title}</p>
                          <Badge variant="secondary" className="text-xs">
                            {getDifficultyLabel(serie.difficulty)}
                          </Badge>
                        </div>
                        {serie.description && (
                          <p className="mt-1 line-clamp-1 text-sm text-muted-foreground">
                            {serie.description}
                          </p>
                        )}
                        <div className="mt-2 flex flex-wrap items-center gap-1.5 text-xs text-muted-foreground">
                          <span>{serie.activityCount} activites</span>
                          <span>&middot;</span>
                          <span>{formatDuration(serie.estimatedMinutes)}</span>
                        </div>
                      </div>
                      <ChevronRight
                        className="mt-1 h-5 w-5 shrink-0 text-muted-foreground"
                        aria-hidden="true"
                      />
                    </div>
                  </CardContent>
                </Card>
              </Link>
            ))}
          </div>
        </section>
      )}

      {/* Objectives */}
      {coursInfo.objectives.length > 0 && (
        <Card>
          <CardContent className="py-4">
            <div className="mb-2 flex items-center gap-2 text-sm font-medium">
              <Target className="h-4 w-4 text-primary" aria-hidden="true" />
              Objectifs du module
            </div>
            <ul className="space-y-1 text-sm text-muted-foreground">
              {coursInfo.objectives.map((obj, i) => (
                <li key={i} className="flex items-start gap-2">
                  <span className="text-primary">&bull;</span>
                  {obj}
                </li>
              ))}
            </ul>
          </CardContent>
        </Card>
      )}
    </div>
  )
}
