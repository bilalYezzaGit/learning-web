'use client'

import Link from 'next/link'
import { usePathname } from 'next/navigation'
import { BookOpen, Brain, Home } from 'lucide-react'
import { cn } from '@/lib/utils'

interface MobileBottomNavProps {
  parcours: string
}

export function MobileBottomNav({ parcours }: MobileBottomNavProps) {
  const pathname = usePathname()

  const items = [
    {
      href: `/${parcours}`,
      icon: Home,
      label: 'Dashboard',
      active: pathname === `/${parcours}`,
    },
    {
      href: `/${parcours}/apprendre`,
      icon: BookOpen,
      label: 'Apprendre',
      active: pathname.startsWith(`/${parcours}/apprendre`),
    },
    {
      href: `/${parcours}/reviser`,
      icon: Brain,
      label: 'Réviser',
      active: pathname.startsWith(`/${parcours}/reviser`),
    },
  ]

  return (
    <nav
      className="fixed inset-x-0 bottom-0 z-40 border-t bg-background/95 backdrop-blur-sm md:hidden print:hidden"
      aria-label="Navigation mobile"
    >
      <div className="flex items-center justify-around">
        {items.map((item) => (
          <Link
            key={item.href}
            href={item.href}
            className={cn(
              'flex flex-1 flex-col items-center gap-0.5 py-2 text-xs transition-colors',
              item.active
                ? 'text-primary'
                : 'text-muted-foreground hover:text-foreground'
            )}
          >
            <item.icon className="h-5 w-5" aria-hidden="true" />
            <span>{item.label}</span>
          </Link>
        ))}
      </div>
    </nav>
  )
}
