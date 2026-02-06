'use client'

import Link from 'next/link'
import { usePathname } from 'next/navigation'
import { Book, ChevronRight } from 'lucide-react'

import { useParcoursModules } from '@/lib/hooks/use-parcours-modules'
import {
  Collapsible,
  CollapsibleContent,
  CollapsibleTrigger,
} from '@/components/ui/collapsible'
import { Skeleton } from '@/components/ui/skeleton'
import {
  SidebarMenuAction,
  SidebarMenuButton,
  SidebarMenuItem,
  SidebarMenuSub,
  SidebarMenuSubButton,
  SidebarMenuSubItem,
} from '@/components/ui/sidebar'

interface NavApprendreProps {
  parcours: string
}

export function NavApprendre({ parcours }: NavApprendreProps) {
  const pathname = usePathname()
  const { modules, isLoading } = useParcoursModules(parcours)

  const apprendreUrl = `/${parcours}/apprendre`
  const isApprendreActive = pathname.startsWith(apprendreUrl)

  return (
    <Collapsible defaultOpen={isApprendreActive} className="group/collapsible">
      <SidebarMenuItem>
        <SidebarMenuButton asChild isActive={isApprendreActive}>
          <Link href={apprendreUrl}>
            <Book className="h-4 w-4" />
            <span>Apprendre</span>
          </Link>
        </SidebarMenuButton>
        <CollapsibleTrigger asChild>
          <SidebarMenuAction className="data-[state=open]:rotate-90">
            <ChevronRight />
          </SidebarMenuAction>
        </CollapsibleTrigger>
        <CollapsibleContent>
          <SidebarMenuSub>
            {isLoading ? (
              Array.from({ length: 3 }, (_, i) => (
                <li key={i} className="flex h-7 items-center gap-2 rounded-md px-2">
                  <Skeleton className="h-3.5 flex-1" style={{ maxWidth: `${60 + i * 12}%` }} />
                </li>
              ))
            ) : (
              modules.map((mod) => {
                const moduleUrl = `${apprendreUrl}/${mod.id}`
                return (
                  <SidebarMenuSubItem key={mod.id}>
                    <SidebarMenuSubButton
                      asChild
                      isActive={pathname.startsWith(moduleUrl)}
                    >
                      <Link href={moduleUrl}>
                        <span>{mod.title}</span>
                      </Link>
                    </SidebarMenuSubButton>
                  </SidebarMenuSubItem>
                )
              })
            )}
          </SidebarMenuSub>
        </CollapsibleContent>
      </SidebarMenuItem>
    </Collapsible>
  )
}
