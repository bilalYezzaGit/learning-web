/**
 * Content Validation Script
 *
 * Validates YAML content files against authoring guidelines.
 * Run with: npm run validate [path]
 *
 * Checks:
 * - Required fields (id, type, title)
 * - QCM structure (correctIndex is int, options array)
 * - HTML tag closure (custom tags must have closing tag)
 * - LaTeX in double-quotes (should use single-quotes)
 * - Unique IDs
 */

import fs from 'fs';
import path from 'path';
import YAML from 'yaml';
import { glob } from 'glob';

const errors = [];
const seenIds = new Map(); // id -> file

function validateRequiredFields(activity, file) {
  if (!activity.id) {
    errors.push({ file, severity: 'critical', message: 'Missing required field: id' });
  }
  if (!activity.type) {
    errors.push({ file, severity: 'critical', message: 'Missing required field: type' });
  }
  if (!activity.title) {
    errors.push({ file, severity: 'critical', message: 'Missing required field: title' });
  }

  const validTypes = ['exercise', 'qcm', 'lesson'];
  if (activity.type && !validTypes.includes(activity.type)) {
    errors.push({
      file,
      severity: 'critical',
      message: `Invalid type: "${activity.type}". Must be one of: ${validTypes.join(', ')}`
    });
  }
}

function validateTypeSpecific(activity, file) {
  switch (activity.type) {
    case 'exercise':
      if (!activity.enonce) {
        errors.push({ file, severity: 'high', message: 'Exercise missing "enonce" field' });
      }
      if (!activity.solution) {
        errors.push({ file, severity: 'high', message: 'Exercise missing "solution" field' });
      }
      break;

    case 'qcm':
      if (!activity.questions || !Array.isArray(activity.questions)) {
        errors.push({ file, severity: 'critical', message: 'QCM missing "questions" array' });
      } else {
        activity.questions.forEach((q, i) => validateQCMQuestion(q, file, i));
      }
      break;

    case 'lesson':
      if (!activity.body) {
        errors.push({ file, severity: 'high', message: 'Lesson missing "body" field' });
      }
      break;
  }
}

function validateQCMQuestion(q, file, index) {
  const prefix = `Question ${index + 1}`;

  if (!q.options || !Array.isArray(q.options)) {
    errors.push({ file, severity: 'critical', message: `${prefix}: missing "options" array` });
  } else if (q.options.length < 2) {
    errors.push({ file, severity: 'high', message: `${prefix}: needs at least 2 options` });
  }

  if (q.correctIndex === undefined) {
    errors.push({ file, severity: 'critical', message: `${prefix}: missing "correctIndex"` });
  } else if (typeof q.correctIndex !== 'number') {
    errors.push({
      file,
      severity: 'critical',
      message: `${prefix}: "correctIndex" must be an integer, got ${typeof q.correctIndex}`,
      fix: `Change to: correctIndex: ${parseInt(String(q.correctIndex), 10)}`
    });
  }

  // Check for A), B), C) prefixes in options
  if (q.options) {
    q.options.forEach((opt, i) => {
      if (/^[A-D]\)\s/.test(opt)) {
        errors.push({
          file,
          severity: 'medium',
          message: `${prefix}, option ${i + 1}: has letter prefix "${opt.slice(0, 2)}" - UI adds these automatically`,
          fix: 'Remove the A), B), C) prefix'
        });
      }
    });
  }
}

function validateHTML(content, file, field) {
  if (!content || typeof content !== 'string') return;

  // Check for unclosed custom tags
  const customTags = ['graph', 'youtube', 'variations', 'math-block'];

  for (const tag of customTags) {
    // Count opening tags (not self-closing)
    const openRegex = new RegExp(`<${tag}[^>]*>`, 'gi');
    const closeRegex = new RegExp(`</${tag}>`, 'gi');
    const selfCloseRegex = new RegExp(`<${tag}[^>]*/\\s*>`, 'gi');

    const opens = (content.match(openRegex) || []).length;
    const closes = (content.match(closeRegex) || []).length;
    const selfCloses = (content.match(selfCloseRegex) || []).length;

    if (selfCloses > 0) {
      errors.push({
        file,
        severity: 'critical',
        message: `${field}: Self-closing <${tag} /> is invalid - parser will swallow following content`,
        fix: `Use <${tag}>...</${tag}> instead`
      });
    }

    if (opens > closes) {
      errors.push({
        file,
        severity: 'critical',
        message: `${field}: Unclosed <${tag}> tag (${opens} opens, ${closes} closes)`,
        fix: `Add closing </${tag}> tag`
      });
    }
  }
}

