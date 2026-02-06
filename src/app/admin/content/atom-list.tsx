import Link from 'next/link'

import { Badge } from '@/components/ui/badge'
import { ScrollArea } from '@/components/ui/scroll-area'
import type { AtomMeta } from '@/types/content'

const TYPE_COLORS: Record<string, string> = {
  lesson: 'bg-blue-100 text-blue-800 dark:bg-blue-900 dark:text-blue-200',
  exercise: 'bg-green-100 text-green-800 dark:bg-green-900 dark:text-green-200',
  qcm: 'bg-purple-100 text-purple-800 dark:bg-purple-900 dark:text-purple-200',
}

const TYPE_LABELS: Record<string, string> = {
  lesson: 'Cours',
  exercise: 'Exercice',
  qcm: 'QCM',
}

interface AtomListProps {
  atoms: AtomMeta[]
  orphanIds: Set<string>
  selectedAtomId: string | null
  baseParams: string
}

export function AtomList({
  atoms,
  orphanIds,
  selectedAtomId,
  baseParams,
}: AtomListProps) {
  function buildHref(atomId: string) {
    const params = new URLSearchParams(baseParams)
    params.set('atom', atomId)
    return `/admin/content?${params.toString()}`
  }

  return (
    <ScrollArea className="h-[calc(100svh-13rem)]">
      <div className="space-y-0.5 pr-3">
        {atoms.length === 0 && (
          <p className="text-muted-foreground py-8 text-center text-sm">
            Aucun atome trouvé.
          </p>
        )}
        {atoms.map(atom => (
          <Link
            key={atom.id}
            href={buildHref(atom.id)}
            className={`flex items-center gap-2 rounded-md px-2 py-1.5 text-sm transition-colors hover:bg-accent ${
              selectedAtomId === atom.id ? 'bg-accent' : ''
            }`}
          >
            {orphanIds.has(atom.id) && (
              <span
                className="size-2 shrink-0 rounded-full bg-orange-400"
                title="Orphelin (non référencé)"
              />
            )}
            <span
              className={`shrink-0 rounded px-1.5 py-0.5 text-[10px] font-medium ${TYPE_COLORS[atom.type] ?? ''}`}
            >
              {TYPE_LABELS[atom.type] ?? atom.type}
            </span>
            <span className="truncate">{atom.title}</span>
          </Link>
        ))}
      </div>
    </ScrollArea>
  )
}
