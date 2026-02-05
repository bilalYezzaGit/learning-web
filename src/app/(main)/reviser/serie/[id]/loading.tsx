/**
 * Serie Detail Loading State
 */

import { Card, CardContent, CardHeader } from '@/components/ui/card'
import { Skeleton } from '@/components/ui/skeleton'

export default function SerieLoading() {
  return (
    <div className="px-4 lg:px-6">
      {/* Back button */}
      <Skeleton className="mb-4 h-9 w-36" />

      {/* Header */}
      <div className="mb-6">
        <Skeleton className="h-8 w-64" />
        <Skeleton className="mt-2 h-5 w-full max-w-lg" />
        <div className="mt-4 flex gap-4">
          <Skeleton className="h-6 w-16" />
          <Skeleton className="h-6 w-24" />
          <Skeleton className="h-6 w-20" />
        </div>
      </div>

      {/* Progress Card */}
      <Card className="mb-6">
        <CardContent className="py-4">
          <div className="flex items-center justify-between">
            <div>
              <Skeleton className="h-5 w-24" />
              <Skeleton className="mt-1 h-4 w-40" />
            </div>
            <Skeleton className="h-8 w-12" />
          </div>
          <Skeleton className="mt-3 h-2 w-full" />
          <Skeleton className="mt-4 h-10 w-full" />
        </CardContent>
      </Card>

      {/* Activities List */}
      <Card>
        <CardHeader>
          <Skeleton className="h-6 w-24" />
        </CardHeader>
        <CardContent className="p-0">
          {[1, 2, 3, 4, 5].map((item) => (
            <div key={item} className="flex items-center gap-4 border-b px-6 py-4 last:border-b-0">
              <Skeleton className="h-8 w-8 rounded-full" />
              <div className="flex-1">
                <Skeleton className="h-5 w-48" />
                <div className="mt-1 flex gap-2">
                  <Skeleton className="h-5 w-16" />
                  <Skeleton className="h-5 w-12" />
                </div>
              </div>
              <Skeleton className="h-5 w-5" />
            </div>
          ))}
        </CardContent>
      </Card>
    </div>
  )
}
