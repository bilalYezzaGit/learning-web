/**
 * Module Serie Result Page
 *
 * Shows completion summary after finishing a serie within the module context.
 * For diagnostic series, shows orientation based on score.
 */

import Link from 'next/link'
import { notFound } from 'next/navigation'
import { Award, Home, RotateCcw } from 'lucide-react'

import { Button } from '@/components/ui/button'
import { Card, CardContent } from '@/components/ui/card'
import { getCours, getSerie, getSerieActivities } from '@/lib/content-loader'
import { ResultDetails } from '@/components/patterns/result-details'
import { DiagnosticOrientation } from '@/components/patterns/diagnostic-orientation'

interface PageProps {
  params: Promise<{ parcours: string; moduleId: string; serieId: string }>
}

export default async function ModuleSerieResultPage({ params }: PageProps) {
  const { parcours, moduleId, serieId } = await params

  let serie
  try {
    serie = getSerie(serieId)
  } catch {
    notFound()
  }

  const resolvedActivities = getSerieActivities(serieId)
  const totalActivities = resolvedActivities.length
  const activityInfos = resolvedActivities.map((a) => ({
    id: a.id,
    title: a.title,
    type: a.type,
  }))

  const isDiagnostic = serie.type === 'diagnostic'

  // For diagnostic: extract module info and QCM activity IDs
  const diagnosticModuleId = isDiagnostic ? serie.modules[0] ?? null : null
  const diagnosticModuleTitle = (() => {
    if (!diagnosticModuleId) return null
    try {
      return getCours(diagnosticModuleId).title
    } catch {
      return null
    }
  })()
  const qcmActivityIds = isDiagnostic
    ? resolvedActivities.filter((a) => a.type === 'qcm').map((a) => a.id)
    : []

  // Diagnostic result page
  if (isDiagnostic && diagnosticModuleId) {
    return (
      <div className="mx-auto max-w-2xl px-4 py-8 lg:px-6">
        {/* Diagnostic Header */}
        <div className="mb-8 text-center">
          <h1 className="text-balance font-serif text-3xl font-semibold">Résultat du diagnostic</h1>
          {diagnosticModuleTitle && (
            <p className="mt-2 text-lg text-muted-foreground">{diagnosticModuleTitle}</p>
          )}
        </div>

        {/* Orientation */}
        <div className="mb-8">
          <DiagnosticOrientation
            parcours={parcours}
            moduleId={diagnosticModuleId}
            moduleTitle={diagnosticModuleTitle ?? diagnosticModuleId}
            qcmActivityIds={qcmActivityIds}
          />
        </div>

        {/* Per-activity detail */}
        <div className="mb-8">
          <ResultDetails activities={activityInfos} />
        </div>

        {/* Actions */}
        <div className="flex flex-col gap-3 sm:flex-row sm:justify-center">
          <Button variant="outline" asChild>
            <Link href={`/${parcours}/apprendre/${moduleId}/serie/${serieId}/play`}>
              <RotateCcw className="mr-2 h-4 w-4" aria-hidden="true" />
              Refaire le diagnostic
            </Link>
          </Button>
          <Button asChild>
            <Link href={`/${parcours}/apprendre/${moduleId}`}>
              <Home className="mr-2 h-4 w-4" aria-hidden="true" />
              Retour au module
            </Link>
          </Button>
        </div>
      </div>
    )
  }

  // Standard result page (mono-module serie)
  return (
    <div className="mx-auto max-w-2xl px-4 lg:px-6">
      {/* Success Header */}
      <div className="mb-8 text-center">
        <div className="mx-auto mb-4 flex h-20 w-20 items-center justify-center rounded-full bg-success/10">
          <Award className="h-10 w-10 text-success" aria-hidden="true" />
        </div>
        <h1 className="text-balance font-serif text-3xl font-semibold">Félicitations !</h1>
        <p className="mt-2 text-lg text-muted-foreground">
          Tu as terminé la série &quot;{serie.title}&quot;
        </p>
        <p className="mt-1 text-sm text-muted-foreground">
          {totalActivities} activités parcourues
        </p>
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

      {/* Per-activity detail */}
      <div className="mb-8">
        <ResultDetails activities={activityInfos} />
      </div>

      {/* Actions */}
      <div className="flex flex-col gap-3 sm:flex-row sm:justify-center">
        <Button variant="outline" asChild>
          <Link href={`/${parcours}/apprendre/${moduleId}/serie/${serieId}/play`}>
            <RotateCcw className="mr-2 h-4 w-4" aria-hidden="true" />
            Refaire la série
          </Link>
        </Button>
        <Button asChild>
          <Link href={`/${parcours}/apprendre/${moduleId}`}>
            <Home className="mr-2 h-4 w-4" aria-hidden="true" />
            Retour au module
          </Link>
        </Button>
      </div>
    </div>
  )
}
