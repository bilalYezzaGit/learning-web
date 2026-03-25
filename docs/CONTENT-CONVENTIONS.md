# Convention de contenu

Version 5 — 2026-03-22

Ce document definit les regles strictes d'ecriture du contenu pedagogique. Tout contenu qui ne respecte pas ces regles doit etre corrige. La convention prime sur l'existant.

> **Architecture `_meta/`** : le modele academique (savoir, praxeologies, misconceptions, patterns) vit dans `_meta/{programme}/{module}/`, separe de la production de contenu dans `content/`. Le repertoire `_meta/` n'est pas touche par le pipeline de contenu.

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

#### `praxeologies`

Liste des IDs de praxeologies couvertes par cet atome. Optionnel, defaut `[]`.
Les IDs referencent les praxeologies du modele academique (`_meta/{prog}/{mod}/praxeologies.yaml`).
Renseigne automatiquement lors de la generation depuis un planning (WF3).

```yaml
praxeologies: [Prax1, Prax2a, Prax4]
```

#### `pattern`

ID du pattern d'examen instancie par cet atome. Optionnel.
Reference un pattern dans `_meta/{prog}/{mod}/patterns.yaml`.
Utilise principalement pour les exercices du Livret 2 (Examen), generes a partir de patterns reels.

```yaml
pattern: Prax3.v1
```

#### `lines` (exercices uniquement, optionnel)

Nombre de lignes de rédaction dans le PDF imprimé. Optionnel — si absent, calculé automatiquement depuis `timeMinutes` (5-8 min → 8 lignes, 10-12 min → 12 lignes, 15-20 min → 16 lignes).

```yaml
lines: 20    # override le calcul automatique
```

Utiliser quand l'exercice nécessite plus (ou moins) de lignes que ce que le temps suggère.

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

Les molecules sont des fichiers YAML dans `content/{programme}/{module}/{profil}/`. Elles assemblent des atomes en vues ordonnees.

### 3.0 Structure des repertoires

```
content/
├── 3eme-math/                          # programme (contient _programme.yaml)
│   ├── _programme.yaml                 # metadata du programme
│   ├── nombre-derive/                  # module
│   │   ├── cours/                      # profil cours
│   │   │   ├── molecule.yaml           # livret (kind: livret)
│   │   │   ├── _planning.yaml          # planning specifique (optionnel)
│   │   │   ├── _validation.md          # validation specifique (optionnel)
│   │   │   ├── lesson-der-definition.mdx
│   │   │   ├── ex-der-tvi-direct.mdx
│   │   │   └── qcm-der-tangente.mdx
│   │   ├── examen/                     # profil examen
│   │   │   └── molecule.yaml
│   │   └── exploration/                # profil exploration
│   │       └── molecule.yaml
│   └── fonction-derivee/
│       ├── cours/molecule.yaml
│       ├── examen/molecule.yaml
│       └── exploration/molecule.yaml
├── 2nde-math/                          # futur programme
│   └── ...

_meta/                                   # modele academique (hors pipeline)
├── booklet-profiles.yaml                # profils cours/examen/exploration + pedagogie DO/DO NOT
└── 3eme-math/                           # 1 repertoire par programme
    ├── prerequis-graph.yaml             # graphe de dependances entre modules
    ├── nombre-derive/                   # 1 repertoire par module
    │   ├── savoir.yaml                    # savoirs theoriques (sections 0-7 + notations)
    │   ├── praxeologies.yaml              # taches-types et techniques
    │   ├── misconceptions.yaml            # erreurs frequentes
    │   └── patterns.yaml                  # patterns d'examen (optionnel)
    ├── fonction-derivee/
    │   ├── savoir.yaml
    │   ├── praxeologies.yaml
    │   └── misconceptions.yaml
    └── examens/                           # specifications d'examens
        └── synthese-3eme-t3/
            ├── spec.yaml
            └── patterns.yaml
```

Le pipeline decouvre automatiquement les programmes (repertoires contenant `_programme.yaml`), les modules (sous-repertoires sans prefixe `_`), les profils (sous-repertoires des modules contenant `molecule.yaml`), et les atomes (`.mdx` dans les profils). Les fichiers prefixes `_` dans les repertoires profil sont **invisibles au pipeline** :

