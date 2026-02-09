/**
 * Parcours Dashboard Page
 *
 * Learner dashboard for a specific parcours.
 * Includes AI Performance Coach for personalized insights.
 */

import Link from 'next/link'
import { ArrowRight, BookOpen, Brain } from 'lucide-react'

import { Button } from '@/components/ui/button'
import { Card, CardContent, CardDescription, CardHeader, CardTitle } from '@/components/ui/card'
import { getParcoursConfig } from '@/lib/parcours'
import { DashboardCoach } from './dashboard-coach'

interface PageProps {
  params: Promise<{ parcours: string }>
}

export default async function ParcoursDashboardPage({ params }: PageProps) {
  const { parcours } = await params
  const parcoursConfig = getParcoursConfig(parcours)

  return (
    <div className="px-4 lg:px-6">
      {/* Continue Learning - Main CTA */}
      <Card className="mb-6 border-primary/20 bg-primary/5">
        <CardContent className="py-6">
          <div className="flex flex-col gap-4 sm:flex-row sm:items-center sm:justify-between">
            <div className="flex items-center gap-4">
              <div className="flex h-14 w-14 items-center justify-center rounded-xl bg-primary text-primary-foreground">
                <BookOpen className="h-7 w-7" aria-hidden="true" />
              </div>
              <div>
                <p className="text-sm text-muted-foreground">Reprendre</p>
                <p className="text-lg font-semibold">
                  {parcoursConfig ? `Programme ${parcoursConfig.label}` : 'Commencez votre apprentissage'}
                </p>
                <p className="text-sm text-muted-foreground">
                  Explorez les modules disponibles
                </p>
              </div>
            </div>
            <Button size="lg" asChild>
              <Link href={`/${parcours}/apprendre`}>
                Continuer
                <ArrowRight className="ml-2 h-4 w-4" aria-hidden="true" />
              </Link>
            </Button>
          </div>
        </CardContent>
      </Card>

      {/* AI Performance Coach */}
      <DashboardCoach parcours={parcours} />

      {/* Quick Actions */}
      <div className="grid gap-4 sm:grid-cols-2">
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
                  <CardTitle className="text-base">Réviser</CardTitle>
                  <CardDescription>QCM et séries d&apos;entraînement</CardDescription>
                </div>
              </div>
            </CardHeader>
          </Link>
        </Card>
      </div>
    </div>
  )
}
