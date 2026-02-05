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
import { Card } from '@/components/ui/card'

type ActivityType = 'cours' | 'exercice' | 'qcm'
type ActivityStatus = 'locked' | 'available' | 'in_progress' | 'completed'

const activityIcons: Record<ActivityType, LucideIcon> = {
  cours: BookOpen,
  exercice: FileText,
  qcm: HelpCircle,
}

const statusStyles: Record<ActivityStatus, string> = {
  locked: 'opacity-50 cursor-not-allowed',
  available: 'cursor-pointer hover:shadow-md hover:border-primary/50',
  in_progress: 'cursor-pointer border-primary/50 bg-primary/5',
  completed: 'cursor-pointer border-success/50 bg-success/5',
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
    <Card
      className={cn(
        'flex items-center gap-4 p-4 transition-all',
        statusStyles[status],
        className
      )}
      onClick={isLocked ? undefined : onClick}
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
          <CheckCircle2 className="h-5 w-5 text-success" />
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
    </Card>
  )
}
