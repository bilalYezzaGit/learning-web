import { Theme } from 'mafs'

// ---------------------------------------------------------------------------
// Primary function: f(x) = x^3 - 3x + 1
// ---------------------------------------------------------------------------

export const PRIMARY_FN = (x: number) => x ** 3 - 3 * x + 1
export const PRIMARY_FN_EXPR = 'f(x) = x\u00B3 \u2212 3x + 1'

// Floor (step) function for counter-example
export const FLOOR_FN = (x: number) => Math.floor(x)

// ---------------------------------------------------------------------------
// Color palette (Mafs CSS variables)
// ---------------------------------------------------------------------------

export const COLORS = {
  curve: Theme.blue,
  interval: Theme.green,
  kLine: Theme.pink,
  solution: Theme.orange,
  bisectLeft: Theme.green,
  bisectRight: Theme.red,
  bisectMid: Theme.yellow,
} as const

// ---------------------------------------------------------------------------
// Motion spring presets
// ---------------------------------------------------------------------------

export const SPRING_SMOOTH = { type: 'spring' as const, stiffness: 120, damping: 20 }

// ---------------------------------------------------------------------------
// Numerical root-finding via bisection
// ---------------------------------------------------------------------------

/**
 * Find x in [a,b] such that fn(x) ~ k, using bisection.
 * Returns null if no sign change detected.
 */
export function findRoot(
  fn: (x: number) => number,
  k: number,
  a: number,
  b: number,
  maxIter = 60,
  tol = 1e-10,
): number | null {
  let lo = a
  let hi = b
  let fLo = fn(lo) - k
  let fHi = fn(hi) - k

  // No sign change — cannot bisect
  if (fLo * fHi > 0) return null

  for (let i = 0; i < maxIter; i++) {
    const mid = (lo + hi) / 2
    const fMid = fn(mid) - k

    if (Math.abs(fMid) < tol) return mid

    if (fLo * fMid < 0) {
      hi = mid
      fHi = fMid
    } else {
      lo = mid
      fLo = fMid
    }
  }

  return (lo + hi) / 2
}

/**
 * Run one bisection step: given [a,b], return the next narrowed interval.
 */
export function bisectionStep(
  fn: (x: number) => number,
  a: number,
  b: number,
): { a: number; b: number; mid: number; fMid: number } {
  const mid = (a + b) / 2
  const fMid = fn(mid)
  const fA = fn(a)

  if (fA * fMid <= 0) {
    return { a, b: mid, mid, fMid }
  }
  return { a: mid, b, mid, fMid }
}
