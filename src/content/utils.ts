/**
 * Content extension utilities
 *
 * Shared parsing helpers used by content extensions.
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
