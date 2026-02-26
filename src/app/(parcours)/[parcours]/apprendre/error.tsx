'use client'

import { useParams } from 'next/navigation'
import { ErrorFallback } from '@/components/error-fallback'

export default function ApprendreError({
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
      boundary="ApprendreErrorBoundary"
      heading="Erreur de chargement"
      message="Le contenu de ce module n'a pas pu etre charge. Reessayez ou revenez a la liste des modules."
      backHref={`/${parcours}/apprendre`}
      backLabel="Retour aux modules"
    />
  )
}
