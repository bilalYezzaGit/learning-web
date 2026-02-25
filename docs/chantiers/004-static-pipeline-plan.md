# Plan — Chantier 004 : Pipeline statique de contenu

> Voir `004-static-pipeline.md` pour la description et le contexte.

---

## Phase 0 — Scaffolding pipeline

### Etape 0.1 — Creer la structure du pipeline

```
tools/pipeline/
├── package.json          # Dependances du pipeline (pas de l'app)
├── tsconfig.json         # TypeScript config standalone
├── src/
│   ├── index.ts          # Point d'entree CLI
│   ├── config.ts         # Chemins, constantes
│   ├── types.ts          # Types internes du pipeline
│   └── stages/           # Les etapes du pipeline (voir Phase 1-4)
└── README.md
```

**package.json du pipeline** :
```json
{
  "name": "@learning/content-pipeline",
  "private": true,
  "type": "module",
  "scripts": {
    "build": "tsx src/index.ts",
    "watch": "tsx watch src/index.ts"
  },
  "dependencies": {
    "gray-matter": "^4.0.3",
    "yaml": "^2.8.2",
    "zod": "^4.3.6",
    "katex": "^0.16.28",
    "unified": "^11.0.0",
    "remark-parse": "^11.0.0",
    "remark-math": "^6.0.0",
    "remark-rehype": "^11.0.0",
    "rehype-katex": "^7.0.1",
    "rehype-stringify": "^10.0.0",
    "mdast-util-mdx-jsx": "^3.0.0"
  },
  "devDependencies": {
    "tsx": "^4.0.0",
    "typescript": "^5.0.0"
  }
}
```

> **Point cle** : on utilise `unified` + `remark` + `rehype` directement
> (pas `next-mdx-remote`) pour produire du HTML pur. Le pipeline n'a aucune
> dependance React ou Next.js.

### Etape 0.2 — Creer le repertoire de sortie

```
src/generated/          # Ignore par git? Non — commite pour que l'app fonctionne sans pipeline
├── .gitkeep
└── README.md           # "Ne pas editer a la main — genere par tools/pipeline"
```

**Decision** : les fichiers generes sont commites dans le repo pour que :
- `npm run build` fonctionne sans executer le pipeline
- Le CI/CD n'a pas besoin du pipeline
- Les reviewers peuvent voir le contenu genere dans les PRs

### Etape 0.3 — Script npm dans le package.json racine

```json
{
  "scripts": {
    "content:build": "cd tools/pipeline && npx tsx src/index.ts",
    "content:watch": "cd tools/pipeline && npx tsx watch src/index.ts"
  }
}
```

**Critere de validation** : `npm run content:build` s'execute sans erreur (meme si ne produit rien encore).

---

## Phase 1 — Lecture et validation (pipeline)

### Etape 1.1 — Lecteur d'atomes (`stages/read-atoms.ts`)

Lit tous les fichiers `content/atoms/*.mdx` et retourne les metadonnees + contenu brut.

```ts
interface RawAtom {
  id: string              // nom fichier sans .mdx
  type: 'lesson' | 'exercise' | 'qcm'
  title: string
  difficulty: number
  timeMinutes: number
  tags: string[]
  category?: string
  correctOption?: number
  rawContent: string      // MDX brut (sans frontmatter)
}

export function readAllAtoms(atomsDir: string): RawAtom[]
```

- Utilise `gray-matter` pour le frontmatter
- Valide avec le schema Zod `atomMetaSchema`
- Erreur claire si un atome est invalide (fichier + ligne + erreur Zod)

### Etape 1.2 — Lecteur de molecules (`stages/read-molecules.ts`)

Lit tous les fichiers YAML : cours, series, programmes.

```ts
interface RawCours { slug: string; /* ... champs YAML */ }
interface RawSerie { slug: string; /* ... champs YAML */ }
interface RawProgramme { id: string; /* ... champs YAML */ }

export function readAllCours(coursDir: string): RawCours[]
export function readAllSeries(seriesDir: string): RawSerie[]
export function readAllProgrammes(programmesDir: string): RawProgramme[]
```

- Utilise `yaml` pour parser
- Valide avec les schemas Zod existants

