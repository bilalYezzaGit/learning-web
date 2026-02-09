#!/usr/bin/env node

/**
 * Content integrity validation script
 *
 * Checks that all atom IDs referenced in molecules (cours + series) actually
 * exist as .mdx files in content/atoms/.
 *
 * Usage: node scripts/validate-content.mjs
 * Exit code 0 = all OK, 1 = errors found
 */

import fs from 'fs'
import path from 'path'
import { parse as parseYaml } from 'yaml'

const ROOT = process.cwd()
const ATOMS_DIR = path.join(ROOT, 'content/atoms')
const COURS_DIR = path.join(ROOT, 'content/molecules/cours')
const SERIES_DIR = path.join(ROOT, 'content/molecules/series')

// ── 1. Collect all existing atom IDs ──

const existingAtoms = new Set(
  fs.readdirSync(ATOMS_DIR)
    .filter((f) => f.endsWith('.mdx'))
    .map((f) => f.replace('.mdx', ''))
)

console.log(`Found ${existingAtoms.size} atoms in content/atoms/\n`)

// ── 2. Extract atom IDs from steps ──

function extractIdsFromSteps(steps) {
  const ids = []
  for (const step of steps) {
    if (typeof step === 'string') {
      ids.push(step)
    } else if (typeof step === 'object' && step.quiz) {
      for (const qcmId of step.quiz) {
        ids.push(qcmId)
      }
    }
  }
  return ids
}

// ── 3. Validate molecules ──

let errors = 0
let warnings = 0
let totalRefs = 0

function validateMolecule(filePath, type) {
  const raw = fs.readFileSync(filePath, 'utf-8')
  const data = parseYaml(raw)
  const fileName = path.basename(filePath)
  const refs = []

  if (type === 'cours' && data.sections) {
    for (const section of data.sections) {
      if (section.steps) {
        refs.push(...extractIdsFromSteps(section.steps))
      }
    }
  } else if (type === 'series' && data.steps) {
    refs.push(...extractIdsFromSteps(data.steps))
  }

  totalRefs += refs.length

  const missing = refs.filter((id) => !existingAtoms.has(id))
  if (missing.length > 0) {
    errors += missing.length
    console.log(`\x1b[31mERROR\x1b[0m ${type}/${fileName}`)
    for (const id of missing) {
      console.log(`  Missing atom: ${id}`)
    }
  }

  // Check for duplicate refs within same molecule
  const seen = new Set()
  const duplicates = []
  for (const id of refs) {
    if (seen.has(id)) {
      duplicates.push(id)
    }
    seen.add(id)
  }
  if (duplicates.length > 0) {
    warnings += duplicates.length
    console.log(`\x1b[33mWARN\x1b[0m  ${type}/${fileName}`)
    for (const id of duplicates) {
      console.log(`  Duplicate ref: ${id}`)
    }
  }
}

// ── 4. Run validation ──

console.log('Validating cours...')
for (const file of fs.readdirSync(COURS_DIR).filter((f) => f.endsWith('.yaml'))) {
  validateMolecule(path.join(COURS_DIR, file), 'cours')
}

console.log('\nValidating series...')
for (const file of fs.readdirSync(SERIES_DIR).filter((f) => f.endsWith('.yaml'))) {
  validateMolecule(path.join(SERIES_DIR, file), 'series')
}

// ── 5. Check for orphan atoms (not referenced anywhere) ──

console.log('\nChecking for orphan atoms...')
const allReferencedIds = new Set()

for (const dir of [COURS_DIR, SERIES_DIR]) {
  for (const file of fs.readdirSync(dir).filter((f) => f.endsWith('.yaml'))) {
    const raw = fs.readFileSync(path.join(dir, file), 'utf-8')
    const data = parseYaml(raw)

    if (data.sections) {
      for (const section of data.sections) {
        if (section.steps) {
          for (const id of extractIdsFromSteps(section.steps)) {
            allReferencedIds.add(id)
          }
        }
      }
    }
    if (data.steps) {
      for (const id of extractIdsFromSteps(data.steps)) {
        allReferencedIds.add(id)
      }
    }
  }
}

const orphans = [...existingAtoms].filter((id) => !allReferencedIds.has(id))
if (orphans.length > 0) {
  console.log(`\x1b[33mWARN\x1b[0m  ${orphans.length} orphan atoms (not referenced in any molecule):`)
  for (const id of orphans.sort()) {
    console.log(`  ${id}`)
  }
  warnings += orphans.length
}

// ── 6. Summary ──

console.log('\n─────────────────────────────')
console.log(`Total refs checked: ${totalRefs}`)
console.log(`Atoms: ${existingAtoms.size}`)
console.log(`Referenced: ${allReferencedIds.size}`)
console.log(`Orphans: ${orphans.length}`)
console.log(`\x1b[31mErrors: ${errors}\x1b[0m`)
console.log(`\x1b[33mWarnings: ${warnings}\x1b[0m`)
console.log('─────────────────────────────')

if (errors > 0) {
  console.log('\n\x1b[31mContent validation FAILED\x1b[0m')
  process.exit(1)
} else {
  console.log('\n\x1b[32mContent validation PASSED\x1b[0m')
  process.exit(0)
}
