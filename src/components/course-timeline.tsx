'use client'

/**
 * Course Timeline Component
 *
 * A sidebar for course/serie navigation with a vertical timeline connector,
 * rich step indicators, and section progress bars.
 * Works with both Module (has sections) and Serie (flat list).
 */

import { useEffect, useMemo, useRef, useState } from 'react'
import {
  Check,
  RotateCcw,
  ChevronUp,
  Clock,
  ArrowRight,
  Gauge,
  BookOpen,
  PenLine,
  ListChecks,
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
import { formatDuration } from '@/lib/utils/format'
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
  /** External control: open/close the mobile sheet */
  mobileOpen?: boolean
  onMobileOpenChange?: (open: boolean) => void
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

const TYPE_ICONS: Record<AtomType, typeof BookOpen> = {
  lesson: BookOpen,
  exercise: PenLine,
  qcm: ListChecks,
}

const DIFFICULTY_LABELS: Record<number, string> = {
  1: 'Facile',
  2: 'Moyen',
  3: 'Difficile',
}

// =============================================================================
// Helpers
// =============================================================================

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
// Step Indicator — with vertical timeline connector
// =============================================================================

function StepIndicator({
  activityProgress,
  isCurrent,
  index,
  isLast,
}: {
  activityProgress?: ActivityProgress
  isCurrent: boolean
  index: number
  isLast: boolean
}) {
  const isCompleted = activityProgress?.isCompleted
  const isSuccess = activityProgress?.isSuccess

  return (
    <div className="relative flex flex-col items-center">
      {/* The dot / icon */}
      {isCompleted && isSuccess ? (
        <span className="relative z-10 flex h-6 w-6 shrink-0 items-center justify-center rounded-full bg-success/15 ring-2 ring-success/30">
          <Check className="h-3 w-3 text-success" aria-hidden="true" />
        </span>
      ) : isCompleted && !isSuccess ? (
        <span className="relative z-10 flex h-6 w-6 shrink-0 items-center justify-center rounded-full bg-warning/15 ring-2 ring-warning/30">
          <RotateCcw className="h-3 w-3 text-warning" aria-hidden="true" />
        </span>
      ) : isCurrent ? (
        <span className="relative z-10 flex h-6 w-6 shrink-0 items-center justify-center rounded-full bg-primary/15 ring-2 ring-primary">
          <span className="h-2 w-2 animate-pulse rounded-full bg-primary" />
        </span>
      ) : (
        <span className="relative z-10 flex h-6 w-6 shrink-0 items-center justify-center rounded-full bg-muted ring-1 ring-border text-xs tabular-nums text-muted-foreground">
          {index + 1}
        </span>
      )}

      {/* Vertical connector line */}
      {!isLast && (
        <div
          className={cn(
            'absolute top-6 w-px',
            isCompleted ? 'bg-success/30' : 'bg-border',
          )}
          style={{ height: 'calc(100% + 0.25rem)' }}
          aria-hidden="true"
        />
      )}
    </div>
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
  isLast,
  onActivityClick,
}: {
  activity: TimelineActivity
  activityProgress?: ActivityProgress
  isCurrent: boolean
  index: number
  isLast: boolean
  onActivityClick: (id: string) => void
}) {
  const TypeIcon = TYPE_ICONS[activity.type]

  return (
    <button
      type="button"
      onClick={() => onActivityClick(activity.id)}
      data-activity-id={activity.id}
      className={cn(
        'group flex w-full items-start gap-3 rounded-lg px-3 py-2.5 text-left transition-colors duration-200',
        isCurrent
          ? 'bg-primary/8 ring-1 ring-primary/20'
          : 'hover:bg-muted/60',
        activityProgress?.isCompleted && !isCurrent && 'opacity-75'
      )}
    >
      <StepIndicator
        activityProgress={activityProgress}
        isCurrent={isCurrent}
        index={index}
        isLast={isLast}
      />

      <div className="flex min-w-0 flex-1 flex-col gap-1 pt-0.5">
        <span
          className={cn(
            'text-xs leading-snug',
            isCurrent
              ? 'font-medium text-primary'
              : activityProgress?.isCompleted
                ? 'text-muted-foreground line-clamp-1'
                : 'text-foreground/90'
          )}
        >
          {activity.title}
        </span>
        <div className="flex items-center gap-2">
          <span className="flex items-center gap-1 text-xs text-muted-foreground/70">
            <TypeIcon className="h-3 w-3" aria-hidden="true" />
            {TYPE_LABELS[activity.type]}
          </span>
          {activity.timeMinutes > 0 && (
            <>
              <span className="text-xs text-muted-foreground/30" aria-hidden="true">|</span>
              <span className="text-xs text-muted-foreground/50">
                {formatDuration(activity.timeMinutes)}
              </span>
            </>
          )}
          {activity.type === 'qcm' &&
            activityProgress?.isCompleted &&
            activityProgress?.score !== undefined &&
            activityProgress?.total !== undefined && (
              <>
                <span className="text-xs text-muted-foreground/30" aria-hidden="true">|</span>
                <span
                  className={cn(
                    'text-xs font-medium tabular-nums',
                    activityProgress.isSuccess
                      ? 'text-success'
                      : 'text-warning'
                  )}
                >
                  {activityProgress.score}/{activityProgress.total}
                </span>
              </>
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
  const allDone = completed === total && total > 0
  const percent = total > 0 ? Math.round((completed / total) * 100) : 0

  return (
    <AccordionItem value={section.id} className="border-none">
      <AccordionTrigger className="px-4 py-2.5 hover:bg-muted/50 hover:no-underline [&>svg]:h-3.5 [&>svg]:w-3.5 [&>svg]:text-muted-foreground/50">
        <div className="flex flex-1 flex-col gap-1.5 pr-2">
          <div className="flex items-center justify-between">
            <span className="text-xs font-semibold text-foreground">
              {section.label}
            </span>
            <span
              className={cn(
                'text-xs tabular-nums',
                allDone
                  ? 'font-medium text-success'
                  : 'text-muted-foreground/60'
              )}
            >
              {allDone ? 'Terminé' : `${completed}/${total}`}
            </span>
          </div>
          {/* Section mini progress bar */}
          <div className="h-1 w-full overflow-hidden rounded-full bg-border/50">
            <div
              className={cn(
                'h-full rounded-full transition-[width] duration-500',
                allDone ? 'bg-success/50' : 'bg-primary/40'
              )}
              style={{ width: `${percent}%` }}
            />
          </div>
        </div>
      </AccordionTrigger>
      <AccordionContent className="px-2 pb-1 pt-0">
        <div className="flex flex-col gap-0.5">
          {section.activities.map((activity, idx) => (
            <ActivityItem
              key={activity.id}
              activity={activity}
              activityProgress={getActivityProgress(activity.id, progress)}
              isCurrent={activity.id === currentActivityId}
              index={idx}
              isLast={idx === section.activities.length - 1}
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
    <div className="flex flex-col gap-0.5 px-2 py-2">
      {activities.map((activity, idx) => (
        <ActivityItem
          key={activity.id}
          activity={activity}
          activityProgress={getActivityProgress(activity.id, progress)}
          isCurrent={activity.id === currentActivityId}
          index={idx}
          isLast={idx === activities.length - 1}
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
  const [isOpen, setIsOpen] = useState(false)
  const hasObjectives = data.objectives && data.objectives.length > 0
  const hasDifficulty = data.difficulty !== undefined
  const allDone = progressPercent === 100

  return (
    <Collapsible open={isOpen} onOpenChange={setIsOpen}>
      <div className="flex flex-col gap-2.5 px-4 pb-3 pt-4">
        {/* Title + progress always visible */}
        <div className="flex items-start justify-between gap-2">
          <div className="flex-1 min-w-0">
            <h2 className="text-balance text-sm font-semibold leading-snug text-foreground">
              {data.title}
            </h2>
            <div className="mt-1.5 flex items-center gap-3 text-xs text-muted-foreground/70">
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
            </div>
          </div>
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

        {/* Progress bar + percentage always visible */}
        <div className="flex items-center gap-2.5">
          <Progress
            value={progressPercent}
            className={cn('h-1.5 flex-1', allDone && '[&>[data-slot=progress-indicator]]:bg-success')}
          />
          <span
            className={cn(
              'text-xs font-medium tabular-nums',
              allDone ? 'text-success' : 'text-muted-foreground/60'
            )}
          >
            {progressPercent}%
          </span>
        </div>

        {/* Continue button always visible */}
        {!allDone && (
          <Button
            size="sm"
            className="w-full gap-2 text-xs"
            onClick={onContinue}
          >
            Continuer
            <ArrowRight className="h-3.5 w-3.5" aria-hidden="true" />
          </Button>
        )}

        {/* Collapsible details */}
        <CollapsibleContent className="overflow-hidden transition-colors data-[state=closed]:animate-accordion-up data-[state=open]:animate-accordion-down">
          <div className="flex flex-col gap-3 pt-1 pb-1">
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
                    <Check className="mt-0.5 h-3 w-3 shrink-0 text-primary/60" aria-hidden="true" />
                    <span className="leading-relaxed">{obj}</span>
                  </li>
                ))}
              </ul>
            )}
          </div>
        </CollapsibleContent>
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
  mobileOpen,
  onMobileOpenChange,
}: CourseTimelineProps) {
  const [internalOpen, setInternalOpen] = useState(false)
  const scrollContainerRef = useRef<HTMLDivElement>(null)

  // Support both controlled (from activity header) and uncontrolled modes
  const sheetOpen = mobileOpen ?? internalOpen
  const setSheetOpen = onMobileOpenChange ?? setInternalOpen

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

  // Controlled accordion: track which sections are open
  const [openSections, setOpenSections] = useState<string[]>(() => {
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
  })

  // When current activity changes, ensure its section is open
  const [prevActivityId, setPrevActivityId] = useState(currentActivityId)
  if (prevActivityId !== currentActivityId) {
    setPrevActivityId(currentActivityId)
    if (currentActivityId) {
      for (const section of sections) {
        if (section.activities.some((a) => a.id === currentActivityId)) {
          if (!openSections.includes(section.id)) {
            setOpenSections((prev) => [...prev, section.id])
          }
          break
        }
      }
    }
  }

  // Auto-scroll to current activity
  useEffect(() => {
    if (!currentActivityId || !scrollContainerRef.current) return

    const timer = setTimeout(() => {
      const container = scrollContainerRef.current
      if (!container) return
      const activeEl = container.querySelector(
        `[data-activity-id="${currentActivityId}"]`
      )
      if (activeEl) {
        activeEl.scrollIntoView({ block: 'center', behavior: 'smooth' })
      }
    }, 300)

    return () => clearTimeout(timer)
  }, [currentActivityId])

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

      <div className="mx-4 h-px bg-border/40" />

      <div ref={scrollContainerRef} className="flex-1 min-h-0 overflow-y-auto">
        {hasSections ? (
          <Accordion
            type="multiple"
            value={openSections}
            onValueChange={setOpenSections}
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
      {/* Mobile: Sheet sidebar (controlled externally or internally) */}
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
