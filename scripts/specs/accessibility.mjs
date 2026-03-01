/** Accessibility tests — A11-xxx */

import { readFile, fileExists, globalsCss, tsxFiles, grepFiles } from './helpers.mjs'

export const domain = 'accessibility'

export const tests = [
  {
    id: 'A11-001',
    name: 'html lang="fr"',
    fn: () => {
      const layout = readFile('src/app/layout.tsx')
      const hasLang = layout.includes('lang="fr"')
      return {
        pass: hasLang,
        detail: hasLang
          ? 'lang="fr" present'
          : 'Missing lang="fr"',
      }
    },
  },
  {
    id: 'A11-002',
    name: 'Skip-to-content link in root layout',
    fn: () => {
      const layout = readFile('src/app/layout.tsx')
      const hasSkipLink = layout.includes('#main-content') && layout.includes('sr-only')
      return {
        pass: hasSkipLink,
        detail: hasSkipLink
          ? 'Skip link with sr-only pattern found'
          : 'Missing skip-to-content link or sr-only class',
      }
    },
  },
  {
    id: 'A11-003',
    name: 'main-content target in parcours shell',
    fn: () => {
      const shell = readFile('src/app/(parcours)/_components/parcours-shell.tsx')
      const hasTarget = shell.includes('id="main-content"')
      return {
        pass: hasTarget,
        detail: hasTarget
          ? 'id="main-content" found'
          : 'Missing id="main-content" in parcours shell',
      }
    },
  },
  {
    id: 'A11-004',
    name: 'Touch target sizing (44px)',
    fn: () => {
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
    },
  },
  {
    id: 'A11-005',
    name: 'No <main> in layout files',
    fn: () => {
      const layoutFiles = tsxFiles.filter(
        (f) => f.includes('/app/') && f.endsWith('layout.tsx')
      )
      const matches = grepFiles(layoutFiles, /<main[\s>]/)
      return {
        pass: matches.length === 0,
        detail: matches.length === 0
          ? 'Zero matches in layout files'
          : `${matches.length} match(es):\n` +
            matches.map((m) => `  ${m.file}:${m.line} — ${m.content}`).join('\n'),
      }
    },
  },
  {
    id: 'A11-006',
    name: 'Form inputs have labels',
    fn: () => {
      const files = ['src/app/(auth)/_components/login-form.tsx', 'src/app/(auth)/_components/signup-form.tsx']
      const issues = []
      for (const path of files) {
        const content = readFile(path)
        if (!content) { issues.push(`${path} not found`); continue }
        const hasLabels = content.includes('FieldLabel') || content.includes('htmlFor') || content.includes('Label')
        if (!hasLabels) issues.push(`${path}: no label association found`)
      }
      return {
        pass: issues.length === 0,
        detail: issues.length === 0
          ? 'All forms have label associations'
          : issues.join('; '),
      }
    },
  },
  {
    id: 'A11-007',
    name: 'Error alerts use role="alert"',
    fn: () => {
      const files = ['src/app/(auth)/_components/login-form.tsx', 'src/app/(auth)/_components/signup-form.tsx']
      const issues = []
      for (const path of files) {
        const content = readFile(path)
        if (!content) { issues.push(`${path} not found`); continue }
        if (!content.includes('role="alert"')) {
          issues.push(`${path}: missing role="alert"`)
        }
      }
      return {
        pass: issues.length === 0,
        detail: issues.length === 0
          ? 'role="alert" present in all auth forms'
          : issues.join('; '),
      }
    },
  },
  {
    id: 'A11-009',
    name: 'No mobile bottom nav (removed)',
    fn: () => {
      const removed = !fileExists('src/components/mobile-bottom-nav.tsx')
      return {
        pass: removed,
        detail: removed ? 'mobile-bottom-nav.tsx correctly removed' : 'mobile-bottom-nav.tsx should be deleted',
      }
    },
  },
  {
    id: 'A11-010',
    name: 'Decorative icons have aria-hidden',
    fn: () => {
      const filesToCheck = [
        'src/app/(parcours)/_components/parcours-shell.tsx',
      ]
      const issues = []
      for (const path of filesToCheck) {
        const content = readFile(path)
        if (!content) continue
        const lines = content.split('\n')
        for (let i = 0; i < lines.length; i++) {
          const line = lines[i]
          if (/<[A-Z][a-zA-Z]+\s/.test(line) && /className=/.test(line) && /h-[345]\b/.test(line) && /w-[345]\b/.test(line)) {
            if (!line.includes('aria-hidden')) {
              const context = lines.slice(Math.max(0, i - 3), i + 1).join('\n')
              if (!context.includes('aria-label')) {
                issues.push(`${path}:${i + 1} — icon may need aria-hidden`)
              }
            }
          }
        }
      }
      return {
        pass: issues.length <= 0,
        detail: issues.length === 0
          ? 'Key navigation icons have aria-hidden'
          : `${issues.length} issue(s):\n` + issues.map((i) => `  ${i}`).join('\n'),
      }
    },
  },
]
