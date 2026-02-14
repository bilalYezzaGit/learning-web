/**
 * Print layout
 *
 * Minimal layout for printable/PDF views.
 * No sidebar, no header, no height constraints.
 * Content flows naturally for multi-page printing.
 */

export default function PrintLayout({
  children,
}: {
  children: React.ReactNode
}) {
  return (
    <div className="min-h-0 w-full">
      {children}
    </div>
  )
}
