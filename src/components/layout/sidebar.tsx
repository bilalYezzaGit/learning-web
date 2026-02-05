'use client'

/**
 * Sidebar Navigation
 *
 * Persistent sidebar for desktop navigation.
 * Shows main navigation items with active state.
 */

import Link from 'next/link'
import { usePathname } from 'next/navigation'
import { BookOpen, GraduationCap, Home, User } from 'lucide-react'

import { cn } from '@/lib/utils'

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

interface SidebarProps {
  className?: string
}

export function Sidebar({ className }: SidebarProps) {
  const pathname = usePathname()

  return (
    <aside
      className={cn(
        'flex h-full w-56 flex-col border-r bg-background',
        className
      )}
    >
      {/* Logo */}
      <div className="flex h-14 items-center border-b px-4">
        <Link href="/" className="flex items-center gap-2">
          <div className="flex h-8 w-8 items-center justify-center rounded-lg bg-primary">
            <BookOpen className="h-4 w-4 text-primary-foreground" />
          </div>
          <span className="font-serif text-lg font-semibold text-primary">
            Learning
          </span>
        </Link>
      </div>

      {/* Navigation */}
      <nav className="flex-1 space-y-1 p-2">
        {navItems.map((item) => {
          const isActive =
            pathname === item.href ||
            (item.href !== '/' && pathname.startsWith(item.href))

          return (
            <Link
              key={item.href}
              href={item.href}
              className={cn(
                'flex items-center gap-3 rounded-lg px-3 py-2 text-sm font-medium transition-colors',
                isActive
                  ? 'bg-primary/10 text-primary'
                  : 'text-muted-foreground hover:bg-muted hover:text-foreground'
              )}
            >
              <item.icon className="h-4 w-4" />
              {item.label}
            </Link>
          )
        })}
      </nav>

      {/* Footer */}
      <div className="border-t p-4">
        <p className="text-xs text-muted-foreground">
          Version 1.0.0
        </p>
      </div>
    </aside>
  )
}
