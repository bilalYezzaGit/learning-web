# Templates de contenu

Templates complets pour chaque type de contenu. Copier et adapter.

---

## Atome — Lesson

Fichier : `content/atoms/lesson-{topic}-{slug}.mdx`

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
- Composants de structure : `<Definition>`, `<Theorem>`, `<Property>`, `<Example>`, `<Remark>`, `<Attention>`
- Composants enrichis : `<Graph>`, `<Variations>`, `<YouTube>`

### Avec composants de structure et enrichis

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

<Graph function="x^3 - 3*x + 1" range="[-2.5, 2.5]" yRange="[-4, 4]" />

### Le theoreme

<Theorem title="Theoreme des valeurs intermediaires (TVI)">

Soit $f$ une fonction **continue** sur $[a, b]$. Pour tout $k$ entre $f(a)$ et $f(b)$, il existe $c \in [a, b]$ tel que $f(c) = k$.

</Theorem>

<Remark>
Le TVI garantit l'existence, pas l'unicite.
</Remark>

### Corollaire

<Property title="Corollaire du TVI">

Si $f(a) \times f(b) < 0$, alors il existe $c$ tel que $f(c) = 0$.

</Property>

### Application

<Example title="Application du TVI">

Montrer que $x^3 - 3x + 1 = 0$ admet une solution dans $[0, 1]$.

1. $f$ est polynomiale donc continue
2. $f(0) = 1 > 0$ et $f(1) = -1 < 0$
3. Par le TVI, il existe $c \in ]0, 1[$ tel que $f(c) = 0$

</Example>

<Attention>
Ne jamais oublier de verifier la continuite avant d'appliquer le TVI !
</Attention>
```

---

## Atome — Exercise

Fichier : `content/atoms/ex-{topic}-{slug}.mdx`

```mdx
---
type: exercise
title: "Description du probleme"
difficulty: 1
timeMinutes: 10
category: application
tags: [topic-tag, technique-utilisee]
---

<Enonce>
Soit $f$ la fonction definie sur $\mathbb{R}$ par $f(x) = x^3 - 3x + 1$.

1. Etudier la continuite de $f$ sur $\mathbb{R}$.
2. Montrer que l'equation $f(x) = 0$ admet au moins une solution dans $[0, 2]$.
</Enonce>

<Solution>
**1.** $f$ est une fonction polynomiale, donc **continue sur $\mathbb{R}$**.

**2.** On calcule :
- $f(0) = 1 > 0$
- $f(2) = 8 - 6 + 1 = 3 > 0$

Essayons $f(1) = 1 - 3 + 1 = -1 < 0$.

On a $f(0) = 1 > 0$ et $f(1) = -1 < 0$.

$f$ est continue sur $[0, 1]$ et $f(0) \times f(1) < 0$, donc par le **TVI**, l'equation $f(x) = 0$ admet au moins une solution dans $[0, 1] \subset [0, 2]$.
</Solution>

<Methode>
Pour montrer qu'une equation $f(x) = 0$ a une solution dans $[a, b]$ :

1. Verifier que $f$ est continue sur $[a, b]$
2. Calculer $f(a)$ et $f(b)$
3. Si $f(a)$ et $f(b)$ sont de signes contraires, conclure par le TVI
</Methode>

<Hint>
Pensez a calculer $f(0)$ et $f(2)$, puis cherchez un point intermediaire si necessaire.
</Hint>

<Erreurs>
- Oublier de verifier la continuite avant d'appliquer le TVI
- Conclure que la solution est unique sans le demontrer (ici on demande "au moins une")
</Erreurs>
```

**Regles a respecter** :
- `<Enonce>` et `<Solution>` obligatoires
- Ordre : Enonce → Solution → Methode → Hint → Erreurs
- `category` obligatoire dans le frontmatter
- Pas de contenu hors des composants

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

<Enonce>
La fonction $f(x) = x^2 - 3x + 2$ est-elle continue en $x = 1$ ?
</Enonce>

<Solution>
Oui, $f$ est continue en $x = 1$ car $f$ est une fonction polynomiale, donc continue sur $\mathbb{R}$.

On peut verifier : $\lim_{x \to 1} f(x) = 1 - 3 + 2 = 0 = f(1)$.
</Solution>
```

---

## Atome — QCM

Fichier : `content/atoms/qcm-{topic}-{slug}.mdx`

```mdx
---
type: qcm
title: "Sujet de la question"
difficulty: 1
timeMinutes: 1
tags: [topic-tag, concept]
---

<Question>
Enonce clair de la question. Peut contenir du LaTeX : $f(x) = x^2$.
</Question>

<Option>Premier choix incorrect</Option>
<Option>Deuxieme choix incorrect</Option>
<Option correct>Bonne reponse</Option>
<Option>Quatrieme choix incorrect</Option>

<Explanation>
Explication pedagogique de pourquoi la bonne reponse est correcte.
Mentionner la regle ou propriete utilisee.
</Explanation>
```

**Regles a respecter** :
- Une seule `<Question>`
- 2 a 5 `<Option>`, exactement une avec `correct`
- Une seule `<Explanation>`, pedagogique
- Pas de `category` dans le frontmatter
- Ordre : Question → Options → Explanation

### QCM avec LaTeX dans les options

```mdx
---
type: qcm
title: "Derivee de x cube"
difficulty: 1
timeMinutes: 1
tags: [derivation, formules]
---

<Question>
La derivee de $f(x) = x^3$ est :
</Question>

<Option>$x^2$</Option>
<Option correct>$3x^2$</Option>
<Option>$3x^3$</Option>
<Option>$x^4$</Option>

<Explanation>
On applique la regle $(x^n)' = nx^{n-1}$, donc $(x^3)' = 3x^{3-1} = 3x^2$.
</Explanation>
```

---

## Molecule — Cours

Fichier : `content/molecules/cours/{slug}.yaml`

```yaml
title: Nom du cours
description: "Description courte du contenu couvert"
programme: 3eme-math
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
- Tous les champs du header obligatoires
- Au moins 1 section avec label + steps
- Steps : IDs d'atomes ou objets `quiz:` (2-5 QCM)
- `programme` doit correspondre a un programme existant
- Les IDs d'atomes doivent exister dans `content/atoms/`

---

## Molecule — Serie

Fichier : `content/molecules/series/{slug}.yaml`

```yaml
title: "Nom de la serie"
description: "Description du parcours de revision"
difficulty: 2
estimatedMinutes: 50
tags: [topic-principal, sous-theme]

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
- Pas de sections (liste plate de steps)
- Minimum 2 steps
- `difficulty` obligatoire (1-3, pas de 0)
- `tags` obligatoire, au moins 1
- Thematique ciblee : un sujet precis
