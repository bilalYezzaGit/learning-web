import * as React from 'react'
import { cva, type VariantProps } from 'class-variance-authority'
import { type LucideIcon } from 'lucide-react'

import { cn } from '@/lib/utils'

const iconVariants = cva('shrink-0', {
  variants: {
    size: {
      xs: 'h-3 w-3',
      sm: 'h-4 w-4',
      md: 'h-5 w-5',
      lg: 'h-6 w-6',
      xl: 'h-8 w-8',
    },
  },
  defaultVariants: {
    size: 'md',
  },
})

export interface IconProps
  extends React.SVGAttributes<SVGSVGElement>,
    VariantProps<typeof iconVariants> {
  icon: LucideIcon
}

export function Icon({ icon: IconComponent, size, className, ...props }: IconProps) {
  return <IconComponent className={cn(iconVariants({ size }), className)} {...props} />
}
