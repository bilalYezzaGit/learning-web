import { ThemeProvider } from 'next-themes'

export default function LandingLayout({
  children,
}: {
  children: React.ReactNode
}) {
  return (
    <ThemeProvider attribute="class" forcedTheme="dark" enableSystem={false}>
      {children}
    </ThemeProvider>
  )
}