### Etape 1.3 — Validation croisee (`stages/validate.ts`)

Verifie l'integrite referentielle de tout le contenu :

```ts
export function validateContent(
  atoms: RawAtom[],
  cours: RawCours[],
  series: RawSerie[],
  programmes: RawProgramme[]
): ValidationError[]
```

Checks :
1. Chaque atom ID reference dans un cours/serie existe
2. Chaque cours/serie reference dans un programme existe
3. Pas d'atomes orphelins (warning, pas erreur)
4. Pas de doublons d'ID
5. Les QCMs ont `correctOption` dans le frontmatter
6. Les `correctOption` sont dans le bon range (0..N-1)

Le pipeline **s'arrete** si des erreurs sont trouvees. Rapport clair dans la console.

**Critere de validation** : Le pipeline lit les 422 atomes + 61 molecules, valide tout, et affiche un rapport propre.

---

## Phase 2 — Compilation des atomes (pipeline)

### Etape 2.1 — Compilateur MDX → HTML (`stages/compile-mdx.ts`)

Transforme le MDX brut en HTML statique en utilisant `unified` directement.

```ts
export async function compileMdxToHtml(source: string): Promise<string>
```

**Pipeline unified** :
```
source MDX
  → remark-parse (parse markdown)
  → remark-math (parse $...$ et $$...$$)
  → handle custom JSX components (voir 2.2)
  → remark-rehype (markdown → HTML AST)
  → rehype-katex (LaTeX → HTML)
  → rehype-stringify (HTML AST → string)
```

### Etape 2.2 — Transformation des composants MDX custom

Les composants comme `<Definition>`, `<Solution>`, `<Graph>` sont du JSX custom
dans le MDX. Le pipeline doit les transformer en HTML.

**Composants statiques** (rendus en HTML final) :
| Composant | HTML genere |
|-----------|------------|
| `<Definition title="...">` | `<aside class="content-block definition">...</aside>` |
| `<Theorem>` | `<aside class="content-block theorem">...</aside>` |
| `<Property>` | `<aside class="content-block property">...</aside>` |
| `<Example>` | `<aside class="content-block example">...</aside>` |
| `<Remark>` | `<aside class="content-block remark">...</aside>` |
| `<Attention>` | `<aside class="content-block attention">...</aside>` |
| `<Enonce>` | `<div class="exercise-enonce">...</div>` |
| `<Solution>` | `<details class="exercise-solution">...</details>` |
| `<Methode>` | `<details class="exercise-methode">...</details>` |
| `<Hint>` | `<details class="exercise-hint">...</details>` |
| `<Erreurs>` | `<details class="exercise-erreurs">...</details>` |
| `<Variations>` + `<Row>` | `<div class="variations-table">...</div>` (HTML pur du tableau) |

**Composants interactifs** (marqueurs pour hydratation client) :
| Composant | Marqueur HTML |
|-----------|--------------|
| `<Graph fn="..." range="...">` | `<div data-widget="graph" data-props='{"expression":"...","range":"..."}'></div>` |
| `<YouTube id="...">` | `<div data-widget="youtube" data-props='{"videoId":"..."}'></div>` |
| `<TviExplorer>` | `<div data-widget="tvi-explorer"></div>` |

Implementation : plugin remark/rehype custom qui visite les noeuds JSX de l'AST
et les remplace par le HTML/marqueur correspondant.

### Etape 2.3 — Compilateur de QCM (`stages/compile-qcm.ts`)

Les QCMs sont structures differemment : il faut extraire `<Question>`, `<Option>`, `<Explanation>`.

```ts
interface CompiledQcm {
  id: string
  title: string
  enonce: string        // HTML
  options: string[]     // HTML[]
  correctIndex: number
  explication: string   // HTML (peut etre vide)
  timeMinutes: number
}

export async function compileQcm(atom: RawAtom): Promise<CompiledQcm>
```

- Parse le MDX pour trouver les sections `<Question>`, `<Option>`, `<Explanation>`
- Compile chaque section en HTML separement
- Le `correctIndex` vient de l'attribut `correct` sur `<Option>` ou du frontmatter

### Etape 2.4 — Compiler tous les atomes (`stages/compile-all.ts`)

