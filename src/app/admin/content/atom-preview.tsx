import { Badge } from '@/components/ui/badge'
import { Separator } from '@/components/ui/separator'
import type { AtomMeta } from '@/types/content'

const TYPE_LABELS: Record<string, string> = {
  lesson: 'Cours',
  exercise: 'Exercice',
  qcm: 'QCM',
}

interface AtomPreviewProps {
  atom: AtomMeta | null
  content: React.ReactNode | null
}

export function AtomPreview({ atom, content }: AtomPreviewProps) {
  if (!atom) {
    return (
      <div className="flex h-full items-center justify-center">
        <p className="text-muted-foreground text-sm">
          Sélectionnez un atome pour voir son contenu.
        </p>
      </div>
    )
  }

  return (
    <div className="space-y-4">
      <div>
        <h2 className="text-lg font-semibold">{atom.title}</h2>
        <p className="text-muted-foreground font-mono text-xs">{atom.id}</p>
      </div>

      <div className="flex flex-wrap gap-1.5">
        <Badge>{TYPE_LABELS[atom.type] ?? atom.type}</Badge>
        <Badge variant="outline">Difficulté {atom.difficulty}</Badge>
        <Badge variant="outline">{atom.timeMinutes} min</Badge>
        {atom.tags.map(tag => (
          <Badge key={tag} variant="secondary">{tag}</Badge>
        ))}
      </div>

      <Separator />

      <article className="prose prose-stone dark:prose-invert max-w-none">
        {content}
      </article>
    </div>
  )
}
