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
- Pas de directives d'exercice (`:::enonce`, `:::solution`) — c'est du cours, pas un exercice
- Directives de structure : `:::definition[Titre]`, `:::theorem[Titre]`, `:::property[Titre]`, `:::example[Titre]`, `:::remark`, `:::attention[Titre]`
- Contenu enrichi : blocs Typst (` ```typst `) pour graphiques (`cetz-plot`) et tableaux de variations (`vartable`), `::youtube{id="..." title="..."}`

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

Structure obligatoire avec directives :

```mdx
:::enonce
Texte de l'enonce. Peut contenir du LaTeX, des listes, etc.
:::

:::solution
Solution detaillee.
:::
```

Directives optionnelles (apres `:::solution`) :

```mdx
:::methode
Rappel de la methode generale applicable.
:::

:::hint
Indication pour aider l'eleve a demarrer.
:::

:::erreurs
Erreurs frequentes a eviter.
:::
```

**Regles** :
- `:::enonce` et `:::solution` sont **obligatoires**
- `:::methode`, `:::hint`, `:::erreurs` sont optionnels
- Ordre strict : enonce → solution → methode → hint → erreurs
- Pas de contenu hors des directives (pas de texte "flottant" avant ou apres)
- Un seul `:::enonce`, un seul `:::solution` par atome

### 2.3 QCM

Une seule question par atome. Format directives :

```mdx
---
type: qcm
title: "Continuite des polynomes"
difficulty: 1
timeMinutes: 1
tags: [continuite, polynomes]
---

:::question
Une fonction polynome est continue sur :
:::

:::option
$\mathbb{R}^+$ seulement
:::

:::option
$\mathbb{R}^*$
:::

:::option{correct}
$\mathbb{R}$
:::

:::option
Un intervalle borne
:::

:::explanation
Les polynomes sont continus sur tout $\mathbb{R}$, sans exception.
:::
```

**Regles** :
- `:::question` obligatoire, une seule, contient l'enonce
- De **2 a 5 `:::option`**, une seule avec l'attribut `{correct}`
- `:::explanation` obligatoire, une seule, contient l'explication pedagogique
- Ordre strict : question → options → explanation
- Pas de contenu hors des directives
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
│   │   │   ├── continuite.yaml         # livret cours (kind: livret)
│   │   │   ├── continuite-fondamentaux.yaml  # livret serie (kind: livret)
│   │   │   └── tvi-maitrise.yaml       # livret serie (kind: livret)
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

Le pipeline decouvre automatiquement les programmes (repertoires contenant `_programme.yaml`), les modules (sous-repertoires sans prefixe `_`), les atomes (`.mdx` dans les modules), et les molecules/livrets (`.yaml` dans `_molecules/`).

### 3.1 Molecule Livret

Tous les livrets utilisent `kind: livret`. Il n'y a plus de distinction `cours`/`serie` — un livret est simplement un assemblage ordonne d'atomes organise en sections.

Fichier : `content/{programme}/{module}/_molecules/{slug}.yaml`

```yaml
kind: livret                            # obligatoire, toujours "livret"
visible: true                           # optionnel, defaut: true
title: "Continuite"                     # obligatoire
description: "Description courte"       # obligatoire
trimester: T1 | T2 | T3                # obligatoire
order: 1                                # obligatoire, position dans le programme
estimatedMinutes: 180                   # optionnel, auto-calcule si absent
objectives:                             # optionnel, defaut: []
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
- `kind: livret` est obligatoire
- `visible: true` par defaut. Mettre `false` pour un brouillon non publie
- Plus de champ `programme:` — le programme est deduit de la hierarchie de repertoires
- Chaque section a un `label` et des `steps`
- Un step est soit un ID d'atome (string), soit un objet `quiz:` avec une liste d'IDs QCM
- Un groupe `quiz` contient entre 2 et 5 questions QCM
- L'ordre des steps definit la sequence pedagogique
- Tous les IDs d'atomes references doivent exister dans le module correspondant
- `estimatedMinutes` est optionnel : si absent, le pipeline le calcule comme somme des `timeMinutes` des atomes
- `objectives` est optionnel (defaut : liste vide)

### 3.2 Programme

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
- Plus de listes `cours:` et `series:` — le pipeline decouvre automatiquement les livrets en scannant les `_molecules/` des sous-modules
- Les livrets sont tries par `order`
- `visible: true` par defaut. Mettre `false` pour un programme non publie

### 3.3 Flag `visible`

Le flag `visible` est present sur les programmes et les livrets. Il permet un workflow draft/publish :

| Valeur | Signification |
|--------|--------------|
| `true` (defaut) | Contenu publie, visible dans l'UI |
| `false` | Brouillon, present dans le generated output mais filtre cote UI |

Le flag est propage dans tout le generated output (`programmes.json`, `livrets/{slug}.json`, `catalogues/{id}.json`).

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

## 5. Directives MDX — Reference detaillee

Toute la syntaxe de contenu utilise `remark-directive` (syntaxe `:::directive`). Seules les directives listees ci-dessous sont autorisees. Tout autre nom de directive est interdit.

### 5.1 Exercice

#### `:::enonce`

Enonce de l'exercice. Contient la question posee a l'eleve.

| Propriete | Valeur |
|-----------|--------|
| **Attributs** | aucun |
| **Obligatoire** | Oui |
| **Types autorises** | `exercise` |
| **Rendu** | Bloc visible directement, sans collapse |

**Exemple** :
```mdx
:::enonce
Soit $f(x) = x^2 - 3x + 2$. Determiner les racines de $f$.
:::
```

#### `:::solution`

Solution detaillee de l'exercice. Masquee par defaut, l'eleve clique pour reveler.

| Propriete | Valeur |
|-----------|--------|
| **Attributs** | aucun |
| **Obligatoire** | Oui |
| **Types autorises** | `exercise` |
| **Rendu** | Bloc `<details>` vert avec icone, collapse ferme par defaut |

**Exemple** :
```mdx
:::solution
On cherche les racines : $\Delta = 9 - 8 = 1 > 0$.

$$x_1 = \frac{3 - 1}{2} = 1 \quad ; \quad x_2 = \frac{3 + 1}{2} = 2$$
:::
```

#### `:::methode`

Rappel de la methode generale applicable a ce type d'exercice.

| Propriete | Valeur |
|-----------|--------|
| **Attributs** | aucun |
| **Obligatoire** | Non |
| **Types autorises** | `exercise` |
| **Rendu** | Bloc `<details>` bleu avec icone livre, collapse ferme par defaut |

**Exemple** :
```mdx
:::methode
Pour trouver les racines d'un polynome du second degre $ax^2 + bx + c$ :

1. Calculer le discriminant $\Delta = b^2 - 4ac$
2. Si $\Delta > 0$ : deux racines $x_{1,2} = \frac{-b \pm \sqrt{\Delta}}{2a}$
:::
```

#### `:::hint`

Indication pour aider l'eleve a demarrer sans donner la solution.

| Propriete | Valeur |
|-----------|--------|
| **Attributs** | aucun |
| **Obligatoire** | Non |
| **Types autorises** | `exercise` |
| **Rendu** | Bloc `<details>` ambre avec icone ampoule, collapse ferme par defaut |

**Exemple** :
```mdx
:::hint
Pensez a calculer le discriminant d'abord.
:::
```

#### `:::erreurs`

Erreurs frequentes que les eleves commettent sur ce type d'exercice.

| Propriete | Valeur |
|-----------|--------|
| **Attributs** | aucun |
| **Obligatoire** | Non |
| **Types autorises** | `exercise` |
| **Rendu** | Bloc `<details>` rouge avec icone alerte, collapse ferme par defaut |

**Exemple** :
```mdx
:::erreurs
- Oublier de verifier le signe du discriminant avant d'appliquer la formule
- Confondre $-b$ avec $b$ dans la formule
:::
```

### 5.2 QCM

#### `:::question`

Enonce de la question QCM. Contient le texte de la question posee.

| Propriete | Valeur |
|-----------|--------|
| **Attributs** | aucun |
| **Obligatoire** | Oui |
| **Types autorises** | `qcm` |
| **Rendu** | Data carrier — le contenu est extrait par le parser, pas rendu directement |

**Exemple** :
```mdx
:::question
La derivee de $f(x) = x^3$ est :
:::
```

#### `:::option` / `:::option{correct}`

Une option de reponse dans un QCM. De 2 a 5 par atome, une seule avec `{correct}`.

| Propriete | Valeur |
|-----------|--------|
| **Attributs** | `{correct}` (optionnel, marque la bonne reponse) |
| **Obligatoire** | Oui (2 a 5) |
| **Types autorises** | `qcm` |
| **Rendu** | Data carrier — extrait par le parser |

**Exemple** :
```mdx
:::option
$x^2$
:::

:::option{correct}
$3x^2$
:::

:::option
$3x^3$
:::

:::option
$x^4$
:::
```

#### `:::explanation`

Explication pedagogique de la bonne reponse. Affichee apres que l'eleve a repondu.

| Propriete | Valeur |
|-----------|--------|
| **Attributs** | aucun |
| **Obligatoire** | Oui |
| **Types autorises** | `qcm` |
| **Rendu** | Data carrier — extrait par le parser |

**Exemple** :
```mdx
:::explanation
On applique la regle $(x^n)' = nx^{n-1}$, donc $(x^3)' = 3x^2$.
:::
```

### 5.3 Contenu enrichi

#### Blocs Typst

Graphiques de fonctions et tableaux de variations sont rendus via des blocs de code Typst (` ```typst `). Le pipeline compile le Typst en SVG statique.

| Propriete | Valeur |
|-----------|--------|
| **Syntaxe** | Bloc de code ` ```typst ... ``` ` |
| **Obligatoire** | Non |
| **Types autorises** | `lesson`, `exercise` |
| **Rendu** | SVG statique inline |

**Graphique de fonction** (cetz-plot) :
````mdx
```typst
#import "@preview/cetz:0.3.4"
#import "@preview/cetz-plot:0.1.1": plot
#cetz.canvas({
  plot.plot(size: (8, 5), x-tick-step: 1, y-tick-step: 1, {
    plot.add(domain: (-3, 3), x => calc.pow(x, 2) - 1)
  })
})
```
````

**Tableau de variations** (vartable) :
````mdx
```typst
#import "@preview/vartable:0.2.3": tabvar
#tabvar(
  init: (variable: $x$, label: [Variations de $f$]),
  ($-oo$, (), $-1$, (), $2$, (), $+oo$),
  ($f'(x)$, $+$, $0$, $-$, $0$, $+$),
  ($f(x)$, $-oo$, arr(from: $-oo$, to: $3$), $3$, arr(from: $3$, to: $-1$), $-1$, arr(from: $-1$, to: $+oo$), $+oo$),
)
```
````

Voir `.claude/skills/content/references/typst-snippets.md` pour les snippets copier-coller.

#### `:::figure`

Bloc figure avec legende optionnelle.

| Propriete | Valeur |
|-----------|--------|
| **Attributs** | aucun |
| **Obligatoire** | Non |
| **Types autorises** | `lesson`, `exercise` |
| **Rendu** | Bloc `<figure>` semantique |

#### `::youtube{id="..." title="..."}`

Integre une video YouTube. Directive feuille (leaf directive, `::` sans fermeture).

| Propriete | Valeur |
|-----------|--------|
| **Attributs** | `id` (ID de la video YouTube), `title` (titre accessible, optionnel) |
| **Obligatoire** | Non |
| **Types autorises** | `lesson` |
| **Rendu** | iframe YouTube responsive (ratio 16:9) |

**Exemple** :
```mdx
::youtube{id="dQw4w9WgXcQ" title="Introduction a la continuite"}
```

### 5.4 Lesson Parts

Directives de structure pour les lecons. Toujours visibles (pas de collapse). Transformees en HTML style par le plugin `remark-directive` dans `tools/pipeline/src/stages/compile-mdx.ts`.

#### `:::definition[Titre]`

Definition formelle d'un concept mathematique.

| Propriete | Valeur |
|-----------|--------|
| **Attributs** | Titre entre crochets (optionnel — defaut : "Definition") |
| **Obligatoire** | Non |
| **Types autorises** | `lesson` |
| **Rendu** | Bloc `<aside>` indigo avec icone BookText, toujours visible |

**Exemple** :
```mdx
:::definition[Continuite en un point]
On dit que $f$ est **continue en $a$** si $\lim_{x \to a} f(x) = f(a)$.
:::
```

#### `:::theorem[Titre]`

Enonce d'un theoreme.

| Propriete | Valeur |
|-----------|--------|
| **Attributs** | Titre entre crochets (optionnel — defaut : "Theoreme") |
| **Obligatoire** | Non |
| **Types autorises** | `lesson` |
| **Rendu** | Bloc `<aside>` violet avec icone ShieldCheck, toujours visible |

**Exemple** :
```mdx
:::theorem[Theoreme des valeurs intermediaires]
Soit $f$ continue sur $[a, b]$. Pour tout $k$ entre $f(a)$ et $f(b)$, il existe $c \in [a, b]$ tel que $f(c) = k$.
:::
```

#### `:::property[Titre]`

Propriete ou corollaire.

| Propriete | Valeur |
|-----------|--------|
| **Attributs** | Titre entre crochets (optionnel — defaut : "Propriete") |
| **Obligatoire** | Non |
| **Types autorises** | `lesson` |
| **Rendu** | Bloc `<aside>` sky avec icone Puzzle, toujours visible |

**Exemple** :
```mdx
:::property[Corollaire du TVI]
Si $f(a) \times f(b) < 0$, alors il existe $c$ tel que $f(c) = 0$.
:::
```

#### `:::example[Titre]`

Exemple travaille avec solution detaillee.

| Propriete | Valeur |
|-----------|--------|
| **Attributs** | Titre entre crochets (optionnel — defaut : "Exemple") |
| **Obligatoire** | Non |
| **Types autorises** | `lesson` |
| **Rendu** | Bloc `<aside>` emerald avec icone PenLine, toujours visible |

**Exemple** :
```mdx
:::example[Application du TVI]
Montrer que $x^3 - 3x + 1 = 0$ admet une solution dans $[0, 1]$.
:::
```

#### `:::remark`

Note pedagogique ou precision importante.

| Propriete | Valeur |
|-----------|--------|
| **Attributs** | Titre entre crochets (optionnel — defaut : "Remarque") |
| **Obligatoire** | Non |
| **Types autorises** | `lesson` |
| **Rendu** | Bloc `<aside>` amber avec icone Info, toujours visible |

**Exemple** :
```mdx
:::remark
Le TVI garantit l'existence, pas l'unicite.
:::
```

#### `:::attention[Titre]`

Piege ou erreur courante a eviter.

| Propriete | Valeur |
|-----------|--------|
| **Attributs** | Titre entre crochets (optionnel — defaut : "Attention") |
| **Obligatoire** | Non |
| **Types autorises** | `lesson` |
| **Rendu** | Bloc `<aside>` rose avec icone TriangleAlert, toujours visible |

**Exemple** :
```mdx
:::attention
Ne jamais oublier de verifier la continuite avant d'appliquer le TVI !
:::
```

---

## 6. Extensibilite — Ajouter une nouvelle directive

### Ou vivent les directives

Les directives sont gerees dans le pipeline de compilation, pas comme des composants React :

```
tools/pipeline/src/stages/
├── compile-mdx.ts              # Plugin remark-directive : transforme :::directive en HTML
│   ├── LESSON_PARTS            # definition, theorem, property, example, remark, attention
│   ├── EXERCISE_PARTS          # enonce, solution, methode, hint, erreurs
│   └── leaf directives         # ::youtube{...}
├── compile-qcm.ts              # Parser QCM : question, option, explanation
└── compile-typst.ts            # Blocs ```typst``` → SVG
```

### Le plugin remark-directive

Le fichier `compile-mdx.ts` utilise `remark-directive` pour parser les blocs `:::nom` du Markdown, puis un plugin remark custom transforme chaque directive reconnue en HTML style (blocs `<aside>`, `<details>`, etc.). Les directives QCM (`:::question`, `:::option`, `:::explanation`) sont gerees separement dans `compile-qcm.ts`.

### Procedure pour ajouter une nouvelle directive

1. **Ajouter le handler** dans le plugin remark de `compile-mdx.ts` (container directive pour `:::bloc ... :::`, leaf directive pour `::bloc{attrs}`)
2. **Definir le rendu HTML** (classes, icones, comportement collapse ou visible)
3. **Documenter** dans la section 5 de ce document (description, attributs, rendu, exemple, types autorises)

Une directive non documentee ici est consideree comme non autorisee dans le contenu.

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
- [ ] Les exercises ont `:::enonce` et `:::solution`
- [ ] Les QCM ont `:::question`, de 2 a 5 `:::option` (une seule avec `{correct}`), et `:::explanation`
- [ ] Le LaTeX utilise `$...$` et `$$...$$` (pas de balises HTML)
- [ ] Les headings commencent a `###`
- [ ] Pas de directives non autorisees
- [ ] Toute nouvelle directive est documentee dans la section 5
