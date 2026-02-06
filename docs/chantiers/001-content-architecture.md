# Chantier 001 — Nouvelle architecture de contenu

**Statut** : Discussion / Design
**Objectif** : Repartir de zero avec une architecture contenu 100% optimisee pour Next.js

---

## Jargon

| Terme | Definition |
|---|---|
| **Atome** | Un fichier MDX = une unite de contenu indivisible (une lesson, un exercice, une question QCM) |
| **Molecule** | Un fichier YAML qui assemble des atomes dans un ordre precis pour creer une vue (page cours, serie de revision) |
| **Tag** | Propriete semantique d'un atome ("de quoi ca parle"). Libre, multiple, intrinseque au contenu. |

---

## Contexte

Le systeme actuel est un portage direct de Flutter :

```
YAML (content/) → build.js (Node.js) → JSON (public/) → Firebase CDN → fetch() HTTP → render
```

**Problemes** :
- Pipeline de build separee (437 lignes, package.json a part, 3 deps)
- Firebase CDN + Remote Config pour du contenu qui est dans le repo
- `fetch()` HTTP pour lire ses propres fichiers
- HTML brut dans du YAML (`<h3>`, `<p>`, `<math>`)
- Tags custom non-standard (`<math>`, `<math-block>`, `<variations>`)

---

## Vision

```
Atomes MDX + Molecules YAML → fs.readFileSync → Server Components → render
```

- **Atomes** : fichiers MDX flat dans `content/atoms/`, un fichier = une activite
- **Molecules** : fichiers YAML dans `content/molecules/`, assemblent les atomes en vues ordonnees
- **Pas de build pipeline**, pas de CDN externe, pas de JSON intermediaire

---

## Architecture atome / molecule

### Principe

Les atomes et les molecules repondent a des questions differentes :

- **Atome** → "Quel est ce contenu ?" (une lesson, un exercice, une question)
- **Molecule** → "Comment presenter ces contenus dans une page ?" (ordre, groupement, sections)

Un atome peut exister sans etre dans aucune molecule (orphelin). Une molecule reference des atomes par ID (= nom de fichier sans extension).

### Structure des fichiers

```
content/
├── atoms/                              # Tous les atomes MDX (flat)
│   ├── lesson-cont-definition.mdx
│   ├── lesson-cont-prolongement.mdx
│   ├── lesson-cont-tvi.mdx
│   ├── ex-cont-01.mdx
│   ├── ex-cont-02.mdx
│   ├── ex-cont-tvi.mdx
│   ├── qcm-cont-polynomes.mdx         # UNE question = UN atome
│   ├── qcm-cont-rationnelle.mdx
│   ├── qcm-cont-operations.mdx
│   ├── qcm-tvi-existence.mdx
│   ├── lesson-der-bases.mdx
│   ├── ex-der-01.mdx
│   └── ...                             # ~150+ fichiers
│
└── molecules/
    ├── cours/                          # Molecules de type "cours" (timelines de module)
    │   ├── continuite.yaml
    │   ├── derivation.yaml
    │   └── fonctions-affines.yaml
    │
    └── series/                         # Molecules de type "serie" (revision thematique)
        ├── tvi-maitrise.yaml
        └── continuite-fondamentaux.yaml
```

---

## Atomes — format MDX

### Convention de nommage

L'ID d'un atome = son nom de fichier sans extension. Convention :

```
{type}-{topic}-{identifiant}.mdx
```

- **type** : `lesson`, `ex`, `qcm`
- **topic** : slug court du sujet (`cont`, `der`, `fn`, `stats`, ...)
- **identifiant** : libre, descriptif, unique

Exemples :
- `lesson-cont-definition.mdx`
- `ex-cont-01.mdx`
- `qcm-cont-polynomes.mdx`
- `qcm-tvi-existence.mdx`

### Tags

Les tags sont des proprietes semantiques libres dans le frontmatter. Ils decrivent de quoi parle l'atome, pas ou il est utilise.

```yaml
tags: [continuite, polynomes, definition]
```

**Regles** :
- Libres (pas d'enum strict pour l'instant)
- Multiples (un atome peut avoir plusieurs tags)
- Semantiques (decrivent le contenu, pas la structure)
- Utiles pour : filtrage admin, recherche, futur moteur de recommandation

