import fs from 'fs'
import path from 'path'
import { parse as parseYaml } from 'yaml'
import { z } from 'zod'
import { CONTENT_DIR } from '../config.js'
import type { RawLivret, RawProgramme } from '../types.js'

// ── Schemas ──

const quizStepSchema = z.object({
  quiz: z.array(z.string().min(1)).min(1),
})
const stepSchema = z.union([z.string().min(1), quizStepSchema])

const moleculeSectionSchema = z.object({
  label: z.string().min(1),
  steps: z.array(stepSchema).min(1),
})

const livretMoleculeSchema = z.object({
  kind: z.literal('livret'),
  visible: z.boolean().default(true),
  title: z.string().min(1),
  description: z.string().min(1),
  trimester: z.string().min(1),
  order: z.number().int().min(0),
  difficulty: z.number().int().min(0).max(3).optional(),
  estimatedMinutes: z.number().int().min(1).optional(),
  tags: z.array(z.string()).default([]),
  objectives: z.array(z.string()).default([]),
  sections: z.array(moleculeSectionSchema).min(1),
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
 * Scan the content/ tree and return all programmes and livrets.
 * Programme dirs contain _programme.yaml. Modules are their subdirectories.
 * Molecules live in {module}/_molecules/*.yaml with kind: livret.
 * Programme.livrets is auto-populated from discovered molecules.
 */
export function readAllContent(): {
  programmes: RawProgramme[]
  livrets: RawLivret[]
} {
  const programmes: RawProgramme[] = []
  const livrets: RawLivret[] = []

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

    const progLivrets: string[] = []

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

        if (data.kind !== 'livret') {
          throw new Error(`Unknown molecule kind in "${slug}": ${data.kind} (expected "livret")`)
        }

        const result = livretMoleculeSchema.safeParse(data)
        if (!result.success) {
          const issues = result.error.issues.map(i => `${i.path.join('.')}: ${i.message}`).join(', ')
          throw new Error(`Invalid livret molecule "${slug}": ${issues}`)
        }

        livrets.push({
          slug,
          programme: progDir.name,
          ...result.data,
        })
        progLivrets.push(slug)
      }
    }

    // Sort livrets by order
    progLivrets.sort((a, b) => {
      const la = livrets.find(l => l.slug === a)
      const lb = livrets.find(l => l.slug === b)
      return (la?.order ?? 0) - (lb?.order ?? 0)
    })

    programmes.push({
      id: progDir.name,
      ...progResult.data,
      livrets: progLivrets,
    })
  }

  return { programmes, livrets }
}
