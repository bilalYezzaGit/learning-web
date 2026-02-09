/** Typography tests — TYP-xxx */

import { readFileSync } from 'node:fs'
import { globalsCss, tsxFiles, grepFiles } from './helpers.mjs'

export const domain = 'typography'

export const tests = [
  {
    id: 'TYP-001',
    name: 'Font variable declarations',
    fn: () => {
      const cssChecks = [
        '--font-sans: var(--font-dm-sans)',
        '--font-serif: var(--font-lora)',
        '--font-mono: var(--font-geist-mono)',
      ]
      const missingCss = cssChecks.filter((c) => !globalsCss.includes(c))

      const layout = readFileSync('src/app/layout.tsx', 'utf-8')
      const hasImports = layout.includes('DM_Sans') && layout.includes('Lora')

      const allPass = missingCss.length === 0 && hasImports
      return {
        pass: allPass,
        detail: allPass
          ? 'All font stacks + Google Fonts imports present'
          : [
              missingCss.length > 0 ? `Missing CSS: ${missingCss.join(', ')}` : null,
              !hasImports ? 'Missing Google Fonts imports in layout.tsx' : null,
            ]
              .filter(Boolean)
              .join('; '),
      }
    },
  },
  {
    id: 'TYP-002',
    name: 'text-balance on headings (>= 3 files)',
    fn: () => {
      const matches = grepFiles(tsxFiles, /text-balance/)
      const uniqueFiles = new Set(matches.map((m) => m.file))
      return {
        pass: uniqueFiles.size >= 3,
        detail: `${uniqueFiles.size} file(s): ${[...uniqueFiles].map((f) => f.replace('src/', '')).join(', ')}`,
      }
    },
  },
  {
    id: 'TYP-003',
    name: 'tabular-nums on numeric displays (>= 1)',
    fn: () => {
      const matches = grepFiles(tsxFiles, /tabular-nums/)
      return {
        pass: matches.length >= 1,
        detail: `${matches.length} usage(s) across ${new Set(matches.map((m) => m.file)).size} file(s)`,
      }
    },
  },
  {
    id: 'TYP-004',
    name: 'No triple-dot literal in UI text',
    fn: () => {
      const pattern = /\.\.\./
      const matches = grepFiles(tsxFiles, pattern).filter((m) => {
        // Exclude spread operators, imports, comments
        if (/\.\.\.(props|rest|args|items|params|prev|a|data|entry|remaining)/.test(m.content)) return false
        if (m.content.trimStart().startsWith('//') || m.content.trimStart().startsWith('*')) return false
        if (/\.\.\.[\w[]/.test(m.content)) return false
        if (m.content.includes('import ')) return false
        // Exclude shadcn UI primitives
        if (m.file.includes('/ui/')) return false
        // Keep only user-facing text: strings, JSX text
        return /"[^"]*\.\.\.[^"]*"|'[^']*\.\.\.[^']*'|>[^<]*\.\.\.[^<]*</.test(m.content)
      })
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
