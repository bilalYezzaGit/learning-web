'use client'

import * as React from 'react'
import Link from 'next/link'
import { Menu, User, LogOut, Settings } from 'lucide-react'

import { cn } from '@/lib/utils'
import { Button } from '@/components/ui/button'
import { Avatar, AvatarFallback, AvatarImage } from '@/components/ui/avatar'
import {
  DropdownMenu,
  DropdownMenuContent,
  DropdownMenuItem,
  DropdownMenuSeparator,
  DropdownMenuTrigger,
} from '@/components/ui/dropdown-menu'

export interface HeaderProps extends React.HTMLAttributes<HTMLElement> {
  user?: {
    name?: string
    email?: string
    avatarUrl?: string
  }
  onMenuClick?: () => void
  onLogout?: () => void
}

export function Header({
  user,
  onMenuClick,
  onLogout,
  className,
  ...props
}: HeaderProps) {
  return (
    <header
      className={cn(
        'sticky top-0 z-50 flex h-14 items-center gap-4 border-b bg-background px-4 md:px-6',
        className
      )}
      {...props}
    >
      {/* Mobile menu button */}
      <Button
        variant="ghost"
        size="icon"
        className="md:hidden"
        onClick={onMenuClick}
      >
        <Menu className="h-5 w-5" />
        <span className="sr-only">Menu</span>
      </Button>

      {/* Logo */}
      <Link href="/" className="flex items-center gap-2">
        <span className="font-serif text-xl font-semibold text-primary">
          Learning OS
        </span>
      </Link>

      {/* Desktop navigation */}
      <nav className="hidden flex-1 md:flex md:items-center md:gap-6">
        <Link
          href="/cours"
          className="text-sm font-medium text-muted-foreground transition-colors hover:text-foreground"
        >
          Cours
        </Link>
        <Link
          href="/objectifs"
          className="text-sm font-medium text-muted-foreground transition-colors hover:text-foreground"
        >
          Objectifs
        </Link>
      </nav>

      {/* Spacer for mobile */}
      <div className="flex-1 md:hidden" />

      {/* User menu */}
      {user ? (
        <DropdownMenu>
          <DropdownMenuTrigger asChild>
            <Button variant="ghost" className="relative h-8 w-8 rounded-full">
              <Avatar className="h-8 w-8">
                <AvatarImage src={user.avatarUrl} alt={user.name} />
                <AvatarFallback>
                  {user.name?.charAt(0).toUpperCase() ?? 'U'}
                </AvatarFallback>
              </Avatar>
            </Button>
          </DropdownMenuTrigger>
          <DropdownMenuContent align="end" className="w-56">
            <div className="flex items-center gap-2 p-2">
              <Avatar className="h-8 w-8">
                <AvatarImage src={user.avatarUrl} alt={user.name} />
                <AvatarFallback>
                  {user.name?.charAt(0).toUpperCase() ?? 'U'}
                </AvatarFallback>
              </Avatar>
              <div className="flex flex-col">
                <p className="text-sm font-medium">{user.name ?? 'Utilisateur'}</p>
                {user.email && (
                  <p className="text-xs text-muted-foreground">{user.email}</p>
                )}
              </div>
            </div>
            <DropdownMenuSeparator />
            <DropdownMenuItem asChild>
              <Link href="/profil">
                <User className="mr-2 h-4 w-4" />
                Profil
              </Link>
            </DropdownMenuItem>
            <DropdownMenuItem asChild>
              <Link href="/profil/settings">
                <Settings className="mr-2 h-4 w-4" />
                Paramètres
              </Link>
            </DropdownMenuItem>
            <DropdownMenuSeparator />
            <DropdownMenuItem onClick={onLogout}>
              <LogOut className="mr-2 h-4 w-4" />
              Déconnexion
            </DropdownMenuItem>
          </DropdownMenuContent>
        </DropdownMenu>
      ) : (
        <Button asChild size="sm">
          <Link href="/login">Connexion</Link>
        </Button>
      )}
    </header>
  )
}
