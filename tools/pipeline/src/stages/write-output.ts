import fs from 'fs'
import path from 'path'
import { GENERATED_DIR } from '../config.js'
import type { RawProgramme, Catalogue, ResolvedLivret, CompiledQcm } from '../types.js'

interface WriteInput {
  programmes: RawProgramme[]
  catalogues: Catalogue[]
  resolvedLivrets: ResolvedLivret[]
  htmlFiles: Map<string, string>
  qcmFiles: Map<string, CompiledQcm>
  rawMdxFiles: Map<string, string>
}

function ensureDir(dir: string) {
  fs.mkdirSync(dir, { recursive: true })
}

function writeJson(filePath: string, data: unknown) {
  fs.writeFileSync(filePath, JSON.stringify(data, null, 2), 'utf-8')
}

export async function writeOutput(input: WriteInput): Promise<number> {
  let count = 0

  // Clean and recreate
  if (fs.existsSync(GENERATED_DIR)) {
    fs.rmSync(GENERATED_DIR, { recursive: true })
  }

  const atomsDir = path.join(GENERATED_DIR, 'atoms')
  const livretsDir = path.join(GENERATED_DIR, 'livrets')
  const cataloguesDir = path.join(GENERATED_DIR, 'catalogues')

  ensureDir(atomsDir)
  ensureDir(livretsDir)
  ensureDir(cataloguesDir)

  // Programmes
  writeJson(path.join(GENERATED_DIR, 'programmes.json'), input.programmes)
  count++

  // Parcours (lightweight routing/UI list)
  const parcoursList = input.programmes.map(p => ({
    slug: p.id,
    label: p.label,
    level: p.levelSlug,
    section: p.sectionSlug,
    description: p.description,
    order: p.order,
    visible: p.visible,
    active: input.resolvedLivrets.some(l => l.programme === p.id && l.visible),
  }))
  writeJson(path.join(GENERATED_DIR, 'parcours.json'), parcoursList)
  count++

  // Catalogues
  for (const cat of input.catalogues) {
    writeJson(path.join(cataloguesDir, `${cat.id}.json`), cat)
    count++
  }

  // Livrets
  for (const livret of input.resolvedLivrets) {
    writeJson(path.join(livretsDir, `${livret.slug}.json`), livret)
    count++
  }

  // Atom HTML files
  for (const [id, html] of input.htmlFiles) {
    fs.writeFileSync(path.join(atomsDir, `${id}.html`), html, 'utf-8')
    count++
  }

  // Atom QCM JSON files
  for (const [id, qcm] of input.qcmFiles) {
    writeJson(path.join(atomsDir, `${id}.json`), qcm)
    count++
  }

  // Raw MDX files (for exercise scan/correction API)
  for (const [id, mdx] of input.rawMdxFiles) {
    fs.writeFileSync(path.join(atomsDir, `${id}.mdx`), mdx, 'utf-8')
    count++
  }

  // Manifest
  writeJson(path.join(GENERATED_DIR, 'manifest.json'), {
    generatedAt: new Date().toISOString(),
    stats: {
      atoms: {
        total: input.htmlFiles.size + input.qcmFiles.size,
        html: input.htmlFiles.size,
        qcm: input.qcmFiles.size,
        rawMdx: input.rawMdxFiles.size,
      },
      livrets: input.resolvedLivrets.length,
      programmes: input.programmes.length,
      parcours: parcoursList.length,
      catalogues: input.catalogues.length,
    },
  })
  count++

  return count
}
