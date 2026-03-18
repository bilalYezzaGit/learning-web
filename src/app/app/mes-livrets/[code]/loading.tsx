import { Skeleton } from '@/components/ui/skeleton'

export default function BookletHubLoading() {
  return (
    <div>
      {/* Back header skeleton */}
      <div className="border-b px-4 py-2.5">
        <div className="flex items-center gap-3">
          <Skeleton className="h-8 w-8 rounded-md" />
          <Skeleton className="h-4 w-32" />
        </div>
      </div>

      <div className="px-4 py-5">
        {/* Header skeleton */}
        <div className="mb-6">
          <Skeleton className="mb-2 h-5 w-28 rounded-full" />
          <Skeleton className="h-8 w-56" />
          <Skeleton className="mt-1 h-4 w-full" />
          <div className="mt-3 flex gap-2">
            <Skeleton className="h-4 w-20" />
            <Skeleton className="h-4 w-24" />
            <Skeleton className="h-4 w-14" />
          </div>
        </div>

        {/* Quick actions skeleton */}
        <div className="mb-6 grid gap-3 sm:grid-cols-2">
          {Array.from({ length: 2 }).map((_, i) => (
            <div key={i} className="rounded-xl border bg-card p-4">
              <div className="flex items-center gap-3">
                <Skeleton className="h-10 w-10 shrink-0 rounded-lg" />
                <div className="space-y-1">
                  <Skeleton className="h-5 w-32" />
                  <Skeleton className="h-4 w-40" />
                </div>
              </div>
            </div>
          ))}
        </div>

        {/* TOC skeleton */}
        <Skeleton className="mb-3 h-6 w-24" />
        <div className="space-y-4">
          {Array.from({ length: 2 }).map((_, i) => (
            <div key={i} className="rounded-xl border bg-card p-4 space-y-3">
              <Skeleton className="h-4 w-28" />
              {Array.from({ length: 3 }).map((_, j) => (
                <div key={j} className="flex items-center gap-3 px-2 py-2">
                  <Skeleton className="h-4 w-4 rounded" />
                  <Skeleton className="h-4 flex-1" />
                  <Skeleton className="h-5 w-16 rounded-full" />
                </div>
              ))}
            </div>
          ))}
        </div>
      </div>
    </div>
  )
}
