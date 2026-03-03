"use client"

import Link from "next/link"
import * as React from "react"
import { LogOut, CircleUser } from "lucide-react"

import {
  Avatar,
  AvatarFallback,
  AvatarImage,
} from "@/components/ui/avatar"
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
import { Skeleton } from "@/components/ui/skeleton"
import { ProfileSheet } from "@/app/app/_components/profile-sheet"

export function NavUser() {
  const { user, isLoading, isAuthenticated, signOut } = useAuth()

  const [profileOpen, setProfileOpen] = React.useState(false)

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
              </div>
            </div>
          </DropdownMenuLabel>
          <DropdownMenuSeparator />
          <DropdownMenuItem onClick={() => setProfileOpen(true)}>
            <CircleUser className="mr-2 h-4 w-4" aria-hidden="true" />
            Profil
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
      />
    </>
  )
}
