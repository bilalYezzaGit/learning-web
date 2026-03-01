/**
 * Shared formatting utilities
 */

export function formatDuration(minutes: number): string {
  if (minutes < 60) return `${minutes} min`
  const hours = Math.floor(minutes / 60)
  const remaining = minutes % 60
  if (remaining === 0) return `${hours}h`
  return `${hours}h${remaining.toString().padStart(2, '0')}`
}

export function getDifficultyLabel(d: number): string {
  if (d <= 1) return 'Facile'
  if (d <= 2) return 'Moyen'
  return 'Difficile'
}
