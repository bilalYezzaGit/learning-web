/**
 * Réviser Page Loading State
 */

import { Card, CardContent, CardHeader } from '@/components/ui/card'
import { Skeleton } from '@/components/ui/skeleton'

export default function ReviserLoading() {
  return (
    <div className="container max-w-6xl py-6">
      {/* Header */}
      <div className="mb-8">
        <Skeleton className="h-8 w-32" />
        <Skeleton className="mt-2 h-5 w-64" />
      </div>

      {/* Stats Cards */}
      <div className="mb-8 grid gap-4 sm:grid-cols-3">
        {[1, 2, 3].map((card) => (
          <Card key={card}>
            <CardContent className="flex items-center gap-4 py-4">
              <Skeleton className="h-10 w-10 rounded-lg" />
              <div>
                <Skeleton className="h-7 w-12" />
                <Skeleton className="mt-1 h-4 w-24" />
              </div>
            </CardContent>
          </Card>
        ))}
      </div>

      {/* Series List */}
      <Card>
        <CardHeader>
          <Skeleton className="h-6 w-40" />
        </CardHeader>
        <CardContent className="p-0">
          {[1, 2, 3, 4].map((item) => (
            <div key={item} className="flex items-center gap-4 border-b px-6 py-4 last:border-b-0">
              <Skeleton className="h-10 w-10 rounded-lg" />
              <div className="flex-1">
                <Skeleton className="h-5 w-48" />
                <Skeleton className="mt-1 h-4 w-72" />
                <div className="mt-2 flex gap-2">
                  <Skeleton className="h-5 w-16" />
                  <Skeleton className="h-5 w-20" />
                  <Skeleton className="h-5 w-24" />
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
