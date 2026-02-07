'use client'

import { useState, useCallback } from 'react'
import { Mafs, Coordinates, Plot, Point, Line, Polygon, Text } from 'mafs'
import { motion } from 'motion/react'

import { Button } from '@/components/ui/button'
import { PRIMARY_FN, COLORS, bisectionStep } from './constants'

interface SectionBisectionProps {
  height: number
}

interface BisectionRecord {
  a: number
  b: number
  mid: number
  fMid: number
}

export function SectionBisection({ height }: SectionBisectionProps) {
  const initialA = 0
  const initialB = 1

  const [steps, setSteps] = useState<BisectionRecord[]>([])

  const currentA = steps.length > 0 ? steps[steps.length - 1]!.a : initialA
  const currentB = steps.length > 0 ? steps[steps.length - 1]!.b : initialB
  const lastStep = steps.length > 0 ? steps[steps.length - 1] : null

  // Fixed viewbox — the root is in [0, 1]
  const xRange: [number, number] = [-0.5, 1.5]
  const yRange: [number, number] = [-1.5, 1.5]

  const nextStep = useCallback(() => {
    const a = steps.length > 0 ? steps[steps.length - 1]!.a : initialA
    const b = steps.length > 0 ? steps[steps.length - 1]!.b : initialB
    const result = bisectionStep(PRIMARY_FN, a, b)
    setSteps((prev) => [...prev, result])
  }, [steps])

  const reset = useCallback(() => {
    setSteps([])
  }, [])

  const regionPoints: [number, number][] = [
    [currentA, yRange[0]],
    [currentB, yRange[0]],
    [currentB, yRange[1]],
    [currentA, yRange[1]],
  ]

  return (
    <div>
      <Mafs
        viewBox={{ x: xRange, y: yRange }}
        preserveAspectRatio={false}
        height={height}
      >
        <Coordinates.Cartesian
          xAxis={{ lines: false }}
          yAxis={{ lines: false }}
        />

        <Polygon
          points={regionPoints}
          color={COLORS.interval}
          fillOpacity={0.1}
          strokeOpacity={0}
        />

        <Plot.OfX y={PRIMARY_FN} color={COLORS.curve} />

        <Line.ThroughPoints
          point1={[xRange[0], 0]}
          point2={[xRange[1], 0]}
          color="var(--mafs-fg)"
          opacity={0.3}
        />

        {/* Left bound */}
        <Line.Segment
          point1={[currentA, yRange[0]]}
          point2={[currentA, yRange[1]]}
          color={COLORS.bisectLeft}
          style="dashed"
        />
        <Point x={currentA} y={PRIMARY_FN(currentA)} color={COLORS.bisectLeft} />
        <Text x={currentA} y={yRange[0] + 0.15} size={11} color={COLORS.bisectLeft}>
          a
        </Text>

        {/* Right bound */}
        <Line.Segment
          point1={[currentB, yRange[0]]}
          point2={[currentB, yRange[1]]}
          color={COLORS.bisectRight}
          style="dashed"
        />
        <Point x={currentB} y={PRIMARY_FN(currentB)} color={COLORS.bisectRight} />
        <Text x={currentB} y={yRange[0] + 0.15} size={11} color={COLORS.bisectRight}>
          b
        </Text>

        {/* Midpoint */}
        {lastStep && (
          <>
            <Line.Segment
              point1={[lastStep.mid, yRange[0]]}
              point2={[lastStep.mid, yRange[1]]}
              color={COLORS.bisectMid}
              style="dashed"
              opacity={0.5}
            />
            <Point x={lastStep.mid} y={lastStep.fMid} color={COLORS.bisectMid} />
          </>
        )}
      </Mafs>

      {/* Controls + info */}
      <div className="mt-3 flex items-center gap-2">
        <Button onClick={nextStep} size="sm">
          Etape suivante
        </Button>
        <Button onClick={reset} variant="outline" size="sm">
          Reinitialiser
        </Button>
        <span className="ml-auto text-xs text-muted-foreground">
          [{currentA.toFixed(4)}, {currentB.toFixed(4)}]
        </span>
      </div>

      {/* Steps table */}
      {steps.length > 0 ? (
        <div className="mt-3 max-h-48 overflow-y-auto rounded-lg border border-border">
          <table className="w-full text-xs">
            <thead className="sticky top-0 bg-muted">
              <tr>
                <th className="px-2 py-1.5 text-left font-medium text-muted-foreground">n</th>
                <th className="px-2 py-1.5 text-left font-medium text-muted-foreground">a</th>
                <th className="px-2 py-1.5 text-left font-medium text-muted-foreground">b</th>
                <th className="px-2 py-1.5 text-left font-medium text-muted-foreground">m</th>
                <th className="px-2 py-1.5 text-left font-medium text-muted-foreground">f(m)</th>
              </tr>
            </thead>
            <tbody>
              {steps.map((step, i) => (
                <motion.tr
                  key={i}
                  initial={{ opacity: 0 }}
                  animate={{ opacity: 1 }}
                  transition={{ duration: 0.2 }}
                  className="border-t border-border/50"
                >
                  <td className="px-2 py-1 font-mono text-foreground">{i + 1}</td>
                  <td className="px-2 py-1 font-mono text-green-700 dark:text-green-400">{step.a.toFixed(4)}</td>
                  <td className="px-2 py-1 font-mono text-red-700 dark:text-red-400">{step.b.toFixed(4)}</td>
                  <td className="px-2 py-1 font-mono text-foreground">{step.mid.toFixed(4)}</td>
                  <td className="px-2 py-1 font-mono">
                    <span className={step.fMid > 0 ? 'text-green-600 dark:text-green-400' : 'text-red-600 dark:text-red-400'}>
                      {step.fMid > 0 ? '+' : ''}{step.fMid.toFixed(4)}
                    </span>
                  </td>
                </motion.tr>
              ))}
            </tbody>
          </table>
        </div>
      ) : (
        <p className="mt-3 text-xs text-muted-foreground">
          f(0) = 1 &gt; 0 et f(1) = &minus;1 &lt; 0. Par le TVI, il existe une racine dans [0, 1].
        </p>
      )}
    </div>
  )
}
