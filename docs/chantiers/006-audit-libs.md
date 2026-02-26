# Chantier 006 — Audit des librairies contenu

> Objectif : rationaliser les deps du pipeline et du runtime contenu.
> Privilegier des libs simples, polyvalentes, orientees math/EdTech.

---

## Inventaire actuel

### Pipeline (build-time) — `tools/pipeline/`

| Lib | Version | Role | Remplacable ? |
|-----|---------|------|---------------|
| `unified` | - | Moteur de transformation de contenu (orchestrateur) | Coeur du pipeline |
| `remark-parse` | - | Parse Markdown en AST | Plugin unified |
| `remark-math` | - | Detecte `$...$` et `$$...$$` dans le Markdown | Plugin unified |
| `remark-rehype` | - | Convertit Markdown AST (mdast) en HTML AST (hast) | Plugin unified |
| `rehype-katex` | - | Compile les expressions math en HTML KaTeX | Plugin unified |
| `rehype-stringify` | - | Serialise le HTML final | Plugin unified |
| `gray-matter` | - | Parse le frontmatter YAML des `.mdx` | Seul usage : lire les metadonnees |
| `zod` | ^4.3 | Valide les metadonnees des atomes | Utilise aussi ailleurs dans l'app |
| `tsx` | - | Execute le pipeline TypeScript (devDep implicite) | Outil CLI |

**Note** : pas de `remark-mdx` ni `next-mdx-remote`. Le JSX custom (`<Definition>`, `<Solution>`, `<Graph>`, etc.) est transforme en HTML via regex avant unified.

### Runtime (client-side)

| Lib | Version | Role | Ou |
|-----|---------|------|----|
| `katex` | ^0.16 | CSS uniquement — le HTML math est pre-rendu au build | `src/content/extensions/math.tsx` |
| `mafs` | ^0.21 | Graphiques de fonctions interactifs | Extension `<Graph>` |
| `mathjs` | ^15.1 | Evaluation d'expressions pour alimenter mafs | Extension `<Graph>` |
| `recharts` | ^2.15 | Tableaux de variations (SVG) | Extension `<Variations>` |
| `motion` | ^12.33 | Animations UI generales | Pas specifique au contenu |

### Autres deps

| Lib | Version | Role |
|-----|---------|------|
| `@anthropic-ai/sdk` | ^0.74 | SDK Anthropic (pas lie au contenu) |
| `firebase` / `firebase-admin` | ^12 / ^13 | Backend |
| `@tanstack/react-query` | ^5.90 | Data fetching |
| `zustand` | ^5.0 | State management |
| `radix-ui` | ^1.4 | Primitives UI (via shadcn) |
| `cmdk` | ^1.1 | Command palette |
| `sonner` | ^2.0 | Toasts |
| `next-pwa` | ^5.6 | PWA support |
| `next-themes` | ^0.4 | Theme switching |
| `lucide-react` | ^0.563 | Icones |

---

## Analyse par contexte d'usage

### 1. Rendu des maths (texte)

**Actuellement** : `rehype-katex` (build) + `katex` CSS (runtime)

- KaTeX est le standard pour le rendu math web, rapide et fiable.
- Le HTML est pre-rendu au build, donc zero JS client pour les maths.
- **Verdict** : garder. Rien de mieux pour du rendu LaTeX statique.

### 2. Graphiques de fonctions

**Actuellement** : `mafs` + `mathjs` (2 libs runtime, JS client)

- `mafs` : lib React pour graphiques mathematiques interactifs (axes, courbes, points).
- `mathjs` : parse et evalue les expressions (`"x^2 + 1"` → fonction JS).
- 2 libs pour un seul besoin.

**Problemes** :
- mafs est une lib de niche avec maintenance incertaine a long terme.
- mathjs est un evaluateur generique (CAS complet) — surdimensionne pour tracer des courbes.
- Tout le rendu se fait cote client (JS lourd).

**Direction retenue** : voir section "Direction choisie" plus bas.

### 3. Tableaux de variations / signes

**Actuellement** : `recharts` (runtime, JS client)

- Recharts est une lib de dashboards/dataviz generique (~200kb). Detournee pour dessiner des tableaux de variations mathematiques.
- Recharts pese lourd pour ce qu'on en fait.

**Direction retenue** : SVG custom compile au build. Voir section "Direction choisie".

### 4. Figures geometriques

**Actuellement** : rien (pas de geometrie dans le contenu actuel).

