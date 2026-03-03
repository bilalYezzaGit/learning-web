/**
 * QR code generator for Typst PDFs.
 *
 * Generates QR codes as inline SVG that Typst can embed via `image.decode()`.
 * Two types of QR codes:
 * - Exercise QR: links to /app/ex?b=CODE&e=EXERCISE_ID
 * - Booklet cover QR: links to /app/scan?code=CODE
 */

import QRCode from 'qrcode'

const BASE_URL = 'https://www.aylansolutions.com'

/**
 * Generate a QR code SVG string for a given full URL.
 */
async function generateQrSvgString(url: string): Promise<string> {
  return QRCode.toString(url, {
    type: 'svg',
    width: 150,
    margin: 0,
    color: { dark: '#1c1917', light: '#ffffff' },
    errorCorrectionLevel: 'L',
  })
}

/**
 * Escape a string for use inside a Typst string literal.
 * Typst strings use double quotes and backslash escaping.
 * Newlines are removed since SVG whitespace is not significant.
 */
function escapeForTypst(s: string): string {
  return s
    .replace(/\n/g, '')
    .replace(/\\/g, '\\\\')
    .replace(/"/g, '\\"')
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
 *
 * URL format: https://www.aylansolutions.com/app/ex?b=CONTINUITE3E001&e=ex-continuite-1
 * Short params `b` and `e` keep the QR compact.
 */
export async function generateExerciseQrTypst(
  bookletCode: string,
  exerciseAtomId: string,
): Promise<string> {
  const url = `${BASE_URL}/app/ex?b=${compactCode(bookletCode)}&e=${exerciseAtomId}`
  const svg = await generateQrSvgString(url)
  const escaped = escapeForTypst(svg)
  return `image.decode(bytes("${escaped}"), width: 1.5cm)`
}

/**
 * Generate a Typst markup block for the booklet cover QR code.
 *
 * URL format: https://www.aylansolutions.com/app/scan?code=CONT-3E-001
 */
export async function generateBookletQrTypst(
  bookletCode: string,
): Promise<string> {
  const url = `${BASE_URL}/app/scan?code=${bookletCode}`
  const svg = await generateQrSvgString(url)
  const escaped = escapeForTypst(svg)
  return `image.decode(bytes("${escaped}"), width: 3cm)`
}
