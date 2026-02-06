/**
 * Scan Service
 *
 * Analyzes scanned worksheets via AI (Claude Vision).
 * Calls Cloud Function `analyzeScan` with compressed base64 image.
 *
 * Flow:
 * 1. User uploads/captures photo of their work
 * 2. Image is compressed (max 1024px, JPEG 80%)
 * 3. Cloud Function calls Claude Vision
 * 4. Result is saved to Firestore and returned
 *
 * Storage: Firestore `users/{uid}/scanHistory/`
 */

import { httpsCallable } from 'firebase/functions'
import { getFunctionsInstance } from '@/lib/firebase/client'

// =============================================================================
// Types
// =============================================================================

export interface ScanResult {
  scanId?: string
  activityId: string
  moduleId: string
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
      // Calculate new dimensions
      let width = img.width
      let height = img.height

      if (width > maxWidth) {
        height = (height * maxWidth) / width
        width = maxWidth
      }

      canvas.width = width
      canvas.height = height

      // Draw and compress
      ctx?.drawImage(img, 0, 0, width, height)
      const dataUrl = canvas.toDataURL('image/jpeg', quality)

      // Extract base64 (remove data:image/jpeg;base64, prefix)
      const base64 = dataUrl.split(',')[1]
      if (!base64) {
        reject(new ScanError('Failed to compress image'))
        return
      }

      resolve(base64)
    }

    img.onerror = () => reject(new ScanError('Failed to load image'))

    // Read file as data URL
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
 * Analyze a scanned worksheet image
 */
export async function analyzeScan({
  imageFile,
  activityId,
  moduleId,
}: {
  imageFile: File
  activityId: string
  moduleId: string
}): Promise<ScanResult> {
  const functions = getFunctionsInstance()

  // Compress image
  const base64Image = await compressImage(imageFile)

  // Call Cloud Function
  const callable = httpsCallable<
    { imageBase64: string; activityId: string; moduleId: string },
    {
      scanId?: string
      activityId: string
      moduleId: string
      isCorrect: boolean
      confidence: number
      feedback: string
      suggestions: string[]
    }
  >(functions, 'analyzeScan')

  try {
    const result = await callable({
      imageBase64: base64Image,
      activityId,
      moduleId,
    })

    return {
      ...result.data,
      analyzedAt: new Date(),
    }
  } catch (e) {
    const message = e instanceof Error ? e.message : 'Unknown error'
    throw new ScanError(`Failed to analyze scan: ${message}`)
  }
}

