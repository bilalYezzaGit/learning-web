#!/usr/bin/env node
/**
 * Migration script: YAML activities → MDX atoms
 *
 * One-time script. Converts content/activities/*.yaml → content/atoms/*.mdx
 *
 * Usage: node scripts/migrate-to-mdx.mjs
 */

import { readFileSync, writeFileSync, readdirSync } from 'fs'
import { join, dirname } from 'path'
import { fileURLToPath } from 'url'
import { parse as parseYaml, stringify as stringifyYaml } from 'yaml'

const __dirname = dirname(fileURLToPath(import.meta.url))
const ROOT = join(__dirname, '..')
const ACTIVITIES_DIR = join(ROOT, 'content/activities')
const ATOMS_DIR = join(ROOT, 'content/atoms')

// =============================================================================
// HTML → MDX conversion
// =============================================================================

function htmlToMdx(html) {
  if (!html) return ''

  let text = html.trim()

  // Custom components (capitalize tag names)
  text = text.replace(/<variations\b/g, '<Variations')
  text = text.replace(/<\/variations>/g, '</Variations>')
  text = text.replace(/<row\b/g, '  <Row')
  text = text.replace(/<\/row>/g, '</Row>')
  text = text.replace(/<graph\b/g, '<Graph')
  text = text.replace(/<\/graph>/g, '</Graph>')
  text = text.replace(/<youtube\b/g, '<YouTube')
  text = text.replace(/<\/youtube>/g, '</YouTube>')
  text = text.replace(/<geogebra\b/g, '<Geogebra')
  text = text.replace(/<\/geogebra>/g, '</Geogebra>')
  text = text.replace(/<manim\b/g, '<Manim')
  text = text.replace(/<\/manim>/g, '</Manim>')
  text = text.replace(/<simulation\b/g, '<Simulation')
  text = text.replace(/<\/simulation>/g, '</Simulation>')

  // Block math (before inline to avoid conflicts)
  text = text.replace(/<math-block>([\s\S]*?)<\/math-block>/g, (_, c) => {
    return `\n\n$$${c.trim()}$$\n\n`
  })

  // Inline math
  text = text.replace(/<math>(.*?)<\/math>/g, (_, c) => `$${c}$`)

  // Inline formatting
  text = text.replace(/<strong>([\s\S]*?)<\/strong>/g, (_, c) => `**${c}**`)
  text = text.replace(/<b>([\s\S]*?)<\/b>/g, (_, c) => `**${c}**`)
  text = text.replace(/<em>([\s\S]*?)<\/em>/g, (_, c) => `*${c}*`)
  text = text.replace(/<code>([\s\S]*?)<\/code>/g, (_, c) => `\`${c}\``)

  // Headings
  text = text.replace(/<h2>([\s\S]*?)<\/h2>/g, (_, c) => `\n## ${c.trim()}\n`)
  text = text.replace(/<h3>([\s\S]*?)<\/h3>/g, (_, c) => `\n### ${c.trim()}\n`)
  text = text.replace(/<h4>([\s\S]*?)<\/h4>/g, (_, c) => `\n#### ${c.trim()}\n`)

  // Ordered lists
  text = text.replace(/<ol>([\s\S]*?)<\/ol>/g, (_, content) => {
    let index = 0
    const items = []
    content.replace(/<li>([\s\S]*?)<\/li>/g, (_, item) => {
      index++
      items.push(`${index}. ${item.trim()}`)
    })
    return '\n' + items.join('\n') + '\n'
  })

  // Unordered lists
  text = text.replace(/<ul>([\s\S]*?)<\/ul>/g, (_, content) => {
    const items = []
    content.replace(/<li>([\s\S]*?)<\/li>/g, (_, item) => {
      items.push(`- ${item.trim()}`)
    })
    return '\n' + items.join('\n') + '\n'
  })

  // Paragraphs
  text = text.replace(/<p>([\s\S]*?)<\/p>/g, (_, c) => `\n${c.trim()}\n`)

  // Line breaks
  text = text.replace(/<br\s*\/?>/g, '\n')

  // Clean up extra whitespace
  text = text.replace(/\n{3,}/g, '\n\n')
  text = text.trim()

  return text
}

