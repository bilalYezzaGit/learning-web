/**
 * Parcours Accueil Page
 *
 * Main entry point for a parcours: "Quel module veux-tu reviser ?"
 * Shows modules grouped by trimester + cross-module revision series.
 */

import type { Metadata } from 'next'
import { BookOpen } from 'lucide-react'

import { Card, CardContent } from '@/components/ui/card'
import { OnboardingBanner } from '@/components/onboarding-banner'
import { getAllProgrammes, getCours, getCoursActivities, getSerie } from '@/lib/content-loader'
import { getParcoursConfig } from '@/lib/parcours'

import { AccueilClient } from './accueil-client'

interface PageProps {
  params: Promise<{ parcours: string }>
}

export async function generateMetadata({ params }: PageProps): Promise<Metadata> {
  const { parcours } = await params
  const config = getParcoursConfig(parcours)
  const label = config?.label ?? 'Accueil'
  return {
    title: `${label} — Accueil`,
    description: `Choisissez un module a reviser dans le parcours ${label}. Cours, exercices et QCM par chapitre.`,
  }
}

export default async function ParcoursAccueilPage({ params }: PageProps) {
  const { parcours } = await params
  const parcoursConfig = getParcoursConfig(parcours)

  // Find the programme for this parcours
  const programme = (() => {
    if (!parcoursConfig) return null
    return getAllProgrammes().find(
      (p) => p.levelSlug === parcoursConfig.level && p.sectionSlug === parcoursConfig.section
    ) ?? null
  })()

  // Resolve modules with activity counts by type
  const modules = programme
    ? programme.cours.map((slug) => {
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
          lessonCount: activities.filter((a) => a.type === 'lesson').length,
          exerciseCount: activities.filter((a) => a.type === 'exercise').length,
          qcmCount: activities.filter((a) => a.type === 'qcm').length,
        }
      })
    : []

  // Group modules by trimester
  const trimesterGroups = ['T1', 'T2', 'T3']
    .map((key) => ({
      key,
      label: `Trimestre ${key.slice(1)}`,
      modules: modules
        .filter((m) => m.trimester === key)
        .sort((a, b) => a.order - b.order),
    }))
    .filter((g) => g.modules.length > 0)

  // Resolve cross-module series
  const crossModuleSeries = programme
    ? programme.series
        .map((slug) => {
          try {
            return getSerie(slug)
          } catch {
            return null
          }
        })
        .filter((s) => s !== null)
        .filter((s) => s.type !== 'mono-module')
        .map((s) => ({
          id: s.slug,
          title: s.title,
          description: s.description,
          type: s.type,
          trimestre: s.trimestre,
          difficulty: s.difficulty,
          estimatedMinutes: s.estimatedMinutes,
          activityCount: s.totalActivities,
        }))
    : []

  return (
    <div className="px-4 lg:px-6">
      <OnboardingBanner />

      <div className="mb-8">
        <h1 className="text-balance font-serif text-2xl font-semibold text-foreground">
          {parcoursConfig?.label ?? 'Accueil'}
        </h1>
        <p className="mt-1 text-muted-foreground">
          Choisissez un module pour commencer
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
        <AccueilClient
          parcours={parcours}
          trimesterGroups={trimesterGroups}
          crossModuleSeries={crossModuleSeries}
        />
      )}
    </div>
  )
}
