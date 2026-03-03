/**
 * MDX → Typst converter
 *
 * Converts raw MDX content to Typst markup for PDF generation.
 * Student version: enonces + writing space, NO solutions/hints/methods.
 */

type AtomType = 'lesson' | 'exercise' | 'qcm'

// ── Directive stripping (student version) ──

/** Directives that are completely removed in the student version */
const STRIPPED_DIRECTIVES = ['solution', 'methode', 'hint']

/**
 * Remove :::directive ... ::: blocks for stripped directives.
 * Handles nested content (but not nested ::: of the same type).
 */
function stripDirectives(source: string): string {
  let result = source
  for (const dir of STRIPPED_DIRECTIVES) {
    // Match :::directive or :::directive[title] through closing :::
    const re = new RegExp(
      `^:::${dir}(?:\\[.*?\\])?\\s*\\n[\\s\\S]*?^:::$\\n?`,
      'gm',
    )
    result = result.replace(re, '')
  }
  return result
}

// ── Typst code blocks (pass-through) ──

/** Placeholder for Typst code blocks to protect them from further conversion */
const TYPST_PLACEHOLDER_PREFIX = '%%TYPST_BLOCK_'

interface TypstBlock {
  placeholder: string
  code: string
}

function extractTypstBlocks(source: string): { source: string; blocks: TypstBlock[] } {
  const blocks: TypstBlock[] = []
  let i = 0
  const result = source.replace(/```typst\n([\s\S]*?)```/g, (_match, code: string) => {
    const placeholder = `${TYPST_PLACEHOLDER_PREFIX}${i}%%`
    blocks.push({ placeholder, code: code.trim() })
    i++
    return placeholder
  })
  return { source: result, blocks }
}

function restoreTypstBlocks(source: string, blocks: TypstBlock[]): string {
  let result = source
  for (const block of blocks) {
    result = result.replace(block.placeholder, block.code)
  }
  return result
}

// ── Math conversion ──

const DISPLAY_MATH_PLACEHOLDER_PREFIX = '%%DISPLAY_MATH_'

/**
 * Escape LaTeX for embedding in a Typst string literal.
 * Typst strings use \ as escape char, so we need \\ for literal backslash.
 * Also escape double quotes.
 */
