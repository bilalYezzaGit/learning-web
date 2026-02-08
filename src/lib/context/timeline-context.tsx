'use client'

import { createContext, useContext } from 'react'

interface TimelineContextValue {
  openTimeline: () => void
}

const TimelineContext = createContext<TimelineContextValue | null>(null)

export function TimelineProvider({
  children,
  onOpen,
}: {
  children: React.ReactNode
  onOpen: () => void
}) {
  return (
    <TimelineContext.Provider value={{ openTimeline: onOpen }}>
      {children}
    </TimelineContext.Provider>
  )
}

export function useTimeline() {
  return useContext(TimelineContext)
}