L'appartenance a un cours ou une serie est definie par la molecule, pas par les tags.

### Lesson

```mdx
---
type: lesson
title: "Rappel : Continuite en un point"
difficulty: 0
timeMinutes: 3
tags: [continuite, definition, limites]
---

### Definition

Soit $f$ une fonction definie sur un intervalle $I$ et $a \in I$.

On dit que $f$ est **continue en $a$** si :

$$\lim_{x \to a} f(x) = f(a)$$

### Fonctions usuelles continues

- Fonctions polynomiales (sur $\mathbb{R}$)
- Fonctions rationnelles
- $\sqrt{x}$, $|x|$, $\sin x$, $\cos x$

### Operations conservant la continuite

Si $f$ et $g$ sont continues en $a$, alors :
- $f + g$, $f - g$, $f \times g$ sont continues en $a$
- $\frac{f}{g}$ est continue en $a$ si $g(a) \neq 0$
```

### Exercise

```mdx
---
type: exercise
title: Continuite en un point
difficulty: 1
timeMinutes: 5
category: application
tags: [continuite, definition, polynomes]
---

<Enonce>
La fonction $f$ definie par $f(x) = x^2 - 3x + 2$ est-elle continue en $x = 1$ ?
</Enonce>

<Solution>
Oui, $f$ est continue en $x = 1$ car $f$ est une fonction polynomiale, donc continue sur $\mathbb{R}$.

On peut verifier : $\lim_{x \to 1} f(x) = 1 - 3 + 2 = 0 = f(1)$.
</Solution>

<Methode>
Pour montrer la continuite en un point $a$, verifier que $\lim_{x \to a} f(x) = f(a)$.
</Methode>
```

### QCM (une question = un atome)

Chaque question QCM est un fichier MDX independant. La molecule assemble les questions en sessions quiz.

```mdx
---
type: qcm
title: "Continuite des polynomes"
difficulty: 1
timeMinutes: 1
tags: [continuite, polynomes]
---

Une fonction polynome est continue sur :

- [ ] $\mathbb{R}^+$ seulement
- [ ] $\mathbb{R}^*$
- [x] $\mathbb{R}$
- [ ] Un intervalle borne

> Les polynomes sont continus sur tout R, sans exception.
```

**Convention QCM** :
- `[x]` = reponse correcte (checkbox markdown)
- `[ ]` = reponse incorrecte
- `> ...` = explication (blockquote apres les options)
- Un seul `[x]` par defaut. Plusieurs `[x]` = question multi-reponses.

---

## Molecules — format YAML

### Molecule cours (timeline d'un module)

```yaml
# content/molecules/cours/continuite.yaml
title: Continuite
description: "Continuite, prolongement par continuite et TVI"
programme: 3eme-math
trimester: T1
order: 1
estimatedTime: 180
objectives:
  - "Determiner si une fonction est continue en un point"
  - "Calculer un prolongement par continuite"
  - "Appliquer le TVI"

sections:
  - label: "Continuite en un point"
    steps:
      - lesson-cont-definition
      - ex-cont-01
      - quiz:
          - qcm-cont-polynomes
          - qcm-cont-rationnelle
          - qcm-cont-operations

  - label: "Prolongement par continuite"
    steps:
      - lesson-cont-prolongement
      - ex-cont-prolongement

  - label: "TVI"
    steps:
      - lesson-cont-tvi
      - ex-cont-tvi
      - quiz:
          - qcm-tvi-existence
          - qcm-tvi-application
          - qcm-tvi-piege
```

