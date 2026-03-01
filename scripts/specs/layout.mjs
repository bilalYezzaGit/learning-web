/** Spacing, Layout & Responsive tests — LAY-xxx */

import { allFiles, tsxFiles, globalsCss, grepFiles, readFile } from './helpers.mjs'

export const domain = 'layout'

export const tests = [
  {
    id: 'LAY-001',
    name: 'No 100vh usage (use 100svh)',
    fn: () => {
      const pattern = /100vh/
      const matches = grepFiles(allFiles, pattern).filter(
        (m) => !m.content.includes('100svh')
      )
      return {
        pass: matches.length === 0,
        detail: matches.length === 0
          ? 'Zero matches'
          : `${matches.length} match(es):\n` +
            matches.map((m) => `  ${m.file}:${m.line}`).join('\n'),
      }
    },
  },
  {
    id: 'LAY-002',
    name: 'No bare container class',
    fn: () => {
      const pattern = /className="[^"]*\bcontainer\b[^"]*"/
      const matches = grepFiles(tsxFiles, pattern).filter((m) => {
        return !/[@/]container/.test(m.content)
      })
      return {
        pass: matches.length === 0,
        detail: matches.length === 0
          ? 'Zero bare container usage'
          : `${matches.length} match(es):\n` +
            matches.map((m) => `  ${m.file}:${m.line} — ${m.content}`).join('\n'),
      }
    },
  },
  {
    id: 'LAY-003',
    name: 'Parcours layout structure',
    fn: () => {
      const layout = readFile('src/app/(parcours)/[parcours]/layout.tsx')
      const shell = readFile('src/app/(parcours)/_components/parcours-shell.tsx')
      const checks = [
        ['ParcoursShell', layout.includes('ParcoursShell')],
        ['id="main-content"', shell.includes('id="main-content"')],
        ['@container/main', shell.includes('@container/main')],
      ]
      const failing = checks.filter(([, ok]) => !ok)
      return {
        pass: failing.length === 0,
        detail: failing.length === 0
          ? 'All structural elements present'
          : `Missing: ${failing.map(([name]) => name).join(', ')}`,
      }
    },
  },
  {
    id: 'LAY-004',
    name: 'Radius scale defined',
    fn: () => {
      const has = globalsCss.includes('--radius:')
      return {
        pass: has,
        detail: has ? '--radius defined in globals.css' : 'Missing --radius in globals.css',
      }
    },
  },
  {
    id: 'LAY-005',
    name: 'Header height token defined',
    fn: () => {
      const has = globalsCss.includes('--header-height')
      return {
        pass: has,
        detail: has ? '--header-height defined in globals.css' : 'Missing --header-height in globals.css',
      }
    },
  },
]
