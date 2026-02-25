import fs from 'fs'
import path from 'path'
import { parse as parseYaml } from 'yaml'
import { z } from 'zod'
import { COURS_DIR, SERIES_DIR, PROGRAMMES_DIR } from '../config.js'
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
  title: z.string().min(1),
  description: z.string().min(1),
  programme: z.string().min(1),
  trimester: z.string().min(1),
  order: z.number().int().min(0),
  estimatedMinutes: z.number().int().min(1),
  objectives: z.array(z.string()).min(1),
  sections: z.array(moleculeSectionSchema).min(1),
})

const seriesMoleculeSchema = z.object({
  title: z.string().min(1),
  description: z.string().min(1),
  difficulty: z.number().int().min(0).max(3),
  estimatedMinutes: z.number().int().min(1),
  tags: z.array(z.string()).default([]),
  steps: z.array(stepSchema).min(2),
  type: z.enum(['mono-module', 'cross-module', 'devoir-controle', 'devoir-synthese']).default('mono-module'),
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
  cours: z.array(z.string()),
  series: z.array(z.string()).default([]),
})

// ── Helpers ──

function readYamlDir<T>(dir: string, schema: z.ZodType<T>, idField: 'slug' | 'id'): (T & Record<string, unknown>)[] {
  if (!fs.existsSync(dir)) return []

  return fs.readdirSync(dir)
    .filter(f => f.endsWith('.yaml'))
    .sort()
    .map(f => {
      const idValue = f.replace('.yaml', '')
      const raw = fs.readFileSync(path.join(dir, f), 'utf-8')
      const data = parseYaml(raw) as Record<string, unknown>
      const result = schema.safeParse(data)
      if (!result.success) {
        const issues = result.error.issues.map(i => `${i.path.join('.')}: ${i.message}`).join(', ')
        throw new Error(`Invalid ${idField === 'slug' ? 'molecule' : 'programme'} "${idValue}": ${issues}`)
      }
      return { [idField]: idValue, ...result.data } as T & Record<string, unknown>
    })
}

// ── Exports ──

export function readAllCours(): RawCours[] {
  return readYamlDir(COURS_DIR, coursMoleculeSchema, 'slug') as unknown as RawCours[]
}

export function readAllSeries(): RawSerie[] {
  return readYamlDir(SERIES_DIR, seriesMoleculeSchema, 'slug') as unknown as RawSerie[]
}

export function readAllProgrammes(): RawProgramme[] {
  return readYamlDir(PROGRAMMES_DIR, programmeSchema, 'id') as unknown as RawProgramme[]
}
