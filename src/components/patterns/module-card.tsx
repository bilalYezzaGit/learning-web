'use client'

import * as React from 'react'
import Image from 'next/image'
import { BookOpen } from 'lucide-react'

import { cn } from '@/lib/utils'
import { Card, CardContent } from '@/components/ui/card'
import { Progress } from '@/components/ui/progress'

export interface ModuleCardProps extends React.HTMLAttributes<HTMLDivElement> {
  title: string
  description?: string
  imageUrl?: string
  progress?: number
  activityCount?: number
  onClick?: () => void
}

export function ModuleCard({
  title,
  description,
  imageUrl,
  progress = 0,
  activityCount,
  onClick,
  className,
  ...props
}: ModuleCardProps) {
  return (
    <Card
      className={cn(
        'cursor-pointer overflow-hidden transition-shadow hover:shadow-md',
        className
      )}
      onClick={onClick}
      {...props}
    >
      {/* Image or placeholder */}
      <div className="relative aspect-video bg-muted">
        {imageUrl ? (
          <Image
            src={imageUrl}
            alt={title}
            fill
            className="object-cover"
          />
        ) : (
          <div className="flex h-full items-center justify-center">
            <BookOpen className="h-12 w-12 text-muted-foreground/50" />
          </div>
        )}
      </div>

      <CardContent className="p-4">
        {/* Title */}
        <h3 className="font-serif text-lg font-semibold leading-tight text-foreground">
          {title}
        </h3>

        {/* Description */}
        {description && (
          <p className="mt-1 line-clamp-2 text-sm text-muted-foreground">
            {description}
          </p>
        )}

        {/* Footer: Progress + Activity count */}
        <div className="mt-3 flex items-center gap-3">
          <Progress value={progress} className="flex-1" />
          <span className="text-sm font-medium text-muted-foreground">
            {progress}%
          </span>
        </div>

        {activityCount !== undefined && (
          <p className="mt-2 text-xs text-muted-foreground">
            {activityCount} activité{activityCount > 1 ? 's' : ''}
          </p>
        )}
      </CardContent>
    </Card>
  )
}
