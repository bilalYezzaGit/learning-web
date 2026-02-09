import type { Metadata } from 'next'
import { AdminGuard } from '@/components/admin-guard'

export const metadata: Metadata = {
  title: 'Admin / Contenu',
  robots: { index: false, follow: false },
}

export default function AdminLayout({
  children,
}: {
  children: React.ReactNode
}) {
  return (
    <AdminGuard>
      <div className="min-h-svh bg-background">
        <header className="border-b px-6 py-3">
          <h1 className="text-lg font-semibold">Admin / Contenu</h1>
        </header>
        <main>{children}</main>
      </div>
    </AdminGuard>
  )
}
