/**
 * QR code generator for Typst PDFs.
 *
 * Generates QR codes as inline SVG that Typst can embed via `image.decode()`.
 * Three types of QR codes:
 * - Exercise QR: links to /app/ex?b=CODE&e=EXERCISE_ID
 * - QCM group QR: links to /app/ex?b=CODE&e=FIRST_QCM_ID&mode=quiz
 * - Booklet cover QR: links to /app/scan?code=CODE
 */

import QRCode from 'qrcode'

const BASE_URL = process.env.QR_BASE_URL || 'https://www.aylansolutions.com'

/**
 * Generate a QR code SVG string for a given full URL.
 */
async function generateQrSvgString(url: string): Promise<string> {
  return QRCode.toString(url, {
    type: 'svg',
    width: 150,
    margin: 0,
    color: { dark: '#000000', light: '#ffffff' },
    errorCorrectionLevel: 'H',
  })
}

/**
 * Convert SVG string to a Typst expression that renders the image.
 * Uses image.decode with bytes() — the SVG is passed as raw bytes
 * to avoid Typst parsing issues with # and < in the SVG source.
 */
function svgToTypstImage(svg: string, width: string): string {
  // Convert SVG to a hex-encoded byte array to avoid all escaping issues
  const hexBytes = Buffer.from(svg, 'utf-8')
    .toString('hex')
    .match(/.{1,2}/g)!
    .map(b => `0x${b}`)
    .join(', ')
  return `image.decode(bytes((${hexBytes})), width: ${width})`
}

/**
 * Compact a booklet code for shorter QR URLs.
 * Removes hyphens: "CONTINUITE-3E-001" → "CONTINUITE3E001"
 */
function compactCode(code: string): string {
  return code.replace(/-/g, '')
}

/**
 * Generate a Typst markup block that renders an exercise QR code.
 */
export async function generateExerciseQrTypst(
  bookletCode: string,
  exerciseAtomId: string,
): Promise<string> {
  const url = `${BASE_URL}/app/ex?b=${compactCode(bookletCode)}&e=${exerciseAtomId}`
  const svg = await generateQrSvgString(url)
  return svgToTypstImage(svg, '1.5cm')
}

/**
 * Generate a Typst markup block for a QCM group QR code.
 * The &mode=quiz param tells the app to open the QCM player.
 */
export async function generateQcmGroupQrTypst(
  bookletCode: string,
  firstQcmId: string,
): Promise<string> {
  const url = `${BASE_URL}/app/ex?b=${compactCode(bookletCode)}&e=${firstQcmId}&mode=quiz`
  const svg = await generateQrSvgString(url)
  return svgToTypstImage(svg, '1.5cm')
}

/**
 * Generate a Typst markup block for the booklet cover QR code.
 */
export async function generateBookletQrTypst(
  bookletCode: string,
): Promise<string> {
  const url = `${BASE_URL}/app/scan?code=${bookletCode}`
  const svg = await generateQrSvgString(url)
  return svgToTypstImage(svg, '3cm')
}
