/**
 * Module Layout (Pass-through)
 *
 * Split view is in (timeline)/layout.tsx, only wrapping activity pages.
 * Module page renders without split view.
 */

interface LayoutProps {
  children: React.ReactNode
}

export default function ModuleLayout({ children }: LayoutProps) {
  return <>{children}</>
}
