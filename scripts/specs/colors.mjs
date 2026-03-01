/** Colors & Theming tests — COL-xxx */

import { globalsCss, tsxFiles, grepFiles, cssBlockContains } from './helpers.mjs'

export const domain = 'colors'

export const tests = [
  {
    id: 'COL-001',
    name: 'Light mode color variables',
    fn: () => {
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
    },
  },
  {
    id: 'COL-003',
    name: 'No hardcoded Tailwind color classes',
    fn: () => {
      const pattern = /(bg|text|border|ring)-(red|green|blue|yellow|purple|pink|orange|teal|cyan|lime|fuchsia|rose|violet|indigo|emerald|sky|amber|stone)-\d{2,3}/
      // Intentional color usage: lesson parts, exercise parts, mdx components
      const excluded = ['lesson-parts.tsx', 'exercise-parts.tsx', 'mdx-components.tsx']
      const files = tsxFiles.filter(
        (f) => !excluded.some((ex) => f.endsWith(ex)) && !f.includes('src/content/')
      )
      const matches = grepFiles(files, pattern)
      return {
        pass: matches.length === 0,
        detail: matches.length === 0
          ? 'Zero matches'
          : `${matches.length} match(es):\n` +
            matches.map((m) => `  ${m.file}:${m.line} — ${m.content}`).join('\n'),
      }
    },
  },
]
