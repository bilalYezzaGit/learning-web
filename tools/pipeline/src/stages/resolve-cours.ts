import type { RawAtom, RawCours, RawStep, ResolvedActivity, ResolvedCours } from '../types.js'

function resolveSteps(steps: RawStep[], atomMap: Map<string, RawAtom>, sectionId?: string): ResolvedActivity[] {
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
        sectionId,
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
        sectionId,
      })
    }
  }

  return activities
}

export function resolveAllCours(coursList: RawCours[], atomMap: Map<string, RawAtom>): ResolvedCours[] {
  return coursList.map(cours => {
    const sections = cours.sections.map((section, i) => {
      const sectionId = `section-${i}`
      return {
        id: sectionId,
        label: section.label,
        activities: resolveSteps(section.steps, atomMap, sectionId),
      }
    })

    const totalActivities = sections.reduce((sum, s) => sum + s.activities.length, 0)

    return {
      slug: cours.slug,
      title: cours.title,
      description: cours.description,
      programme: cours.programme,
      trimester: cours.trimester,
      order: cours.order,
      estimatedMinutes: cours.estimatedMinutes,
      objectives: cours.objectives,
      sections,
      totalActivities,
    }
  })
}
