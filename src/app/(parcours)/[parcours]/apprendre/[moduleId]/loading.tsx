import { Skeleton } from '@/components/ui/skeleton'

export default function ModuleLoading() {
  return (
    <div className="flex h-full items-center justify-center">
      <div className="w-full max-w-2xl space-y-6 px-4">
        <Skeleton className="h-8 w-3/4" />
        <Skeleton className="h-4 w-1/2" />
        <div className="space-y-3">
          <Skeleton className="h-24 w-full rounded-lg" />
          <Skeleton className="h-24 w-full rounded-lg" />
          <Skeleton className="h-24 w-full rounded-lg" />
        </div>
      </div>
    </div>
  )
}
