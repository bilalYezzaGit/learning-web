import { Skeleton } from '@/components/ui/skeleton'

export default function ExerciseLoading() {
  return (
    <div>
      {/* Back header skeleton */}
      <div className="border-b px-4 py-2.5">
        <div className="flex items-center gap-3">
          <Skeleton className="h-8 w-8 rounded-md" />
          <Skeleton className="h-4 w-40" />
        </div>
      </div>

      <div className="px-4 py-5 space-y-6">
        {/* Content skeleton */}
        <div className="space-y-4">
          <Skeleton className="h-6 w-3/4" />
          <Skeleton className="h-4 w-full" />
          <Skeleton className="h-4 w-full" />
          <Skeleton className="h-4 w-5/6" />
          <Skeleton className="mt-4 h-24 w-full rounded-lg" />
          <Skeleton className="h-4 w-full" />
          <Skeleton className="h-4 w-2/3" />
        </div>
      </div>
    </div>
  )
}
