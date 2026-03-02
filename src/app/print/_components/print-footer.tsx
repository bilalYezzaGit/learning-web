/**
 * PrintFooter — last page of the booklet with professional branding.
 *
 * Contains a recap table, the main QR code, and branding.
 */

interface PrintFooterProps {
  title: string
  activityCount: number
  exerciseCount: number
  qcmCount: number
  lessonCount: number
  qrCodeSvg: string
  onlineUrl: string
}

export function PrintFooter({
  title,
  activityCount,
  exerciseCount,
  qcmCount,
  lessonCount,
  qrCodeSvg,
  onlineUrl,
}: PrintFooterProps) {
  return (
    <div className="flex min-h-[70vh] flex-col items-center justify-center px-10 text-center">
      {/* Decorative top */}
      <div className="mb-10 flex items-center gap-4">
        <div className="h-px w-20 bg-stone-300" />
        <svg width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="2" strokeLinecap="round" strokeLinejoin="round" className="text-stone-300" aria-hidden="true">
          <path d="M22 11.08V12a10 10 0 1 1-5.93-9.14" />
          <polyline points="22 4 12 14.01 9 11.01" />
        </svg>
        <div className="h-px w-20 bg-stone-300" />
      </div>

      <h2 className="mb-1 font-serif text-2xl font-bold text-stone-800">
        Fin du livret
      </h2>
      <p className="mb-8 text-sm text-stone-400">
        {title}
      </p>

      {/* Stats table */}
      <div className="mb-10 overflow-hidden rounded-lg border border-stone-200">
        <table className="text-sm">
          <tbody>
            <StatRow label="Total" value={`${activityCount} activites`} />
            {lessonCount > 0 && (
              <StatRow label="Cours" value={`${lessonCount} lecon${lessonCount > 1 ? 's' : ''}`} />
            )}
            {exerciseCount > 0 && (
              <StatRow label="Exercices" value={`${exerciseCount} exercice${exerciseCount > 1 ? 's' : ''}`} />
            )}
            {qcmCount > 0 && (
              <StatRow label="QCM" value={`${qcmCount} question${qcmCount > 1 ? 's' : ''}`} />
            )}
          </tbody>
        </table>
      </div>

      {/* QR section */}
      <div className="flex flex-col items-center gap-3 rounded-xl border border-stone-200 bg-stone-50 px-8 py-6" data-print-color>
        <p className="mb-1 text-xs font-semibold uppercase tracking-wider text-stone-500">
          Version interactive
        </p>
        <div
          className="print-qr-badge rounded-xl bg-white p-3 shadow-sm"
          dangerouslySetInnerHTML={{ __html: qrCodeSvg }}
        />
        <p className="max-w-xs text-xs leading-snug text-stone-500">
          Scannez ce code pour acceder a la version interactive, uploader vos solutions et obtenir les corrections.
        </p>
        <p className="text-[9px] text-stone-300">{onlineUrl}</p>
      </div>

      {/* Branding footer */}
      <div className="mt-16 flex flex-col items-center gap-2">
        <div className="flex items-center gap-2">
          <div className="flex h-7 w-7 items-center justify-center rounded-md bg-stone-100" data-print-color>
            <svg width="14" height="14" viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="2" strokeLinecap="round" strokeLinejoin="round" className="text-stone-500" aria-hidden="true">
              <path d="M2 3h6a4 4 0 0 1 4 4v14a3 3 0 0 0-3-3H2z" />
              <path d="M22 3h-6a4 4 0 0 0-4 4v14a3 3 0 0 1 3-3h7z" />
            </svg>
          </div>
          <span className="text-xs font-semibold text-stone-400">Learning OS</span>
        </div>
        <p className="text-[10px] text-stone-300">
          aylansolutions.com
        </p>
      </div>
    </div>
  )
}

function StatRow({ label, value }: { label: string; value: string }) {
  return (
    <tr className="border-b border-stone-100 last:border-b-0">
      <td className="bg-stone-50 px-5 py-2 text-right text-xs font-medium text-stone-400" data-print-color>
        {label}
      </td>
      <td className="px-5 py-2 text-left font-medium text-stone-700">
        {value}
      </td>
    </tr>
  )
}
