import type { RawAtom, RawLivret, RawStep, ResolvedActivity, ResolvedLivret } from '../types.js'

function resolveSteps(steps: RawStep[], atomMap: Map<string, RawAtom>, sectionId?: string): ResolvedActivity[] {
  const activities: ResolvedActivity[] = []

  for (const step of steps) {
    if (typeof step === 'object' && 'quiz' in step) {
      const firstId = step.quiz[0]
      if (!firstId) continue
      const atoms = step.quiz.map(id => atomMap.get(id)).filter((a): a is RawAtom => a !== undefined)
      const totalTime = atoms.reduce((sum, a) => sum + a.timeMinutes, 0)
      const firstAtom = atoms[0]
      activities.push({
        id: firstId,
        type: 'qcm',
        title: `QCM (${step.quiz.length} questions)`,
        timeMinutes: totalTime,
        difficulty: firstAtom?.difficulty ?? 1,
        tags: firstAtom?.tags ?? [],
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
        difficulty: atom.difficulty,
        category: atom.category,
        tags: atom.tags,
        sectionId,
      })
    }
  }

  return activities
}

export function resolveAllLivrets(livretsList: RawLivret[], atomMap: Map<string, RawAtom>): ResolvedLivret[] {
  return livretsList.map(livret => {
    const sections = livret.sections.map((section, i) => {
      const sectionId = `section-${i}`
      return {
        id: sectionId,
        label: section.label,
        activities: resolveSteps(section.steps, atomMap, sectionId),
      }
    })

    const totalActivities = sections.reduce((sum, s) => sum + s.activities.length, 0)

    // If estimatedMinutes is not set, compute from atom times
    const estimatedMinutes = livret.estimatedMinutes
      ?? sections.reduce((sum, s) =>
        sum + s.activities.reduce((aSum, a) => aSum + a.timeMinutes, 0), 0)

    return {
      slug: livret.slug,
      title: livret.title,
      description: livret.description,
      programme: livret.programme,
      trimester: livret.trimester,
      order: livret.order,
      difficulty: livret.difficulty,
      estimatedMinutes,
      tags: livret.tags,
      objectives: livret.objectives,
      visible: livret.visible,
      sections,
      totalActivities,
    }
  })
}
