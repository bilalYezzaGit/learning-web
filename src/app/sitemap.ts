import type { MetadataRoute } from 'next'
import { getAllCours, getAllSeries } from '@/lib/content'
import { getActiveParcours } from '@/lib/parcours'

const BASE_URL = 'https://www.aylansolutions.com'

export default function sitemap(): MetadataRoute.Sitemap {
  const now = new Date()
  const activeParcoursList = getActiveParcours()

  // Static pages
  const staticPages: MetadataRoute.Sitemap = [
    {
      url: BASE_URL,
      lastModified: now,
      changeFrequency: 'weekly',
      priority: 1,
    },
    {
      url: `${BASE_URL}/login`,
      lastModified: now,
      changeFrequency: 'monthly',
      priority: 0.3,
    },
    {
      url: `${BASE_URL}/signup`,
      lastModified: now,
      changeFrequency: 'monthly',
      priority: 0.3,
    },
  ]

  // Parcours-level pages (apprendre + reviser for each active parcours)
  const parcoursPages: MetadataRoute.Sitemap = activeParcoursList.flatMap((p) => [
    {
      url: `${BASE_URL}/${p.slug}/apprendre`,
      lastModified: now,
      changeFrequency: 'weekly' as const,
      priority: 0.9,
    },
    {
      url: `${BASE_URL}/${p.slug}/reviser`,
      lastModified: now,
      changeFrequency: 'weekly' as const,
      priority: 0.8,
    },
  ])

  // Dynamic module pages
  const allCours = getAllCours()
  const modulePages: MetadataRoute.Sitemap = activeParcoursList.flatMap((p) =>
    allCours.map((cours) => ({
      url: `${BASE_URL}/${p.slug}/apprendre/${cours.slug}`,
      lastModified: now,
      changeFrequency: 'monthly' as const,
      priority: 0.7,
    }))
  )

  // Dynamic serie pages
  const allSeries = getAllSeries()
  const seriePages: MetadataRoute.Sitemap = activeParcoursList.flatMap((p) =>
    allSeries.map((serie) => ({
      url: `${BASE_URL}/${p.slug}/reviser/serie/${serie.slug}`,
      lastModified: now,
      changeFrequency: 'monthly' as const,
      priority: 0.6,
    }))
  )

  return [...staticPages, ...parcoursPages, ...modulePages, ...seriePages]
}
