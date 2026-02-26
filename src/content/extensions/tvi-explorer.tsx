'use client'

/**
 * TVI Explorer — interactive widget for the Intermediate Value Theorem.
 *
 * Three tabs:
 * 1. Intuition — drag k to see f(c) = k
 * 2. Bisection — step-by-step root finding
 * 3. Counter-example — continuous vs discontinuous
 *
 * Dependencies: mafs (graph library), motion (animations)
 */

import 'mafs/core.css'

import { useState, useMemo, useCallback } from 'react'
import { Mafs, Coordinates, Plot, Point, Line, Polygon, Text, Theme, useMovablePoint } from 'mafs'
import { motion } from 'motion/react'

import { Button } from '@/components/ui/button'
import { Tabs, TabsList, TabsTrigger, TabsContent } from '@/components/ui/tabs'
import { useMediaQuery } from '@/lib/hooks/use-media-query'

// ---------------------------------------------------------------------------
// Constants & algorithms (private)
// ---------------------------------------------------------------------------

const PRIMARY_FN = (x: number) => x ** 3 - 3 * x + 1
const PRIMARY_FN_EXPR = 'f(x) = x\u00B3 \u2212 3x + 1'


const COLORS = {
  curve: Theme.blue,
  interval: Theme.green,
  kLine: Theme.pink,
  solution: Theme.orange,
  bisectLeft: Theme.green,
  bisectRight: Theme.red,
  bisectMid: Theme.yellow,
} as const

const SPRING_SMOOTH = { type: 'spring' as const, stiffness: 120, damping: 20 }

/** Find x in [a,b] such that fn(x) ~ k, using bisection. */
function findRoot(
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

/** Run one bisection step: given [a,b], return the next narrowed interval. */
function bisectionStep(
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

// ---------------------------------------------------------------------------
// Section: Intuition
// ---------------------------------------------------------------------------

function SectionIntuition({ height }: { height: number }) {
  const xRange: [number, number] = [-2.5, 2.5]
  const yRange: [number, number] = [-4, 4]

  const kPoint = useMovablePoint([0, 1], {
    constrain: ([, y]) => [0, Math.max(yRange[0] + 0.5, Math.min(yRange[1] - 0.5, y))],
  })

  const k = kPoint.y

  /* eslint-disable react-hooks/exhaustive-deps */
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
  /* eslint-enable react-hooks/exhaustive-deps */

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

// ---------------------------------------------------------------------------
// Section: Bisection
// ---------------------------------------------------------------------------

interface BisectionRecord {
  a: number
  b: number
  mid: number
  fMid: number
}

function SectionBisection({ height }: { height: number }) {
  const initialA = 0
  const initialB = 1

  const [steps, setSteps] = useState<BisectionRecord[]>([])

  const currentA = steps.length > 0 ? steps[steps.length - 1]!.a : initialA
  const currentB = steps.length > 0 ? steps[steps.length - 1]!.b : initialB
  const lastStep = steps.length > 0 ? steps[steps.length - 1] : null

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

// ---------------------------------------------------------------------------
// Section: Counter-example
// ---------------------------------------------------------------------------

function SectionCounter({ height }: { height: number }) {
  const [isDiscontinuous, setIsDiscontinuous] = useState(false)
  const xRange: [number, number] = [-2, 4]
  const yRange: [number, number] = [-3, 4]

  const kPoint = useMovablePoint([0, 1.5], {
    constrain: ([, y]) => [0, Math.max(yRange[0] + 0.5, Math.min(yRange[1] - 0.5, y))],
  })
  const k = kPoint.y

  /* eslint-disable react-hooks/exhaustive-deps */
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
  /* eslint-enable react-hooks/exhaustive-deps */

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

// ---------------------------------------------------------------------------
// Public export
// ---------------------------------------------------------------------------

export function TviExplorer() {
  const isMobile = useMediaQuery('(max-width: 768px)')
  const canvasHeight = isMobile ? 300 : 400

  return (
    <div
      className={[
        'my-6 overflow-hidden rounded-xl border border-border',
        '[--mafs-bg:white] [--mafs-fg:hsl(20,14%,4%)]',
        'dark:[--mafs-bg:hsl(20,14%,10%)] dark:[--mafs-fg:hsl(20,6%,90%)]',
      ].join(' ')}
    >
      <div className="px-4 pt-4 pb-2">
        <h3 className="text-base font-semibold text-foreground">
          Explorateur TVI
        </h3>
        <p className="text-xs text-muted-foreground">{PRIMARY_FN_EXPR}</p>
      </div>

      <Tabs defaultValue="intuition">
        <div className="border-b border-border px-4">
          <TabsList className="w-full" variant="line">
            <TabsTrigger value="intuition">Intuition</TabsTrigger>
            <TabsTrigger value="bisection">Dichotomie</TabsTrigger>
            <TabsTrigger value="counter">Contre-exemple</TabsTrigger>
          </TabsList>
        </div>

        <div className="p-4">
          <TabsContent value="intuition" className="animate-in fade-in duration-200">
            <SectionIntuition height={canvasHeight} />
          </TabsContent>

          <TabsContent value="bisection" className="animate-in fade-in duration-200">
            <SectionBisection height={canvasHeight} />
          </TabsContent>

          <TabsContent value="counter" className="animate-in fade-in duration-200">
            <SectionCounter height={canvasHeight} />
          </TabsContent>
        </div>
      </Tabs>
    </div>
  )
}
