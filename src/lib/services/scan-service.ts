/**
 * Scan Service
 *
 * Analyzes scanned worksheets via AI (Claude Vision).
 * Calls Next.js API route /api/scan with compressed base64 image.
 *
 * Flow:
 * 1. User uploads/captures photo of their work
 * 2. Image is compressed (max 1024px, JPEG 80%)
 * 3. API route calls Claude Vision with image + exercise content
 * 4. Result is returned to the client
 */

// =============================================================================
// Types
// =============================================================================

export interface ScanResult {
  activityId: string
  isCorrect: boolean
  confidence: number
  feedback: string
  suggestions: string[]
  analyzedAt: Date
}

export class ScanError extends Error {
  constructor(message: string) {
    super(message)
    this.name = 'ScanError'
  }
}

// =============================================================================
// Image compression
// =============================================================================

/**
 * Compress image to max dimensions and quality
 * Uses Canvas API (browser-native)
 */
async function compressImage(
  file: File,
  maxWidth = 1024,
  quality = 0.8
): Promise<string> {
  return new Promise((resolve, reject) => {
    const img = new Image()
    const canvas = document.createElement('canvas')
    const ctx = canvas.getContext('2d')

    img.onload = () => {
      let width = img.width
      let height = img.height

      if (width > maxWidth) {
        height = (height * maxWidth) / width
        width = maxWidth
      }

      canvas.width = width
      canvas.height = height

      ctx?.drawImage(img, 0, 0, width, height)
      const dataUrl = canvas.toDataURL('image/jpeg', quality)

      const base64 = dataUrl.split(',')[1]
      if (!base64) {
        reject(new ScanError('Failed to compress image'))
        return
      }

      resolve(base64)
    }

    img.onerror = () => reject(new ScanError('Failed to load image'))

    const reader = new FileReader()
    reader.onload = (e) => {
      img.src = e.target?.result as string
    }
    reader.onerror = () => reject(new ScanError('Failed to read file'))
    reader.readAsDataURL(file)
  })
}

// =============================================================================
// Service functions
// =============================================================================

/**
 * Analyze a scanned worksheet image via Next.js API route
 */
export async function analyzeScan({
  imageFile,
  activityId,
  exerciseContent,
  idToken,
}: {
  imageFile: File
  activityId: string
  exerciseContent: string
  idToken: string
}): Promise<ScanResult> {
  const base64Image = await compressImage(imageFile)

  const response = await fetch('/api/scan', {
    method: 'POST',
    headers: {
      'Content-Type': 'application/json',
      'Authorization': `Bearer ${idToken}`,
    },
    body: JSON.stringify({
      imageBase64: base64Image,
      activityId,
      exerciseContent,
    }),
  })

  if (!response.ok) {
    const data = await response.json().catch(() => ({ error: 'Unknown error' })) as { error?: string }
    throw new ScanError(data.error ?? `HTTP ${response.status}`)
  }

  const data = await response.json() as {
    activityId: string
    isCorrect: boolean
    confidence: number
    feedback: string
    suggestions: string[]
  }

  return {
    ...data,
    analyzedAt: new Date(),
  }
}
