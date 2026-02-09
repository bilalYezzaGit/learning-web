'use client'

/**
 * AI Hub Client Component
 *
 * Interactive part of the AI Hub page.
 * Contains the tutor chat and weakness analyzer.
 */

import * as React from 'react'
import { Bot, BarChart3 } from 'lucide-react'

import { Tabs, TabsContent, TabsList, TabsTrigger } from '@/components/ui/tabs'
import { AITutorChat } from '@/components/patterns/ai-tutor-chat'
import { AIWeaknessDashboard } from '@/components/patterns/ai-weakness-dashboard'
import { useAuth } from '@/lib/context'
import { useProgress } from '@/lib/hooks/use-progress'
import type { ProgressEntry } from '@/types/ai'

interface AIHubClientProps {
  parcours: string
}

export function AIHubClient({ parcours }: AIHubClientProps) {
  const { userId } = useAuth()
  const { progress } = useProgress(userId ?? undefined)

  const progressData = React.useMemo((): ProgressEntry[] => {
    const entries: ProgressEntry[] = []
    progress.forEach((p) => {
      entries.push({
        activityId: p.activityId,
        activityType: p.activityType,
        status: p.status,
        score: p.score,
        total: p.total,
        attempts: p.attempts,
        title: p.activityId,
      })
    })
    return entries
  }, [progress])

  return (
    <Tabs defaultValue="chat">
      <TabsList className="w-full">
        <TabsTrigger value="chat" className="flex-1 gap-1.5">
          <Bot className="h-3.5 w-3.5" />
          Tuteur IA
        </TabsTrigger>
        <TabsTrigger value="analysis" className="flex-1 gap-1.5">
          <BarChart3 className="h-3.5 w-3.5" />
          Mon analyse
        </TabsTrigger>
      </TabsList>

      <TabsContent value="chat" className="mt-4">
        <AITutorChat
          topic="Mathématiques — Questions générales"
          className="h-[500px]"
        />
      </TabsContent>

      <TabsContent value="analysis" className="mt-4">
        <AIWeaknessDashboard
          progressData={progressData}
          parcours={parcours}
        />
      </TabsContent>
    </Tabs>
  )
}