function escapeLatexForTypst(latex: string): string {
  return latex.replace(/\\/g, '\\\\').replace(/"/g, '\\"')
}

/**
 * Convert display math: $$...$$ → placeholder (restored after inline math conversion)
 * This prevents inline math conversion from re-matching display math output.
 */
function extractDisplayMath(source: string): { source: string; blocks: Map<string, string> } {
  const blocks = new Map<string, string>()
  let i = 0
  const result = source.replace(/\$\$([\s\S]*?)\$\$/g, (_match, latex: string) => {
    const cleaned = escapeLatexForTypst(latex.trim())
    const placeholder = `${DISPLAY_MATH_PLACEHOLDER_PREFIX}${i}%%`
    blocks.set(placeholder, `$ mitex("${cleaned}") $`)
    i++
    return placeholder
  })
  return { source: result, blocks }
}

function restoreDisplayMath(source: string, blocks: Map<string, string>): string {
  let result = source
  for (const [placeholder, typst] of blocks) {
    result = result.replace(placeholder, typst)
  }
  return result
}

/**
 * Convert inline math: $...$ → #mi("...")
 *
 * Must run AFTER display math extraction to avoid matching display math delimiters.
 */
function convertInlineMath(source: string): string {
  // Match single $ ... $ but not $$ ... $$ or placeholders
  return source.replace(/(?<!\$)\$(?!\$)((?:[^$\\]|\\.)+?)\$(?!\$)/g, (_match, latex: string) => {
    const cleaned = escapeLatexForTypst(latex)
    return `#mi("${cleaned}")`
  })
}

// ── Markdown → Typst conversion ──

/** Convert markdown headings to Typst headings */
function convertHeadings(source: string): string {
  return source
    .replace(/^#### (.+)$/gm, (_m, t: string) => `==== ${t}`)
    .replace(/^### (.+)$/gm, (_m, t: string) => `=== ${t}`)
    .replace(/^## (.+)$/gm, (_m, t: string) => `== ${t}`)
    .replace(/^# (.+)$/gm, (_m, t: string) => `= ${t}`)
}

/** Convert ordered lists: 1. item → + item (Typst numbered list) */
function convertOrderedLists(source: string): string {
  return source.replace(/^(\s*)\d+\.\s+/gm, '$1+ ')
}

/** Convert unordered lists: - item → - item (same in Typst) */
function convertUnorderedLists(source: string): string {
  // Markdown - item is already Typst syntax, no conversion needed
  return source
}

/** Convert horizontal rules */
function convertHorizontalRules(source: string): string {
  return source.replace(/^---$/gm, '#line(length: 100%)')
}

// ── Directive conversion ──

/**
 * Convert supported MDX directives to Typst custom functions.
 *
 * Patterns:
 * - :::directive[Title]\n content \n::: → #directive[Title][content]
 * - :::directive\n content \n::: → #directive[][content] (no title)
 * - :::enonce\n content \n::: → content directly (no wrapper)
 * - :::question\n content \n::: → content directly
 */

interface DirectiveMapping {
  mdxName: string
  typstFunc: string
}

const DIRECTIVE_MAPPINGS: DirectiveMapping[] = [
  { mdxName: 'definition', typstFunc: 'definition' },
  { mdxName: 'theorem', typstFunc: 'theorem' },
  { mdxName: 'property', typstFunc: 'property' },
  { mdxName: 'example', typstFunc: 'example-block' },
  { mdxName: 'remark', typstFunc: 'remark' },
  { mdxName: 'attention', typstFunc: 'remark' },
]

function convertDirectives(source: string): string {
  let result = source

  // Convert named directives with title: :::name[Title] ... :::
  for (const { mdxName, typstFunc } of DIRECTIVE_MAPPINGS) {
    const reWithTitle = new RegExp(
      `^:::${mdxName}\\[(.+?)\\]\\s*\\n([\\s\\S]*?)^:::$`,
      'gm',
    )
    result = result.replace(reWithTitle, (_match, title: string, body: string) => {
      return `#${typstFunc}[${title}][\n${body.trim()}\n]`
    })

    // Without title: :::name ... :::
    const reNoTitle = new RegExp(
      `^:::${mdxName}\\s*\\n([\\s\\S]*?)^:::$`,
      'gm',
    )
    result = result.replace(reNoTitle, (_match, body: string) => {
      return `#${typstFunc}[][\n${body.trim()}\n]`
    })
  }

  // :::enonce → unwrap (content only)
  result = result.replace(
    /^:::enonce\s*\n([\s\S]*?)^:::$/gm,
    (_match, body: string) => body.trim(),
  )

  // :::question → unwrap (content only, for QCM)
  result = result.replace(
    /^:::question\s*\n([\s\S]*?)^:::$/gm,
    (_match, body: string) => body.trim(),
  )

  return result
}

/** Remove QCM-specific directives (:::option, :::explanation) - these are handled separately */
function stripQcmDirectives(source: string): string {
  return source
    .replace(/^:::option(?:\{.*?\})?\s*\n[\s\S]*?^:::$/gm, '')
    .replace(/^:::explanation\s*\n[\s\S]*?^:::$/gm, '')
}

// ── Bold/Italic proper handling ──

/**
 * Convert markdown emphasis to Typst.
 * Must be done carefully to avoid conflicts:
 * - **bold** → *bold* (Typst bold)
 * - _italic_ or *italic* → _italic_ (Typst italic)
 *
 * Strategy: first protect ** pairs, then convert.
 */
function convertEmphasis(source: string): string {
  // Step 1: Convert **bold** to Typst *bold*
  // Use a placeholder to avoid conflicts
  let result = source.replace(/\*\*(.+?)\*\*/g, '%%BOLD_START%%$1%%BOLD_END%%')

  // Step 2: Convert remaining *italic* to _italic_
  result = result.replace(/\*(.+?)\*/g, '_$1_')

  // Step 3: Restore bold markers
  result = result.replace(/%%BOLD_START%%/g, '*').replace(/%%BOLD_END%%/g, '*')

  return result
}

// ── Main converter ──

export function convertMdxToTypst(rawContent: string, atomType: AtomType): string {
  // 1. Strip student-hidden directives
  let content = stripDirectives(rawContent)

  // 2. Extract Typst blocks before any conversion
  const { source: withoutTypst, blocks: typstBlocks } = extractTypstBlocks(content)
  content = withoutTypst

  // 3. Strip QCM directives (options/explanation handled separately)
  if (atomType === 'qcm') {
    content = stripQcmDirectives(content)
  }

  // 4. Extract display math, convert inline math, then restore display math
  const { source: withoutDisplayMath, blocks: displayMathBlocks } = extractDisplayMath(content)
  content = withoutDisplayMath
  content = convertInlineMath(content)
  content = restoreDisplayMath(content, displayMathBlocks)

  // 5. Convert markdown to Typst
  content = convertEmphasis(content)
  content = convertHeadings(content)
  content = convertOrderedLists(content)
  content = convertUnorderedLists(content)
  content = convertHorizontalRules(content)

  // 6. Convert directives
  content = convertDirectives(content)

  // 7. Restore Typst blocks
  content = restoreTypstBlocks(content, typstBlocks)

  // 8. Clean up excessive blank lines
  content = content.replace(/\n{3,}/g, '\n\n')

  return content.trim()
}

/**
 * Extract QCM options from raw MDX content.
 * Returns the question text and array of option texts (without correct markers).
 */
export function extractQcmOptions(rawContent: string): { question: string; options: string[] } {
  // Extract question
  const questionMatch = rawContent.match(/^:::question\s*\n([\s\S]*?)^:::$/m)
  const question = questionMatch ? questionMatch[1]!.trim() : ''

  // Extract options (both :::option and :::option{correct})
  const optionRe = /^:::option(?:\{.*?\})?\s*\n([\s\S]*?)^:::$/gm
  const options: string[] = []
  let match
  while ((match = optionRe.exec(rawContent)) !== null) {
    options.push(match[1]!.trim())
  }

  return { question, options }
}
