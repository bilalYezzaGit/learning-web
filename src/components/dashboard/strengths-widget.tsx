'use client'

/**
 * Strengths & Weaknesses Widget
 *
 * Shows the learner's strong points and areas needing reinforcement,
 * presented as tags with score indicators.
 */

import { TrendingUp, TrendingDown } from 'lucide-react'

import { Badge } from '@/components/ui/badge'
import { Card, CardContent, CardHeader, CardTitle } from '@/components/ui/card'
import type { StrengthsAnalysis, LearningTag } from '@/types/dashboard'

interface StrengthsWidgetProps {
  data: StrengthsAnalysis
}

function TagItem({ tag, variant }: { tag: LearningTag; variant: 'strength' | 'weakness' }) {
  const isStrength = variant === 'strength'

  return (
    <div className="flex items-center justify-between gap-2 rounded-lg border p-2.5">
      <div className="flex items-center gap-2 min-w-0">
        <Badge
          variant={isStrength ? 'default' : 'destructive'}
          className="shrink-0 text-xs"
        >
          {tag.averageScore}%
        </Badge>
        <span className="truncate text-sm">{tag.tag}</span>
      </div>
      <span className="shrink-0 text-xs text-muted-foreground">
        {tag.activitiesSucceeded}/{tag.activitiesAttempted}
      </span>
    </div>
  )
}

export function StrengthsWidget({ data }: StrengthsWidgetProps) {
  const hasStrengths = data.strengths.length > 0
  const hasWeaknesses = data.weaknesses.length > 0

  if (!hasStrengths && !hasWeaknesses) {
    return (
      <Card>
        <CardHeader className="pb-3">
          <CardTitle className="text-base">Forces &amp; Axes &agrave; renforcer</CardTitle>
        </CardHeader>
        <CardContent>
          <p className="text-sm text-muted-foreground">
            Compl&eacute;tez encore quelques activit&eacute;s pour voir appara&icirc;tre votre analyse.
          </p>
        </CardContent>
      </Card>
    )
  }

  return (
    <Card>
      <CardHeader className="pb-3">
        <CardTitle className="text-base">Forces &amp; Axes &agrave; renforcer</CardTitle>
      </CardHeader>
      <CardContent className="space-y-4">
        {hasStrengths && (
          <div className="space-y-2">
            <div className="flex items-center gap-1.5 text-xs font-medium text-success">
              <TrendingUp className="h-3.5 w-3.5" aria-hidden="true" />
              Points forts
            </div>
            <div className="space-y-1.5">
              {data.strengths.map((tag) => (
                <TagItem key={tag.tag} tag={tag} variant="strength" />
              ))}
            </div>
          </div>
        )}

        {hasWeaknesses && (
          <div className="space-y-2">
            <div className="flex items-center gap-1.5 text-xs font-medium text-destructive">
              <TrendingDown className="h-3.5 w-3.5" aria-hidden="true" />
              A renforcer
            </div>
            <div className="space-y-1.5">
              {data.weaknesses.map((tag) => (
                <TagItem key={tag.tag} tag={tag} variant="weakness" />
              ))}
            </div>
          </div>
        )}
      </CardContent>
    </Card>
  )
}
