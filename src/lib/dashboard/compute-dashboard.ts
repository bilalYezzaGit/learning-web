/**
 * Dashboard computation engine
 *
 * Pure functions that compute dashboard widget data from:
 * - User progress (ProgressMap from Firestore)
 * - Content metadata (modules, series, atoms — resolved by server)
 *
 * All functions are deterministic and side-effect free.
 */

import type { ProgressMap } from '@/lib/services/progress-service'
import type {
  DashboardModuleInfo,
  DashboardSeriesInfo,
  DashboardData,
  NextActivity,
  GlobalProgress,
  ModuleProgress,
  LearningStats,
  LearningTag,
  StrengthsAnalysis,
  RecommendedSeries,
  AnalysisStatus,
} from '@/types/dashboard'

// =============================================================================
// Atom metadata passed from server for tag-based analysis
// =============================================================================

export interface DashboardAtomInfo {
  id: string
  type: 'lesson' | 'exercise' | 'qcm'
  title: string
  tags: string[]
  difficulty: number
}

// =============================================================================
// Input type
// =============================================================================

export interface ComputeDashboardInput {
  progress: ProgressMap
  modules: DashboardModuleInfo[]
  series: DashboardSeriesInfo[]
  atoms: DashboardAtomInfo[]
}

// =============================================================================
// Main computation
// =============================================================================

export function computeDashboard(input: ComputeDashboardInput): DashboardData {
  const { progress, modules, series, atoms } = input

  const atomMap = new Map(atoms.map((a) => [a.id, a]))

  const globalProgress = computeGlobalProgress(progress, modules)
  const learningStats = computeLearningStats(progress)
  const strengths = computeStrengths(progress, atoms, atomMap, modules)
  const nextActivity = computeNextActivity(progress, modules, atomMap)
  const recommendedSeries = computeRecommendedSeries(progress, series, strengths)
  const analysisStatus = computeAnalysisStatus(progress)

  return {
    nextActivity,
    globalProgress,
    learningStats,
    strengths,
    recommendedSeries,
    analysisStatus,
  }
}

// =============================================================================
// Global Progress
// =============================================================================

function computeGlobalProgress(
  progress: ProgressMap,
  modules: DashboardModuleInfo[],
): GlobalProgress {
  const moduleProgresses: ModuleProgress[] = modules.map((mod) => {
    const done = mod.activityIds.filter((id) => progress.has(id)).length
    const total = mod.activityIds.length
    return {
      id: mod.id,
      title: mod.title,
      trimester: mod.trimester,
      done,
      total,
      percentage: total > 0 ? Math.round((done / total) * 100) : 0,
    }
  })

  const totalActivities = modules.reduce((sum, m) => sum + m.activityIds.length, 0)
  const completedActivities = moduleProgresses.reduce((sum, m) => sum + m.done, 0)
  const completedModules = moduleProgresses.filter((m) => m.done === m.total && m.total > 0).length
  const inProgressModules = moduleProgresses.filter((m) => m.done > 0 && m.done < m.total).length

  return {
    percentage: totalActivities > 0 ? Math.round((completedActivities / totalActivities) * 100) : 0,
    totalActivities,
    completedActivities,
    totalModules: modules.length,
    completedModules,
    inProgressModules,
    modules: moduleProgresses,
  }
}

// =============================================================================
// Learning Stats
// =============================================================================

function computeLearningStats(progress: ProgressMap): LearningStats {
  let exercisesCompleted = 0
  let qcmsCompleted = 0
  let lessonsCompleted = 0
  let totalAttempts = 0
  let qcmScoreSum = 0
  let qcmCount = 0
  let lastActivityDate: string | null = null

  const activityDates = new Set<string>()

  for (const p of progress.values()) {
    switch (p.activityType) {
      case 'exercise':
        exercisesCompleted++
        break
      case 'qcm':
        qcmsCompleted++
        if (p.score !== undefined) {
          qcmScoreSum += p.score
          qcmCount++
        }
        break
      case 'lesson':
        lessonsCompleted++
        break
    }

    totalAttempts += p.attempts

    if (p.lastDoneAt) {
      if (!lastActivityDate || p.lastDoneAt > lastActivityDate) {
        lastActivityDate = p.lastDoneAt
      }
      // Track unique days for regularity
      const day = p.lastDoneAt.slice(0, 10) // YYYY-MM-DD
      activityDates.add(day)

      // Also track days from contexts
      for (const ctx of p.contexts) {
        if (ctx.doneAt) {
          activityDates.add(ctx.doneAt.slice(0, 10))
        }
      }
    }
  }

  // Active days in last 30 days
  const now = new Date()
  const thirtyDaysAgo = new Date(now.getTime() - 30 * 24 * 60 * 60 * 1000)
  const thirtyDaysAgoStr = thirtyDaysAgo.toISOString().slice(0, 10)
  const activeDaysLast30 = Array.from(activityDates).filter((d) => d >= thirtyDaysAgoStr).length

  // Current streak (consecutive days ending today or yesterday)
  const currentStreak = computeStreak(activityDates)

  return {
    exercisesCompleted,
    qcmsCompleted,
    lessonsCompleted,
    averageQcmScore: qcmCount > 0 ? Math.round(qcmScoreSum / qcmCount) : null,
    totalAttempts,
    activeDaysLast30,
    lastActivityDate,
    currentStreak,
  }
}

