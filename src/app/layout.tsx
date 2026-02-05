import type { Metadata, Viewport } from 'next'
import { Inter, Source_Serif_4 } from 'next/font/google'
import './globals.css'

import { QueryProvider } from '@/lib/query/provider'
import { AuthProvider } from '@/lib/context'

const inter = Inter({
  variable: '--font-inter',
  subsets: ['latin'],
})

const sourceSerif = Source_Serif_4({
  variable: '--font-source-serif',
  subsets: ['latin'],
})

export const metadata: Metadata = {
  title: 'Learning OS',
  description: "Application d'apprentissage des mathématiques",
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
  themeColor: '#9F6B53',
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
    <html lang="fr">
      <body className={`${inter.variable} ${sourceSerif.variable} antialiased`}>
        <QueryProvider>
          <AuthProvider>{children}</AuthProvider>
        </QueryProvider>
      </body>
    </html>
  )
}
