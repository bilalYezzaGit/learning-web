/**
 * Module Detail Page
 *
 * Welcome screen for the module.
 * Timeline is in layout.tsx.
 */

import Link from 'next/link'
import { notFound } from 'next/navigation'
import { ArrowLeft, BookOpen, Play, Target } from 'lucide-react'

import { Button } from '@/components/ui/button'
import { Card, CardContent } from '@/components/ui/card'
import { Badge } from '@/components/ui/badge'
import { fetchModule, ContentNotFoundError } from '@/lib/services/content-service'

interface PageProps {
  params: Promise<{ parcours: string; moduleId: string }>
}

export default async function ModuleDetailPage({ params }: PageProps) {
  const { parcours, moduleId } = await params

  let module
  try {
    module = await fetchModule(moduleId)
  } catch (e) {
    if (e instanceof ContentNotFoundError) {
      notFound()
    }
    throw e
  }

  // Get first activity for "Start" button
  const firstActivityId = module.coursePath?.[0] || module.activities[0]?.id

  return (
    <div className="flex h-full flex-col">
      {/* Back button */}
      <div className="border-b px-4 py-3 lg:px-6">
        <Button variant="ghost" size="sm" asChild>
          <Link href={`/${parcours}/apprendre`}>
            <ArrowLeft className="mr-2 h-4 w-4" />
            Retour aux modules
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
            <h1 className="text-xl font-semibold">{module.title}</h1>
            {module.description && (
              <p className="mt-2 text-muted-foreground">{module.description}</p>
            )}

            {/* Objectives */}
            {module.objectives && module.objectives.length > 0 && (
              <div className="mt-6 text-left">
                <div className="mb-2 flex items-center gap-2 text-sm font-medium">
                  <Target className="h-4 w-4" />
                  Objectifs
                </div>
                <ul className="space-y-1 text-sm text-muted-foreground">
                  {module.objectives.map((obj, i) => (
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
                {module.sections?.length || 0} sections
              </Badge>
              <Badge variant="secondary">
                {module.activities.length} activités
              </Badge>
              {module.estimatedTime && (
                <Badge variant="outline">{module.estimatedTime} min</Badge>
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
