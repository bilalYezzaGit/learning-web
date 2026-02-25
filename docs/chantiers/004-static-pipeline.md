# Chantier 004 — Pipeline statique de contenu

## Constat

L'application fait actuellement du travail lourd **a chaque requete** pour servir du contenu qui ne change jamais entre deux deploiements :

1. Lire 422 fichiers MDX + 61 YAML depuis le filesystem (`fs.readFileSync`)
2. Les parser (gray-matter, yaml, Zod)
3. Compiler le MDX en React (`next-mdx-remote`, remark-math, rehype-katex)
4. Resoudre les molecules (cours → sections → activites, series → steps → activites)
5. Generer les catalogues et timelines

Tout ca pour produire du HTML + JSON qui est **identique pour tous les utilisateurs** et ne change qu'au deploiement.

## Le probleme

| Symptome | Cause |
|----------|-------|
| Build lent | Compilation MDX de 422 atomes a chaque `next build` |
| Runtime I/O | `fs.readFileSync` dans les Server Components |
| Complexite app | `content.ts` (420L), `mdx.ts`, `schemas/content.ts`, 4 composants MDX, 5 extensions, un registre de composants... |
| Dependencies lourdes | `next-mdx-remote`, `gray-matter`, `remark-math`, `rehype-katex`, `katex`, `yaml` — tout ca dans le bundle app |
| Fragilite | Erreur dans un `.mdx` → crash runtime en production |
| Couplage | 16 pages importent directement `@/lib/content` avec `fs` |

## La solution : pipeline de pre-compilation

Separer le **build du contenu** du **build de l'application**.

```
content/                   Pipeline CLI                      App Next.js
├── atoms/*.mdx            (outil Node.js)                   (application web)
├── molecules/
│   ├── cours/*.yaml       ─── parse ──►                     src/generated/
│   ├── series/*.yaml          validate                      ├── programmes.json
│   └── programmes/*.yaml      compile MDX → HTML            ├── catalogues/
│                              resolve molecules              │   ├── 3eme-math.json
│                              assemble catalogues            │   └── ...
│                              generate JSON                  ├── cours/
│                                                             │   └── {slug}.json
│                                                             ├── series/
│                                                             │   └── {slug}.json
│                                                             └── atoms/
│                                                                 ├── {id}.html
│                                                                 └── {id}.json (qcm)
```

### Le pipeline absorbe TOUTE la complexite contenu

| Ce qui migre dans le pipeline | Ce qui disparait de l'app |
|-------------------------------|---------------------------|
| Lecture MDX/YAML (`fs`, `gray-matter`, `yaml`) | `src/lib/content.ts` (420 lignes) |
| Compilation MDX (`next-mdx-remote`, remark/rehype) | `src/lib/mdx.ts` |
| Validation schemas (Zod) | `src/lib/schemas/content.ts` |
| Composants MDX registry | `src/components/content/mdx-components.tsx` |
| Resolution molecules → activites | `resolveCoursActivities`, `resolveSerieActivities` |
| Compilation QCM (parse regex + compile) | `compileQcmContent`, `compileQuiz` |
| Generation catalogues/programmes | Calcul runtime dans chaque page |

### L'app devient un viewer statique + tracker utilisateur

**Avant** (16 pages, chacune fait) :
```tsx
// Server Component — fait du I/O + compilation a chaque requete
const cours = getCours(moduleId)                    // fs.readFileSync
const activities = resolveCoursActivities(moduleId) // fs + parse + resolve
const atom = getAtom(activityId)                    // fs.readFileSync
const content = await compileMdx(atom.content)      // MDX → React (lourd)
```

**Apres** :
```tsx
// Server Component — simple import JSON, zero I/O
import cours from '@/generated/cours/continuite.json'
// ou fetch() depuis public/ si on prefere
```

```tsx
// Client Component — injecte du HTML pre-compile
<article dangerouslySetInnerHTML={{ __html: atomHtml }} />
```

## Ce que ca change pour l'utilisateur final

**Rien.** L'application affiche exactement le meme contenu. La difference est interne :

- Build plus rapide (le pipeline tourne en parallele, une seule fois)
- Pages plus rapides (zero compilation runtime)
- Erreurs de contenu detectees **au build** et pas en production
- App deployee plus legere (moins de dependances)

## Ce qui ne change PAS

- La structure des pages (`src/app/(parcours)/...`)
- Les composants d'interaction (QCM player, Exercise player, navigation)
- Firebase Auth + Firestore (suivi utilisateur)
- Le design system (shadcn/ui, Tailwind)
- Les composants interactifs (Graph, TviExplorer) — ils restent cote client

## Dependances qui quittent l'app

Ces packages migrent dans le pipeline (outil CLI separe) et sortent du `package.json` de l'app :

| Package | Pourquoi il part |
|---------|-----------------|
| `next-mdx-remote` | Compilation MDX → pipeline |
| `gray-matter` | Parse frontmatter → pipeline |
| `remark-math` | Plugin MDX → pipeline |
| `rehype-katex` | Plugin MDX → pipeline |
| `katex` | Rendering LaTeX → pipeline (genere du HTML statique) |
| `yaml` | Parse molecules → pipeline |

> `mathjs`, `recharts`, `mafs` restent dans l'app (composants interactifs client).

## Format de sortie du pipeline

### Atomes — Lecons et exercices

