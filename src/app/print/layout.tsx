import type { Metadata } from 'next'
import 'katex/dist/katex.min.css'
import '@/app/globals.css'
import '@/app/print/print.css'

import { Lora, DM_Sans } from 'next/font/google'

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
    default: 'Livret imprimable | Learning OS',
    template: '%s | Learning OS',
  },
  robots: { index: false, follow: false },
}

export default function PrintLayout({
  children,
}: Readonly<{ children: React.ReactNode }>) {
  return (
    <html lang="fr">
      <body className={`${dmSans.variable} ${lora.variable} antialiased print-booklet`}>
        {children}
      </body>
    </html>
  )
}
