/**
 * Variations Table Extension
 *
 * Server Component for rendering sign and variation tables.
 * Pure CSS/Tailwind implementation - no client-side JS needed.
 *
 * @example Sign table
 * ```html
 * <variations var="x" intervals="[-∞,-2,1,+∞]">
 *   <row label="(x-1)(x+2)" kind="sign" values="[+,0,-,0,+]"/>
 * </variations>
 * ```
 *
 * @example Variation table
 * ```html
 * <variations var="x" intervals="[-9,-1,α,+∞]">
 *   <row label="f'(x)" kind="sign" values="[-,-,0,+]"/>
 *   <row label="f" kind="var" values="[+∞,-∞,β,0]"/>
 * </variations>
 * ```
 */

import { cn } from '@/lib/utils'

interface RowData {
  label: string
  kind: 'sign' | 'var'
  values: string[]
}

interface VariationsProps {
  variable?: string
  intervals: string[]
  rows: RowData[]
}

/**
 * Parse sign row values into interval signs and boundary values
 */
function parseSignRow(
  values: string[],
  numIntervals: number,
  numBounds: number
): { intervalSigns: string[]; boundaryValues: (string | null)[] } {
  // Simple format: just interval signs
  if (values.length === numIntervals) {
    return {
      intervalSigns: values,
      boundaryValues: Array(numBounds).fill(null),
    }
  }

  // Interleaved format: alternating signs and boundary values (0, ||)
  const intervalSigns: string[] = []
  const boundaryValues: (string | null)[] = Array(numBounds).fill(null)

  let vi = 0
  for (let b = 0; b < numBounds; b++) {
    // Check for boundary value (not at extremities)
    if (b > 0 && b < numBounds - 1) {
      const currentVal = values[vi]
      if (vi < values.length && (currentVal === '0' || currentVal === '||')) {
        boundaryValues[b] = currentVal
        vi++
      }
    }
    // Get interval sign
    if (b < numIntervals && vi < values.length) {
      const signVal = values[vi]
      if (signVal !== undefined) {
        intervalSigns.push(signVal)
      }
      vi++
    }
  }

  // Pad if needed
  while (intervalSigns.length < numIntervals) {
    intervalSigns.push('')
  }

  return { intervalSigns, boundaryValues }
}

/**
 * Parse variation row values into start/end pairs for each interval
 */
function parseVarPairs(
  values: string[],
  numIntervals: number
): Array<{ start: string; end: string }> {
  const pairs: Array<{ start: string; end: string }> = []
  let vi = 0

  for (let i = 0; i < numIntervals; i++) {
    let start: string
    if (i === 0) {
      start = vi < values.length ? (values[vi++] ?? '') : ''
    } else {
      const remaining = values.length - vi
      const needed = numIntervals - i
      if (remaining > needed) {
        start = values[vi++] ?? ''
      } else {
        start = pairs[pairs.length - 1]?.end ?? ''
      }
    }
    const end = vi < values.length ? (values[vi++] ?? '') : ''
    pairs.push({ start, end })
  }

  return pairs
}

/**
 * Get sign color class
 */
function signColorClass(sign: string): string {
  if (sign === '+') return 'text-emerald-600 dark:text-emerald-400'
  if (sign === '-') return 'text-rose-600 dark:text-rose-400'
  return 'text-stone-900 dark:text-stone-100'
}

/**
 * Get boundary value color class
 */
function boundaryColorClass(value: string): string {
  if (value === '0') return 'text-amber-600 dark:text-amber-400'
  return 'text-stone-900 dark:text-stone-100'
}

/**
 * SVG arrow component for variation rows
 */
function VariationArrow({ increasing }: { increasing: boolean }) {
  return (
    <svg
      width="40"
      height="24"
      viewBox="0 0 40 24"
      fill="none"
      className="text-stone-500 dark:text-stone-400"
      aria-hidden="true"
    >
      <line
        x1="4"
        y1={increasing ? 20 : 4}
        x2="32"
        y2={increasing ? 4 : 20}
        stroke="currentColor"
        strokeWidth="2"
        strokeLinecap="round"
      />
      <polyline
        points={
          increasing
            ? '26,2 32,4 28,9'
            : '26,22 32,20 28,15'
        }
        stroke="currentColor"
        strokeWidth="2"
        strokeLinecap="round"
        strokeLinejoin="round"
        fill="none"
      />
    </svg>
  )
}