Orchestre la compilation de tous les atomes :

```ts
export async function compileAllAtoms(atoms: RawAtom[]): Promise<{
  htmlFiles: Map<string, string>     // id → HTML (lessons + exercises)
  qcmFiles: Map<string, CompiledQcm> // id → JSON (qcms)
}>
```

- Compile en parallele (Promise.all avec concurrence limitee)
- Affiche une barre de progression
- Rapport : "422 atomes compiles en 3.2s (0 erreurs)"

**Critere de validation** : Les 422 atomes sont compiles sans erreur. Les HTML produits
contiennent le KaTeX rendu, les composants transformes, et les marqueurs pour les widgets interactifs.

### Etape 2.3 — Compilateur de QCM (`stages/compile-qcm.ts`)

Les QCMs sont structures differemment : il faut extraire `<Question>`, `<Option>`, `<Explanation>`.

```ts
interface CompiledQcm {
  id: string
  title: string
  enonce: string        // HTML
  options: string[]     // HTML[]
  correctIndex: number
  explication: string   // HTML (peut etre vide)
  timeMinutes: number
}

export async function compileQcm(atom: RawAtom): Promise<CompiledQcm>
```

- Parse le MDX pour trouver les sections `<Question>`, `<Option>`, `<Explanation>`
- Compile chaque section en HTML separement
- Le `correctIndex` vient de l'attribut `correct` sur `<Option>` ou du frontmatter

### Etape 2.4 — Compiler tous les atomes (`stages/compile-all.ts`)

Orchestre la compilation de tous les atomes :

```ts
export async function compileAllAtoms(atoms: RawAtom[]): Promise<{
  htmlFiles: Map<string, string>     // id → HTML (lessons + exercises)
  qcmFiles: Map<string, CompiledQcm> // id → JSON (qcms)
}>
```

- Compile en parallele (Promise.all avec concurrence limitee)
- Affiche une barre de progression
- Rapport : "422 atomes compiles en 3.2s (0 erreurs)"

**Critere de validation** : Les 422 atomes sont compiles sans erreur. Les HTML produits contiennent le KaTeX rendu, les composants transformes, et les marqueurs pour les widgets interactifs.

---

## Phase 3 — Resolution et assemblage (pipeline)

### Etape 3.1 — Resoudre les cours (`stages/resolve-cours.ts`)

Transforme chaque `RawCours` en un JSON avec les activites resolues.

```ts
interface ResolvedCours {
  slug: string
  title: string
  description: string
  programme: string
  trimester: string
  order: number
  estimatedMinutes: number
  objectives: string[]
  sections: {
    id: string
    label: string
    activities: ResolvedActivity[]
  }[]
  totalActivities: number
}

interface ResolvedActivity {
  id: string
  type: 'lesson' | 'exercise' | 'quiz'
  title: string
  timeMinutes: number
  atomIds?: string[]  // pour les quiz groups
}
```

- Flatten `sections[].steps[]` en activites ordonnees
- Resolve les `{ quiz: [...] }` en une seule activite de type `quiz`
- Recupere `title` et `timeMinutes` depuis les atomes
- Calcule `totalActivities`

### Etape 3.2 — Resoudre les series (`stages/resolve-series.ts`)

Meme logique pour les series.

```ts
interface ResolvedSerie {
  slug: string
  title: string
  description: string
  difficulty: number
  estimatedMinutes: number
  tags: string[]
  type: string
  trimestre: number
  modules: string[]
  activities: ResolvedActivity[]
  totalActivities: number
  successThreshold: number
}
```

### Etape 3.3 — Assembler les catalogues (`stages/assemble-catalogues.ts`)

Genere un catalogue par programme avec toutes les infos pre-calculees.

```ts
interface Catalogue {
  id: string
  label: string
  color: string
  icon: string
  modules: {
    slug: string
    title: string
    trimester: string
    order: number
    totalActivities: number
    estimatedMinutes: number
    activityIds: string[]
  }[]
  series: {
    slug: string
    title: string
    difficulty: number
    type: string
    trimestre: number
    totalActivities: number
    estimatedMinutes: number
    modules: string[]
  }[]
}
```

