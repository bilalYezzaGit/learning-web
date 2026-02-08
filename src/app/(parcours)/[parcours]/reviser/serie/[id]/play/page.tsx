/**
 * Serie Player Page
 *
 * Server Component that pre-resolves all activities and passes
 * compiled content to the interactive client player.
 */

import { notFound } from 'next/navigation'

import { getSerie, resolveSerieActivities, getAtom, compileQuiz } from '@/lib/content'
import { compileMdx } from '@/lib/mdx'
import type { CompiledQuiz } from '@/types/content'
import { SeriePlayer } from './serie-player'

interface PageProps {
  params: Promise<{ parcours: string; id: string }>
}

export default async function SeriePlayPage({ params }: PageProps) {
  const { parcours, id } = await params

  let serie
  try {
    serie = getSerie(id)
  } catch {
    notFound()
  }

  const activities = resolveSerieActivities(id)

  // Pre-compile all activity content
  const compiledActivities = await Promise.all(
    activities.map(async (activity) => {
      if (activity.type === 'qcm' && activity.quizAtomIds) {
        // Quiz: compile structured data
        const quiz = await compileQuiz(activity.quizAtomIds)
        return {
          id: activity.id,
          type: activity.type,
          title: activity.title,
          timeMinutes: activity.timeMinutes,
          quiz,
          content: null as React.ReactNode,
        }
      } else {
        // Lesson or exercise: compile MDX
        const atom = getAtom(activity.id)
        const content = await compileMdx(atom.content)
        return {
          id: activity.id,
          type: activity.type,
          title: activity.title,
          timeMinutes: activity.timeMinutes,
          quiz: null as CompiledQuiz | null,
          content: (
            <article className="prose prose-stone dark:prose-invert max-w-none">
              {content}
            </article>
          ),
        }
      }
    })
  )

  return (
    <SeriePlayer
      serieSlug={id}
      serieTitle={serie.title}
      activities={compiledActivities}
      parcours={parcours}
    />
  )
}
