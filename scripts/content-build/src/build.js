#!/usr/bin/env node
/**
 * Content Build Pipeline
 *
 * Reads YAML source files from content/ and generates JSON for Firebase Hosting.
 *
 * Structure:
 *   content/activities/*.yaml        - Standalone activities (exercises, QCM, lessons)
 *   content/programmes/              - Programmes with modules (references activities)
 *   content/series/*.yaml            - Editorial series (ordered activity references)
 *
 * Output:
 *   public/content/programmes.json        - Programmes > modules (metadata only, no activities)
 *   public/content/cours/{id}.json        - Module with inline activities
 *   public/content/series/index.json      - Series catalog (lightweight, no activities)
 *   public/content/series/{id}.json       - Series with inline activities
 *
 * Usage:
 *   npm run build     - Build only
 *   npm run deploy    - Build + firebase deploy
 */

import { readFileSync, writeFileSync, existsSync, mkdirSync } from 'fs';
import { glob } from 'glob';
import { parse as parseYaml } from 'yaml';
import { v4 as uuidv4 } from 'uuid';
import { dirname, basename, join } from 'path';
import { fileURLToPath } from 'url';

const __dirname = dirname(fileURLToPath(import.meta.url));
const ROOT_DIR = join(__dirname, '../../..');
const CONTENT_DIR = join(ROOT_DIR, 'content');
const ACTIVITIES_DIR = join(CONTENT_DIR, 'activities');
const PROGRAMMES_DIR = join(CONTENT_DIR, 'programmes');
const SERIES_DIR = join(CONTENT_DIR, 'series');
const OUTPUT_DIR = join(ROOT_DIR, 'public/content');

// ============================================================================
// Helpers
// ============================================================================

function readYaml(filePath) {
  const content = readFileSync(filePath, 'utf-8');
  return parseYaml(content);
}

function writeJson(filePath, data) {
  const dir = dirname(filePath);
  if (!existsSync(dir)) {
    mkdirSync(dir, { recursive: true });
  }
  writeFileSync(filePath, JSON.stringify(data, null, 2));
}

function generateUUID() {
  return uuidv4();
}

// ============================================================================
// Activity Parser
// ============================================================================

function parseActivity(activityYaml) {
  const base = {
    id: activityYaml.id,
    type: activityYaml.type,
    title: activityYaml.title,
    difficulty: activityYaml.difficulty ?? 1,
    timeMinutes: activityYaml.timeMinutes ?? 5,
    modules: activityYaml.modules || [],
    ...(activityYaml.tags?.length > 0 && { tags: activityYaml.tags }),
    ...(activityYaml.sectionId && { sectionId: activityYaml.sectionId }),
    ...(activityYaml.visible === false && { visible: false }),
  };

  if (activityYaml.type === 'exercise') {
    return {
      ...base,
      ...(activityYaml.category && { category: activityYaml.category }),
      ...(activityYaml.contexte && { contexte: activityYaml.contexte }),
      enonce: activityYaml.enonce || '',
      solution: activityYaml.solution || '',
      ...(activityYaml.methode && { methode: activityYaml.methode }),
      ...(activityYaml.hint && { hint: activityYaml.hint }),
      ...(activityYaml.erreurs && { erreurs: activityYaml.erreurs }),
      ...(activityYaml.questions && { questions: activityYaml.questions }),
    };
  } else if (activityYaml.type === 'qcm') {
    return {
      ...base,
      ...(activityYaml.description && { description: activityYaml.description }),
      questions: (activityYaml.questions || []).map((q, idx) => ({
        id: q.id || `${activityYaml.id}-q${idx + 1}`,
        type: q.type || 'qcm',
        timeMinutes: q.timeMinutes ?? 2,
        enonce: q.enonce,
        options: q.options,
        correctIndex: q.correctIndex,
        ...(q.explication && { explication: q.explication }),
        ...(q.affirmations && { affirmations: q.affirmations }),
        ...(q.reponses && { reponses: q.reponses }),
      })),
    };
  } else if (activityYaml.type === 'lesson') {
    return {
      ...base,
      body: activityYaml.body || '',
      ...(activityYaml.summary && { summary: activityYaml.summary }),
    };
  }

  return base;
}

// ============================================================================
// Module Parser (with inline activities)
// ============================================================================

function parseSection(sectionYaml) {
  return {
    id: sectionYaml.id,
    label: sectionYaml.label,
    order: sectionYaml.order ?? sectionYaml.position ?? 0,
  };
}

