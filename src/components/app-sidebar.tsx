"use client"

import * as React from "react"
import Link from "next/link"
import { usePathname } from "next/navigation"
import {
  IconBook,
  IconBrain,
  IconHome,
  IconSearch,
} from "@tabler/icons-react"
import { BookOpen } from "lucide-react"

import { NavUser } from "@/components/nav-user"
import { Badge } from "@/components/ui/badge"
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
import { getParcoursConfig } from "@/lib/parcours"

interface AppSidebarProps extends React.ComponentProps<typeof Sidebar> {
  parcours?: string
  onSearchClick?: () => void
}

export function AppSidebar({ parcours, onSearchClick, ...props }: AppSidebarProps) {
  const pathname = usePathname()
  const parcoursConfig = parcours ? getParcoursConfig(parcours) : null

  // Build nav items with parcours prefix
  const navItems = React.useMemo(() => {
    const base = parcours ? `/${parcours}` : ''
    return [
      {
        title: "Dashboard",
        url: base || '/',
        icon: IconHome,
      },
      {
        title: "Apprendre",
        url: `${base}/apprendre`,
        icon: IconBook,
      },
      {
        title: "Réviser",
        url: `${base}/reviser`,
        icon: IconBrain,
      },
    ]
  }, [parcours])

  return (
    <Sidebar variant="inset" collapsible="icon" {...props}>
      <SidebarHeader>
        <SidebarMenu>
          <SidebarMenuItem>
            <SidebarMenuButton asChild size="lg">
              <Link href={parcours ? `/${parcours}` : '/'}>
                <div className="flex h-8 w-8 items-center justify-center rounded-lg bg-primary text-primary-foreground">
                  <BookOpen className="h-4 w-4" />
                </div>
                <div className="flex flex-col gap-0.5">
                  <span className="font-serif text-lg font-semibold leading-none">Learning</span>
                  {parcoursConfig && (
                    <Badge variant="secondary" className="w-fit text-[10px] font-normal">
                      {parcoursConfig.label}
                    </Badge>
                  )}
                </div>
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
                  (item.url !== "/" && item.url !== `/${parcours}` && pathname.startsWith(item.url))
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
