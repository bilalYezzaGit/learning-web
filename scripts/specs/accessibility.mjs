/** Accessibility tests — A11-xxx */

import { readFile, globalsCss, tsxFiles, grepFiles } from './helpers.mjs'

export const domain = 'accessibility'

export const tests = [
  {
    id: 'A11-001',
    name: 'html lang="fr" and suppressHydrationWarning',
    fn: () => {
      const layout = readFile('src/app/layout.tsx')
      const hasLang = layout.includes('lang="fr"')
      const hasSuppress = layout.includes('suppressHydrationWarning')
      return {
        pass: hasLang && hasSuppress,
        detail: hasLang && hasSuppress
          ? 'Both attributes present'
          : `Missing: ${[!hasLang && 'lang="fr"', !hasSuppress && 'suppressHydrationWarning'].filter(Boolean).join(', ')}`,
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
    name: 'main-content target in parcours layout',
    fn: () => {
      const layout = readFile('src/app/(parcours)/[parcours]/layout.tsx')
      const hasTarget = layout.includes('id="main-content"')
      return {
        pass: hasTarget,
        detail: hasTarget
          ? 'id="main-content" found'
          : 'Missing id="main-content" in parcours layout',
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
      const files = ['src/components/login-form.tsx', 'src/components/signup-form.tsx']
      const issues = []
      for (const path of files) {
        const content = readFile(path)
        if (!content) { issues.push(`${path} not found`); continue }
        // Check for FieldLabel or htmlFor pattern
        const hasLabels = content.includes('FieldLabel') || content.includes('htmlFor')
        if (!hasLabels) issues.push(`${path}: no FieldLabel or htmlFor found`)
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
      const files = ['src/components/login-form.tsx', 'src/components/signup-form.tsx']
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
    id: 'A11-008',
    name: 'Theme provider system default',
    fn: () => {
      const layout = readFile('src/app/layout.tsx')
      const hasSystem = layout.includes('defaultTheme="system"') || layout.includes("defaultTheme='system'")
      const hasEnable = layout.includes('enableSystem')
      return {
        pass: hasSystem && hasEnable,
        detail: hasSystem && hasEnable
          ? 'ThemeProvider with system default'
          : `Missing: ${[!hasSystem && 'defaultTheme="system"', !hasEnable && 'enableSystem'].filter(Boolean).join(', ')}`,
      }
    },
  },
  {
    id: 'A11-009',
    name: 'Mobile nav has aria-label',
    fn: () => {
      const nav = readFile('src/components/mobile-bottom-nav.tsx')
      const has = nav.includes('aria-label')
      return {
        pass: has,
        detail: has ? 'aria-label found on mobile nav' : 'Missing aria-label on mobile bottom nav',
      }
    },
  },
  {
    id: 'A11-010',
    name: 'Decorative icons have aria-hidden',
    fn: () => {
      // Check key interactive components for aria-hidden on Lucide icons
      const filesToCheck = [
        'src/components/app-sidebar.tsx',
        'src/components/mobile-bottom-nav.tsx',
      ]
      const issues = []
      for (const path of filesToCheck) {
        const content = readFile(path)
        if (!content) continue
        // Look for Lucide icon JSX that lacks aria-hidden
        const lines = content.split('\n')
        for (let i = 0; i < lines.length; i++) {
          const line = lines[i]
          // Match Lucide icon usage: <IconName with className containing h- or w-
          if (/<[A-Z][a-zA-Z]+\s/.test(line) && /className=/.test(line) && /[hw]-\d/.test(line)) {
            if (!line.includes('aria-hidden')) {
              // Check if parent is a button with aria-label (acceptable)
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
