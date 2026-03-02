import Link from 'next/link'
import { BookOpen, Play, Printer } from 'lucide-react'

import { Button } from '@/components/ui/button'
import { Card, CardContent } from '@/components/ui/card'

interface SerieWelcomeProps {
  title: string
  description?: string
  activityCount: number
  estimatedMinutes: number
  playUrl: string
  serieSlug: string
}

export function SerieWelcome({
  title,
  description,
  activityCount,
  estimatedMinutes,
  playUrl,
  serieSlug,
}: SerieWelcomeProps) {
  return (
    <div className="flex flex-1 items-center justify-center p-4 lg:p-6">
      <Card className="max-w-md text-center">
        <CardContent className="py-12">
          <div className="mx-auto mb-6 flex h-16 w-16 items-center justify-center rounded-full bg-primary/10">
            <BookOpen className="h-8 w-8 text-primary" />
          </div>
          <h1 className="text-xl font-semibold">{title}</h1>
          {description && (
            <p className="mt-2 text-muted-foreground">{description}</p>
          )}
          <p className="mt-4 text-sm text-muted-foreground">
            {activityCount} activites · {estimatedMinutes} min estimees
          </p>
          <div className="mt-6 flex flex-col items-center gap-3">
            <Button size="lg" asChild>
              <Link href={playUrl}>
                <Play className="mr-2 h-4 w-4" />
                Commencer la serie
              </Link>
            </Button>
            <Button variant="outline" size="sm" asChild>
              <Link href={`/print/serie/${serieSlug}`}>
                <Printer className="mr-2 h-3.5 w-3.5" />
                Imprimer le livret
              </Link>
            </Button>
          </div>
        </CardContent>
      </Card>
    </div>
  )
}
