import type { RawAtom, RawSerie, RawStep, ResolvedActivity, ResolvedSerie } from '../types.js'

function resolveSteps(steps: RawStep[], atomMap: Map<string, RawAtom>): ResolvedActivity[] {
  const activities: ResolvedActivity[] = []

  for (const step of steps) {
    if (typeof step === 'object' && 'quiz' in step) {
      const firstId = step.quiz[0]
      if (!firstId) continue
      const totalTime = step.quiz.reduce((sum, id) => {
        const atom = atomMap.get(id)
        return sum + (atom?.timeMinutes ?? 1)
      }, 0)
      activities.push({
        id: firstId,
        type: 'qcm',
        title: `QCM (${step.quiz.length} questions)`,
        timeMinutes: totalTime,
        quizAtomIds: step.quiz,
      })
    } else {
      const atom = atomMap.get(step)
      if (!atom) continue
      activities.push({
        id: atom.id,
        type: atom.type,
        title: atom.title,
        timeMinutes: atom.timeMinutes,
      })
    }
  }

  return activities
}

export function resolveAllSeries(
  seriesList: RawSerie[],
  atomMap: Map<string, RawAtom>,
): ResolvedSerie[] {
  return seriesList.map(serie => {
    const activities = resolveSteps(serie.steps, atomMap)
    return {
      slug: serie.slug,
      title: serie.title,
      description: serie.description,
      difficulty: serie.difficulty,
      estimatedMinutes: serie.estimatedMinutes,
      tags: serie.tags,
      type: serie.type,
      trimestre: serie.trimestre,
      modules: serie.modules,
      priority: serie.priority,
      activities,
      totalActivities: activities.length,
      successThreshold: (serie as RawSerie & { successThreshold?: number }).successThreshold ?? 70,
    }
  })
}