function parseModule(moduleDir, allActivities, activityMap) {
  const moduleYamlPath = join(moduleDir, '_module.yaml');
  if (!existsSync(moduleYamlPath)) {
    console.warn(`  ⚠️  No _module.yaml in ${moduleDir}`);
    return null;
  }

  const moduleYaml = readYaml(moduleYamlPath);
  const slug = moduleYaml.slug || basename(moduleDir).replace(/^\d+-/, '');

  // Read sections
  const sectionFiles = glob.sync(join(moduleDir, 'sections/*.yaml'));
  const sections = sectionFiles
    .map(f => parseSection(readYaml(f)))
    .sort((a, b) => a.order - b.order);

  // Inline activities: all activities that reference this module slug
  const activities = allActivities
    .filter(a => a.modules.includes(slug) && a.visible !== false);

  // Read coursePath from module yaml
  const coursePath = moduleYaml.coursePath || [];

  // Validate coursePath references
  const moduleActivityIds = new Set(activities.map(a => a.id));
  for (const id of coursePath) {
    if (!moduleActivityIds.has(id)) {
      console.warn(`  ⚠️  coursePath contains unknown activity: ${id} (module: ${slug})`);
    }
  }

  return {
    id: moduleYaml.id || generateUUID(),
    slug,
    programmeId: moduleYaml.programmeId,
    title: moduleYaml.title,
    description: moduleYaml.description || '',
    ...(moduleYaml.icon && { icon: moduleYaml.icon }),
    trimester: moduleYaml.trimester || 'T1',
    order: moduleYaml.order ?? 0,
    version: moduleYaml.version ?? 1,
    updatedAt: new Date().toISOString(),
    estimatedTime: moduleYaml.estimatedTime ?? 60,
    prerequisites: moduleYaml.prerequisites || [],
    objectives: moduleYaml.objectives || [],
    tags: moduleYaml.tags || [],
    available: moduleYaml.available ?? true,
    sections,
    activities,
    ...(coursePath.length > 0 && { coursePath }),
  };
}

// ============================================================================
// Series Parser (with inline activities)
// ============================================================================

function parseSerie(serieYaml, activityMap) {
  const activityIds = serieYaml.activityIds || serieYaml.exerciseIds || [];

  // Resolve activityIds to full inline activities
  const activities = [];
  const missingIds = [];
  for (const id of activityIds) {
    const activity = activityMap.get(id);
    if (activity) {
      activities.push(activity);
    } else {
      missingIds.push(id);
    }
  }

  return {
    id: serieYaml.id,
    title: serieYaml.title,
    description: serieYaml.description || '',
    difficulty: serieYaml.difficulty ?? 2,
    estimatedMinutes: serieYaml.estimatedMinutes ?? 30,
    ...(serieYaml.tags?.length > 0 && { tags: serieYaml.tags }),
    activities,
    _missingIds: missingIds, // internal, stripped before output
  };
}

function serieToIndex(serie) {
  return {
    id: serie.id,
    title: serie.title,
    description: serie.description,
    difficulty: serie.difficulty,
    estimatedMinutes: serie.estimatedMinutes,
    ...(serie.tags && { tags: serie.tags }),
    activityCount: serie.activities.length,
  };
}

// ============================================================================
// Programme Parser
// ============================================================================

function parseProgramme(programmeDir, allActivities, activityMap) {
  const indexPath = join(programmeDir, '_index.yaml');
  if (!existsSync(indexPath)) {
    console.warn(`  ⚠️  No _index.yaml in ${programmeDir}`);
    return null;
  }

  const indexYaml = readYaml(indexPath);

  // Find all module directories
  const moduleDirs = glob.sync(join(programmeDir, 'modules/*/'));
  const modules = moduleDirs
    .map(dir => parseModule(dir, allActivities, activityMap))
    .filter(Boolean)
    .sort((a, b) => a.order - b.order);

  return {
    id: indexYaml.id || basename(programmeDir),
    label: indexYaml.label || indexYaml.title,
    levelSlug: indexYaml.levelSlug || indexYaml.level,
    sectionSlug: indexYaml.sectionSlug || 'math',
    levelName: indexYaml.levelName || indexYaml.level,
    sectionName: indexYaml.sectionName || 'Mathematiques',
    description: indexYaml.description || '',
    order: indexYaml.order ?? 0,
    color: indexYaml.color || '#3B82F6',
    icon: indexYaml.icon || 'calculate',
    available: indexYaml.available ?? true,
    modules,
  };
}

// ============================================================================
// Validation
// ============================================================================

function validateModule(module) {
  const errors = [];
  const warnings = [];

  // Warn if module has 0 activities
  if (module.activities.length === 0) {
    warnings.push(`Module "${module.slug}" has 0 activities — slug may be wrong or activities not linked`);
  }

  // Validate coursePath references exist in inline activities
  if (module.coursePath) {
    const activityIds = new Set(module.activities.map(a => a.id));
    for (const id of module.coursePath) {
      if (!activityIds.has(id)) {
        errors.push(`Module "${module.slug}" coursePath references unknown activity: ${id}`);
      }
    }
  }

  return { errors, warnings };
}

function validateActivitySlugs(allActivities, allModuleSlugs) {
  const warnings = [];
  const slugSet = new Set(allModuleSlugs);

  for (const activity of allActivities) {
    for (const slug of activity.modules || []) {
      if (!slugSet.has(slug)) {
        warnings.push(`Activity "${activity.id}" references unknown module slug: "${slug}"`);
      }
    }
  }

  return warnings;
}

