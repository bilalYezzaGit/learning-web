import Link from 'next/link'
import { Award, Home, RotateCcw } from 'lucide-react'

import { Button } from '@/components/ui/button'
import { Card, CardContent } from '@/components/ui/card'
import { ResultDetails } from '@/app/(parcours)/_components/result-details'
import { DiagnosticOrientation } from '@/app/(parcours)/_components/diagnostic-orientation'
import type { AtomType } from '@/types/content'

interface ActivityInfo {
  id: string
  title: string
  type: AtomType
}

interface SerieResultProps {
  serieTitle: string
  totalActivities: number
  activityInfos: ActivityInfo[]
  playUrl: string
  homeUrl: string
  homeLabel: string
  isDiagnostic?: boolean
  diagnosticProps?: {
    parcours: string
    moduleId: string
    moduleTitle: string
    qcmActivityIds: string[]
  }
  showGuestCta?: boolean
}

export function SerieResult({
  serieTitle,
  totalActivities,
  activityInfos,
  playUrl,
  homeUrl,
  homeLabel,
  isDiagnostic,
  diagnosticProps,
  showGuestCta,
}: SerieResultProps) {
  // Diagnostic result
  if (isDiagnostic && diagnosticProps) {
    return (
      <div className="mx-auto max-w-2xl px-4 py-8 lg:px-6">
        <div className="mb-8 text-center">
          <h1 className="text-balance font-serif text-3xl font-semibold">Resultat du diagnostic</h1>
          <p className="mt-2 text-lg text-muted-foreground">{diagnosticProps.moduleTitle}</p>
        </div>

        <div className="mb-8">
          <DiagnosticOrientation
            parcours={diagnosticProps.parcours}
            moduleId={diagnosticProps.moduleId}
            moduleTitle={diagnosticProps.moduleTitle}
            qcmActivityIds={diagnosticProps.qcmActivityIds}
          />
        </div>

        <div className="mb-8">
          <ResultDetails activities={activityInfos} />
        </div>

        <div className="flex flex-col gap-3 sm:flex-row sm:justify-center">
          <Button variant="outline" asChild>
            <Link href={playUrl}>
              <RotateCcw className="mr-2 h-4 w-4" aria-hidden="true" />
              Refaire le diagnostic
            </Link>
          </Button>
          <Button asChild>
            <Link href={homeUrl}>
              <Home className="mr-2 h-4 w-4" aria-hidden="true" />
              {homeLabel}
            </Link>
          </Button>
        </div>
      </div>
    )
  }

  // Standard result
  return (
    <div className="mx-auto max-w-2xl px-4 lg:px-6">
      <div className="mb-8 text-center">
        <div className="mx-auto mb-4 flex h-20 w-20 items-center justify-center rounded-full bg-success/10">
          <Award className="h-10 w-10 text-success" aria-hidden="true" />
        </div>
        <h1 className="text-balance font-serif text-3xl font-semibold">Felicitations !</h1>
        <p className="mt-2 text-lg text-muted-foreground">
          Tu as termine la serie &quot;{serieTitle}&quot;
        </p>
        <p className="mt-1 text-sm text-muted-foreground">
          {totalActivities} activites parcourues
        </p>
      </div>

      <Card className="mb-8 bg-primary/5">
        <CardContent className="py-6 text-center">
          <p className="text-lg font-medium">Continue comme ca !</p>
          <p className="mt-1 text-muted-foreground">
            Chaque serie completee te rapproche de la maitrise.
          </p>
        </CardContent>
      </Card>

      <div className="mb-8">
        <ResultDetails activities={activityInfos} />
      </div>

      <div className="flex flex-col gap-3 sm:flex-row sm:justify-center">
        <Button variant="outline" asChild>
          <Link href={playUrl}>
            <RotateCcw className="mr-2 h-4 w-4" aria-hidden="true" />
            Refaire la serie
          </Link>
        </Button>
        <Button asChild>
          <Link href={homeUrl}>
            <Home className="mr-2 h-4 w-4" aria-hidden="true" />
            {homeLabel}
          </Link>
        </Button>
      </div>

      {showGuestCta && (
        <div className="mt-8 rounded-lg border bg-muted/30 p-4 text-center">
          <p className="text-sm text-muted-foreground">
            Connecte-toi pour sauvegarder ta progression et suivre tes statistiques.
          </p>
          <Button variant="link" className="mt-1" asChild>
            <Link href="/login">Se connecter</Link>
          </Button>
        </div>
      )}
    </div>
  )
}
