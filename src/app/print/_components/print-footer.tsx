/**
 * PrintFooter — last page of the booklet.
 *
 * Contains a recap, the main QR code, and branding.
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
    <div className="flex min-h-[60vh] flex-col items-center justify-center px-8 text-center">
      <div className="mb-8 h-px w-24 bg-stone-300" />

      <h2 className="mb-2 font-serif text-xl font-bold text-stone-800">
        Fin du livret
      </h2>
      <p className="mb-8 text-sm text-stone-500">
        {title}
      </p>

      {/* Stats */}
      <div className="mb-10 grid grid-cols-2 gap-x-8 gap-y-3 text-sm">
        <div className="text-right text-stone-400">Total</div>
        <div className="text-left font-medium text-stone-700">{activityCount} activites</div>
        {lessonCount > 0 && (
          <>
            <div className="text-right text-stone-400">Cours</div>
            <div className="text-left font-medium text-stone-700">{lessonCount} lecon{lessonCount > 1 ? 's' : ''}</div>
          </>
        )}
        {exerciseCount > 0 && (
          <>
            <div className="text-right text-stone-400">Exercices</div>
            <div className="text-left font-medium text-stone-700">{exerciseCount} exercice{exerciseCount > 1 ? 's' : ''}</div>
          </>
        )}
        {qcmCount > 0 && (
          <>
            <div className="text-right text-stone-400">QCM</div>
            <div className="text-left font-medium text-stone-700">{qcmCount} question{qcmCount > 1 ? 's' : ''}</div>
          </>
        )}
      </div>

      {/* Main QR code */}
      <div className="flex flex-col items-center gap-3">
        <div
          className="rounded-xl border border-stone-200 bg-white p-3"
          dangerouslySetInnerHTML={{ __html: qrCodeSvg }}
        />
        <p className="max-w-xs text-xs leading-tight text-stone-500">
          Scannez ce code pour acceder a la version interactive, uploader vos solutions, et obtenir les corrections.
        </p>
        <p className="text-[9px] text-stone-300">{onlineUrl}</p>
      </div>

      <div className="mt-16">
        <p className="text-[10px] text-stone-300">
          Genere par Learning OS &mdash; aylansolutions.com
        </p>
      </div>
    </div>
  )
}
