/** Print Styles tests — PRT-xxx */

import { globalsCss } from './helpers.mjs'

export const domain = 'print'

export const tests = [
  {
    id: 'PRT-001',
    name: 'Print hides nav elements',
    fn: () => {
      const has = globalsCss.includes('@media print') && globalsCss.includes('display: none !important')
      return {
        pass: has,
        detail: has ? 'Print display:none rules present' : 'Missing @media print or display:none',
      }
    },
  },
  {
    id: 'PRT-002',
    name: 'Print body white background',
    fn: () => {
      const has = globalsCss.includes('background: white !important') && globalsCss.includes('color: black !important')
      return {
        pass: has,
        detail: has ? 'Print body colors present' : 'Missing print body white/black',
      }
    },
  },
  {
    id: 'PRT-003',
    name: 'Print main full width',
    fn: () => {
      const has = globalsCss.includes('width: 100% !important') && globalsCss.includes('max-width: 100% !important')
      return {
        pass: has,
        detail: has ? 'Print main full width present' : 'Missing print width 100%',
      }
    },
  },
  {
    id: 'PRT-004',
    name: 'Print prose sizing',
    fn: () => {
      const has = globalsCss.includes('font-size: 12pt !important')
      return {
        pass: has,
        detail: has ? 'Print font-size 12pt present' : 'Missing print font-size 12pt',
      }
    },
  },
  {
    id: 'PRT-005',
    name: 'Print links show URLs',
    fn: () => {
      const has = globalsCss.includes('content: " (" attr(href) ")"') && globalsCss.includes('break-inside: avoid')
      return {
        pass: has,
        detail: has ? 'Print link URLs + break-inside present' : 'Missing print link URLs or break-inside',
      }
    },
  },
]
