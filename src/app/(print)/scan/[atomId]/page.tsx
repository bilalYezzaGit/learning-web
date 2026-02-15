/**
 * Scan page — QR code landing
 *
 * When a student scans a QR code from a printed booklet, they land here.
 * Shows the exercise statement and provides camera/upload to submit
 * their handwritten work for AI correction.
 *
 * Flow:
 * 1. Student writes answer on paper
 * 2. Scans QR code next to the exercise
 * 3. Lands on this page with exercise context loaded
 * 4. Takes a photo of their work
 * 5. AI analyzes and gives feedback
 */

import type { Metadata } from 'next'
import { notFound } from 'next/navigation'

import { atomExists, getAtom } from '@/lib/content'
import { compileMdx } from '@/lib/mdx'
import { ScanPageClient } from './scan-page-client'

interface PageProps {
  params: Promise<{ atomId: string }>
}

export async function generateMetadata({ params }: PageProps): Promise<Metadata> {
  const { atomId } = await params
  try {
    const atom = getAtom(atomId)
    return {
      title: `Corriger — ${atom.title}`,
      description: `Scannez votre travail pour ${atom.title}`,
    }
  } catch {
    return { title: 'Corriger un exercice' }
  }
}

export default async function ScanPage({ params }: PageProps) {
  const { atomId } = await params

  if (!atomExists(atomId)) {
    notFound()
  }

  const atom = getAtom(atomId)

  // Only exercises and QCMs can be scanned for correction
  if (atom.type === 'lesson') {
    notFound()
  }

  // Compile the exercise statement for display
  const compiledContent = await compileMdx(atom.content)

  return (
    <ScanPageClient
      atomId={atom.id}
      title={atom.title}
      type={atom.type}
      exerciseContent={atom.content}
      compiledContent={compiledContent}
    />
  )
}
