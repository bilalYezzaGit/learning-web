import { Skeleton } from '@/components/ui/skeleton'

export default function RootLoading() {
  return (
    <div className="flex min-h-svh flex-col items-center justify-center p-6">
      <div className="w-full max-w-md space-y-6 text-center">
        <Skeleton className="mx-auto h-10 w-10 rounded-xl" />
        <div className="space-y-2">
          <Skeleton className="mx-auto h-6 w-40" />
          <Skeleton className="mx-auto h-4 w-56" />
        </div>
        <Skeleton className="mx-auto h-10 w-full rounded-md" />
      </div>
    </div>
  )
}
