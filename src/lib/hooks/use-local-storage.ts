'use client'

/**
 * Hook for typed localStorage access
 */

import * as React from 'react'

/**
 * Read and write to localStorage with type safety
 *
 * @example
 * ```tsx
 * const [value, setValue] = useLocalStorage('key', 'default')
 * setValue('new value')
 * ```
 */
export function useLocalStorage<T>(
  key: string,
  initialValue: T
): [T, (value: T | ((prev: T) => T)) => void] {
  // Get initial value from localStorage or use provided initial
  const readValue = React.useCallback((): T => {
    if (typeof window === 'undefined') {
      return initialValue
    }

    try {
      const item = window.localStorage.getItem(key)
      return item ? (JSON.parse(item) as T) : initialValue
    } catch (error) {
      console.warn(`Error reading localStorage key "${key}":`, error)
      return initialValue
    }
  }, [key, initialValue])

  const [storedValue, setStoredValue] = React.useState<T>(readValue)

  // Update localStorage when value changes
  const setValue = React.useCallback(
    (value: T | ((prev: T) => T)) => {
      try {
        // Allow value to be a function for useState-like API
        const valueToStore =
          value instanceof Function ? value(storedValue) : value

        // Save to state
        setStoredValue(valueToStore)

        // Save to localStorage
        if (typeof window !== 'undefined') {
          window.localStorage.setItem(key, JSON.stringify(valueToStore))
        }
      } catch (error) {
        console.warn(`Error setting localStorage key "${key}":`, error)
      }
    },
    [key, storedValue]
  )

  // Listen for changes from other tabs/windows
  React.useEffect(() => {
    const handleStorageChange = (event: StorageEvent) => {
      if (event.key === key && event.newValue !== null) {
        try {
          setStoredValue(JSON.parse(event.newValue) as T)
        } catch {
          // Ignore parse errors
        }
      }
    }

    window.addEventListener('storage', handleStorageChange)
    return () => window.removeEventListener('storage', handleStorageChange)
  }, [key])

  return [storedValue, setValue]
}