Les pages `[parcours]/page.tsx`, `[parcours]/apprendre/page.tsx` et `[parcours]/reviser/page.tsx`
n'auront qu'a importer ce JSON au lieu de faire 10+ appels `getCours()` + `resolveCoursActivities()`.

### Etape 3.4 — Assembler la liste des programmes (`stages/assemble-programmes.ts`)

```ts
interface ProgrammeSummary {
  id: string
  label: string
  levelSlug: string
  sectionSlug: string
  order: number
  color: string
  icon: string
}
```

**Critere de validation** : Tous les JSON generes sont valides. Les activites resolues
correspondent exactement aux timelines actuelles (test de non-regression).

---

## Phase 4 — Ecriture des fichiers generes (pipeline)

### Etape 4.1 — Writer (`stages/write-output.ts`)

Ecrit tous les fichiers dans `src/generated/` :

```
src/generated/
├── programmes.json               # Liste des programmes
├── catalogues/
│   ├── 3eme-math.json
│   ├── 3eme-sciences.json
│   └── 1ere-tc.json
├── cours/
│   ├── continuite.json           # Cours resolu (meta + timeline)
│   ├── fonctions-affines.json
│   └── ... (20 fichiers)
├── series/
│   ├── continuite-fondamentaux.json
│   ├── fa-fondamentaux.json
│   └── ... (38 fichiers)
└── atoms/
    ├── lesson-fa-definition.html  # HTML pre-compile
    ├── ex-fa-reconnaissance.html
    ├── qcm-fa-definition.json     # QCM compile
    └── ... (422 fichiers)
```

### Etape 4.2 — Manifest (`stages/write-manifest.ts`)

Genere un fichier `manifest.json` qui liste tout le contenu genere :

```json
{
  "generatedAt": "2026-02-24T12:00:00Z",
  "stats": {
    "atoms": { "total": 422, "lessons": 89, "exercises": 131, "qcms": 202 },
    "cours": 20,
    "series": 38,
    "programmes": 3
  },
  "atomIds": ["lesson-fa-definition", "ex-fa-reconnaissance", "..."],
  "coursIds": ["continuite", "fonctions-affines", "..."],
  "serieIds": ["continuite-fondamentaux", "..."],
  "programmeIds": ["3eme-math", "3eme-sciences", "1ere-tc"]
}
```

Ce manifest sera utile pour :
- Verifier que le pipeline a bien tout genere
- Debug rapide
- Futur sitemap generation

### Etape 4.3 — CLI principal (`src/index.ts`)

Orchestre toutes les etapes :

```
$ npm run content:build

[1/5] Reading content...
      422 atoms, 20 cours, 38 series, 3 programmes
[2/5] Validating references...
      0 errors, 2 warnings (orphan atoms)
[3/5] Compiling atoms...
      422/422 compiled (3.1s)
[4/5] Resolving molecules...
      20 cours, 38 series, 3 catalogues
[5/5] Writing output...
      543 files written to src/generated/

Done in 4.2s
```

**Critere de validation** : `npm run content:build` produit tous les fichiers attendus, sans erreur, en moins de 10 secondes.

---

## Phase 5 — Loader cote app (`src/lib/content-loader.ts`)

### Etape 5.1 — Creer le loader

Remplace `src/lib/content.ts` (420 lignes) par un loader simple (~80 lignes) :

```ts
// src/lib/content-loader.ts
import programmesData from '@/generated/programmes.json'

// Types
export interface Programme { id: string; label: string; /* ... */ }
export interface CoursMeta { slug: string; title: string; /* ... */ }
export interface SerieMeta { slug: string; title: string; /* ... */ }
export interface ResolvedActivity { id: string; type: string; title: string; /* ... */ }

// Programmes
export function getAllProgrammes(): Programme[] {
  return programmesData
}

export function getProgramme(id: string): Programme {
  const p = programmesData.find(p => p.id === id)
  if (!p) throw new Error(`Programme not found: ${id}`)
  return p
}

// Catalogues
export async function getCatalogue(programmeId: string) {
  return (await import(`@/generated/catalogues/${programmeId}.json`)).default
}

// Cours
export async function getCours(slug: string) {
  return (await import(`@/generated/cours/${slug}.json`)).default
}

// Series
export async function getSerie(slug: string) {
  return (await import(`@/generated/series/${slug}.json`)).default
}

// Atomes
export async function getAtomHtml(id: string): Promise<string> {
  const res = await fetch(`/content/atoms/${id}.html`)
  return res.text()
}

export async function getQcmData(id: string) {
  return (await import(`@/generated/atoms/${id}.json`)).default
}
```

