/**
 * Content module barrel export
 *
 * Provides HTML content rendering with custom extensions for:
 * - Math (KaTeX)
 * - Function graphs (Recharts)
 * - Sign/variation tables
 * - YouTube embeds
 */

// Main renderer
export { ContentRenderer } from './renderer'

// Individual extensions (for direct use)
export { Math } from './extensions/math'
export { Graph } from './extensions/graph'
export { YouTube } from './extensions/youtube'
export { VariationsTable, createVariationsFromAttribs } from './extensions/variations'

// Utilities
export {
  isElement,
  getTextContent,
  getAttr,
  getBoolAttr,
  parseList,
  parseRange,
  decodeHtmlEntities,
} from './utils'
