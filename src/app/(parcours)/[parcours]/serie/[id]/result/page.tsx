/**
 * Serie Result Page
 *
 * Shows completion summary. For diagnostic series, shows orientation.
 */

import { notFound } from 'next/navigation'

import { PageNav } from '@/components/page-nav'
import { getCours, getSerie, getSerieActivities } from '@/lib/content-loader'
import { SerieResult } from '@/components/patterns/serie-result'

interface PageProps {
  params: Promise<{ parcours: string; id: string }>
}

export default async function SerieResultPage({ params }: PageProps) {
  const { parcours, id } = await params

  let serie
  try {
    serie = getSerie(id)
  } catch {
    notFound()
  }

  const resolvedActivities = getSerieActivities(id)
  const activityInfos = resolvedActivities.map((a) => ({ id: a.id, title: a.title, type: a.type }))
  const isDiagnostic = serie.type === 'diagnostic'

  const diagnosticModuleId = isDiagnostic ? serie.modules[0] ?? null : null
  const diagnosticModuleTitle = (() => {
    if (!diagnosticModuleId) return null
    try { return getCours(diagnosticModuleId).title } catch { return null }
  })()

  return (
    <div className="flex h-full flex-col">
      <PageNav
        items={[{ label: 'Accueil', href: `/${parcours}` }]}
        current="Resultat"
      />
      <SerieResult
        serieTitle={serie.title}
        totalActivities={resolvedActivities.length}
        activityInfos={activityInfos}
        playUrl={`/${parcours}/serie/${id}/play`}
        homeUrl={`/${parcours}`}
        homeLabel="Tableau de bord"
        isDiagnostic={isDiagnostic && !!diagnosticModuleId}
        diagnosticProps={isDiagnostic && diagnosticModuleId ? {
          parcours,
          moduleId: diagnosticModuleId,
          moduleTitle: diagnosticModuleTitle ?? diagnosticModuleId,
          qcmActivityIds: resolvedActivities.filter((a) => a.type === 'qcm').map((a) => a.id),
        } : undefined}
        showGuestCta
      />
    </div>
  )
}
