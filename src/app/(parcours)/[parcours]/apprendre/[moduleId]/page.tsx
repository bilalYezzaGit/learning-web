/**
 * Module Page
 *
 * Direct landing for a module: shows notions (sections) and series.
 * No intermediate pages — sections link directly into the timeline.
 */

import type { Metadata } from 'next'
import { notFound } from 'next/navigation'

import {
  Breadcrumb,
  BreadcrumbItem,
  BreadcrumbLink,
  BreadcrumbList,
  BreadcrumbPage,
  BreadcrumbSeparator,
} from '@/components/ui/breadcrumb'
import {
  getCours,
  getCoursActivities,
  getAllProgrammes,
  getSerie,
} from '@/lib/content-loader'
import { getParcoursConfig } from '@/lib/parcours'

import { ModuleAccueilClient } from './module-accueil-client'

interface PageProps {
  params: Promise<{ parcours: string; moduleId: string }>
}

export async function generateMetadata({ params }: PageProps): Promise<Metadata> {
  const { moduleId } = await params
  try {
    const cours = getCours(moduleId)
    return {
      title: cours.title,
      description: cours.description ?? `Module ${cours.title} — cours, exercices et QCM interactifs.`,
    }
  } catch {
    return { title: 'Module' }
  }
}

export default async function ModuleDetailPage({ params }: PageProps) {
  const { parcours, moduleId } = await params

  let cours
  try {
    cours = getCours(moduleId)
  } catch {
    notFound()
  }

  const activities = getCoursActivities(moduleId)

  // Enriched sections with per-type counts
  const sections = cours.sections.map((s, i) => {
    const lessonCount = s.activities.filter((a) => a.type === 'lesson').length
    const exerciseCount = s.activities.filter((a) => a.type === 'exercise').length
    const qcmCount = s.activities.filter((a) => a.type === 'qcm').length

    return {
      id: s.id,
      label: s.label,
      order: i + 1,
      lessonCount,
      exerciseCount,
      qcmCount,
      firstActivityId: s.activities[0]?.id ?? null,
      activityIds: s.activities.map((a) => a.id),
    }
  })

  // Find programme for this parcours to access series
  const parcoursConfig = getParcoursConfig(parcours)
  const programme = (() => {
    if (!parcoursConfig) return null
    return getAllProgrammes().find(
      (p) => p.levelSlug === parcoursConfig.level && p.sectionSlug === parcoursConfig.section
    ) ?? null
  })()

  // All series for this module
  const allModuleSeries = programme
    ? programme.series
        .map((slug) => {
          try {
            return getSerie(slug)
          } catch {
            return null
          }
        })
        .filter((s) => s !== null)
        .filter((s) => s.modules.includes(moduleId) && s.visible)
    : []

  // Extract diagnostic (if any) — separate from regular series
  const diagnosticSerie = allModuleSeries.find((s) => s.type === 'diagnostic') ?? null
  const diagnostic = diagnosticSerie
    ? {
        id: diagnosticSerie.slug,
        title: diagnosticSerie.title,
        description: diagnosticSerie.description,
        estimatedMinutes: diagnosticSerie.estimatedMinutes,
        questionCount: diagnosticSerie.totalActivities,
      }
    : null

  // Regular series (exclude diagnostics)
  const moduleSeries = allModuleSeries
    .filter((s) => s.type !== 'diagnostic')
    .map((s) => ({
      id: s.slug,
      title: s.title,
      description: s.description,
      difficulty: s.difficulty,
      estimatedMinutes: s.estimatedMinutes,
      activityCount: s.totalActivities,
    }))

  // Course info
  const coursInfo = {
    title: cours.title,
    description: cours.description,
    objectives: cours.objectives,
    estimatedMinutes: cours.estimatedMinutes,
  }

  const totalActivities = activities.length

  return (
    <div className="flex min-h-full flex-col">
      {/* Breadcrumb */}
      <div className="border-b px-4 py-3 lg:px-6">
        <Breadcrumb>
          <BreadcrumbList>
            <BreadcrumbItem>
              <BreadcrumbLink href={`/${parcours}`}>Accueil</BreadcrumbLink>
            </BreadcrumbItem>
            <BreadcrumbSeparator />
            <BreadcrumbItem>
              <BreadcrumbPage>{cours.title}</BreadcrumbPage>
            </BreadcrumbItem>
          </BreadcrumbList>
        </Breadcrumb>
      </div>

      {/* Content */}
      <div className="flex-1">
        <div className="mx-auto max-w-2xl p-4 lg:p-6">
          <ModuleAccueilClient
            parcours={parcours}
            moduleId={moduleId}
            coursInfo={coursInfo}
            sections={sections}
            totalActivities={totalActivities}
            moduleSeries={moduleSeries}
            diagnostic={diagnostic}
          />
        </div>
      </div>
    </div>
  )
}
