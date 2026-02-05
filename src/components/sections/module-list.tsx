'use client'

import * as React from 'react'

import { cn } from '@/lib/utils'
import { ModuleCard, type ModuleCardProps } from '@/components/patterns/module-card'

export interface Module {
  id: string
  title: string
  description?: string
  imageUrl?: string
  progress?: number
  activityCount?: number
}

export interface ModuleListProps extends React.HTMLAttributes<HTMLDivElement> {
  modules: Module[]
  onModuleClick?: (moduleId: string) => void
}

export function ModuleList({
  modules,
  onModuleClick,
  className,
  ...props
}: ModuleListProps) {
  return (
    <div
      className={cn(
        'grid gap-4 sm:grid-cols-2 lg:grid-cols-3 xl:grid-cols-4',
        className
      )}
      {...props}
    >
      {modules.map((module) => (
        <ModuleCard
          key={module.id}
          title={module.title}
          description={module.description}
          imageUrl={module.imageUrl}
          progress={module.progress}
          activityCount={module.activityCount}
          onClick={() => onModuleClick?.(module.id)}
        />
      ))}
    </div>
  )
}
