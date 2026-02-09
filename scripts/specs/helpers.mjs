/**
 * Shared test helpers
 *
 * Utilities used by all domain test modules.
 */

import { readFileSync, readdirSync, statSync, existsSync } from 'node:fs'
import { join } from 'node:path'

const SRC = 'src'
const GLOBALS_CSS = 'src/app/globals.css'

// ── File utilities ──

/** Recursively collect files matching extensions */
export function walk(dir, extensions) {
  const results = []
  for (const entry of readdirSync(dir)) {
    const full = join(dir, entry)
    if (statSync(full).isDirectory()) {
      if (entry === 'node_modules' || entry === '.next') continue
      results.push(...walk(full, extensions))
    } else if (extensions.some((ext) => full.endsWith(ext))) {
      results.push(full)
    }
  }
  return results
}

/** Read file content, return empty string if not found */
export function readFile(path) {
  try {
    return readFileSync(path, 'utf-8')
  } catch {
    return ''
  }
}

/** Check if file exists */
export function fileExists(path) {
  return existsSync(path)
}

/** Check if file content includes a string */
export function fileContains(path, str) {
  return readFile(path).includes(str)
}

// ── Search utilities ──

/** Search files for a regex, return matches with file:line:content */
export function grepFiles(files, pattern) {
  const matches = []
  for (const file of files) {
    const lines = readFileSync(file, 'utf-8').split('\n')
    for (let i = 0; i < lines.length; i++) {
      if (pattern.test(lines[i])) {
        matches.push({ file, line: i + 1, content: lines[i].trim() })
      }
      pattern.lastIndex = 0
    }
  }
  return matches
}

/** Check that a CSS block (between start pattern and next `}`) contains a value */
export function cssBlockContains(css, blockStart, value) {
  const idx = css.indexOf(blockStart)
  if (idx === -1) return false
  const end = css.indexOf('}', idx)
  const block = css.slice(idx, end)
  return block.includes(value)
}

// ── Pre-loaded data ──

export const tsxFiles = walk(SRC, ['.tsx'])
export const tsFiles = walk(SRC, ['.ts', '.tsx'])
export const cssFiles = walk(SRC, ['.css'])
export const allFiles = [...tsxFiles, ...cssFiles]
export const globalsCss = readFile(GLOBALS_CSS)
