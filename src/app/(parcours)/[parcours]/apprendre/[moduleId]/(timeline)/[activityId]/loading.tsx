import { Skeleton } from '@/components/ui/skeleton'

export default function ActivityLoading() {
  return (
    <div className="flex h-full flex-col">
      {/* Header skeleton */}
      <div className="flex items-center gap-2 border-b px-4 py-3">
        <Skeleton className="h-5 w-5" />
        <Skeleton className="h-5 w-40" />
      </div>

      {/* Content skeleton */}
      <div className="flex-1 overflow-auto">
        <div className="mx-auto max-w-3xl space-y-4 px-4 py-4 lg:py-6">
          <Skeleton className="h-8 w-3/4" />
          <Skeleton className="h-4 w-full" />
          <Skeleton className="h-4 w-full" />
          <Skeleton className="h-4 w-2/3" />
          <Skeleton className="mt-6 h-32 w-full rounded-lg" />
          <Skeleton className="h-4 w-full" />
          <Skeleton className="h-4 w-5/6" />
        </div>
      </div>

      {/* Footer skeleton */}
      <div className="flex items-center justify-between border-t px-4 py-3">
        <Skeleton className="h-9 w-28" />
        <Skeleton className="h-9 w-24" />
      </div>
    </div>
  )
}
