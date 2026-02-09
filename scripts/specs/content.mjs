/** Content & MDX Prose tests — CNT-xxx */

import { globalsCss } from './helpers.mjs'

export const domain = 'content'

export const tests = [
  {
    id: 'CNT-001',
    name: 'Prose h3 decorative underline',
    fn: () => {
      const has = globalsCss.includes('.prose h3') && globalsCss.includes('after:bg-primary/40')
      return {
        pass: has,
        detail: has ? '.prose h3 underline present' : 'Missing .prose h3 or after:bg-primary/40',
      }
    },
  },
  {
    id: 'CNT-002',
    name: 'Prose tables styled',
    fn: () => {
      const has = globalsCss.includes('.prose table') && globalsCss.includes('rounded-lg border')
      return {
        pass: has,
        detail: has ? '.prose table styling present' : 'Missing .prose table styling',
      }
    },
  },
  {
    id: 'CNT-003',
    name: 'Prose list markers use primary',
    fn: () => {
      const ol = globalsCss.includes('.prose ol > li::marker') && globalsCss.includes('text-primary')
      const ul = globalsCss.includes('.prose ul > li::marker') && globalsCss.includes('text-primary/60')
      return {
        pass: ol && ul,
        detail: ol && ul
          ? 'List marker colors present'
          : `Missing: ${[!ol && 'ol markers', !ul && 'ul markers'].filter(Boolean).join(', ')}`,
      }
    },
  },
  {
    id: 'CNT-004',
    name: 'Prose blockquotes styled',
    fn: () => {
      const has = globalsCss.includes('.prose blockquote') && globalsCss.includes('border-l-primary/40')
      return {
        pass: has,
        detail: has ? 'Blockquote styling present' : 'Missing .prose blockquote styling',
      }
    },
  },
  {
    id: 'CNT-005',
    name: 'KaTeX display styled',
    fn: () => {
      const has = globalsCss.includes('.katex-display') && globalsCss.includes('rounded-lg border')
      return {
        pass: has,
        detail: has ? 'KaTeX display styling present' : 'Missing .katex-display styling',
      }
    },
  },
  {
    id: 'CNT-006',
    name: 'Prose HR gradient',
    fn: () => {
      const has = globalsCss.includes('.prose hr') && globalsCss.includes('bg-gradient-to-r')
      return {
        pass: has,
        detail: has ? 'HR gradient present' : 'Missing .prose hr gradient',
      }
    },
  },
]
