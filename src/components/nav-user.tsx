"use client"

import Link from "next/link"
import * as React from "react"
import { EllipsisVertical, LogOut, CircleUser, Settings } from "lucide-react"

import {
  Avatar,
  AvatarFallback,
  AvatarImage,
} from "@/components/ui/avatar"
import { Badge } from "@/components/ui/badge"
import {
  DropdownMenu,
  DropdownMenuContent,
  DropdownMenuItem,
  DropdownMenuLabel,
  DropdownMenuSeparator,
  DropdownMenuTrigger,
} from "@/components/ui/dropdown-menu"
import {
  SidebarMenu,
  SidebarMenuButton,
  SidebarMenuItem,
  useSidebar,
} from "@/components/ui/sidebar"
import { useAuth } from "@/lib/context"
import { useUserParcours } from "@/lib/parcours"
import { Skeleton } from "@/components/ui/skeleton"
import { ProfileSheet } from "@/components/profile-sheet"

export function NavUser() {
  const { user, isLoading, isAuthenticated, signOut } = useAuth()
  const { parcoursConfig } = useUserParcours()
  const { isMobile } = useSidebar()

  const [profileOpen, setProfileOpen] = React.useState(false)
  const [profileTab, setProfileTab] = React.useState('stats')

  const openProfile = (tab: string) => {
    setProfileTab(tab)
    setProfileOpen(true)
  }

  // Loading state
  if (isLoading) {
    return (
      <SidebarMenu>
        <SidebarMenuItem>
          <div className="flex items-center gap-2 px-2 py-1.5">
            <Skeleton className="h-8 w-8 rounded-lg" />
            <div className="flex-1">
              <Skeleton className="h-4 w-24" />
              <Skeleton className="mt-1 h-3 w-32" />
            </div>
          </div>
        </SidebarMenuItem>
      </SidebarMenu>
    )
  }

  // Not authenticated - show login button
  if (!isAuthenticated || !user) {
    return (
      <SidebarMenu>
        <SidebarMenuItem>
          <SidebarMenuButton asChild>
            <Link href="/login">
              <CircleUser className="h-4 w-4" aria-hidden="true" />
              <span>Se connecter</span>
            </Link>
          </SidebarMenuButton>
        </SidebarMenuItem>
      </SidebarMenu>
    )
  }

  // Get user info
  const userName = user.displayName || user.email || "Utilisateur"
  const userEmail = user.email || ""
  const userInitials = user.displayName
    ? user.displayName.charAt(0).toUpperCase()
    : user.email
    ? user.email.charAt(0).toUpperCase()
    : "U"

  return (
    <>
      <SidebarMenu>
        <SidebarMenuItem>
          <DropdownMenu>
            <DropdownMenuTrigger asChild>
              <SidebarMenuButton
                size="lg"
                className="data-[state=open]:bg-sidebar-accent data-[state=open]:text-sidebar-accent-foreground"
              >
                <Avatar className="h-8 w-8 rounded-lg">
                  <AvatarImage src={user.photoURL || undefined} alt={userName} />
                  <AvatarFallback className="rounded-lg bg-primary text-primary-foreground">
                    {userInitials}
                  </AvatarFallback>
                </Avatar>
                <div className="grid flex-1 text-left text-sm leading-tight">
                  <span className="truncate font-medium">{userName}</span>
                  <span className="text-muted-foreground truncate text-xs">
                    {parcoursConfig ? parcoursConfig.label : userEmail}
                  </span>
                </div>
                <EllipsisVertical className="ml-auto size-4" aria-hidden="true" />
              </SidebarMenuButton>
            </DropdownMenuTrigger>
            <DropdownMenuContent
              className="w-[--radix-dropdown-menu-trigger-width] min-w-56 rounded-lg"
              side={isMobile ? "bottom" : "right"}
              align="end"
              sideOffset={4}
            >
              <DropdownMenuLabel className="p-0 font-normal">
                <div className="flex items-center gap-2 px-1 py-1.5 text-left text-sm">
                  <Avatar className="h-8 w-8 rounded-lg">
                    <AvatarImage src={user.photoURL || undefined} alt={userName} />
                    <AvatarFallback className="rounded-lg bg-primary text-primary-foreground">
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
                Paramètres
              </DropdownMenuItem>
              <DropdownMenuSeparator />
              <DropdownMenuItem onClick={() => signOut()}>
                <LogOut className="mr-2 h-4 w-4" aria-hidden="true" />
                Déconnexion
              </DropdownMenuItem>
            </DropdownMenuContent>
          </DropdownMenu>
        </SidebarMenuItem>
      </SidebarMenu>

      <ProfileSheet
        open={profileOpen}
        onOpenChange={setProfileOpen}
        defaultTab={profileTab}
      />
    </>
  )
}