```
src/generated/atoms/lesson-fa-definition.html
```

HTML pre-compile avec toutes les balises KaTeX resolues, les composants
`<Definition>`, `<Example>` etc. rendus en HTML final.

### Atomes — QCM

```json
// src/generated/atoms/qcm-fa-definition.json
{
  "id": "qcm-fa-definition",
  "title": "Definition d'une fonction affine",
  "enonce": "<p>Parmi les fonctions suivantes...</p>",
  "options": [
    "<p>$f(x) = 3x^2 + 1$</p>",
    "<p>$f(x) = 2x - 5$</p>"
  ],
  "correctIndex": 1,
  "explication": "<p>Une fonction affine est de la forme...</p>",
  "timeMinutes": 1
}
```

### Cours

```json
// src/generated/cours/fonctions-affines.json
{
  "slug": "fonctions-affines",
  "title": "Fonctions affines",
  "description": "...",
  "programme": "1ere-tc",
  "trimester": "T3",
  "order": 14,
  "estimatedMinutes": 240,
  "objectives": ["..."],
  "sections": [
    {
      "id": "section-0",
      "label": "Definition et vocabulaire",
      "activities": [
        { "id": "lesson-fa-definition", "type": "lesson", "title": "...", "timeMinutes": 5 },
        { "id": "ex-fa-reconnaissance", "type": "exercise", "title": "...", "timeMinutes": 8 },
        { "id": "quiz-fa-bases", "type": "quiz", "title": "QCM", "timeMinutes": 3,
          "atomIds": ["qcm-fa-definition", "qcm-fa-cas-particuliers"] }
      ]
    }
  ],
  "totalActivities": 14,
  "totalMinutes": 240
}
```

### Series

```json
// src/generated/series/fa-fondamentaux.json
{
  "slug": "fa-fondamentaux",
  "title": "Fonctions affines : les fondamentaux",
  "description": "...",
  "difficulty": 1,
  "estimatedMinutes": 40,
  "tags": ["fonctions-affines"],
  "type": "mono-module",
  "trimestre": 3,
  "modules": ["fonctions-affines"],
  "activities": [
    { "id": "lesson-fa-definition", "type": "lesson", "title": "...", "timeMinutes": 5 },
    { "id": "quiz-fa-bases", "type": "quiz", "title": "QCM", "timeMinutes": 3,
      "atomIds": ["qcm-fa-definition", "qcm-fa-ordonnee-origine"] }
  ],
  "totalActivities": 8,
  "successThreshold": 70
}
```

### Programmes / Catalogues

```json
// src/generated/programmes.json
[
  {
    "id": "3eme-math",
    "label": "3eme annee - Math",
    "levelSlug": "3eme",
    "sectionSlug": "math",
    "order": 1,
    "color": "#3B82F6",
    "icon": "calculate",
    "cours": ["continuite", "derivation", "fonctions"],
    "series": ["continuite-fondamentaux", "tvi-maitrise", "fn-vocabulaire-domaine"]
  }
]
```

```json
// src/generated/catalogues/3eme-math.json
{
  "id": "3eme-math",
  "label": "3eme annee - Math",
  "modules": [
    {
      "slug": "continuite",
      "title": "Continuite",
      "trimester": "T1",
      "totalActivities": 12,
      "estimatedMinutes": 180,
      "activityIds": ["lesson-cont-definition", "ex-cont-..."]
    }
  ],
  "series": [
    {
      "slug": "continuite-fondamentaux",
      "title": "Continuite : les fondamentaux",
      "difficulty": 1,
      "type": "mono-module",
      "trimestre": 1,
      "totalActivities": 6,
      "estimatedMinutes": 35,
      "modules": ["continuite"]
    }
  ]
}
```

## Composants interactifs — le probleme du HTML statique

Les composants comme `<Graph>`, `<TviExplorer>`, `<YouTube>` sont **interactifs** (client-side JS). On ne peut pas les pre-rendre en HTML statique.

### Solution : marqueurs + hydratation cote client

Le pipeline genere des **marqueurs** dans le HTML :

```html
<!-- Pour un graphe -->
<div data-widget="graph" data-props='{"expression":"2*x+1","range":"[-5,5]"}'></div>

<!-- Pour YouTube -->
<div data-widget="youtube" data-props='{"videoId":"abc123","title":"..."}'></div>

<!-- Pour TviExplorer -->
<div data-widget="tvi-explorer"></div>
```

Cote app, un composant `<ContentRenderer>` parse ces marqueurs et hydrate les widgets :

```tsx
// src/components/content-renderer.tsx
'use client'

export function ContentRenderer({ html }: { html: string }) {
  // 1. Injecte le HTML statique
  // 2. Cherche les data-widget
  // 3. Monte les composants React correspondants via createPortal
}
```

Les composants purement statiques (`<Definition>`, `<Property>`, `<Solution>`, etc.)
sont rendus en HTML final par le pipeline — pas besoin d'hydratation.

## Arbre de decision : import vs fetch

| Approche | Pour | Contre |
|----------|------|--------|
| `import` JSON (build-time) | Type-safe, tree-shakeable, optimal | Augmente le bundle si trop gros |
| `fetch` depuis `public/` | Lazy, pas dans le bundle | Requete reseau, pas type-safe |

**Decision** : `import` pour les meta/catalogues (petits JSON), `fetch` pour le HTML des atomes (potentiellement gros).
