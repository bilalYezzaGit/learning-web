/**
 * QCM compiler — extracts Question, Options, Explanation from MDX
 * and compiles each part to HTML separately.
 */

import { compileMdxToHtml } from './compile-mdx.js'
import type { RawAtom, CompiledQcm } from '../types.js'

export async function compileQcm(atom: RawAtom): Promise<CompiledQcm> {
  const raw = atom.rawContent.trim()

  // Extract <Question>...</Question>
  const questionMatch = raw.match(/<Question>([\s\S]*?)<\/Question>/)
  const questionText = (questionMatch?.[1] ?? '').trim()

  // Extract all <Option>...</Option> and <Option correct>...</Option>
  const optionTexts: string[] = []
  const optionRegex = /<Option(?:\s+correct)?>([\s\S]*?)<\/Option>/g
  let match
  while ((match = optionRegex.exec(raw)) !== null) {
    optionTexts.push((match[1] ?? '').trim())
  }

  // Extract <Explanation>...</Explanation>
  const explMatch = raw.match(/<Explanation>([\s\S]*?)<\/Explanation>/)
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
