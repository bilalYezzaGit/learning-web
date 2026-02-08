/**
 * Zod schemas for content validation
 *
 * Validates atom frontmatter, cours/series/programme molecules
 * at parse time instead of relying on type casts.
 */

import { z } from 'zod'

// =============================================================================
// Atoms
// =============================================================================

const atomTypeSchema = z.enum(['lesson', 'exercise', 'qcm'])

const exerciseCategorySchema = z.enum([
  'application',
  'approfondissement',
  'synthese',
  'probleme',
  'demonstration',
])

export const atomMetaSchema = z
  .object({
    type: atomTypeSchema,
    title: z.string().min(1, 'Atom title is required'),
    difficulty: z.number().int().min(0).max(3).default(1),
    timeMinutes: z.number().int().min(1).default(5),
    tags: z.array(z.string()).default([]),
    category: exerciseCategorySchema.optional(),
    correctOption: z.number().int().min(0).optional(),
  })
  .refine(
    (data) => data.type !== 'exercise' || data.category !== undefined,
    { message: 'category is required for exercise atoms', path: ['category'] },
  )

// =============================================================================
// Steps (shared by cours sections and series)
// =============================================================================

const quizStepSchema = z.object({
  quiz: z.array(z.string().min(1)).min(1, 'Quiz must have at least 1 atom ID'),
})

const stepSchema = z.union([z.string().min(1), quizStepSchema])

// =============================================================================
// Cours molecule
// =============================================================================

const moleculeSectionSchema = z.object({
  label: z.string().min(1, 'Section label is required'),
  steps: z.array(stepSchema).min(1, 'Section must have at least 1 step'),
})

export const coursMoleculeSchema = z.object({
  title: z.string().min(1),
  description: z.string().min(1),
  programme: z.string().min(1),
  trimester: z.string().min(1),
  order: z.number().int().min(0),
  estimatedMinutes: z.number().int().min(1),
  objectives: z.array(z.string()).min(1, 'At least 1 objective is required'),
  sections: z.array(moleculeSectionSchema).min(1, 'At least 1 section is required'),
})

// =============================================================================
// Series molecule
// =============================================================================

const seriesTypeSchema = z.enum([
  'mono-module',
  'cross-module',
  'devoir-controle',
  'devoir-synthese',
])

export const seriesMoleculeSchema = z.object({
  title: z.string().min(1),
  description: z.string().min(1),
  difficulty: z.number().int().min(0).max(3),
  estimatedMinutes: z.number().int().min(1),
  tags: z.array(z.string()).default([]),
  steps: z.array(stepSchema).min(2, 'Series must have at least 2 steps'),
  type: seriesTypeSchema.default('mono-module'),
  trimestre: z.union([z.literal(1), z.literal(2), z.literal(3)]),
  modules: z.array(z.string()).default([]),
  priority: z.number().int().default(0),
})

// =============================================================================
// Programme
// =============================================================================

export const programmeSchema = z.object({
  label: z.string().min(1),
  levelSlug: z.string().min(1),
  sectionSlug: z.string().min(1),
  order: z.number().int().min(0),
  color: z.string().min(1),
  icon: z.string().min(1),
  cours: z.array(z.string()),
  series: z.array(z.string()).default([]),
})

// =============================================================================
// Reference validation
// =============================================================================

export interface ContentValidationError {
  source: string
  message: string
}

/**
 * Validate that all atom IDs referenced in molecules actually exist.
 * Returns a list of errors (empty = all good).
 */
export function validateContentReferences(
  atomIds: Set<string>,
  cours: Array<{ slug: string; sections: Array<{ label: string; steps: Array<string | { quiz: string[] }> }> }>,
  series: Array<{ slug: string; steps: Array<string | { quiz: string[] }> }>,
): ContentValidationError[] {
  const errors: ContentValidationError[] = []

  function checkStep(step: string | { quiz: string[] }, source: string) {
    if (typeof step === 'string') {
      if (!atomIds.has(step)) {
        errors.push({ source, message: `Atom "${step}" not found` })
      }
    } else {
      for (const id of step.quiz) {
        if (!atomIds.has(id)) {
          errors.push({ source, message: `QCM atom "${id}" not found` })
        }
      }
    }
  }

  for (const c of cours) {
    for (const section of c.sections) {
      for (const step of section.steps) {
        checkStep(step, `cours/${c.slug} > ${section.label}`)
      }
    }
  }

  for (const s of series) {
    for (const step of s.steps) {
      checkStep(step, `series/${s.slug}`)
    }
  }

  return errors
}
