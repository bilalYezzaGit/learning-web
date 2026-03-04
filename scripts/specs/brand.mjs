/** Brand & Identity tests — BRD-xxx */

import { readFile } from './helpers.mjs'

export const domain = 'brand'

export const tests = [
  {
    id: 'BRD-001',
    name: 'App title in metadata',
    fn: () => {
      const layout = readFile('src/app/layout.tsx')
      const has = layout.includes('Aylan')
      return {
        pass: has,
        detail: has ? '"Aylan" found in metadata' : 'Missing "Aylan" in layout metadata',
      }
    },
  },
  {
    id: 'BRD-002',
    name: 'Header brand display',
    fn: () => {
      const header = readFile('src/app/app/_components/app-header.tsx')
      const checks = [
        ['font-serif', header.includes('font-serif')],
        ['Aylan text', header.includes('Aylan')],
        ['BookOpen icon', header.includes('BookOpen')],
      ]
      const failing = checks.filter(([, ok]) => !ok)
      return {
        pass: failing.length === 0,
        detail: failing.length === 0
          ? 'Header brand elements present'
          : `Missing: ${failing.map(([name]) => name).join(', ')}`,
      }
    },
  },
  {
    id: 'BRD-003',
    name: 'OpenGraph metadata',
    fn: () => {
      const layout = readFile('src/app/layout.tsx')
      const has = layout.includes('openGraph')
      return {
        pass: has,
        detail: has ? 'openGraph metadata present' : 'Missing openGraph in layout',
      }
    },
  },
  {
    id: 'BRD-004',
    name: 'Twitter card metadata',
    fn: () => {
      const layout = readFile('src/app/layout.tsx')
      const has = layout.includes('twitter')
      return {
        pass: has,
        detail: has ? 'Twitter card metadata present' : 'Missing twitter in layout',
      }
    },
  },
  {
    id: 'BRD-005',
    name: 'PWA configuration',
    fn: () => {
      const layout = readFile('src/app/layout.tsx')
      const checks = [
        ['manifest', layout.includes('manifest')],
        ['appleWebApp', layout.includes('appleWebApp')],
        ['themeColor', layout.includes('#9F6B53')],
      ]
      const failing = checks.filter(([, ok]) => !ok)
      return {
        pass: failing.length === 0,
        detail: failing.length === 0
          ? 'PWA config complete'
          : `Missing: ${failing.map(([name]) => name).join(', ')}`,
      }
    },
  },
]
