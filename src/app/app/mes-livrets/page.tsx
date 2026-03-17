/**
 * Mes Livrets — list of all available booklets with favorites.
 */

import type { Metadata } from 'next'
import { BookOpen } from 'lucide-react'

import { Card, CardContent } from '@/components/ui/card'
import { getAllBooklets } from '@/lib/booklet'
import { BookletList } from '@/app/app/mes-livrets/_components/booklet-list'

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

      {/* Booklet list */}
      {booklets.length === 0 ? (
        <Card>
          <CardContent className="py-12 text-center text-muted-foreground">
            <BookOpen className="mx-auto mb-4 h-12 w-12 opacity-50" aria-hidden="true" />
            <p className="text-lg font-medium">Aucun livret disponible</p>
            <p className="mt-1 text-sm">
              Les livrets seront bientot disponibles.
            </p>
          </CardContent>
        </Card>
      ) : (
        <BookletList booklets={booklets} />
      )}
    </div>
  )
}
