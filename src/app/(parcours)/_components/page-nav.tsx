import Link from 'next/link'
import { ArrowLeft } from 'lucide-react'

import {
  Breadcrumb,
  BreadcrumbItem,
  BreadcrumbLink,
  BreadcrumbList,
  BreadcrumbPage,
  BreadcrumbSeparator,
} from '@/components/ui/breadcrumb'

interface PageNavItem {
  label: string
  href: string
}

interface PageNavProps {
  items: PageNavItem[]
  current: string
  compact?: boolean
  trailing?: React.ReactNode
}

export function PageNav({ items, current, compact = false, trailing }: PageNavProps) {
  const lastAncestor = items[items.length - 1]

  return (
    <div className="flex items-center justify-between border-b px-4 py-3 lg:px-6">
      {/* Desktop: always full breadcrumb */}
      <div className="hidden lg:block">
        <Breadcrumb>
          <BreadcrumbList>
            {items.map((item, i) => (
              <BreadcrumbItem key={item.href}>
                {i > 0 && <BreadcrumbSeparator />}
                <BreadcrumbLink asChild>
                  <Link href={item.href}>{item.label}</Link>
                </BreadcrumbLink>
              </BreadcrumbItem>
            ))}
            <BreadcrumbSeparator />
            <BreadcrumbItem>
              <BreadcrumbPage>{current}</BreadcrumbPage>
            </BreadcrumbItem>
          </BreadcrumbList>
        </Breadcrumb>
      </div>

      {/* Mobile: compact = back link, otherwise full breadcrumb */}
      <div className="lg:hidden">
        {compact && lastAncestor ? (
          <Link
            href={lastAncestor.href}
            className="inline-flex items-center gap-1.5 text-sm text-muted-foreground hover:text-foreground transition-colors"
          >
            <ArrowLeft className="h-4 w-4" aria-hidden="true" />
            {lastAncestor.label}
          </Link>
        ) : (
          <Breadcrumb>
            <BreadcrumbList>
              {items.map((item, i) => (
                <BreadcrumbItem key={item.href}>
                  {i > 0 && <BreadcrumbSeparator />}
                  <BreadcrumbLink asChild>
                    <Link href={item.href}>{item.label}</Link>
                  </BreadcrumbLink>
                </BreadcrumbItem>
              ))}
              <BreadcrumbSeparator />
              <BreadcrumbItem>
                <BreadcrumbPage>{current}</BreadcrumbPage>
              </BreadcrumbItem>
            </BreadcrumbList>
          </Breadcrumb>
        )}
      </div>

      {trailing && <div className="lg:hidden">{trailing}</div>}
    </div>
  )
}
