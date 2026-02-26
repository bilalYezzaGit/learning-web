/**
 * MDX → HTML compiler
 *
 * Uses remark-directive to parse :::directive blocks natively,
 * then transforms them into styled HTML via a custom remark plugin.
 * No regex pre-processing needed.
 */

import { unified } from 'unified'
import remarkParse from 'remark-parse'
import remarkMath from 'remark-math'
import remarkDirective from 'remark-directive'
import remarkRehype from 'remark-rehype'
import rehypeKatex from 'rehype-katex'
import rehypeStringify from 'rehype-stringify'
import type { Root, RootContent } from 'mdast'
import { visit } from 'unist-util-visit'
import type { ContainerDirective, LeafDirective } from 'mdast-util-directive'
import { compileTypstToSvg } from './compile-typst.js'

// ── Lesson part HTML configs ──

interface LessonPartConfig {
  defaultTitle: string
  accentClass: string
  bgClass: string
  iconClass: string
  badgeClass: string
  svgIcon: string
}

const LESSON_PARTS: Record<string, LessonPartConfig> = {
  definition: {
    defaultTitle: 'Définition',
    accentClass: 'border-l-indigo-500 dark:border-l-indigo-400',
    bgClass: 'bg-gradient-to-r from-indigo-50/80 to-indigo-50/20 dark:from-indigo-950/30 dark:to-indigo-950/5',
    iconClass: 'text-indigo-600 dark:text-indigo-400',
    badgeClass: 'bg-indigo-100 text-indigo-600 dark:bg-indigo-900/50 dark:text-indigo-400',
    svgIcon: '<svg xmlns="http://www.w3.org/2000/svg" width="14" height="14" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" aria-hidden="true"><path d="M4 19.5v-15A2.5 2.5 0 0 1 6.5 2H19a1 1 0 0 1 1 1v18a1 1 0 0 1-1 1H6.5a1 1 0 0 1 0-5H20"/></svg>',
  },
  theorem: {
    defaultTitle: 'Théorème',
    accentClass: 'border-l-violet-500 dark:border-l-violet-400',
    bgClass: 'bg-gradient-to-r from-violet-50/80 to-violet-50/20 dark:from-violet-950/30 dark:to-violet-950/5',
    iconClass: 'text-violet-600 dark:text-violet-400',
    badgeClass: 'bg-violet-100 text-violet-600 dark:bg-violet-900/50 dark:text-violet-400',
    svgIcon: '<svg xmlns="http://www.w3.org/2000/svg" width="14" height="14" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" aria-hidden="true"><path d="M20 13c0 5-3.5 7.5-7.66 8.95a1 1 0 0 1-.67-.01C7.5 20.5 4 18 4 13V6a1 1 0 0 1 1-1c2 0 4.5-1.2 6.24-2.72a1.17 1.17 0 0 1 1.52 0C14.51 3.81 17 5 19 5a1 1 0 0 1 1 1z"/><path d="m9 12 2 2 4-4"/></svg>',
  },
  property: {
    defaultTitle: 'Propriété',
    accentClass: 'border-l-sky-500 dark:border-l-sky-400',
    bgClass: 'bg-gradient-to-r from-sky-50/80 to-sky-50/20 dark:from-sky-950/30 dark:to-sky-950/5',
    iconClass: 'text-sky-600 dark:text-sky-400',
    badgeClass: 'bg-sky-100 text-sky-600 dark:bg-sky-900/50 dark:text-sky-400',
    svgIcon: '<svg xmlns="http://www.w3.org/2000/svg" width="14" height="14" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" aria-hidden="true"><path d="M15.39 4.39a1 1 0 0 0-1.68-.474l-6.83 6.83"/><path d="m15 9-6 6"/><rect width="7" height="7" x="3" y="14" rx="1"/></svg>',
  },
  example: {
    defaultTitle: 'Exemple',
    accentClass: 'border-l-emerald-500 dark:border-l-emerald-400',
    bgClass: 'bg-gradient-to-r from-emerald-50/80 to-emerald-50/20 dark:from-emerald-950/30 dark:to-emerald-950/5',
    iconClass: 'text-emerald-600 dark:text-emerald-400',
    badgeClass: 'bg-emerald-100 text-emerald-600 dark:bg-emerald-900/50 dark:text-emerald-400',
    svgIcon: '<svg xmlns="http://www.w3.org/2000/svg" width="14" height="14" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" aria-hidden="true"><path d="M12 20h9"/><path d="M16.376 3.622a1 1 0 0 1 3.002 3.002L7.368 18.635a2 2 0 0 1-.855.506l-2.872.838a.5.5 0 0 1-.62-.62l.838-2.872a2 2 0 0 1 .506-.854z"/></svg>',
  },
  remark: {
    defaultTitle: 'Remarque',
    accentClass: 'border-l-amber-500 dark:border-l-amber-400',
    bgClass: 'bg-gradient-to-r from-amber-50/80 to-amber-50/20 dark:from-amber-950/30 dark:to-amber-950/5',
    iconClass: 'text-amber-600 dark:text-amber-400',
    badgeClass: 'bg-amber-100 text-amber-600 dark:bg-amber-900/50 dark:text-amber-400',
    svgIcon: '<svg xmlns="http://www.w3.org/2000/svg" width="14" height="14" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" aria-hidden="true"><circle cx="12" cy="12" r="10"/><path d="M12 16v-4"/><path d="M12 8h.01"/></svg>',
  },
  attention: {
    defaultTitle: 'Attention',
    accentClass: 'border-l-rose-500 dark:border-l-rose-400',
    bgClass: 'bg-gradient-to-r from-rose-50/80 to-rose-50/20 dark:from-rose-950/30 dark:to-rose-950/5',
    iconClass: 'text-rose-600 dark:text-rose-400',
    badgeClass: 'bg-rose-100 text-rose-600 dark:bg-rose-900/50 dark:text-rose-400',
    svgIcon: '<svg xmlns="http://www.w3.org/2000/svg" width="14" height="14" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" aria-hidden="true"><path d="m21.73 18-8-14a2 2 0 0 0-3.48 0l-8 14A2 2 0 0 0 4 21h16a2 2 0 0 0 1.73-3"/><path d="M12 9v4"/><path d="M12 17h.01"/></svg>',
  },
}

