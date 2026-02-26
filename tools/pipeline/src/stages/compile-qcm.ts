/**
 * QCM compiler — extracts :::question, :::option, :::explanation
 * directive blocks and compiles each part to HTML separately.
 */

import { compileMdxToHtml } from './compile-mdx.js'
import type { RawAtom, CompiledQcm } from '../types.js'

export async function compileQcm(atom: RawAtom): Promise<CompiledQcm> {
  const raw = atom.rawContent.trim()

  // Extract :::question ... :::
  const questionMatch = raw.match(/^:::question\s*\n([\s\S]*?)\n:::\s*$/m)
  const questionText = (questionMatch?.[1] ?? '').trim()

  // Extract all :::option or :::option{correct} blocks
  const optionTexts: string[] = []
  const optionRegex = /^:::option(?:\{correct\})?\s*\n([\s\S]*?)\n:::\s*$/gm
  let match
  while ((match = optionRegex.exec(raw)) !== null) {
    optionTexts.push((match[1] ?? '').trim())
  }

  // Extract :::explanation ... :::
  const explMatch = raw.match(/^:::explanation\s*\n([\s\S]*?)\n:::\s*$/m)
  const explanationText = explMatch?.[1]?.trim() ?? ''

  // Compile all parts to HTML
  const [enonce, ...compiledOptions] = await Promise.all([
    compileMdxToHtml(questionText),
    ...optionTexts.map(text => compileMdxToHtml(text)),
  ])

  const explication = explanationText
    ? await compileMdxToHtml(explanationText)
    : ''

  return {
    id: atom.id,
    title: atom.title,
    enonce: enonce ?? '',
    options: compiledOptions,
    correctIndex: atom.correctOption ?? 0,
    explication,
    timeMinutes: atom.timeMinutes,
  }
}
