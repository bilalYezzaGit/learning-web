/**
 * QR code generator utility — produces SVG strings for print booklets.
 *
 * Uses the `qrcode` package to generate compact SVG QR codes
 * that link to atom resources on the web app.
 */

import QRCode from 'qrcode'

const BASE_URL = 'https://www.aylansolutions.com'

/**
 * Generate a QR code SVG string for a given URL path.
 */
export async function generateQrSvg(urlPath: string, size = 64): Promise<string> {
  const fullUrl = `${BASE_URL}${urlPath}`
  const svg = await QRCode.toString(fullUrl, {
    type: 'svg',
    width: size,
    margin: 0,
    color: { dark: '#1c1917', light: '#ffffff' },
    errorCorrectionLevel: 'M',
  })
  return svg
}

/**
 * Build the canonical URL path for an atom within a molecule context.
 */
export function buildAtomUrl(
  parcours: string,
  context: { type: 'cours'; moduleId: string } | { type: 'serie'; serieSlug: string },
  atomId: string,
): string {
  if (context.type === 'cours') {
    return `/${parcours}/apprendre/${context.moduleId}/${atomId}`
  }
  return `/${parcours}/serie/${context.serieSlug}/${atomId}`
}

/**
 * Build the canonical URL path for a molecule.
 */
export function buildMoleculeUrl(
  parcours: string,
  context: { type: 'cours'; moduleId: string } | { type: 'serie'; serieSlug: string },
): string {
  if (context.type === 'cours') {
    return `/${parcours}/apprendre/${context.moduleId}`
  }
  return `/${parcours}/serie/${context.serieSlug}`
}
