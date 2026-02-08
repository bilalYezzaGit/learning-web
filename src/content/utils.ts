/**
 * Content extension utilities
 *
 * Shared parsing helpers used by graph, math, and variations extensions.
 */

/**
 * Decode HTML entities commonly found in math content
 */
export function decodeHtmlEntities(text: string): string {
  return text
    .replace(/&lt;/g, '<')
    .replace(/&gt;/g, '>')
    .replace(/&amp;/g, '&')
    .replace(/&quot;/g, '"')
    .replace(/&#39;/g, "'")
    .replace(/&nbsp;/g, ' ')
}

/**
 * Parse a list string like "[a,b,c]" into an array
 */
export function parseList(listStr: string): string[] {
  const cleaned = listStr.replace(/^\[/, '').replace(/\]$/, '').trim()
  if (!cleaned) return []
  return cleaned.split(',').map((s) => s.trim())
}

/**
 * Parse a range string like "[-5,5]" into [min, max]
 */
export function parseRange(rangeStr: string): [number, number] {
  try {
    const cleaned = rangeStr.replace(/^\[/, '').replace(/\]$/, '')
    const parts = cleaned.split(',')
    if (parts.length === 2) {
      return [parseFloat(parts[0]!.trim()), parseFloat(parts[1]!.trim())]
    }
  } catch {
    // Fall through to default
  }
  return [-5, 5]
}
