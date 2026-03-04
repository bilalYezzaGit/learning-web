import type { Metadata, Viewport } from 'next'
import { Lora, DM_Sans } from 'next/font/google'
import 'katex/dist/katex.min.css'
import './globals.css'

import { Toaster } from '@/components/ui/sonner'
import { PwaInstallPrompt } from '@/components/pwa-install-prompt'

const dmSans = DM_Sans({
  variable: '--font-dm-sans',
  subsets: ['latin', 'latin-ext'],
})

const lora = Lora({
  variable: '--font-lora',
  subsets: ['latin', 'latin-ext'],
})

export const metadata: Metadata = {
  title: {
    default: 'Aylan — Augmente ton livret de maths',
    template: '%s | Aylan',
  },
  description: 'Scanne ton livret, obtiens une correction IA et suis ta progression. 3 modules disponibles.',
  manifest: '/manifest.json',
  metadataBase: new URL('https://www.aylansolutions.com'),
  openGraph: {
    type: 'website',
    locale: 'fr_FR',
    siteName: 'Aylan',
    title: 'Aylan — Augmente ton livret de maths',
    description: 'Scanne ton livret de maths, obtiens une correction IA personnalisée et suis ta progression.',
  },
  twitter: {
    card: 'summary_large_image',
    title: 'Aylan — Augmente ton livret de maths',
    description: 'Scanne ton livret, correction IA et suivi de progression. Gratuit.',
  },
  appleWebApp: {
    capable: true,
    statusBarStyle: 'default',
    title: 'Aylan',
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
      <body className={`${dmSans.variable} ${lora.variable} antialiased`}>
        <a
          href="#main-content"
          className="sr-only focus:not-sr-only focus:fixed focus:left-4 focus:top-4 focus:z-50 focus:rounded-md focus:bg-background focus:px-4 focus:py-2 focus:text-sm focus:font-medium focus:shadow-lg focus:ring-2 focus:ring-ring"
        >
          Aller au contenu principal
        </a>
        {children}
        <Toaster />
        <PwaInstallPrompt />
      </body>
    </html>
  )
}
