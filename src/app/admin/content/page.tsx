import { Separator } from '@/components/ui/separator'
import { Badge } from '@/components/ui/badge'
import {
  getAllAtoms,
  getAllTags,
  getOrphanAtoms,
  getAtom,
} from '@/lib/content'
import { compileMdx } from '@/lib/mdx'
import type { AtomMeta, AtomType } from '@/types/content'

import { AtomFilters } from './atom-filters'
import { AtomList } from './atom-list'
import { AtomPreview } from './atom-preview'

interface PageProps {
  searchParams: Promise<{
    tags?: string | string[]
    type?: string | string[]
    q?: string
    atom?: string
  }>
}

function toArray(value: string | string[] | undefined): string[] {
  if (!value) return []
  return Array.isArray(value) ? value : [value]
}

function filterAtoms(
  atoms: AtomMeta[],
  types: string[],
  tags: string[],
  query: string,
): AtomMeta[] {
  let filtered = atoms

  if (types.length > 0) {
    filtered = filtered.filter(a => types.includes(a.type))
  }

  if (tags.length > 0) {
    filtered = filtered.filter(a =>
      tags.some(tag => a.tags.includes(tag)),
    )
  }

  if (query) {
    const q = query.toLowerCase()
    filtered = filtered.filter(
      a =>
        a.id.toLowerCase().includes(q) ||
        a.title.toLowerCase().includes(q),
    )
  }

  return filtered
}

export default async function AdminContentPage({ searchParams }: PageProps) {
  const sp = await searchParams

  const types = toArray(sp.type)
  const tags = toArray(sp.tags)
  const query = sp.q ?? ''
  const selectedAtomId = sp.atom ?? null

  // Data fetching
  const allAtoms = getAllAtoms()
  const allTagsMap = getAllTags()
  const orphanAtoms = getOrphanAtoms()

  const orphanIds = new Set(orphanAtoms.map(a => a.id))
  const filteredAtoms = filterAtoms(allAtoms, types, tags, query)
  const allTagsArray: [string, number][] = Array.from(allTagsMap.entries()).sort(
    (a, b) => b[1] - a[1],
  )

  // Counters
  const totalCount = allAtoms.length
  const countByType: Record<AtomType, number> = { lesson: 0, exercise: 0, qcm: 0 }
  for (const atom of allAtoms) {
    countByType[atom.type]++
  }
  const orphanCount = orphanAtoms.length

  // Preview: compile MDX if an atom is selected
  let previewAtom: AtomMeta | null = null
  let previewContent: React.ReactNode | null = null

  if (selectedAtomId) {
    try {
      const fullAtom = getAtom(selectedAtomId)
      previewAtom = {
        id: fullAtom.id,
        type: fullAtom.type,
        title: fullAtom.title,
        difficulty: fullAtom.difficulty,
        timeMinutes: fullAtom.timeMinutes,
        tags: fullAtom.tags,
        ...(fullAtom.category && { category: fullAtom.category }),
      }
      previewContent = await compileMdx(fullAtom.content)
    } catch {
      // Atom not found — ignore
    }
  }

  // Build base params string (filters without atom)
  const baseParams = new URLSearchParams()
  for (const t of types) baseParams.append('type', t)
  for (const t of tags) baseParams.append('tags', t)
  if (query) baseParams.set('q', query)

  return (
    <div className="flex h-[calc(100svh-3.25rem)] flex-col">
      {/* Stats bar */}
      <div className="flex items-center gap-3 border-b px-6 py-2">
        <Badge variant="secondary">{totalCount} atomes</Badge>
        <Badge variant="outline">{countByType.lesson} cours</Badge>
        <Badge variant="outline">{countByType.exercise} exercices</Badge>
        <Badge variant="outline">{countByType.qcm} QCM</Badge>
        {orphanCount > 0 && (
          <Badge variant="destructive">{orphanCount} orphelins</Badge>
        )}
        <Badge variant="outline">{filteredAtoms.length} affichés</Badge>
      </div>

      {/* Main content area */}
      <div className="grid flex-1 grid-cols-1 overflow-hidden md:grid-cols-[380px_1fr]">
        {/* Left panel: filters + list */}
        <div className="flex flex-col border-r">
          <div className="border-b p-4">
            <AtomFilters allTags={allTagsArray} />
          </div>
          <div className="flex-1 overflow-hidden p-2">
            <AtomList
              atoms={filteredAtoms}
              orphanIds={orphanIds}
              selectedAtomId={selectedAtomId}
              baseParams={baseParams.toString()}
            />
          </div>
        </div>

        {/* Right panel: preview */}
        <div className="overflow-y-auto p-6">
          <AtomPreview atom={previewAtom} content={previewContent} />
        </div>
      </div>
    </div>
  )
}
