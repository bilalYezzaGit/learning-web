/**
 * Parcours Dashboard Page
 *
 * Learner dashboard for a specific parcours.
 * Shows progress tracking and quick actions.
 */

import type { Metadata } from 'next'
import Link from 'next/link'
import { BookOpen, Brain } from 'lucide-react'

import { Card, CardDescription, CardHeader, CardTitle } from '@/components/ui/card'
import { OnboardingBanner } from '@/components/onboarding-banner'
import { getAllProgrammes, getCours, resolveCoursActivities } from '@/lib/content'
import { getParcoursConfig } from '@/lib/parcours'
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

  // Resolve modules with their activity IDs for progress tracking
  const modules = (() => {
    if (!parcoursConfig) return []

    const programme = getAllProgrammes().find(
      (p) => p.levelSlug === parcoursConfig.level && p.sectionSlug === parcoursConfig.section
    )
    if (!programme) return []

    return programme.cours.map((slug) => {
      const cours = getCours(slug)
      const activities = resolveCoursActivities(slug)
      return {
        id: slug,
        title: cours.title,
        activityIds: activities.map((a) => a.id),
      }
    })
  })()

  return (
    <div className="px-4 lg:px-6">
      <OnboardingBanner />

      {/* Progress Dashboard - Client Component */}
      <DashboardClient parcours={parcours} modules={modules} />

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
