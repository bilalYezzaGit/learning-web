'use client'

import * as React from 'react'

import { cn } from '@/lib/utils'
import { ActivityCard } from '@/components/patterns/activity-card'

type ActivityType = 'cours' | 'exercice' | 'qcm'
type ActivityStatus = 'locked' | 'available' | 'in_progress' | 'completed'

export interface Activity {
  id: string
  title: string
  type: ActivityType
  status: ActivityStatus
  duration?: string
}

export interface ActivityListProps extends React.HTMLAttributes<HTMLDivElement> {
  activities: Activity[]
  onActivityClick?: (activityId: string) => void
}

export function ActivityList({
  activities,
  onActivityClick,
  className,
  ...props
}: ActivityListProps) {
  return (
    <div className={cn('flex flex-col gap-2', className)} {...props}>
      {activities.map((activity) => (
        <ActivityCard
          key={activity.id}
          title={activity.title}
          type={activity.type}
          status={activity.status}
          duration={activity.duration}
          onClick={() => onActivityClick?.(activity.id)}
        />
      ))}
    </div>
  )
}
