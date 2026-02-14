/**
 * QR Code server component
 *
 * Generates a QR code as inline SVG on the server.
 * Used in printable PDF views to link exercises back to the app.
 */

import QRCode from 'qrcode'

interface QRCodeSVGProps {
  /** The URL or text to encode */
  value: string
  /** Size in pixels (default 80) */
  size?: number
  /** Error correction level (default 'M') */
  errorCorrectionLevel?: 'L' | 'M' | 'Q' | 'H'
}

export async function QRCodeSVG({
  value,
  size = 80,
  errorCorrectionLevel = 'M',
}: QRCodeSVGProps) {
  const svgString = await QRCode.toString(value, {
    type: 'svg',
    width: size,
    errorCorrectionLevel,
    margin: 1,
    color: {
      dark: '#000000',
      light: '#ffffff',
    },
  })

  return (
    <div
      className="inline-block print-qr-code"
      dangerouslySetInnerHTML={{ __html: svgString }}
    />
  )
}
