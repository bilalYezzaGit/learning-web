'use client'

/**
 * BookletList — client component for booklet list with localStorage favorites.
 *
 * Groups booklets by programme with colored section headers.
 * Favorites are stored in localStorage under 'aylan-favorites' as a JSON array of codes.
 * Favorited booklets appear first within each group.
 */

import * as React from 'react'
import Link from 'next/link'
import { BookOpen, Star } from 'lucide-react'

import { Card, CardContent } from '@/components/ui/card'
import { Badge } from '@/components/ui/badge'
import type { BookletDefinition } from '@/types/booklet'

const FAVORITES_KEY = 'aylan-favorites'

function loadFavorites(): Set<string> {
  try {
    const raw = localStorage.getItem(FAVORITES_KEY)
    if (!raw) return new Set()
    return new Set(JSON.parse(raw) as string[])
  } catch {
    return new Set()
  }
}

function saveFavorites(favorites: Set<string>) {
  try {
    localStorage.setItem(FAVORITES_KEY, JSON.stringify([...favorites]))
  } catch {
    // localStorage unavailable
  }
}

interface ProgrammeGroup {
  programmeId: string
  programmeLabel: string
  programmeColor: string
  booklets: BookletDefinition[]
}

function groupByProgramme(booklets: BookletDefinition[]): ProgrammeGroup[] {
  const map = new Map<string, ProgrammeGroup>()
  for (const b of booklets) {
    let group = map.get(b.programmeId)
    if (!group) {
      group = {
        programmeId: b.programmeId,
        programmeLabel: b.programmeLabel,
        programmeColor: b.programmeColor,
        booklets: [],
      }
      map.set(b.programmeId, group)
    }
    group.booklets.push(b)
  }
  return [...map.values()]
}

export function BookletList({ booklets }: { booklets: BookletDefinition[] }) {
  const [favorites, setFavorites] = React.useState<Set<string>>(new Set())
  const [mounted, setMounted] = React.useState(false)

  React.useEffect(() => {
    setFavorites(loadFavorites())
    setMounted(true)
  }, [])

  const toggleFavorite = (code: string, e: React.MouseEvent) => {
    e.preventDefault()
    e.stopPropagation()
    setFavorites(prev => {
      const next = new Set(prev)
      if (next.has(code)) {
        next.delete(code)
      } else {
        next.add(code)
      }
      saveFavorites(next)
      return next
    })
  }

  const groups = React.useMemo(() => {
    const grouped = groupByProgramme(booklets)
    if (!mounted) return grouped
    // Sort favorites first within each group
    for (const group of grouped) {
      group.booklets.sort((a, b) => {
        const aFav = favorites.has(a.code) ? 0 : 1
        const bFav = favorites.has(b.code) ? 0 : 1
        return aFav - bFav
      })
    }
    return grouped
  }, [booklets, favorites, mounted])

  return (
    <div className="space-y-6">
      {groups.map((group) => (
        <section key={group.programmeId}>
          {/* Programme header */}
          <div className="mb-3 flex items-center gap-2">
            <span
              className="h-3 w-3 shrink-0 rounded-full"
              style={{ backgroundColor: group.programmeColor }}
              aria-hidden="true"
            />
            <h2 className="text-sm font-semibold text-muted-foreground">
              {group.programmeLabel}
            </h2>
          </div>

          {/* Booklet cards */}
          <div className="grid gap-3">
            {group.booklets.map((booklet) => {
              const isFav = mounted && favorites.has(booklet.code)
              return (
                <Link key={booklet.code} href={`/app/mes-livrets/${booklet.code}`}>
                  <Card className="transition-colors hover:bg-muted/50">
                    <CardContent className="py-4">
                      <div className="flex items-start gap-3">
                        <div
                          className="flex h-10 w-10 shrink-0 items-center justify-center rounded-lg"
                          style={{ backgroundColor: `${group.programmeColor}15` }}
                        >
                          <BookOpen
                            className="h-5 w-5"
                            style={{ color: group.programmeColor }}
                            aria-hidden="true"
                          />
                        </div>
                        <div className="min-w-0 flex-1">
                          <p className="font-medium">{booklet.title}</p>
                          <p className="mt-0.5 line-clamp-2 text-sm text-muted-foreground">
                            {booklet.description}
                          </p>
                          <div className="mt-2 flex flex-wrap gap-1.5">
                            <Badge variant="secondary" className="text-xs">
                              {booklet.exerciseCount} exercices
                            </Badge>
                            <Badge variant="secondary" className="text-xs">
                              {booklet.qcmCount} QCM
                            </Badge>
                          </div>
                        </div>
                        <button
                          type="button"
                          onClick={(e) => toggleFavorite(booklet.code, e)}
                          className="mt-1 shrink-0 rounded-full p-1.5 transition-colors hover:bg-muted"
                          aria-label={isFav ? 'Retirer des favoris' : 'Ajouter aux favoris'}
                        >
                          <Star
                            className={`h-4 w-4 ${isFav ? 'fill-warning text-warning' : 'text-muted-foreground/40'}`}
                            aria-hidden="true"
                          />
                        </button>
                      </div>
                    </CardContent>
                  </Card>
                </Link>
              )
            })}
          </div>
        </section>
      ))}
    </div>
  )
}