> Note : les `import()` dynamiques sont resolus au build par Next.js.
> Pas de `fs`, pas de `gray-matter`, pas de `yaml`.

### Etape 5.2 — Types generes (`src/generated/types.ts`)

Le pipeline genere aussi un fichier de types TypeScript :

```ts
// Auto-generated by content pipeline — do not edit
export type AtomId = 'lesson-fa-definition' | 'ex-fa-reconnaissance' | '...'
export type CoursSlug = 'continuite' | 'fonctions-affines' | '...'
export type SerieSlug = 'continuite-fondamentaux' | 'fa-fondamentaux' | '...'
export type ProgrammeId = '3eme-math' | '3eme-sciences' | '1ere-tc'
```

Type-safety gratuite : si un atome est supprime, TypeScript casse les references.

**Critere de validation** : Le loader compile sans erreur TypeScript et expose la meme API que l'ancien `content.ts`.

---

## Phase 6 — ContentRenderer (hydratation client)

### Etape 6.1 — Composant ContentRenderer

```tsx
// src/components/content-renderer.tsx
'use client'

import { useEffect, useRef } from 'react'
import { createPortal } from 'react-dom'

// Lazy-load les widgets interactifs
const widgetRegistry = {
  'graph': () => import('@/content/extensions/graph').then(m => m.Graph),
  'youtube': () => import('@/content/extensions/youtube').then(m => m.YouTube),
  'tvi-explorer': () => import('@/content/extensions/tvi-explorer').then(m => m.TviExplorer),
}

interface ContentRendererProps {
  html: string
  className?: string
}

export function ContentRenderer({ html, className }: ContentRendererProps) {
  const containerRef = useRef<HTMLDivElement>(null)

  useEffect(() => {
    // Trouver tous les marqueurs data-widget et monter les composants React
    const container = containerRef.current
    if (!container) return

    const widgets = container.querySelectorAll('[data-widget]')
    // ... mount widgets via createPortal ou createRoot
  }, [html])

  return (
    <div
      ref={containerRef}
      className={className}
      dangerouslySetInnerHTML={{ __html: html }}
    />
  )
}
```

### Etape 6.2 — Styles CSS pour le HTML genere

Les classes CSS des composants statiques (`content-block`, `definition`, etc.)
doivent etre definies dans un fichier CSS global :

```css
/* src/app/content.css */
.content-block { /* aside styling */ }
.content-block.definition { /* indigo accent */ }
.content-block.theorem { /* violet accent */ }
/* ... */
.exercise-solution { /* details styling */ }
```

> Alternative : utiliser des classes Tailwind directement dans le HTML genere.
> C'est plus simple et coherent avec le reste de l'app. Le pipeline genere
> du HTML avec des classes Tailwind.

**Decision** : le pipeline genere du HTML avec des classes Tailwind. Pas besoin
d'un fichier CSS separe. Le HTML genere utilise exactement les memes classes que
les composants React actuels.

**Critere de validation** : Une lecon affichee via `ContentRenderer` est visuellement identique a l'ancien rendu MDX.

---

## Phase 7 — Migration des pages (app)

### Etape 7.1 — Migrer les pages catalogue

**`[parcours]/page.tsx`** (dashboard) :
```diff
- import { getAllProgrammes, getCours, resolveCoursActivities } from '@/lib/content'
+ import { getCatalogue, getAllProgrammes } from '@/lib/content-loader'

- const cours = getCours(moduleSlug)
- const activities = resolveCoursActivities(moduleSlug)
+ const catalogue = await getCatalogue(parcours)
```

**`[parcours]/apprendre/page.tsx`** :
```diff
- import { getAllProgrammes, getCours, resolveCoursActivities } from '@/lib/content'
+ import { getCatalogue } from '@/lib/content-loader'
```

