'use client'

/**
 * Course Timeline Component
 *
 * A modern sidebar for course/serie navigation with sections and activities.
 * Works with both Module (has sections) and Serie (flat list).
 */

import { useMemo, useState } from 'react'
import {
  Check,
  RotateCcw,
  ChevronUp,
  Clock,
  ArrowRight,
  PanelLeft,
  Gauge,
} from 'lucide-react'
import {
  Accordion,
  AccordionContent,
  AccordionItem,
  AccordionTrigger,
} from '@/components/ui/accordion'
import { Progress } from '@/components/ui/progress'
import { Button } from '@/components/ui/button'
import {
  Collapsible,
  CollapsibleContent,
  CollapsibleTrigger,
} from '@/components/ui/collapsible'
import {
  Sheet,
  SheetContent,
  SheetTitle,
} from '@/components/ui/sheet'
import { cn } from '@/lib/utils'
import type { TimelineActivity } from '@/types/content'
import type { AtomType } from '@/types/content'

// =============================================================================
// Types
// =============================================================================

export interface ActivityProgress {
  activityId: string
  isCompleted: boolean
  isSuccess: boolean
  score?: number
  total?: number
}

/** Generic timeline data that works for both Module and Serie */
export interface TimelineData {
  id: string
  title: string
  description?: string
  /** Estimated time in minutes */
  estimatedMinutes: number
  /** Activities list */
  activities: TimelineActivity[]
  /** Optional sections for grouping (Module has them, Serie doesn't) */
  sections?: Array<{
    id: string
    label: string
    order: number
  }>
  /** Optional ordered activity IDs (coursePath for Module) */
  activityOrder?: string[]
  /** Optional objectives (Module only) */
  objectives?: string[]
  /** Optional difficulty 1-3 (Serie only) */
  difficulty?: number
}

interface CourseTimelineProps {
  data: TimelineData
  currentActivityId?: string
  onActivityClick: (activityId: string) => void
  progress?: ActivityProgress[]
}

interface SectionWithActivities {
  id: string
  label: string
  order: number
  activities: TimelineActivity[]
}

// =============================================================================
// Constants
// =============================================================================

const TYPE_LABELS: Record<AtomType, string> = {
  lesson: 'Cours',
  exercise: 'Exercice',
  qcm: 'QCM',
}

const DIFFICULTY_LABELS: Record<number, string> = {
  1: 'Facile',
  2: 'Moyen',
  3: 'Difficile',
}

// =============================================================================
// Helpers
// =============================================================================

function formatDuration(minutes: number): string {
  if (minutes < 60) return `${minutes} min`
  const h = Math.floor(minutes / 60)
  const m = minutes % 60
  return m > 0 ? `${h}h${m.toString().padStart(2, '0')}` : `${h}h`
}

function getActivityProgress(
  activityId: string,
  progress: ActivityProgress[]
): ActivityProgress | undefined {
  return progress.find((p) => p.activityId === activityId)
}

function getSectionProgress(
  section: SectionWithActivities,
  progress: ActivityProgress[]
): { completed: number; total: number } {
  const total = section.activities.length
  const completed = section.activities.filter((a) =>
    progress.some((p) => p.activityId === a.id && p.isCompleted)
  ).length
  return { completed, total }
}

function findNextActivity(
  activities: TimelineActivity[],
  progress: ActivityProgress[]
): string | undefined {
  for (const activity of activities) {
    const p = getActivityProgress(activity.id, progress)
    if (!p?.isCompleted) return activity.id
  }
  return undefined
}

