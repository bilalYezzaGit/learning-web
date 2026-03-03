/**
 * Typst → PDF compiler
 *
 * Compiles a complete Typst document to PDF using the Typst WASM compiler.
 * Reuses the $typst singleton already initialized by compile-typst.ts (SVG compiler)
 * during phase 3 of the pipeline.
 */

import { $typst } from '@myriaddreamin/typst.ts/dist/esm/contrib/snippet.mjs'
import { compileTypstToSvg } from '../stages/compile-typst.js'

/**
 * Ensure the Typst WASM compiler is initialized.
 * We trigger this by calling the existing SVG compiler with a no-op,
 * which handles the singleton initialization.
 */
let initialized = false

async function ensureInit(): Promise<void> {
  if (initialized) return
  // Trigger the SVG compiler's ensureInit via a minimal compile
  await compileTypstToSvg('#[]')
  initialized = true
}

/**
 * Compile a full Typst document to PDF.
 *
 * Unlike compileTypstToSvg, this does NOT wrap the content with auto-sized page —
 * the template is expected to set up A4 page layout itself.
 */
export async function compileTypstToPdf(source: string): Promise<Uint8Array> {
  await ensureInit()
  const pdf = await $typst.pdf({ mainContent: source })
  if (!pdf) {
    throw new Error('Typst PDF compilation returned empty result')
  }
  return new Uint8Array(pdf)
}
