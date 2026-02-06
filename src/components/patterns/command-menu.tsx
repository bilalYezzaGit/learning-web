'use client'

/**
 * Command Menu
 *
 * Global search and navigation via Cmd+K.
 * Uses cmdk (shadcn Command component).
 */

import * as React from 'react'
import { useRouter } from 'next/navigation'
import {
  BookOpen,
  GraduationCap,
  Home,
  Search,
} from 'lucide-react'

import {
  CommandDialog,
  CommandEmpty,
  CommandGroup,
  CommandInput,
  CommandItem,
  CommandList,
  CommandSeparator,
} from '@/components/ui/command'

const navigationItems = [
  {
    label: 'Dashboard',
    href: '/',
    icon: Home,
  },
  {
    label: 'Apprendre',
    href: '/apprendre',
    icon: BookOpen,
  },
  {
    label: 'Réviser',
    href: '/reviser',
    icon: GraduationCap,
  },
]

interface CommandMenuProps {
  open: boolean
  onOpenChange: (open: boolean) => void
}

export function CommandMenu({ open, onOpenChange }: CommandMenuProps) {
  const router = useRouter()

  // Handle keyboard shortcut
  React.useEffect(() => {
    const down = (e: KeyboardEvent) => {
      if (e.key === 'k' && (e.metaKey || e.ctrlKey)) {
        e.preventDefault()
        onOpenChange(!open)
      }
    }

    document.addEventListener('keydown', down)
    return () => document.removeEventListener('keydown', down)
  }, [open, onOpenChange])

  const runCommand = React.useCallback(
    (command: () => void) => {
      onOpenChange(false)
      command()
    },
    [onOpenChange]
  )

  return (
    <CommandDialog open={open} onOpenChange={onOpenChange}>
      <CommandInput placeholder="Rechercher une page, un module..." />
      <CommandList>
        <CommandEmpty>Aucun résultat trouvé.</CommandEmpty>

        <CommandGroup heading="Navigation">
          {navigationItems.map((item) => (
            <CommandItem
              key={item.href}
              onSelect={() => runCommand(() => router.push(item.href))}
            >
              <item.icon className="mr-2 h-4 w-4" />
              <span>{item.label}</span>
            </CommandItem>
          ))}
        </CommandGroup>

        <CommandSeparator />

        <CommandGroup heading="Actions rapides">
          <CommandItem
            onSelect={() => runCommand(() => router.push('/apprendre'))}
          >
            <BookOpen className="mr-2 h-4 w-4" />
            <span>Continuer à apprendre</span>
          </CommandItem>
          <CommandItem
            onSelect={() => runCommand(() => router.push('/reviser'))}
          >
            <GraduationCap className="mr-2 h-4 w-4" />
            <span>Lancer un QCM</span>
          </CommandItem>
        </CommandGroup>
      </CommandList>
    </CommandDialog>
  )
}
