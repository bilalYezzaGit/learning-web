"use client"

import * as React from "react"
import Link from "next/link"
import { usePathname } from "next/navigation"
import { BookOpen, Brain, Home, Moon, Sun } from "lucide-react"

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
import { Button } from "@/components/ui/button"
import { getParcoursConfig } from "@/lib/parcours"
import { useTheme } from "next-themes"

interface AppSidebarProps extends React.ComponentProps<typeof Sidebar> {
  parcours?: string
  modules?: SidebarModule[]
}

export function AppSidebar({ parcours, modules = [], ...props }: AppSidebarProps) {
  const pathname = usePathname()
  const { resolvedTheme, setTheme } = useTheme()
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
                  <BookOpen className="h-4 w-4" aria-hidden="true" />
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
                    <Home className="h-4 w-4" aria-hidden="true" />
                    <span>Tableau de bord</span>
                  </Link>
                </SidebarMenuButton>
              </SidebarMenuItem>

              {parcours && <NavApprendre parcours={parcours} modules={modules} />}

              <SidebarMenuItem>
                <SidebarMenuButton asChild isActive={pathname.startsWith(reviserUrl)}>
                  <Link href={reviserUrl}>
                    <Brain className="h-4 w-4" aria-hidden="true" />
                    <span>Réviser</span>
                  </Link>
                </SidebarMenuButton>
              </SidebarMenuItem>
            </SidebarMenu>
          </SidebarGroupContent>
        </SidebarGroup>
      </SidebarContent>
      <SidebarFooter>
        <div className="flex items-center justify-center px-2 pb-1">
          <Button
            variant="ghost"
            size="icon-sm"
            onClick={() => setTheme(resolvedTheme === 'dark' ? 'light' : 'dark')}
            aria-label={resolvedTheme === 'dark' ? 'Passer en mode clair' : 'Passer en mode sombre'}
          >
            <Sun className="h-4 w-4 rotate-0 scale-100 transition-transform dark:-rotate-90 dark:scale-0" />
            <Moon className="absolute h-4 w-4 rotate-90 scale-0 transition-transform dark:rotate-0 dark:scale-100" />
          </Button>
        </div>
        <NavUser />
      </SidebarFooter>
    </Sidebar>
  )
}
