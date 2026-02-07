'use client'

import { useMemo } from 'react'
import { Mafs, Coordinates, Plot, Point, Line, Text, useMovablePoint } from 'mafs'

import { PRIMARY_FN, COLORS, findRoot } from './constants'

interface SectionIntuitionProps {
  height: number
}

export function SectionIntuition({ height }: SectionIntuitionProps) {
  const xRange: [number, number] = [-2.5, 2.5]
  const yRange: [number, number] = [-4, 4]

  const kPoint = useMovablePoint([0, 1], {
    constrain: ([, y]) => [0, Math.max(yRange[0] + 0.5, Math.min(yRange[1] - 0.5, y))],
  })

  const k = kPoint.y

  const { fMin, fMax } = useMemo(() => {
    let min = Infinity
    let max = -Infinity
    for (let x = xRange[0]; x <= xRange[1]; x += 0.01) {
      const v = PRIMARY_FN(x)
      if (v < min) min = v
      if (v > max) max = v
    }
    return { fMin: min, fMax: max }
  }, [])

  const inRange = k >= fMin && k <= fMax

  const c = useMemo(() => {
    if (!inRange) return null
    const step = 0.5
    for (let a = xRange[0]; a < xRange[1]; a += step) {
      const b = Math.min(a + step, xRange[1])
      const root = findRoot(PRIMARY_FN, k, a, b)
      if (root !== null) return root
    }
    return null
  }, [k, inRange])

  return (
    <div>
      <Mafs
        viewBox={{ x: xRange, y: yRange }}
        preserveAspectRatio={false}
        height={height}
      >
        <Coordinates.Cartesian
          xAxis={{ lines: 1, labels: (n) => (n % 1 === 0 ? String(n) : '') }}
          yAxis={{ lines: 1, labels: (n) => (n % 1 === 0 ? String(n) : '') }}
        />

        <Plot.OfX y={PRIMARY_FN} color={COLORS.curve} />

        <Line.ThroughPoints
          point1={[xRange[0], k]}
          point2={[xRange[1], k]}
          color={COLORS.kLine}
          style="dashed"
        />

        <Text x={xRange[0] + 0.3} y={k + 0.3} size={14} color={COLORS.kLine}>
          k = {k.toFixed(1)}
        </Text>

        {c !== null && inRange && (
          <>
            <Line.Segment
              point1={[c, 0]}
              point2={[c, k]}
              color={COLORS.solution}
              style="dashed"
            />
            <Point x={c} y={k} color={COLORS.solution} />
            <Text x={c} y={k - 0.4} size={12} color={COLORS.solution}>
              c = {c.toFixed(2)}
            </Text>
          </>
        )}

        {kPoint.element}
      </Mafs>

      <p className="mt-2 text-xs text-muted-foreground">
        {inRange
          ? 'La courbe coupe la droite y = k : il existe c tel que f(c) = k.'
          : `Deplacez le point rose sur l\u2019axe y pour choisir k entre ${fMin.toFixed(1)} et ${fMax.toFixed(1)}.`}
      </p>
    </div>
  )
}
