'use client'

import * as React from 'react'

import { cn } from '@/lib/utils'
import { Card } from '@/components/ui/card'

interface InteractiveCardProps extends React.ComponentProps<typeof Card> {
  onClick?: () => void
  disabled?: boolean
}

function InteractiveCard({
  onClick,
  disabled = false,
  className,
  ...props
}: InteractiveCardProps) {
  const handleKeyDown = (e: React.KeyboardEvent) => {
    if (disabled) return
    if (e.key === 'Enter' || e.key === ' ') {
      e.preventDefault()
      onClick?.()
    }
  }

  return (
    <Card
      role="button"
      tabIndex={disabled ? -1 : 0}
      aria-disabled={disabled || undefined}
      onClick={disabled ? undefined : onClick}
      onKeyDown={handleKeyDown}
      className={cn(
        'focus-visible:ring-ring focus-visible:outline-none focus-visible:ring-2',
        disabled
          ? 'cursor-not-allowed opacity-50'
          : 'cursor-pointer',
        className
      )}
      {...props}
    />
  )
}

export { InteractiveCard }
export type { InteractiveCardProps }
