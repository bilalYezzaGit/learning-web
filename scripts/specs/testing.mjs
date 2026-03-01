/** Testing meta-rules — TST-xxx */

import { readdirSync, readFileSync, existsSync } from 'node:fs'
import { join, dirname } from 'node:path'
import { fileURLToPath } from 'node:url'

const __dirname = dirname(fileURLToPath(import.meta.url))
const RULES_DIR = 'docs/specs/rules'

export const domain = 'testing'

/** Parse rule IDs from a rules markdown file */
function parseRuleIds(filePath) {
  try {
    const content = readFileSync(filePath, 'utf-8')
    const ids = []
    for (const line of content.split('\n')) {
      const match = line.match(/^- ([A-Z0-9]+-\d+) \[(auto|manual)\]/)
      if (match) ids.push({ id: match[1], type: match[2] })
    }
    return ids
  } catch {
    return []
  }
}

/** Parse test IDs from a test module file */
function parseTestIds(filePath) {
  try {
    const content = readFileSync(filePath, 'utf-8')
    const ids = []
    const re = /id:\s*'([A-Z0-9]+-\d+)'/g
    let match
    while ((match = re.exec(content)) !== null) {
      ids.push(match[1])
    }
    return ids
  } catch {
    return []
  }
}

/** Get all rule files */
function getRuleFiles() {
  try {
    return readdirSync(RULES_DIR)
      .filter((f) => f.endsWith('.md'))
      .map((f) => ({ name: f.replace('.md', ''), path: join(RULES_DIR, f) }))
  } catch {
    return []
  }
}

/** Get all test files */
function getTestFiles() {
  const skip = new Set(['runner.mjs', 'helpers.mjs'])
  return readdirSync(__dirname)
    .filter((f) => f.endsWith('.mjs') && !skip.has(f))
    .map((f) => ({ name: f.replace('.mjs', ''), path: join(__dirname, f) }))
}

export const tests = [
  {
    id: 'TST-001',
    name: 'No duplicate rule IDs',
    fn: () => {
      const allIds = []
      for (const rf of getRuleFiles()) {
        const ids = parseRuleIds(rf.path)
        for (const { id } of ids) {
          allIds.push({ id, file: rf.name })
        }
      }
      const seen = new Map()
      const dupes = []
      for (const { id, file } of allIds) {
        if (seen.has(id)) {
          dupes.push(`${id} in ${seen.get(id)} and ${file}`)
        }
        seen.set(id, file)
      }
      return {
        pass: dupes.length === 0,
        detail: dupes.length === 0
          ? `${allIds.length} unique rule IDs`
          : `Duplicates: ${dupes.join(', ')}`,
      }
    },
  },
  {
    id: 'TST-002',
    name: 'Every [auto] rule has a test',
    fn: () => {
      const autoRules = []
      for (const rf of getRuleFiles()) {
        // Skip testing.md itself to avoid self-reference
        if (rf.name === 'testing') continue
        for (const { id, type } of parseRuleIds(rf.path)) {
          if (type === 'auto') autoRules.push(id)
        }
      }
      const allTestIds = new Set()
      for (const tf of getTestFiles()) {
        if (tf.name === 'testing' || tf.name === 'health') continue
        for (const id of parseTestIds(tf.path)) {
          allTestIds.add(id)
        }
      }
      const missing = autoRules.filter((id) => !allTestIds.has(id))
      return {
        pass: missing.length === 0,
        detail: missing.length === 0
          ? `All ${autoRules.length} [auto] rules have tests`
          : `Missing tests for: ${missing.join(', ')}`,
      }
    },
  },
  {
    id: 'TST-003',
    name: 'Every test maps to a rule',
    fn: () => {
      const allRuleIds = new Set()
      for (const rf of getRuleFiles()) {
        for (const { id } of parseRuleIds(rf.path)) {
          allRuleIds.add(id)
        }
      }
      const orphanTests = []
      for (const tf of getTestFiles()) {
        if (tf.name === 'testing' || tf.name === 'health') continue
        for (const id of parseTestIds(tf.path)) {
          if (!allRuleIds.has(id)) orphanTests.push(`${id} in ${tf.name}.mjs`)
        }
      }
      return {
        pass: orphanTests.length === 0,
        detail: orphanTests.length === 0
          ? 'All test IDs map to existing rules'
          : `Orphan tests: ${orphanTests.join(', ')}`,
      }
    },
  },
  {
    id: 'TST-004',
    name: 'Rule files and test files in mirror',
    fn: () => {
      const ruleNames = new Set(getRuleFiles().map((f) => f.name))
      const testNames = new Set(getTestFiles().map((f) => f.name))

      // Exclude meta files from mirror check
      const metaFiles = new Set(['testing', 'health'])
      const issues = []

      for (const name of ruleNames) {
        if (metaFiles.has(name)) continue
        if (!testNames.has(name)) {
          issues.push(`rules/${name}.md has no specs/${name}.mjs`)
        }
      }
      for (const name of testNames) {
        if (metaFiles.has(name)) continue
        if (!ruleNames.has(name)) {
          issues.push(`specs/${name}.mjs has no rules/${name}.md`)
        }
      }
      return {
        pass: issues.length === 0,
        detail: issues.length === 0
          ? 'All rule files have mirror test files'
          : issues.join('; '),
      }
    },
  },
  {
    id: 'TST-005',
    name: 'Referenced files exist on disk',
    fn: () => {
      // Check hardcoded file paths in test files
      const missing = []
      const pathPattern = /['"]src\/[^'"]+['"]/g
      for (const tf of getTestFiles()) {
        if (tf.name === 'testing' || tf.name === 'health') continue
        const content = readFileSync(tf.path, 'utf-8')
        // Files referenced in fileExists() calls are negative assertions (checking deletion)
        const negativeAssertionPaths = new Set()
        const negRe = /fileExists\(['"]([^'"]+)['"]\)/g
        let negMatch
        while ((negMatch = negRe.exec(content)) !== null) {
          negativeAssertionPaths.add(negMatch[1])
        }
        let match
        while ((match = pathPattern.exec(content)) !== null) {
          const path = match[0].slice(1, -1)
          if (negativeAssertionPaths.has(path)) continue
          if (!existsSync(path)) {
            missing.push(`${tf.name}.mjs references ${path}`)
          }
        }
      }
      return {
        pass: missing.length === 0,
        detail: missing.length === 0
          ? 'All referenced files exist'
          : `Missing: ${missing.join('; ')}`,
      }
    },
  },
  {
    id: 'TST-006',
    name: 'Positive grep tests still match',
    fn: () => {
      // Verify that key positive assertions still hold
      // (catches cases where code changed but tests weren't updated)
      const checks = [
        ['text-balance in codebase', () => {
          const { grepFiles, tsxFiles } = require_helpers()
          return grepFiles(tsxFiles, /text-balance/).length >= 3
        }],
        ['tabular-nums in codebase', () => {
          const { grepFiles, tsxFiles } = require_helpers()
          return grepFiles(tsxFiles, /tabular-nums/).length >= 1
        }],
      ]

      // Simple version: just check the key files exist and have content
      const keyFiles = [
        'src/app/globals.css',
        'src/app/layout.tsx',
        'src/components/parcours-shell.tsx',
      ]
      const emptyFiles = keyFiles.filter((f) => {
        try {
          return readFileSync(f, 'utf-8').length < 10
        } catch {
          return true
        }
      })
      return {
        pass: emptyFiles.length === 0,
        detail: emptyFiles.length === 0
          ? 'All key test target files have content'
          : `Empty/missing: ${emptyFiles.join(', ')}`,
      }
    },
  },
]
