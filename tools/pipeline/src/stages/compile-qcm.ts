/**
 * QCM compiler — extracts :::question, :::option, :::explanation
 * directive blocks and compiles each part to HTML separately.
 *
 * correctIndex is derived from :::option{correct} position in the content.
 */

import { compileMdxToHtml } from './compile-mdx.js'
import type { RawAtom, CompiledQcm } from '../types.js'

export async function compileQcm(atom: RawAtom): Promise<CompiledQcm> {
  const raw = atom.rawContent.trim()

  // Extract :::question ... :::
  const questionMatch = raw.match(/^:::question\s*\n([\s\S]*?)\n:::\s*$/m)
  const questionText = (questionMatch?.[1] ?? '').trim()

  // Extract all :::option or :::option{correct} blocks, tracking which is correct
  const optionTexts: string[] = []
  let correctIndex = -1
  const optionRegex = /^:::option(\{correct\})?\s*\n([\s\S]*?)\n:::\s*$/gm
  let match
  let optionIdx = 0
  while ((match = optionRegex.exec(raw)) !== null) {
    if (match[1] === '{correct}') {
      correctIndex = optionIdx
    }
    optionTexts.push((match[2] ?? '').trim())
    optionIdx++
  }

  if (correctIndex === -1) {
    throw new Error(`QCM "${atom.id}" has no :::option{correct} — exactly one option must be marked {correct}`)
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
    correctIndex,
    explication,
    timeMinutes: atom.timeMinutes,
  }
}
