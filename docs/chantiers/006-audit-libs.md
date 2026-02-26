# Chantier 006 — Audit des librairies contenu

> Objectif : rationaliser les deps du pipeline et du runtime contenu.
> Privilegier des libs simples, polyvalentes, orientees math/EdTech.
>
> **Statut : migration statique terminee.** Les widgets runtime (Graph, Variations, TviExplorer) ont ete remplaces par du SVG Typst compile au build. 4 deps runtime supprimees.

---

## Inventaire actuel

### Pipeline (build-time) — `tools/pipeline/`

| Lib | Role | Notes |
|-----|------|-------|
| `unified` | Moteur de transformation (orchestrateur) | Coeur du pipeline |
| `remark-parse` | Parse Markdown en AST | Plugin unified |
| `remark-math` | Detecte `$...$` et `$$...$$` | Plugin unified |
| `remark-rehype` | Convertit mdast en hast | Plugin unified |
| `rehype-katex` | Compile les expressions math en HTML KaTeX | Plugin unified |
| `rehype-stringify` | Serialise le HTML final | Plugin unified |
| `gray-matter` | Parse le frontmatter YAML des `.mdx` | Seul usage : lire les metadonnees |
| `zod` | Valide les metadonnees des atomes | Utilise aussi ailleurs dans l'app |
| `tsx` | Execute le pipeline TypeScript | devDep CLI |
| `@aspect-ai/typst-ts` | Compile les blocs ` ```typst ` en SVG | WASM, zero binaire externe |

**Note** : pas de `remark-mdx` ni `next-mdx-remote`. Le JSX custom (`<Definition>`, `<Solution>`, etc.) est transforme en HTML via regex avant unified. Les blocs ` ```typst ` sont compiles en SVG via WASM avant le passage unified (placeholders → SVG inline).

### Runtime (client-side) — contenu

| Lib | Role | Ou |
|-----|------|----|
| `katex` | CSS uniquement — le HTML math est pre-rendu au build | `src/content/extensions/math.tsx` |

**Zero JS client pour les figures.** Tous les graphiques et tableaux de variations sont des SVG statiques injectes dans le HTML au build.

### Runtime — application

| Lib | Role |
|-----|------|
| `firebase` / `firebase-admin` | Backend (Auth, Firestore, Functions) |
| `@anthropic-ai/sdk` | SDK Anthropic (verification IA) |
| `@tanstack/react-query` | Data fetching |
| `zustand` | State management |
| `radix-ui` | Primitives UI (via shadcn) |
| `cmdk` | Command palette |
| `sonner` | Toasts |
| `next-pwa` | PWA support |
| `next-themes` | Theme switching |
| `lucide-react` | Icones |

---

## Architecture du pipeline contenu

```
MDX source (contenu auteur)
  │
  │  Texte + LaTeX          →  unified + KaTeX        →  HTML statique
  │  Blocs ```typst          →  Typst WASM → SVG       →  SVG inline dans le HTML
  │  Widgets YouTube         →  marqueurs data-widget   →  hydrates au runtime
  │
  └──→ src/generated/ (HTML + SVG, zero JS pour les figures)
