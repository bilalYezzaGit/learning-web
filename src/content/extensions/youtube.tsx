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
      <div className="my-6 rounded-xl bg-red-50 p-6 text-red-700">
        Erreur: ID YouTube manquant
      </div>
    )
  }

  return (
    <div className="not-prose my-6 overflow-hidden rounded-xl border border-stone-200/80 shadow-sm">
      {/* Title bar (above video) */}
      {title && (
        <div className="flex items-center gap-2.5 bg-stone-50 px-4 py-3">
          <PlayCircle className="h-5 w-5 shrink-0 text-red-500" aria-hidden="true" />
          <span className="text-sm font-medium text-stone-800">
            {title}
          </span>
        </div>
      )}

      {/* YouTube iframe */}
      <div className="relative aspect-video w-full bg-black">
        <iframe
          src={`https://www.youtube-nocookie.com/embed/${videoId}`}
          title={title || 'YouTube video'}
          allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture"
          allowFullScreen
          className="absolute inset-0 h-full w-full border-0"
        />
      </div>
    </div>
  )
}
