'use client'

import * as React from 'react'
import { useRouter } from 'next/navigation'
import { BookOpen, Brain, Home, Search } from 'lucide-react'

import {
  CommandDialog,
  CommandEmpty,
  CommandGroup,
  CommandInput,
  CommandItem,
  CommandList,
} from '@/components/ui/command'

interface SearchCommandProps {
  parcours: string
  modules: { id: string; title: string }[]
}

export function SearchCommand({ parcours, modules }: SearchCommandProps) {
  const [open, setOpen] = React.useState(false)
  const router = useRouter()

  React.useEffect(() => {
    const down = (e: KeyboardEvent) => {
      if (e.key === 'k' && (e.metaKey || e.ctrlKey)) {
        e.preventDefault()
        setOpen((v) => !v)
      }
    }

    document.addEventListener('keydown', down)
    return () => document.removeEventListener('keydown', down)
  }, [])

  const navigate = (path: string) => {
    setOpen(false)
    router.push(path)
  }

  return (
    <>
      <button
        onClick={() => setOpen(true)}
        className="inline-flex h-9 items-center gap-2 rounded-md border bg-background px-3 text-sm text-muted-foreground transition-colors hover:bg-accent hover:text-accent-foreground md:w-60"
        aria-label="Rechercher"
      >
        <Search className="h-4 w-4" aria-hidden="true" />
        <span className="hidden md:inline-flex flex-1">Rechercher...</span>
        <kbd className="hidden pointer-events-none h-5 select-none items-center gap-0.5 rounded border bg-muted px-1.5 text-[10px] font-medium md:inline-flex">
          <span className="text-xs">⌘</span>K
        </kbd>
      </button>

      <CommandDialog open={open} onOpenChange={setOpen}>
        <CommandInput placeholder="Rechercher un module, une page..." />
        <CommandList>
          <CommandEmpty>Aucun résultat trouvé.</CommandEmpty>

          <CommandGroup heading="Pages">
            <CommandItem onSelect={() => navigate(`/${parcours}`)}>
              <Home className="mr-2 h-4 w-4" />
              Tableau de bord
            </CommandItem>
            <CommandItem onSelect={() => navigate(`/${parcours}/apprendre`)}>
              <BookOpen className="mr-2 h-4 w-4" />
              Apprendre
            </CommandItem>
            <CommandItem onSelect={() => navigate(`/${parcours}/reviser`)}>
              <Brain className="mr-2 h-4 w-4" />
              Réviser
            </CommandItem>
          </CommandGroup>

          {modules.length > 0 && (
            <CommandGroup heading="Modules">
              {modules.map((mod) => (
                <CommandItem
                  key={mod.id}
                  onSelect={() => navigate(`/${parcours}/apprendre/${mod.id}`)}
                >
                  <BookOpen className="mr-2 h-4 w-4" />
                  {mod.title}
                </CommandItem>
              ))}
            </CommandGroup>
          )}
        </CommandList>
      </CommandDialog>
    </>
  )
}
