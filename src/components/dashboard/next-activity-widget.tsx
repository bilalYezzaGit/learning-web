'use client'

/**
 * Next Activity Widget
 *
 * Prominent card recommending the next activity for the learner.
 * Shows activity type, title, module context, and a CTA button.
 */

import Link from 'next/link'
import { ArrowRight, BookOpen, PenLine, HelpCircle, Sparkles } from 'lucide-react'

import { Button } from '@/components/ui/button'
import { Card, CardContent } from '@/components/ui/card'
import { Badge } from '@/components/ui/badge'
import type { NextActivity } from '@/types/dashboard'

interface NextActivityWidgetProps {
  activity: NextActivity
  parcours: string
}

const reasonLabels: Record<NextActivity['reason'], string> = {
  continue: 'Reprendre',
  retry: 'A retravailler',
  'next-module': 'Nouveau module',
  'first-activity': 'Commencer',
}

const typeIcons: Record<string, typeof BookOpen> = {
  lesson: BookOpen,
  exercise: PenLine,
  qcm: HelpCircle,
}

export function NextActivityWidget({ activity, parcours }: NextActivityWidgetProps) {
  const Icon = typeIcons[activity.activityType] ?? BookOpen

  return (
    <Card className="border-primary/20 bg-primary/5">
      <CardContent className="py-6">
        <div className="flex flex-col gap-4 sm:flex-row sm:items-center sm:justify-between">
          <div className="flex items-center gap-4">
            <div className="flex h-14 w-14 shrink-0 items-center justify-center rounded-xl bg-primary text-primary-foreground">
              {activity.reason === 'first-activity' ? (
                <Sparkles className="h-7 w-7" aria-hidden="true" />
              ) : (
                <Icon className="h-7 w-7" aria-hidden="true" />
              )}
            </div>
            <div className="min-w-0">
              <div className="flex items-center gap-2">
                <Badge variant={activity.reason === 'retry' ? 'destructive' : 'secondary'} className="text-xs">
                  {reasonLabels[activity.reason]}
                </Badge>
              </div>
              <p className="mt-1 truncate text-lg font-semibold">{activity.title}</p>
              <p className="text-sm text-muted-foreground">{activity.moduleTitle}</p>
            </div>
          </div>
          <Button size="lg" asChild className="shrink-0">
            <Link href={`/${parcours}/apprendre/${activity.moduleId}/${activity.activityId}`}>
              {activity.reason === 'first-activity' ? 'Commencer' : 'Continuer'}
              <ArrowRight className="ml-2 h-4 w-4" aria-hidden="true" />
            </Link>
          </Button>
        </div>
      </CardContent>
    </Card>
  )
}
