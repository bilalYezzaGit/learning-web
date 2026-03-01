"use client"

import Link from "next/link"
import * as React from "react"
import { LogOut, CircleUser, Settings } from "lucide-react"

import {
  Avatar,
  AvatarFallback,
  AvatarImage,
} from "@/components/ui/avatar"
import { Badge } from "@/components/ui/badge"
import { Button } from "@/components/ui/button"
import {
  DropdownMenu,
  DropdownMenuContent,
  DropdownMenuItem,
  DropdownMenuLabel,
  DropdownMenuSeparator,
  DropdownMenuTrigger,
} from "@/components/ui/dropdown-menu"
import { useAuth } from "@/lib/context"
import { useUserParcours } from "@/lib/parcours"
import { Skeleton } from "@/components/ui/skeleton"
import { ProfileSheet } from "@/app/(parcours)/_components/profile-sheet"

export function NavUser() {
  const { user, isLoading, isAuthenticated, signOut } = useAuth()
  const { parcoursConfig } = useUserParcours()

  const [profileOpen, setProfileOpen] = React.useState(false)
  const [profileTab, setProfileTab] = React.useState('stats')

  const openProfile = (tab: string) => {
    setProfileTab(tab)
    setProfileOpen(true)
  }

  if (isLoading) {
    return <Skeleton className="h-8 w-8 rounded-full" />
  }

  if (!isAuthenticated || !user) {
    return (
      <Button variant="ghost" size="sm" asChild>
        <Link href="/login">Se connecter</Link>
      </Button>
    )
  }

  const userName = user.displayName || user.email || "Utilisateur"
  const userEmail = user.email || ""
  const userInitials = user.displayName
    ? user.displayName.charAt(0).toUpperCase()
    : user.email
    ? user.email.charAt(0).toUpperCase()
    : "U"

  return (
    <>
      <DropdownMenu>
        <DropdownMenuTrigger asChild>
          <button
            type="button"
            className="rounded-full transition-opacity hover:opacity-80"
          >
            <Avatar className="h-8 w-8">
              <AvatarImage src={user.photoURL || undefined} alt={userName} />
              <AvatarFallback className="bg-primary text-primary-foreground text-sm">
                {userInitials}
              </AvatarFallback>
            </Avatar>
          </button>
        </DropdownMenuTrigger>
        <DropdownMenuContent
          className="w-56 rounded-lg"
          side="bottom"
          align="end"
          sideOffset={4}
        >
          <DropdownMenuLabel className="p-0 font-normal">
            <div className="flex items-center gap-2 px-1 py-1.5 text-left text-sm">
              <Avatar className="h-8 w-8">
                <AvatarImage src={user.photoURL || undefined} alt={userName} />
                <AvatarFallback className="bg-primary text-primary-foreground text-sm">
                  {userInitials}
                </AvatarFallback>
              </Avatar>
              <div className="grid flex-1 text-left text-sm leading-tight">
                <span className="truncate font-medium">{userName}</span>
                <span className="text-muted-foreground truncate text-xs">
                  {userEmail}
                </span>
                {parcoursConfig && (
                  <Badge variant="secondary" className="mt-1 w-fit text-[10px]">
                    {parcoursConfig.label}
                  </Badge>
                )}
              </div>
            </div>
          </DropdownMenuLabel>
          <DropdownMenuSeparator />
          <DropdownMenuItem onClick={() => openProfile('stats')}>
            <CircleUser className="mr-2 h-4 w-4" aria-hidden="true" />
            Profil
          </DropdownMenuItem>
          <DropdownMenuItem onClick={() => openProfile('settings')}>
            <Settings className="mr-2 h-4 w-4" aria-hidden="true" />
            Parametres
          </DropdownMenuItem>
          <DropdownMenuSeparator />
          <DropdownMenuItem onClick={() => signOut()}>
            <LogOut className="mr-2 h-4 w-4" aria-hidden="true" />
            Deconnexion
          </DropdownMenuItem>
        </DropdownMenuContent>
      </DropdownMenu>

      <ProfileSheet
        open={profileOpen}
        onOpenChange={setProfileOpen}
        defaultTab={profileTab}
      />
    </>
  )
}
