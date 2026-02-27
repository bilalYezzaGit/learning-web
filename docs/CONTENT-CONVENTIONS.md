# Convention de contenu

Version 3 — 2026-02-27

Ce document definit les regles strictes d'ecriture du contenu pedagogique. Tout contenu qui ne respecte pas ces regles doit etre corrige. La convention prime sur l'existant.

---

## 1. Atomes — Regles generales

Un atome = un fichier `.mdx` dans `content/{programme}/{module}/`. C'est l'unite indivisible de contenu.

### 1.1 Nommage du fichier (= ID de l'atome)

```
{type}-{topic}-{slug}.mdx
```

| Segment | Regle | Exemples |
|---------|-------|----------|
| `type` | `lesson`, `ex`, `qcm` | Toujours en minuscule |
| `topic` | Slug court du sujet. **Doit correspondre au slug du cours principal.** | `cont`, `der`, `angles`, `algebre` |
| `slug` | Identifiant unique, descriptif, en kebab-case | `definition`, `tvi-direct`, `polynomes-01` |

**Regles** :
- Tout en minuscule, kebab-case uniquement (`a-z`, `0-9`, `-`)
- Pas de suffixes sequentiels ambigus (`3b`, `3c`). Utiliser des noms descriptifs ou des numeros paddes (`01`, `02`)
- Le `topic` est un vocabulaire controle (voir section 6)

**Exemples conformes** :
```
lesson-cont-definition.mdx
lesson-cont-prolongement.mdx
ex-cont-tvi-direct.mdx
ex-cont-polynome-continu.mdx
qcm-der-derivee-somme.mdx
qcm-cont-operations-base.mdx
```

**Exemples non conformes** :
```
ex-cont-3b.mdx            # suffixe ambigu, pas descriptif
qcm-cont-1.mdx            # numero sans contexte
ex-cont-demo-futur.mdx     # contenu placeholder
lesson-test-variations.mdx  # "test" n'est pas un topic valide
```

### 1.2 Frontmatter

Chaque atome a un bloc frontmatter YAML entre `---`. Tous les champs sont obligatoires sauf mention contraire.

```yaml
---
type: lesson | exercise | qcm        # obligatoire
title: "Titre lisible"                # obligatoire, string quotee
difficulty: 0 | 1 | 2 | 3            # obligatoire
timeMinutes: <entier positif>         # obligatoire
tags: [tag1, tag2]                    # obligatoire, >= 1 tag
category: <voir enum>                 # obligatoire si type = exercise
---
```

#### `type`

Trois valeurs possibles. Pas d'alias, pas de variante.

| Valeur | Signification |
|--------|--------------|
| `lesson` | Contenu theorique (definitions, proprietes, methodes) |
| `exercise` | Probleme avec enonce, solution, et optionnellement methode/indices |
| `qcm` | Une seule question a choix multiple |

#### `title`

- Toujours entre guillemets doubles dans le YAML
- Decrit le contenu, pas la position dans un parcours
- Pas de prefixe de type (`"Cours : ..."`, `"Exercice 1"`)
- Pas de numerotation (`"Q1"`, `"Question 3"`)
- Accent sur le sujet mathematique : `"Derivee d'une composee"`, `"Continuite des polynomes"`

**Bon** : `"Application du TVI a une equation"`
**Mauvais** : `"Exercice 3 - TVI"`, `"Notions de base - Q1"`

#### `difficulty`

Echelle fixe de 0 a 3. La difficulte est absolue, pas relative au module.

| Valeur | Signification | Exemple |
|--------|--------------|---------|
| `0` | Rappel / prerequis. L'eleve doit deja savoir ca. | Rappel de la definition de continuite |
| `1` | Application directe. Une seule notion, un seul pas de raisonnement. | Verifier si un polynome est continu en un point |
| `2` | Combinaison. Plusieurs notions ou etapes de raisonnement. | Trouver un prolongement par continuite |
| `3` | Approfondissement. Raisonnement complet, demonstration, synthese. | Demontrer l'existence d'une solution par le TVI + unicite |

#### `timeMinutes`

Temps estime de travail pour un eleve moyen. Entier positif.

