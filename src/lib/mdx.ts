/**
 * MDX compilation helper
 *
 * Compiles raw MDX source into a React element for Server Components.
 * Handles LaTeX math and custom components (exercise parts, graphs, etc.).
 *
 * @example
 * ```tsx
 * import { compileMdx } from '@/lib/mdx'
 * import { getAtom } from '@/lib/content'
 *
 * export default async function AtomPage({ params }) {
 *   const atom = getAtom(params.id)
 *   const content = await compileMdx(atom.content)
 *
 *   return (
 *     <article className="prose prose-stone dark:prose-invert max-w-none">
 *       {content}
 *     </article>
 *   )
 * }
 * ```
 */

import { cache } from 'react'
import { compileMDX } from 'next-mdx-remote/rsc'
import remarkMath from 'remark-math'
import rehypeKatex from 'rehype-katex'
import 'katex/dist/katex.min.css'

import { mdxComponents } from '@/components/content/mdx-components'

/**
 * Compile MDX source into a React element.
 *
 * Wrapped with React.cache() for per-request deduplication —
 * if the same source is compiled multiple times in one request, it's only done once.
 *
 * - LaTeX: `$...$` (inline) and `$$...$$` (block) via remark-math + rehype-katex
 * - Components: Enonce, Solution, Methode, Hint, Erreurs, Variations, Graph, YouTube
 */
export const compileMdx = cache(async (source: string) => {
  const { content } = await compileMDX({
    source,
    components: mdxComponents,
    options: {
      mdxOptions: {
        remarkPlugins: [remarkMath],
        rehypePlugins: [rehypeKatex],
      },
    },
  })

  return content
})
