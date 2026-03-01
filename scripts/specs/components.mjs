/** Components tests — CMP-xxx */

import { readFile, tsxFiles, grepFiles } from './helpers.mjs'

export const domain = 'components'

export const tests = [
  {
    id: 'CMP-001',
    name: 'Content rendering pipeline',
    fn: () => {
      const renderer = readFile('src/components/content/content-renderer.tsx')
      const loader = readFile('src/lib/content-loader.ts')
      const checks = [
        ['ContentRenderer component', renderer.includes('ContentRenderer')],
        ['dangerouslySetInnerHTML', renderer.includes('dangerouslySetInnerHTML')],
        ['prose wrapper', renderer.includes('prose')],
        ['content-loader getAtomHtml', loader.includes('getAtomHtml')],
        ['content-loader getCompiledQuiz', loader.includes('getCompiledQuiz')],
      ]
      const failing = checks.filter(([, ok]) => !ok)
      return {
        pass: failing.length === 0,
        detail: failing.length === 0
          ? 'Content rendering pipeline properly configured'
          : `Missing: ${failing.map(([name]) => name).join(', ')}`,
      }
    },
  },
  {
    id: 'CMP-002',
    name: 'InteractiveCard for clickable cards',
    fn: () => {
      // Check that clickable cards use InteractiveCard, not bare Card with onClick
      const pattern = /<Card[^>]*onClick/
      const matches = grepFiles(tsxFiles, pattern).filter(
        // Exclude InteractiveCard definition itself
        (m) => !m.file.includes('interactive-card')
      )
      return {
        pass: matches.length === 0,
        detail: matches.length === 0
          ? 'No bare Card with onClick found'
          : `${matches.length} bare Card onClick(s):\n` +
            matches.map((m) => `  ${m.file}:${m.line}`).join('\n'),
      }
    },
  },
  {
    id: 'CMP-003',
    name: 'Toaster component in root layout',
    fn: () => {
      const layout = readFile('src/app/layout.tsx')
      const has = layout.includes('Toaster')
      return {
        pass: has,
        detail: has ? 'Toaster present' : 'Missing Toaster in root layout',
      }
    },
  },
  {
    id: 'CMP-004',
    name: 'PwaInstallPrompt in root layout',
    fn: () => {
      const layout = readFile('src/app/layout.tsx')
      const has = layout.includes('PwaInstallPrompt')
      return {
        pass: has,
        detail: has ? 'PwaInstallPrompt present' : 'Missing PwaInstallPrompt in root layout',
      }
    },
  },
  {
    id: 'CMP-005',
    name: 'Root layout is clean (no unnecessary providers)',
    fn: () => {
      const layout = readFile('src/app/layout.tsx')
      const authPresent = layout.includes('AuthProvider')
      const queryPresent = layout.includes('QueryProvider')
      const clean = !authPresent && !queryPresent
      return {
        pass: clean,
        detail: clean
          ? 'No provider wrappers (auth via useSyncExternalStore, no React Query)'
          : `Unnecessary providers found: ${[authPresent && 'AuthProvider', queryPresent && 'QueryProvider'].filter(Boolean).join(', ')}`,
      }
    },
  },
  {
    id: 'CMP-006',
    name: 'Metadata completeness',
    fn: () => {
      const layout = readFile('src/app/layout.tsx')
      const checks = [
        ['title', /title:\s*\{/.test(layout) || layout.includes("title:")],
        ['description', layout.includes('description')],
        ['openGraph', layout.includes('openGraph')],
        ['twitter', layout.includes('twitter')],
        ['manifest', layout.includes('manifest')],
        ['appleWebApp', layout.includes('appleWebApp')],
      ]
      const failing = checks.filter(([, ok]) => !ok)
      return {
        pass: failing.length === 0,
        detail: failing.length === 0
          ? 'All metadata fields present'
          : `Missing: ${failing.map(([name]) => name).join(', ')}`,
      }
    },
  },
]