function validateLatexInYAML(rawContent, file) {
  // Check for LaTeX commands in double-quoted strings
  const doubleQuotedLatex = rawContent.match(/"[^"]*\\\\(in|vec|infty|mathbb|frac|sqrt)[^"]*"/g);

  if (doubleQuotedLatex) {
    for (const match of doubleQuotedLatex) {
      errors.push({
        file,
        severity: 'high',
        message: `LaTeX in double-quotes may cause YAML escape issues: ${match.slice(0, 50)}...`,
        fix: "Use single-quotes for LaTeX: '...' or block literal: |"
      });
    }
  }
}

function validateUniqueId(activity, file) {
  if (!activity.id) return;

  if (seenIds.has(activity.id)) {
    errors.push({
      file,
      severity: 'critical',
      message: `Duplicate ID "${activity.id}" - also in ${seenIds.get(activity.id)}`
    });
  } else {
    seenIds.set(activity.id, file);
  }
}

async function validateFile(filePath) {
  const rawContent = fs.readFileSync(filePath, 'utf-8');

  let activity;
  try {
    activity = YAML.parse(rawContent);
  } catch (e) {
    errors.push({
      file: filePath,
      severity: 'critical',
      message: `YAML parse error: ${e.message}`
    });
    return;
  }

  if (!activity) {
    errors.push({ file: filePath, severity: 'critical', message: 'Empty YAML file' });
    return;
  }

  // Run all validations
  validateRequiredFields(activity, filePath);
  validateTypeSpecific(activity, filePath);
  validateUniqueId(activity, filePath);
  validateLatexInYAML(rawContent, filePath);

  // Validate HTML in content fields
  const htmlFields = ['enonce', 'solution', 'body', 'methode', 'summary', 'contexte'];
  for (const field of htmlFields) {
    if (activity[field] && typeof activity[field] === 'string') {
      validateHTML(activity[field], filePath, field);
    }
  }

  // Validate HTML in questions
  if (activity.questions) {
    for (const q of activity.questions) {
      if (q.enonce) validateHTML(q.enonce, filePath, 'question.enonce');
      if (q.options) {
        for (const opt of q.options) {
          validateHTML(opt, filePath, 'question.option');
        }
      }
      if (q.explication) validateHTML(q.explication, filePath, 'question.explication');
    }
  }

  // Validate HTML in exercise questions
  if (activity.questions && activity.type === 'exercise') {
    for (const q of activity.questions) {
      if (q.enonce) validateHTML(q.enonce, filePath, 'question.enonce');
      if (q.solution) validateHTML(q.solution, filePath, 'question.solution');
    }
  }
}

async function main() {
  const args = process.argv.slice(2);
  const targetPath = args[0];

  // Change to repo root for consistent paths
  const repoRoot = path.resolve(import.meta.dirname, '../../..');
  process.chdir(repoRoot);

  let files;

  if (targetPath) {
    if (fs.existsSync(targetPath)) {
      files = [targetPath];
    } else {
      // Try to find by ID
      const pattern = `content/activities/*${targetPath}*.yaml`;
      files = await glob(pattern);
      if (files.length === 0) {
        console.error(`No files found matching: ${targetPath}`);
        process.exit(1);
      }
    }
  } else {
    files = await glob('content/activities/**/*.yaml');
  }

  console.log(`\nValidating ${files.length} file(s)...\n`);

  for (const file of files) {
    await validateFile(file);
  }

  // Print results
  if (errors.length === 0) {
    console.log('All validations passed!');
    process.exit(0);
  }

  // Group by severity
  const bySeverity = {
    critical: errors.filter(e => e.severity === 'critical'),
    high: errors.filter(e => e.severity === 'high'),
    medium: errors.filter(e => e.severity === 'medium'),
    low: errors.filter(e => e.severity === 'low'),
  };

  console.log('='.repeat(60));
  console.log('VALIDATION REPORT');
  console.log('='.repeat(60));
  console.log(`\nCritical: ${bySeverity.critical.length}`);
  console.log(`High: ${bySeverity.high.length}`);
  console.log(`Medium: ${bySeverity.medium.length}`);
  console.log(`Low: ${bySeverity.low.length}\n`);

  for (const severity of ['critical', 'high', 'medium', 'low']) {
    const items = bySeverity[severity];
    if (items.length === 0) continue;

    console.log(`\n## ${severity.toUpperCase()} (${items.length})\n`);

    for (const err of items) {
      console.log(`- ${err.file}`);
      console.log(`  ${err.message}`);
      if (err.fix) {
        console.log(`  Fix: ${err.fix}`);
      }
    }
  }

  // Exit with error if critical issues
  if (bySeverity.critical.length > 0) {
    process.exit(1);
  }
}

main().catch(console.error);