| Fichier invisible | Role | Cree par |
|-------------------|------|----------|
| `_planning.yaml` | Spec de generation (par molecule) | WF2 |
| `_validation.md` | Rapport de validation (par molecule) | WF4 |

Le modele academique vit dans `_meta/{programme}/{module}/` :

| Fichier `_meta/` | Role | Cree par |
|-------------------|------|----------|
| `savoir.yaml` | Savoirs theoriques du module (sections 0-7 + notations) | WF1 |
| `praxeologies.yaml` | Taches-types et techniques | WF1 |
| `misconceptions.yaml` | Erreurs frequentes des eleves | WF1 |
| `patterns.yaml` | Patterns d'examen (enrichi iterativement, optionnel) | WF1+ |

### 3.1 Molecule Livret

Tous les livrets utilisent `kind: livret`. Il n'y a plus de distinction `cours`/`serie` — un livret est simplement un assemblage ordonne d'atomes organise en sections.

Fichier : `content/{programme}/{module}/{profil}/molecule.yaml`

```yaml
kind: livret                            # obligatoire, toujours "livret"
visible: true                           # optionnel, defaut: true
title: "Continuite"                     # obligatoire
description: "Description courte"       # obligatoire
trimester: T1 | T2 | T3                # obligatoire
order: 1                                # obligatoire, position dans le programme
estimatedMinutes: 180                   # optionnel, auto-calcule si absent
objectives:                             # obligatoire, >= 3 objectifs
  - "Objectif 1"
  - "Objectif 2"
  - "Objectif 3"

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
- `objectives` est **obligatoire**, minimum 3 objectifs d'apprentissage clairs et mesurables

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
- Plus de listes `cours:` et `series:` — le pipeline decouvre automatiquement les livrets en scannant les `{profil}/molecule.yaml` des sous-modules
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

Graphiques de fonctions, tableaux de variations et **tableaux de donnees** sont rendus via des blocs de code Typst (` ```typst `). Le pipeline compile le Typst en SVG statique.

