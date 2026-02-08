/**
 * Migration script: Add type, trimestre, modules, priority to series YAML
 *
 * Deduces trimestre from the parent cours module.
 * Usage: node scripts/migrate-series-metadata.mjs [--dry-run]
 * Rollback: git checkout content/molecules/series/
 */

import fs from 'fs'
import path from 'path'
import { fileURLToPath } from 'url'

const __dirname = path.dirname(fileURLToPath(import.meta.url))
const SERIES_DIR = path.join(__dirname, '..', 'content', 'molecules', 'series')
const COURS_DIR = path.join(__dirname, '..', 'content', 'molecules', 'cours')
const dryRun = process.argv.includes('--dry-run')

// Build a mapping from series slug → [cours slug, trimester]
const seriesModuleMap = new Map()

const coursFiles = fs.readdirSync(COURS_DIR).filter(f => f.endsWith('.yaml'))
for (const file of coursFiles) {
  const raw = fs.readFileSync(path.join(COURS_DIR, file), 'utf-8')
  const coursSlug = file.replace('.yaml', '')

  // Extract trimester
  const trimMatch = raw.match(/^trimester:\s*T(\d)/m)
  const trimestre = trimMatch ? parseInt(trimMatch[1]) : 1

  // Find series slugs referenced in this cours... but cours don't list series.
  // Instead, we map by series name prefix to cours slug
  seriesModuleMap.set(coursSlug, trimestre)
}

// Map series prefix → (cours module, trimestre)
const seriesToCours = {
  'continuite-fondamentaux': ['continuite', 1],
  'tvi-maitrise': ['continuite', 1],
  'fn-vocabulaire-domaine': ['fonctions', 1],
  'fn-parite-variations': ['fonctions', 1],
  'der-nombre-derive-tangente': ['derivation', 2],
  'der-regles-etude': ['derivation', 2],
  'angles-mesure-et-conversion': ['angles', 1],
  'angles-cercle-inscrits': ['angles', 1],
  'thales-direct-calculs': ['thales', 1],
  'thales-reciproque-parallelisme': ['thales', 1],
  'trigo-rapports-bases': ['rapports-trigo', 1],
  'trigo-calculs-applications': ['rapports-trigo', 1],
  'vt-bases-vecteurs': ['vecteurs-translations', 1],
  'vt-translations-applications': ['vecteurs-translations', 1],
  'sv-chasles-simplifications': ['somme-vecteurs', 2],
  'sv-applications-geometrie': ['somme-vecteurs', 2],
  'repere-coordonnees-bases': ['repere', 2],
  'repere-milieu-distance-applications': ['repere', 2],
  'qt-definition-construction': ['quart-de-tour', 2],
  'qt-proprietes-composition': ['quart-de-tour', 2],
  'ss-sections-bases': ['sections-solides', 2],
  'ss-sections-applications': ['sections-solides', 2],
  'num1-puissances-racines': ['numerique-1', 1],
  'num1-rationalisation-applications': ['numerique-1', 1],
  'num2-intervalles-valeur-absolue': ['numerique-2', 2],
  'num2-equations-encadrements': ['numerique-2', 2],
  'algebre-identites-factorisation': ['algebre', 1],
  'algebre-polynomes-equations': ['algebre', 1],
  'fl-definition-representation': ['fonctions-lineaires', 2],
  'fl-coefficient-proportionnalite': ['fonctions-lineaires', 2],
  'ei-equations-bases': ['equations-inequations', 2],
  'ei-produits-quotients': ['equations-inequations', 2],
  'sys-methodes-resolution': ['systemes', 3],
  'sys-applications-graphique': ['systemes', 3],
  'stat-indicateurs': ['statistiques', 3],
  'stat-graphiques-synthese': ['statistiques', 3],
  'fa-fondamentaux': ['fonctions-affines', 3],
  'fa-signe-inequations': ['fonctions-affines', 3],
}

const seriesFiles = fs.readdirSync(SERIES_DIR).filter(f => f.endsWith('.yaml'))
let updated = 0, skipped = 0

for (const file of seriesFiles) {
  const slug = file.replace('.yaml', '')
  const filePath = path.join(SERIES_DIR, file)
  let raw = fs.readFileSync(filePath, 'utf-8')

  // Skip if already has trimestre
  if (raw.includes('trimestre:')) {
    skipped++
    continue
  }

  const mapping = seriesToCours[slug]
  if (!mapping) {
    console.error(`WARNING: No mapping for ${slug}, skipping`)
    skipped++
    continue
  }

  const [coursSlug, trimestre] = mapping

  // Append new fields before EOF
  const newFields = [
    `type: mono-module`,
    `trimestre: ${trimestre}`,
    `modules: [${coursSlug}]`,
    `priority: 0`,
  ].join('\n')

  // Insert after the last line (before any trailing newline)
  raw = raw.trimEnd() + '\n' + newFields + '\n'

  if (dryRun) {
    console.log(`DRY-RUN: ${slug} → trimestre: ${trimestre}, modules: [${coursSlug}]`)
  } else {
    fs.writeFileSync(filePath, raw, 'utf-8')
    console.log(`UPDATED: ${slug} → trimestre: ${trimestre}, modules: [${coursSlug}]`)
  }
  updated++
}

console.log(`\nDone. Updated: ${updated}, Skipped: ${skipped}`)
