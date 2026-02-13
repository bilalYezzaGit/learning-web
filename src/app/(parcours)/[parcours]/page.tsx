/**
 * Parcours Dashboard Page — "Cockpit de progression"
 *
 * Enriched learner dashboard for a specific parcours.
 * Server component resolves content metadata (modules, series, atoms),
 * client component computes stats from user progress.
 */

import type { Metadata } from 'next'
import Link from 'next/link'
import { BookOpen, Brain } from 'lucide-react'

import { Card, CardDescription, CardHeader, CardTitle } from '@/components/ui/card'
import { OnboardingBanner } from '@/components/onboarding-banner'
import {
  getAllProgrammes,
  getAllAtoms,
  getCours,
  getSerie,
  resolveCoursActivities,
  resolveSerieActivities,
} from '@/lib/content'
import { getParcoursConfig } from '@/lib/parcours'
import type { DashboardModuleInfo, DashboardSeriesInfo } from '@/types/dashboard'
import type { DashboardAtomInfo } from '@/lib/dashboard'
import { DashboardClient } from './dashboard-client'

interface PageProps {
  params: Promise<{ parcours: string }>
}

export async function generateMetadata({ params }: PageProps): Promise<Metadata> {
  const { parcours } = await params
  const config = getParcoursConfig(parcours)
  const label = config?.label ?? 'Tableau de bord'
  return {
    title: `Tableau de bord — ${label}`,
    description: `Votre progression et vos statistiques pour le parcours ${label}. Reprenez votre apprentissage.`,
  }
}

export default async function ParcoursDashboardPage({ params }: PageProps) {
  const { parcours } = await params
  const parcoursConfig = getParcoursConfig(parcours)

  const programme = (() => {
    if (!parcoursConfig) return null
    return getAllProgrammes().find(
      (p) => p.levelSlug === parcoursConfig.level && p.sectionSlug === parcoursConfig.section
    ) ?? null
  })()

  // Resolve modules with trimester + activity IDs
  const modules: DashboardModuleInfo[] = (() => {
    if (!programme) return []

    return programme.cours.map((slug) => {
      const cours = getCours(slug)
      const activities = resolveCoursActivities(slug)
      return {
        id: slug,
        title: cours.title,
        trimester: cours.trimester,
        activityIds: activities.map((a) => a.id),
      }
    })
  })()

  // Resolve series with their activity IDs
  const series: DashboardSeriesInfo[] = (() => {
    if (!programme) return []

    return programme.series.map((slug) => {
      const serie = getSerie(slug)
      const activities = resolveSerieActivities(slug)
      return {
        slug: serie.slug,
        title: serie.title,
        difficulty: serie.difficulty,
        estimatedMinutes: serie.estimatedMinutes,
        trimestre: serie.trimestre,
        modules: serie.modules,
        tags: serie.tags,
        type: serie.type,
        activityIds: activities.map((a) => a.id),
      }
    })
  })()

  // Collect atom metadata for tag-based analysis (only atoms referenced by modules)
  const atoms: DashboardAtomInfo[] = (() => {
    const referencedIds = new Set(modules.flatMap((m) => m.activityIds))
    return getAllAtoms()
      .filter((a) => referencedIds.has(a.id))
      .map((a) => ({
        id: a.id,
        type: a.type,
        title: a.title,
        tags: a.tags,
        difficulty: a.difficulty,
      }))
  })()

  return (
    <div className="px-4 lg:px-6">
      <OnboardingBanner />

      {/* Enriched Dashboard - Client Component */}
      <DashboardClient
        parcours={parcours}
        modules={modules}
        series={series}
        atoms={atoms}
      />

      {/* Quick Actions */}
      <div className="mt-6 grid gap-4 sm:grid-cols-2">
        <Card className="transition-colors hover:bg-muted/50">
          <Link href={`/${parcours}/apprendre`} className="block">
            <CardHeader>
              <div className="flex items-center gap-3">
                <div className="flex h-10 w-10 items-center justify-center rounded-lg bg-primary/10">
                  <BookOpen className="h-5 w-5 text-primary" aria-hidden="true" />
                </div>
                <div>
                  <CardTitle className="text-base">Apprendre</CardTitle>
                  <CardDescription>Cours et exercices par chapitre</CardDescription>
                </div>
              </div>
            </CardHeader>
          </Link>
        </Card>

        <Card className="transition-colors hover:bg-muted/50">
          <Link href={`/${parcours}/reviser`} className="block">
            <CardHeader>
              <div className="flex items-center gap-3">
                <div className="flex h-10 w-10 items-center justify-center rounded-lg bg-primary/10">
                  <Brain className="h-5 w-5 text-primary" aria-hidden="true" />
                </div>
                <div>
                  <CardTitle className="text-base">R&eacute;viser</CardTitle>
                  <CardDescription>QCM et s&eacute;ries d&apos;entra&icirc;nement</CardDescription>
                </div>
              </div>
            </CardHeader>
          </Link>
        </Card>
      </div>
    </div>
  )
}