**IMPORTANT** : ne jamais utiliser les tableaux Markdown (`| ... | ... |`) dans le contenu MDX. Ils ne sont pas rendus dans les PDFs. Toujours utiliser un bloc ` ```typst ` avec `#table()` a la place.

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
  variable: $x$,
  label: (
    ([signe de $f'(x)$], "s"),
    ([variation de $f$], "v"),
  ),
  domain: ($-infinity$, $-1$, $2$, $+infinity$),
  contents: (
    ($+$, ("0", $-$), ("0", $+$)),
    (
      (bottom, $-infinity$),
      (top, $3$),
      (bottom, $-1$),
      (top, $+infinity$),
    ),
  ),
)
```
````

**Tableau de donnees** (`#table`) :
````mdx
```typst
#table(
  columns: 4,
  align: center,
  stroke: 0.5pt,
  [*En-tete 1*], [*En-tete 2*], [*En-tete 3*], [*En-tete 4*],
  [valeur], [valeur], [valeur], [valeur],
  [valeur], [valeur], [valeur], [valeur],
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
| `denom` | Dénombrement |

Pour ajouter un nouveau topic : l'ajouter a ce tableau et creer le cours correspondant.

### 7.2 Tags

Les tags sont semantiques et libres, mais doivent rester dans le vocabulaire existant autant que possible. Avant de creer un nouveau tag, verifier qu'un tag existant ne couvre pas deja le concept.

**Convention de nommage des tags** :
- Tout en minuscule, kebab-case
- Substantifs ou concepts, pas de verbes
- Suffisamment specifique : `tvi` plutot que `theoreme`
- Pas de tag redondant avec le type (`cours`, `exercice`, `qcm` ne sont pas des tags)

---

## 8. Langue et accents

Tout le contenu DOIT etre redige en **francais correct avec tous les accents** :
- `é`, `è`, `ê`, `ë` — derivee → **dérivée**, theoreme → **théorème**, premiere → **première**
- `à`, `â` — a (preposition) → **à**, parametre → **paramètre**
- `ù`, `û` — ou → **où** (pronom relatif)
- `ô` — controle → **contrôle**
- `ç` — ca → **ça**, lecon → **leçon**
- `î`, `ï` — connaitre → **connaître**

**Pas d'exception.** Les fichiers MDX, les titres, les descriptions de molecules, les plannings — tout doit avoir les accents corrects. Un livret sans accents n'est pas publiable.

**Verification** : le workflow WF4 (validation) doit signaler tout texte francais sans accents comme FAIL (Grille A).

---

## 9. Markdown

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

## 10. Checklist de validation

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

---

## 11. Patterns d'examen (`patterns.yaml`)

Fichier par module : `_meta/{programme}/{module}/patterns.yaml`. Contient les variantes d'exercices d'examen classifiees par praxeologie.

Ce fichier est **vivant** — enrichi iterativement a chaque nouvelle source d'exercices (WF1+). Il vit dans `_meta/`, separe du pipeline de contenu.

### Format

```yaml
module: "{slug-module}"
programme: "{slug-programme}"
version: 1                              # incremente a chaque enrichissement

patterns:
  - id: Prax3.v1                        # convention : {Praxeologie}.v{numero}
    praxeology: Prax3                   # reference vers _meta/{prog}/{mod}/praxeologies.yaml
    name: "Nom court de la variante"
    description: >-
      Ce que l'eleve doit faire dans cette variante.
    method:
      - "Etape 1 de la methode"
      - "Etape 2"
    variables:
      function: ["x³-3x+1", "eˣ-2x"]
      interval: ["[0,1]", "[1,2]"]
    difficulty: 1
    frequency: 3                        # nombre d'occurrences dans les sources
    sources:
      - "Manuel T1 p.35 ex.1"
      - "BAC 2024 ex.3a"
    examples:
      - title: "BAC 2024 — Exercice 3a"
        enonce: >-
          Texte de l'enonce reel.
        sketch: >-
          Grandes lignes de la solution.
```

### Regles

- **1 fichier par module** dans `_meta/{programme}/{module}/patterns.yaml` (pas par molecule)
- IDs de patterns : `{Praxeologie}.v{numero}` (ex: `Prax3.v1`, `Prax3.v2`)
- Chaque pattern reference une praxeologie de `_meta/{programme}/{module}/praxeologies.yaml` via `praxeology:`
- `frequency` = nombre d'occurrences observees dans les sources ingeres
- `examples` = exercices reels (pas inventes), avec source
- `variables` = ce qui change d'un exercice a l'autre pour ce pattern
- `version` incremente a chaque enrichissement (WF1+)
- Seuil : au-dela de ~10 variantes par praxeologie, regrouper ou elaguer

---

## 12. Redaction mathematique — Programme tunisien (Lycee)

Source de verite pour la redaction du contenu pedagogique en mathematiques.
Extrait des sources officielles (Manuel scolaire, Parascolaire, XY Plus).

### 12.1 Vocabulaire standard

#### Ouvertures de definitions et theoremes

| Forme correcte | A eviter |
|---|---|
| "Soit $f$ une fonction **definie** sur un intervalle $I$" | "Considerons une fonction..." |
| "Soit $a$ un reel de $I$" | "Soit $a$ un element de $I$" |
| "Soit $f$ et $g$ deux fonctions definies sur $I$" | "Soient les fonctions $f$ et $g$..." |
| "On dit que $f$ est **continue en $a$**" | "La fonction $f$ est dite continue..." (acceptable mais moins courant) |
| "Soit $a$ et $b$ deux reels de $I$ tels que $a < b$" | "Pour $a < b$ dans $I$..." |

#### Termes normalises

| Terme | Usage |
|---|---|
| **ensemble de definition** | Toujours (jamais "domaine de definition") |
| **reel** | Pour designer un nombre ($a$ un reel, $k$ un reel) |
| **fonction polynome** | Pas "polynomiale" (le Manuel et le Parascolaire ecrivent "fonction polynome") |
| **fonction rationnelle** | Standard |
| **partie entiere** | Notee $E(x)$, jamais $\lfloor x \rfloor$ |
| **valeur absolue** | Notee $\|x\|$ |
| **repere orthonorme** | Toujours nomme $(O, \vec{i}, \vec{j})$ |
| **courbe representative** | Notee $C_f$, $\mathcal{C}_f$ ou $\zeta_f$ selon la source |

#### Formulations recurrentes

- "en tout reel $a$" (pour la continuite des fonctions usuelles)
- "en tout reel ou elle est definie" (pour les rationnelles)
- "en particulier sur $[a, b]$" (pour restreindre un domaine)
- "D'ou $f$ est continue en $a$" (conclusion standard)
- "Par suite..." / "Finalement..." (enchainements)

### 12.2 Notation mathematique

#### Nombres decimaux

Virgule decimale avec espace fin en LaTeX : `$0{,}1$` → $0{,}1$

Jamais le point decimal : ~~`$0.1$`~~

#### Fractions

- **En ligne dans le texte** : `$\dfrac{a}{b}$` (display fraction, plus lisible)
- **En bloc $$ ... $$** : `$\frac{a}{b}$` suffit

#### Ensembles

| Notation | Signification |
|---|---|
| $\mathbb{R}$ | Ensemble des reels |
| $\mathbb{R}^*$ | Reels non nuls |
| $\mathbb{R}_+$ | Reels positifs |
| $\mathbb{R}_+^*$ | Reels strictement positifs |
| $\mathbb{Z}$ | Entiers relatifs |
| $\mathbb{N}$ | Entiers naturels |

#### Intervalles

- Crochets francais : $[a, b]$, $]a, b[$, $[a, b[$, $]a, b]$
- Jamais la notation anglo-saxonne avec parentheses : ~~$(a, b)$~~ pour un intervalle ouvert
- Infinis : $]-\infty, a]$, $[a, +\infty[$

#### Fonctions speciales

| Objet | Notation |
|---|---|
| Partie entiere | $E(x)$ |
| Valeur absolue | $\|x\|$, $\|f(x)\|$ |
| Racine composee | $\sqrt{f}$ (pas $\sqrt{f(x)}$ dans les theoremes, mais $\sqrt{f(x)}$ dans les calculs) |
| Image d'un ensemble | $f(A) = \{f(x) \; ; \; x \in A\}$ |
| Courbe | $C_f$, $\mathcal{C}_f$, ou $\zeta_f$ |
| Repere | $(O, \vec{i}, \vec{j})$ |

#### Quantificateurs (definition formelle)

La convention tunisienne utilise $\alpha$ et $\beta$ (pas $\varepsilon$ et $\delta$) :

> Pour tout $\beta > 0$, il existe $\alpha > 0$ tel que si $x \in I$ et $|x - a| < \alpha$, alors $|f(x) - f(a)| < \beta$.

### 12.3 Verbes d'action (consignes)

Les verbes sont normalises et chacun implique un niveau de rigueur attendu :

| Verbe | Signification | Niveau de rigueur |
|---|---|---|
| **Justifier** | Appliquer un theoreme connu, citer la regle | Citation + verification des hypotheses |
| **Montrer que** | Demonstration ou preuve d'existence | Raisonnement complet |
| **Determiner** | Calculer un resultat precis | Calcul + resultat explicite |
| **Etudier** | Analyse ouverte (continuite, variations...) | Methodique, cas par cas |
| **Tracer** | Representation graphique | Courbe avec repere |
| **Verifier** | Confirmer un resultat donne | Calcul de verification |
| **En deduire que** | Enchainement logique depuis un resultat precedent | Reference explicite au resultat |
| **Resoudre** | Trouver toutes les solutions | Solutions + ensemble |
| **Calculer** | Effectuer un calcul numerique | Resultat exact |

### 12.4 Patterns de redaction des solutions

#### Justification de continuite

Le schema est toujours le meme, en 2-3 phrases :

1. **Identifier le type** de la fonction (polynome, rationnelle, racine, valeur absolue, composee)
2. **Citer le theoreme** applicable
3. **Verifier les conditions** (domaine, positivite, denominateur non nul)
4. **Conclure** : "D'ou $f$ est continue en $a$."

Exemples-types :

**Polynome :**
> $f$ est une fonction polynome donc continue sur $\mathbb{R}$, en particulier en $a$.

**Rationnelle :**
> $f$ est une fonction rationnelle. Le denominateur $x - 4$ ne s'annule pas en $a = 0{,}7$, donc $f$ est continue en $a$.

**Racine :**
> La fonction $u : x \mapsto 3x + 5$ est polynome donc continue en $a = \dfrac{2}{3}$. De plus $u\left(\dfrac{2}{3}\right) = 7 > 0$. Donc $f = \sqrt{u}$ est continue en $a$.

**Valeur absolue :**
> La fonction $g : x \mapsto x^2 - 3x + 2$ est polynome donc continue sur $\mathbb{R}$. D'ou $f = |g|$ est continue sur $\mathbb{R}$.

**Operations (somme/produit/quotient) :**
> $f_1$ et $f_2$ sont continues en $a$ et $f_2(a) \neq 0$. Donc $f = \dfrac{f_1}{f_2}$ est continue en $a$.

**Discriminant pour la positivite :**
> $\Delta = 9 - 20 = -11 < 0$ et le coefficient dominant $a = 1 > 0$, donc $x^2 + 3x + 5 > 0$ pour tout $x \in \mathbb{R}$.

#### Continuite par morceaux

Schema standard :

1. Etudier la continuite sur chaque morceau separement (fonctions usuelles)
2. Aux points de raccordement $x_0$ : comparer $f(x_0)$, $\lim_{x \to x_0^-} f(x)$ et $\lim_{x \to x_0^+} f(x)$
3. Si egalite des trois : continue en $x_0$. Sinon : discontinue (saut).

Formulation-type :
> En $x = a$ : $\lim_{x \to a^-} f(x) = ... \neq f(a) = ...$, donc $f$ n'est pas continue en $a$.

#### Application du TVI

Le patron est identique dans les trois sources :

```
$f$ est une fonction polynome donc continue sur $\mathbb{R}$,
en particulier sur $[a, b]$.

$f(a) = ... > 0$ et $f(b) = ... < 0$.

$f(a) \times f(b) = ... < 0$.

D'apres le TVI, il existe au moins un $c \in ]a, b[$
tel que $f(c) = 0$.
```

Variante pour $f(x) = k$ (pas zero) :
> $k$ est compris entre $f(a)$ et $f(b)$. D'apres le TVI, il existe au moins un $c \in [a, b]$ tel que $f(c) = k$.

#### Unicite (TVI + monotonie)

> De plus, $f$ est strictement croissante sur $[a, b]$, donc la solution est **unique**.

#### Nombre exact de solutions (polynome de degre $n$)

Schema :
1. Trouver $n$ solutions par le TVI dans des intervalles **disjoints**
2. Argument : "un polynome de degre $n$ a au plus $n$ racines reelles"
3. Conclusion : "donc exactement $n$ solutions"

#### Images d'intervalles

Methode systematique :
1. Identifier les variations de $f$ sur l'intervalle (croissante/decroissante)
2. Si monotone : $f([a,b]) = [f(a), f(b)]$ ou $[f(b), f(a)]$
3. Si changement de monotonie : reperer le min/max atteint sur l'intervalle
4. Attention aux bornes ouvertes/fermees (atteintes ou non)

#### Dichotomie (valeur approchee)

Schema :
> $f(0{,}6) > 0$ et $f(0{,}7) < 0$, donc $\alpha \in [0{,}6 \; ; \; 0{,}7]$.

Precision demandee : generalement $10^{-1}$ ou $10^{-2}$.

### 12.5 Structuration des cours

#### Approche du Manuel scolaire

Le Manuel suit un schema pedagogique precis :

1. **Activite** introductive (situation concrete, graphique, ou calcul guide)
2. **Definition** ou **Theoreme** (encadre, formulation rigoureuse)
3. **Activite** d'application (exemples resolus)
4. Repetition du cycle pour chaque notion

#### Approche du Parascolaire

Plus condense :
1. **Resume** direct (definition + theoreme, sans activite motivante)
2. **Tableau** recapitulatif (fonctions usuelles continues)
3. **Exemples** intercales (courts, 3-4 lignes)

#### Approche XY Plus

Le plus concis :
1. **Resume** ultra-compact (1-2 pages pour tout le module)
2. Enchainement rapide des theoremes sans activites
3. Exercices corriges plus elabores que le cours

### 12.6 Formulations a eviter

| A eviter | Correct |
|---|---|
| "On a donc le theoreme suivant" | "On a donc obtenu le theoreme ci-dessous" |
| "Il est evident que..." | (supprimer, aller droit au calcul) |
| "Trivialement..." | (supprimer) |
| "$\forall$", "$\exists$" dans le texte | Ecrire en toutes lettres : "pour tout", "il existe" |
| "CQFD" | (pas utilise dans le programme tunisien) |
