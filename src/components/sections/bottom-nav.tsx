'use client'

import * as React from 'react'
import Link from 'next/link'
import { usePathname } from 'next/navigation'
import { BookOpen, Target, User } from 'lucide-react'

import { cn } from '@/lib/utils'

const navItems = [
  { href: '/cours', label: 'Cours', icon: BookOpen },
  { href: '/objectifs', label: 'Objectifs', icon: Target },
  { href: '/profil', label: 'Moi', icon: User },
]

export interface BottomNavProps extends React.HTMLAttributes<HTMLElement> {}

export function BottomNav({ className, ...props }: BottomNavProps) {
  const pathname = usePathname()

  return (
    <nav
      className={cn(
        'fixed bottom-0 left-0 right-0 z-50 flex h-16 items-center justify-around border-t bg-background md:hidden',
        className
      )}
      {...props}
    >
      {navItems.map((item) => {
        const isActive = pathname?.startsWith(item.href)
        return (
          <Link
            key={item.href}
            href={item.href}
            className={cn(
              'flex flex-col items-center gap-1 px-3 py-2 text-xs font-medium transition-colors',
              isActive
                ? 'text-primary'
                : 'text-muted-foreground hover:text-foreground'
            )}
          >
            <item.icon className={cn('h-5 w-5', isActive && 'text-primary')} />
            <span>{item.label}</span>
          </Link>
        )
      })}
    </nav>
  )
}