**Besoin futur** : le programme couvre 4 niveaux (3eme → term). La geometrie (Thales, cercles, transformations, trigonometrie) est inevitable.

**Direction retenue** : voir section "Direction choisie" plus bas.

### 5. Pipeline Markdown

**Actuellement** : unified + 5 plugins + gray-matter + regex preprocessing

- La chaine unified est standard et bien maintenue.
- Le preprocessing regex pour le JSX custom est fragile mais fonctionne.

**Questions ouvertes** :
- [ ] Le regex preprocessing est-il source de bugs ?
- [ ] Faudrait-il migrer vers `remark-directive` pour un format plus robuste ?
- [ ] `gray-matter` est-il necessaire ou `zod` + un simple yaml parser suffirait ?

---

## Direction choisie

### Philosophie

**Maximiser le rendu statique (SVG au build), minimiser le JS client.**

Le contenu pedagogique est par nature statique : une figure de Thales, un tableau de variations, une courbe de reference ne changent pas. Tout ce qui peut etre pre-rendu au build doit l'etre en SVG pur.

Le JS client est reserve aux rares cas ou l'interactivite est essentielle (exploration, manipulation par l'eleve).

### Architecture cible

```
MDX source (contenu auteur)
  │
  │  Texte + LaTeX       →  unified + KaTeX      →  HTML statique
  │  Blocs figure (DSL)  →  DSL math → SVG       →  SVG inline dans le HTML
  │  Widgets interactifs  →  marqueurs data-widget →  hydrates au runtime
  │
  └──→ src/generated/ (HTML + SVG, zero JS pour 90% du contenu)
```

### Stack cible

| Besoin | Actuel | Cible | Quand |
|--------|--------|-------|-------|
| Ecriture math (texte) | KaTeX (build) | **Garder KaTeX** | - |
| Figures statiques (geometrie, courbes de ref) | rien | **DSL math → SVG au build** | Pipeline |
| Tableaux de variations / signes | recharts (runtime) | **SVG custom au build** | Pipeline |
| Graphiques interactifs (exploration) | mafs + mathjs (runtime) | **JSXGraph** (runtime) | Client |

### Repartition build vs runtime

| Type de contenu | Build (SVG statique) | Runtime (JS interactif) |
|-----------------|---------------------|------------------------|
| Figures geometriques (Thales, cercles) | X | |
| Courbes de fonctions de reference | X | |
| Tableaux de variations / signes | X | |
| Courbes interactives (drag, zoom, trace) | | X (JSXGraph) |
| Explorateur TVI (bisection interactive) | | X (JSXGraph) |

---

## DSL math → SVG : comparatif des candidats

### Pourquoi un DSL ?

Le SVG brut est illisible et penible a ecrire pour un auteur de contenu :
```svg
<path d="M 10 80 C 40 10, 65 10, 95 80 S 150 150, 180 80"/>
```

Un DSL math permet d'ecrire avec du vocabulaire mathematique :
```
draw((0,0)--(4,0)--(0,3)--cycle);
label("$A$", (0,0), SW);
```

### Candidats evalues

#### Asymptote

```asymptote
pair A=(0,0), B=(4,0), C=(0,3);
draw(A--B--C--cycle);
draw(A--(A+B)/2, dashed);
label("$A$", A, SW);
label("$B$", B, SE);
label("$C$", C, NW);
```

| Critere | Note |
|---------|------|
| DSL mathematique | Excellent — operations sur les vecteurs, courbes de Bezier, coordonnees natives |
| Sortie SVG | Oui (`-f svg`) |
| Integration Node.js | Binaire C++ externe — necessite installation dans le CI |
| Maturite | Tres mature (utilise dans les publications academiques) |
| Labels LaTeX | Oui natif |
| **Verdict** | DSL de reference, mais la contrainte du binaire C++ complique le CI/CD |

#### Typst

```typst
#import "@preview/cetz:0.3.4": canvas, draw
#canvas({
  draw.line((0,0), (4,0), (0,3), close: true)
  draw.content((0,0), anchor: "north-east", $A$)
  draw.content((4,0), anchor: "north-west", $B$)
  draw.content((0,3), anchor: "south-east", $C$)
})
```

| Critere | Note |
|---------|------|
| DSL mathematique | Bon — syntaxe moderne, claire, support math natif |
| Sortie SVG | Oui natif |
| Integration Node.js | **WASM disponible** (`@aspect-ai/typst-ts`) — tourne dans Node sans binaire |
| Maturite | Jeune mais en forte croissance, alternative serieuse a LaTeX |
| Labels LaTeX | Oui (syntaxe `$...$` integree) |
| Vitesse | ~100ms par figure (vs secondes pour LaTeX) |
| **Verdict** | Meilleur compromis : WASM + rapide + DSL propre |

