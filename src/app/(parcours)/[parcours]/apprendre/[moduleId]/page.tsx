/**
 * Module Detail Page
 *
 * Welcome screen for the module.
 * Timeline is in layout.tsx.
 */

import type { Metadata } from 'next'
import Link from 'next/link'
import { notFound } from 'next/navigation'
import { BookOpen, Play, Target } from 'lucide-react'

import { Button } from '@/components/ui/button'
import { Card, CardContent } from '@/components/ui/card'
import { Badge } from '@/components/ui/badge'
import {
  Breadcrumb,
  BreadcrumbItem,
  BreadcrumbLink,
  BreadcrumbList,
  BreadcrumbPage,
  BreadcrumbSeparator,
} from '@/components/ui/breadcrumb'
import { getCours, getCoursActivities } from '@/lib/content-loader'

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
  const firstActivityId = activities[0]?.id
  const totalAtoms = cours.sections.reduce(
    (sum, s) => sum + s.activities.length,
    0
  )

  return (
    <div className="flex h-full flex-col">
      {/* Breadcrumb */}
      <div className="border-b px-4 py-3 lg:px-6">
        <Breadcrumb>
          <BreadcrumbList>
            <BreadcrumbItem>
              <BreadcrumbLink href={`/${parcours}/apprendre`}>Apprendre</BreadcrumbLink>
            </BreadcrumbItem>
            <BreadcrumbSeparator />
            <BreadcrumbItem>
              <BreadcrumbPage>{cours.title}</BreadcrumbPage>
            </BreadcrumbItem>
          </BreadcrumbList>
        </Breadcrumb>
      </div>

      {/* Welcome content */}
      <div className="flex flex-1 items-center justify-center p-4 lg:p-6">
        <Card className="max-w-md text-center">
          <CardContent className="py-12">
            <div className="mx-auto mb-6 flex h-16 w-16 items-center justify-center rounded-full bg-primary/10">
              <BookOpen className="h-8 w-8 text-primary" />
            </div>
            <h1 className="text-xl font-semibold">{cours.title}</h1>
            {cours.description && (
              <p className="mt-2 text-muted-foreground">{cours.description}</p>
            )}

            {/* Objectives */}
            {cours.objectives && cours.objectives.length > 0 && (
              <div className="mt-6 text-left">
                <div className="mb-2 flex items-center gap-2 text-sm font-medium">
                  <Target className="h-4 w-4" />
                  Objectifs
                </div>
                <ul className="space-y-1 text-sm text-muted-foreground">
                  {cours.objectives.map((obj, i) => (
                    <li key={i} className="flex items-start gap-2">
                      <span className="text-primary">•</span>
                      {obj}
                    </li>
                  ))}
                </ul>
              </div>
            )}

            <div className="mt-4 flex flex-wrap justify-center gap-2">
              <Badge variant="secondary">
                {cours.sections.length} sections
              </Badge>
              <Badge variant="secondary">
                {totalAtoms} activités
              </Badge>
              {cours.estimatedMinutes && (
                <Badge variant="outline">{cours.estimatedMinutes} min</Badge>
              )}
            </div>

            {firstActivityId && (
              <Button className="mt-6" size="lg" asChild>
                <Link href={`/${parcours}/apprendre/${moduleId}/${firstActivityId}`}>
                  <Play className="mr-2 h-4 w-4" />
                  Commencer le module
                </Link>
              </Button>
            )}
          </CardContent>
        </Card>
      </div>
    </div>
  )
}