function computeStreak(activityDates: Set<string>): number {
  if (activityDates.size === 0) return 0

  const today = new Date()
  const todayStr = today.toISOString().slice(0, 10)

  // Start from today or yesterday
  const checkDate = new Date(today)
  if (!activityDates.has(todayStr)) {
    checkDate.setDate(checkDate.getDate() - 1)
    if (!activityDates.has(checkDate.toISOString().slice(0, 10))) {
      return 0
    }
  }

  let streak = 0
  while (activityDates.has(checkDate.toISOString().slice(0, 10))) {
    streak++
    checkDate.setDate(checkDate.getDate() - 1)
  }

  return streak
}

// =============================================================================
// Strengths & Weaknesses
// =============================================================================

function computeStrengths(
  progress: ProgressMap,
  atoms: DashboardAtomInfo[],
  atomMap: Map<string, DashboardAtomInfo>,
  modules: DashboardModuleInfo[],
): StrengthsAnalysis {
  // Build tag -> activity stats map
  const tagStats = new Map<string, {
    tag: string
    moduleIds: Set<string>
    scores: number[]
    attempted: number
    succeeded: number
  }>()

  for (const p of progress.values()) {
    const atom = atomMap.get(p.activityId)
    if (!atom) continue

    // Find which modules reference this activity
    const relatedModules = modules
      .filter((m) => m.activityIds.includes(p.activityId))
      .map((m) => m.id)

    for (const tag of atom.tags) {
      let stat = tagStats.get(tag)
      if (!stat) {
        stat = { tag, moduleIds: new Set(), scores: [], attempted: 0, succeeded: 0 }
        tagStats.set(tag, stat)
      }
      stat.attempted++
      if (p.status === 'success') stat.succeeded++
      if (p.score !== undefined) stat.scores.push(p.score)
      for (const mid of relatedModules) stat.moduleIds.add(mid)
    }
  }

  // Convert to LearningTag[] and sort
  const tags: LearningTag[] = Array.from(tagStats.values())
    .filter((s) => s.attempted >= 2) // Need at least 2 activities to be meaningful
    .map((s) => ({
      tag: s.tag,
      moduleIds: Array.from(s.moduleIds),
      averageScore: s.scores.length > 0
        ? Math.round(s.scores.reduce((a, b) => a + b, 0) / s.scores.length)
        : Math.round((s.succeeded / s.attempted) * 100),
      activitiesAttempted: s.attempted,
      activitiesSucceeded: s.succeeded,
    }))

  // Sort by score descending for strengths, ascending for weaknesses
  const sorted = [...tags].sort((a, b) => b.averageScore - a.averageScore)

  const strengths = sorted.filter((t) => t.averageScore >= 70).slice(0, 5)
  const weaknesses = sorted.filter((t) => t.averageScore < 70).reverse().slice(0, 5)

  return { strengths, weaknesses }
}

// =============================================================================
// Next Activity
// =============================================================================

