'use client'

import { ErrorFallback } from '@/components/error-fallback'

export default function Error({
  error,
  reset,
}: {
  error: Error & { digest?: string }
  reset: () => void
}) {
  return (
    <ErrorFallback
      error={error}
      reset={reset}
      boundary="RootErrorBoundary"
      heading="Une erreur est survenue"
      message="Quelque chose s'est mal passe. Reessayez ou revenez a l'accueil."
      backHref="/"
      backLabel="Retour a l'accueil"
      fullScreen
    />
  )
}
