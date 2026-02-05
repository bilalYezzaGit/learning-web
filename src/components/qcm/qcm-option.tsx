'use client'

import * as React from 'react'
import { Check, X } from 'lucide-react'

import { cn } from '@/lib/utils'

type OptionState = 'default' | 'selected' | 'correct' | 'incorrect'

const stateStyles: Record<OptionState, string> = {
  default: 'border-input bg-background hover:bg-accent hover:border-accent-foreground/20',
  selected: 'border-primary bg-primary/5',
  correct: 'border-success bg-success/10',
  incorrect: 'border-destructive bg-destructive/10',
}

export interface QCMOptionProps extends React.HTMLAttributes<HTMLButtonElement> {
  label: string
  index: number
  state?: OptionState
  disabled?: boolean
  showResult?: boolean
  onSelect?: () => void
}

const indexLabels = ['A', 'B', 'C', 'D', 'E', 'F', 'G', 'H']

export function QCMOption({
  label,
  index,
  state = 'default',
  disabled = false,
  showResult = false,
  onSelect,
  className,
  ...props
}: QCMOptionProps) {
  const indexLabel = indexLabels[index] ?? String(index + 1)

  return (
    <button
      type="button"
      disabled={disabled}
      onClick={onSelect}
      className={cn(
        'flex w-full items-center gap-3 rounded-lg border-2 p-4 text-left transition-all',
        stateStyles[state],
        disabled && 'cursor-not-allowed opacity-60',
        className
      )}
      {...props}
    >
      {/* Index badge */}
      <span
        className={cn(
          'flex h-8 w-8 shrink-0 items-center justify-center rounded-full text-sm font-semibold',
          state === 'selected' && 'bg-primary text-primary-foreground',
          state === 'correct' && 'bg-success text-success-foreground',
          state === 'incorrect' && 'bg-destructive text-destructive-foreground',
          state === 'default' && 'bg-muted text-muted-foreground'
        )}
      >
        {showResult && state === 'correct' ? (
          <Check className="h-4 w-4" />
        ) : showResult && state === 'incorrect' ? (
          <X className="h-4 w-4" />
        ) : (
          indexLabel
        )}
      </span>

      {/* Label */}
      <span className="flex-1 text-foreground">{label}</span>
    </button>
  )
}
