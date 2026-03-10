import type { RawProgramme, ResolvedLivret, Catalogue } from '../types.js'

export function assembleCatalogues(
  programmes: RawProgramme[],
  livretsList: ResolvedLivret[],
): Catalogue[] {
  const livretsMap = new Map(livretsList.map(l => [l.slug, l]))

  return programmes.map(prog => {
    const livrets = prog.livrets
      .map(slug => livretsMap.get(slug))
      .filter((l): l is ResolvedLivret => l !== undefined)
      .map(l => {
        const activityIds = l.sections.flatMap(s =>
          s.activities.map(a => a.id)
        )
        return {
          slug: l.slug,
          title: l.title,
          trimester: l.trimester,
          order: l.order,
          difficulty: l.difficulty,
          totalActivities: l.totalActivities,
          estimatedMinutes: l.estimatedMinutes,
          activityIds,
          visible: l.visible,
        }
      })

    return {
      id: prog.id,
      label: prog.label,
      levelSlug: prog.levelSlug,
      sectionSlug: prog.sectionSlug,
      order: prog.order,
      color: prog.color,
      icon: prog.icon,
      visible: prog.visible,
      livrets,
    }
  })
}
