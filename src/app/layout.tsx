import type { Metadata, Viewport } from 'next'
import { Plus_Jakarta_Sans, Source_Serif_4, JetBrains_Mono } from 'next/font/google'
import './globals.css'

import { QueryProvider } from '@/lib/query/provider'
import { AuthProvider } from '@/lib/context'
import { Toaster } from '@/components/ui/sonner'

const generalSans = Plus_Jakarta_Sans({
  variable: '--font-general-sans',
  subsets: ['latin'],
  weight: ['300', '400', '500', '600', '700', '800'],
})

const sourceSerif = Source_Serif_4({
  variable: '--font-source-serif',
  subsets: ['latin'],
})

const jetbrainsMono = JetBrains_Mono({
  variable: '--font-jetbrains-mono',
  subsets: ['latin'],
  weight: ['400', '500', '600', '700'],
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
  themeColor: '#0A0A0F',
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
      <body className={`${generalSans.variable} ${sourceSerif.variable} ${jetbrainsMono.variable} antialiased`}>
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
