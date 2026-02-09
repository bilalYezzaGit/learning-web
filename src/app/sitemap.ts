import type { MetadataRoute } from 'next'
import { getAllCours, getAllSeries } from '@/lib/content'

const BASE_URL = 'https://www.aylansolutions.com'

export default function sitemap(): MetadataRoute.Sitemap {
  const now = new Date()

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
    {
      url: `${BASE_URL}/1ere-tc/apprendre`,
      lastModified: now,
      changeFrequency: 'weekly',
      priority: 0.9,
    },
    {
      url: `${BASE_URL}/1ere-tc/reviser`,
      lastModified: now,
      changeFrequency: 'weekly',
      priority: 0.8,
    },
  ]

  // Dynamic module pages
  const allCours = getAllCours()
  const modulePages: MetadataRoute.Sitemap = allCours.map((cours) => ({
    url: `${BASE_URL}/1ere-tc/apprendre/${cours.slug}`,
    lastModified: now,
    changeFrequency: 'monthly' as const,
    priority: 0.7,
  }))

  // Dynamic serie pages
  const allSeries = getAllSeries()
  const seriePages: MetadataRoute.Sitemap = allSeries.map((serie) => ({
    url: `${BASE_URL}/1ere-tc/reviser/serie/${serie.slug}`,
    lastModified: now,
    changeFrequency: 'monthly' as const,
    priority: 0.6,
  }))

  return [...staticPages, ...modulePages, ...seriePages]
}
