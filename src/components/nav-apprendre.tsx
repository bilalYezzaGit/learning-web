'use client'

import Link from 'next/link'
import { usePathname } from 'next/navigation'
import { Book, ChevronRight } from 'lucide-react'

import {
  Collapsible,
  CollapsibleContent,
  CollapsibleTrigger,
} from '@/components/ui/collapsible'
import {
  SidebarMenuAction,
  SidebarMenuButton,
  SidebarMenuItem,
  SidebarMenuSub,
  SidebarMenuSubButton,
  SidebarMenuSubItem,
} from '@/components/ui/sidebar'

export interface SidebarModule {
  id: string
  title: string
}

interface NavApprendreProps {
  parcours: string
  modules: SidebarModule[]
}

export function NavApprendre({ parcours, modules }: NavApprendreProps) {
  const pathname = usePathname()

  const apprendreUrl = `/${parcours}/apprendre`
  const isApprendreActive = pathname.startsWith(apprendreUrl)

  return (
    <Collapsible defaultOpen={isApprendreActive} className="group/collapsible">
      <SidebarMenuItem>
        <SidebarMenuButton asChild isActive={isApprendreActive}>
          <Link href={apprendreUrl}>
            <Book className="h-4 w-4" aria-hidden="true" />
            <span>Apprendre</span>
          </Link>
        </SidebarMenuButton>
        <CollapsibleTrigger asChild>
          <SidebarMenuAction className="data-[state=open]:rotate-90" aria-label="Ouvrir les modules">
            <ChevronRight aria-hidden="true" />
          </SidebarMenuAction>
        </CollapsibleTrigger>
        <CollapsibleContent>
          <SidebarMenuSub>
            {modules.map((mod) => {
              const moduleUrl = `${apprendreUrl}/${mod.id}`
              return (
                <SidebarMenuSubItem key={mod.id}>
                  <SidebarMenuSubButton
                    asChild
                    isActive={pathname.startsWith(moduleUrl)}
                  >
                    <Link href={moduleUrl} title={mod.title}>
                      <span>{mod.title}</span>
                    </Link>
                  </SidebarMenuSubButton>
                </SidebarMenuSubItem>
              )
            })}
          </SidebarMenuSub>
        </CollapsibleContent>
      </SidebarMenuItem>
    </Collapsible>
  )
}
