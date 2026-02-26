/**
 * Typst → SVG compiler
 *
 * Compiles ```typst code blocks to inline SVG using the Typst WASM compiler.
 * Used at build time only — the output is static SVG embedded in HTML.
 */

import { execFileSync } from 'child_process'
import { $typst, TypstSnippet } from '@myriaddreamin/typst.ts/dist/esm/contrib/snippet.mjs'
import { MemoryAccessModel } from '@myriaddreamin/typst.ts/dist/esm/fs/memory.mjs'

let initialized = false

async function ensureInit(): Promise<void> {
  if (initialized) return

  const accessModel = new MemoryAccessModel()

  $typst.use(
    TypstSnippet.preloadFontAssets({ assets: ['text'] }),
    TypstSnippet.withAccessModel(accessModel),
    TypstSnippet.fetchPackageBy(accessModel, (_spec, httpUrl) => {
      try {
        const buf = execFileSync('curl', ['-sL', httpUrl], { maxBuffer: 50 * 1024 * 1024 })
        return new Uint8Array(buf)
      } catch {
        return undefined
      }
    }),
  )

  initialized = true
}

export async function compileTypstToSvg(code: string): Promise<string> {
  await ensureInit()
  // Wrap with auto-sized page so SVG is cropped to content (not A4)
  const wrapped = `#set page(width: auto, height: auto, margin: 0.5em)\n${code}`
  const svg = await $typst.svg({ mainContent: wrapped })
  return svg
}
