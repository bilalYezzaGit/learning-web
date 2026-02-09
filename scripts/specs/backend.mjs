/** Backend & Firebase tests — BAK-xxx */

import { tsFiles, grepFiles } from './helpers.mjs'

export const domain = 'backend'

export const tests = [
  {
    id: 'BAK-001',
    name: 'No Firebase imports outside src/lib/',
    fn: () => {
      const pattern = /from\s+['"]firebase\//
      // Known legacy: login-form, signup-form, email-verification-banner use Firebase directly
      const knownLegacy = [
        'login-form.tsx',
        'signup-form.tsx',
        'email-verification-banner.tsx',
      ]
      const outsideLib = tsFiles.filter(
        (f) =>
          !f.includes('src/lib/') &&
          !f.includes('node_modules') &&
          !knownLegacy.some((k) => f.endsWith(k))
      )
      const matches = grepFiles(outsideLib, pattern)
      return {
        pass: matches.length === 0,
        detail: matches.length === 0
          ? 'Firebase imports correctly scoped to src/lib/'
          : `${matches.length} import(s) outside lib:\n` +
            matches.map((m) => `  ${m.file}:${m.line} — ${m.content}`).join('\n'),
      }
    },
  },
  {
    id: 'BAK-002',
    name: 'No hardcoded credentials in source',
    fn: () => {
      const patterns = [
        /AIza[0-9A-Za-z_-]{35}/, // Firebase API key pattern
        /-----BEGIN (RSA |EC )?PRIVATE KEY-----/,
        /password\s*[:=]\s*["'][^"']+["']/,
      ]
      const matches = []
      for (const pattern of patterns) {
        matches.push(
          ...grepFiles(tsFiles, pattern).filter((m) => {
            // Exclude comments and type definitions
            if (m.content.trimStart().startsWith('//') || m.content.trimStart().startsWith('*')) return false
            // Exclude .env.example files
            if (m.file.includes('.env')) return false
            // Exclude Firebase client config (public API keys, not secrets)
            if (m.file.includes('firebase/config')) return false
            // Exclude password field names/labels (not actual passwords)
            if (/["']password["']|htmlFor|placeholder|type=/.test(m.content)) return false
            return true
          })
        )
      }
      return {
        pass: matches.length === 0,
        detail: matches.length === 0
          ? 'No hardcoded credentials found'
          : `${matches.length} potential credential(s):\n` +
            matches.map((m) => `  ${m.file}:${m.line}`).join('\n'),
      }
    },
  },
]