| Type | Fourchette typique |
|------|--------------------|
| `lesson` | 3 — 10 |
| `exercise` | 5 — 20 |
| `qcm` | 1 — 2 |

#### `tags`

Liste de tags semantiques. Minimum 1, pas de maximum recommande mais rester raisonnable (2-4 typiquement).

- Les tags decrivent **de quoi parle** l'atome, pas **ou il est utilise**
- Vocabulaire controle (voir section 6)
- Au moins le tag correspondant au `topic` de l'ID

#### `category` (exercices uniquement)

Obligatoire pour `type: exercise`. Interdit pour les autres types.

| Valeur | Signification |
|--------|--------------|
| `application` | Application directe du cours. Une notion, un pas. |
| `approfondissement` | Mobilise plusieurs notions ou techniques. |
| `synthese` | Probleme qui couvre un chapitre entier ou croise des chapitres. |
| `probleme` | Probleme ouvert, modelisation, demonstration longue. |

---

## 2. Atomes — Contenu par type

### 2.1 Lesson

Structure libre en Markdown. Conventions :

- Commencer par `###` (heading 3), jamais `#` ou `##` (reserves au layout de page)
- Les definitions importantes sont en **gras**
- Les formules cles sont en bloc LaTeX (`$$...$$`)
- Pas de composants d'exercice (`<Enonce>`, `<Solution>`) — c'est du cours, pas un exercice
- Composants de structure : `<Definition>`, `<Theorem>`, `<Property>`, `<Example>`, `<Remark>`, `<Attention>`
- Composants enrichis : `<Graph>`, `<Variations>`, `<YouTube>`

```mdx
---
type: lesson
title: "Continuite en un point"
difficulty: 0
timeMinutes: 3
tags: [continuite, definition]
---

### Definition

Soit $f$ une fonction definie sur un intervalle $I$ et $a \in I$.

On dit que $f$ est **continue en $a$** si :

$$\lim_{x \to a} f(x) = f(a)$$
```

### 2.2 Exercise

Structure obligatoire avec composants MDX :

```mdx
<Enonce>
Texte de l'enonce. Peut contenir du LaTeX, des listes, etc.
</Enonce>

<Solution>
Solution detaillee.
</Solution>
```

Composants optionnels (apres `<Solution>`) :

```mdx
<Methode>
Rappel de la methode generale applicable.
</Methode>

<Hint>
Indication pour aider l'eleve a demarrer.
</Hint>

<Erreurs>
Erreurs frequentes a eviter.
</Erreurs>
```

**Regles** :
- `<Enonce>` et `<Solution>` sont **obligatoires**
- `<Methode>`, `<Hint>`, `<Erreurs>` sont optionnels
- Ordre strict : Enonce → Solution → Methode → Hint → Erreurs
- Pas de contenu hors des composants (pas de texte "flottant" avant ou apres)
- Un seul `<Enonce>`, un seul `<Solution>` par atome

### 2.3 QCM

Une seule question par atome. Format composants MDX :

```mdx
---
type: qcm
title: "Continuite des polynomes"
difficulty: 1
timeMinutes: 1
tags: [continuite, polynomes]
---

<Question>
Une fonction polynome est continue sur :
</Question>

<Option>$\mathbb{R}^+$ seulement</Option>
<Option>$\mathbb{R}^*$</Option>
<Option correct>$\mathbb{R}$</Option>
<Option>Un intervalle borne</Option>

<Explanation>
Les polynomes sont continus sur tout $\mathbb{R}$, sans exception.
</Explanation>
```

**Regles** :
- `<Question>` obligatoire, une seule, contient l'enonce
- De **2 a 5 `<Option>`**, une seule avec l'attribut `correct`
- `<Explanation>` obligatoire, une seule, contient l'explication pedagogique
- Ordre strict : Question → Options → Explanation
- Pas de contenu hors des composants
- L'explication doit etre pedagogique, pas juste "C'est la bonne reponse"

---

## 3. Molecules

Les molecules sont des fichiers YAML dans `content/{programme}/{module}/_molecules/`. Elles assemblent des atomes en vues ordonnees.

### 3.0 Structure des repertoires

