'use client'

/**
 * YouTube Embed Extension
 *
 * Client component for embedding YouTube videos.
 *
 * @example
 * ```html
 * <youtube id="dQw4w9WgXcQ" title="Introduction aux derivees"/>
 * ```
 */

import { PlayCircle } from 'lucide-react'

interface YouTubeProps {
  videoId: string
  title?: string
}

export function YouTube({ videoId, title }: YouTubeProps) {
  if (!videoId) {
    return (
      <div className="my-4 rounded-lg bg-red-50 p-6 text-red-700 dark:bg-red-900/20 dark:text-red-400">
        Erreur: ID YouTube manquant
      </div>
    )
  }

  return (
    <div className="my-4 overflow-hidden rounded-xl shadow-md">
      {/* YouTube iframe */}
      <div className="relative aspect-video w-full">
        <iframe
          src={`https://www.youtube-nocookie.com/embed/${videoId}`}
          title={title || 'YouTube video'}
          allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture"
          allowFullScreen
          className="absolute inset-0 h-full w-full border-0"
        />
      </div>

      {/* Title bar */}
      {title && (
        <div className="flex items-center gap-2 bg-stone-100 px-4 py-3 dark:bg-stone-800">
          <PlayCircle className="h-5 w-5 text-red-500" />
          <span className="text-sm font-medium text-stone-900 dark:text-stone-100">
            {title}
          </span>
        </div>
      )}
    </div>
  )
}