/** Convert inline HTML in QCM options (math, strong, p tags) */
function convertOptionText(option) {
  if (!option) return ''
  let text = String(option).trim()
  text = text.replace(/<math>(.*?)<\/math>/g, (_, c) => `$${c}$`)
  text = text.replace(/<strong>(.*?)<\/strong>/g, (_, c) => `**${c}**`)
  text = text.replace(/<b>(.*?)<\/b>/g, (_, c) => `**${c}**`)
  text = text.replace(/<em>(.*?)<\/em>/g, (_, c) => `*${c}*`)
  text = text.replace(/<p>([\s\S]*?)<\/p>/g, (_, c) => c.trim())
  return text
}

// =============================================================================
// Frontmatter builder
// =============================================================================

function buildFrontmatter(fields) {
  // Filter out undefined/null/empty arrays
  const clean = {}
  for (const [key, value] of Object.entries(fields)) {
    if (value === undefined || value === null) continue
    if (Array.isArray(value) && value.length === 0) continue
    clean[key] = value
  }

  const yamlStr = stringifyYaml(clean, { flowLevel: 2 }).trim()
  return `---\n${yamlStr}\n---`
}

// =============================================================================
// Converters per type
// =============================================================================

function convertLesson(activity) {
  const frontmatter = buildFrontmatter({
    type: 'lesson',
    title: activity.title,
    difficulty: activity.difficulty ?? 0,
    timeMinutes: activity.timeMinutes ?? 5,
    tags: activity.modules || [],
  })

  const body = htmlToMdx(activity.body || '')

  return `${frontmatter}\n\n${body}\n`
}

function convertExercise(activity) {
  const frontmatter = buildFrontmatter({
    type: 'exercise',
    title: activity.title,
    difficulty: activity.difficulty ?? 1,
    timeMinutes: activity.timeMinutes ?? 5,
    category: activity.category,
    tags: activity.modules || [],
  })

  const parts = []

  // Contexte (intro paragraph before enonce)
  if (activity.contexte) {
    parts.push(htmlToMdx(activity.contexte))
  }

  // Multi-question exercise
  if (activity.questions && activity.questions.length > 0) {
    const questions = activity.questions
    for (let i = 0; i < questions.length; i++) {
      const q = questions[i]
      parts.push(`<Enonce>\n**Question ${i + 1}.** ${htmlToMdx(q.enonce)}\n</Enonce>`)
      if (q.solution) {
        parts.push(`<Solution>\n${htmlToMdx(q.solution)}\n</Solution>`)
      }
      if (q.hint) {
        parts.push(`<Hint>\n${htmlToMdx(q.hint)}\n</Hint>`)
      }
    }
  } else {
    // Single enonce/solution exercise
    if (activity.enonce) {
      parts.push(`<Enonce>\n${htmlToMdx(activity.enonce)}\n</Enonce>`)
    }
    if (activity.solution) {
      parts.push(`<Solution>\n${htmlToMdx(activity.solution)}\n</Solution>`)
    }
  }

  if (activity.methode) {
    parts.push(`<Methode>\n${htmlToMdx(activity.methode)}\n</Methode>`)
  }

  if (activity.hint) {
    parts.push(`<Hint>\n${htmlToMdx(activity.hint)}\n</Hint>`)
  }

  if (activity.erreurs) {
    parts.push(`<Erreurs>\n${htmlToMdx(activity.erreurs)}\n</Erreurs>`)
  }

  return `${frontmatter}\n\n${parts.join('\n\n')}\n`
}

