/**
 * PrintCover — beautiful cover page for printed booklets.
 *
 * Shows the molecule title, description, metadata, and a QR code
 * linking to the online version of the molecule.
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
          className={`inline-block h-2.5 w-2.5 rounded-full ${
            i <= level ? 'bg-stone-700' : 'bg-stone-300'
          }`}
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
    <div className="print-cover flex min-h-[100vh] flex-col items-center justify-center px-8 text-center">
      {/* Decorative top border */}
      <div className="mb-12 h-1 w-32 rounded-full bg-stone-800" />

      {/* Programme label */}
      <p className="mb-4 text-sm font-medium uppercase tracking-[0.25em] text-stone-500">
        {programme}
      </p>

      {/* Kind badge */}
      <div className="mb-6 inline-flex items-center rounded-full border border-stone-300 px-4 py-1.5">
        <span className="text-xs font-semibold uppercase tracking-wider text-stone-600">
          {kind === 'cours' ? 'Cours' : 'Serie d\u2019exercices'}
        </span>
      </div>

      {/* Title */}
      <h1 className="mb-6 max-w-lg font-serif text-4xl font-bold leading-tight text-stone-900">
        {title}
      </h1>

      {/* Description */}
      <p className="mb-10 max-w-md text-base leading-relaxed text-stone-600">
        {description}
      </p>

      {/* Metadata row */}
      <div className="mb-12 flex flex-wrap items-center justify-center gap-6 text-sm text-stone-500">
        <span>{metadata.activityCount} activites</span>
        <span className="text-stone-300">\u2022</span>
        <span>~{metadata.estimatedMinutes} min</span>
        {metadata.difficulty !== undefined && (
          <>
            <span className="text-stone-300">\u2022</span>
            <DifficultyDots level={metadata.difficulty} />
          </>
        )}
        {metadata.trimester && (
          <>
            <span className="text-stone-300">\u2022</span>
            <span>{metadata.trimester}</span>
          </>
        )}
      </div>

      {/* QR code to online version */}
      <div className="flex flex-col items-center gap-3">
        <div
          className="rounded-lg border border-stone-200 bg-white p-2"
          dangerouslySetInnerHTML={{ __html: qrCodeSvg }}
        />
        <p className="max-w-xs text-[10px] leading-tight text-stone-400">
          Scannez pour acceder a la version interactive en ligne
        </p>
        <p className="text-[9px] text-stone-300">{onlineUrl}</p>
      </div>

      {/* Footer */}
      <div className="mt-auto pt-16 pb-8">
        <p className="text-xs text-stone-300">
          Learning OS &mdash; aylansolutions.com
        </p>
      </div>
    </div>
  )
}
