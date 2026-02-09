/** Motion & Animation tests — MOT-xxx */

import { globalsCss, allFiles, grepFiles } from './helpers.mjs'

export const domain = 'motion'

export const tests = [
  {
    id: 'MOT-001',
    name: 'Reduced motion media query',
    fn: () => {
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
    },
  },
  {
    id: 'MOT-002',
    name: 'No transition-all in custom code',
    fn: () => {
      const pattern = /transition-all/
      // Exclude shadcn UI primitives (they use transition-all by default)
      const shadcnUi = [
        'ui/sidebar.tsx',
        'ui/navigation-menu.tsx',
        'ui/progress.tsx',
        'ui/tabs.tsx',
        'ui/accordion.tsx',
      ]
      const files = allFiles.filter(
        (f) => !shadcnUi.some((s) => f.includes(s)) && !f.includes('node_modules')
      )
      // Also allow Radix CollapsibleContent animation patterns
      const matches = grepFiles(files, pattern).filter(
        (m) => !m.content.includes('data-[state=')
      )
      return {
        pass: matches.length === 0,
        detail: matches.length === 0
          ? 'Zero matches (shadcn UI excluded)'
          : `${matches.length} match(es):\n` +
            matches.map((m) => `  ${m.file}:${m.line} — ${m.content}`).join('\n'),
      }
    },
  },
]
