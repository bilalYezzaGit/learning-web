/**
 * MDX compilation for print views
 *
 * Same as mdx.ts but uses print-optimized components:
 * - Solutions are hidden (students write on paper)
 * - Interactive components show static fallbacks
 * - Lesson parts use simplified print-friendly styling
 */

import { cache } from 'react'
import { compileMDX } from 'next-mdx-remote/rsc'
import remarkMath from 'remark-math'
import rehypeKatex from 'rehype-katex'
import 'katex/dist/katex.min.css'

import { printMdxComponents } from '@/components/print/print-mdx-components'

/**
 * Compile MDX source for print view.
 * Uses print-optimized component variants.
 */
export const compileMdxForPrint = cache(async (source: string) => {
  const { content } = await compileMDX({
    source,
    components: printMdxComponents,
    options: {
      mdxOptions: {
        remarkPlugins: [remarkMath],
        rehypePlugins: [rehypeKatex],
      },
    },
  })

  return content
})
