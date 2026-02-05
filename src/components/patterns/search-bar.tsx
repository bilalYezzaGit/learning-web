'use client'

import * as React from 'react'
import { Search, X } from 'lucide-react'

import { cn } from '@/lib/utils'
import { Input } from '@/components/ui/input'

export interface SearchBarProps
  extends Omit<React.InputHTMLAttributes<HTMLInputElement>, 'onChange'> {
  value?: string
  onChange?: (value: string) => void
  onSearch?: (value: string) => void
  debounceMs?: number
}

export function SearchBar({
  value: controlledValue,
  onChange,
  onSearch,
  debounceMs = 300,
  placeholder = 'Rechercher...',
  className,
  ...props
}: SearchBarProps) {
  const [internalValue, setInternalValue] = React.useState('')
  const value = controlledValue ?? internalValue
  const timeoutRef = React.useRef<NodeJS.Timeout | null>(null)

  const handleChange = (e: React.ChangeEvent<HTMLInputElement>) => {
    const newValue = e.target.value

    if (controlledValue === undefined) {
      setInternalValue(newValue)
    }
    onChange?.(newValue)

    // Debounced search
    if (onSearch) {
      if (timeoutRef.current) {
        clearTimeout(timeoutRef.current)
      }
      timeoutRef.current = setTimeout(() => {
        onSearch(newValue)
      }, debounceMs)
    }
  }

  const handleClear = () => {
    if (controlledValue === undefined) {
      setInternalValue('')
    }
    onChange?.('')
    onSearch?.('')
  }

  React.useEffect(() => {
    return () => {
      if (timeoutRef.current) {
        clearTimeout(timeoutRef.current)
      }
    }
  }, [])

  return (
    <div className={cn('relative', className)}>
      <Search className="absolute left-3 top-1/2 h-4 w-4 -translate-y-1/2 text-muted-foreground" />
      <Input
        type="search"
        value={value}
        onChange={handleChange}
        placeholder={placeholder}
        className="pl-9 pr-9"
        {...props}
      />
      {value && (
        <button
          type="button"
          onClick={handleClear}
          className="absolute right-3 top-1/2 -translate-y-1/2 rounded-full p-0.5 text-muted-foreground hover:text-foreground"
        >
          <X className="h-4 w-4" />
          <span className="sr-only">Effacer</span>
        </button>
      )}
    </div>
  )
}
