/**
 * Parcours Layout
 *
 * Server component layout for all parcours-specific pages.
 * Reads programme modules from filesystem for the sidebar.
 */

import { ParcoursShell, type ShellModule } from '@/components/parcours-shell'
import { getParcoursConfig } from '@/lib/parcours'
import { getAllProgrammes, getCours } from '@/lib/content-loader'

interface ParcoursLayoutProps {
  children: React.ReactNode
  params: Promise<{ parcours: string }>
}

export default async function ParcoursLayout({
  children,
  params,
}: ParcoursLayoutProps) {
  const { parcours } = await params
  const parcoursConfig = getParcoursConfig(parcours)

  const modules: ShellModule[] = (() => {
    if (!parcoursConfig) return []

    const programme = getAllProgrammes().find(
      (p) => p.levelSlug === parcoursConfig.level && p.sectionSlug === parcoursConfig.section
    )
    if (!programme) return []

    return programme.cours.map((slug) => {
      const cours = getCours(slug)
      return { id: slug, title: cours.title }
    })
  })()

  return (
    <ParcoursShell parcours={parcours} modules={modules}>
      {children}
    </ParcoursShell>
  )
}