#### TikZ/PGF (via LaTeX)

| Critere | Note |
|---------|------|
| DSL mathematique | Le plus riche (standard academique mondial) |
| Sortie SVG | Oui (via `dvisvgm`) |
| Integration Node.js | Installation LaTeX complete (~4GB) — lourd pour le CI |
| **Verdict** | Trop lourd pour un pipeline web |

#### Penrose (TypeScript)

| Critere | Note |
|---------|------|
| DSL mathematique | Declaratif ("un triangle inscrit dans un cercle") — unique |
| Sortie SVG | Oui |
| Integration Node.js | Natif TypeScript — zero binaire |
| **Verdict** | Approche interessante mais pas adapte aux figures precises avec coordonnees |

### Recommandation : Typst

**Typst est le meilleur candidat** pour le pipeline :

1. **WASM** → tourne dans Node.js, zero binaire externe, CI/CD trivial
2. **Rapide** → ~100ms par figure, compatible avec un pipeline qui tourne en <1s
3. **DSL propre** → syntaxe moderne, plus accessible qu'Asymptote pour les auteurs
4. **SVG natif** → pas de conversion intermediaire
5. **Math integre** → les labels des figures supportent `$...$` nativement
6. **Ecosysteme** → le package `cetz` (geometrie) est activement maintenu

**Workflow concret :**

```markdown
<!-- lesson-thales.mdx -->

## Theoreme de Thales

<Definition>
Si une droite est parallele a un cote d'un triangle...
</Definition>

​```typst
#import "@preview/cetz:0.3.4": canvas, draw
#canvas({
  let A = (0, 0)
  let B = (6, 0)
  let C = (2, 4)
  let M = (1, 2)       // milieu de [AC]
  let N = (4, 2)       // parallele a (AB)
  draw.line(A, B, C, close: true)
  draw.line(M, N, stroke: (dash: "dashed"))
  draw.content(A, anchor: "north-east", $A$)
  draw.content(B, anchor: "north-west", $B$)
  draw.content(C, anchor: "south", $C$)
  draw.content(M, anchor: "east", $M$)
  draw.content(N, anchor: "west", $N$)
})
​```
```

```
Pipeline (build) :
  1. unified parse le Markdown
  2. Bloc ```typst → compile via WASM → SVG inline
  3. SVG injecte dans le HTML genere

Runtime :
  Zero JS pour cette figure. Juste du HTML + SVG statique.
```

---

## JSXGraph pour l'interactif (runtime)

Pour les rares cas ou l'interactivite est necessaire (exploration de fonctions, TVI, manipulation de parametres), **JSXGraph** remplace mafs + mathjs :

- Lib unique pour courbes, geometrie, curseurs interactifs
- Concu pour l'education mathematique
- Remplace 2 deps (mafs + mathjs) par 1

**Integration React** : composant wrapper avec `useRef` + `useEffect` (JSXGraph manipule le DOM directement).

---

## Bilan des changements

### Deps supprimees

| Lib | Poids estime | Raison |
|-----|-------------|--------|
| `mafs` | ~80kb | Remplace par JSXGraph (runtime) ou SVG statique (build) |
| `mathjs` | ~180kb | Remplace par JSXGraph (runtime) |
| `recharts` | ~200kb | Remplace par SVG custom au build |

### Deps ajoutees

| Lib | Contexte | Raison |
|-----|----------|--------|
| `typst` (WASM) | Pipeline (devDep) | DSL math → SVG au build |
| `jsxgraph` | Runtime (dep) | Interactivite math (courbes, geometrie) |

### Bilan net

- **Runtime** : -3 libs (~460kb JS client), +1 lib (JSXGraph, charge a la demande)
- **Pipeline** : +1 devDep (Typst WASM, build-time uniquement)
- **90% du contenu visuel** passe de JS client a SVG statique

---

## Prochaines etapes

1. [ ] **Prototype Typst** : integrer le WASM dans le pipeline, compiler une figure de test
2. [ ] **Prototype SVG variations** : composant SVG custom pour un tableau de variations
3. [ ] **Prototype JSXGraph** : wrapper React, tracer une courbe interactive
4. [ ] **Mesurer** : bundle size avant/apres sur une page type
5. [ ] **Migrer** extension par extension : Variations → Graph → Figures
