/**
 * Module Serie Detail Page
 *
 * Welcome screen for a serie within the module context.
 * Timeline is in layout.tsx.
 */

import type { Metadata } from 'next'
import Link from 'next/link'
import { notFound } from 'next/navigation'
import { ArrowLeft, BookOpen, Play } from 'lucide-react'

import { Button } from '@/components/ui/button'
import { Card, CardContent } from '@/components/ui/card'
import { getSerie, getSerieActivities } from '@/lib/content-loader'

interface PageProps {
  params: Promise<{ parcours: string; moduleId: string; serieId: string }>
}

export async function generateMetadata({ params }: PageProps): Promise<Metadata> {
  const { serieId } = await params
  try {
    const serie = getSerie(serieId)
    return {
      title: serie.title,
      description: serie.description ?? `Série — ${serie.title}`,
    }
  } catch {
    return { title: 'Série' }
  }
}

export default async function ModuleSerieDetailPage({ params }: PageProps) {
  const { parcours, moduleId, serieId } = await params

  let serie
  try {
    serie = getSerie(serieId)
  } catch {
    notFound()
  }

  const activities = getSerieActivities(serieId)

  return (
    <div className="flex h-full flex-col">
      {/* Back button */}
      <div className="border-b px-4 py-3 lg:px-6">
        <Button variant="ghost" size="sm" asChild>
          <Link href={`/${parcours}/apprendre/${moduleId}`}>
            <ArrowLeft className="mr-2 h-4 w-4" />
            Retour au module
          </Link>
        </Button>
      </div>

      {/* Welcome content */}
      <div className="flex flex-1 items-center justify-center p-4 lg:p-6">
        <Card className="max-w-md text-center">
          <CardContent className="py-12">
            <div className="mx-auto mb-6 flex h-16 w-16 items-center justify-center rounded-full bg-primary/10">
              <BookOpen className="h-8 w-8 text-primary" />
            </div>
            <h1 className="text-xl font-semibold">{serie.title}</h1>
            {serie.description && (
              <p className="mt-2 text-muted-foreground">{serie.description}</p>
            )}
            <p className="mt-4 text-sm text-muted-foreground">
              {activities.length} activités · {serie.estimatedMinutes} min estimées
            </p>
            <Button className="mt-6" size="lg" asChild>
              <Link href={`/${parcours}/apprendre/${moduleId}/serie/${serieId}/play`}>
                <Play className="mr-2 h-4 w-4" />
                Commencer la série
              </Link>
            </Button>
          </CardContent>
        </Card>
      </div>
    </div>
  )
}
