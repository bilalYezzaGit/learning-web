'use client'

/**
 * Function Graph Extension
 *
 * Interactive function graphs using Recharts.
 * Client component for touch/hover interactivity.
 *
 * Attributes:
 * - function: Mathematical expression (required)
 * - range: X-axis range as "[min,max]" (default: "[-5,5]")
 * - y-range: Y-axis range as "[min,max]" (optional, auto-computed)
 * - points: Annotated points as "[(x1,y1),(x2,y2)]" (optional)
 * - hide-formula: "true" to hide formula title
 *
 * @example
 * ```html
 * <graph function="x^2-2*x-1" range="[-1,3]"/>
 * <graph function="-(x+1)^2/4+3" range="[-4,5]" y-range="[-4,4]" hide-formula="true"/>
 * ```
 */

import { useMemo } from 'react'
import {
  Line,
  XAxis,
  YAxis,
  CartesianGrid,
  Tooltip,
  ReferenceLine,
  ResponsiveContainer,
  ComposedChart,
} from 'recharts'
import { parse } from 'mathjs'

import { parseRange } from '../utils'

interface GraphProps {
  expression: string
  range?: string
  yRange?: string
  points?: string
  hideFormula?: boolean
}

interface DataPoint {
  x: number
  y: number | null
}

interface AnnotatedPoint {
  x: number
  y: number
}

/**
 * Parse points string like "[(1,2),(3,4)]" into array of {x, y}
 */
function parsePoints(pointsStr?: string): AnnotatedPoint[] {
  if (!pointsStr) return []

  const points: AnnotatedPoint[] = []
  const regex = /\(([-\d.]+),\s*([-\d.]+)\)/g
  let match

  while ((match = regex.exec(pointsStr)) !== null) {
    const xStr = match[1]
    const yStr = match[2]
    if (xStr && yStr) {
      points.push({
        x: parseFloat(xStr),
        y: parseFloat(yStr),
      })
    }
  }

  return points
}

/**
 * Evaluate mathematical expression for array of x values
 */
function evaluateFunction(
  expression: string,
  xRange: [number, number],
  numPoints = 200
): DataPoint[] {
  const [xMin, xMax] = xRange
  const step = (xMax - xMin) / numPoints
  const data: DataPoint[] = []

  // Pre-compile expression for performance
  let compiledExpr
  try {
    compiledExpr = parse(expression).compile()
  } catch {
    return []
  }

  for (let i = 0; i <= numPoints; i++) {
    const x = xMin + i * step

    try {
      const y = compiledExpr.evaluate({ x })
      if (typeof y === 'number' && isFinite(y) && !isNaN(y)) {
        data.push({ x, y })
      } else {
        data.push({ x, y: null })
      }
    } catch {
      data.push({ x, y: null })
    }
  }

  return data
}

/**
 * Compute Y range from data points with padding
 */
function computeYRange(data: DataPoint[]): [number, number] {
  const validYs = data.filter((p) => p.y !== null).map((p) => p.y as number)

  if (validYs.length === 0) return [-5, 5]

  let minY = Math.min(...validYs)
  let maxY = Math.max(...validYs)

  // Add padding
  const padding = (maxY - minY) * 0.1 || 1
  minY = Math.floor(minY - padding)
  maxY = Math.ceil(maxY + padding)

  // Ensure 0 is included if range is close
  if (minY > -1 && minY <= 0) minY = -1
  if (maxY < 1 && maxY >= 0) maxY = 1

  return [minY, maxY]
}

/**
 * Calculate nice interval for axis
 */
function calculateInterval(range: [number, number]): number {
  const diff = Math.abs(range[1] - range[0])
  if (diff <= 4) return 1
  if (diff <= 8) return 1
  if (diff <= 16) return 2
  if (diff <= 30) return 5
  return 10
}

/**
 * Format axis value: integers without decimals
 */
function formatValue(value: number): string {
  if (value === Math.round(value)) {
    return value.toString()
  }
  return value.toFixed(1)
}

