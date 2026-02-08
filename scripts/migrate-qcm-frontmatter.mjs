/**
 * Migration script: Add correctOption to QCM frontmatter
 *
 * Reads each qcm-*.mdx, finds <Option correct> via regex,
 * writes the 0-based index into frontmatter as correctOption.
 *
 * Usage: node scripts/migrate-qcm-frontmatter.mjs [--dry-run]
 * Rollback: git checkout content/atoms/
 */

import fs from 'fs'
import path from 'path'
import { fileURLToPath } from 'url'

const __dirname = path.dirname(fileURLToPath(import.meta.url))
const ATOMS_DIR = path.join(__dirname, '..', 'content', 'atoms')
const dryRun = process.argv.includes('--dry-run')

const files = fs.readdirSync(ATOMS_DIR).filter(f => f.startsWith('qcm-') && f.endsWith('.mdx'))

let updated = 0
let skipped = 0
let errors = 0

for (const file of files) {
  const filePath = path.join(ATOMS_DIR, file)
  const raw = fs.readFileSync(filePath, 'utf-8')

  // Check if already has correctOption
  if (raw.match(/^correctOption:\s/m)) {
    skipped++
    continue
  }

  // Find correct option index
  const optionRegex = /<Option(\s+correct)?>/g
  let match
  let optionIndex = 0
  let correctIndex = -1

  while ((match = optionRegex.exec(raw)) !== null) {
    if (match[1]) {
      correctIndex = optionIndex
    }
    optionIndex++
  }

  if (correctIndex === -1) {
    console.error(`ERROR: No <Option correct> found in ${file}`)
    errors++
    continue
  }

  // Insert correctOption into frontmatter (before closing ---)
  const frontmatterEnd = raw.indexOf('---', 4) // Skip opening ---
  if (frontmatterEnd === -1) {
    console.error(`ERROR: No frontmatter closing --- in ${file}`)
    errors++
    continue
  }

  const newContent =
    raw.slice(0, frontmatterEnd) +
    `correctOption: ${correctIndex}\n` +
    raw.slice(frontmatterEnd)

  if (dryRun) {
    console.log(`DRY-RUN: ${file} → correctOption: ${correctIndex}`)
  } else {
    fs.writeFileSync(filePath, newContent, 'utf-8')
    console.log(`UPDATED: ${file} → correctOption: ${correctIndex}`)
  }
  updated++
}

console.log(`\nDone. Updated: ${updated}, Skipped: ${skipped}, Errors: ${errors}`)
