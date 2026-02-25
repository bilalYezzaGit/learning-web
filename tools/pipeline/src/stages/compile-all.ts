import { compileMdxToHtml } from './compile-mdx.js'
import { compileQcm } from './compile-qcm.js'
import type { RawAtom, CompiledQcm } from '../types.js'

const CONCURRENCY = 20

export async function compileAllAtoms(atoms: RawAtom[]): Promise<{
  htmlFiles: Map<string, string>
  qcmFiles: Map<string, CompiledQcm>
}> {
  const htmlFiles = new Map<string, string>()
  const qcmFiles = new Map<string, CompiledQcm>()

  // Process in batches for controlled concurrency
  for (let i = 0; i < atoms.length; i += CONCURRENCY) {
    const batch = atoms.slice(i, i + CONCURRENCY)
    await Promise.all(
      batch.map(async (atom) => {
        try {
          if (atom.type === 'qcm') {
            const compiled = await compileQcm(atom)
            qcmFiles.set(atom.id, compiled)
          } else {
            const html = await compileMdxToHtml(atom.rawContent)
            htmlFiles.set(atom.id, html)
          }
        } catch (err) {
          const msg = err instanceof Error ? err.message : String(err)
          throw new Error(`Failed to compile atom "${atom.id}": ${msg}`)
        }
      }),
    )

    // Progress
    const done = Math.min(i + CONCURRENCY, atoms.length)
    process.stdout.write(`\r      ${done}/${atoms.length} compiled`)
  }

  process.stdout.write('\n')
  return { htmlFiles, qcmFiles }
}
