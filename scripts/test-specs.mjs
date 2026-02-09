/**
 * UI/UX Spec Tests — Automated runner
 *
 * Covers 15/25 tests from docs/specs/tests.md (levels 1 + 2).
 * Run: npm run test:specs
 *
 * Level 1 — Grep-based (8 tests): T-003, T-005, T-014, T-015, T-016, T-017, T-024, T-025
 * Level 2 — CSS variable checks (7 tests): T-001, T-002, T-010, T-011, T-012, T-013, T-021
 */

import { readFileSync, readdirSync, statSync } from 'node:fs'
import { join, extname } from 'node:path'

const SRC = 'src'
const GLOBALS_CSS = 'src/app/globals.css'

// ── Helpers ──

/** Recursively collect files matching extensions */
function walk(dir, extensions) {
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

/** Search files for a regex, return matches with file:line:content */
function grepFiles(files, pattern) {
  const matches = []
  for (const file of files) {
    const lines = readFileSync(file, 'utf-8').split('\n')
    for (let i = 0; i < lines.length; i++) {
      if (pattern.test(lines[i])) {
        matches.push({ file, line: i + 1, content: lines[i].trim() })
      }
    }
  }
  return matches
}

/** Check that a CSS block (between start pattern and next `}`) contains a value */
function cssBlockContains(css, blockStart, value) {
  const idx = css.indexOf(blockStart)
  if (idx === -1) return false
  const end = css.indexOf('}', idx)
  const block = css.slice(idx, end)
  return block.includes(value)
}

// ── Test runner ──

const results = []

function test(id, name, fn) {
  try {
    const result = fn()
    results.push({ id, name, ...result })
  } catch (err) {
    results.push({ id, name, pass: false, detail: `Error: ${err.message}` })
  }
}

// ── Pre-load data ──

const tsxFiles = walk(SRC, ['.tsx'])
const cssFiles = walk(SRC, ['.css'])
const allFiles = [...tsxFiles, ...cssFiles]
const globalsCss = readFileSync(GLOBALS_CSS, 'utf-8')

// ── LEVEL 1: Grep tests ──

test('T-003', 'No hardcoded Tailwind color classes', () => {
  const pattern = /(bg|text|border|ring)-(red|green|blue|yellow|purple|pink|orange|teal|cyan|lime|fuchsia|rose|violet|indigo|emerald|sky|amber|stone)-\d{2,3}/
  const excluded = ['lesson-parts.tsx', 'exercise-parts.tsx', 'mdx-components.tsx']
  const files = tsxFiles.filter(
    (f) => !excluded.some((ex) => f.endsWith(ex)) && !f.includes('src/content/')
  )
  const matches = grepFiles(files, pattern)
  return {
    pass: matches.length === 0,
    detail: matches.length === 0
      ? 'Zero matches'
      : `${matches.length} match(es):\n` + matches.map((m) => `  ${m.file}:${m.line} — ${m.content}`).join('\n'),
  }
})

test('T-005', 'No transition-all in custom code', () => {
  const pattern = /transition-all/
  const shadcnUi = ['ui/sidebar.tsx', 'ui/navigation-menu.tsx', 'ui/progress.tsx', 'ui/tabs.tsx', 'ui/accordion.tsx']
  const files = allFiles.filter(
    (f) => !shadcnUi.some((s) => f.includes(s)) && !f.includes('node_modules')
  )
  // Also allow CollapsibleContent pattern (radix accordion animation)
  const matches = grepFiles(files, pattern).filter(
    (m) => !m.content.includes('data-[state=')
  )
  return {
    pass: matches.length === 0,
    detail: matches.length === 0
      ? 'Zero matches (shadcn UI excluded)'
      : `${matches.length} match(es):\n` + matches.map((m) => `  ${m.file}:${m.line} — ${m.content}`).join('\n'),
  }
})

test('T-014', 'text-balance on headings (>= 3 usages)', () => {
  const matches = grepFiles(tsxFiles, /text-balance/)
  const uniqueFiles = new Set(matches.map((m) => m.file))
  return {
    pass: uniqueFiles.size >= 3,
    detail: `${uniqueFiles.size} file(s): ${[...uniqueFiles].map((f) => f.replace('src/', '')).join(', ')}`,
  }
})

test('T-015', 'tabular-nums on numeric displays (>= 1 usage)', () => {
  const matches = grepFiles(tsxFiles, /tabular-nums/)
  return {
    pass: matches.length >= 1,
    detail: `${matches.length} usage(s) across ${new Set(matches.map((m) => m.file)).size} file(s)`,
  }
})

test('T-016', 'No triple-dot literal in UI text', () => {
  const pattern = /\.\.\./
  const matches = grepFiles(tsxFiles, pattern).filter((m) => {
    // Exclude spread operators, imports, comments, line-clamp
    if (/\.\.\.(props|rest|args|items|params|prev|a|data|entry|remaining)/.test(m.content)) return false
    if (m.content.trimStart().startsWith('//') || m.content.trimStart().startsWith('*')) return false
    if (/\.\.\.[\w[]/.test(m.content)) return false // spread syntax
    if (m.content.includes('import ')) return false
    // Exclude shadcn UI primitives (default props in English)
    if (m.file.includes('/ui/')) return false
    // Keep only user-facing text: strings, JSX text
    return /"[^"]*\.\.\.[^"]*"|'[^']*\.\.\.[^']*'|>[^<]*\.\.\.[^<]*</.test(m.content)
  })
  return {
    pass: matches.length === 0,
    detail: matches.length === 0
      ? 'Zero matches'
      : `${matches.length} match(es):\n` + matches.map((m) => `  ${m.file}:${m.line} — ${m.content}`).join('\n'),
  }
})

test('T-017', 'No 100vh usage (use 100svh)', () => {
  const pattern = /100vh/
  const matches = grepFiles(allFiles, pattern).filter(
    (m) => !m.content.includes('100svh') // allow 100svh
  )
  return {
    pass: matches.length === 0,
    detail: matches.length === 0
      ? 'Zero matches'
      : `${matches.length} match(es):\n` + matches.map((m) => `  ${m.file}:${m.line}`).join('\n'),
  }
})

test('T-024', 'No <main> in layout files', () => {
  const layoutFiles = tsxFiles.filter((f) => f.includes('/app/') && f.endsWith('layout.tsx'))
  const matches = grepFiles(layoutFiles, /<main[\s>]/)
  return {
    pass: matches.length === 0,
    detail: matches.length === 0
      ? 'Zero matches in layout files'
      : `${matches.length} match(es):\n` + matches.map((m) => `  ${m.file}:${m.line} — ${m.content}`).join('\n'),
  }
})

test('T-025', 'No bare container class', () => {
  const pattern = /className="[^"]*\bcontainer\b[^"]*"/
  const matches = grepFiles(tsxFiles, pattern).filter((m) => {
    // Allow @container and container/ (query containers)
    return !/[@/]container/.test(m.content)
  })
  return {
    pass: matches.length === 0,
    detail: matches.length === 0
      ? 'Zero bare container usage'
      : `${matches.length} match(es):\n` + matches.map((m) => `  ${m.file}:${m.line} — ${m.content}`).join('\n'),
  }
})

// ── LEVEL 2: CSS variable checks ──

test('T-001', 'Light mode color variables', () => {
  const required = [
    ['--primary', 'oklch(0.55 0.11 35)'],
    ['--secondary', 'oklch(0.94 0.015 80)'],
    ['--success', 'oklch(0.55 0.12 155)'],
    ['--info', 'oklch(0.55 0.10 235)'],
    ['--warning', 'oklch(0.70 0.12 80)'],
    ['--ring', 'oklch(0.55 0.11 35)'],
    ['--chart-1', 'oklch('],
    ['--chart-2', 'oklch('],
    ['--chart-3', 'oklch('],
    ['--chart-4', 'oklch('],
    ['--chart-5', 'oklch('],
  ]
  const missing = required.filter(
    ([key, val]) => !cssBlockContains(globalsCss, ':root {', `${key}: ${val}`)
  )
  return {
    pass: missing.length === 0,
    detail: missing.length === 0
      ? 'All 11 values present in :root'
      : `Missing: ${missing.map(([k]) => k).join(', ')}`,
  }
})

test('T-002', 'Dark mode color variables', () => {
  const required = [
    ['--primary', 'oklch(0.68 0.11 35)'],
    ['--background', 'oklch(0.17 0.015 50)'],
    ['--ring', 'oklch(0.68 0.11 35)'],
    ['--success', 'oklch(0.60 0.12 155)'],
    ['--info', 'oklch(0.60 0.10 235)'],
    ['--warning', 'oklch(0.72 0.12 80)'],
    ['--destructive', 'oklch(0.704 0.191 22.216)'],
    ['--sidebar', 'oklch('],
  ]
  const missing = required.filter(
    ([key, val]) => !cssBlockContains(globalsCss, '.dark {', `${key}: ${val}`)
  )
  return {
    pass: missing.length === 0,
    detail: missing.length === 0
      ? 'All 8 values present in .dark'
      : `Missing: ${missing.map(([k]) => k).join(', ')}`,
  }
})

test('T-010', 'Reduced motion media query', () => {
  const checks = [
    'prefers-reduced-motion: reduce',
    'animation-duration: 0.01ms !important',
    'animation-iteration-count: 1 !important',
    'transition-duration: 0.01ms !important',
  ]
  const missing = checks.filter((c) => !globalsCss.includes(c))
  return {
    pass: missing.length === 0,
    detail: missing.length === 0
      ? 'All 4 declarations present'
      : `Missing: ${missing.join(', ')}`,
  }
})

test('T-011', 'Print styles', () => {
  const checks = [
    '@media print',
    'display: none !important',
    'background: white !important',
    'color: black !important',
    'width: 100% !important',
    'max-width: 100% !important',
    'font-size: 12pt !important',
    'content: " (" attr(href) ")"',
    'break-inside: avoid',
  ]
  const missing = checks.filter((c) => !globalsCss.includes(c))
  return {
    pass: missing.length === 0,
    detail: missing.length === 0
      ? 'All 9 print rules present'
      : `Missing: ${missing.join(', ')}`,
  }
})

test('T-012', 'Touch target sizing', () => {
  const checks = [
    'pointer: coarse',
    'min-height: 2.75rem',
    'min-width: 2.75rem',
  ]
  const missing = checks.filter((c) => !globalsCss.includes(c))
  return {
    pass: missing.length === 0,
    detail: missing.length === 0
      ? 'Touch target rules present'
      : `Missing: ${missing.join(', ')}`,
  }
})

test('T-013', 'Font variable declarations', () => {
  const checks = [
    '--font-sans: var(--font-dm-sans)',
    '--font-serif: var(--font-lora)',
    '--font-mono: var(--font-geist-mono)',
  ]
  const missing = checks.filter((c) => !globalsCss.includes(c))

  // Also check layout.tsx imports
  const layout = readFileSync('src/app/layout.tsx', 'utf-8')
  const hasImports = layout.includes('DM_Sans') && layout.includes('Lora')

  const allPass = missing.length === 0 && hasImports
  return {
    pass: allPass,
    detail: allPass
      ? 'All font stacks + Google Fonts imports present'
      : [
          missing.length > 0 ? `Missing CSS: ${missing.join(', ')}` : null,
          !hasImports ? 'Missing Google Fonts imports in layout.tsx' : null,
        ].filter(Boolean).join('; '),
  }
})

test('T-021', 'Prose styling rules', () => {
  const checks = [
    ['.prose h3', 'after:bg-primary/40'],
    ['.prose table', 'rounded-lg border'],
    ['.prose ol > li::marker', 'text-primary'],
    ['.prose ul > li::marker', 'text-primary/60'],
    ['.prose a', 'text-primary'],
    ['.prose blockquote', 'border-l-primary/40'],
    ['.katex-display', 'rounded-lg border'],
    ['.prose hr', 'bg-gradient-to-r'],
  ]
  const missing = checks.filter(
    ([selector, value]) => !globalsCss.includes(selector) || !globalsCss.includes(value)
  )
  return {
    pass: missing.length === 0,
    detail: missing.length === 0
      ? 'All 8 prose rules present'
      : `Missing: ${missing.map(([s]) => s).join(', ')}`,
  }
})

// ── Report ──

console.log('')
console.log('  UI/UX Spec Tests')
console.log('  ════════════════════════════════════════')
console.log('')

let passed = 0
let failed = 0

for (const r of results) {
  const icon = r.pass ? '✓' : '✗'
  const color = r.pass ? '\x1b[32m' : '\x1b[31m'
  const reset = '\x1b[0m'
  console.log(`  ${color}${icon}${reset} ${r.id} — ${r.name}`)
  if (!r.pass) {
    console.log(`    ${r.detail}`)
  }
  if (r.pass) passed++
  else failed++
}

console.log('')
console.log(`  ────────────────────────────────────────`)
console.log(`  ${passed} passed, ${failed} failed, ${results.length} total`)
console.log('')

process.exit(failed > 0 ? 1 : 0)
