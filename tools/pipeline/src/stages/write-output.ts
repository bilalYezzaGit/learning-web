import fs from 'fs'
import path from 'path'
import { GENERATED_DIR } from '../config.js'
import type { RawProgramme, Catalogue, ResolvedCours, ResolvedSerie, CompiledQcm } from '../types.js'

interface WriteInput {
  programmes: RawProgramme[]
  catalogues: Catalogue[]
  resolvedCours: ResolvedCours[]
  resolvedSeries: ResolvedSerie[]
  htmlFiles: Map<string, string>
  qcmFiles: Map<string, CompiledQcm>
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
  const coursDir = path.join(GENERATED_DIR, 'cours')
  const seriesDir = path.join(GENERATED_DIR, 'series')
  const cataloguesDir = path.join(GENERATED_DIR, 'catalogues')

  ensureDir(atomsDir)
  ensureDir(coursDir)
  ensureDir(seriesDir)
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
    active: input.resolvedCours.some(c => c.programme === p.id && c.visible),
  }))
  writeJson(path.join(GENERATED_DIR, 'parcours.json'), parcoursList)
  count++

  // Catalogues
  for (const cat of input.catalogues) {
    writeJson(path.join(cataloguesDir, `${cat.id}.json`), cat)
    count++
  }

  // Cours
  for (const cours of input.resolvedCours) {
    writeJson(path.join(coursDir, `${cours.slug}.json`), cours)
    count++
  }

  // Series
  for (const serie of input.resolvedSeries) {
    writeJson(path.join(seriesDir, `${serie.slug}.json`), serie)
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

  // Manifest
  writeJson(path.join(GENERATED_DIR, 'manifest.json'), {
    generatedAt: new Date().toISOString(),
    stats: {
      atoms: {
        total: input.htmlFiles.size + input.qcmFiles.size,
        html: input.htmlFiles.size,
        qcm: input.qcmFiles.size,
      },
      cours: input.resolvedCours.length,
      series: input.resolvedSeries.length,
      programmes: input.programmes.length,
      parcours: parcoursList.length,
      catalogues: input.catalogues.length,
    },
  })
  count++

  return count
}
