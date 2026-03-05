# Templates de contenu

Templates complets pour chaque type de contenu. Copier et adapter.

Pour les blocs Typst (tableaux de variations, courbes, graphiques manuels), voir **[typst-snippets.md](./typst-snippets.md)**.

---

## Atome — Lesson

Fichier : `content/{programme}/{module}/lesson-{topic}-{slug}.mdx`

```mdx
---
type: lesson
title: "Titre descriptif du sujet"
difficulty: 0
timeMinutes: 5
tags: [topic-tag, concept-specifique]
---

### Titre de la premiere section

Texte introductif. Les termes importants sont en **gras**.

$$formule\_principale$$

### Titre de la deuxieme section

- Point 1
- Point 2
- Point 3

### Proprietes

Si $f$ et $g$ sont continues en $a$, alors :

- $f + g$ est continue en $a$
- $f \times g$ est continue en $a$
```

**Regles a respecter** :
- Headings a partir de `###`
- Definitions en **gras**
- Formules cles en bloc LaTeX `$$...$$`
- Directives de structure : `:::definition[Titre]`, `:::theorem[Titre]`, `:::property[Titre]`, `:::example[Titre]`, `:::remark`, `:::attention[Titre]`
- Contenu enrichi : blocs Typst (` ```typst `) pour graphiques et tableaux de variations, `::youtube{id="..." title="..."}`

### Avec directives de structure et contenu enrichi

```mdx
---
type: lesson
title: "Theoreme des valeurs intermediaires"
difficulty: 1
timeMinutes: 8
tags: [continuite, tvi, equations]
---

### Intuition

Texte d'accroche pour expliquer le concept intuitivement.

```typst
#import "@preview/cetz:0.3.4"
#import "@preview/cetz-plot:0.1.1": plot
#cetz.canvas({
  plot.plot(size: (8, 5), x-tick-step: 1, y-tick-step: 1, {
    plot.add(domain: (-2.5, 2.5), x => calc.pow(x, 3) - 3 * x + 1)
  })
})
```

### Le theoreme

:::theorem[Theoreme des valeurs intermediaires (TVI)]
Soit $f$ une fonction **continue** sur $[a, b]$. Pour tout $k$ entre $f(a)$ et $f(b)$, il existe $c \in [a, b]$ tel que $f(c) = k$.
:::

:::remark
Le TVI garantit l'existence, pas l'unicite.
:::

### Corollaire

:::property[Corollaire du TVI]
Si $f(a) \times f(b) < 0$, alors il existe $c$ tel que $f(c) = 0$.
:::

### Application

:::example[Application du TVI]
Montrer que $x^3 - 3x + 1 = 0$ admet une solution dans $[0, 1]$.

1. $f$ est polynomiale donc continue
2. $f(0) = 1 > 0$ et $f(1) = -1 < 0$
3. Par le TVI, il existe $c \in ]0, 1[$ tel que $f(c) = 0$
:::

:::attention
Ne jamais oublier de verifier la continuite avant d'appliquer le TVI !
:::
```

### Avec blocs Typst

Les blocs Typst s'inserent directement dans le contenu MDX via des blocs de code ` ```typst `. Ils servent pour les graphiques de fonctions et les tableaux de variations (rendu SVG statique).

Tous les snippets copier-coller sont dans **[typst-snippets.md](./typst-snippets.md)** :
- Tableaux de variations (`vartable`) — variation seule, signe seul, combines
- Courbes de fonctions (`cetz-plot`) — simple, superposees, asymptotes
- Graphiques manuels (`cetz canvas`) — axes, morceaux, bezier, points ouverts/fermes
- Gotchas et erreurs frequentes

---

## Atome — Exercise

Fichier : `content/{programme}/{module}/ex-{topic}-{slug}.mdx`

```mdx
---
type: exercise
title: "Description du probleme"
difficulty: 1
timeMinutes: 10
category: application
tags: [topic-tag, technique-utilisee]
---

:::enonce
Soit $f$ la fonction definie sur $\mathbb{R}$ par $f(x) = x^3 - 3x + 1$.

1. Etudier la continuite de $f$ sur $\mathbb{R}$.
2. Montrer que l'equation $f(x) = 0$ admet au moins une solution dans $[0, 2]$.
:::

:::solution
**1.** $f$ est une fonction polynomiale, donc **continue sur $\mathbb{R}$**.

**2.** On calcule :
- $f(0) = 1 > 0$
- $f(2) = 8 - 6 + 1 = 3 > 0$

Essayons $f(1) = 1 - 3 + 1 = -1 < 0$.

On a $f(0) = 1 > 0$ et $f(1) = -1 < 0$.

$f$ est continue sur $[0, 1]$ et $f(0) \times f(1) < 0$, donc par le **TVI**, l'equation $f(x) = 0$ admet au moins une solution dans $[0, 1] \subset [0, 2]$.
:::

:::methode
Pour montrer qu'une equation $f(x) = 0$ a une solution dans $[a, b]$ :

1. Verifier que $f$ est continue sur $[a, b]$
2. Calculer $f(a)$ et $f(b)$
3. Si $f(a)$ et $f(b)$ sont de signes contraires, conclure par le TVI
:::

:::erreurs
- Oublier de verifier la continuite avant d'appliquer le TVI
- Conclure que la solution est unique sans le demontrer (ici on demande "au moins une")
:::
```

**Regles a respecter** :
- `:::enonce` et `:::solution` obligatoires
- Ordre : enonce → solution → methode → erreurs
- `category` obligatoire dans le frontmatter
- Pas de contenu hors des directives

### Exercise minimal

```mdx
---
type: exercise
title: "Continuite d'un polynome"
difficulty: 1
timeMinutes: 5
category: application
tags: [continuite, polynomes]
---

:::enonce
La fonction $f(x) = x^2 - 3x + 2$ est-elle continue en $x = 1$ ?
:::

:::solution
Oui, $f$ est continue en $x = 1$ car $f$ est une fonction polynomiale, donc continue sur $\mathbb{R}$.

On peut verifier : $\lim_{x \to 1} f(x) = 1 - 3 + 2 = 0 = f(1)$.
:::
```

### Exercise avec blocs Typst

Pour inserer un tableau de variations ou un graphique dans un exercise, placer le bloc ` ```typst ` directement dans la directive `:::enonce` ou `:::solution`. Voir [typst-snippets.md](./typst-snippets.md) pour les snippets. Exemple concret : `content/3eme-math/continuite/ex-cont-3c.mdx`.

---

## Atome — QCM

Fichier : `content/{programme}/{module}/qcm-{topic}-{slug}.mdx`

```mdx
---
type: qcm
title: "Sujet de la question"
difficulty: 1
timeMinutes: 1
tags: [topic-tag, concept]
---

:::question
Enonce clair de la question. Peut contenir du LaTeX : $f(x) = x^2$.
:::

:::option
Premier choix incorrect
:::

:::option
Deuxieme choix incorrect
:::

:::option{correct}
Bonne reponse
:::

:::option
Quatrieme choix incorrect
:::

:::explanation
Explication pedagogique de pourquoi la bonne reponse est correcte.
Mentionner la regle ou propriete utilisee.
:::
```

**Regles a respecter** :
- Une seule `:::question`
- 2 a 5 `:::option`, exactement une avec `{correct}`
- Une seule `:::explanation`, pedagogique
- Pas de `category` dans le frontmatter
- Ordre : question → options → explanation

### QCM avec LaTeX dans les options

```mdx
---
type: qcm
title: "Derivee de x cube"
difficulty: 1
timeMinutes: 1
tags: [derivation, formules]
---

:::question
La derivee de $f(x) = x^3$ est :
:::

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

:::explanation
On applique la regle $(x^n)' = nx^{n-1}$, donc $(x^3)' = 3x^{3-1} = 3x^2$.
:::
```

---

## Molecule — Cours

Fichier : `content/{programme}/{module}/_molecules/{slug}.yaml`

```yaml
kind: cours
title: Nom du cours
description: "Description courte du contenu couvert"
trimester: T1
order: 1
estimatedMinutes: 120
objectives:
  - "Premier objectif d'apprentissage"
  - "Deuxieme objectif d'apprentissage"
  - "Troisieme objectif d'apprentissage"

sections:
  - label: "Premiere section"
    steps:
      - lesson-topic-intro
      - ex-topic-application-directe
      - quiz:
          - qcm-topic-notion-1
          - qcm-topic-notion-2

  - label: "Deuxieme section"
    steps:
      - lesson-topic-approfondissement
      - ex-topic-combinaison
      - ex-topic-synthese
      - quiz:
          - qcm-topic-piege-1
          - qcm-topic-piege-2
          - qcm-topic-piege-3
```

**Regles a respecter** :
- `kind: cours` obligatoire
- Au moins 1 section avec label + steps
- Steps : IDs d'atomes ou objets `quiz:` (2-5 QCM)
- Les IDs d'atomes doivent exister dans le module correspondant

---

## Molecule — Serie

Fichier : `content/{programme}/{module}/_molecules/{slug}.yaml`

```yaml
kind: serie
title: "Nom de la serie"
description: "Description du parcours de revision"
difficulty: 2
estimatedMinutes: 50
tags: [topic-principal, sous-theme]
trimestre: 1
modules: [topic]

steps:
  - lesson-topic-rappel
  - ex-topic-application
  - ex-topic-approfondissement
  - quiz:
      - qcm-topic-question-1
      - qcm-topic-question-2
  - ex-topic-synthese
```

**Regles a respecter** :
- `kind: serie` obligatoire
- Pas de sections (liste plate de steps)
- Minimum 2 steps
- `difficulty` obligatoire (1-3, pas de 0)
- `tags` obligatoire, au moins 1
- Thematique ciblee : un sujet precis