```
content/
├── 3eme-math/                          # programme (contient _programme.yaml)
│   ├── _programme.yaml                 # metadata du programme
│   ├── continuite/                     # module
│   │   ├── _molecules/
│   │   │   ├── continuite.yaml         # cours (kind: cours)
│   │   │   ├── continuite-fondamentaux.yaml  # serie (kind: serie)
│   │   │   └── tvi-maitrise.yaml       # serie (kind: serie)
│   │   ├── lesson-cont-definition.mdx
│   │   ├── ex-cont-1.mdx
│   │   └── qcm-cont-1.mdx
│   ├── derivation/
│   │   ├── _molecules/
│   │   └── *.mdx
│   └── fonctions/
│       ├── _molecules/
│       └── *.mdx
├── 2nde-math/                          # futur programme
│   └── ...
```

Le pipeline decouvre automatiquement les programmes (repertoires contenant `_programme.yaml`), les modules (sous-repertoires sans prefixe `_`), les atomes (`.mdx` dans les modules), et les molecules (`.yaml` dans `_molecules/`).

### 3.1 Molecule Cours

Fichier : `content/{programme}/{module}/_molecules/{slug}.yaml`

```yaml
kind: cours                             # obligatoire, discriminant
visible: true                           # optionnel, defaut: true
title: "Continuite"                     # obligatoire
description: "Description courte"       # obligatoire
trimester: T1 | T2 | T3                # obligatoire
order: 1                                # obligatoire, position dans le programme
estimatedMinutes: 180                   # obligatoire, en minutes
objectives:                             # obligatoire, >= 1
  - "Objectif 1"
  - "Objectif 2"

sections:                               # obligatoire, >= 1 section
  - label: "Continuite en un point"     # obligatoire
    steps:                              # obligatoire, >= 1 step
      - lesson-cont-definition          # ID d'atome (string)
      - ex-cont-application-directe
      - quiz:                           # Groupe QCM
          - qcm-cont-polynomes
          - qcm-cont-operations
```

**Regles** :
- `kind: cours` est obligatoire (discriminant avec les series)
- `visible: true` par defaut. Mettre `false` pour un brouillon non publie
- Plus de champ `programme:` — le programme est deduit de la hierarchie de repertoires
- Chaque section a un `label` et des `steps`
- Un step est soit un ID d'atome (string), soit un objet `quiz:` avec une liste d'IDs QCM
- Un groupe `quiz` contient entre 2 et 5 questions QCM
- L'ordre des steps definit la sequence pedagogique
- Tous les IDs d'atomes references doivent exister dans le module correspondant

### 3.2 Molecule Serie

Fichier : `content/{programme}/{module}/_molecules/{slug}.yaml`

```yaml
kind: serie                             # obligatoire, discriminant
visible: true                           # optionnel, defaut: true
title: "TVI : maitrise complete"       # obligatoire
description: "Description courte"       # obligatoire
difficulty: 1 | 2 | 3                  # obligatoire
estimatedMinutes: 50                    # obligatoire
tags: [continuite, tvi]                 # obligatoire, >= 1 tag

steps:                                  # obligatoire, >= 2 steps
  - lesson-cont-tvi
  - ex-cont-tvi-direct
  - quiz:
      - qcm-cont-tvi-existence
      - qcm-cont-tvi-application
type: mono-module                       # optionnel, defaut: mono-module
trimestre: 1                            # obligatoire (1, 2, ou 3)
modules: [continuite]                   # optionnel, modules associes
priority: 0                             # optionnel, defaut: 0
```

