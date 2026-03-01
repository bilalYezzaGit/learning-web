/**
 * Local Progress Service
 *
 * localStorage-based progress storage for anonymous users.
 * Note: local progress is not migrated to Firestore on sign-in (MVP).
 */

import type { ActivityProgress, ProgressStatus } from '@/types'
import { SUCCESS_THRESHOLD } from '@/lib/constants'

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

export function setLocalActivityComplete(params: {
  activityId: string
  activityType: 'exercise' | 'qcm'
  status?: ProgressStatus
  score?: number
  total?: number
  contextType: string
  contextId: string
}): LocalProgressMap {
  const map = load()
  const now = new Date().toISOString()

  let status: ProgressStatus
  if (params.activityType === 'qcm' && params.score !== undefined && params.total !== undefined) {
    status = params.score / params.total >= SUCCESS_THRESHOLD ? 'success' : 'retry'
  } else {
    status = params.status ?? 'success'
  }

  map.set(params.activityId, {
    activityId: params.activityId,
    activityType: params.activityType,
    status,
    ...(params.score !== undefined && { score: params.score }),
    ...(params.total !== undefined && { total: params.total }),
    attempts: 1,
    lastDoneAt: now,
    contexts: [{ type: params.contextType, id: params.contextId, doneAt: now }],
  })
  save(map)
  return map
}
