'use client'

import { useState, useMemo } from 'react'
import { Mafs, Coordinates, Plot, Point, Line, Text, useMovablePoint } from 'mafs'
import { motion } from 'motion/react'

import { PRIMARY_FN, COLORS, SPRING_SMOOTH, findRoot } from './constants'

interface SectionCounterProps {
  height: number
}

export function SectionCounter({ height }: SectionCounterProps) {
  const [isDiscontinuous, setIsDiscontinuous] = useState(false)
  const xRange: [number, number] = [-2, 4]
  const yRange: [number, number] = [-3, 4]

  const kPoint = useMovablePoint([0, 1.5], {
    constrain: ([, y]) => [0, Math.max(yRange[0] + 0.5, Math.min(yRange[1] - 0.5, y))],
  })
  const k = kPoint.y

  const continuousRoot = useMemo(() => {
    if (isDiscontinuous) return null
    const step = 0.5
    for (let a = xRange[0]; a < xRange[1]; a += step) {
      const b = Math.min(a + step, xRange[1])
      const root = findRoot(PRIMARY_FN, k, a, b)
      if (root !== null) return root
    }
    return null
  }, [k, isDiscontinuous])

  const isNonInteger = isDiscontinuous && k !== Math.floor(k)

  const stepSegments = useMemo(() => {
    const segments: { x1: number; x2: number; y: number }[] = []
    for (let n = Math.ceil(xRange[0]); n < xRange[1]; n++) {
      segments.push({ x1: n, x2: n + 1, y: n })
    }
    return segments
  }, [])

  // Feedback text
  const feedbackText = isDiscontinuous && isNonInteger
    ? `k = ${k.toFixed(2)} n\u2019est pas entier : la fonction escalier saute par-dessus, aucun c tel que \u230Ac\u230B = k.`
    : isDiscontinuous
      ? `k = ${Math.floor(k)} est entier, la valeur est atteinte. Essayez un k non-entier.`
      : 'Fonction continue : le TVI garantit que toute valeur intermediaire est atteinte.'

  const feedbackColor = isDiscontinuous && isNonInteger
    ? 'text-red-600 dark:text-red-400'
    : isDiscontinuous
      ? 'text-yellow-700 dark:text-yellow-400'
      : 'text-muted-foreground'

  return (
    <div>
      {/* Toggle */}
      <div className="mb-3 flex items-center gap-3">
        <div className="relative flex rounded-lg border border-border bg-muted p-0.5">
          <button
            onClick={() => setIsDiscontinuous(false)}
            className={`relative z-10 rounded-md px-3 py-1.5 text-xs font-medium transition-colors ${
              !isDiscontinuous ? 'text-foreground' : 'text-muted-foreground'
            }`}
          >
            Continue
          </button>
          <button
            onClick={() => setIsDiscontinuous(true)}
            className={`relative z-10 rounded-md px-3 py-1.5 text-xs font-medium transition-colors ${
              isDiscontinuous ? 'text-foreground' : 'text-muted-foreground'
            }`}
          >
            Discontinue
          </button>
          <motion.div
            className="absolute top-0.5 bottom-0.5 z-0 rounded-md bg-background shadow-sm"
            style={{ width: 'calc(50% - 2px)' }}
            animate={{ left: isDiscontinuous ? 'calc(50% + 1px)' : '2px' }}
            transition={SPRING_SMOOTH}
          />
        </div>
        <span className="text-xs text-muted-foreground">
          {isDiscontinuous ? '\u230Ax\u230B (partie entiere)' : 'x\u00B3 \u2212 3x + 1'}
        </span>
      </div>

      <Mafs
        viewBox={{ x: xRange, y: yRange }}
        preserveAspectRatio={false}
        height={height}
      >
        <Coordinates.Cartesian
          xAxis={{ lines: 1, labels: (n) => (n % 1 === 0 ? String(n) : '') }}
          yAxis={{ lines: 1, labels: (n) => (n % 1 === 0 ? String(n) : '') }}
        />

        {/* Horizontal line y = k */}
        <Line.ThroughPoints
          point1={[xRange[0], k]}
          point2={[xRange[1], k]}
          color={COLORS.kLine}
          style="dashed"
        />
        <Text x={xRange[1] - 0.3} y={k + 0.3} size={12} color={COLORS.kLine}>
          k = {k.toFixed(1)}
        </Text>

        {/* Continuous curve */}
        {!isDiscontinuous && (
          <>
            <Plot.OfX y={PRIMARY_FN} color={COLORS.curve} />
            {continuousRoot !== null && (
              <>
                <Line.Segment
                  point1={[continuousRoot, 0]}
                  point2={[continuousRoot, k]}
                  color={COLORS.solution}
                  style="dashed"
                />
                <Point x={continuousRoot} y={k} color={COLORS.solution} />
              </>
            )}
          </>
        )}

        {/* Step function */}
        {isDiscontinuous && (
          <>
            {stepSegments.map((seg, i) => (
              <Line.Segment
                key={`seg-${i}`}
                point1={[seg.x1, seg.y]}
                point2={[seg.x2, seg.y]}
                color={COLORS.curve}
              />
            ))}
            {stepSegments.map((seg, i) => (
              <Point key={`closed-${i}`} x={seg.x1} y={seg.y} color={COLORS.curve} />
            ))}
            {stepSegments.map((seg, i) => (
              <Point
                key={`open-${i}`}
                x={seg.x2}
                y={seg.y}
                color={COLORS.curve}
                opacity={0.3}
              />
            ))}
            {!isNonInteger && (
              <Point x={Math.floor(k)} y={Math.floor(k)} color={COLORS.solution} />
            )}
          </>
        )}

        {/* "No intersection" marker */}
        {isDiscontinuous && isNonInteger && (
          <Text x={0} y={k} size={24} color="var(--mafs-red)">
            {'\u2717'}
          </Text>
        )}

        {kPoint.element}
      </Mafs>

      <p className={`mt-2 text-xs ${feedbackColor}`}>{feedbackText}</p>
    </div>
  )
}
