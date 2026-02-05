'use client'

/**
 * Mobile Navigation
 *
 * Bottom sheet navigation for mobile devices.
 * Uses Sheet component from shadcn/ui.
 */

import Link from 'next/link'
import { usePathname } from 'next/navigation'
import { BookOpen, GraduationCap, Home, User, X } from 'lucide-react'

import { cn } from '@/lib/utils'
import {
  Sheet,
  SheetContent,
  SheetHeader,
  SheetTitle,
} from '@/components/ui/sheet'
import { Button } from '@/components/ui/button'

const navItems = [
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
  {
    label: 'Profil',
    href: '/profil',
    icon: User,
  },
]

interface MobileNavProps {
  open: boolean
  onOpenChange: (open: boolean) => void
}

export function MobileNav({ open, onOpenChange }: MobileNavProps) {
  const pathname = usePathname()

  return (
    <Sheet open={open} onOpenChange={onOpenChange}>
      <SheetContent side="left" className="w-72 p-0">
        <SheetHeader className="border-b p-4">
          <SheetTitle className="flex items-center gap-2">
            <div className="flex h-8 w-8 items-center justify-center rounded-lg bg-primary">
              <BookOpen className="h-4 w-4 text-primary-foreground" />
            </div>
            <span className="font-serif text-lg">Learning</span>
          </SheetTitle>
        </SheetHeader>

        <nav className="flex flex-col gap-1 p-2">
          {navItems.map((item) => {
            const isActive =
              pathname === item.href ||
              (item.href !== '/' && pathname.startsWith(item.href))

            return (
              <Link
                key={item.href}
                href={item.href}
                onClick={() => onOpenChange(false)}
                className={cn(
                  'flex items-center gap-3 rounded-lg px-3 py-3 text-sm font-medium transition-colors',
                  isActive
                    ? 'bg-primary/10 text-primary'
                    : 'text-muted-foreground hover:bg-muted hover:text-foreground'
                )}
              >
                <item.icon className="h-5 w-5" />
                {item.label}
              </Link>
            )
          })}
        </nav>
      </SheetContent>
    </Sheet>
  )
}