export function Graph({
  expression,
  range = '[-5,5]',
  yRange,
  points,
  hideFormula = false,
}: GraphProps) {
  const xRange = parseRange(range)
  const annotatedPoints = parsePoints(points)

  /* eslint-disable react-hooks/preserve-manual-memoization, react-hooks/exhaustive-deps */
  const data = useMemo(
    () => evaluateFunction(expression, xRange),
    [expression, xRange[0], xRange[1]]
  )
  /* eslint-enable react-hooks/preserve-manual-memoization, react-hooks/exhaustive-deps */

  const computedYRange = useMemo(() => {
    if (yRange) return parseRange(yRange)
    return computeYRange(data)
  }, [data, yRange])

  const xInterval = calculateInterval(xRange)
  const yInterval = calculateInterval(computedYRange)

  if (data.length === 0) {
    return (
      <div className="my-6 rounded-xl border border-red-200 bg-red-50 p-6 text-center text-red-700 dark:border-red-800 dark:bg-red-900/20 dark:text-red-400">
        Erreur: impossible d&apos;évaluer la fonction
      </div>
    )
  }

  return (
    <div className="not-prose my-6 overflow-hidden rounded-xl border border-stone-200/80 bg-white shadow-sm dark:border-stone-700/50 dark:bg-stone-900">
      {!hideFormula && (
        <div className="border-b border-stone-100 bg-stone-50/80 px-5 py-3 dark:border-stone-800 dark:bg-stone-800/40">
          <p className="text-center font-mono text-sm font-medium text-stone-700 dark:text-stone-300">
            f(x) = {expression}
          </p>
        </div>
      )}

      <div className="p-4">
        <ResponsiveContainer width="100%" height={400}>
          <ComposedChart
            data={data}
            margin={{ top: 20, right: 30, left: 10, bottom: 10 }}
          >
            <CartesianGrid
              strokeDasharray="3 3"
              stroke="var(--color-stone-200)"
              className="dark:stroke-stone-700"
            />

            {/* Axes at origin */}
            <ReferenceLine x={0} stroke="var(--color-stone-800)" strokeWidth={1.5} />
            <ReferenceLine y={0} stroke="var(--color-stone-800)" strokeWidth={1.5} />

            <XAxis
              dataKey="x"
              type="number"
              domain={xRange}
              tickFormatter={formatValue}
              tick={{ fontSize: 12 }}
              interval={0}
              ticks={Array.from(
                { length: Math.floor((xRange[1] - xRange[0]) / xInterval) + 1 },
                (_, i) => xRange[0] + i * xInterval
              ).filter((v) => v >= xRange[0] && v <= xRange[1])}
            />

            <YAxis
              type="number"
              domain={computedYRange}
              tickFormatter={formatValue}
              tick={{ fontSize: 12 }}
              interval={0}
              ticks={Array.from(
                {
                  length:
                    Math.floor((computedYRange[1] - computedYRange[0]) / yInterval) + 1,
                },
                (_, i) => computedYRange[0] + i * yInterval
              ).filter((v) => v >= computedYRange[0] && v <= computedYRange[1])}
            />

            <Tooltip
              formatter={(value) => [formatValue(Number(value)), 'y']}
              labelFormatter={(label) => `x = ${formatValue(Number(label))}`}
              contentStyle={{
                backgroundColor: 'white',
                border: '1px solid #e7e5e4',
                borderRadius: '8px',
                fontSize: '13px',
              }}
            />

            {/* Main function curve */}
            <Line
              type="monotone"
              dataKey="y"
              stroke="#3b82f6"
              strokeWidth={2.5}
              dot={false}
              connectNulls={false}
              isAnimationActive={false}
            />

            {/* Annotated points */}
            {annotatedPoints.map((point, idx) => (
              <ReferenceLine
                key={`point-${idx}`}
                x={point.x}
                y={point.y}
                ifOverflow="extendDomain"
                segment={[
                  { x: point.x, y: point.y },
                  { x: point.x, y: point.y },
                ]}
              />
            ))}
          </ComposedChart>
        </ResponsiveContainer>
      </div>

      {/* Render annotated points as footer badge row */}
      {annotatedPoints.length > 0 && (
        <div className="flex flex-wrap justify-center gap-2 border-t border-stone-100 bg-stone-50/50 px-4 py-3 text-xs dark:border-stone-800 dark:bg-stone-800/30">
          {annotatedPoints.map((point, idx) => (
            <span
              key={idx}
              className="rounded-full bg-blue-100 px-3 py-1 font-mono font-medium text-blue-700 dark:bg-blue-900/40 dark:text-blue-300"
            >
              ({formatValue(point.x)}, {formatValue(point.y)})
            </span>
          ))}
        </div>
      )}
    </div>
  )
}
