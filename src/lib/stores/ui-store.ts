/**
 * UI Store
 *
 * Client-side UI state: theme, sidebar, toasts.
 * Uses Zustand for lightweight state management.
 */

import { create } from 'zustand'

// =============================================================================
// Types
// =============================================================================

export type Theme = 'light' | 'dark' | 'system'

export interface Toast {
  id: string
  type: 'success' | 'error' | 'info' | 'warning'
  message: string
  duration?: number
}

interface UIState {
  // Theme
  theme: Theme
  setTheme: (theme: Theme) => void

  // Sidebar (desktop)
  sidebarOpen: boolean
  setSidebarOpen: (open: boolean) => void
  toggleSidebar: () => void

  // Toasts
  toasts: Toast[]
  addToast: (toast: Omit<Toast, 'id'>) => void
  removeToast: (id: string) => void
  clearToasts: () => void
}

// =============================================================================
// Store
// =============================================================================

export const useUIStore = create<UIState>((set) => ({
  // Theme
  theme: 'system',
  setTheme: (theme) => set({ theme }),

  // Sidebar
  sidebarOpen: true,
  setSidebarOpen: (open) => set({ sidebarOpen: open }),
  toggleSidebar: () => set((state) => ({ sidebarOpen: !state.sidebarOpen })),

  // Toasts
  toasts: [],
  addToast: (toast) =>
    set((state) => ({
      toasts: [
        ...state.toasts,
        { ...toast, id: `toast-${Date.now()}-${Math.random()}` },
      ],
    })),
  removeToast: (id) =>
    set((state) => ({
      toasts: state.toasts.filter((t) => t.id !== id),
    })),
  clearToasts: () => set({ toasts: [] }),
}))

// =============================================================================
// Convenience selectors
// =============================================================================

export const useTheme = () => useUIStore((state) => state.theme)
export const useSidebarOpen = () => useUIStore((state) => state.sidebarOpen)
export const useToasts = () => useUIStore((state) => state.toasts)
