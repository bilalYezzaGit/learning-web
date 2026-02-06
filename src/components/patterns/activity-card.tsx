'use client'

import * as React from 'react'
import {
  BookOpen,
  FileText,
  HelpCircle,
  CheckCircle2,
  Circle,
  type LucideIcon,
} from 'lucide-react'

import { cn } from '@/lib/utils'
import { InteractiveCard } from '@/components/ui/interactive-card'

type ActivityType = 'cours' | 'exercice' | 'qcm'
type ActivityStatus = 'locked' | 'available' | 'in_progress' | 'completed'

const activityIcons: Record<ActivityType, LucideIcon> = {
  cours: BookOpen,
  exercice: FileText,
  qcm: HelpCircle,
}

const statusStyles: Record<ActivityStatus, string> = {
  locked: '',
  available: 'hover:shadow-md hover:border-primary/50',
  in_progress: 'border-primary/50 bg-primary/5',
  completed: 'border-success/50 bg-success/5',
}

export interface ActivityCardProps extends React.HTMLAttributes<HTMLDivElement> {
  title: string
  type: ActivityType
  status: ActivityStatus
  duration?: string
  onClick?: () => void
}

export function ActivityCard({
  title,
  type,
  status,
  duration,
  onClick,
  className,
  ...props
}: ActivityCardProps) {
  const IconComponent = activityIcons[type]
  const isCompleted = status === 'completed'
  const isLocked = status === 'locked'

  return (
    <InteractiveCard
      className={cn(
        'flex items-center gap-4 p-4 transition-[shadow,border-color,background-color]',
        statusStyles[status],
        className
      )}
      onClick={onClick}
      disabled={isLocked}
      {...props}
    >
      {/* Activity type icon */}
      <div
        className={cn(
          'flex h-10 w-10 shrink-0 items-center justify-center rounded-lg',
          isCompleted ? 'bg-success/10' : 'bg-muted'
        )}
      >
        <IconComponent
          aria-hidden="true"
          className={cn(
            'h-5 w-5',
            isCompleted ? 'text-success' : 'text-muted-foreground'
          )}
        />
      </div>

      {/* Content */}
      <div className="flex-1 min-w-0">
        <h4 className="truncate font-medium text-foreground">{title}</h4>
        {duration && (
          <p className="text-sm text-muted-foreground">{duration}</p>
        )}
      </div>

      {/* Status indicator */}
      <div className="shrink-0">
        {isCompleted ? (
          <CheckCircle2 className="h-5 w-5 text-success" aria-hidden="true" />
        ) : (
          <Circle
            className={cn(
              'h-5 w-5',
              status === 'in_progress'
                ? 'text-primary'
                : 'text-muted-foreground/30'
            )}
          />
        )}
      </div>
    </InteractiveCard>
  )
}