**Regles** :
- `kind: serie` est obligatoire (discriminant avec les cours)
- `visible: true` par defaut. Mettre `false` pour un brouillon non publie
- Pas de sections (liste plate de steps)
- Une serie est thematique : elle cible un sujet precis
- Minimum 2 steps (sinon ce n'est pas une serie)
- Les tags decrivent le sujet de la serie

### 3.3 Programme

Fichier : `content/{id}/_programme.yaml`

```yaml
label: "3eme annee - Math"             # obligatoire
levelSlug: 3eme                        # obligatoire
sectionSlug: math                      # obligatoire
order: 1                                # obligatoire
color: "#3B82F6"                        # obligatoire, hex
icon: calculate                         # obligatoire
visible: true                           # optionnel, defaut: true
```

**Regles** :
- L'ID du programme (nom du repertoire) correspond au slug de parcours
- Plus de listes `cours:` et `series:` — le pipeline les decouvre automatiquement en scannant les `_molecules/` des sous-modules
- Les cours sont tries par `order`, les series par `priority`
- `visible: true` par defaut. Mettre `false` pour un programme non publie

### 3.4 Flag `visible`

Le flag `visible` est present sur les programmes, cours, et series. Il permet un workflow draft/publish :

| Valeur | Signification |
|--------|--------------|
| `true` (defaut) | Contenu publie, visible dans l'UI |
| `false` | Brouillon, present dans le generated output mais filtre cote UI |

Le flag est propage dans tout le generated output (`programmes.json`, `cours/{slug}.json`, `series/{slug}.json`, `catalogues/{id}.json`).

---

## 4. LaTeX

Tout le contenu mathematique utilise la syntaxe LaTeX standard.

| Contexte | Syntaxe |
|----------|---------|
| Inline | `$f(x) = x^2$` |
| Bloc | `$$\lim_{x \to a} f(x) = f(a)$$` |

**Regles** :
- Pas de balises HTML (`<math>`, `<math-block>`) — syntaxe LaTeX native uniquement
- Bloc LaTeX (`$$`) toujours sur ses propres lignes (ligne vide avant et apres)
- Pas d'espace entre `$` et le contenu : `$f(x)$` et non `$ f(x) $`
- Utiliser `\text{}` pour le texte dans les formules : `$f \text{ est continue}$`

---

## 5. Composants MDX — Reference detaillee

Seuls les composants listes ci-dessous sont autorises dans le contenu MDX. Tout autre composant est interdit (pas de `<Geogebra>`, `<Simulation>`, `<Manim>`, etc.).

### 5.1 Exercice

#### `<Enonce>`

Enonce de l'exercice. Contient la question posee a l'eleve.

| Propriete | Valeur |
|-----------|--------|
| **Props** | `children` (contenu MDX) |
| **Obligatoire** | Oui |
| **Types autorises** | `exercise` |
| **Rendu** | Bloc visible directement, sans collapse |

**Exemple** :
```mdx
<Enonce>
Soit $f(x) = x^2 - 3x + 2$. Determiner les racines de $f$.
</Enonce>
```

#### `<Solution>`

Solution detaillee de l'exercice. Masquee par defaut, l'eleve clique pour reveler.

| Propriete | Valeur |
|-----------|--------|
| **Props** | `children` (contenu MDX) |
| **Obligatoire** | Oui |
| **Types autorises** | `exercise` |
| **Rendu** | Bloc `<details>` vert avec icone, collapse ferme par defaut |

**Exemple** :
```mdx
<Solution>
On cherche les racines : $\Delta = 9 - 8 = 1 > 0$.

$$x_1 = \frac{3 - 1}{2} = 1 \quad ; \quad x_2 = \frac{3 + 1}{2} = 2$$
</Solution>
```

#### `<Methode>`

Rappel de la methode generale applicable a ce type d'exercice.

| Propriete | Valeur |
|-----------|--------|
| **Props** | `children` (contenu MDX) |
| **Obligatoire** | Non |
| **Types autorises** | `exercise` |
| **Rendu** | Bloc `<details>` bleu avec icone livre, collapse ferme par defaut |

**Exemple** :
```mdx
<Methode>
Pour trouver les racines d'un polynome du second degre $ax^2 + bx + c$ :

1. Calculer le discriminant $\Delta = b^2 - 4ac$
2. Si $\Delta > 0$ : deux racines $x_{1,2} = \frac{-b \pm \sqrt{\Delta}}{2a}$
</Methode>
```

#### `<Hint>`

Indication pour aider l'eleve a demarrer sans donner la solution.

| Propriete | Valeur |
|-----------|--------|
| **Props** | `children` (contenu MDX) |
| **Obligatoire** | Non |
| **Types autorises** | `exercise` |
| **Rendu** | Bloc `<details>` ambre avec icone ampoule, collapse ferme par defaut |

**Exemple** :
```mdx
<Hint>
Pensez a calculer le discriminant d'abord.
</Hint>
```

#### `<Erreurs>`

Erreurs frequentes que les eleves commettent sur ce type d'exercice.

| Propriete | Valeur |
|-----------|--------|
| **Props** | `children` (contenu MDX) |
| **Obligatoire** | Non |
| **Types autorises** | `exercise` |
| **Rendu** | Bloc `<details>` rouge avec icone alerte, collapse ferme par defaut |

**Exemple** :
```mdx
<Erreurs>
- Oublier de verifier le signe du discriminant avant d'appliquer la formule
- Confondre $-b$ avec $b$ dans la formule
</Erreurs>
```

### 5.2 QCM

#### `<Question>`

Enonce de la question QCM. Contient le texte de la question posee.

| Propriete | Valeur |
|-----------|--------|
| **Props** | `children` (contenu MDX) |
| **Obligatoire** | Oui |
| **Types autorises** | `qcm` |
| **Rendu** | Data carrier — le contenu est extrait par le parser, pas rendu directement |

**Exemple** :
```mdx
<Question>
La derivee de $f(x) = x^3$ est :
</Question>
```

#### `<Option>`

Une option de reponse dans un QCM. De 2 a 5 par atome, une seule avec `correct`.

| Propriete | Valeur |
|-----------|--------|
| **Props** | `children` (contenu MDX), `correct` (boolean, optionnel) |
| **Obligatoire** | Oui (2 a 5) |
| **Types autorises** | `qcm` |
| **Rendu** | Data carrier — extrait par le parser |

**Exemple** :
```mdx
<Option>$x^2$</Option>
<Option correct>$3x^2$</Option>
<Option>$3x^3$</Option>
<Option>$x^4$</Option>
```

#### `<Explanation>`

Explication pedagogique de la bonne reponse. Affichee apres que l'eleve a repondu.

| Propriete | Valeur |
|-----------|--------|
| **Props** | `children` (contenu MDX) |
| **Obligatoire** | Oui |
| **Types autorises** | `qcm` |
| **Rendu** | Data carrier — extrait par le parser |

**Exemple** :
```mdx
<Explanation>
On applique la regle $(x^n)' = nx^{n-1}$, donc $(x^3)' = 3x^2$.
</Explanation>
```

### 5.3 Contenu enrichi

#### `<Graph>`

Affiche le graphe d'une fonction mathematique avec des axes et une grille.

| Propriete | Valeur |
|-----------|--------|
| **Props** | `function` ou `fn` (expression), `range` (intervalle x), `yRange` ou `y-range` (intervalle y, optionnel), `points` (points remarquables, optionnel), `hideFormula` ou `hide-formula` (boolean, optionnel) |
| **Obligatoire** | Non |
| **Types autorises** | `lesson`, `exercise` |
| **Rendu** | Graphique interactif (Recharts) avec axes, grille, et courbe |

**Exemple** :
```mdx
<Graph function="x^2 - 1" range="[-3, 3]" yRange="[-2, 8]" />
```

#### `<Variations>` + `<Row>`

Tableau de variations d'une fonction (signe de la derivee + variations de f).

| Propriete | Valeur |
|-----------|--------|
| **Props (Variations)** | `var` (variable, defaut `"x"`), `intervals` (bornes du tableau) |
| **Props (Row)** | `label` (nom de la ligne), `kind` (`"sign"` ou `"var"`), `values` (valeurs entre les bornes) |
| **Obligatoire** | Non |
| **Types autorises** | `lesson`, `exercise` |
| **Rendu** | Tableau de variations formate avec fleches et signes |

**Exemple** :
```mdx
<Variations var="x" intervals="[-∞, -1, 2, +∞]">
  <Row label="f'(x)" kind="sign" values="[+, 0, -, 0, +]" />
  <Row label="f(x)" kind="var" values="[-∞, ↗, 3, ↘, -1, ↗, +∞]" />
</Variations>
```

#### `<YouTube>`

Integre une video YouTube. Rendu responsive avec ratio 16:9.

| Propriete | Valeur |
|-----------|--------|
| **Props** | `id` (ID de la video YouTube), `title` (titre accessible, optionnel) |
| **Obligatoire** | Non |
| **Types autorises** | `lesson` |
| **Rendu** | iframe YouTube responsive |

**Exemple** :
```mdx
<YouTube id="dQw4w9WgXcQ" title="Introduction a la continuite" />
```

### 5.4 Lesson Parts

Composants de structure pour les lecons. Toujours visibles (pas de collapse). Definis dans `src/components/content/lesson-parts.tsx`.

#### `<Definition>`

Definition formelle d'un concept mathematique.

| Propriete | Valeur |
|-----------|--------|
| **Props** | `children` (contenu MDX), `title` (string, optionnel — defaut : "Definition") |
| **Obligatoire** | Non |
| **Types autorises** | `lesson` |
| **Rendu** | Bloc `<aside>` indigo avec icone BookText, toujours visible |

**Exemple** :
```mdx
<Definition title="Continuite en un point">
On dit que $f$ est **continue en $a$** si $\lim_{x \to a} f(x) = f(a)$.
</Definition>
```

#### `<Theorem>`

Enonce d'un theoreme.

| Propriete | Valeur |
|-----------|--------|
| **Props** | `children` (contenu MDX), `title` (string, optionnel — defaut : "Theoreme") |
| **Obligatoire** | Non |
| **Types autorises** | `lesson` |
| **Rendu** | Bloc `<aside>` violet avec icone ShieldCheck, toujours visible |

**Exemple** :
```mdx
<Theorem title="Theoreme des valeurs intermediaires">
Soit $f$ continue sur $[a, b]$. Pour tout $k$ entre $f(a)$ et $f(b)$, il existe $c \in [a, b]$ tel que $f(c) = k$.
</Theorem>
```

#### `<Property>`

Propriete ou corollaire.

| Propriete | Valeur |
|-----------|--------|
| **Props** | `children` (contenu MDX), `title` (string, optionnel — defaut : "Propriete") |
| **Obligatoire** | Non |
| **Types autorises** | `lesson` |
| **Rendu** | Bloc `<aside>` sky avec icone Puzzle, toujours visible |

**Exemple** :
```mdx
<Property title="Corollaire du TVI">
Si $f(a) \times f(b) < 0$, alors il existe $c$ tel que $f(c) = 0$.
</Property>
```

#### `<Example>`

Exemple travaille avec solution detaillee.

| Propriete | Valeur |
|-----------|--------|
| **Props** | `children` (contenu MDX), `title` (string, optionnel — defaut : "Exemple") |
| **Obligatoire** | Non |
| **Types autorises** | `lesson` |
| **Rendu** | Bloc `<aside>` emerald avec icone PenLine, toujours visible |

**Exemple** :
```mdx
<Example title="Application du TVI">
Montrer que $x^3 - 3x + 1 = 0$ admet une solution dans $[0, 1]$.
</Example>
```

#### `<Remark>`

Note pedagogique ou precision importante.

| Propriete | Valeur |
|-----------|--------|
| **Props** | `children` (contenu MDX), `title` (string, optionnel — defaut : "Remarque") |
| **Obligatoire** | Non |
| **Types autorises** | `lesson` |
| **Rendu** | Bloc `<aside>` amber avec icone Info, toujours visible |

**Exemple** :
```mdx
<Remark>
Le TVI garantit l'existence, pas l'unicite.
</Remark>
```

#### `<Attention>`

Piege ou erreur courante a eviter.

| Propriete | Valeur |
|-----------|--------|
| **Props** | `children` (contenu MDX), `title` (string, optionnel — defaut : "Attention") |
| **Obligatoire** | Non |
| **Types autorises** | `lesson` |
| **Rendu** | Bloc `<aside>` rose avec icone TriangleAlert, toujours visible |

**Exemple** :
```mdx
<Attention>
Ne jamais oublier de verifier la continuite avant d'appliquer le TVI !
</Attention>
```

---

## 6. Extensibilite — Ajouter un nouveau composant

### Ou vivent les composants

```
src/
├── components/content/
│   ├── exercise-parts.tsx      # Enonce, Solution, Methode, Hint, Erreurs
│   ├── lesson-parts.tsx        # Definition, Theorem, Property, Example, Remark, Attention
│   ├── qcm-parts.tsx           # Question, Option, Explanation
│   └── mdx-components.tsx      # Registre central
└── content/extensions/
    ├── graph.tsx                # Graph
    ├── youtube.tsx              # YouTube
    └── variations.tsx           # VariationsTable
```

### Le registre MDX

Tous les composants disponibles dans le contenu MDX sont enregistres dans `src/components/content/mdx-components.tsx`. Ce fichier exporte un objet `mdxComponents` passe a `compileMDX()`.

### Procedure pour ajouter un nouveau composant

1. **Creer le composant** dans `src/components/content/` (partie structurelle) ou `src/content/extensions/` (rendu visuel riche)
2. **Creer un adaptateur** dans `mdx-components.tsx` si les props MDX different des props du composant
3. **Enregistrer** dans l'objet `mdxComponents` de `mdx-components.tsx`
4. **Documenter** dans la section 5 de ce document (description, props, rendu, exemple, types autorises)

Un composant non documente ici est considere comme non autorise dans le contenu.

---

## 7. Vocabulaire controle

### 7.1 Topics (segment d'ID)

Le topic dans l'ID de l'atome est un slug court. Chaque topic correspond a un cours.

| Topic | Cours associe |
|-------|--------------|
| `cont` | Continuite |
| `der` | Derivation |
| `fn` | Fonctions (generalites) |
| `angles` | Angles |
| `thales` | Thales |
| `trigo` | Rapports trigonometriques |
| `vt` | Vecteurs et translations |
| `sv` | Somme de vecteurs |
| `repere` | Repere |
| `qt` | Quart de tour |
| `ss` | Sections de solides |
| `num1` | Calcul numerique 1 |
| `num2` | Calcul numerique 2 |
| `algebre` | Algebre |
| `fl` | Fonctions lineaires |
| `ei` | Equations et inequations |
| `fa` | Fonctions affines |
| `sys` | Systemes |
| `stat` | Statistiques |

Pour ajouter un nouveau topic : l'ajouter a ce tableau et creer le cours correspondant.

### 7.2 Tags

Les tags sont semantiques et libres, mais doivent rester dans le vocabulaire existant autant que possible. Avant de creer un nouveau tag, verifier qu'un tag existant ne couvre pas deja le concept.

**Convention de nommage des tags** :
- Tout en minuscule, kebab-case
- Substantifs ou concepts, pas de verbes
- Suffisamment specifique : `tvi` plutot que `theoreme`
- Pas de tag redondant avec le type (`cours`, `exercice`, `qcm` ne sont pas des tags)

---

## 8. Markdown

### Headings

- `###` (h3) pour les titres de section dans les lessons
- `####` (h4) pour les sous-sections
- Jamais `#` ou `##` (reserves au layout de la page)

### Listes

- Listes a puces avec `-`
- Listes numerotees avec `1.`, `2.`, etc.
- Pas de listes imbriquees a plus de 2 niveaux

### Emphase

- **Gras** pour les termes definis et les mots cles importants
- *Italique* pour les remarques et nuances
- Pas de soulignement, pas de MAJUSCULES pour l'emphase

### Lignes vides

- Une ligne vide avant et apres chaque bloc (heading, formule, liste, composant)
- Pas de double ligne vide

---

## 9. Checklist de validation

Un atome est valide si :

- [ ] L'ID suit le format `{type}-{topic}-{slug}` avec un topic du vocabulaire controle
- [ ] Le frontmatter contient tous les champs obligatoires
- [ ] `type` est `lesson`, `exercise` ou `qcm`
- [ ] `difficulty` est 0, 1, 2 ou 3
- [ ] `timeMinutes` est un entier positif dans la fourchette du type
- [ ] `tags` contient au moins 1 tag
- [ ] `category` est present si et seulement si `type: exercise`
- [ ] Le contenu suit la structure obligatoire du type (voir section 2)
- [ ] Les exercises ont `<Enonce>` et `<Solution>`
- [ ] Les QCM ont `<Question>`, de 2 a 5 `<Option>` (une seule avec `correct`), et `<Explanation>`
- [ ] Le LaTeX utilise `$...$` et `$$...$$` (pas de balises HTML)
- [ ] Les headings commencent a `###`
- [ ] Pas de composants non autorises
- [ ] Tout nouveau composant est documente dans la section 5
