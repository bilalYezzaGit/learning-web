/**
 * Content Pipeline — CLI entry point
 *
 * Reads MDX atoms + YAML molecules, validates, compiles to HTML/JSON,
 * resolves molecules, and writes everything to src/generated/.
 */

import { readAllAtoms } from './stages/read-atoms.js'
import { readAllCours, readAllSeries, readAllProgrammes } from './stages/read-molecules.js'
import { validateContent } from './stages/validate.js'
import { compileAllAtoms } from './stages/compile-all.js'
import { resolveAllCours } from './stages/resolve-cours.js'
import { resolveAllSeries } from './stages/resolve-series.js'
import { assembleCatalogues } from './stages/assemble-catalogues.js'
import { writeOutput } from './stages/write-output.js'

async function main() {
  const startTime = Date.now()
  console.log('')

  // Phase 1 — Read
  console.log('[1/5] Reading content...')
  const atoms = readAllAtoms()
  const cours = readAllCours()
  const series = readAllSeries()
  const programmes = readAllProgrammes()
  console.log(`      ${atoms.length} atoms, ${cours.length} cours, ${series.length} series, ${programmes.length} programmes`)

  // Phase 1 — Validate
  console.log('[2/5] Validating references...')
  const errors = validateContent(atoms, cours, series, programmes)
  const realErrors = errors.filter(e => e.severity === 'error')
  const warnings = errors.filter(e => e.severity === 'warning')
  console.log(`      ${realErrors.length} errors, ${warnings.length} warnings`)

  if (realErrors.length > 0) {
    console.error('\nValidation FAILED:')
    for (const err of realErrors) {
      console.error(`  [ERROR] ${err.source}: ${err.message}`)
    }
    process.exit(1)
  }

  if (warnings.length > 0) {
    for (const w of warnings) {
      console.log(`      [warn] ${w.source}: ${w.message}`)
    }
  }

  // Phase 2 — Compile atoms
  console.log('[3/5] Compiling atoms...')
  const { htmlFiles, qcmFiles } = await compileAllAtoms(atoms)
  console.log(`      ${htmlFiles.size} HTML + ${qcmFiles.size} QCM compiled`)

  // Phase 3 — Resolve molecules
  console.log('[4/5] Resolving molecules...')
  const atomMap = new Map(atoms.map(a => [a.id, a]))
  const resolvedCours = resolveAllCours(cours, atomMap)
  const resolvedSeries = resolveAllSeries(series, atomMap)
  const catalogues = assembleCatalogues(programmes, resolvedCours, resolvedSeries)
  console.log(`      ${resolvedCours.length} cours, ${resolvedSeries.length} series, ${catalogues.length} catalogues`)

  // Phase 4 — Write output
  console.log('[5/5] Writing output...')
  const fileCount = await writeOutput({
    programmes,
    catalogues,
    resolvedCours,
    resolvedSeries,
    htmlFiles,
    qcmFiles,
  })
  console.log(`      ${fileCount} files written to src/generated/`)

  const elapsed = ((Date.now() - startTime) / 1000).toFixed(1)
  console.log(`\nDone in ${elapsed}s\n`)
}

main().catch(err => {
  console.error('Pipeline failed:', err)
  process.exit(1)
})