// ── Exercise collapsible configs ──

interface CollapsibleConfig {
  label: string
  accentClass: string
  bgClass: string
  iconClass: string
  borderClass: string
  svgIcon: string
}

const EXERCISE_COLLAPSIBLES: Record<string, CollapsibleConfig> = {
  solution: {
    label: 'Voir la solution',
    accentClass: 'border-l-emerald-500 dark:border-l-emerald-400',
    bgClass: 'bg-gradient-to-r from-emerald-50/60 to-emerald-50/10 dark:from-emerald-950/20 dark:to-emerald-950/5',
    iconClass: 'text-emerald-600 dark:text-emerald-400',
    borderClass: 'border-emerald-200/50 dark:border-emerald-800/30',
    svgIcon: '<svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" aria-hidden="true"><path d="M21.801 10A10 10 0 1 1 17 3.335"/><path d="m9 11 3 3L22 4"/></svg>',
  },
  methode: {
    label: 'Méthode',
    accentClass: 'border-l-sky-500 dark:border-l-sky-400',
    bgClass: 'bg-gradient-to-r from-sky-50/60 to-sky-50/10 dark:from-sky-950/20 dark:to-sky-950/5',
    iconClass: 'text-sky-600 dark:text-sky-400',
    borderClass: 'border-sky-200/50 dark:border-sky-800/30',
    svgIcon: '<svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" aria-hidden="true"><path d="M12 7v14"/><path d="M3 18a1 1 0 0 1-1-1V4a1 1 0 0 1 1-1h5a4 4 0 0 1 4 4 4 4 0 0 1 4-4h5a1 1 0 0 1 1 1v13a1 1 0 0 1-1 1h-6a3 3 0 0 0-3 3 3 3 0 0 0-3-3z"/></svg>',
  },
  hint: {
    label: 'Indice',
    accentClass: 'border-l-amber-500 dark:border-l-amber-400',
    bgClass: 'bg-gradient-to-r from-amber-50/60 to-amber-50/10 dark:from-amber-950/20 dark:to-amber-950/5',
    iconClass: 'text-amber-600 dark:text-amber-400',
    borderClass: 'border-amber-200/50 dark:border-amber-800/30',
    svgIcon: '<svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" aria-hidden="true"><path d="M15 14c.2-1 .7-1.7 1.5-2.5 1-.9 1.5-2.2 1.5-3.5A6 6 0 0 0 6 8c0 1 .2 2.2 1.5 3.5.7.7 1.3 1.5 1.5 2.5"/><path d="M9 18h6"/><path d="M10 22h4"/></svg>',
  },
  erreurs: {
    label: 'Erreurs courantes',
    accentClass: 'border-l-rose-500 dark:border-l-rose-400',
    bgClass: 'bg-gradient-to-r from-rose-50/60 to-rose-50/10 dark:from-rose-950/20 dark:to-rose-950/5',
    iconClass: 'text-rose-600 dark:text-rose-400',
    borderClass: 'border-rose-200/50 dark:border-rose-800/30',
    svgIcon: '<svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" aria-hidden="true"><path d="m21.73 18-8-14a2 2 0 0 0-3.48 0l-8 14A2 2 0 0 0 4 21h16a2 2 0 0 0 1.73-3"/><path d="M12 9v4"/><path d="M12 17h.01"/></svg>',
  },
}

