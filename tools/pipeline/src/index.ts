/**
 * Content Pipeline — CLI entry point
 *
 * Reads MDX atoms + YAML molecules, validates, compiles to HTML/JSON,
 * resolves molecules, and writes everything to src/generated/.
 */

import { readAllAtoms } from './stages/read-atoms.js'
import { readAllContent } from './stages/read-molecules.js'
import { validateContent } from './stages/validate.js'
import { compileAllAtoms } from './stages/compile-all.js'
import { resolveAllLivrets } from './stages/resolve-livrets.js'
import { assembleCatalogues } from './stages/assemble-catalogues.js'
import { writeOutput } from './stages/write-output.js'
import { generateAllPdfs } from './stages/generate-pdfs.js'

async function main() {
  const startTime = Date.now()
  console.log('')

  // Phase 1 — Read
  console.log('[1/6] Reading content...')
  const atoms = readAllAtoms()
  const { programmes, livrets } = readAllContent()
  console.log(`      ${atoms.length} atoms, ${livrets.length} livrets, ${programmes.length} programmes`)

  // Phase 2 — Validate
  console.log('[2/6] Validating references...')
  const errors = validateContent(atoms, livrets, programmes)
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

  // Phase 3 — Compile atoms
  console.log('[3/6] Compiling atoms...')
  const { htmlFiles, qcmFiles, rawMdxFiles } = await compileAllAtoms(atoms)
  console.log(`      ${htmlFiles.size} HTML + ${qcmFiles.size} QCM + ${rawMdxFiles.size} raw MDX compiled`)

  // Phase 4 — Resolve molecules
  console.log('[4/6] Resolving molecules...')
  const atomMap = new Map(atoms.map(a => [a.id, a]))
  const resolvedLivrets = resolveAllLivrets(livrets, atomMap)
  const catalogues = assembleCatalogues(programmes, resolvedLivrets)
  console.log(`      ${resolvedLivrets.length} livrets, ${catalogues.length} catalogues`)

  // Phase 5 — Write output
  console.log('[5/6] Writing output...')
  const fileCount = await writeOutput({
    programmes,
    catalogues,
    resolvedLivrets,
    htmlFiles,
    qcmFiles,
    rawMdxFiles,
  })
  console.log(`      ${fileCount} files written to src/generated/`)

  // Phase 6 — Generate PDFs
  console.log('[6/6] Generating PDFs...')
  const pdfCount = await generateAllPdfs({ atoms, resolvedLivrets, programmes })
  console.log(`      ${pdfCount} PDFs generated to public/pdfs/`)

  const elapsed = ((Date.now() - startTime) / 1000).toFixed(1)
  console.log(`\nDone in ${elapsed}s\n`)
}

main().catch(err => {
  console.error('Pipeline failed:', err)
  process.exit(1)
})
