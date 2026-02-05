/**
 * Apprendre Page
 *
 * Learning hub with modules grid.
 * Public - browsable without authentication.
 * Server Component - fetches data directly.
 */

import Link from 'next/link'
import { BookOpen, ChevronRight } from 'lucide-react'

import { Card, CardContent } from '@/components/ui/card'
import { Badge } from '@/components/ui/badge'
import { Progress } from '@/components/ui/progress'
import { fetchProgrammes } from '@/lib/services/content-service'

export default async function ApprendrePage() {
  let programmes
  let error = null

  try {
    const response = await fetchProgrammes()
    programmes = response.programmes
  } catch (e) {
    error = e instanceof Error ? e.message : 'Erreur de chargement'
  }

  return (
    <div className="px-4 lg:px-6">
      <div className="mb-8">
        <h1 className="font-serif text-2xl font-semibold text-foreground">
          Apprendre
        </h1>
        <p className="mt-1 text-muted-foreground">
          Explorez les modules et progressez à votre rythme
        </p>
      </div>

      {error ? (
        <Card>
          <CardContent className="py-12 text-center text-muted-foreground">
            <BookOpen className="mx-auto mb-4 h-12 w-12 opacity-50" />
            <p className="text-lg font-medium">Erreur de chargement</p>
            <p className="mt-1 text-sm">{error}</p>
          </CardContent>
        </Card>
      ) : !programmes || programmes.length === 0 ? (
        <Card>
          <CardContent className="py-12 text-center text-muted-foreground">
            <BookOpen className="mx-auto mb-4 h-12 w-12 opacity-50" />
            <p className="text-lg font-medium">Aucun module disponible</p>
          </CardContent>
        </Card>
      ) : (
        <div className="space-y-6">
          {programmes.map((programme) => (
            <div key={programme.id}>
              <h2 className="mb-4 font-serif text-lg font-semibold">
                {programme.label}
              </h2>
              <div className="grid gap-4 sm:grid-cols-2 lg:grid-cols-3">
                {programme.modules.map((module) => (
                  <Link
                    key={module.id}
                    href={`/apprendre/${module.id}`}
                    className="group"
                  >
                    <Card className="h-full transition-colors group-hover:border-primary/50">
                      <CardContent className="p-4">
                        <div className="flex items-start justify-between">
                          <div className="flex-1">
                            <h3 className="font-medium group-hover:text-primary">
                              {module.title}
                            </h3>
                            {module.description && (
                              <p className="mt-1 line-clamp-2 text-sm text-muted-foreground">
                                {module.description}
                              </p>
                            )}
                          </div>
                          <ChevronRight className="h-5 w-5 text-muted-foreground transition-transform group-hover:translate-x-1" />
                        </div>
                        <div className="mt-4">
                          <div className="mb-1 flex justify-between text-xs">
                            <span className="text-muted-foreground">
                              {module.sections?.length || 0} sections
                            </span>
                            <span className="text-muted-foreground">0%</span>
                          </div>
                          <Progress value={0} className="h-1.5" />
                        </div>
                      </CardContent>
                    </Card>
                  </Link>
                ))}
              </div>
            </div>
          ))}
        </div>
      )}
    </div>
  )
}