function groupActivitiesBySections(
  data: TimelineData
): SectionWithActivities[] {
  const activitiesMap = new Map(data.activities.map((a) => [a.id, a]))
  const orderedActivityIds = data.activityOrder || []

  // Get activities in order
  const orderedActivities = orderedActivityIds
    .map((id) => activitiesMap.get(id))
    .filter((a): a is TimelineActivity => a !== undefined)

  // Add any activities not in order
  const inOrder = new Set(orderedActivityIds)
  const remaining = data.activities.filter((a) => !inOrder.has(a.id))
  const allActivities = [...orderedActivities, ...remaining]

  // If no sections defined, return single flat section
  if (!data.sections || data.sections.length === 0) {
    return [
      {
        id: '_all',
        label: 'Activités',
        order: 0,
        activities: allActivities,
      },
    ]
  }

  // Group by section
  const sectionsMap = new Map<string, TimelineActivity[]>()
  const noSection: TimelineActivity[] = []

  for (const activity of allActivities) {
    if (activity.sectionId) {
      const existing = sectionsMap.get(activity.sectionId) || []
      existing.push(activity)
      sectionsMap.set(activity.sectionId, existing)
    } else {
      noSection.push(activity)
    }
  }

  // Build sections with activities
  const result: SectionWithActivities[] = []

  // Add defined sections in order
  const sortedSections = [...data.sections].sort((a, b) => a.order - b.order)
  for (const section of sortedSections) {
    const activities = sectionsMap.get(section.id) || []
    if (activities.length > 0) {
      result.push({ ...section, activities })
    }
  }

  // Add activities without section as "Autres"
  if (noSection.length > 0) {
    result.push({
      id: '_other',
      label: 'Autres activités',
      order: 999,
      activities: noSection,
    })
  }

  return result
}

// =============================================================================
// Step Indicator
// =============================================================================

function StepIndicator({
  activityProgress,
  isCurrent,
  index,
}: {
  activityProgress?: ActivityProgress
  isCurrent: boolean
  index: number
}) {
  if (activityProgress?.isCompleted && activityProgress?.isSuccess) {
    return (
      <span className="flex h-5 w-5 shrink-0 items-center justify-center rounded-full bg-foreground/10">
        <Check className="h-3 w-3 text-foreground/50" aria-hidden="true" />
      </span>
    )
  }

  if (activityProgress?.isCompleted && !activityProgress?.isSuccess) {
    return (
      <span className="flex h-5 w-5 shrink-0 items-center justify-center rounded-full bg-foreground/10">
        <RotateCcw className="h-3 w-3 text-foreground/40" aria-hidden="true" />
      </span>
    )
  }

  if (isCurrent) {
    return (
      <span className="flex h-5 w-5 shrink-0 items-center justify-center">
        <span className="h-2 w-2 rounded-full bg-foreground" />
      </span>
    )
  }

  return (
    <span className="flex h-5 w-5 shrink-0 items-center justify-center text-xs tabular-nums text-muted-foreground/60">
      {index + 1}
    </span>
  )
}

// =============================================================================
// Activity Item
// =============================================================================

function ActivityItem({
  activity,
  activityProgress,
  isCurrent,
  index,
  onActivityClick,
}: {
  activity: TimelineActivity
  activityProgress?: ActivityProgress
  isCurrent: boolean
  index: number
  onActivityClick: (id: string) => void
}) {
  return (
    <button
      type="button"
      onClick={() => onActivityClick(activity.id)}
      className={cn(
        'group flex w-full items-start gap-3 rounded-md px-3 py-2 text-left transition-colors duration-200',
        isCurrent
          ? 'border-l-2 border-l-foreground bg-muted'
          : 'hover:bg-muted/50'
      )}
    >
      <StepIndicator
        activityProgress={activityProgress}
        isCurrent={isCurrent}
        index={index}
      />

      <div className="flex min-w-0 flex-1 flex-col gap-0.5">
        <span
          className={cn(
            'text-sm leading-snug',
            isCurrent
              ? 'font-medium text-foreground'
              : activityProgress?.isCompleted
                ? 'text-muted-foreground'
                : 'text-foreground/80'
          )}
        >
          {activity.title}
        </span>
        <div className="flex items-center gap-2">
          <span className="text-xs text-muted-foreground/60">
            {TYPE_LABELS[activity.type]}
          </span>
          {activity.timeMinutes > 0 && (
            <span className="text-xs text-muted-foreground/40">
              {formatDuration(activity.timeMinutes)}
            </span>
          )}
          {activity.type === 'qcm' &&
            activityProgress?.isCompleted &&
            activityProgress?.score !== undefined &&
            activityProgress?.total !== undefined && (
              <span
                className={cn(
                  'text-xs tabular-nums',
                  activityProgress.isSuccess
                    ? 'text-muted-foreground/60'
                    : 'font-medium text-foreground/50'
                )}
              >
                {activityProgress.score}/{activityProgress.total}
              </span>
            )}
        </div>
      </div>
    </button>
  )
}

// =============================================================================
// Section Accordion
// =============================================================================

