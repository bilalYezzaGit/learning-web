import type { RawAtom, RawLivret, RawProgramme, RawStep, ValidationError } from '../types.js'

function isQuizStep(step: RawStep): step is { quiz: string[] } {
  return typeof step === 'object' && 'quiz' in step
}

export function validateContent(
  atoms: RawAtom[],
  livrets: RawLivret[],
  programmes: RawProgramme[],
): ValidationError[] {
  const errors: ValidationError[] = []
  const atomIds = new Set(atoms.map(a => a.id))
  const livretIds = new Set(livrets.map(l => l.slug))

  // Check atom IDs are unique
  const seenAtomIds = new Set<string>()
  for (const atom of atoms) {
    if (seenAtomIds.has(atom.id)) {
      errors.push({ source: `atom/${atom.id}`, message: `Duplicate atom ID`, severity: 'error' })
    }
    seenAtomIds.add(atom.id)
  }

  // Check QCMs have exactly one :::option{correct}
  for (const atom of atoms) {
    if (atom.type === 'qcm') {
      const correctCount = (atom.rawContent.match(/^:::option\{correct\}/gm) ?? []).length
      if (correctCount === 0) {
        errors.push({ source: `atom/${atom.id}`, message: 'QCM missing :::option{correct}', severity: 'error' })
      } else if (correctCount > 1) {
        errors.push({ source: `atom/${atom.id}`, message: `QCM has ${correctCount} :::option{correct} (expected exactly 1)`, severity: 'error' })
      }
    }
  }

  // Check livret references
  for (const l of livrets) {
    for (const section of l.sections) {
      for (const step of section.steps) {
        checkStep(step, `livret/${l.slug} > ${section.label}`, atomIds, errors)
      }
    }
  }

  // Check programme references
  for (const p of programmes) {
    for (const slug of p.livrets) {
      if (!livretIds.has(slug)) {
        errors.push({ source: `programme/${p.id}`, message: `Livret "${slug}" not found`, severity: 'error' })
      }
    }
  }

  // Warn about orphan atoms
  const referencedIds = new Set<string>()
  for (const l of livrets) {
    for (const section of l.sections) {
      for (const step of section.steps) {
        if (isQuizStep(step)) step.quiz.forEach(id => referencedIds.add(id))
        else referencedIds.add(step)
      }
    }
  }

  const orphans = atoms.filter(a => !referencedIds.has(a.id))
  if (orphans.length > 0) {
    errors.push({
      source: 'orphan-check',
      message: `${orphans.length} orphan atom(s): ${orphans.slice(0, 5).map(a => a.id).join(', ')}${orphans.length > 5 ? '...' : ''}`,
      severity: 'warning',
    })
  }

  return errors
}

function checkStep(step: RawStep, source: string, atomIds: Set<string>, errors: ValidationError[]) {
  if (typeof step === 'object' && 'quiz' in step) {
    for (const id of step.quiz) {
      if (!atomIds.has(id)) {
        errors.push({ source, message: `QCM atom "${id}" not found`, severity: 'warning' })
      }
    }
  } else {
    if (!atomIds.has(step)) {
      errors.push({ source, message: `Atom "${step}" not found`, severity: 'warning' })
    }
  }
}
