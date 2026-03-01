import type { Metadata, Viewport } from 'next'
import { Lora, DM_Sans } from 'next/font/google'
import 'katex/dist/katex.min.css'
import './globals.css'

import { QueryProvider } from '@/lib/query/provider'
import { AuthProvider } from '@/lib/context'
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
    default: 'Learning OS — Maths du lycée tunisien',
    template: '%s | Learning OS',
  },
  description: 'Cours structurés, exercices corrigés et séries de révision pour les mathématiques du lycée tunisien. 15 modules, 90+ activités, 100% gratuit.',
  manifest: '/manifest.json',
  metadataBase: new URL('https://www.aylansolutions.com'),
  openGraph: {
    type: 'website',
    locale: 'fr_FR',
    siteName: 'Learning OS',
    title: 'Learning OS — Maths du lycée tunisien',
    description: 'Cours structurés, exercices corrigés et séries de révision. 15 modules pour la 1ère année Tronc Commun — accès libre.',
  },
  twitter: {
    card: 'summary_large_image',
    title: 'Learning OS — Maths du lycée tunisien',
    description: 'Cours structurés, exercices corrigés et séries de révision. 100% gratuit.',
  },
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
      <body className={`${dmSans.variable} ${lora.variable} antialiased`}>
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
            <PwaInstallPrompt />
          </AuthProvider>
        </QueryProvider>
      </body>
    </html>
  )
}
