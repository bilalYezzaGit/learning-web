import fs from 'fs'
import path from 'path'
import { parse as parseYaml } from 'yaml'
import { z } from 'zod'
import { CONTENT_DIR } from '../config.js'
import type { RawCours, RawSerie, RawProgramme } from '../types.js'

// ── Schemas ──

const quizStepSchema = z.object({
  quiz: z.array(z.string().min(1)).min(1),
})
const stepSchema = z.union([z.string().min(1), quizStepSchema])

const moleculeSectionSchema = z.object({
  label: z.string().min(1),
  steps: z.array(stepSchema).min(1),
})

const coursMoleculeSchema = z.object({
  kind: z.literal('cours'),
  visible: z.boolean().default(true),
  title: z.string().min(1),
  description: z.string().min(1),
  trimester: z.string().min(1),
  order: z.number().int().min(0),
  estimatedMinutes: z.number().int().min(1),
  objectives: z.array(z.string()).min(1),
  sections: z.array(moleculeSectionSchema).min(1),
})

const seriesMoleculeSchema = z.object({
  kind: z.literal('serie'),
  visible: z.boolean().default(true),
  title: z.string().min(1),
  description: z.string().min(1),
  difficulty: z.number().int().min(0).max(3),
  estimatedMinutes: z.number().int().min(1),
  tags: z.array(z.string()).default([]),
  steps: z.array(stepSchema).min(2),
  type: z.enum(['mono-module', 'cross-module', 'devoir-controle', 'devoir-synthese', 'diagnostic']).default('mono-module'),
  trimestre: z.union([z.literal(1), z.literal(2), z.literal(3)]),
  modules: z.array(z.string()).default([]),
  priority: z.number().int().default(0),
  successThreshold: z.number().int().min(0).max(100).default(70),
})

const programmeSchema = z.object({
  label: z.string().min(1),
  levelSlug: z.string().min(1),
  sectionSlug: z.string().min(1),
  order: z.number().int().min(0),
  color: z.string().min(1),
  icon: z.string().min(1),
  visible: z.boolean().default(true),
  description: z.string().optional(),
})

// ── Discovery ──

/**
 * Scan the content/ tree and return all programmes, cours, and series.
 * Programme dirs contain _programme.yaml. Modules are their subdirectories.
 * Molecules live in {module}/_molecules/*.yaml with a `kind` field.
 * Programme.cours and programme.series are auto-populated from discovered molecules.
 */
export function readAllContent(): {
  programmes: RawProgramme[]
  cours: RawCours[]
  series: RawSerie[]
} {
  const programmes: RawProgramme[] = []
  const cours: RawCours[] = []
  const series: RawSerie[] = []

  const progDirs = fs.readdirSync(CONTENT_DIR, { withFileTypes: true })
    .filter(d => d.isDirectory())
    .map(d => ({ name: d.name, path: path.join(CONTENT_DIR, d.name) }))
    .filter(d => fs.existsSync(path.join(d.path, '_programme.yaml')))
    .sort((a, b) => a.name.localeCompare(b.name))

  for (const progDir of progDirs) {
    // Read programme metadata
    const progRaw = fs.readFileSync(path.join(progDir.path, '_programme.yaml'), 'utf-8')
    const progData = parseYaml(progRaw) as Record<string, unknown>
    const progResult = programmeSchema.safeParse(progData)
    if (!progResult.success) {
      const issues = progResult.error.issues.map(i => `${i.path.join('.')}: ${i.message}`).join(', ')
      throw new Error(`Invalid programme "${progDir.name}": ${issues}`)
    }

    const progCours: string[] = []
    const progSeries: string[] = []

    // Scan module directories
    const moduleDirs = fs.readdirSync(progDir.path, { withFileTypes: true })
      .filter(d => d.isDirectory() && !d.name.startsWith('_'))
      .map(d => path.join(progDir.path, d.name))
      .sort()

    for (const moduleDir of moduleDirs) {
      const moleculesDir = path.join(moduleDir, '_molecules')
      if (!fs.existsSync(moleculesDir)) continue

      const yamlFiles = fs.readdirSync(moleculesDir)
        .filter(f => f.endsWith('.yaml'))
        .sort()

      for (const yamlFile of yamlFiles) {
        const slug = yamlFile.replace('.yaml', '')
        const raw = fs.readFileSync(path.join(moleculesDir, yamlFile), 'utf-8')
        const data = parseYaml(raw) as Record<string, unknown>

        if (data.kind === 'cours') {
          const result = coursMoleculeSchema.safeParse(data)
          if (!result.success) {
            const issues = result.error.issues.map(i => `${i.path.join('.')}: ${i.message}`).join(', ')
            throw new Error(`Invalid cours molecule "${slug}": ${issues}`)
          }
          cours.push({
            slug,
            programme: progDir.name,
            ...result.data,
          })
          progCours.push(slug)
        } else if (data.kind === 'serie') {
          const result = seriesMoleculeSchema.safeParse(data)
          if (!result.success) {
            const issues = result.error.issues.map(i => `${i.path.join('.')}: ${i.message}`).join(', ')
            throw new Error(`Invalid serie molecule "${slug}": ${issues}`)
          }
          series.push({
            slug,
            ...result.data,
          })
          progSeries.push(slug)
        } else {
          throw new Error(`Unknown molecule kind in "${slug}": ${data.kind}`)
        }
      }
    }

    // Sort cours by order, series by priority
    progCours.sort((a, b) => {
      const ca = cours.find(c => c.slug === a)
      const cb = cours.find(c => c.slug === b)
      return (ca?.order ?? 0) - (cb?.order ?? 0)
    })
    progSeries.sort((a, b) => {
      const sa = series.find(s => s.slug === a)
      const sb = series.find(s => s.slug === b)
      return (sa?.priority ?? 0) - (sb?.priority ?? 0)
    })

    programmes.push({
      id: progDir.name,
      ...progResult.data,
      cours: progCours,
      series: progSeries,
    })
  }

  return { programmes, cours, series }
}