function SectionAccordion({
  section,
  currentActivityId,
  progress,
  onActivityClick,
}: {
  section: SectionWithActivities
  currentActivityId?: string
  progress: ActivityProgress[]
  onActivityClick: (id: string) => void
}) {
  const { completed, total } = getSectionProgress(section, progress)
  const allDone = completed === total

  return (
    <AccordionItem value={section.id} className="border-none">
      <AccordionTrigger className="px-4 py-2.5 hover:bg-muted/50 hover:no-underline [&>svg]:h-3.5 [&>svg]:w-3.5 [&>svg]:text-muted-foreground/50">
        <div className="flex flex-1 items-center justify-between pr-2">
          <span className="text-sm font-medium text-foreground">
            {section.label}
          </span>
          <span className="text-xs tabular-nums text-muted-foreground/60">
            {allDone ? 'Terminé' : `${completed}/${total}`}
          </span>
        </div>
      </AccordionTrigger>
      <AccordionContent className="px-1 pb-1 pt-0">
        <div className="flex flex-col">
          {section.activities.map((activity, idx) => (
            <ActivityItem
              key={activity.id}
              activity={activity}
              activityProgress={getActivityProgress(activity.id, progress)}
              isCurrent={activity.id === currentActivityId}
              index={idx}
              onActivityClick={onActivityClick}
            />
          ))}
        </div>
      </AccordionContent>
    </AccordionItem>
  )
}

// =============================================================================
// Flat Activity List (no sections)
// =============================================================================

function FlatActivityList({
  activities,
  currentActivityId,
  progress,
  onActivityClick,
}: {
  activities: TimelineActivity[]
  currentActivityId?: string
  progress: ActivityProgress[]
  onActivityClick: (id: string) => void
}) {
  return (
    <div className="flex flex-col px-1 py-2">
      {activities.map((activity, idx) => (
        <ActivityItem
          key={activity.id}
          activity={activity}
          activityProgress={getActivityProgress(activity.id, progress)}
          isCurrent={activity.id === currentActivityId}
          index={idx}
          onActivityClick={onActivityClick}
        />
      ))}
    </div>
  )
}

// =============================================================================
// Timeline Header
// =============================================================================

function TimelineHeader({
  data,
  progressPercent,
  onContinue,
}: {
  data: TimelineData
  progressPercent: number
  onContinue: () => void
}) {
  const [isOpen, setIsOpen] = useState(true)
  const hasObjectives = data.objectives && data.objectives.length > 0
  const hasDifficulty = data.difficulty !== undefined

  return (
    <Collapsible open={isOpen} onOpenChange={setIsOpen}>
      <div className="flex flex-col gap-2 px-4 pb-3 pt-4">
        <div className="flex items-start justify-between gap-2">
          <h2 className="text-balance text-sm font-semibold leading-snug text-foreground">
            {data.title}
          </h2>
          <CollapsibleTrigger asChild>
            <Button
              variant="ghost"
              size="icon"
              className="h-6 w-6 shrink-0 text-muted-foreground/50 hover:text-muted-foreground"
            >
              <ChevronUp
                aria-hidden="true"
                className={cn(
                  'h-3.5 w-3.5 transition-transform duration-200',
                  !isOpen && 'rotate-180'
                )}
              />
              <span className="sr-only">
                {isOpen ? 'Réduire' : 'Développer'}
              </span>
            </Button>
          </CollapsibleTrigger>
        </div>

        <CollapsibleContent className="overflow-hidden transition-all data-[state=closed]:animate-accordion-up data-[state=open]:animate-accordion-down">
          <div className="flex flex-col gap-3 pb-1">
            {data.description && (
              <p className="text-xs leading-relaxed text-muted-foreground">
                {data.description}
              </p>
            )}

            {/* Objectives (Module) */}
            {hasObjectives && (
              <ul className="flex flex-col gap-1.5">
                {data.objectives!.map((obj) => (
                  <li
                    key={obj}
                    className="flex items-start gap-2 text-xs text-muted-foreground/80"
                  >
                    <Check className="mt-0.5 h-3 w-3 shrink-0 text-muted-foreground/40" aria-hidden="true" />
                    <span className="leading-relaxed">{obj}</span>
                  </li>
                ))}
              </ul>
            )}

            <div className="flex items-center gap-3 text-xs text-muted-foreground/60">
              {/* Difficulty (Serie) */}
              {hasDifficulty && (
                <span className="flex items-center gap-1">
                  <Gauge className="h-3 w-3" aria-hidden="true" />
                  {DIFFICULTY_LABELS[data.difficulty!] || 'Moyen'}
                </span>
              )}
              <span className="flex items-center gap-1">
                <Clock className="h-3 w-3" aria-hidden="true" />
                {formatDuration(data.estimatedMinutes)}
              </span>
              <span className="tabular-nums">{progressPercent}% terminé</span>
            </div>

            <Button
              variant="ghost"
              size="sm"
              className="w-full justify-between text-sm font-medium text-foreground hover:bg-muted"
              onClick={onContinue}
            >
              Continuer
              <ArrowRight className="h-3.5 w-3.5" aria-hidden="true" />
            </Button>
          </div>
        </CollapsibleContent>

        {/* Progress bar always visible */}
        <div className="flex items-center gap-2.5">
          <Progress value={progressPercent} className="h-1 flex-1" />
          <span className="text-xs tabular-nums text-muted-foreground/50">
            {progressPercent}%
          </span>
        </div>
      </div>
    </Collapsible>
  )
}