function validateSerie(serie) {
  const errors = [];
  for (const id of serie._missingIds) {
    errors.push(`Serie "${serie.id}" references unknown activity: ${id}`);
  }
  return errors;
}

// ============================================================================
// Main Build
// ============================================================================

async function build() {
  console.log('🔨 Building content...\n');
  let hasErrors = false;

  // ── Step 1: Load all activities ──────────────────────────────────────────
  console.log('📂 Loading activities...');
  const activityFiles = glob.sync(join(ACTIVITIES_DIR, '*.yaml'));
  const allActivities = activityFiles
    .map(f => parseActivity(readYaml(f)))
    .filter(a => a.visible !== false);

  // Build activity lookup map (id → full activity)
  const activityMap = new Map(allActivities.map(a => [a.id, a]));
  console.log(`   ✅ ${allActivities.length} activities loaded\n`);

  // ── Step 2: Build programmes.json + cours/{id}.json per module ──
  const programmeDirs = glob.sync(join(PROGRAMMES_DIR, '*/'));
  const programmes = [];

  for (const programmeDir of programmeDirs) {
    const programmeName = basename(programmeDir);
    console.log(`📦 Programme: ${programmeName}`);

    const programme = parseProgramme(programmeDir, allActivities, activityMap);
    if (!programme) continue;

    // Validate and write each module as cours/{id}.json
    for (const module of programme.modules) {
      console.log(`   📄 Module: ${module.title} (slug: ${module.slug})`);

      const { errors, warnings } = validateModule(module);
      for (const warning of warnings) {
        console.warn(`      ⚠️  ${warning}`);
      }
      if (errors.length > 0) {
        hasErrors = true;
        for (const error of errors) {
          console.error(`      ❌ ${error}`);
        }
      } else {
        const coursePathInfo = module.coursePath ? `, ${module.coursePath.length} in coursePath` : '';
        console.log(`      ✅ ${module.activities.length} activities inline${coursePathInfo}`);
      }

      // Write individual module file with inline activities
      writeJson(join(OUTPUT_DIR, 'cours', `${module.id}.json`), module);
    }

    // Strip activities from modules for the lightweight programmes.json
    const lightProgramme = {
      ...programme,
      modules: programme.modules.map(({ activities, ...rest }) => rest),
    };
    programmes.push(lightProgramme);
  }

  // Sort programmes by order
  programmes.sort((a, b) => a.order - b.order);

  // ── Step 2b: Validate activity-module slug references ──────────────────
  const allModuleSlugs = programmes.flatMap(p => p.modules.map(m => m.slug));
  const orphanWarnings = validateActivitySlugs(allActivities, allModuleSlugs);
  for (const warning of orphanWarnings) {
    console.warn(`   ⚠️  ${warning}`);
  }

  // Write programmes.json (lightweight — no activities in modules)
  const programmesOutput = {
    version: 1,
    updatedAt: new Date().toISOString(),
    programmes,
  };
  writeJson(join(OUTPUT_DIR, 'programmes.json'), programmesOutput);

  // ── Step 3: Load series (with inline activities) ─────────────────────────
  if (existsSync(SERIES_DIR)) {
    console.log('\n📚 Loading series...');
    const seriesFiles = glob.sync(join(SERIES_DIR, '*.yaml'));
    const allSeries = seriesFiles.map(f => parseSerie(readYaml(f), activityMap));

    // Validate
    for (const serie of allSeries) {
      const errors = validateSerie(serie);
      if (errors.length > 0) {
        hasErrors = true;
        for (const error of errors) {
          console.error(`   ❌ ${error}`);
        }
      }
    }

    if (allSeries.length > 0) {
      // Write series/index.json (lightweight, no activities)
      const seriesIndex = {
        version: 1,
        updatedAt: new Date().toISOString(),
        series: allSeries.map(serieToIndex),
      };
      writeJson(join(OUTPUT_DIR, 'series', 'index.json'), seriesIndex);

      // Write individual series JSON (with inline activities)
      for (const serie of allSeries) {
        // Strip internal _missingIds before output
        const { _missingIds, ...serieOutput } = serie;
        writeJson(join(OUTPUT_DIR, 'series', `${serie.id}.json`), serieOutput);
      }
      console.log(`   ✅ ${allSeries.length} series (activities inline)`);
    } else {
      console.log('   (no series found)');
    }
  }

  // ── Done ─────────────────────────────────────────────────────────────────
  console.log('\n' + (hasErrors ? '⚠️  Build completed with errors' : '✅ Build successful!'));
  console.log(`   Output: ${OUTPUT_DIR}`);

  if (hasErrors) {
    process.exit(1);
  }
}

// Run
build().catch(err => {
  console.error('❌ Build failed:', err);
  process.exit(1);
});
