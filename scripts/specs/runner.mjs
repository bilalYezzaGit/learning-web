#!/usr/bin/env node
/**
 * Spec Test Runner
 *
 * Dynamically imports all domain test modules from this directory
 * and runs every test. Reports pass/fail grouped by domain.
 *
 * Run: npm run test:specs
 */

import { readdirSync } from 'node:fs'
import { join, dirname } from 'node:path'
import { fileURLToPath } from 'node:url'

const __dirname = dirname(fileURLToPath(import.meta.url))

// Discover all test modules (exclude runner + helpers)
const skip = new Set(['runner.mjs', 'helpers.mjs'])
const testFiles = readdirSync(__dirname)
  .filter((f) => f.endsWith('.mjs') && !skip.has(f))
  .sort()

const results = []

for (const file of testFiles) {
  const mod = await import(join(__dirname, file))
  const domain = mod.domain || file.replace('.mjs', '')

  if (!mod.tests || !Array.isArray(mod.tests)) continue

  for (const test of mod.tests) {
    try {
      const result = test.fn()
      results.push({ id: test.id, name: test.name, domain, ...result })
    } catch (err) {
      results.push({
        id: test.id,
        name: test.name,
        domain,
        pass: false,
        detail: `Error: ${err.message}`,
      })
    }
  }
}

// ── Report ──

console.log('')
console.log('  Spec Tests')
console.log('  ════════════════════════════════════════')

let passed = 0
let failed = 0
let currentDomain = ''

for (const r of results) {
  if (r.domain !== currentDomain) {
    currentDomain = r.domain
    console.log('')
    console.log(
      `  \x1b[1m${currentDomain.charAt(0).toUpperCase() + currentDomain.slice(1)}\x1b[0m`
    )
  }

  const icon = r.pass ? '\u2713' : '\u2717'
  const color = r.pass ? '\x1b[32m' : '\x1b[31m'
  const reset = '\x1b[0m'
  console.log(`  ${color}${icon}${reset} ${r.id} \u2014 ${r.name}`)
  if (!r.pass) {
    console.log(`    ${r.detail}`)
  }
  if (r.pass) passed++
  else failed++
}

console.log('')
console.log('  \u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500')
console.log(`  ${passed} passed, ${failed} failed, ${results.length} total`)
console.log('')

process.exit(failed > 0 ? 1 : 0)