**`[parcours]/reviser/page.tsx`** :
```diff
- import { getAllProgrammes, getSerie, resolveSerieActivities } from '@/lib/content'
+ import { getCatalogue } from '@/lib/content-loader'
```

### Etape 7.2 — Migrer les pages module

**`[parcours]/apprendre/[moduleId]/page.tsx`** :
```diff
- import { getCours, resolveCoursActivities } from '@/lib/content'
+ import { getCours } from '@/lib/content-loader'
```

**`[parcours]/apprendre/[moduleId]/layout.tsx`** :
```diff
- import { getCours, resolveCoursActivities } from '@/lib/content'
+ import { getCours } from '@/lib/content-loader'
```

**`[parcours]/apprendre/[moduleId]/[activityId]/page.tsx`** :
```diff
- import { getAtom, compileMdx, compileQuiz, findQuizGroup, getCours, resolveCoursActivities } from '@/lib/content'
+ import { getCours, getAtomHtml, getQcmData } from '@/lib/content-loader'

- const atom = getAtom(activityId)
- const content = await compileMdx(atom.content)
+ const html = await getAtomHtml(activityId)

- const quiz = await compileQuiz(quizAtomIds)
+ const questions = await Promise.all(quizAtomIds.map(id => getQcmData(id)))
```

### Etape 7.3 — Migrer les pages serie

**`[parcours]/reviser/serie/[id]/page.tsx`** :
```diff
- import { getSerie, resolveSerieActivities } from '@/lib/content'
+ import { getSerie } from '@/lib/content-loader'
```

**Meme pattern pour** : layout, [activityId]/page, play/page, result/page.

### Etape 7.4 — Migrer le sitemap

```diff
- import { getAllCours, getAllSeries } from '@/lib/content'
+ import { getAllProgrammes, getCatalogue } from '@/lib/content-loader'
```

### Etape 7.5 — Migrer le layout parcours

```diff
- import { getAllProgrammes, getCours } from '@/lib/content'
+ import { getAllProgrammes, getCatalogue } from '@/lib/content-loader'
```

**Critere de validation** : Toutes les pages compilent sans erreur. Navigation complete fonctionne (parcours → module → activite, parcours → serie → activite).

---

## Phase 8 — Cleanup

### Etape 8.1 — Supprimer l'ancien systeme

Fichiers a supprimer :
- `src/lib/content.ts` (420L) — remplace par `content-loader.ts`
- `src/lib/mdx.ts` (56L) — remplace par le pipeline
- `src/lib/schemas/content.ts` (158L) — migre dans le pipeline
- `src/components/content/mdx-components.tsx` (182L) — plus de compilation MDX dans l'app
- `src/components/content/qcm-parts.tsx` (43L) — data carriers, plus necessaires
- `src/components/content/exercise-parts.tsx` (128L) — rendu par le pipeline en HTML
- `src/components/content/lesson-parts.tsx` (167L) — rendu par le pipeline en HTML

> Les extensions interactives restent : `graph.tsx`, `youtube.tsx`, `tvi-explorer/`,
> `variations.tsx`. Elles sont montees par `ContentRenderer`.

### Etape 8.2 — Retirer les dependances de l'app

```diff
# package.json
- "next-mdx-remote": "^6.0.0",
- "gray-matter": "^4.0.3",
- "remark-math": "^6.0.0",
- "rehype-katex": "^7.0.1",
- "katex": "^0.16.28",
- "yaml": "^2.8.2",
```

> `katex` reste si on a besoin du CSS. Sinon le pipeline inline les styles KaTeX.

### Etape 8.3 — Mettre a jour les types

- `src/types/content.ts` — simplifier (retirer les types internes devenus inutiles)
- Utiliser les types generes de `src/generated/types.ts`

**Critere de validation** :
- `npm run type-check` — 0 erreurs
- `npm run lint` — 0 erreurs
- `npm run build` — build reussi
- `npm run content:build` — pipeline OK
- L'app fonctionne identiquement

---

## Phase 9 — Tests de non-regression

### Etape 9.1 — Comparer les sorties

Script qui verifie que le contenu genere par le pipeline produit le meme resultat
que l'ancien systeme :

