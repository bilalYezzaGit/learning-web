/** React & Next.js tests — RCT-xxx */

import { readFileSync } from 'node:fs'
import { tsxFiles, tsFiles, grepFiles, walk } from './helpers.mjs'

export const domain = 'react'

export const tests = [
  {
    id: 'RCT-001',
    name: 'Files with hooks have "use client"',
    fn: () => {
      const hookPattern = /\b(useState|useEffect|useContext|useReducer|useCallback|useMemo|useRef)\s*[(<]/
      const filesWithHooks = grepFiles(tsxFiles, hookPattern)
      const uniqueFiles = [...new Set(filesWithHooks.map((m) => m.file))]

      const missing = uniqueFiles.filter((file) => {
        const content = readFileSync(file, 'utf-8')
        return !content.startsWith("'use client'") && !content.startsWith('"use client"')
      })

      return {
        pass: missing.length === 0,
        detail: missing.length === 0
          ? 'All hook files have "use client"'
          : `${missing.length} file(s) missing "use client":\n` +
            missing.map((f) => `  ${f}`).join('\n'),
      }
    },
  },
  {
    id: 'RCT-002',
    name: 'No Firebase imports in components',
    fn: () => {
      const pattern = /from\s+['"]firebase\//
      // Known legacy: login-form, signup-form, email-verification-banner use Firebase directly
      const knownLegacy = [
        '(auth)/_components/login-form.tsx',
        '(auth)/_components/signup-form.tsx',
        '(parcours)/_components/email-verification-banner.tsx',
      ]
      const componentFiles = tsFiles.filter(
        (f) => (f.includes('src/components/') || f.includes('_components/')) && !knownLegacy.some((k) => f.endsWith(k))
      )
      const matches = grepFiles(componentFiles, pattern)
      return {
        pass: matches.length === 0,
        detail: matches.length === 0
          ? 'No direct Firebase imports in components'
          : `${matches.length} match(es):\n` +
            matches.map((m) => `  ${m.file}:${m.line} — ${m.content}`).join('\n'),
      }
    },
  },
  {
    id: 'RCT-003',
    name: 'No bare <img> tags (use next/image)',
    fn: () => {
      const pattern = /<img\s/
      const matches = grepFiles(tsxFiles, pattern).filter((m) => {
        // Exclude comments
        if (m.content.trimStart().startsWith('//') || m.content.trimStart().startsWith('*')) return false
        return true
      })
      return {
        pass: matches.length === 0,
        detail: matches.length === 0
          ? 'All images use next/image'
          : `${matches.length} bare <img> tag(s):\n` +
            matches.map((m) => `  ${m.file}:${m.line} — ${m.content}`).join('\n'),
      }
    },
  },
  {
    id: 'RCT-004',
    name: 'Component files use kebab-case',
    fn: () => {
      const componentFiles = walk('src/components', ['.tsx', '.ts'])
      const badNames = componentFiles.filter((f) => {
        const name = f.split('/').pop().replace(/\.(tsx|ts)$/, '')
        // Allow index files and files starting with uppercase only if kebab-case
        if (name === 'index') return false
        // Check for camelCase or PascalCase (has uppercase after first char)
        return /[A-Z]/.test(name)
      })
      return {
        pass: badNames.length === 0,
        detail: badNames.length === 0
          ? 'All component files use kebab-case'
          : `${badNames.length} non-kebab file(s):\n` +
            badNames.map((f) => `  ${f}`).join('\n'),
      }
    },
  },
]
