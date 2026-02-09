/** Navigation tests — NAV-xxx */

import { readFile } from './helpers.mjs'

export const domain = 'navigation'

export const tests = [
  {
    id: 'NAV-001',
    name: 'Sidebar structure',
    fn: () => {
      const sidebar = readFile('src/components/app-sidebar.tsx')
      const checks = [
        ['variant="inset"', sidebar.includes('variant="inset"')],
        ['collapsible="icon"', sidebar.includes('collapsible="icon"')],
        ['SidebarHeader', sidebar.includes('SidebarHeader')],
        ['SidebarContent', sidebar.includes('SidebarContent')],
        ['SidebarFooter', sidebar.includes('SidebarFooter')],
      ]
      const failing = checks.filter(([, ok]) => !ok)
      return {
        pass: failing.length === 0,
        detail: failing.length === 0
          ? 'All sidebar structural elements present'
          : `Missing: ${failing.map(([name]) => name).join(', ')}`,
      }
    },
  },
  {
    id: 'NAV-002',
    name: 'Mobile bottom nav structure',
    fn: () => {
      const nav = readFile('src/components/mobile-bottom-nav.tsx')
      const checks = [
        ['md:hidden', nav.includes('md:hidden')],
        ['print:hidden', nav.includes('print:hidden')],
        ['transition-colors', nav.includes('transition-colors')],
        ['text-primary', nav.includes('text-primary')],
        ['text-muted-foreground', nav.includes('text-muted-foreground')],
      ]
      const failing = checks.filter(([, ok]) => !ok)
      return {
        pass: failing.length === 0,
        detail: failing.length === 0
          ? 'All mobile nav requirements present'
          : `Missing: ${failing.map(([name]) => name).join(', ')}`,
      }
    },
  },
  {
    id: 'NAV-003',
    name: 'Active link highlighting',
    fn: () => {
      const sidebar = readFile('src/components/app-sidebar.tsx')
      const hasIsActive = sidebar.includes('isActive')
      return {
        pass: hasIsActive,
        detail: hasIsActive
          ? 'isActive prop used for route highlighting'
          : 'Missing isActive prop in sidebar',
      }
    },
  },
  {
    id: 'NAV-004',
    name: 'Sidebar footer with theme toggle and NavUser',
    fn: () => {
      const sidebar = readFile('src/components/app-sidebar.tsx')
      const checks = [
        ['aria-label on toggle', sidebar.includes('aria-label')],
        ['NavUser', sidebar.includes('NavUser')],
      ]
      const failing = checks.filter(([, ok]) => !ok)
      return {
        pass: failing.length === 0,
        detail: failing.length === 0
          ? 'Theme toggle and NavUser present in footer'
          : `Missing: ${failing.map(([name]) => name).join(', ')}`,
      }
    },
  },
]
