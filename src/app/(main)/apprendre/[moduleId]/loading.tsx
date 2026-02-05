/**
 * Module Detail Loading State
 */

import { Skeleton } from '@/components/ui/skeleton'

export default function ModuleLoading() {
  return (
    <div className="flex h-[calc(100vh-3.5rem)] flex-col md:flex-row">
      {/* Left Panel - Activity List */}
      <div className="hidden w-80 flex-shrink-0 border-r md:block lg:w-96">
        <div className="p-4">
          <Skeleton className="h-7 w-48" />
          <Skeleton className="mt-2 h-4 w-full" />
          <Skeleton className="mt-1 h-4 w-3/4" />
          <div className="mt-4">
            <div className="mb-1 flex justify-between">
              <Skeleton className="h-4 w-20" />
              <Skeleton className="h-4 w-8" />
            </div>
            <Skeleton className="h-2 w-full" />
          </div>
        </div>
        <div className="border-t">
          {[1, 2, 3, 4, 5].map((item) => (
            <div key={item} className="flex items-center gap-3 border-b px-4 py-3">
              <Skeleton className="h-6 w-6 rounded-full" />
              <div className="flex-1">
                <Skeleton className="h-4 w-40" />
                <Skeleton className="mt-1 h-5 w-16" />
              </div>
              <Skeleton className="h-4 w-4" />
            </div>
          ))}
        </div>
      </div>

      {/* Right Panel - Content */}
      <div className="flex-1 p-6">
        <div className="mx-auto max-w-3xl">
          <Skeleton className="h-6 w-64" />
          <Skeleton className="mt-1 h-5 w-20" />
          <div className="mt-6 space-y-4">
            <Skeleton className="h-4 w-full" />
            <Skeleton className="h-4 w-full" />
            <Skeleton className="h-4 w-3/4" />
            <Skeleton className="mt-4 h-32 w-full" />
            <Skeleton className="h-4 w-full" />
            <Skeleton className="h-4 w-5/6" />
          </div>
        </div>
      </div>
    </div>
  )
}
