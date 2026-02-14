/**
 * Answer zone component for printable exercises
 *
 * Renders a dotted-line area where students can write their answers on paper.
 * Includes a QR code that links to the exercise in the app for correction.
 */

import { QRCodeSVG } from './qr-code'

interface AnswerZoneProps {
  /** Atom ID for the QR code */
  atomId: string
  /** Base URL for the app (used in QR code) */
  baseUrl: string
  /** Number of lines to show (default 6) */
  lines?: number
  /** Label for the zone */
  label?: string
}

export async function AnswerZone({
  atomId,
  baseUrl,
  lines = 6,
  label = 'Réponse',
}: AnswerZoneProps) {
  const scanUrl = `${baseUrl}/scan/${atomId}`

  return (
    <div className="print-answer-zone my-4 break-inside-avoid rounded border border-dashed border-stone-300 bg-white p-4">
      <div className="flex items-start justify-between gap-4">
        {/* Writing area */}
        <div className="flex-1">
          <div className="mb-2 text-xs font-semibold uppercase tracking-wider text-stone-400">
            {label}
          </div>
          <div className="space-y-0">
            {Array.from({ length: lines }, (_, i) => (
              <div
                key={i}
                className="h-8 border-b border-dotted border-stone-200"
              />
            ))}
          </div>
        </div>

        {/* QR code */}
        <div className="flex shrink-0 flex-col items-center gap-1">
          <QRCodeSVG value={scanUrl} size={64} errorCorrectionLevel="M" />
          <span className="text-[8px] text-stone-400">Scanner pour corriger</span>
        </div>
      </div>
    </div>
  )
}
