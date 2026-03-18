import { Skeleton } from '@/components/ui/skeleton'

export default function MesLivretsLoading() {
  return (
    <div className="px-4 py-5">
      {/* Header skeleton */}
      <div className="mb-5">
        <Skeleton className="h-8 w-40" />
        <Skeleton className="mt-1 h-4 w-64" />
      </div>

      {/* Programme group skeleton */}
      <div className="space-y-6">
        <div>
          <div className="mb-3 flex items-center gap-2">
            <Skeleton className="h-3 w-3 rounded-full" />
            <Skeleton className="h-4 w-36" />
          </div>
          <div className="grid gap-3">
            {Array.from({ length: 3 }).map((_, i) => (
              <div key={i} className="rounded-xl border bg-card p-4">
                <div className="flex items-start gap-3">
                  <Skeleton className="h-10 w-10 shrink-0 rounded-lg" />
                  <div className="min-w-0 flex-1 space-y-2">
                    <Skeleton className="h-5 w-48" />
                    <Skeleton className="h-4 w-full" />
                    <div className="flex gap-1.5">
                      <Skeleton className="h-5 w-20 rounded-full" />
                      <Skeleton className="h-5 w-14 rounded-full" />
                    </div>
                  </div>
                </div>
              </div>
            ))}
          </div>
        </div>
      </div>
    </div>
  )
}