export function VariationsTable({
  variable = 'x',
  intervals,
  rows,
}: VariationsProps) {
  const numBounds = intervals.length
  const numIntervals = numBounds - 1

  if (numIntervals <= 0) return null

  // Find the last sign row to determine arrow directions for var rows
  const lastSignRow = [...rows].reverse().find((r) => r.kind === 'sign')
  const lastSignValues = lastSignRow
    ? parseSignRow(lastSignRow.values, numIntervals, numBounds).intervalSigns
    : Array(numIntervals).fill('+')

  return (
    <div className="not-prose my-6 overflow-x-auto rounded-xl border border-stone-200 shadow-sm dark:border-stone-700">
      <table className="w-full border-collapse text-sm">
        {/* Header row with variable and intervals */}
        <thead>
          <tr>
            <th className="w-24 border-r border-b border-stone-200 bg-stone-100/80 px-3 py-2.5 text-center font-bold text-stone-700 dark:border-stone-700 dark:bg-stone-800/80 dark:text-stone-300">
              {variable}
            </th>
            {intervals.slice(0, -1).map((bound, i) => (
              <th
                key={i}
                className="relative border-b border-stone-200 bg-stone-100/80 px-3 py-2.5 dark:border-stone-700 dark:bg-stone-800/80"
              >
                {/* Left boundary */}
                <span
                  className={cn(
                    'absolute left-1.5 top-1/2 -translate-y-1/2 font-semibold text-stone-700 dark:text-stone-300',
                    i === 0 ? '' : '-translate-x-1/2'
                  )}
                >
                  {bound}
                </span>
                {/* Right boundary (last cell only) */}
                {i === numIntervals - 1 && (
                  <span className="absolute right-1.5 top-1/2 -translate-y-1/2 font-semibold text-stone-700 dark:text-stone-300">
                    {intervals[i + 1]}
                  </span>
                )}
              </th>
            ))}
          </tr>
        </thead>

        <tbody>
          {rows.map((row, rowIdx) => {
            const isLastRow = rowIdx === rows.length - 1

            if (row.kind === 'sign') {
              const { intervalSigns, boundaryValues } = parseSignRow(
                row.values,
                numIntervals,
                numBounds
              )

              return (
                <tr key={rowIdx}>
                  <td
                    className={cn(
                      'border-r border-stone-200 px-3 py-3 text-center font-bold text-stone-700 dark:border-stone-700 dark:text-stone-300',
                      !isLastRow && 'border-b'
                    )}
                  >
                    {row.label}
                  </td>
                  {intervalSigns.map((sign, i) => (
                    <td
                      key={i}
                      className={cn(
                        'relative px-3 py-3 text-center',
                        !isLastRow && 'border-b border-stone-200 dark:border-stone-700',
                        i < numIntervals - 1 && 'border-r border-stone-100 dark:border-stone-800'
                      )}
                    >
                      {/* Left boundary value (0 or ||) */}
                      {boundaryValues[i] && (
                        <span
                          className={cn(
                            'absolute left-0 top-1/2 -translate-x-1/2 -translate-y-1/2 rounded-full bg-white px-1 text-xs font-bold dark:bg-stone-900',
                            boundaryColorClass(boundaryValues[i]!)
                          )}
                        >
                          {boundaryValues[i] === '||' ? '║' : boundaryValues[i]}
                        </span>
                      )}
                      {/* Sign */}
                      <span className={cn('text-base font-bold', signColorClass(sign))}>
                        {sign}
                      </span>
                      {/* Right boundary value (last cell only) */}
                      {i === numIntervals - 1 && boundaryValues[i + 1] && (
                        <span
                          className={cn(
                            'absolute right-0 top-1/2 -translate-y-1/2 translate-x-1/2 rounded-full bg-white px-1 text-xs font-bold dark:bg-stone-900',
                            boundaryColorClass(boundaryValues[i + 1]!)
                          )}
                        >
                          {boundaryValues[i + 1] === '||'
                            ? '║'
                            : boundaryValues[i + 1]}
                        </span>
                      )}
                    </td>
                  ))}
                </tr>
              )
            }

            // Variation row
            const pairs = parseVarPairs(row.values, numIntervals)

            return (
              <tr key={rowIdx}>
                <td
                  className={cn(
                    'border-r border-stone-200 px-3 py-2 text-center font-bold text-stone-700 dark:border-stone-700 dark:text-stone-300',
                    !isLastRow && 'border-b'
                  )}
                >
                  {row.label}
                </td>
                {pairs.map((pair, i) => {
                  const sign = lastSignValues[i] ?? '+'
                  const isIncreasing = sign === '+'
                  const isFirst = i === 0
                  const isLast = i === numIntervals - 1
                  const nextPair = pairs[i + 1]
                  const hasDiscontinuity =
                    !isLast && nextPair && pair.end !== nextPair.start

                  return (
                    <td
                      key={i}
                      className={cn(
                        'relative h-20 px-3',
                        !isLastRow && 'border-b border-stone-200 dark:border-stone-700',
                        i < numIntervals - 1 && 'border-r border-stone-100 dark:border-stone-800'
                      )}
                    >
                      {/* Start value */}
                      <span
                        className={cn(
                          'absolute font-semibold text-stone-700 dark:text-stone-300',
                          isFirst ? 'left-2' : 'left-0 -translate-x-1/2',
                          isIncreasing ? 'bottom-2' : 'top-2'
                        )}
                      >
                        {pair.start}
                      </span>

                      {/* SVG Arrow */}
                      <span className="absolute left-1/2 top-1/2 -translate-x-1/2 -translate-y-1/2">
                        <VariationArrow increasing={isIncreasing} />
                      </span>

                      {/* End value (only on last cell or discontinuity) */}
                      {(isLast || hasDiscontinuity) && (
                        <span
                          className={cn(
                            'absolute font-semibold text-stone-700 dark:text-stone-300',
                            isLast ? 'right-2' : 'right-0 translate-x-1/2',
                            isIncreasing ? 'top-2' : 'bottom-2'
                          )}
                        >
                          {pair.end}
                        </span>
                      )}
                    </td>
                  )
                })}
              </tr>
            )
          })}
        </tbody>
      </table>
    </div>
  )
}

