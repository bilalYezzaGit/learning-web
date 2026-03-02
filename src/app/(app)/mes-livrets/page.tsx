/**
 * Mes Livrets — list of user's paired booklets.
 *
 * PR1: shows available booklets from the content pipeline.
 * PR2: will show only user's paired booklets from Firestore.
 */

import type { Metadata } from 'next'
import Link from 'next/link'
import { BookOpen, Plus, QrCode } from 'lucide-react'

import { Card, CardContent } from '@/components/ui/card'
import { Badge } from '@/components/ui/badge'
import { Button } from '@/components/ui/button'
import { getAllBooklets } from '@/lib/booklet'

export const metadata: Metadata = {
  title: 'Mes livrets',
}

export default function MesLivretsPage() {
  const booklets = getAllBooklets()

  return (
    <div className="px-4 py-5">
      {/* Header */}
      <div className="mb-5">
        <h1 className="font-serif text-2xl font-semibold">Mes livrets</h1>
        <p className="mt-1 text-sm text-muted-foreground">
          Tes livrets d&apos;exercices papier, augmentes par l&apos;app
        </p>
      </div>

      {/* Pair CTA */}
      <Button asChild className="mb-5 w-full" size="lg">
        <Link href="/app/scan">
          <QrCode className="mr-2 h-4 w-4" aria-hidden="true" />
          Associer un nouveau livret
        </Link>
      </Button>

      {/* Booklet list */}
      {booklets.length === 0 ? (
        <Card>
          <CardContent className="py-12 text-center text-muted-foreground">
            <BookOpen className="mx-auto mb-4 h-12 w-12 opacity-50" aria-hidden="true" />
            <p className="text-lg font-medium">Aucun livret disponible</p>
            <p className="mt-1 text-sm">
              Scannez le QR code de votre livret pour commencer
            </p>
          </CardContent>
        </Card>
      ) : (
        <div className="grid gap-3">
          {booklets.map((booklet) => (
            <Link key={booklet.code} href={`/app/mes-livrets/${booklet.code}`}>
              <Card className="transition-colors hover:bg-muted/50">
                <CardContent className="py-4">
                  <div className="flex items-start gap-3">
                    <div className="flex h-10 w-10 shrink-0 items-center justify-center rounded-lg bg-primary/10">
                      <BookOpen className="h-5 w-5 text-primary" aria-hidden="true" />
                    </div>
                    <div className="min-w-0 flex-1">
                      <p className="font-medium">{booklet.title}</p>
                      <p className="mt-0.5 line-clamp-1 text-sm text-muted-foreground">
                        {booklet.description}
                      </p>
                      <div className="mt-2 flex flex-wrap gap-1.5">
                        <Badge variant="secondary" className="text-xs">
                          {booklet.exerciseCount} exercices
                        </Badge>
                        <Badge variant="secondary" className="text-xs">
                          {booklet.qcmCount} QCM
                        </Badge>
                        <Badge variant="outline" className="text-xs">
                          {booklet.code}
                        </Badge>
                      </div>
                    </div>
                    <Plus className="mt-2 h-4 w-4 shrink-0 text-muted-foreground" aria-hidden="true" />
                  </div>
                </CardContent>
              </Card>
            </Link>
          ))}
        </div>
      )}
    </div>
  )
}
