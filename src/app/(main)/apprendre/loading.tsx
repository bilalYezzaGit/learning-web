/**
 * Apprendre Page Loading State
 */

import { Card, CardContent } from '@/components/ui/card'
import { Skeleton } from '@/components/ui/skeleton'

export default function ApprendreLoading() {
  return (
    <div className="container max-w-6xl py-6">
      {/* Header */}
      <div className="mb-8">
        <Skeleton className="h-8 w-40" />
        <Skeleton className="mt-2 h-5 w-72" />
      </div>

      {/* Programme sections */}
      {[1, 2].map((section) => (
        <div key={section} className="mb-8">
          <Skeleton className="mb-4 h-6 w-48" />
          <div className="grid gap-4 sm:grid-cols-2 lg:grid-cols-3">
            {[1, 2, 3].map((card) => (
              <Card key={card}>
                <CardContent className="p-4">
                  <div className="flex items-start justify-between">
                    <div className="flex-1">
                      <Skeleton className="h-5 w-32" />
                      <Skeleton className="mt-2 h-4 w-full" />
                      <Skeleton className="mt-1 h-4 w-3/4" />
                    </div>
                    <Skeleton className="h-5 w-5" />
                  </div>
                  <div className="mt-4">
                    <div className="mb-1 flex justify-between">
                      <Skeleton className="h-3 w-16" />
                      <Skeleton className="h-3 w-8" />
                    </div>
                    <Skeleton className="h-1.5 w-full" />
                  </div>
                </CardContent>
              </Card>
            ))}
          </div>
        </div>
      ))}
    </div>
  )
}
