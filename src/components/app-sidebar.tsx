"use client"

import * as React from "react"
import Link from "next/link"
import { usePathname } from "next/navigation"
import {
  IconBook,
  IconBrain,
  IconHome,
  IconSearch,
  IconUser,
} from "@tabler/icons-react"
import { BookOpen } from "lucide-react"

import { NavUser } from "@/components/nav-user"
import {
  Sidebar,
  SidebarContent,
  SidebarFooter,
  SidebarHeader,
  SidebarMenu,
  SidebarMenuButton,
  SidebarMenuItem,
  SidebarGroup,
  SidebarGroupContent,
} from "@/components/ui/sidebar"

const navItems = [
  {
    title: "Dashboard",
    url: "/",
    icon: IconHome,
  },
  {
    title: "Apprendre",
    url: "/apprendre",
    icon: IconBook,
  },
  {
    title: "Réviser",
    url: "/reviser",
    icon: IconBrain,
  },
  {
    title: "Profil",
    url: "/profil",
    icon: IconUser,
  },
]

interface AppSidebarProps extends React.ComponentProps<typeof Sidebar> {
  onSearchClick?: () => void
}

export function AppSidebar({ onSearchClick, ...props }: AppSidebarProps) {
  const pathname = usePathname()

  return (
    <Sidebar variant="inset" collapsible="icon" {...props}>
      <SidebarHeader>
        <SidebarMenu>
          <SidebarMenuItem>
            <SidebarMenuButton asChild size="lg">
              <Link href="/">
                <div className="flex h-8 w-8 items-center justify-center rounded-lg bg-primary text-primary-foreground">
                  <BookOpen className="h-4 w-4" />
                </div>
                <span className="font-serif text-lg font-semibold">Learning</span>
              </Link>
            </SidebarMenuButton>
          </SidebarMenuItem>
        </SidebarMenu>
      </SidebarHeader>
      <SidebarContent>
        <SidebarGroup>
          <SidebarGroupContent>
            <SidebarMenu>
              {navItems.map((item) => {
                const isActive = pathname === item.url ||
                  (item.url !== "/" && pathname.startsWith(item.url))
                return (
                  <SidebarMenuItem key={item.title}>
                    <SidebarMenuButton asChild isActive={isActive}>
                      <Link href={item.url}>
                        <item.icon className="h-4 w-4" />
                        <span>{item.title}</span>
                      </Link>
                    </SidebarMenuButton>
                  </SidebarMenuItem>
                )
              })}
            </SidebarMenu>
          </SidebarGroupContent>
        </SidebarGroup>
        <SidebarGroup className="mt-auto">
          <SidebarGroupContent>
            <SidebarMenu>
              <SidebarMenuItem>
                <SidebarMenuButton asChild>
                  <button type="button" onClick={onSearchClick}>
                    <IconSearch className="h-4 w-4" />
                    <span>Rechercher</span>
                    <kbd className="ml-auto text-xs text-muted-foreground">⌘K</kbd>
                  </button>
                </SidebarMenuButton>
              </SidebarMenuItem>
            </SidebarMenu>
          </SidebarGroupContent>
        </SidebarGroup>
      </SidebarContent>
      <SidebarFooter>
        <NavUser />
      </SidebarFooter>
    </Sidebar>
  )
}
