/** TypeScript tests — TSC-xxx */

import { tsFiles, grepFiles } from './helpers.mjs'

export const domain = 'typescript'

export const tests = [
  {
    id: 'TSC-001',
    name: 'No explicit any',
    fn: () => {
      const patterns = [/:\s*any\b/, /as\s+any\b/]
      const matches = []
      for (const pattern of patterns) {
        matches.push(
          ...grepFiles(tsFiles, pattern).filter((m) => {
            // Exclude type definition files that may need any for external libs
            if (m.file.includes('.d.ts')) return false
            // Exclude comments
            if (m.content.trimStart().startsWith('//') || m.content.trimStart().startsWith('*')) return false
            return true
          })
        )
      }
      return {
        pass: matches.length === 0,
        detail: matches.length === 0
          ? 'Zero explicit any'
          : `${matches.length} match(es):\n` +
            matches.map((m) => `  ${m.file}:${m.line} — ${m.content}`).join('\n'),
      }
    },
  },
  {
    id: 'TSC-002',
    name: 'No @ts-ignore or @ts-expect-error',
    fn: () => {
      const pattern = /@ts-(ignore|expect-error)/
      const matches = grepFiles(tsFiles, pattern)
      return {
        pass: matches.length === 0,
        detail: matches.length === 0
          ? 'Zero ts-ignore/expect-error'
          : `${matches.length} match(es):\n` +
            matches.map((m) => `  ${m.file}:${m.line} — ${m.content}`).join('\n'),
      }
    },
  },
  {
    id: 'TSC-003',
    name: 'No console.log in production code',
    fn: () => {
      const pattern = /console\.log\(/
      const matches = grepFiles(tsFiles, pattern).filter((m) => {
        // Exclude comments
        if (m.content.trimStart().startsWith('//') || m.content.trimStart().startsWith('*')) return false
        // Exclude test/script files
        if (m.file.includes('/scripts/') || m.file.includes('.test.')) return false
        return true
      })
      return {
        pass: matches.length === 0,
        detail: matches.length === 0
          ? 'Zero console.log in production code'
          : `${matches.length} match(es):\n` +
            matches.map((m) => `  ${m.file}:${m.line} — ${m.content}`).join('\n'),
      }
    },
  },
  {
    id: 'TSC-004',
    name: 'No relative imports (use @/ alias)',
    fn: () => {
      const pattern = /from\s+['"]\.\.\//
      const matches = grepFiles(tsFiles, pattern).filter((m) => {
        // Exclude .d.ts files
        if (m.file.includes('.d.ts')) return false
        return true
      })
      return {
        pass: matches.length === 0,
        detail: matches.length === 0
          ? 'All imports use @/ alias'
          : `${matches.length} relative import(s):\n` +
            matches.map((m) => `  ${m.file}:${m.line} — ${m.content}`).join('\n'),
      }
    },
  },
]
