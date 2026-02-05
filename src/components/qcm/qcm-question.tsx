'use client'

import * as React from 'react'

import { cn } from '@/lib/utils'
import { QCMOption } from './qcm-option'

type OptionState = 'default' | 'selected' | 'correct' | 'incorrect'

export interface QCMQuestionOption {
  id: string
  label: string
}

export interface QCMQuestionProps extends React.HTMLAttributes<HTMLDivElement> {
  questionNumber?: number
  questionText: string
  options: QCMQuestionOption[]
  selectedOptionId?: string
  correctOptionId?: string
  showResult?: boolean
  disabled?: boolean
  onSelectOption?: (optionId: string) => void
}

export function QCMQuestion({
  questionNumber,
  questionText,
  options,
  selectedOptionId,
  correctOptionId,
  showResult = false,
  disabled = false,
  onSelectOption,
  className,
  ...props
}: QCMQuestionProps) {
  const getOptionState = (optionId: string): OptionState => {
    if (!showResult) {
      return optionId === selectedOptionId ? 'selected' : 'default'
    }

    if (optionId === correctOptionId) {
      return 'correct'
    }

    if (optionId === selectedOptionId && optionId !== correctOptionId) {
      return 'incorrect'
    }

    return 'default'
  }

  return (
    <div className={cn('space-y-4', className)} {...props}>
      {/* Question */}
      <div className="space-y-2">
        {questionNumber !== undefined && (
          <span className="text-sm font-medium text-muted-foreground">
            Question {questionNumber}
          </span>
        )}
        <p className="text-lg font-medium text-foreground">{questionText}</p>
      </div>

      {/* Options */}
      <div className="space-y-2">
        {options.map((option, index) => (
          <QCMOption
            key={option.id}
            label={option.label}
            index={index}
            state={getOptionState(option.id)}
            showResult={showResult}
            disabled={disabled || showResult}
            onSelect={() => onSelectOption?.(option.id)}
          />
        ))}
      </div>
    </div>
  )
}