function convertQcmQuestion(question, parentActivity, questionIndex) {
  const id = question.id || `${parentActivity.id}-q${questionIndex + 1}`
  const title = `${parentActivity.title} - Q${questionIndex + 1}`
  const correctIndex = question.correctIndex ?? 0

  const frontmatter = buildFrontmatter({
    type: 'qcm',
    title,
    difficulty: parentActivity.difficulty ?? 1,
    timeMinutes: question.timeMinutes ?? 1,
    tags: parentActivity.modules || [],
  })

  // Convert enonce
  const enonce = htmlToMdx(question.enonce || '')

  // Convert options to checkbox list
  const options = (question.options || []).map((opt, i) => {
    const checked = i === correctIndex ? 'x' : ' '
    const optText = convertOptionText(opt)
    return `- [${checked}] ${optText}`
  }).join('\n')

  // Explanation as blockquote
  let explication = ''
  if (question.explication) {
    const expText = htmlToMdx(question.explication).trim()
    explication = '\n\n' + expText.split('\n').map(line => `> ${line}`).join('\n')
  }

  return { id, content: `${frontmatter}\n\n${enonce}\n\n${options}${explication}\n` }
}

// =============================================================================
// Main
// =============================================================================

function migrate() {
  console.log('🔄 Migrating YAML activities → MDX atoms...\n')

  const files = readdirSync(ACTIVITIES_DIR).filter(f => f.endsWith('.yaml'))
  let lessonCount = 0
  let exerciseCount = 0
  let qcmQuestionCount = 0
  let atomCount = 0
  let skippedCount = 0

  for (const file of files) {
    const raw = readFileSync(join(ACTIVITIES_DIR, file), 'utf-8')
    const activity = parseYaml(raw)

    if (!activity || !activity.type) {
      console.warn(`  ⚠️  Skipping ${file}: no type field`)
      skippedCount++
      continue
    }

    if (activity.visible === false) {
      console.log(`  ⊘  Skipping ${file}: visible=false`)
      skippedCount++
      continue
    }

    const id = activity.id || file.replace('.yaml', '')

    switch (activity.type) {
      case 'lesson': {
        const mdx = convertLesson(activity)
        writeFileSync(join(ATOMS_DIR, `${id}.mdx`), mdx)
        lessonCount++
        atomCount++
        console.log(`  ✅ lesson:   ${id}.mdx`)
        break
      }

      case 'exercise': {
        const mdx = convertExercise(activity)
        writeFileSync(join(ATOMS_DIR, `${id}.mdx`), mdx)
        exerciseCount++
        atomCount++
        console.log(`  ✅ exercise: ${id}.mdx`)
        break
      }

      case 'qcm': {
        const questions = activity.questions || []
        if (questions.length === 0) {
          console.warn(`  ⚠️  Skipping ${file}: QCM with 0 questions`)
          skippedCount++
          break
        }

        for (let i = 0; i < questions.length; i++) {
          const { id: qId, content: mdx } = convertQcmQuestion(questions[i], activity, i)
          writeFileSync(join(ATOMS_DIR, `${qId}.mdx`), mdx)
          qcmQuestionCount++
          atomCount++
        }
        console.log(`  ✅ qcm:      ${id} → ${questions.length} atoms`)
        break
      }

      default:
        console.warn(`  ⚠️  Unknown type: ${activity.type} in ${file}`)
        skippedCount++
    }
  }

  console.log('\n' + '='.repeat(50))
  console.log('📊 Migration summary:')
  console.log(`   YAML files processed: ${files.length}`)
  console.log(`   Skipped:              ${skippedCount}`)
  console.log(`   Lessons:              ${lessonCount}`)
  console.log(`   Exercises:            ${exerciseCount}`)
  console.log(`   QCM questions:        ${qcmQuestionCount}`)
  console.log(`   Total atoms created:  ${atomCount}`)
  console.log(`\n✅ Done! Atoms written to content/atoms/`)
}

migrate()
