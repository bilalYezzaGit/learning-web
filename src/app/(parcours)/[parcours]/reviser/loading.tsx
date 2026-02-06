import { Skeleton } from '@/components/ui/skeleton'
import { Card, CardContent } from '@/components/ui/card'

export default function ReviserLoading() {
  return (
    <div className="px-4 lg:px-6">
      <div className="mb-8">
        <Skeleton className="h-8 w-32" />
        <Skeleton className="mt-2 h-5 w-64" />
      </div>

      {/* Stats */}
      <div className="mb-8 grid gap-4 sm:grid-cols-3">
        {[1, 2, 3].map((i) => (
          <Card key={i}>
            <CardContent className="flex items-center gap-4 py-4">
              <Skeleton className="h-10 w-10 rounded-lg" />
              <div>
                <Skeleton className="h-8 w-12" />
                <Skeleton className="mt-1 h-4 w-24" />
              </div>
            </CardContent>
          </Card>
        ))}
      </div>

      {/* Series list */}
      <Card>
        <CardContent className="p-0">
          {[1, 2, 3].map((i) => (
            <div key={i} className="flex items-center gap-4 border-b px-6 py-4 last:border-b-0">
              <Skeleton className="h-10 w-10 rounded-lg" />
              <div className="flex-1">
                <Skeleton className="h-5 w-48" />
                <Skeleton className="mt-2 h-4 w-32" />
              </div>
            </div>
          ))}
        </CardContent>
      </Card>
    </div>
  )
}
