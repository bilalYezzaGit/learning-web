import type { RawAtom, RawCours, RawSerie, RawProgramme, RawStep, ValidationError } from '../types.js'

function isQuizStep(step: RawStep): step is { quiz: string[] } {
  return typeof step === 'object' && 'quiz' in step
}

export function validateContent(
  atoms: RawAtom[],
  cours: RawCours[],
  series: RawSerie[],
  programmes: RawProgramme[],
): ValidationError[] {
  const errors: ValidationError[] = []
  const atomIds = new Set(atoms.map(a => a.id))
  const coursIds = new Set(cours.map(c => c.slug))
  const serieIds = new Set(series.map(s => s.slug))

  // Check atom IDs are unique
  const seenAtomIds = new Set<string>()
  for (const atom of atoms) {
    if (seenAtomIds.has(atom.id)) {
      errors.push({ source: `atom/${atom.id}`, message: `Duplicate atom ID`, severity: 'error' })
    }
    seenAtomIds.add(atom.id)
  }

  // Check QCMs have correctOption
  for (const atom of atoms) {
    if (atom.type === 'qcm' && atom.correctOption === undefined) {
      errors.push({ source: `atom/${atom.id}`, message: 'QCM missing correctOption', severity: 'error' })
    }
  }

  // Check cours references
  for (const c of cours) {
    for (const section of c.sections) {
      for (const step of section.steps) {
        checkStep(step, `cours/${c.slug} > ${section.label}`, atomIds, errors)
      }
    }
  }

  // Check series references
  for (const s of series) {
    for (const step of s.steps) {
      checkStep(step, `series/${s.slug}`, atomIds, errors)
    }
  }

  // Check programme references
  for (const p of programmes) {
    for (const slug of p.cours) {
      if (!coursIds.has(slug)) {
        errors.push({ source: `programme/${p.id}`, message: `Cours "${slug}" not found`, severity: 'error' })
      }
    }
    for (const slug of p.series) {
      if (!serieIds.has(slug)) {
        errors.push({ source: `programme/${p.id}`, message: `Serie "${slug}" not found`, severity: 'error' })
      }
    }
  }

  // Warn about orphan atoms
  const referencedIds = new Set<string>()
  for (const c of cours) {
    for (const section of c.sections) {
      for (const step of section.steps) {
        if (isQuizStep(step)) step.quiz.forEach(id => referencedIds.add(id))
        else referencedIds.add(step)
      }
    }
  }
  for (const s of series) {
    for (const step of s.steps) {
      if (isQuizStep(step)) step.quiz.forEach(id => referencedIds.add(id))
      else referencedIds.add(step)
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
