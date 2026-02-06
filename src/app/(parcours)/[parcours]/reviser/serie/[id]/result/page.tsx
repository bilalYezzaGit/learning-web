/**
 * Serie Result Page
 *
 * Shows completion summary after finishing a serie.
 */

import Link from 'next/link'
import { notFound } from 'next/navigation'
import { Award, BookOpen, CheckCircle, Home, RotateCcw } from 'lucide-react'

import { Button } from '@/components/ui/button'
import { Card, CardContent } from '@/components/ui/card'
import { fetchSerie, ContentNotFoundError } from '@/lib/services/content-service'

interface PageProps {
  params: Promise<{ parcours: string; id: string }>
}

export default async function SerieResultPage({ params }: PageProps) {
  const { parcours, id } = await params

  let serie
  try {
    serie = await fetchSerie(id)
  } catch (e) {
    if (e instanceof ContentNotFoundError) {
      notFound()
    }
    throw e
  }

  // Stats - placeholder, would come from user session/progress
  const totalActivities = serie.activities.length
  const completedActivities = totalActivities // Assuming all completed when reaching this page
  const exerciseCount = serie.activities.filter((a) => a.type === 'exercise').length
  const lessonCount = serie.activities.filter((a) => a.type === 'lesson').length

  return (
    <div className="mx-auto max-w-2xl px-4 lg:px-6">
      {/* Success Header */}
      <div className="mb-8 text-center">
        <div className="mx-auto mb-4 flex h-20 w-20 items-center justify-center rounded-full bg-green-100 dark:bg-green-900/30">
          <Award className="h-10 w-10 text-green-600" />
        </div>
        <h1 className="font-serif text-3xl font-semibold">Félicitations !</h1>
        <p className="mt-2 text-lg text-muted-foreground">
          Tu as terminé la série &quot;{serie.title}&quot;
        </p>
      </div>

      {/* Stats Cards */}
      <div className="mb-8 grid gap-4 sm:grid-cols-3">
        <Card>
          <CardContent className="py-4 text-center">
            <CheckCircle className="mx-auto mb-2 h-8 w-8 text-green-600" />
            <p className="text-2xl font-bold">{completedActivities}</p>
            <p className="text-sm text-muted-foreground">Activités complétées</p>
          </CardContent>
        </Card>
        <Card>
          <CardContent className="py-4 text-center">
            <BookOpen className="mx-auto mb-2 h-8 w-8 text-blue-600" />
            <p className="text-2xl font-bold">{lessonCount}</p>
            <p className="text-sm text-muted-foreground">Cours révisés</p>
          </CardContent>
        </Card>
        <Card>
          <CardContent className="py-4 text-center">
            <CheckCircle className="mx-auto mb-2 h-8 w-8 text-amber-600" />
            <p className="text-2xl font-bold">{exerciseCount}</p>
            <p className="text-sm text-muted-foreground">Exercices résolus</p>
          </CardContent>
        </Card>
      </div>

      {/* Encouragement */}
      <Card className="mb-8 bg-primary/5">
        <CardContent className="py-6 text-center">
          <p className="text-lg font-medium">
            Continue comme ça !
          </p>
          <p className="mt-1 text-muted-foreground">
            Chaque série complétée te rapproche de la maîtrise.
          </p>
        </CardContent>
      </Card>

      {/* Actions */}
      <div className="flex flex-col gap-3 sm:flex-row sm:justify-center">
        <Button variant="outline" asChild>
          <Link href={`/${parcours}/reviser/serie/${id}/play`}>
            <RotateCcw className="mr-2 h-4 w-4" />
            Refaire la série
          </Link>
        </Button>
        <Button asChild>
          <Link href={`/${parcours}/reviser`}>
            <Home className="mr-2 h-4 w-4" />
            Autres séries
          </Link>
        </Button>
      </div>

      {/* Guest CTA */}
      <div className="mt-8 rounded-lg border bg-muted/30 p-4 text-center">
        <p className="text-sm text-muted-foreground">
          Connecte-toi pour sauvegarder ta progression et suivre tes statistiques.
        </p>
        <Button variant="link" className="mt-1" asChild>
          <Link href="/login">Se connecter</Link>
        </Button>
      </div>
    </div>
  )
}
