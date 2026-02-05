'use client'

import * as React from 'react'
import Link from 'next/link'
import { usePathname } from 'next/navigation'
import { BookOpen, Target, User, ChevronLeft } from 'lucide-react'

import { cn } from '@/lib/utils'
import { Button } from '@/components/ui/button'
import { Separator } from '@/components/ui/separator'

const navItems = [
  { href: '/cours', label: 'Cours', icon: BookOpen },
  { href: '/objectifs', label: 'Objectifs', icon: Target },
  { href: '/profil', label: 'Profil', icon: User },
]

export interface SidebarProps extends React.HTMLAttributes<HTMLElement> {
  collapsed?: boolean
  onCollapse?: (collapsed: boolean) => void
}

export function Sidebar({
  collapsed = false,
  onCollapse,
  className,
  ...props
}: SidebarProps) {
  const pathname = usePathname()

  return (
    <aside
      className={cn(
        'hidden h-screen flex-col border-r bg-sidebar transition-all md:flex',
        collapsed ? 'w-16' : 'w-64',
        className
      )}
      {...props}
    >
      {/* Logo */}
      <div className="flex h-14 items-center border-b px-4">
        {!collapsed && (
          <Link href="/" className="font-serif text-xl font-semibold text-primary">
            Learning OS
          </Link>
        )}
      </div>

      {/* Navigation */}
      <nav className="flex-1 space-y-1 p-2">
        {navItems.map((item) => {
          const isActive = pathname?.startsWith(item.href)
          return (
            <Link
              key={item.href}
              href={item.href}
              className={cn(
                'flex items-center gap-3 rounded-lg px-3 py-2 text-sm font-medium transition-colors',
                isActive
                  ? 'bg-sidebar-accent text-sidebar-accent-foreground'
                  : 'text-sidebar-foreground hover:bg-sidebar-accent/50'
              )}
            >
              <item.icon className="h-5 w-5 shrink-0" />
              {!collapsed && <span>{item.label}</span>}
            </Link>
          )
        })}
      </nav>

      <Separator />

      {/* Collapse button */}
      <div className="p-2">
        <Button
          variant="ghost"
          size="sm"
          className="w-full justify-start"
          onClick={() => onCollapse?.(!collapsed)}
        >
          <ChevronLeft
            className={cn(
              'h-4 w-4 transition-transform',
              collapsed && 'rotate-180'
            )}
          />
          {!collapsed && <span className="ml-2">Réduire</span>}
        </Button>
      </div>
    </aside>
  )
}