const CHEVRON_SVG = '<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="shrink-0 text-muted-foreground transition-transform duration-200 group-open/details:rotate-90" aria-hidden="true"><path d="m9 18 6-6-6-6"/></svg>'

// ── Helpers ──

function escapeHtml(str: string): string {
  return str.replace(/&/g, '&amp;').replace(/</g, '&lt;').replace(/>/g, '&gt;').replace(/"/g, '&quot;')
}

function escapeAttr(str: string): string {
  return str.replace(/'/g, '&#39;')
}

function extractDirectiveLabel(node: ContainerDirective): string | undefined {
  const labelNode = node.children[0]
  if (labelNode && 'data' in labelNode && (labelNode.data as Record<string, unknown>)?.directiveLabel) {
    // Extract text from the label paragraph
    const texts: string[] = []
    visit(labelNode, 'text', (textNode: { value: string }) => {
      texts.push(textNode.value)
    })
    return texts.join('') || undefined
  }
  return undefined
}

function getDirectiveContent(node: ContainerDirective): RootContent[] {
  // Skip the label paragraph if present
  const firstChild = node.children[0]
  if (firstChild && 'data' in firstChild && (firstChild.data as Record<string, unknown>)?.directiveLabel) {
    return node.children.slice(1) as RootContent[]
  }
  return node.children as RootContent[]
}

function makeLessonPartOpenHtml(config: LessonPartConfig, title: string): string {
  return `<aside class="not-prose my-8 rounded-r-xl rounded-l-sm border-l-[3.5px] shadow-sm ${config.accentClass} ${config.bgClass}"><div class="px-5 pt-4 pb-1"><div class="flex items-center gap-2.5"><div class="flex h-7 w-7 shrink-0 items-center justify-center rounded-full ${config.badgeClass}">${config.svgIcon}</div><span class="text-sm font-bold uppercase tracking-wider ${config.iconClass}">${escapeHtml(title)}</span></div></div><div class="prose prose-stone dark:prose-invert max-w-none px-5 pt-2 pb-5">`
}

function makeCollapsibleOpenHtml(config: CollapsibleConfig): string {
  return `<details class="not-prose group/details mt-8 rounded-r-xl rounded-l-sm border-l-[3px] shadow-sm ${config.accentClass} ${config.bgClass}"><summary class="flex cursor-pointer select-none items-center gap-2.5 px-4 py-3 font-medium">${CHEVRON_SVG}<span class="h-5 w-5 shrink-0 ${config.iconClass}">${config.svgIcon}</span><span class="text-sm font-semibold">${escapeHtml(config.label)}</span></summary><div class="prose prose-stone dark:prose-invert max-w-none border-t px-5 py-4 ${config.borderClass}">`
}

// ── Remark plugin: transform directives into HTML ──

function remarkDirectiveHandlers() {
  return (tree: Root) => {
    visit(tree, 'containerDirective', (node: ContainerDirective, index, parent): number | undefined => {
      if (index === undefined || !parent) return undefined

      const name = node.name

      // Lesson parts: :::definition[Title]
      if (name in LESSON_PARTS) {
        const config = LESSON_PARTS[name]!
        const title = extractDirectiveLabel(node) ?? config.defaultTitle
        const content = getDirectiveContent(node)
        const openHtml: RootContent = { type: 'html', value: makeLessonPartOpenHtml(config, title) }
        const closeHtml: RootContent = { type: 'html', value: '</div></aside>' }
        parent.children.splice(index, 1, openHtml, ...content, closeHtml)
        return index + content.length + 2
      }

      // Exercise enonce: :::enonce
      if (name === 'enonce') {
        const content = getDirectiveContent(node)
        const openHtml: RootContent = { type: 'html', value: '<section class="mt-2">' }
        const closeHtml: RootContent = { type: 'html', value: '</section>' }
        parent.children.splice(index, 1, openHtml, ...content, closeHtml)
        return index + content.length + 2
      }

      // Exercise collapsibles: :::solution, :::methode, :::hint, :::erreurs
      if (name in EXERCISE_COLLAPSIBLES) {
        const config = EXERCISE_COLLAPSIBLES[name]!
        const content = getDirectiveContent(node)
        const openHtml: RootContent = { type: 'html', value: makeCollapsibleOpenHtml(config) }
        const closeHtml: RootContent = { type: 'html', value: '</div></details>' }
        parent.children.splice(index, 1, openHtml, ...content, closeHtml)
        return index + content.length + 2
      }

      // QCM parts: :::question, :::option, :::explanation — strip wrappers
      // (content is extracted separately by compile-qcm.ts)
      if (name === 'question' || name === 'option' || name === 'explanation') {
        const content = getDirectiveContent(node)
        parent.children.splice(index, 1, ...content)
        return index + content.length
      }

      return undefined
    })

    // Leaf directives: ::youtube{id="X" title="Y"}
    visit(tree, 'leafDirective', (node: LeafDirective, index, parent): number | undefined => {
      if (index === undefined || !parent) return undefined

      if (node.name === 'youtube') {
        const attrs = (node.attributes ?? {}) as Record<string, string>
        const videoId = attrs.id ?? ''
        const title = attrs.title
        const props = JSON.stringify({ videoId, title })
        const html: RootContent = {
          type: 'html',
          value: `<div data-widget="youtube" data-props='${escapeAttr(props)}'></div>`,
        }
        parent.children.splice(index, 1, html)
        return index + 1
      }

      return undefined
    })
  }
}

// ── Typst code blocks → inline SVG ──

const TYPST_BLOCK_RE = /```typst\n([\s\S]*?)```/g

async function compileTypstBlocks(source: string): Promise<{ source: string; svgs: Map<string, string> }> {
  const matches = [...source.matchAll(TYPST_BLOCK_RE)]
  if (matches.length === 0) return { source, svgs: new Map() }

  const svgs = new Map<string, string>()
  let result = source
  let i = 0
  for (const match of matches) {
    const code = match[1]!.trim()
    const svg = await compileTypstToSvg(code)
    const placeholder = `<!--TYPST_SVG_${i}-->`
    const wrapped = `<div class="not-prose my-6 flex justify-center">${svg}</div>`
    svgs.set(placeholder, wrapped)
    result = result.replace(match[0], placeholder)
    i++
  }
  return { source: result, svgs }
}

function restoreTypstSvgs(html: string, svgs: Map<string, string>): string {
  let result = html
  for (const [placeholder, svg] of svgs) {
    result = result.replace(placeholder, svg)
  }
  return result
}

// ── Public API ──

const processor = unified()
  .use(remarkParse)
  .use(remarkMath)
  .use(remarkDirective)
  .use(remarkDirectiveHandlers)
  .use(remarkRehype, { allowDangerousHtml: true })
  .use(rehypeKatex)
  .use(rehypeStringify, { allowDangerousHtml: true })

export async function compileMdxToHtml(source: string): Promise<string> {
  const { source: withPlaceholders, svgs } = await compileTypstBlocks(source)
  const result = await processor.process(withPlaceholders)
  return restoreTypstSvgs(String(result), svgs)
}
