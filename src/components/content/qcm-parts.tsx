/**
 * QCM part components for MDX
 *
 * Data-carrier components used inside QCM atoms.
 * They render nothing — their content is extracted by compileQcmContent()
 * in src/lib/content.ts via regex on the raw MDX source.
 *
 * Registered in mdx-components.tsx so that MDX compilation doesn't fail
 * when encountering these tags.
 *
 * - <Question>  — QCM question text
 * - <Option>    — Answer option (one must have `correct` attribute)
 * - <Explanation> — Pedagogical explanation of the correct answer
 */

interface QuestionProps {
  children: React.ReactNode
}

// eslint-disable-next-line @typescript-eslint/no-unused-vars
export function Question(_props: QuestionProps) {
  return null
}

interface OptionProps {
  children: React.ReactNode
  correct?: boolean
}

// eslint-disable-next-line @typescript-eslint/no-unused-vars
export function Option(_props: OptionProps) {
  return null
}

interface ExplanationProps {
  children: React.ReactNode
}

// eslint-disable-next-line @typescript-eslint/no-unused-vars
export function Explanation(_props: ExplanationProps) {
  return null
}
