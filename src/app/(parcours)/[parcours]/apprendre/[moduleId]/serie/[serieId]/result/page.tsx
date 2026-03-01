/**
 * Module Serie Result Page
 *
 * Shows completion summary. For diagnostic series, shows orientation.
 */

import { notFound } from 'next/navigation'

import { PageNav } from '@/app/(parcours)/_components/page-nav'
import { getCours, getSerie, getSerieActivities } from '@/lib/content-loader'
import { SerieResult } from '@/app/(parcours)/_components/serie-result'

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
  const activityInfos = resolvedActivities.map((a) => ({ id: a.id, title: a.title, type: a.type }))
  const isDiagnostic = serie.type === 'diagnostic'

  const diagnosticModuleId = isDiagnostic ? serie.modules[0] ?? null : null
  const diagnosticModuleTitle = (() => {
    if (!diagnosticModuleId) return null
    try { return getCours(diagnosticModuleId).title } catch { return null }
  })()

  let coursTitle = moduleId
  try {
    coursTitle = getCours(moduleId).title
  } catch { /* fallback to moduleId */ }

  return (
    <div className="flex h-full flex-col">
      <PageNav
        items={[
          { label: 'Accueil', href: `/${parcours}` },
          { label: coursTitle, href: `/${parcours}/apprendre/${moduleId}` },
        ]}
        current="Resultat"
        compact
      />
      <SerieResult
        serieTitle={serie.title}
        totalActivities={resolvedActivities.length}
        activityInfos={activityInfos}
        playUrl={`/${parcours}/apprendre/${moduleId}/serie/${serieId}/${resolvedActivities[0]?.id}`}
        homeUrl={`/${parcours}/apprendre/${moduleId}`}
        homeLabel="Retour au module"
        isDiagnostic={isDiagnostic && !!diagnosticModuleId}
        diagnosticProps={isDiagnostic && diagnosticModuleId ? {
          parcours,
          moduleId: diagnosticModuleId,
          moduleTitle: diagnosticModuleTitle ?? diagnosticModuleId,
          qcmActivityIds: resolvedActivities.filter((a) => a.type === 'qcm').map((a) => a.id),
        } : undefined}
      />
    </div>
  )
}