```
tools/pipeline/test/regression.ts
```

Pour chaque atome :
1. Compiler avec l'ancien `compileMdx()` → HTML ancien
2. Lire le HTML genere par le pipeline → HTML nouveau
3. Comparer (ignorer les differences de whitespace/formatage)

### Etape 9.2 — Comparer les timelines

Pour chaque cours et serie :
1. Calculer la timeline avec l'ancien `resolveCoursActivities()` / `resolveSerieActivities()`
2. Lire le JSON genere par le pipeline
3. Comparer les activites, l'ordre, les IDs, les quiz groups

### Etape 9.3 — Tests visuels

- Naviguer manuellement dans l'app
- Verifier que les lecons, exercices et QCMs s'affichent correctement
- Verifier les composants interactifs (Graph, YouTube, TviExplorer, Variations)
- Verifier le KaTeX (inline et block)

---

## Phase 10 — Integration CI/DX

### Etape 10.1 — Hook pre-build

Ajouter au `npm run build` :

```json
{
  "scripts": {
    "prebuild": "npm run content:build",
    "build": "next build"
  }
}
```

### Etape 10.2 — Watch mode

En dev, le pipeline se relance automatiquement quand un fichier `.mdx` ou `.yaml` change :

```json
{
  "scripts": {
    "dev": "concurrently \"npm run content:watch\" \"next dev --turbopack\""
  }
}
```

### Etape 10.3 — Validation en CI

Le CI verifie que les fichiers generes sont a jour :

```bash
npm run content:build
git diff --exit-code src/generated/
# Si diff → les fichiers generes ne sont pas commites
```

---

## Resume des phases

| Phase | Description | Fichiers crees/modifies | Critere de validation |
|-------|-------------|------------------------|----------------------|
| 0 | Scaffolding pipeline | `tools/pipeline/*`, `src/generated/` | `npm run content:build` s'execute |
| 1 | Lecture + validation | `stages/read-*.ts`, `stages/validate.ts` | 422 atomes + 61 molecules lus, 0 erreurs |
| 2 | Compilation atomes | `stages/compile-*.ts` | 422 HTML/JSON generes, KaTeX OK |
| 3 | Resolution molecules | `stages/resolve-*.ts`, `stages/assemble-*.ts` | JSON cours/series/catalogues OK |
| 4 | Ecriture fichiers | `stages/write-*.ts`, `src/index.ts` | 543+ fichiers dans `src/generated/` |
| 5 | Loader app | `src/lib/content-loader.ts` | Types OK, meme API |
| 6 | ContentRenderer | `src/components/content-renderer.tsx` | Rendu identique |
| 7 | Migration pages | 16 pages dans `src/app/` | Navigation complete OK |
| 8 | Cleanup | Supprimer 7 fichiers, retirer 6 deps | Build clean |
| 9 | Non-regression | `tools/pipeline/test/` | 0 differences |
| 10 | CI/DX | Scripts npm, watch mode | Pipeline automatise |

## Ordre d'execution recommande

```
Phase 0 → Phase 1 → Phase 2 → Phase 3 → Phase 4
                                                 \
                                                  → Phase 5 → Phase 6 → Phase 7 → Phase 8 → Phase 9 → Phase 10
```

Les phases 0-4 (pipeline) sont independantes de l'app.
Les phases 5-8 (migration app) se font ensuite.
Les phases 9-10 (tests + CI) en dernier.

## Estimation de complexite

| Phase | Fichiers | Complexite |
|-------|----------|-----------|
| 0 | 5 | Faible |
| 1 | 3 | Faible |
| 2 | 4 | **Haute** — transformation JSX custom en HTML |
| 3 | 4 | Moyenne |
| 4 | 3 | Faible |
| 5 | 2 | Faible |
| 6 | 2 | Moyenne — hydratation widgets |
| 7 | 16 | Moyenne — beaucoup de fichiers mais diffs simples |
| 8 | 7 suppressions | Faible |
| 9 | 2 | Moyenne |
| 10 | 2 | Faible |

**Point critique** : Phase 2 (compilation). Transformer le JSX custom MDX en HTML
avec un pipeline `unified` est la partie la plus technique. Le reste est du plumbing.
