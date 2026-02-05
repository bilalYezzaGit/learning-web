'use client'

import * as React from 'react'
import { Trophy, Clock, RotateCcw, Eye } from 'lucide-react'

import { cn } from '@/lib/utils'
import { Button } from '@/components/ui/button'
import { Card, CardContent } from '@/components/ui/card'
import { Progress } from '@/components/ui/progress'

export interface QCMResultProps extends React.HTMLAttributes<HTMLDivElement> {
  score: number
  totalQuestions: number
  timeSpent?: string
  onReview?: () => void
  onRetry?: () => void
}

export function QCMResult({
  score,
  totalQuestions,
  timeSpent,
  onReview,
  onRetry,
  className,
  ...props
}: QCMResultProps) {
  const percentage = Math.round((score / totalQuestions) * 100)
  const isSuccess = percentage >= 70

  return (
    <div className={cn('space-y-6', className)} {...props}>
      {/* Score card */}
      <Card>
        <CardContent className="flex flex-col items-center p-6 text-center">
          {/* Trophy icon */}
          <div
            className={cn(
              'mb-4 flex h-16 w-16 items-center justify-center rounded-full',
              isSuccess ? 'bg-success/10' : 'bg-warning/10'
            )}
          >
            <Trophy
              className={cn(
                'h-8 w-8',
                isSuccess ? 'text-success' : 'text-warning'
              )}
            />
          </div>

          {/* Score */}
          <h2 className="mb-2 font-serif text-3xl font-bold text-foreground">
            {score} / {totalQuestions}
          </h2>

          {/* Progress bar */}
          <div className="mb-4 w-full max-w-xs">
            <Progress value={percentage} className="h-3" />
          </div>

          {/* Percentage */}
          <p
            className={cn(
              'text-lg font-semibold',
              isSuccess ? 'text-success' : 'text-warning'
            )}
          >
            {percentage}%
          </p>

          {/* Message */}
          <p className="mt-2 text-muted-foreground">
            {isSuccess
              ? 'Excellent travail !'
              : 'Continue à t\'entraîner !'}
          </p>

          {/* Time spent */}
          {timeSpent && (
            <div className="mt-4 flex items-center gap-2 text-sm text-muted-foreground">
              <Clock className="h-4 w-4" />
              <span>Temps : {timeSpent}</span>
            </div>
          )}
        </CardContent>
      </Card>

      {/* Actions */}
      <div className="flex flex-col gap-2 sm:flex-row sm:justify-center">
        {onReview && (
          <Button variant="outline" onClick={onReview}>
            <Eye className="mr-2 h-4 w-4" />
            Voir les corrections
          </Button>
        )}
        {onRetry && (
          <Button onClick={onRetry}>
            <RotateCcw className="mr-2 h-4 w-4" />
            Recommencer
          </Button>
        )}
      </div>
    </div>
  )
}