**Regles de la molecule** :
- `steps` = liste ordonnee. Chaque step est soit un **ID d'atome** (string), soit un **quiz** (objet avec liste d'IDs QCM groupes en session).
- `sections` = groupement visuel (accordeons, tabs, etc. dans l'UI)
- `programme` = rattachement au parcours (pour la navigation)

### Molecule serie (revision thematique)

Meme pattern, sans sections :

```yaml
# content/molecules/series/tvi-maitrise.yaml
title: "TVI : maitrise complete"
description: "Approfondir le theoreme des valeurs intermediaires"
difficulty: 2
estimatedMinutes: 50
tags: [continuite, tvi]

steps:
  - lesson-cont-tvi
  - ex-cont-tvi
  - quiz:
      - qcm-tvi-existence
      - qcm-tvi-application
```

### Programmes

Les programmes sont un niveau au-dessus des molecules. Un simple YAML qui liste les molecules cours dans l'ordre :

```yaml
# content/molecules/programmes/3eme-math.yaml
label: "3eme annee - Math"
levelSlug: 3eme
sectionSlug: math
order: 1
color: "#3B82F6"
icon: calculate

cours:
  - continuite
  - derivation
  - generalites-fonctions
```

---

## Composants MDX

Les tags HTML custom actuels deviennent des composants MDX :

| Avant (HTML custom) | Apres (MDX component) |
|---|---|
| `<math>f(x)</math>` | `$f(x)$` (natif remark-math) |
| `<math-block>...</math-block>` | `$$...$$` (natif remark-math) |
| `<variations var="x" ...>` | `<Variations var="x" ...>` |
| `<graph .../>` | `<Graph .../>` |
| `<youtube id="..."/>` | `<YouTube id="..."/>` |

Composants specifiques aux exercices :

| Composant | Role |
|---|---|
| `<Enonce>` | Bloc enonce d'un exercice |
| `<Solution>` | Bloc solution (depliable) |
| `<Methode>` | Bloc methode (optionnel) |
| `<Hint>` | Bloc indice (optionnel) |
| `<Erreurs>` | Bloc erreurs courantes (optionnel) |

```tsx
// src/components/content/mdx-components.tsx
import { Variations } from './variations'
import { Graph } from './graph'
import { YouTube } from './youtube'
import { Enonce, Solution, Methode, Hint, Erreurs } from './exercise-parts'

export const mdxComponents = {
  Variations,
  Graph,
  YouTube,
  Enonce,
  Solution,
  Methode,
  Hint,
  Erreurs,
}
```

---

## Stack technique

| Role | Package | Justification |
|---|---|---|
| Parsing MDX | `next-mdx-remote` | Standard Next.js, Server Components natif |
| Frontmatter | `gray-matter` | Inclus dans next-mdx-remote |
| Math LaTeX | `remark-math` + `rehype-katex` | Standard, remplace `<math>` custom |
| Lecture fichiers | `fs` + `path` (Node.js) | Natif, zero dep |
| Metadata YAML | `yaml` | Pour les molecules et programmes |
| Cache | `React.cache()` | Natif React 19, zero config |

**Deps supprimees** : `glob`, `uuid` (du build pipeline)
**Deps ajoutees** : `next-mdx-remote`, `remark-math`, `rehype-katex`

---

## Couche de lecture (`src/lib/content.ts`)

Un seul fichier qui remplace tout le pipeline + le content-service :

```typescript
// src/lib/content.ts
import fs from 'fs'
import path from 'path'
import { cache } from 'react'
import matter from 'gray-matter'
import yaml from 'yaml'

const CONTENT_DIR = path.join(process.cwd(), 'content')
const ATOMS_DIR = path.join(CONTENT_DIR, 'atoms')
const MOLECULES_DIR = path.join(CONTENT_DIR, 'molecules')

// --- Atomes ---

export const getAllAtoms = cache(() => {
  return fs.readdirSync(ATOMS_DIR)
    .filter(f => f.endsWith('.mdx'))
    .map(f => {
      const raw = fs.readFileSync(path.join(ATOMS_DIR, f), 'utf-8')
      const { data } = matter(raw)
      return { id: f.replace('.mdx', ''), ...data }
    })
})

export const getAtom = cache((id: string) => {
  const raw = fs.readFileSync(path.join(ATOMS_DIR, `${id}.mdx`), 'utf-8')
  const { data: frontmatter, content } = matter(raw)
  return { id, ...frontmatter, content }
})

// --- Molecules ---

export const getMolecule = cache((type: 'cours' | 'series', slug: string) => {
  const filePath = path.join(MOLECULES_DIR, type, `${slug}.yaml`)
  return { slug, ...yaml.parse(fs.readFileSync(filePath, 'utf-8')) }
})

// --- Programmes ---

export const getProgramme = cache((id: string) => {
  const filePath = path.join(MOLECULES_DIR, 'programmes', `${id}.yaml`)
  return { id, ...yaml.parse(fs.readFileSync(filePath, 'utf-8')) }
})
```

---

## Dashboard admin

### Route : `/admin/content`

Ecran local pour visualiser, filtrer et previsualiser les atomes.

```
┌───────────────────────────────────────────────────────┐
│  Admin / Contenu                                      │
├────────────────────────┬──────────────────────────────┤
│                        │                              │
│  Filtres:              │  Preview:                    │
│  [continuite] [tvi]    │                              │
│  [x] lesson            │  ## Definition               │
│  [x] exercise          │                              │
│  [x] qcm              │  Soit $f$ une fonction...    │
│                        │                              │
│  ───────────────────── │  $$\lim_{x\to a} f(x)$$     │
│                        │                              │
│  lesson-cont-def    ● │  ### Fonctions usuelles      │
│  lesson-cont-pro       │  - Polynomiales              │
│  ex-cont-01            │  - Rationnelles              │
│  ex-cont-02            │                              │
│  qcm-cont-poly        │                              │
│  qcm-cont-ratio        │                              │
│  ...                   │                              │
│                        │                              │
│  152 atomes            │                              │
│  8 orphelins           │                              │
└────────────────────────┴──────────────────────────────┘
```

### Fonctionnalites

- **Filtres par tags** : multi-select, affiche les tags utilises avec leur count
- **Filtres par type** : lesson / exercise / qcm (checkboxes)
- **Indicateur orphelin** : atome present dans aucune molecule (point orange)
- **Preview MDX** : rendu avec les memes composants que l'app (KaTeX, Variations, etc.)
- **Compteurs** : total, par type, orphelins
- **Recherche** : filtre texte sur ID et title

### Implementation

- Server Component pour la liste (lit tous les atomes via `fs`)
- Filtrage via search params (`?tags=continuite,tvi&type=lesson`)
- Client Component pour le preview (compile le MDX selectionne)
- Memes composants MDX que l'app principale

---

## Suppression

Tout ce qui est supprime avec cette migration :

```
scripts/content-build/               # Tout le dossier
├── src/build.js                    # 437 lignes
├── src/validate.js                 # 303 lignes (a migrer en script npm racine)
├── src/bump-version.js             # 139 lignes
├── package.json
├── package-lock.json
└── .gitignore

src/lib/services/content-service.ts  # Remplace par content.ts
docs/CONTENT-SYSTEM.md               # Remplace par ce chantier
public/content/                      # N'existe plus
```

**validate.js** est utile — on le migre/adapte en script a la racine pour valider les atomes MDX et les molecules YAML.

---

## Questions ouvertes

### Q1 : Nommage des topics dans les atomes

Le slug topic (`cont`, `der`, `fn`) doit-il etre formalise ? Ou on laisse libre tant que c'est unique ?

### Q2 : Validation des molecules

Comment valider qu'une molecule ne reference pas un atome inexistant ? Script de validation ou check au runtime ?

### Q3 : Hot reload en dev

Est-ce que `next-mdx-remote` + `fs` detecte les changements de fichiers MDX en dev ? Ou faut-il un watcher custom ?

---

## Plan de migration

1. ~~**Phase 1** : Installer les deps (`next-mdx-remote`, `remark-math`, `rehype-katex`, `yaml`)~~ **DONE**
2. ~~**Phase 2** : Creer la structure `content/atoms/` + `content/molecules/`~~ **DONE**
3. ~~**Phase 3** : Creer `src/lib/content.ts` (couche de lecture)~~ **DONE**
4. **Phase 4** : Convertir les YAML actuels en atomes MDX (script de migration) ← **NEXT**
5. **Phase 5** : Creer les molecules YAML a partir des modules existants
6. **Phase 6** : Creer les composants MDX (`Enonce`, `Solution`, `Variations`, etc.)
7. **Phase 7** : Brancher les pages sur le nouveau systeme
8. **Phase 8** : Creer le dashboard admin `/admin/content`
9. **Phase 9** : Supprimer l'ancien pipeline + Firebase CDN
10. **Phase 10** : Migrer/adapter validate.js

---

## Changelog

- **2026-02-06 v4** : Phase 3 done. `src/types/content.ts` + `src/lib/content.ts` crees. TypeScript OK.
- **2026-02-06 v3** : Phase 1+2 done. Deps installees, structure dossiers creee.
- **2026-02-06 v2** : Architecture atome/molecule, tags semantiques, QCM atomique, dashboard admin.
- **2026-02-06 v1** : Version initiale, exploration MDX vs YAML.