```

### Packages Typst utilises

| Package | Version | Usage |
|---------|---------|-------|
| `@preview/cetz` | 0.3.4 | Figures manuelles (TVI, geometrie) |
| `@preview/cetz-plot` | 0.1.1 | Graphiques de fonctions (axes, courbes, labels) |
| `@preview/vartable` | 0.2.3 | Tableaux de variations et signes |

Les packages sont telecharges automatiquement par Typst au premier `npm run generate`.

---

## Migration realisee

### Widgets supprimes (runtime → build)

| Widget | Atomes concernes | Remplacement Typst |
|--------|-----------------|-------------------|
| `<Graph>` | 7 instances dans 6 atomes | `cetz-plot` : `plot.add(domain, fn)` |
| `<Variations>` | 2 instances dans 2 atomes | `vartable` : `tabvar(variable, label, domain, contents)` |
| `<TviExplorer>` | 1 instance dans 1 atome | `cetz` : figure statique (bezier + droite y=k + point c) |

### Atomes modifies

| Atome | Changement |
|-------|-----------|
| `lesson-fn-variations.mdx` | `<Graph>` → CeTZ-Plot ($x^2$, parabole) |
| `lesson-fn-parite.mdx` | 2x `<Graph>` → CeTZ-Plot ($x^2+1$ paire, $x^3-x$ impaire) |
| `lesson-cont-tvi.mdx` | `<TviExplorer>` → CeTZ figure, `<Variations>` → vartable, `<Graph>` → CeTZ-Plot |
| `lesson-fn-transformations.mdx` | `<Graph>` → CeTZ-Plot ($-(x-2)^2+3$, parabole retournee) |
| `lesson-der-variations.mdx` | `<Graph>` → CeTZ-Plot ($x^3-3x+1$, max/min) |
| `ex-cont-3b.mdx` | `<Graph>` → CeTZ-Plot ($x^2-2x-1$ + points annotes) |
| `ex-cont-3c.mdx` | `<Variations>` → vartable (sign + var, 2 rows) |

### Fichiers supprimes

| Fichier | Lignes | Raison |
|---------|--------|--------|
| `src/content/extensions/graph.tsx` | 305 | Remplace par CeTZ-Plot au build |
| `src/content/extensions/variations.tsx` | 355 | Remplace par vartable au build |
| `src/content/extensions/tvi-explorer.tsx` | 567 | Remplace par figure CeTZ statique |
| `src/components/ui/chart.tsx` | 357 | Boilerplate recharts shadcn, jamais importe |
| `content/atoms/lesson-cont-figure-test.mdx` | 50 | Atome de test prototype, integre dans lesson-cont-tvi |

### Pipeline nettoye

Dans `tools/pipeline/src/stages/compile-mdx.ts`, suppression des regex transforms :
- `<Graph>` → `data-widget="graph"` (supprime)
- `<TviExplorer>` → `data-widget="tvi-explorer"` (supprime)
- `<Variations>` + `<Row>` → `data-widget="variations"` (supprime)

Conserve : YouTube, lesson parts, exercise collapsibles, QCM, Typst blocks.

### Dependencies supprimees

| Lib | Poids estime (gzip) | Impact |
|-----|---------------------|--------|
| `mafs` | ~80 KB | Graphiques interactifs |
| `mathjs` | ~180 KB | Evaluation d'expressions |
| `recharts` | ~200 KB | Tableaux de variations |
| `motion` | ~50 KB | Animations |
| **Total** | **~460 KB JS client** | **50 packages npm retires** |

### Dans `src/content/utils.ts`

- `parseRange()` et `parseList()` supprimes (utilises uniquement par graph.tsx)
- `decodeHtmlEntities()` conserve (utilise par math.tsx)

---

## Bilan

| Metrique | Avant | Apres |
|----------|-------|-------|
| Deps runtime contenu | 4 (mafs, mathjs, recharts, motion) | 0 |
| Extensions runtime | 3 fichiers (~1 230 lignes) | 0 |
| JS client pour figures | ~460 KB | 0 KB |
| Typst dans MDX | 0 | ~175 lignes sur 8 atomes |
| Pipeline Typst | prototype | operationnel (68 atomes, ~3s) |

---

## Etat des extensions contenu

| Extension | Fichier | Statut |
|-----------|---------|--------|
| Math (KaTeX) | `src/content/extensions/math.tsx` | Actif — rendu serveur, CSS client |
| YouTube | `src/content/extensions/youtube.tsx` | Actif — widget hydrate au runtime |
| Graph | supprime | Remplace par Typst CeTZ-Plot |
| Variations | supprime | Remplace par Typst vartable |
| TviExplorer | supprime | Remplace par Typst CeTZ |

---

## Ouvertures

### Interactivite future

L'interactivite (drag, bisection, exploration de parametres) a ete volontairement supprimee. Si le besoin revient :

- **JSXGraph** est le candidat retenu : lib unique pour courbes, geometrie, curseurs interactifs, concue pour l'education mathematique.
- Integration React via composant wrapper `useRef` + `useEffect`.
- A charger en lazy (`dynamic(() => import(...), { ssr: false })`).

### Geometrie

Les figures geometriques (Thales, cercles, transformations) utiliseront le meme pipeline Typst + CeTZ. La syntaxe est deja validee :

```typst
#import "@preview/cetz:0.3.4": canvas, draw
#canvas({
  let A = (0, 0)
  let B = (6, 0)
  let C = (2, 4)
  draw.line(A, B, C, close: true)
  draw.line((1, 2), (4, 2), stroke: (dash: "dashed"))
  draw.content(A, anchor: "north-east", $A$)
})
```

### Questions ouvertes pipeline

- [ ] Le regex preprocessing est-il source de bugs ? (pour l'instant non)
- [ ] Faudrait-il migrer vers `remark-directive` pour un format plus robuste ?
- [ ] `gray-matter` est-il necessaire ou `zod` + un simple yaml parser suffirait ?
