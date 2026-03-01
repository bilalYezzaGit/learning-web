/** Navigation tests — NAV-xxx */

import { readFile, fileExists } from './helpers.mjs'

export const domain = 'navigation'

export const tests = [
  {
    id: 'NAV-001',
    name: 'Header-only shell (no sidebar)',
    fn: () => {
      const shell = readFile('src/app/(parcours)/_components/parcours-shell.tsx')
      const checks = [
        ['header element', shell.includes('<header')],
        ['NavUser import', shell.includes('NavUser')],
        ['no aside', !shell.includes('<aside')],
        ['no Sheet', !shell.includes('Sheet')],
      ]
      const failing = checks.filter(([, ok]) => !ok)
      return {
        pass: failing.length === 0,
        detail: failing.length === 0
          ? 'Header-only shell: header + NavUser, no sidebar'
          : `Failing: ${failing.map(([name]) => name).join(', ')}`,
      }
    },
  },
  {
    id: 'NAV-002',
    name: 'No mobile bottom nav',
    fn: () => {
      const exists = fileExists('src/components/mobile-bottom-nav.tsx')
      return {
        pass: !exists,
        detail: exists
          ? 'mobile-bottom-nav.tsx should be deleted'
          : 'mobile-bottom-nav.tsx correctly removed',
      }
    },
  },
  {
    id: 'NAV-003',
    name: 'Module page has breadcrumbs',
    fn: () => {
      const page = readFile('src/app/(parcours)/[parcours]/apprendre/[moduleId]/page.tsx')
      const hasPageNav = page.includes('PageNav')
      return {
        pass: hasPageNav,
        detail: hasPageNav
          ? 'Module page has PageNav breadcrumb navigation'
          : 'Missing PageNav in module page',
      }
    },
  },
  {
    id: 'NAV-004',
    name: 'Shell contains NavUser',
    fn: () => {
      const shell = readFile('src/app/(parcours)/_components/parcours-shell.tsx')
      const has = shell.includes('NavUser')
      return {
        pass: has,
        detail: has
          ? 'NavUser present in shell header'
          : 'Missing NavUser in shell',
      }
    },
  },
]
