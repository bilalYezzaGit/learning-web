"use client"

import * as React from "react"
import Link from "next/link"
import { usePathname } from "next/navigation"
import { BookOpen, Brain, Home } from "lucide-react"

import { NavApprendre, type SidebarModule } from "@/components/nav-apprendre"
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
  modules?: SidebarModule[]
}

export function AppSidebar({ parcours, modules = [], ...props }: AppSidebarProps) {
  const pathname = usePathname()
  const parcoursConfig = parcours ? getParcoursConfig(parcours) : null

  const base = parcours ? `/${parcours}` : ''
  const dashboardUrl = base || '/'
  const reviserUrl = `${base}/reviser`

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
              <SidebarMenuItem>
                <SidebarMenuButton asChild isActive={pathname === dashboardUrl}>
                  <Link href={dashboardUrl}>
                    <Home className="h-4 w-4" />
                    <span>Dashboard</span>
                  </Link>
                </SidebarMenuButton>
              </SidebarMenuItem>

              {parcours && <NavApprendre parcours={parcours} modules={modules} />}

              <SidebarMenuItem>
                <SidebarMenuButton asChild isActive={pathname.startsWith(reviserUrl)}>
                  <Link href={reviserUrl}>
                    <Brain className="h-4 w-4" />
                    <span>Réviser</span>
                  </Link>
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
