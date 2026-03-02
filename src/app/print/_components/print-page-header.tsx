/**
 * PrintPageHeader — running header displayed at the top of the booklet content.
 *
 * Shows branding + molecule title as a reference bar.
 * In print, this appears once at the top of the content pages
 * (the @page margin handles repeated headers via CSS if needed).
 */

interface PrintPageHeaderProps {
  title: string
  kind: 'cours' | 'serie'
}

export function PrintPageHeader({ title, kind }: PrintPageHeaderProps) {
  return (
    <div className="mb-6 flex items-center justify-between border-b border-stone-200 pb-3">
      <div className="flex items-center gap-2.5">
        {/* Logo mark */}
        <div className="flex h-6 w-6 items-center justify-center rounded bg-stone-100" data-print-color>
          <svg width="12" height="12" viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="2" strokeLinecap="round" strokeLinejoin="round" className="text-stone-500" aria-hidden="true">
            <path d="M2 3h6a4 4 0 0 1 4 4v14a3 3 0 0 0-3-3H2z" />
            <path d="M22 3h-6a4 4 0 0 0-4 4v14a3 3 0 0 1 3-3h7z" />
          </svg>
        </div>
        <span className="text-xs font-medium text-stone-400">Learning OS</span>
      </div>
      <div className="flex items-center gap-2 text-xs text-stone-400">
        <span className="font-medium uppercase tracking-wider">
          {kind === 'cours' ? 'Cours' : 'Serie'}
        </span>
        <span className="text-stone-200">&mdash;</span>
        <span>{title}</span>
      </div>
    </div>
  )
}
