'use client'

import { useParams } from 'next/navigation'
import { ErrorFallback } from '@/components/error-fallback'

export default function ReviserError({
  error,
  reset,
}: {
  error: Error & { digest?: string }
  reset: () => void
}) {
  const { parcours } = useParams<{ parcours: string }>()

  return (
    <ErrorFallback
      error={error}
      reset={reset}
      boundary="ReviserErrorBoundary"
      heading="Erreur de chargement"
      message="La page de revision n'a pas pu etre chargee. Reessayez ou revenez au tableau de bord."
      backHref={`/${parcours}/reviser`}
      backLabel="Retour aux series"
    />
  )
}
