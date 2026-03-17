/**
 * AppMain — main content area.
 */

export function AppMain({ children }: { children: React.ReactNode }) {
  return (
    <main id="main-content" className="flex-1 overflow-auto">
      {children}
    </main>
  )
}
