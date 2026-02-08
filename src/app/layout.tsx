import type { Metadata, Viewport } from 'next'
import localFont from 'next/font/local'
import './globals.css'

import { QueryProvider } from '@/lib/query/provider'
import { AuthProvider } from '@/lib/context'
import { Toaster } from '@/components/ui/sonner'

const plusJakarta = localFont({
  variable: '--font-plus-jakarta',
  src: [
    { path: '../../public/fonts/plus-jakarta-sans-latin-400.woff2', weight: '400', style: 'normal' },
    { path: '../../public/fonts/plus-jakarta-sans-latin-500.woff2', weight: '500', style: 'normal' },
    { path: '../../public/fonts/plus-jakarta-sans-latin-600.woff2', weight: '600', style: 'normal' },
    { path: '../../public/fonts/plus-jakarta-sans-latin-700.woff2', weight: '700', style: 'normal' },
  ],
  display: 'swap',
})

const crimsonPro = localFont({
  variable: '--font-crimson',
  src: [
    { path: '../../public/fonts/crimson-pro-latin-400.woff2', weight: '400', style: 'normal' },
    { path: '../../public/fonts/crimson-pro-latin-600.woff2', weight: '600', style: 'normal' },
    { path: '../../public/fonts/crimson-pro-latin-700.woff2', weight: '700', style: 'normal' },
  ],
  display: 'swap',
})

export const metadata: Metadata = {
  title: 'Learning OS — Maths lycee tunisien',
  description:
    'Cours, exercices et revisions de mathematiques pour le lycee tunisien. 100% gratuit.',
  manifest: '/manifest.json',
  appleWebApp: {
    capable: true,
    statusBarStyle: 'default',
    title: 'Learning OS',
  },
  icons: {
    icon: '/icons/Icon-192.png',
    apple: '/icons/Icon-192.png',
  },
}

export const viewport: Viewport = {
  themeColor: '#1E6FA0',
  width: 'device-width',
  initialScale: 1,
  // Allow zoom for accessibility (Lighthouse requirement)
}

export default function RootLayout({
  children,
}: Readonly<{
  children: React.ReactNode
}>) {
  return (
    <html lang="fr" suppressHydrationWarning>
      <body className={`${plusJakarta.variable} ${crimsonPro.variable} antialiased`}>
        <a
          href="#main-content"
          className="sr-only focus:not-sr-only focus:fixed focus:left-4 focus:top-4 focus:z-50 focus:rounded-md focus:bg-background focus:px-4 focus:py-2 focus:text-sm focus:font-medium focus:shadow-lg focus:ring-2 focus:ring-ring"
        >
          Aller au contenu principal
        </a>
        <QueryProvider>
          <AuthProvider>
            {children}
            <Toaster />
          </AuthProvider>
        </QueryProvider>
      </body>
    </html>
  )
}
