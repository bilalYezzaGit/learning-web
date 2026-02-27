import type { RawProgramme, ResolvedCours, ResolvedSerie, Catalogue } from '../types.js'

export function assembleCatalogues(
  programmes: RawProgramme[],
  coursList: ResolvedCours[],
  seriesList: ResolvedSerie[],
): Catalogue[] {
  const coursMap = new Map(coursList.map(c => [c.slug, c]))
  const seriesMap = new Map(seriesList.map(s => [s.slug, s]))

  return programmes.map(prog => {
    const modules = prog.cours
      .map(slug => coursMap.get(slug))
      .filter((c): c is ResolvedCours => c !== undefined)
      .map(c => {
        const activityIds = c.sections.flatMap(s =>
          s.activities.map(a => a.id)
        )
        return {
          slug: c.slug,
          title: c.title,
          trimester: c.trimester,
          order: c.order,
          totalActivities: c.totalActivities,
          estimatedMinutes: c.estimatedMinutes,
          activityIds,
          visible: c.visible,
        }
      })

    const series = prog.series
      .map(slug => seriesMap.get(slug))
      .filter((s): s is ResolvedSerie => s !== undefined)
      .map(s => ({
        slug: s.slug,
        title: s.title,
        difficulty: s.difficulty,
        type: s.type,
        trimestre: s.trimestre,
        totalActivities: s.totalActivities,
        estimatedMinutes: s.estimatedMinutes,
        modules: s.modules,
        visible: s.visible,
      }))

    return {
      id: prog.id,
      label: prog.label,
      levelSlug: prog.levelSlug,
      sectionSlug: prog.sectionSlug,
      order: prog.order,
      color: prog.color,
      icon: prog.icon,
      visible: prog.visible,
      modules,
      series,
    }
  })
}
