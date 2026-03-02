/**
 * QCM Session Page — timed QCM session with random question selection.
 *
 * Loads QCM questions from raw MDX, shuffles them, and renders the
 * interactive QCM session player with countdown timer.
 */

import type { Metadata } from 'next'
import Link from 'next/link'
import { ArrowLeft, Zap } from 'lucide-react'

import { Card, CardContent } from '@/components/ui/card'
import { Button } from '@/components/ui/button'
import { selectRandomQuestions } from '@/lib/qcm-loader'
import { QcmSessionPlayer } from '@/app/app/qcm/_components/qcm-session-player'

interface PageProps {
  params: Promise<{ id: string }>
  searchParams: Promise<{ count?: string; time?: string }>
}

export async function generateMetadata({ params }: PageProps): Promise<Metadata> {
  const { id } = await params
  return { title: `QCM — ${id}` }
}

export default async function QcmSessionPage({ params, searchParams }: PageProps) {
  const { id: moduleSlug } = await params
  const { count: countParam, time: timeParam } = await searchParams

  const questionCount = parseInt(countParam ?? '10', 10)
  const timeLimitMinutes = parseInt(timeParam ?? '10', 10)

  const questions = selectRandomQuestions(moduleSlug, questionCount)

  // No questions available — show empty state
  if (questions.length === 0) {
    return (
      <div className="px-4 py-5">
        <Button variant="ghost" size="sm" asChild className="mb-4">
          <Link href="/app/qcm">
            <ArrowLeft className="mr-1.5 h-4 w-4" aria-hidden="true" />
            Retour
          </Link>
        </Button>

        <Card>
          <CardContent className="py-16 text-center">
            <Zap className="mx-auto mb-4 h-16 w-16 text-primary/30" aria-hidden="true" />
            <h1 className="text-xl font-semibold">Aucun QCM disponible</h1>
            <p className="mt-2 text-sm text-muted-foreground">
              Le module <strong>{moduleSlug}</strong> n&apos;a pas encore de questions QCM.
            </p>
            <Button asChild className="mt-6">
              <Link href="/app/qcm">
                Retour aux QCM
              </Link>
            </Button>
          </CardContent>
        </Card>
      </div>
    )
  }

  // Format module title from slug
  const moduleTitle = moduleSlug.charAt(0).toUpperCase() + moduleSlug.slice(1)

  return (
    <div className="px-4 py-5">
      <QcmSessionPlayer
        moduleSlug={moduleSlug}
        moduleTitle={moduleTitle}
        questions={questions}
        timeLimitMinutes={timeLimitMinutes}
      />
    </div>
  )
}
