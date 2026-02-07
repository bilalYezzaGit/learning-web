'use client'

import 'mafs/core.css'

import { Tabs, TabsList, TabsTrigger, TabsContent } from '@/components/ui/tabs'
import { useMediaQuery } from '@/lib/hooks/use-media-query'
import { PRIMARY_FN_EXPR } from './constants'

import { SectionIntuition } from './section-intuition'
import { SectionBisection } from './section-bisection'
import { SectionCounter } from './section-counter'

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
