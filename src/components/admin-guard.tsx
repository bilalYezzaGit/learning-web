'use client'

import { useRouter } from 'next/navigation'
import { useAuth } from '@/lib/context'

const ADMIN_EMAILS = ['bilalyezza@gmail.com']

export function AdminGuard({ children }: { children: React.ReactNode }) {
  const { user, isLoading, isAuthenticated } = useAuth()
  const router = useRouter()

  if (isLoading) {
    return (
      <div className="flex min-h-svh items-center justify-center">
        <p className="text-sm text-muted-foreground">Chargement...</p>
      </div>
    )
  }

  if (!isAuthenticated || !user?.email || !ADMIN_EMAILS.includes(user.email)) {
    router.replace('/login')
    return null
  }

  return <>{children}</>
}
