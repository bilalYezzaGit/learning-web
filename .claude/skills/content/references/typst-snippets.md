# Snippets Typst — Reference

Snippets copier-coller pour les blocs Typst recurrents dans le contenu MDX.
Chaque snippet va dans un bloc ` ```typst ` a l'interieur d'une directive `:::`.

---

## 1. Tableau de variations (`vartable`)

Import obligatoire :

```typst
#import "@preview/vartable:0.2.3": tabvar
```

### 1.1 Variation seule ("v") — domaine fini

```typst
#import "@preview/vartable:0.2.3": tabvar

#tabvar(
  variable: $x$,
  label: (
    ([variation de $f$], "v"),
  ),
  domain: ($0$, $3$, $7$),
  contents: (
    (
      (bottom, $1$),
      (top, $5$),
      (bottom, $2$),
    ),
  ),
)
```

**Comptage** : `domain` a 3 bornes → la ligne "v" a 3 entries (une par borne).

### 1.2 Variation seule ("v") — domaine infini

```typst
#import "@preview/vartable:0.2.3": tabvar

#tabvar(
  variable: $x$,
  label: (
    ([variation de $f$], "v"),
  ),
  domain: ($-infinity$, $0$, $1$, $+infinity$),
  contents: (
    (
      (bottom, $-infinity$),
      (top, $-1$),
      (bottom, $-2$),
      (top, $+infinity$),
    ),
  ),
)
```

**Comptage** : `domain` a 4 bornes → la ligne "v" a 4 entries.

### 1.3 Signe seul ("s")

```typst
#import "@preview/vartable:0.2.3": tabvar

#tabvar(
  variable: $x$,
  label: (
    ([signe de $f(x)$], "s"),
  ),
  domain: ($-infinity$, $alpha$, $+infinity$),
  contents: (
    (
      $-$,
      ("0", $+$),
    ),
  ),
)
```

**Comptage** : `domain` a 3 bornes → la ligne "s" a **2 entries** (une par intervalle, pas par borne). La valeur a la borne s'ecrit `("0", ...)` devant l'entry de l'intervalle suivant.

### 1.4 Signe + variation combines

```typst
#import "@preview/vartable:0.2.3": tabvar

#tabvar(
  variable: $x$,
  label: (
    ([signe de $f'(x)$], "s"),
    ([variation de $f$], "v"),
  ),
  domain: ($-2$, $-1$, $1$, $3$),
  contents: (
    ($-$, $+$, $-$),
    (
      (center, $-1$),
      (top, $2$),
      (top, $2$),
      (bottom, $-3$),
    ),
  ),
)
```

### 1.5 Regles de comptage

Pour `domain` de **n bornes** :

| Type de ligne | Nombre d'entries | Raison |
|---------------|-----------------|--------|
| `"v"` (variation) | **n** entries | 1 par borne (chaque borne a une valeur) |
| `"s"` (signe) | **n-1** entries | 1 par intervalle (entre les bornes) |

La valeur a une borne dans une ligne "s" s'ecrit comme un tuple `("0", ...)` prefix a l'entry de l'intervalle suivant.

### 1.6 Positions des valeurs de variation

| Position | Signification |
|----------|--------------|
| `(top, $val$)` | Maximum local |
| `(bottom, $val$)` | Minimum local |
| `(center, $val$)` | Valeur sans extremum (bord de domaine) |

---

## 2. Courbe de fonction (`cetz-plot`)

Import obligatoire :

```typst
#import "@preview/cetz:0.3.4": canvas, draw
#import "@preview/cetz-plot:0.1.1": plot
```

### 2.1 Courbe simple

```typst
#import "@preview/cetz:0.3.4": canvas, draw
#import "@preview/cetz-plot:0.1.1": plot

#canvas({
  plot.plot(
    size: (8, 6),
    x-label: $x$,
    y-label: $y$,
    x-tick-step: 1,
    y-tick-step: 1,
    x-min: -3, x-max: 3,
    y-min: -2, y-max: 5,
    {
      plot.add(domain: (-3, 3), x => calc.pow(x, 2),
        style: (stroke: 2pt + blue), label: $f(x) = x^2$)
    },
  )
})
```

### 2.2 Deux courbes superposees

```typst
#import "@preview/cetz:0.3.4": canvas, draw
#import "@preview/cetz-plot:0.1.1": plot

#canvas({
  plot.plot(
    size: (8, 6),
    x-label: $x$,
    y-label: $y$,
    x-tick-step: 1,
    y-tick-step: 1,
    x-min: -3, x-max: 3,
    y-min: -2, y-max: 5,
    {
      plot.add(domain: (-3, 3), x => calc.pow(x, 2),
        style: (stroke: 2pt + blue), label: $f(x)$)
      plot.add(domain: (-3, 3), x => x + 1,
        style: (stroke: 2pt + red), label: $g(x)$)
    },
  )
})
```

### 2.3 Domaine coupe (asymptote verticale)

Couper le domaine en deux `plot.add` de part et d'autre de l'asymptote :

```typst
#import "@preview/cetz:0.3.4": canvas, draw
#import "@preview/cetz-plot:0.1.1": plot