// =============================================================================
// Main Component
// =============================================================================

export function CourseTimeline({
  data,
  currentActivityId,
  onActivityClick,
  progress = [],
}: CourseTimelineProps) {
  const [sheetOpen, setSheetOpen] = useState(false)

  // Group activities by sections (or single flat list)
  const sections = useMemo(() => groupActivitiesBySections(data), [data])

  // Check if we have real sections or just a flat list
  const hasSections = data.sections && data.sections.length > 0

  // Calculate overall progress
  const progressPercent = useMemo(() => {
    const totalActivities = data.activities.length
    if (totalActivities === 0) return 0
    const completed = progress.filter((p) => p.isCompleted).length
    return Math.round((completed / totalActivities) * 100)
  }, [data.activities, progress])

  // Default open section (current activity's section or first)
  // eslint-disable-next-line react-hooks/preserve-manual-memoization
  const defaultOpenSections = useMemo((): string[] => {
    if (!currentActivityId) {
      const firstId = sections[0]?.id
      return firstId ? [firstId] : []
    }
    for (const section of sections) {
      if (section.activities.some((a) => a.id === currentActivityId)) {
        return [section.id]
      }
    }
    const firstId = sections[0]?.id
    return firstId ? [firstId] : []
  }, [sections, currentActivityId])

  const handleContinue = () => {
    const nextId = findNextActivity(data.activities, progress)
    if (nextId) onActivityClick(nextId)
  }

  const handleActivityClick = (id: string) => {
    onActivityClick(id)
    setSheetOpen(false)
  }

  const timelineContent = (
    <>
      <TimelineHeader
        data={data}
        progressPercent={progressPercent}
        onContinue={handleContinue}
      />

      <div className="mx-4 h-px bg-border/30" />

      <div className="flex-1 min-h-0 overflow-y-auto">
        {hasSections ? (
          <Accordion
            type="multiple"
            defaultValue={defaultOpenSections}
            className="w-full"
          >
            {sections.map((section) => (
              <SectionAccordion
                key={section.id}
                section={section}
                currentActivityId={currentActivityId}
                progress={progress}
                onActivityClick={handleActivityClick}
              />
            ))}
          </Accordion>
        ) : (
          <FlatActivityList
            activities={data.activities}
            currentActivityId={currentActivityId}
            progress={progress}
            onActivityClick={handleActivityClick}
          />
        )}
      </div>
    </>
  )

  return (
    <>
      {/* Mobile: Sheet sidebar */}
      <Button
        variant="outline"
        size="icon"
        className="fixed left-4 top-4 z-50 h-9 w-9 border-border/50 bg-background/80 backdrop-blur-sm lg:hidden"
        onClick={() => setSheetOpen(true)}
      >
        <PanelLeft className="h-4 w-4" aria-hidden="true" />
        <span className="sr-only">Ouvrir le menu</span>
      </Button>

      <Sheet open={sheetOpen} onOpenChange={setSheetOpen}>
        <SheetContent side="left" className="w-[min(80vw,320px)] p-0 flex flex-col overscroll-contain">
          <SheetTitle className="sr-only">{data.title}</SheetTitle>
          {timelineContent}
        </SheetContent>
      </Sheet>

      {/* Desktop: static aside */}
      <aside className="hidden lg:flex h-full w-80 flex-col overflow-hidden border-r border-border/40 bg-background">
        {timelineContent}
      </aside>
    </>
  )
}
