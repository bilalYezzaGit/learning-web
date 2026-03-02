/**
 * QCM Session Page — placeholder for a timed QCM session.
 *
 * PR1: shows a "coming soon" placeholder.
 * PR2: will use QCMPlayer with random question selection and timer.
 */

import type { Metadata } from 'next'
import Link from 'next/link'
import { ArrowLeft, Zap } from 'lucide-react'

import { Card, CardContent } from '@/components/ui/card'
import { Button } from '@/components/ui/button'

interface PageProps {
  params: Promise<{ id: string }>
}

export async function generateMetadata({ params }: PageProps): Promise<Metadata> {
  const { id } = await params
  return { title: `QCM — ${id}` }
}

export default async function QcmSessionPage({ params }: PageProps) {
  const { id } = await params

  return (
    <div className="px-4 py-5">
      <Button variant="ghost" size="sm" asChild className="mb-4">
        <Link href="/app/qcm">
          <ArrowLeft className="mr-1.5 h-4 w-4" aria-hidden="true" />
          Retour
        </Link>
      </Button>

      <Card>
        <CardContent className="py-16 text-center">
          <Zap className="mx-auto mb-4 h-16 w-16 text-primary/30" aria-hidden="true" />
          <h1 className="text-xl font-semibold">Session QCM</h1>
          <p className="mt-2 text-sm text-muted-foreground">
            Module : <strong>{id}</strong>
          </p>
          <p className="mt-4 text-sm text-muted-foreground">
            Les sessions QCM chronometrees arrivent bientot.
            <br />
            En attendant, vous pouvez faire les QCM depuis la version web du cours.
          </p>
          <Button asChild className="mt-6">
            <Link href="/app/qcm">
              Retour aux QCM
            </Link>
          </Button>
        </CardContent>
      </Card>
    </div>
  )
}
