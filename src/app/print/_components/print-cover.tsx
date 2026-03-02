/**
 * PrintCover — professional cover page for printed booklets.
 *
 * Features a logo placeholder, programme label, title block,
 * metadata chips, and a QR code to the online version.
 */

interface PrintCoverProps {
  title: string
  description: string
  kind: 'cours' | 'serie'
  programme: string
  metadata: {
    estimatedMinutes: number
    activityCount: number
    difficulty?: number
    trimester?: string
  }
  qrCodeSvg: string
  onlineUrl: string
}

function DifficultyDots({ level }: { level: number }) {
  return (
    <span className="inline-flex gap-1" aria-label={`Difficulte ${level} sur 3`}>
      {[1, 2, 3].map((i) => (
        <span
          key={i}
          className={`inline-block h-2 w-2 rounded-full ${
            i <= level ? 'bg-stone-800' : 'bg-stone-300'
          }`}
          data-print-color
        />
      ))}
    </span>
  )
}

export function PrintCover({
  title,
  description,
  kind,
  programme,
  metadata,
  qrCodeSvg,
  onlineUrl,
}: PrintCoverProps) {
  return (
    <div className="print-cover relative flex min-h-[100vh] flex-col overflow-hidden bg-white">
      {/* Top decorative band */}
      <div className="print-cover-bg h-2 w-full bg-stone-800" data-print-color />

      {/* Logo + programme header */}
      <div className="flex items-center justify-between px-10 pt-8 pb-6">
        <div className="flex items-center gap-3">
          {/* Logo placeholder */}
          <div className="flex h-10 w-10 items-center justify-center rounded-lg bg-stone-100" data-print-color>
            <svg width="22" height="22" viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="2" strokeLinecap="round" strokeLinejoin="round" className="text-stone-600" aria-hidden="true">
              <path d="M2 3h6a4 4 0 0 1 4 4v14a3 3 0 0 0-3-3H2z" />
              <path d="M22 3h-6a4 4 0 0 0-4 4v14a3 3 0 0 1 3-3h7z" />
            </svg>
          </div>
          <div>
            <p className="text-sm font-semibold text-stone-800">Learning OS</p>
            <p className="text-[10px] text-stone-400">aylansolutions.com</p>
          </div>
        </div>
        <div className="text-right">
          <p className="text-[10px] font-medium uppercase tracking-[0.2em] text-stone-400">
            {programme}
          </p>
        </div>
      </div>

      {/* Separator */}
      <div className="mx-10 h-px bg-stone-200" />

      {/* Main content area — centered vertically */}
      <div className="flex flex-1 flex-col items-center justify-center px-10 text-center">
        {/* Kind badge */}
        <div className="mb-5 inline-flex items-center gap-2 rounded-full border border-stone-200 bg-stone-50 px-5 py-2" data-print-color>
          <svg width="14" height="14" viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="2" strokeLinecap="round" strokeLinejoin="round" className="text-stone-500" aria-hidden="true">
            {kind === 'cours' ? (
              <path d="M4 19.5v-15A2.5 2.5 0 0 1 6.5 2H19a1 1 0 0 1 1 1v18a1 1 0 0 1-1 1H6.5a1 1 0 0 1 0-5H20" />
            ) : (
              <><path d="m16 6 4 14" /><path d="M12 6v14" /><path d="M8 8v12" /><path d="M4 4v16" /></>
            )}
          </svg>
          <span className="text-xs font-semibold uppercase tracking-wider text-stone-600">
            {kind === 'cours' ? 'Cours' : 'Serie d\u2019exercices'}
          </span>
        </div>

        {/* Title */}
        <h1 className="mb-4 max-w-lg font-serif text-4xl leading-tight font-bold text-stone-900">
          {title}
        </h1>

        {/* Decorative line */}
        <div className="mb-4 h-1 w-16 rounded-full bg-stone-800" data-print-color />

        {/* Description */}
        <p className="mb-8 max-w-md text-base leading-relaxed text-stone-500">
          {description}
        </p>

        {/* Metadata chips */}
        <div className="mb-10 flex flex-wrap items-center justify-center gap-3">
          <MetadataChip label={`${metadata.activityCount} activites`} />
          <MetadataChip label={`~${metadata.estimatedMinutes} min`} />
          {metadata.difficulty !== undefined && (
            <div className="flex items-center gap-2 rounded-full border border-stone-200 px-3 py-1.5" data-print-color>
              <span className="text-xs text-stone-500">Niveau</span>
              <DifficultyDots level={metadata.difficulty} />
            </div>
          )}
          {metadata.trimester && (
            <MetadataChip label={metadata.trimester} />
          )}
        </div>

        {/* QR code */}
        <div className="flex flex-col items-center gap-2">
          <div
            className="print-qr-badge rounded-xl border border-stone-200 bg-white p-2.5 shadow-sm"
            dangerouslySetInnerHTML={{ __html: qrCodeSvg }}
          />
          <p className="max-w-[240px] text-[10px] leading-snug text-stone-400">
            Scannez pour acceder a la version interactive en ligne
          </p>
        </div>
      </div>

      {/* Bottom info bar */}
      <div className="flex items-center justify-between border-t border-stone-200 px-10 py-4 text-[9px] text-stone-300">
        <span>Livret imprimable &mdash; ne contient pas les solutions</span>
        <span>{onlineUrl}</span>
      </div>

      {/* Bottom decorative band */}
      <div className="print-cover-bg h-1 w-full bg-stone-800" data-print-color />
    </div>
  )
}

function MetadataChip({ label }: { label: string }) {
  return (
    <span className="rounded-full border border-stone-200 px-3 py-1.5 text-xs text-stone-500" data-print-color>
      {label}
    </span>
  )
}
