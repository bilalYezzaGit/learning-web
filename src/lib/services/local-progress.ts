/**
 * Local Progress Service
 *
 * localStorage-based progress storage for anonymous users.
 * Note: local progress is not migrated to Firestore on sign-in (MVP).
 */

import type { ActivityProgress, ProgressStatus } from '@/types'

const STORAGE_KEY = 'learning-progress'

type LocalProgressMap = Map<string, ActivityProgress>

function load(): LocalProgressMap {
  try {
    const raw = localStorage.getItem(STORAGE_KEY)
    if (!raw) return new Map()
    const entries = JSON.parse(raw) as Array<[string, ActivityProgress]>
    return new Map(entries)
  } catch {
    return new Map()
  }
}

function save(map: LocalProgressMap): void {
  try {
    const entries = Array.from(map.entries())
    localStorage.setItem(STORAGE_KEY, JSON.stringify(entries))
  } catch { /* localStorage unavailable */ }
}

export function getLocalProgress(): LocalProgressMap {
  return load()
}

export function setLocalExerciseComplete(params: {
  activityId: string
  status: ProgressStatus
  contextType: string
  contextId: string
}): LocalProgressMap {
  const map = load()
  map.set(params.activityId, {
    activityId: params.activityId,
    activityType: 'exercise',
    status: params.status,
    attempts: 1,
    lastDoneAt: new Date().toISOString(),
    contexts: [{ type: params.contextType, id: params.contextId, doneAt: new Date().toISOString() }],
  })
  save(map)
  return map
}

export function setLocalQCMComplete(params: {
  activityId: string
  score: number
  total: number
  contextType: string
  contextId: string
}): LocalProgressMap {
  const map = load()
  const status: ProgressStatus = params.score / params.total >= 0.5 ? 'success' : 'retry'
  map.set(params.activityId, {
    activityId: params.activityId,
    activityType: 'qcm',
    status,
    score: params.score,
    total: params.total,
    attempts: 1,
    lastDoneAt: new Date().toISOString(),
    contexts: [{ type: params.contextType, id: params.contextId, doneAt: new Date().toISOString() }],
  })
  save(map)
  return map
}

export function clearLocalProgress(): void {
  try {
    localStorage.removeItem(STORAGE_KEY)
  } catch { /* ok */ }
}