#canvas({
  plot.plot(
    size: (8, 6),
    x-label: $x$,
    y-label: $y$,
    x-tick-step: 1,
    y-tick-step: 1,
    x-min: -4, x-max: 4,
    y-min: -5, y-max: 5,
    {
      // Branche gauche (x < 0)
      plot.add(domain: (-4, -0.1), x => 1 / x,
        style: (stroke: 2pt + blue), label: $f(x) = 1/x$)
      // Branche droite (x > 0)
      plot.add(domain: (0.1, 4), x => 1 / x,
        style: (stroke: 2pt + blue))
      // Asymptote verticale x = 0 en pointilles
      plot.add-vline(0, style: (stroke: (dash: "dashed", paint: gray)))
    },
  )
})
```

### 2.4 Asymptote horizontale en pointilles

```typst
plot.add-hline(2, style: (stroke: (dash: "dashed", paint: gray)))
```

---

## 3. Graphique manuel (`cetz canvas`)

Import obligatoire :

```typst
#import "@preview/cetz:0.3.4": canvas, draw
```

### 3.1 Axes + graduations (template de base)

```typst
#import "@preview/cetz:0.3.4": canvas, draw

#canvas({
  import draw: *

  // Axes
  line((-1.5, 0), (4.5, 0), stroke: 0.8pt, mark: (end: ">", fill: black))
  line((0, -1.5), (0, 4.5), stroke: 0.8pt, mark: (end: ">", fill: black))
  content((4.3, -0.3), $x$)
  content((-0.3, 4.3), $y$)
  content((-0.3, -0.3), $O$)

  // Graduations x
  for i in (1, 2, 3, 4) {
    line((i, -0.1), (i, 0.1), stroke: 0.5pt)
    content((i, -0.4), text(size: 8pt, str(i)))
  }
  // Graduations y
  for j in (1, 2, 3, 4) {
    line((-0.1, j), (0.1, j), stroke: 0.5pt)
    content((-0.4, j), text(size: 8pt, str(j)))
  }
})
```

### 3.2 Fonction par morceaux (lignes + changement de formule)

```typst
#import "@preview/cetz:0.3.4": canvas, draw

#canvas({
  import draw: *

  // Axes (voir template 3.1)
  line((-2, 0), (3, 0), stroke: 0.8pt, mark: (end: ">", fill: black))
  line((0, -2), (0, 4), stroke: 0.8pt, mark: (end: ">", fill: black))
  content((2.8, -0.3), $x$)
  content((-0.3, 3.8), $y$)

  // Premier morceau : droite de (-1, 3) a (1, -1)
  line((-1, 3), (1, -1), stroke: 2pt + blue)

  // Deuxieme morceau : droite de (1, -1) a (2.5, 2)
  line((1, -1), (2.5, 2), stroke: 2pt + blue)

  // Point ferme (raccord)
  circle((1, -1), radius: 0.08, fill: blue, stroke: blue)
})
```

### 3.3 Points fermes / ouverts (partie entiere, morceaux)

```typst
// Point ferme (inclus) — disque plein
circle((1, 2), radius: 0.08, fill: blue, stroke: blue)

// Point ouvert (exclu) — disque vide
circle((1, 2), radius: 0.08, fill: white, stroke: blue)
```

### 3.4 Courbe schematique (bezier)

```typst
#import "@preview/cetz:0.3.4": canvas, draw

#canvas({
  import draw: *

  // Axes
  line((-1, 0), (5, 0), stroke: 0.8pt, mark: (end: ">", fill: black))
  line((0, -1), (0, 4), stroke: 0.8pt, mark: (end: ">", fill: black))

  // Courbe en bezier : monte puis descend
  bezier((0, 1), (2, 3), (1, 3.5), stroke: 2pt + blue)
  bezier((2, 3), (4, 0.5), (3, 0), stroke: 2pt + blue)
})
```

### 3.5 Projections en pointilles

```typst
// Projection horizontale et verticale d'un point (2, 3) sur les axes
line((2, 0), (2, 3), stroke: (dash: "dashed", paint: gray))
line((0, 3), (2, 3), stroke: (dash: "dashed", paint: gray))
```

---

## 4. Gotchas & erreurs frequentes

### Syntaxe Typst (pas LaTeX)

| Correct (Typst) | Incorrect (LaTeX) |
|-----------------|-------------------|
| `calc.pow(x, 2)` | `x^2` dans le code |
| `calc.sqrt(x)` | `\sqrt{x}` |
| `$-infinity$` / `$+infinity$` | `∞` ou `\infty` |
| `$alpha$` | `\alpha` |

**Note** : `$...$` dans Typst est du mode math Typst, pas du LaTeX. Les symboles s'ecrivent directement (`alpha`, `infinity`, `pi`).

### Erreurs de comptage vartable

| Erreur | Correction |
|--------|-----------|
| Ligne "s" avec n entries (= nombre de bornes) | Ligne "s" = **n-1** entries (= nombre d'intervalles) |
| Ligne "v" avec n-1 entries | Ligne "v" = **n** entries (= nombre de bornes) |
| Oublier le tuple `("0", ...)` pour la valeur a une borne dans une ligne "s" | Ajouter `("0", $+$)` ou `("0", $-$)` |

### Points ouverts

Un point ouvert **doit** avoir `fill: white` ET `stroke: blue` (ou la couleur de la courbe). Sans `fill: white`, il sera plein par defaut.

### Asymptotes verticales

Ne jamais tracer la courbe a travers une asymptote. Couper le `domain` en deux `plot.add` avec un ecart (~0.1) autour de l'asymptote. Voir snippet 2.3.

### Imports

Toujours inclure les imports au debut de chaque bloc ` ```typst `. Les imports ne sont pas partages entre blocs.