function computeNextActivity(
  progress: ProgressMap,
  modules: DashboardModuleInfo[],
  atomMap: Map<string, DashboardAtomInfo>,
): NextActivity | null {
  if (modules.length === 0) return null

  // 1. Find activities that need retry (status === 'retry')
  for (const mod of modules) {
    for (const actId of mod.activityIds) {
      const p = progress.get(actId)
      if (p?.status === 'retry') {
        const atom = atomMap.get(actId)
        return {
          activityId: actId,
          activityType: atom?.type ?? 'exercise',
          title: atom?.title ?? actId,
          moduleId: mod.id,
          moduleTitle: mod.title,
          reason: 'retry',
        }
      }
    }
  }

  // 2. Find the last module the user was working on and continue
  let lastActivity: { activityId: string; doneAt: string; moduleId: string } | null = null

  for (const mod of modules) {
    for (const actId of mod.activityIds) {
      const p = progress.get(actId)
      if (p?.lastDoneAt) {
        if (!lastActivity || p.lastDoneAt > lastActivity.doneAt) {
          lastActivity = { activityId: actId, doneAt: p.lastDoneAt, moduleId: mod.id }
        }
      }
    }
  }

  if (lastActivity) {
    const lastMod = modules.find((m) => m.id === lastActivity!.moduleId)
    if (lastMod) {
      const lastIdx = lastMod.activityIds.indexOf(lastActivity.activityId)

      // Try the next uncompleted activity in this module
      for (let i = lastIdx + 1; i < lastMod.activityIds.length; i++) {
        const aid = lastMod.activityIds[i]!
        if (!progress.has(aid)) {
          const atom = atomMap.get(aid)
          return {
            activityId: aid,
            activityType: atom?.type ?? 'exercise',
            title: atom?.title ?? aid,
            moduleId: lastMod.id,
            moduleTitle: lastMod.title,
            reason: 'continue',
          }
        }
      }

      // Module is complete, find next module with uncompleted activities
      const modIdx = modules.indexOf(lastMod)
      for (let i = modIdx + 1; i < modules.length; i++) {
        const nextMod = modules[i]!
        const firstUncompleted = nextMod.activityIds.find((id) => !progress.has(id))
        if (firstUncompleted) {
          const atom = atomMap.get(firstUncompleted)
          return {
            activityId: firstUncompleted,
            activityType: atom?.type ?? 'exercise',
            title: atom?.title ?? firstUncompleted,
            moduleId: nextMod.id,
            moduleTitle: nextMod.title,
            reason: 'next-module',
          }
        }
      }
    }
  }

  // 3. No progress yet — suggest first activity of first module
  const firstMod = modules[0]
  if (firstMod && firstMod.activityIds.length > 0) {
    const firstActId = firstMod.activityIds[0]!
    const atom = atomMap.get(firstActId)
    return {
      activityId: firstActId,
      activityType: atom?.type ?? 'lesson',
      title: atom?.title ?? firstActId,
      moduleId: firstMod.id,
      moduleTitle: firstMod.title,
      reason: 'first-activity',
    }
  }

  return null
}

// =============================================================================
// Recommended Series
// =============================================================================

function computeRecommendedSeries(
  progress: ProgressMap,
  series: DashboardSeriesInfo[],
  strengths: StrengthsAnalysis,
): RecommendedSeries[] {
  const weakTags = new Set(strengths.weaknesses.map((w) => w.tag))
  const recommendations: RecommendedSeries[] = []

  for (const s of series) {
    const done = s.activityIds.filter((id) => progress.has(id)).length
    const total = s.activityIds.length
    const completionPercentage = total > 0 ? Math.round((done / total) * 100) : 0

    // In-progress series (started but not finished)
    if (done > 0 && done < total) {
      recommendations.push({
        slug: s.slug,
        title: s.title,
        difficulty: s.difficulty,
        estimatedMinutes: s.estimatedMinutes,
        trimestre: s.trimestre,
        completionPercentage,
        reason: 'in-progress',
      })
      continue
    }

    // Series covering weak areas
    const coversWeakArea = s.tags.some((t) => weakTags.has(t))
    if (coversWeakArea && completionPercentage < 100) {
      recommendations.push({
        slug: s.slug,
        title: s.title,
        difficulty: s.difficulty,
        estimatedMinutes: s.estimatedMinutes,
        trimestre: s.trimestre,
        completionPercentage,
        reason: 'weak-area',
      })
      continue
    }

    // Not started series (for discovery)
    if (done === 0 && total > 0) {
      recommendations.push({
        slug: s.slug,
        title: s.title,
        difficulty: s.difficulty,
        estimatedMinutes: s.estimatedMinutes,
        trimestre: s.trimestre,
        completionPercentage: 0,
        reason: 'not-started',
      })
    }
  }

  // Sort: in-progress first, then weak-area, then not-started (by difficulty)
  const priorityOrder: Record<string, number> = {
    'in-progress': 0,
    'weak-area': 1,
    'not-started': 2,
    'review': 3,
  }

  recommendations.sort((a, b) => {
    const pa = priorityOrder[a.reason] ?? 99
    const pb = priorityOrder[b.reason] ?? 99
    if (pa !== pb) return pa - pb
    return a.difficulty - b.difficulty
  })

  return recommendations.slice(0, 6)
}

// =============================================================================
// Analysis Status
// =============================================================================

function computeAnalysisStatus(progress: ProgressMap): AnalysisStatus {
  const now = new Date().toISOString()

  // Count activities done in the last hour (considered "pending" for analysis freshness)
  const oneHourAgo = new Date(Date.now() - 60 * 60 * 1000).toISOString()
  let pendingActivities = 0

  for (const p of progress.values()) {
    if (p.lastDoneAt && p.lastDoneAt > oneHourAgo) {
      pendingActivities++
    }
  }

  return {
    lastComputedAt: now,
    pendingActivities,
    isUpToDate: pendingActivities === 0,
  }
}
