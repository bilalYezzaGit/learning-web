'use client'

import * as React from 'react'
import { cva, type VariantProps } from 'class-variance-authority'
import { X } from 'lucide-react'

import { cn } from '@/lib/utils'

const chipVariants = cva(
  'inline-flex items-center gap-1.5 rounded-full px-3 py-1 text-sm font-medium transition-colors',
  {
    variants: {
      variant: {
        default: 'bg-secondary text-secondary-foreground hover:bg-secondary/80',
        primary: 'bg-primary text-primary-foreground hover:bg-primary/80',
        outline:
          'border border-input bg-background hover:bg-accent hover:text-accent-foreground',
        success: 'bg-success/10 text-success border border-success/20',
        warning: 'bg-warning/10 text-warning border border-warning/20',
        destructive:
          'bg-destructive/10 text-destructive border border-destructive/20',
      },
      size: {
        sm: 'px-2 py-0.5 text-xs',
        md: 'px-3 py-1 text-sm',
        lg: 'px-4 py-1.5 text-base',
      },
      selected: {
        true: 'ring-2 ring-ring ring-offset-2',
        false: '',
      },
    },
    defaultVariants: {
      variant: 'default',
      size: 'md',
      selected: false,
    },
  }
)

export interface ChipProps
  extends React.HTMLAttributes<HTMLDivElement>,
    VariantProps<typeof chipVariants> {
  onRemove?: () => void
  removable?: boolean
}

export function Chip({
  className,
  variant,
  size,
  selected,
  children,
  onRemove,
  removable = false,
  ...props
}: ChipProps) {
  return (
    <div className={cn(chipVariants({ variant, size, selected }), className)} {...props}>
      {children}
      {removable && (
        <button
          type="button"
          onClick={(e) => {
            e.stopPropagation()
            onRemove?.()
          }}
          className="ml-1 rounded-full p-0.5 hover:bg-foreground/10"
        >
          <X className="h-3 w-3" />
          <span className="sr-only">Remove</span>
        </button>
      )}
    </div>
  )
}
