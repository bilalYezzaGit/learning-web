// =============================================================================
// Module 4 : Limites et comportements asymptotiques
// Programme : 3ème Math (Tunisie)
// Source : Manuel scolaire CNP (T1, p.56–79) + Corrigé CMS (T1, p.41–58)
// =============================================================================

= Chapitre 4 : Limites et comportements asymptotiques

#emph[« Seul deux choses sont infinies : l'univers et la bêtise humaine. Mais je ne suis pas sûr pour l'univers. »]

#align(right)[*Einstein*]

// Source: Manuel T1 p.57
== Pour commencer

=== Activité 1

Soit la fonction f définie pour tout réel $x > 0$ par $f(x) = frac(1, x)$.

1. Représenter l'ensemble B des points $M(x, y)$ du plan tels que $0 < y < 5 dot 10^(-3)$.

2. Donner une condition suffisante sur x pour qu'un point $M(x, f(x))$ appartienne à B.

#cetz.canvas({
  import cetz.draw: *
  // Axes
  line((-0.5, 0), (8, 0), stroke: 0.5pt, mark: (end: ">"))
  line((0, -0.3), (0, 4.5), stroke: 0.5pt, mark: (end: ">"))
  content((8, -0.3), $x$)
  content((-0.3, 4.5), $y$)
  // Graduation y
  content((-0.5, 4.2), text(size: 7pt)[$0,015$])
  content((-0.5, 3.4), text(size: 7pt)[$0,012$])
  content((-0.5, 2.5), text(size: 7pt)[$0,009$])
  content((-0.5, 1.7), text(size: 7pt)[$0,006$])
  content((-0.5, 0.85), text(size: 7pt)[$0,003$])
  // Graduation x
  content((1.3, -0.3), text(size: 7pt)[$50$])
  content((2.6, -0.3), text(size: 7pt)[$100$])
  content((3.9, -0.3), text(size: 7pt)[$150$])
  content((5.2, -0.3), text(size: 7pt)[$200$])
  content((6.5, -0.3), text(size: 7pt)[$250$])
  content((7.8, -0.3), text(size: 7pt)[$300$])
  // Courbe f(x) = 1/x (approximation visuelle)
  bezier((0.3, 4.2), (1.3, 1.5), (0.5, 3), (0.9, 1.8), stroke: blue + 1.5pt)
  bezier((1.3, 1.5), (3, 0.85), (1.8, 1.1), (2.5, 0.9), stroke: blue + 1.5pt)
  bezier((3, 0.85), (7.5, 0.2), (4, 0.5), (6, 0.3), stroke: blue + 1.5pt)
})

=== Activité 2

On donne ci-dessous les représentations graphiques $C_f$, $C_g$ et $C_h$ de trois fonctions f, g et h.

#grid(
  columns: (1fr, 1fr, 1fr),
  gutter: 1em,
  [
    #cetz.canvas({
      import cetz.draw: *
      // Axes
      line((-0.5, 0), (4, 0), stroke: 0.5pt, mark: (end: ">"))
      line((0, -1.5), (0, 2.5), stroke: 0.5pt, mark: (end: ">"))
      content((4, -0.3), $x$)
      content((-0.3, 2.5), $y$)
      // Courbe Cf : fonction croissante bornée tendant vers 1
      bezier((0.2, -1), (1, 0.3), (0.5, -0.5), (0.8, 0.1), stroke: blue + 1.5pt)
      bezier((1, 0.3), (3.5, 0.9), (1.5, 0.6), (2.5, 0.85), stroke: blue + 1.5pt)
      // Asymptote horizontale y = 1
      line((0, 1), (3.5, 1), stroke: (dash: "dashed", paint: gray))
      content((-0.3, 1), $1$)
    })
    #align(center)[$C_f$]
  ],
  [
    #cetz.canvas({
      import cetz.draw: *
      // Axes
      line((-2, 0), (4, 0), stroke: 0.5pt, mark: (end: ">"))
      line((0, -1), (0, 3.5), stroke: 0.5pt, mark: (end: ">"))
      content((4, -0.3), $x$)
      content((-0.3, 3.5), $y$)
      // Courbe Cg : fonction décroissante venant de +infini
      bezier((-1.5, 3), (-0.5, 1.5), (-1, 2.5), (-0.7, 1.8), stroke: blue + 1.5pt)
      bezier((-0.5, 1.5), (1, 0.5), (0, 1), (0.5, 0.7), stroke: blue + 1.5pt)
      bezier((1, 0.5), (3.5, -0.5), (2, 0), (3, -0.3), stroke: blue + 1.5pt)
    })
    #align(center)[$C_g$]
  ],
  [
    #cetz.canvas({
      import cetz.draw: *
      // Axes
      line((-0.5, 0), (6, 0), stroke: 0.5pt, mark: (end: ">"))
      line((0, -1.5), (0, 2.5), stroke: 0.5pt, mark: (end: ">"))
      content((6, -0.3), $x$)
      content((-0.3, 2.5), $y$)
      // Courbe Ch : oscillante amortie
      bezier((0.5, 2), (1, -1), (0.7, 0.5), (0.9, -0.5), stroke: blue + 1pt)
      bezier((1, -1), (1.5, 1.5), (1.1, 0.5), (1.3, 1.2), stroke: blue + 1pt)
      bezier((1.5, 1.5), (2, -0.8), (1.7, 0.3), (1.9, -0.5), stroke: blue + 1pt)
      bezier((2, -0.8), (2.5, 1), (2.2, 0.3), (2.4, 0.8), stroke: blue + 1pt)
      bezier((2.5, 1), (3, -0.5), (2.7, 0.2), (2.9, -0.3), stroke: blue + 1pt)
      bezier((3, -0.5), (3.5, 0.6), (3.2, 0.1), (3.4, 0.5), stroke: blue + 1pt)
      bezier((3.5, 0.6), (4, -0.3), (3.7, 0.1), (3.9, -0.2), stroke: blue + 1pt)
      bezier((4, -0.3), (5.5, 0.1), (4.5, 0.1), (5, 0.05), stroke: blue + 1pt)
    })
    #align(center)[$C_h$]
  ]
)

Donner une condition suffisante sur x pour que

a. $0 < f(x) < frac(1, 2)$ #h(2cm) ; #h(1cm) b. $-2 < g(x) < 1$ #h(2cm) ; #h(1cm) c. $|h(x) - 1| < frac(1, 4)$ .

// Source: Manuel T1 p.58
== Cours

=== 1. Limites infinies en $+ infinity$

==== Activité 1

On a représenté ci-contre les fonctions f et g définies sur $[1, + infinity[$ respectivement par $f(x) = (x - 1)^2$ et $g(x) = -(x - 1)^2$.

1. a. Que peut-on conjecturer sur $f(x)$ lorsque x prend des valeurs de plus en plus grandes ?

#h(0.5cm) b. Donner une condition suffisante sur x, pour que $f(x) > 10^6$.

#h(0.5cm) c. Soit $A > 0$. Donner une condition suffisante sur x, pour que $f(x) > A$.

2. a. Que peut-on conjecturer sur $g(x)$ lorsque x prend des valeurs de plus en plus grandes ?

#h(0.5cm) b. Donner une condition suffisante sur x, pour que $g(x) < -10^6$.

#h(0.5cm) c. Soit $A > 0$. Donner une condition suffisante sur x, pour que $g(x) < -A$.

#grid(
  columns: (1fr, 1fr),
  gutter: 2em,
  [
    #cetz.canvas({
      import cetz.draw: *
      // Axes
      line((-0.5, 0), (4, 0), stroke: 0.5pt, mark: (end: ">"))
      line((0, -0.5), (0, 4), stroke: 0.5pt, mark: (end: ">"))
      content((4, -0.3), $x$)
      content((-0.3, 4), $y$)
      // f(x) = (x-1)^2 croissante
      bezier((1, 0), (2, 1), (1.3, 0), (1.7, 0.5), stroke: blue + 1.5pt)
      bezier((2, 1), (3.2, 3.8), (2.5, 1.8), (3, 3.2), stroke: blue + 1.5pt)
      content((1, -0.3), $1$)
      content((-0.3, -0.3), $O$)
      // Annotation
      content((3.5, 3.5), text(size: 7pt)[$lim f(x) = ?$])
    })
  ],
  [
    #cetz.canvas({
      import cetz.draw: *
      // Axes
      line((-0.5, 0), (4, 0), stroke: 0.5pt, mark: (end: ">"))
      line((0, -4), (0, 0.5), stroke: 0.5pt, mark: (end: ">"))
      content((4, -0.3), $x$)
      content((-0.3, 0.5), $y$)
      // g(x) = -(x-1)^2 décroissante
      bezier((1, 0), (2, -1), (1.3, 0), (1.7, -0.5), stroke: blue + 1.5pt)
      bezier((2, -1), (3.2, -3.8), (2.5, -1.8), (3, -3.2), stroke: blue + 1.5pt)
      content((1, 0.3), $1$)
      // Annotation
      content((3.5, -3.5), text(size: 7pt)[$lim f(x) = ?$])
    })
  ]
)

#block(fill: rgb("#f0f7ff"), inset: 12pt, radius: 4pt, width: 100%)[
  *Définition*

  Soit a un réel et f une fonction définie sur $[a, + infinity[$.

  On dit que f admet pour limite $+ infinity$ quand x tend vers $+ infinity$ si,
  pour tout $A > 0$, il existe $B > 0$ tel que si $x gt.eq a$ et $x > B$
  alors $f(x) > A$.

  On note $lim_(x -> +infinity) f(x) = +infinity$ #h(0.5cm) ou #h(0.5cm) $lim f = +infinity$.

  On dit que f admet pour limite $-infinity$ quand x tend vers $+ infinity$ si,
  pour tout $A < 0$, il existe $B > 0$ tel que si $x gt.eq a$ et $x > B$
  alors $f(x) < A$.

  On note $lim_(x -> +infinity) f(x) = -infinity$ #h(0.5cm) ou #h(0.5cm) $lim f = -infinity$.
]

*Vocabulaire*

Lorsque $lim f = +infinity$, on dit que f tend vers $+infinity$ quand x tend vers $+infinity$, ou $f(x)$ tend vers $+infinity$ quand x tend vers $+infinity$, ou encore f tend vers $+infinity$ en $+infinity$.

Lorsque $lim f = -infinity$, on dit que f tend vers $-infinity$ quand x tend vers $+infinity$, ou $f(x)$ tend vers $-infinity$ quand x tend vers $+infinity$, ou encore f tend vers $-infinity$ en $+infinity$.

// Source: Manuel T1 p.59
==== Activité 2

Dans le plan muni d'un repère, on a représenté les courbes $C_g$ et $C_h$ des fonctions g et h.

Vérifier qu'aucune de ces fonctions ne tend vers $+infinity$ en $+infinity$.

#cetz.canvas({
  import cetz.draw: *
  // Axes
  line((-0.5, 0), (5, 0), stroke: 0.5pt, mark: (end: ">"))
  line((0, -1), (0, 3), stroke: 0.5pt, mark: (end: ">"))
  content((5, -0.3), $x$)
  content((-0.3, 3), $y$)
  // Cg : bornée oscillante
  bezier((0.5, 1), (1.5, 2.5), (0.8, 2), (1.2, 2.5), stroke: blue + 1.5pt)
  bezier((1.5, 2.5), (2.5, 0.5), (1.8, 2), (2.2, 0.8), stroke: blue + 1.5pt)
  bezier((2.5, 0.5), (3.5, 2.5), (2.8, 1), (3.2, 2.2), stroke: blue + 1.5pt)
  bezier((3.5, 2.5), (4.5, 0.5), (3.8, 2), (4.2, 0.8), stroke: blue + 1.5pt)
  // Ch : croissante bornée
  bezier((0.5, 0.3), (2, 1.5), (1, 0.8), (1.5, 1.3), stroke: red + 1.5pt)
  bezier((2, 1.5), (4.5, 2), (3, 1.8), (4, 1.95), stroke: red + 1.5pt)
})

==== Activité 3

On considère les fonctions définies sur $]-infinity, -1[$ par

$ f : x |-> x^2 quad ; quad g : x |-> x^3 quad ; quad h : x |-> sqrt(x) $

1. Soit $A > 0$ et $x lt.eq -1$.

#h(0.5cm) a. Donner une condition suffisante sur x pour que $f(x) > A$.

#h(0.5cm) b. Donner une condition suffisante sur x pour que $h(x) > A$.

2. En déduire le comportement de chacune des fonctions f, g et h au voisinage de $+infinity$.

Lorsqu'on étudie la limite de $f(x)$ quand x tend vers $+infinity$, il suffit d'étudier le comportement de $f(x)$, lorsque x est grand et prend de grandes valeurs.

On dit alors que l'on étudie le comportement de f au voisinage de $+infinity$.

==== Activité 4

Soit f et g deux fonctions définies sur $[2, +infinity[$ et telles que $lim_(x -> +infinity) f(x) = +infinity$ et $lim_(x -> +infinity) g(x) = -infinity$.

Justifier chacune des affirmations ci-dessous.

- Il existe $B > 2$ tel que $f(x) > 1$, pour tout $x > B$.
- Il existe $B > 2$ tel que $g(x) < -1$, pour tout $x > B$.
- La fonction f n'est pas majorée sur $[2, +infinity[$.
- La fonction g n'est pas minorée sur $[2, +infinity[$.

#block(fill: rgb("#fff7f0"), inset: 12pt, radius: 4pt, width: 100%)[
  *Remarque*

  Si $lim f = +infinity$ alors il existe un réel $B > 0$ tel que $f(x) > 0$, pour tout $x > B$.

  Si $lim f = -infinity$ alors il existe un réel $B > 0$ tel que $f(x) < 0$, pour tout $x > B$.
]

==== Activité 5

Le plan est muni d'un repère.

Les courbes $C_1$, $C_2$ et $C_3$ sont les représentations graphiques respectives des fonctions

$ x |-> sqrt(x) - 2 quad , quad x |-> (x - 2)^2 quad "et" quad x |-> (x - 2)^2 $

1. Donner l'ensemble de définition de chacune de ces fonctions.

2. Déterminer graphiquement les limites de chacune de ces fonctions en $+infinity$.

// Source: Manuel T1 p.60
==== Activité 6

Soit k la fonction définie sur $[1, +infinity[$ par $k(x) = x^n$,
où n est un entier supérieur ou égal à 1.

1. Soit $A > 0$ et $x gt.eq 1$. Donner une condition suffisante sur x, pour que $k(x) > A$.

2. Déterminer la limite de k lorsque x tend vers $+infinity$.

#block(fill: rgb("#e8f5e9"), inset: 12pt, radius: 4pt, width: 100%)[
  *Théorème*

  Pour tout réel a et tout entier naturel n non nul, $lim_(x -> +infinity) sqrt(x - a) = +infinity$ ; $lim_(x -> +infinity) (x - a)^n = +infinity$.
]

=== 2. Limites infinies en $- infinity$

==== Activité 1

Le plan est muni d'un repère.

On a représenté ci-contre les fonctions f et g définies sur $]-infinity, -1]$ respectivement par $f(x) = (x + 1)^2$ et $g(x) = -(x + 1)^2$.

1. Soit $A > 0$ et $x lt.eq -1$. Donner une condition suffisante sur x, pour que $f(x) > A$.

2. Soit $A < 0$ et $x lt.eq -1$. Donner une condition suffisante sur x pour que $g(x) < A$.

#grid(
  columns: (1fr, 1fr),
  gutter: 2em,
  [
    #cetz.canvas({
      import cetz.draw: *
      // Axes
      line((-4, 0), (0.5, 0), stroke: 0.5pt, mark: (end: ">"))
      line((0, -0.5), (0, 4), stroke: 0.5pt, mark: (end: ">"))
      content((0.5, -0.3), $x$)
      content((-0.3, 4), $y$)
      // f(x) = (x+1)^2
      bezier((-1, 0), (-2, 1), (-1.3, 0), (-1.7, 0.5), stroke: blue + 1.5pt)
      bezier((-2, 1), (-3.2, 3.8), (-2.5, 1.8), (-3, 3.2), stroke: blue + 1.5pt)
      content((-1, -0.3), $-1$)
    })
  ],
  [
    #cetz.canvas({
      import cetz.draw: *
      // Axes
      line((-4, 0), (0.5, 0), stroke: 0.5pt, mark: (end: ">"))
      line((0, -4), (0, 0.5), stroke: 0.5pt, mark: (end: ">"))
      content((0.5, -0.3), $x$)
      content((-0.3, 0.5), $y$)
      // g(x) = -(x+1)^2
      bezier((-1, 0), (-2, -1), (-1.3, 0), (-1.7, -0.5), stroke: blue + 1.5pt)
      bezier((-2, -1), (-3.2, -3.8), (-2.5, -1.8), (-3, -3.2), stroke: blue + 1.5pt)
      content((-1, 0.3), $-1$)
    })
  ]
)

#block(fill: rgb("#f0f7ff"), inset: 12pt, radius: 4pt, width: 100%)[
  *Définition*

  Soit a un réel et f une fonction définie sur $]-infinity, a]$.

  On dit que f admet pour limite $+infinity$ quand x tend vers $-infinity$ si,
  pour tout $A > 0$, il existe $B < 0$ tel que si $x lt.eq a$ et $x < B$
  alors $f(x) > A$.

  On note $lim_(x -> -infinity) f(x) = +infinity$ #h(0.5cm) ou #h(0.5cm) $lim f = +infinity$.

  On dit que f admet pour limite $-infinity$ quand x tend vers $-infinity$ si,
  pour tout $A < 0$, il existe $B < 0$ tel que si $x lt.eq a$ et $x < B$
  alors $f(x) < A$.

  On note $lim_(x -> -infinity) f(x) = -infinity$ #h(0.5cm) ou #h(0.5cm) $lim f = -infinity$.
]

// Source: Manuel T1 p.61
*Vocabulaire*

Lorsque $lim f = +infinity$, on dit que f tend vers $+infinity$ quand x tend vers $-infinity$, ou $f(x)$ tend vers $+infinity$ quand x tend vers $-infinity$, ou encore f tend vers $+infinity$ en $-infinity$.

Lorsque $lim f = -infinity$, on dit que f tend vers $-infinity$ quand x tend vers $-infinity$, ou $f(x)$ tend vers $-infinity$ quand x tend vers $-infinity$, ou encore f tend vers $-infinity$ en $-infinity$.

==== Activité 2

Dans le plan muni d'un repère, on a représenté les courbes $C_g$ et $C_h$ des fonctions g et h.

Vérifier qu'aucune de ces fonctions ne tend vers $-infinity$ en $-infinity$.

==== Activité 3

On considère les fonctions définies sur $]-infinity, -1]$ par

$ f : x |-> x^2 quad ; quad g : x |-> x^3 quad ; quad h : x |-> sqrt(x) $

1. Soit $A > 0$ et $x lt.eq -1$.

#h(0.5cm) a. Donner une condition suffisante sur x pour que $f(x) > A$.

#h(0.5cm) b. Donner une condition suffisante sur x pour que $g(x) < -A$.

2. En déduire le comportement de chacune des fonctions f, g et h au voisinage de $-infinity$.

==== Activité 4

Soit f et g deux fonctions définies sur $]-infinity, -1]$ et telles que $lim_(x -> -infinity) f(x) = +infinity$ et $lim_(x -> -infinity) g(x) = -infinity$.

Justifier chacune des affirmations ci-dessous.

- Il existe $B < -1$ telle que $f(x) > 1$, pour tout $x < B$.
- Il existe $B < -1$ telle que $g(x) < -1$, pour tout $x < B$.
- La fonction f n'est pas majorée sur $]-infinity, -1]$.
- La fonction g n'est pas minorée sur $]-infinity, -1]$.

#block(fill: rgb("#fff7f0"), inset: 12pt, radius: 4pt, width: 100%)[
  *Remarque*

  Si $lim f = +infinity$ alors il existe un réel $B < 0$ tel que $f(x) > 0$, pour tout $x < B$.

  Si $lim f = -infinity$ alors il existe un réel $B < 0$ tel que $f(x) < 0$, pour tout $x < B$.
]

// Source: Manuel T1 p.62
==== Activité 5

Le plan est muni d'un repère.

Les courbes $C_1$, $C_2$ et $C_3$ sont les représentations graphiques respectives des fonctions

$ x |-> sqrt(2 - x) quad , quad x |-> (x - 2)^2 quad "et" quad x |-> (x - 2)^3 $

1. Donner l'ensemble de définition de chacune de ces fonctions.

2. Déterminer graphiquement les limites de chacune de ces fonctions en $-infinity$.

==== Activité 6

Soit k la fonction définie sur $]-infinity, -1]$ par $k(x) = x^n$,
où n est un entier supérieur ou égal à 1.

Discuter suivant la parité de n, la limite de k lorsque x tend vers $-infinity$.

#block(fill: rgb("#e8f5e9"), inset: 12pt, radius: 4pt, width: 100%)[
  *Théorème*

  Pour tout réel a et tout entier naturel n non nul,

  $ lim_(x -> +infinity) sqrt(x - a) = +infinity quad ; quad lim_(x -> -infinity) (x - a)^(2n) = +infinity quad ; quad lim_(x -> -infinity) (x - a)^(2n+1) = -infinity $
]

=== 3. Limites finies en $+ infinity$ ou en $- infinity$

==== Activité 1

Le plan est muni d'un repère orthonormé $(O, arrow(i), arrow(j))$.

On a représenté ci-contre la fonction f définie sur $[2, +infinity[$ par $f(x) = frac((x - 1)^2, x^2)$.

1. Que peut-on conjecturer sur $f(x)$ lorsque x tend vers $+infinity$ ?

2. a. Donner une condition suffisante sur les réels x, pour que $|f(x) - 1| < 10^(-2)$.

#h(0.5cm) b. Soit $beta > 0$. Donner une condition suffisante sur les réels x, pour que $|f(x) - 1| < beta$.

3. Soit M le point de coordonnées $(x, f(x))$ et P le point de coordonnées $(x, 1)$.

Que peut-on dire de la distance PM lorsque x tend vers $+infinity$ ?

#cetz.canvas({
  import cetz.draw: *
  // Axes
  line((-0.5, 0), (5, 0), stroke: 0.5pt, mark: (end: ">"))
  line((0, -0.5), (0, 2.5), stroke: 0.5pt, mark: (end: ">"))
  content((5, -0.3), $x$)
  content((-0.3, 2.5), $y$)
  // Asymptote y = 1
  line((0, 1.5), (5, 1.5), stroke: (dash: "dashed", paint: gray))
  content((-0.3, 1.5), $1$)
  // Courbe f(x) = (x-1)^2/x^2 approchant 1 par en dessous
  bezier((0.5, 0), (1.5, 0.5), (0.8, 0.1), (1.2, 0.3), stroke: blue + 1.5pt)
  bezier((1.5, 0.5), (3, 1.2), (2, 0.8), (2.5, 1.1), stroke: blue + 1.5pt)
  bezier((3, 1.2), (4.8, 1.45), (3.5, 1.3), (4.2, 1.4), stroke: blue + 1.5pt)
})

// Source: Manuel T1 p.63
==== Activité 2

Le plan est muni d'un repère orthonormé $(O, arrow(i), arrow(j))$.

Nous avons représenté ci-contre la fonction f définie sur $]-infinity, 0]$ par $f(x) = frac(1, (x - 1)^2)$.

1. Que peut-on conjecturer sur $f(x)$ lorsque x tend vers $-infinity$ ?

2. a. Donner une condition suffisante sur x, pour que $|f(x) - 1| < 10^(-2)$.

#h(0.5cm) b. Soit $beta > 0$. Donner une condition suffisante sur x, pour que $|f(x) - 1| < beta$.

3. Soit M le point de coordonnées $(x, f(x))$ et P le point de coordonnées $(x, 1)$.

Que peut-on dire de la distance PM lorsque x tend vers $-infinity$ ?

#block(fill: rgb("#f0f7ff"), inset: 12pt, radius: 4pt, width: 100%)[
  *Définition*

  Soit a un réel et f une fonction définie sur l'intervalle $[a, +infinity[$.

  On dit que f admet pour limite L quand x tend vers $+infinity$ si, pour tout $beta > 0$, il existe un réel $B > 0$ tel que si $x gt.eq a$ et $x > B$ alors $|f(x) - L| < beta$.

  On note $lim_(x -> +infinity) f(x) = L$ #h(0.5cm) ou #h(0.5cm) $lim f = L$.
]

#block(fill: rgb("#f0f7ff"), inset: 12pt, radius: 4pt, width: 100%)[
  *Définition*

  Soit a un réel et f une fonction définie sur l'intervalle $]-infinity, a]$.

  On dit que f admet pour limite L quand x tend vers $-infinity$ si, pour tout $beta > 0$, il existe un réel $B < 0$ tel que si $x lt.eq a$ et $x < B$ alors $|f(x) - L| < beta$.

  On note $lim_(x -> -infinity) f(x) = L$ #h(0.5cm) ou #h(0.5cm) $lim f = L$.
]

#block(fill: rgb("#e8f5e9"), inset: 12pt, radius: 4pt, width: 100%)[
  *Théorème (admis)*

  Si une fonction admet une limite L en $+infinity$ (respectivement en $-infinity$) alors cette limite est unique.

  On note $lim_(x -> +infinity) f(x) = L$ #h(0.5cm) ou #h(0.5cm) $lim f = L$ (respectivement $lim_(x -> -infinity) f(x) = L$ #h(0.5cm) ou #h(0.5cm) $lim f = L$).
]

*Vocabulaire*

Lorsque $lim f = L$, on dit que f tend vers L quand x tend vers $+infinity$, ou $f(x)$ tend vers L quand x tend vers $+infinity$, ou encore f tend vers L en $+infinity$.

Lorsque $lim f = L$, on dit que f tend vers L quand x tend vers $-infinity$, ou $f(x)$ tend vers L quand x tend vers $-infinity$, ou encore f tend vers L en $-infinity$.

// Source: Manuel T1 p.64
==== Activité 3

1. Soit f une fonction telle que $lim_(x -> +infinity) f = +infinity$.

#h(0.5cm) Que peut-on dire de la limite de $frac(1, f)$ en $+infinity$ ?

2. Si on suppose que $lim_(x -> +infinity) f = -infinity$, que peut-on dire de limite de $frac(1, f)$ en $+infinity$ ?

3. Que peut-on dire de la limite de $frac(1, f)$ dans le cas où f tend vers $-infinity$ en $+infinity$ ou $-infinity$ ?

#block(fill: rgb("#e8f5e9"), inset: 12pt, radius: 4pt, width: 100%)[
  *Théorème (admis)*

  Déduire du théorème précédent les résultats ci-dessous.

  Si $lim f = +infinity$ alors $lim frac(1, f) = 0$. #h(1cm) Si $lim f = -infinity$ alors $lim frac(1, f) = 0$.

  Si $lim f = +infinity$ alors $lim frac(1, f^2) = 0$. #h(1cm) Si $lim f = -infinity$ alors $lim frac(1, f^2) = 0$.
]

==== Activité 4

Déduire du théorème précédent les résultats ci-dessous.

Pour tout réel a et tout entier non nul n,

$ lim_(x -> +infinity) frac(1, (x - a)^n) = 0 quad ; quad lim_(x -> -infinity) frac(1, (x - a)^n) = 0 quad ; quad lim_(x -> +infinity) frac(1, sqrt(x - a)) = 0 $

=== 4. Asymptotes horizontales

==== Activité 1

Soit f une fonction telle que $lim_(x -> +infinity) f(x) = 1$.

Soit $C_f$ la courbe représentative de f dans un repère orthonormé $(O, arrow(i), arrow(j))$.

M le point de coordonnées $(x, f(x))$ et P le point de coordonnées $(x, 1)$.

Montrer que la distance PM tend vers 0.

#block(fill: rgb("#f0f7ff"), inset: 12pt, radius: 4pt, width: 100%)[
  *Définition*

  Soit f une fonction et $C_f$ sa courbe représentative dans un repère.

  Lorsque $lim_(x -> +infinity) f(x) = L$, on dit que la droite d'équation $y = L$ est une asymptote horizontale à la courbe $C_f$ au voisinage de $+infinity$.

  Lorsque $lim_(x -> -infinity) f(x) = L$, on dit que la droite d'équation $y = L$ est une asymptote horizontale à la courbe $C_f$ au voisinage de $-infinity$.
]

#grid(
  columns: (1fr, 1fr),
  gutter: 2em,
  [
    #cetz.canvas({
      import cetz.draw: *
      // Axes
      line((-0.5, 0), (5, 0), stroke: 0.5pt, mark: (end: ">"))
      line((0, -0.5), (0, 3), stroke: 0.5pt, mark: (end: ">"))
      content((5, -0.3), $x$)
      content((-0.3, 3), $y$)
      // Asymptote y = L
      line((0, 1.5), (5, 1.5), stroke: (dash: "dashed", paint: red))
      content((-0.3, 1.5), $L$)
      // Courbe approchant L par dessus
      bezier((0.5, 2.8), (2, 2), (1, 2.5), (1.5, 2.1), stroke: blue + 1.5pt)
      bezier((2, 2), (4.5, 1.6), (3, 1.7), (4, 1.6), stroke: blue + 1.5pt)
      content((4.5, 2), text(size: 7pt)[$lim f(x) = L$])
    })
  ],
  [
    #cetz.canvas({
      import cetz.draw: *
      // Axes
      line((-5, 0), (0.5, 0), stroke: 0.5pt, mark: (end: ">"))
      line((0, -0.5), (0, 3), stroke: 0.5pt, mark: (end: ">"))
      content((0.5, -0.3), $x$)
      content((-0.3, 3), $y$)
      // Asymptote y = L
      line((-5, 1.5), (0, 1.5), stroke: (dash: "dashed", paint: red))
      content((0.3, 1.5), $L$)
      // Courbe approchant L par dessous
      bezier((-4.5, 1.2), (-2, 1.4), (-3.5, 1.3), (-2.5, 1.35), stroke: blue + 1.5pt)
      bezier((-2, 1.4), (-0.5, 0.5), (-1.5, 1.3), (-0.8, 0.7), stroke: blue + 1.5pt)
      content((-4.5, 1.8), text(size: 7pt)[$lim f(x) = L$])
    })
  ]
)

// Source: Manuel T1 p.65
=== 5. Limites infinies en un réel

==== Activité 1

Le plan est muni d'un repère. On a représenté ci-contre, les fonctions b et t définies sur $]0, 1[ union ]1, +infinity[$ respectivement par $b(x) = frac(1, (x - 1)^2)$ et $t(x) = frac(-1, (x - 1)^2)$.

1. Déterminer le signe de chacune des fonctions b et t.

2. a. Que peut-on dire de $b(x)$ lorsque x se rapproche de 1, en restant supérieur à 1 ?

#h(0.5cm) b. En déduire le comportement de b lorsque x tend vers 1 à droite.

3. a. Que peut-on dire de $b(x)$ lorsque x se rapproche de 1, en restant inférieur à 1 ?

#h(0.5cm) b. En déduire le comportement de b lorsque x tend vers 1 à gauche.

4. Étudier le comportement de t lorsque x tend vers 1.

#cetz.canvas({
  import cetz.draw: *
  // Axes
  line((-0.5, 0), (4, 0), stroke: 0.5pt, mark: (end: ">"))
  line((0, -3), (0, 3.5), stroke: 0.5pt, mark: (end: ">"))
  content((4, -0.3), $x$)
  content((-0.3, 3.5), $y$)
  content((1.5, -0.3), $1$)
  // Asymptote verticale x = 1.5
  line((1.5, -3), (1.5, 3.5), stroke: (dash: "dashed", paint: gray))
  // b(x) = 1/(x-1)^2 (au-dessus)
  bezier((0.5, 0.5), (1.2, 3), (0.8, 0.8), (1.1, 2), stroke: blue + 1.5pt)
  bezier((1.8, 3), (3, 0.5), (2, 2), (2.5, 0.8), stroke: blue + 1.5pt)
  // t(x) = -1/(x-1)^2 (en-dessous)
  bezier((0.5, -0.5), (1.2, -3), (0.8, -0.8), (1.1, -2), stroke: red + 1.5pt)
  bezier((1.8, -3), (3, -0.5), (2, -2), (2.5, -0.8), stroke: red + 1.5pt)
})

#block(fill: rgb("#f0f7ff"), inset: 12pt, radius: 4pt, width: 100%)[
  *Définition*

  Soit f une fonction définie sur un intervalle ouvert I, sauf en un réel a de I.

  On dit que la fonction f a pour limite $+infinity$, à droite en a si, pour tout $A > 0$,
  il existe $alpha > 0$ tel que si x appartient à I et $0 < a - x < alpha$ alors $f(x) > A$.

  On note $lim_(x -> a^+) f(x) = +infinity$ #h(0.5cm) ou #h(0.5cm) $lim f = +infinity$.

  On dit que la fonction f a pour limite $+infinity$, à gauche en a si, pour tout $A > 0$,
  il existe $alpha > 0$ tel que si x appartient à I et $0 < a - x < alpha$ alors $f(x) > A$.

  On note $lim_(x -> a^-) f(x) = +infinity$ #h(0.5cm) ou #h(0.5cm) $lim f = +infinity$.
]

// Source: Manuel T1 p.66
#block(fill: rgb("#f0f7ff"), inset: 12pt, radius: 4pt, width: 100%)[
  *Définition*

  Soit f une fonction définie sur un intervalle ouvert I, sauf en un réel a de I.

  On dit que la fonction f a pour limite $-infinity$, à droite en a (respectivement à gauche en a) si la fonction $-f$ a pour limite $+infinity$, à droite en a (respectivement à gauche en a).
]

#block(fill: rgb("#f0f7ff"), inset: 12pt, radius: 4pt, width: 100%)[
  *Définition*

  Soit f une fonction définie sur un intervalle ouvert I, sauf en un réel a de I.

  On dit que la fonction f a pour limite $+infinity$ en a si $lim_(x -> a^+) f = lim_(x -> a^-) f = +infinity$. On note $lim f = +infinity$.

  On dit que la fonction f a pour limite $-infinity$ en a si $lim_(x -> a^+) f = lim_(x -> a^-) f = -infinity$. On note $lim f = -infinity$.
]

==== Activité 2

Soit une fonction f définie sur un intervalle I, sauf peut être en un réel a de I, telle que $f(x) eq.not 0$, $x eq.not a$.

1. a. On suppose que f est positive sur I et $lim f = 0$. Que peut-on conjecturer sur $lim frac(1, f)$ ?

#h(0.5cm) b. On suppose que f est négative sur I et $lim f = 0$. Que peut-on conjecturer sur $lim frac(1, f)$ ?

2. Reprendre les mêmes questions dans le cas où $lim f = 0$.

==== Activité 3

Utiliser l'activité précédente pour justifier les résultats ci-dessous.

#block(fill: rgb("#e8f5e9"), inset: 12pt, radius: 4pt, width: 100%)[
  Pour tout réel a et tout entier naturel n non nul, on a

  $ lim_(x -> a^+) frac(1, (x - a)^n) = +infinity quad ; quad lim_(x -> a^-) frac(1, (x - a)^n) = (-1)^n dot infinity $
]

// Source: Manuel T1 p.67
=== 6. Asymptotes verticales

#block(fill: rgb("#f0f7ff"), inset: 12pt, radius: 4pt, width: 100%)[
  *Définition*

  Soit f une fonction définie sur un intervalle ouvert I, sauf en un réel a de I et $C_f$ sa courbe représentative dans un repère $(O, arrow(i), arrow(j))$.

  Si la limite de f, à droite en a (respectivement à gauche en a), est infinie, on dit que la droite d'équation $x = a$ est une asymptote verticale à la courbe $C_f$, à droite en a (respectivement à gauche en a).
]

==== Activité 1

Le plan est muni d'un repère $(O, arrow(i), arrow(j))$. Soit g la fonction définie sur $RR$ par $g(x) = (x - 1)^3$.

1. a. Que vaut la limite de g à droite en 1 ?

#h(0.5cm) b. Que vaut la limite de g à gauche en 1 ?

2. Déterminer la limite de $frac(1, g)$ à droite et à gauche en 1.

Que représente la droite d'équation $x = 1$, pour la courbe de $frac(1, g)$ ?

==== Activité 2

Le plan est muni d'un repère $(O, arrow(i), arrow(j))$.

Soit les fonctions $f : x |-> frac(x^2, (x + 4)^2) - 2$ et $g : x |-> frac(1, (x + 4)^2) - 0.75$.

Étudier le comportement de chacune des fonctions aux bornes de son ensemble de définition, en précisant les asymptotes à leurs courbes représentatives.

=== 7. Opérations sur les limites

Nous admettrons les résultats qui suivent et qui concernent les limites en un réel ou en l'infini, de la somme, du produit et du quotient et de la valeur absolue.

#table(
  columns: (auto, auto, auto, auto, auto, auto),
  inset: 8pt,
  align: center,
  [$lim f$], [$lim g$], [$lim(f+g)$], [], [$L$], [$L'$],
  [$L$], [$+infinity$], [$+infinity$], [], [$L$], [$L'times L$],
  [$+infinity$], [$+infinity$], [$+infinity$], [], [$L$], [$0$],
  [$-infinity$], [$-infinity$], [$-infinity$], [], [], [],
  [$+infinity$], [$-infinity$], [*F.I.*], [], [], [],
)

#table(
  columns: (auto, auto, auto),
  inset: 8pt,
  align: center,
  [$lim f$], [$lim g$], [$lim(f times g)$],
  [$L$], [$L'$], [$L times L'$],
  [$L eq.not 0$], [$plus.minus infinity$], [$plus.minus infinity$],
  [$+infinity$], [$+infinity$], [$+infinity$],
  [$-infinity$], [$-infinity$], [$+infinity$],
  [$+infinity$], [$-infinity$], [$-infinity$],
  [$0$], [$plus.minus infinity$], [*F.I.*],
)

#table(
  columns: (auto, auto, auto),
  inset: 8pt,
  align: center,
  [$lim f$], [$lim |f|$],
  [$L$], [$|L|$],
  [$plus.minus infinity$], [$+infinity$],
)

#table(
  columns: (auto, auto, auto),
  inset: 8pt,
  align: center,
  [$lim f$], [$lim g$], [$lim frac(f, g)$],
  [$L$], [$L' eq.not 0$], [$frac(L, L')$],
  [$L$], [$plus.minus infinity$], [$0$],
  [$plus.minus infinity$], [$L' eq.not 0$], [$plus.minus infinity$],
  [$plus.minus infinity$], [$plus.minus infinity$], [*F.I.*],
  [$L$], [$0$], [*c'est une application de la règle des signes*],
)

// Source: Manuel T1 p.68
==== Activité 1

Calculer les limites ci-dessous.

$ lim_(x -> +infinity) (x + frac(1, x) - 1) quad ; quad lim_(x -> +infinity) (x + frac(1, x) - 1) quad ; quad lim_(x -> -infinity) sqrt(x + frac(1, x^2)) $

$ lim (x - sqrt(-x + 1)) quad ; quad lim_(x -> 2^+) (x + frac(3, (x - 2)^2)) quad ; quad lim_(x -> -1) (frac(3, sqrt(x - 1)) - frac(1, (x - 1)^2) + 1) $

==== Activité 2

Calculer les limites ci-dessous.

$ lim_(x -> +infinity) x(1 - frac(1, x^2)) quad ; quad lim_(x -> -infinity) frac(-x sqrt(2), (x - 2)^3) quad ; quad lim_(x -> +infinity) (frac(1, (x - 2)^2) - 1) $

$ lim_(x -> -infinity) frac(x^2, (x - 2)^3) times frac(-x - 0.5}{(x - 2)^3)} quad ; quad lim_(x -> +infinity) frac(1, x + 1) times frac(1, (sqrt(x) + 1)) $

==== Activité 3

Calculer les limites ci-dessous.

$ lim_(x -> +infinity) frac(1, x^2 - 3x) quad ; quad lim_(x -> +infinity) frac(x + x, x - 3x) quad ; quad lim_(x -> +infinity) frac(1, x times x times 100 + 1) quad ; quad lim_(x -> +infinity) frac(-5, (x - 1)^2 (sqrt(x) + 3)) $

=== 8. Limites d'une fonction polynôme ou d'une fonction rationnelle

==== Activité 1

1. a. Vérifier que pour tout réel non nul $x$, $x^2 - x + 1 = x^2 (1 - frac(1, x) + frac(1, x^2))$.

#h(0.5cm) b. En déduire que $lim_(x -> +infinity) (x^2 - x + 1) = lim_(x -> +infinity) x^2$.

2. Soit f la fonction polynôme définie par $f(x) = a_n x^n + a_(n-1) x^(n-1) + dots.h + a_1 x + a_0$, où $a_n eq.not 0$.

On se propose de montrer que $lim_(x -> +infinity) f(x) = lim_(x -> +infinity) a_n x^n$.

// Source: Manuel T1 p.69
#h(0.5cm) a. Vérifier que $f(x) = a_n x^n (1 + frac(a_(n-1), a_n x) + dots.h + frac(a_0, a_n x^n))$, pour tout réel non nul x.

#h(0.5cm) b. Calculer $lim_(x -> +infinity) (1 + frac(a_(n-1), a_n x) + dots.h + frac(a_0, a_n x^n))$.

#h(0.5cm) c. Conclure.

3. Montrer que $lim_(x -> -infinity) f(x) = lim_(x -> -infinity) a_n x^n$.

#block(fill: rgb("#fff7f0"), inset: 12pt, radius: 4pt, width: 100%)[
  *Remarque*

  La limite d'une fonction polynôme, quand la variable tend vers l'infini, est la même que celle de son terme de plus haut degré.
]

==== Activité 2

Calculer les limites ci-dessous.

$ lim_(x -> +infinity) (x^3 - 3x^2 + 2x - 1) quad ; quad lim_(x -> -infinity) (-x^3 - x^2 + 4x + 1)^2 quad ; quad lim_(x -> +infinity) (5x^5 - x - 1)^2 - 125 x^(10) quad ; quad lim_(x -> -infinity) (5x^5 - x)^3 $

==== Activité 3

1. Soit f la fonction rationnelle définie par $f(x) = frac(3x^2 - x + 1, -2x + 1)$.

#h(0.5cm) a. Vérifier que $f(x) = frac(x^2, x) Q(x)$ avec $Q(x) = frac(3 - frac(1, x) + frac(1, x^2), -2 + frac(1, x)) = frac(3x, -2x)$.

#h(0.5cm) b. En déduire la limite de f en $+infinity$.

2. Soit f la fonction rationnelle définie par

$ f(x) = frac(a_n x^n + dots.h + a_1 x + a_0, b_p x^p + dots.h + b_1 x + b_0) quad "où" quad a_n eq.not 0 "et" b_p eq.not 0. $

#h(0.5cm) a. Vérifier que $f(x) = frac(x^n, x^p) Q(x)$ avec $Q(x) = frac(a_n + frac(a_(n-1), x) + dots.h, b_p + frac(b_(p-1), x) + dots.h)$.

#h(0.5cm) b. En déduire le résultat ci-dessous.

#block(fill: rgb("#fff7f0"), inset: 12pt, radius: 4pt, width: 100%)[
  *Remarque*

  La limite d'une fonction rationnelle, quand la variable tend vers l'infini est la même que celle du quotient des termes de plus haut degré.
]

==== Activité 4

Calculer les limites ci-dessous.

$ lim_(x -> +infinity) frac(x^3 - 3x^2 + 2x - 1, (2x + 5)^2) quad ; quad lim_(x -> -infinity) frac([X]^(-3), x + 1) quad ; quad lim_(x -> -infinity) (frac(x^2 + 1, x + 1))^3 quad ; quad lim_(x -> +infinity) frac(-5, (x - 1)^2 dot x^(10)) $

// Source: Manuel T1 p.70
==== Activité 5

Le plan est muni d'un repère $(O, arrow(i), arrow(j))$.

On considère la fonction h définie par $h(x) = frac(2x^2 - 1, x)$.

Étudier les limites de h aux bornes de son ensemble de définition, en précisant les asymptotes à sa courbe représentative.

==== Activité 6

#block(fill: rgb("#fff7f0"), inset: 12pt, radius: 4pt, width: 100%)[
  *Remarque*

  Dans le plan muni d'un repère, $C_1$ et $C_2$ sont les représentations graphiques respectives des fonctions $f : x |-> frac(x^2, (x - 1)^2) + 1000$ et $g : x |-> frac(x^2, (x - 1)^2) - 2000$.
]

1. Donner les ensembles de définition de f.

2. Donner les limites de f aux bornes de son ensemble de définition et préciser les asymptotes à $C_1$.

3. Reprendre les mêmes questions pour la fonction g.

==== Activité 7

On considère la fonction $f : x |-> frac(x^2 - 1, sqrt(|x - 1|))$.

1. Donner l'expression de $f(x)$ lorsque $x > 1$, puis lorsque $x < 1$.

2. Déterminer les limites de f aux bornes de son ensemble de définition et préciser les asymptotes à sa courbe représentative.

==== Activité 8

Le plan est muni d'un repère $(O, arrow(i), arrow(j))$.

On considère la fonction $f : x |-> frac(2x^2 + 5x - 1, x^2 - 3x - 4)$.

1. Donner l'ensemble de définition de f.

2. Déterminer les limites de f aux bornes de son ensemble de définition, en précisant les asymptotes à sa courbe représentative.

// Source: Manuel T1 p.71
=== 9. Limites de $sqrt(f)$

Nous admettrons le théorème ci-dessous qui nous donne la limite de $sqrt(f)$ lorsqu'on connaît la limite de f.

#block(fill: rgb("#e8f5e9"), inset: 12pt, radius: 4pt, width: 100%)[
  Soit f une fonction positive, à fini ou infini et L un réel.

  Si $lim f = L$ alors $lim sqrt(f) = sqrt(L)$. #h(1cm) Si $lim f = +infinity$ alors $lim sqrt(f) = +infinity$.
]

==== Activité 1

Calculer les limites ci-dessous.

$ lim_(x -> +infinity) frac(1, sqrt(x)) quad ; quad lim_(x -> +infinity) frac(-1, sqrt(x^2 + 1)) quad ; quad lim_(x -> -infinity) frac(1, sqrt(x^2 + 1)) quad ; quad lim_(x -> +infinity) sqrt(frac(3 times 5 dot 10, x^2) + 1) $

==== Activité 2

Le plan est muni d'un repère $(O, arrow(i), arrow(j))$.

On considère la fonction $f : x |-> frac(sqrt(1 + x) times x, x times 1)$.

1. Donner l'ensemble de définition de f, on le note D.

2. a. Montrer que $f(x) = frac(1, -1 times (x+1) times x + 1)$ pour tout réel x de D.

#h(0.5cm) b. En déduire les limites de f aux bornes de D.

#h(0.5cm) c. Montrer que f admet un prolongement par continuité en 0, que l'on déterminera.

3. Préciser les asymptotes à la courbe représentative de f.

==== Activité 3

On considère la fonction f définie par $f : ] -1, +infinity [ -> RR$ par $f(x) = sqrt(x + x) - x - 1$.

1. Montrer que pour tout réel positif x, $f(x) = (x + 1)(frac(1, sqrt(x + 1)) - 1)$.

2. En déduire la limite de f en $+infinity$.

=== 10. Asymptotes obliques

==== Activité 1

Soit f une fonction telle que $lim_(x -> +infinity) f(x) = +infinity$.

Soit $C_f$ la courbe représentative de f dans un repère orthonormé $(O, arrow(i), arrow(j))$.
On considère une droite D d'équation $y = alpha x + beta$.

On désigne par M le point de coordonnées $(x, f(x))$ et P le point de coordonnées $(x, alpha x + beta)$.

Montrer que si $lim (f(x) - (alpha x + beta)) = 0$ alors la distance PM tend vers 0.

// Source: Manuel T1 p.72
#block(fill: rgb("#f0f7ff"), inset: 12pt, radius: 4pt, width: 100%)[
  *Définition*

  Soit f une fonction et $C_f$ sa courbe représentative dans un repère $(O, arrow(i), arrow(j))$.

  Lorsque $lim_(x -> +infinity) (f(x) - (alpha x + beta)) = 0$, on dit que la droite d'équation $y = alpha x + beta$ est une asymptote oblique à la courbe $C_f$ de f au voisinage de $+infinity$.

  Lorsque $lim_(x -> -infinity) (f(x) - (alpha x + beta)) = 0$, on dit que la droite d'équation $y = alpha x + beta$ est une asymptote oblique à la courbe $C_f$ au voisinage de $-infinity$.
]

#cetz.canvas({
  import cetz.draw: *
  // Axes
  line((-0.5, 0), (5, 0), stroke: 0.5pt, mark: (end: ">"))
  line((0, -0.5), (0, 4), stroke: 0.5pt, mark: (end: ">"))
  content((5, -0.3), $x$)
  content((-0.3, 4), $y$)
  // Asymptote oblique y = ax + b
  line((0, 0.5), (4.5, 3.5), stroke: (dash: "dashed", paint: red))
  content((4.8, 3.5), text(size: 7pt)[$Delta$])
  // Courbe au-dessus puis se rapprochant
  bezier((0.5, 2.5), (2, 2.5), (1, 2.8), (1.5, 2.6), stroke: blue + 1.5pt)
  bezier((2, 2.5), (4.5, 3.3), (3, 2.8), (4, 3.2), stroke: blue + 1.5pt)
  // Points M et P
  content((3, 1.5), text(size: 7pt)[$M$])
  content((3, 2.3), text(size: 7pt)[$P$])
})

==== Activité 2

On considère la fonction $f : x |-> frac(3x^2 - 2x - 3, x - 1)$ et on note C sa courbe représentative dans le plan muni d'un repère orthonormé.

1. Donner son ensemble de définition D.

#h(0.5cm) b. Calculer les limites de f aux bornes de D.

2. Vérifier que, pour tout $x gt.eq 2$, $f(x) = 3x + frac(5, x - 1) + frac(5, 2)$.

3. Calculer $lim_(x -> +infinity) (f(x) - 3x - frac(5, 2))$.

#h(0.5cm) b. Expliquer pourquoi la droite $Delta$ d'équation $y = 3x + 4$ est asymptote oblique à C au voisinage de $+infinity$ et de $-infinity$.

#h(0.5cm) c. Étudier la position de C par rapport à $Delta$.

==== Activité 3

On considère la fonction $f : x |-> sqrt(x^2 + 4x + 3)$ et on note C sa courbe représentative dans le plan muni d'un repère orthonormé.

1. a. Donner son ensemble de définition D.

#h(0.5cm) b. Calculer les limites de f aux bornes de D.

2. a. Déterminer la forme canonique du trinôme $x^2 + 4x + 3$.

#h(0.5cm) b. Déterminer alors $lim_(x -> +infinity) (f(x) - (x + 2))$ et $lim_(x -> -infinity) (f(x) - (-x - 2))$.

#h(0.5cm) c. En déduire que C admet une asymptote oblique au voisinage de $+infinity$ et une autre au voisinage de $-infinity$.

// Source: Manuel T1 p.73
== QCM - Vrai ou faux

=== QCM

Cocher la réponse exacte.

1. Dans la figure ci-contre on a représenté graphiquement une fonction f.

$lim_(x -> -infinity) (f(x) - x) =$

#grid(
  columns: (1fr, 1fr, 1fr),
  gutter: 1em,
  [$square$ 0], [$square$ $+infinity$], [$square$ $-3$.]
)

#cetz.canvas({
  import cetz.draw: *
  // Axes
  line((-2, 0), (2, 0), stroke: 0.5pt, mark: (end: ">"))
  line((0, -2), (0, 2.5), stroke: 0.5pt, mark: (end: ">"))
  // Asymptote verticale
  line((0.8, -2), (0.8, 2.5), stroke: (dash: "dashed", paint: red))
  // Courbe avec asymptote
  bezier((-1.5, -1.5), (0.5, 2), (-0.5, 0), (0.3, 1.5), stroke: blue + 1.5pt)
  bezier((1.1, -2), (1.8, -0.5), (1.2, -1.5), (1.5, -0.8), stroke: blue + 1.5pt)
})

2. $lim_(x -> 2^+) frac(7, (x - 2)^2) =$

#grid(
  columns: (1fr, 1fr, 1fr),
  gutter: 1em,
  [$square$ $-infinity$], [$square$ $0$], [$square$ $+infinity$.]
)

3. Si $lim_(x -> +infinity) f(x) = -5$ alors

#grid(
  columns: (1fr, 1fr, 1fr),
  gutter: 1em,
  [$square$ $lim_(x -> +infinity) (f(x) + 5) = 0$],
  [$square$ $x = -5$ est une asymptote à $C_f$],
  [$square$ $lim_(x -> -infinity) (f(x) + 5) = 0$.]
)

4. Sachant que pour tout réel x, on a $f(x) gt.eq x^3 - x$, on peut conclure que

#grid(
  columns: (1fr, 1fr, 1fr),
  gutter: 1em,
  [$square$ $lim_(x -> +infinity) f(x) = +infinity$],
  [$square$ $lim_(x -> 0) f(x) = 0$],
  [$square$ $lim_(x -> -infinity) f(x) = -infinity$.]
)

5. $lim_(x -> +infinity) frac(5, x^2) =$

#grid(
  columns: (1fr, 1fr, 1fr),
  gutter: 1em,
  [$square$ $+infinity$], [$square$ $0$], [$square$ $5$.]
)

=== Corrigé du QCM

1) $lim_(x -> +infinity) [f(x) - x] = +infinity$ $arrow.r$ *(b)*

2) $lim_(x -> 2^-) frac(7, (x - 2)^2) = +infinity$ $arrow.r$ *(c)*

3) $lim_(x -> +infinity) [f(x) + 5] = 0$ $arrow.r$ *(a)*

4) $lim_(x -> +infinity) f(x) = +infinity$ $arrow.r$ *(a)*

5) $lim_(x -> +infinity) (frac(5, x^2)) = 0$ $arrow.r$ *(b)*

// Source: Corrige T1 p.41

=== Vrai - Faux

1. Si f est une fonction polynôme de degré supérieur ou égal à 1 alors f tend vers l'infini au voisinage de l'infini.

2. Si f est une fonction strictement positive sur $[1, +infinity[$, alors f tend vers $+infinity$ au voisinage de $+infinity$.

3. Si f est une fonction qui tend vers $-infinity$, au voisinage de $+infinity$ alors f est strictement négative pour les grandes valeurs de x.

4. Si f est une fonction qui tend vers a en $+infinity$ alors f tend vers a en $-infinity$.

5. Si f est une fonction qui tend vers a en $+infinity$ alors $|f|$ tend vers a en $+infinity$.

// Source: Manuel T1 p.74
=== Corrigé Vrai – Faux

1) Vrai (cours)

2) Faux

Contre exemple :

$f(x) = frac(1, x)$ ; $x in [1, +infinity[$

3) Vrai (voir définition)

4) Faux

Contre exemple :

$"Soit" f(x) = sqrt(1 + x^2) - x$

$lim_(+infinity) f = 0$ mais $lim_(-infinity) f = +infinity$

5) Faux

Contre exemple :

$"Soit" : f(x) = frac(1, x) - 1$

$lim_(+infinity) f = -1$ mais $lim_(+infinity) |f| = 1$

// Source: Corrige T1 p.41

== Mobiliser ses compétences

=== Situation 1 Asymptote oblique

On considère la fonction $f : x |-> frac(x^2 + x + 1, x)$.

1. a. Déterminer son ensemble de définition D.

#h(0.5cm) b. Calculer les limites de f aux bornes de D.

2. Montrer qu'il existe deux réels a et b tels que, pour tout $x eq.not 0$ on a $f(x) = a x + b + frac(1, x)$.

3. On désigne par C la courbe représentative de f dans le plan muni d'un repère orthonormé.

#h(0.5cm) a. Expliquer pourquoi la droite $Delta$ d'équation $y = x + 1$ est asymptote oblique à C au voisinage de $+infinity$ et de $-infinity$.

#h(0.5cm) b. Soit x un réel différent de $-1$ ; on désigne par M et P les points respectifs de C et $Delta$ d'abscisse x.

Si l'on veut que la distance MP soit inférieure 0,001, suffit-il de prendre $|x| > 11$ ? $|x| > 101$ ? $|x| > 1001$ ? Justifier votre réponse.

#h(0.5cm) c. Déterminer, sans faire de calcul, une approximation de $f(3000)$ et en majorant l'erreur ainsi commise.

=== Situation 2 Courbe asymptote

On considère la fonction $f : x |-> frac(x^2, x - 1)$.

1. Déterminer son ensemble de définition D.

2. Calculer les limites de f aux bornes de D.

3. On considère la fonction $g : x |-> x + 1$.

#h(0.5cm) Calculer $lim (f(x) - g(x))$.

Dans le plan muni d'un repère orthonormé, on note C et C' les courbes représentatives respectives de f et g.

4. a. Calculer MN en fonction de x.

#h(0.5cm) b. Vérifier que cette distance tend vers zéro quand x tend vers $+infinity$.

On dit alors que C' est asymptote à C au voisinage de $+infinity$.

#h(0.5cm) c. Étudier la position de C par rapport à C' sur $]0, +infinity[$.

#h(0.5cm) d. Expliquer pourquoi C est asymptote à C' au voisinage de $-infinity$.

#h(0.5cm) e. Étudier la position de C par rapport à C' sur $]-infinity, 0[$.

5. Déterminer, sans faire de calcul, l'erreur commise en remplaçant $0,5 times 10^5$ par $frac((5.10^5)^2, dots)$.

// Source: Manuel T1 p.75
=== Corrigé – Mobiliser ses compétences

=== Situation 1

$f(x) = frac(x^2 + x + 1, x + 1)$

1) a) $D f = RR backslash {-1}$

#h(0.5cm) b) $D f = ]-infinity, -1[ union ]-1, +infinity[$

$ lim_(x -> -infinity) f(x) = lim_(x -> -infinity) frac(x^2 + x + 1, x + 1) $

$ = lim_(x -> -infinity) frac(x^2, x) = lim_(x -> -infinity) (x) = -infinity $

#h(1cm) _fonction rationnelle → limite du monôme de plus haut degré_

- $lim_(x -> +infinity) f(x) = lim_(x -> +infinity) frac(x^2, x) = lim_(x -> +infinity) (x) = +infinity$

- On a : $lim_(x -> (-1)^-) (x^2 + x + 1) = 1$

#h(1cm) et $lim_(x -> (-1)^-) (x + 1) = 0^-$ donc

$ lim_(x -> (-1)^-) f(x) = frac(1, 0^-) = -infinity $

- $lim_(x -> (-1)^+) f(x) = frac(1, 0^+) = +infinity$ car

#h(1cm) $lim_(x -> (-1)^+) (x + 1) = 0^+$

// Source: Corrige T1 p.41-42
2)

$ f(x) = frac(x^2 + x + 1, x + 1) = frac(x^2 + x, x + 1) + frac(1, x + 1) $

$ = frac(x(x + 1), x + 1) + frac(1, x + 1) = x + frac(1, x + 1) $

donc $a = 1$ et $b = 0$

// Source: Corrige T1 p.42
Deuxième méthode :

$ f(x) = frac(x^2 + x + 1, x + 1) = a x + b + frac(1, x + 1) $

$ = frac(a x(x + 1) + b(x + 1) + 1, x + 1) = frac(a x^2 + (a + b) x + b + 1, x + 1) $

par identification on aura : $cases(a = 1, a + b = 1, b + 1 = 1) arrow.double b = 0$

3) a) $lim_(x -> +infinity) [f(x) - x] = lim_(x -> +infinity) frac(1, x + 1) = 0$

$lim_(x -> +infinity) [f(x) - x] = 0$

De même $lim_(x -> -infinity) [f(x) - x] = 0$

Conclusion :

La droite $Delta$ d'équation $y = x$ est une asymptote oblique à $(cal(C))$ au voisinage de $+infinity$ et $-infinity$

b) $M P = |f(x) - x| = |frac(1, x + 1)| = frac(1, |x + 1|)$

$M P < 0.001 arrow.l.r.double frac(1, |x + 1|) < frac(1, 1000) arrow.l.r.double |x + 1| > 1000$

$arrow.l.r.double x + 1 < -1000$ ou bien $x + 1 > 1000$

$arrow.l.r.double x < -1001$ ou bien $x > 999$

Lorsque $|x| > 1001$ alors $|x + 1| > 1000$

d'où $M P < 0.001$

c)

Comme : $x = 3000 > 1001$ donc d'après b)

$M P = |f(3000) - 3000| < 0.001$

donc : $-0.001 < f(3000) - 3000 < 0.001$

par suite : $2999.999 < f(3000) < 3000.001$

il résulte : $f(3000) approx 3000$ à une erreur de 0.001

// Source: Corrige T1 p.42
=== Situation 2

$f(x) = frac(x^2, 2) + frac(1, x)$

1) $D f = RR^*$

2) $D f = ]-infinity, 0[ union ]0, +infinity[$

- $lim_(x -> -infinity) f(x) = lim_(x -> -infinity) frac(x^2, 2) + frac(1, x) = +infinity$

Car $lim_(x -> -infinity) frac(x^2, 2) = +infinity$ et $lim_(x -> -infinity) frac(1, x) = 0$

- $lim_(x -> +infinity) f(x) = lim_(x -> +infinity) frac(x^2, 2) + frac(1, x) = +infinity$

Car $lim_(x -> +infinity) frac(x^2, 2) = +infinity$ et $lim_(x -> +infinity) frac(1, x) = 0$

- $lim_(x -> 0^-) frac(x^2, 2) = 0$ et $lim_(x -> 0^-) frac(1, x) = -infinity$

donc $lim_(x -> 0^-) f(x) = lim_(x -> 0^-) frac(x^2, 2) + frac(1, x) = -infinity$

- $lim_(x -> 0^+) frac(x^2, 2) = 0$ et $lim_(x -> 0^+) frac(1, x) = +infinity$

donc $lim_(x -> 0^+) f(x) = +infinity$

3)

$ lim_(x -> +infinity) [f(x) - g(x)] = lim_(x -> +infinity) [f(x) - frac(x^2, 2)] $

$ = lim_(x -> +infinity) [cancel(frac(x^2, 2)) + frac(1, x) - cancel(frac(x^2, 2))] = lim_(x -> +infinity) (frac(1, x)) = 0 $

4) a) $M N = |f(x) - g(x)| = frac(1, |x|)$

b) $lim_(x -> +infinity) frac(1, |x|) = 0$ car $lim_(x -> +infinity) |x| = +infinity$

c) Pour $x in ]0, +infinity[$ on a $|x| = x$

donc $f(x) - g(x) = frac(1, x) > 0$

// Source: Corrige T1 p.43
D'où la courbe $(cal(C))$ de la fonction $f$ est au dessus de $(cal(C)')$ celle de g sur l'intervalle $]0, +infinity[$

e) Pour

$x in ]-infinity, 0[$ on a : $f(x) - g(x) = frac(1, x) < 0$

D'où la courbe $(cal(C))$ de la fonction $f$ est au dessous de $(cal(C)')$ celle de g sur l'intervalle $]-infinity, 0[$

d) $lim_(x -> -infinity) M N = lim_(x -> -infinity) frac(1, |x|) = 0$

Donc $(cal(C)')$ est asymptote à $(cal(C))$ au voisinage de $(-infinity)$

5)

$ g(5 times 10^99) = frac((5 times 10^99)^2, 2) $

Donc lorsque on prend $f(5 times 10^99) = frac((5 times 10^99)^2, 2)$

l'erreur commise est $frac(1, 5 times 10^99) = 2 times 10^(-100)$

// Source: Corrige T1 p.43

== Exercices et problèmes

=== Exercice 1

Calculer dans chacun des cas ci-dessous la limite de la fonction f en $+infinity$.

a. $f(x) = frac(1, x) - 10000$ #h(1cm) ; #h(0.5cm) b. $f(x) = -2x(100)^(10)$

c. $f(x) = -2000 x$ #h(1cm) ; #h(1cm) d. $f(x) = frac(1, x) - 2006$

==== Corrigé

a) $lim_(x -> +infinity) (x - 1000)^3 = +infinity$

Donc $lim_(x -> +infinity) f(x) = lim_(x -> +infinity) frac(-5, (x - 1000)^3) = 0$

b) $lim_(x -> +infinity) (x + 100)^100 = +infinity$ et $(-2) < 0$

Donc

$ lim_(x -> +infinity) f(x) = lim_(x -> +infinity) [-2(x + 100)^100] = -infinity $

c) $lim_(x -> +infinity) (x - 2006) = +infinity$

Donc

$lim_(x -> +infinity) f(x) = lim_(x -> +infinity) sqrt(x - 2006) = +infinity$

d) $lim_(x -> +infinity) (x - 2006) = +infinity$

Donc $lim_(x -> +infinity) f(x) = lim_(x -> +infinity) frac(-3, sqrt(x - 2006)) = 0$

// Source: Corrige T1 p.43

=== Exercice 2

Calculer dans chacun des cas ci-dessous les limites de la fonction f en $+infinity$ et $-infinity$.

a. $f(x) = x^3 - x^2 + 1$ #h(1cm) ; #h(0.5cm) b. $f(x) = frac(1, x^2) - 1$

c. $f(x) = -2x + 100^(10)$ ; $3x^3$ ; $f(x) = (-2x + 1)^3 times 8 x$.

==== Corrigé

a) $f(x) = x^2 + |x|$

$lim_(x -> +infinity) x^2 = +infinity$ et $lim_(x -> +infinity) |x| = +infinity$ donc $lim_(x -> +infinity) f(x) = +infinity$

$lim_(x -> -infinity) x^2 = +infinity$ et $lim_(x -> -infinity) |x| = +infinity$ donc $lim_(x -> -infinity) f(x) = +infinity$

b) $f(x) = x^2 + x|x| + 2$

\*Pour $x gt.eq 0$ on a $|x| = x$ par suite $f(x) = 2x^2 + 2$

d'où $lim_(x -> +infinity) f(x) = +infinity$

\*Pour $x lt.eq 0$ on a $|x| = -x$ par suite $f(x) = 2$

d'où $lim_(x -> -infinity) f(x) = 2$

c) $f(x) = -2(x + 100)^100 - 3x^5$

$f$ est une fonction polynôme, son terme de plus haut degré est : $(-2 dot x^100)$

D'où

$lim_(x -> +infinity) f(x) = lim_(x -> +infinity) (-2 dot x^100) = -infinity$

$lim_(x -> -infinity) f(x) = lim_(x -> -infinity) (-2 dot x^100) = -infinity$

d) $f(x) = (-2x + 1)^3 + 8x^3$

Or : $(-2x + 1)^3 = -8x^3 + 12x^2 - 6x + 1$

Donc : $f(x) = 12x^2 - 6x + 1$

$f$ est une fonction polynôme, son terme de plus haut degré est : $(12 dot x^2)$

D'où

$lim_(x -> +infinity) f(x) = lim_(|x| -> +infinity) (12 dot x^2) = +infinity$

// Source: Corrige T1 p.44
e) $f(x) = (-2x + 1)^10 + |x|^11$

$ cases(
  lim_(|x| -> +infinity) (-2x + 1)^10 = +infinity,
  lim_(|x| -> +infinity) |x|^11 = +infinity
) "donc" lim_(|x| -> +infinity) f(x) = +infinity $

Remarque : $|x| -> +infinity$ signifie $x -> +infinity$ ou $x -> -infinity$

=== Exercice 3

Calculer dans chacun des cas ci-dessous les limites de la fonction f en $+infinity$ et en $-infinity$.

a. $f(x) = frac(-5x, (1 - 1000)^3)$ #h(1cm) ; #h(0.5cm) b. $f(x) = frac(x^2, 2x + 1)$

==== Corrigé

a)

$ f(x) = frac(-5x + 1, (x - 1000)^3) = frac(-5x + 1, x^3 - 3000x^2 + 3 times 10^6 x + 10^9) $

($f$ est une fonction rationnelle)

$ lim_(|x| -> +infinity) f(x) = lim_(|x| -> +infinity) (frac(-5x, x^3)) = lim_(|x| -> +infinity) (frac(-5, x^2)) = 0 $

b)

$ f(x) = frac(x^4 + 3x^2 - 1, (2x - 5)^17) "( fonction rationnelle )" $

$ lim_(|x| -> +infinity) f(x) = lim_(|x| -> +infinity) frac(x^4, (2x)^17) = lim_(|x| -> +infinity) (frac(1, 2^17 times x^13)) = 0 $

c) $f(x) = |frac(2x^2 - 3x, x - 2)|$

\* $lim_(x -> +infinity) frac(2x^2 - 3x, x - 2) = lim_(x -> +infinity) (frac(2x^2, x)) = lim_(x -> +infinity) (2x) = +infinity$

#h(1cm) donc $lim_(x -> +infinity) f(x) = +infinity$

\* $lim_(x -> -infinity) frac(2x^2 - 3x, x - 2) = lim_(x -> -infinity) (frac(2x^2, x)) = lim_(x -> -infinity) (2x) = -infinity$

#h(1cm) donc $lim_(x -> -infinity) f(x) = +infinity$

// Source: Corrige T1 p.44
d) $f(x) = frac(|x|(1 - x), x^2 + 1)$

\* Pour $x > 0$, $f(x) = frac(x - x^2, x^2 + 1)$

$lim_(x -> +infinity) f(x) = lim_(x -> +infinity) (frac(-x^2, x^2)) = -1$

\* Pour $x < 0$, $f(x) = frac(-x + x^2, x^2 + 1)$

$lim_(x -> -infinity) f(x) = lim_(x -> -infinity) (frac(x^2, x^2)) = 1$

e) $f(x) = x^3 - frac(x^2, x + 1) = frac(x^4 + x^3 - x^2, x + 1)$

- $lim_(x -> +infinity) f(x) = lim_(x -> +infinity) frac(x^4, x) = lim_(x -> +infinity) x^3 = +infinity$

- $lim_(x -> -infinity) f(x) = lim_(x -> -infinity) frac(x^4, x) = lim_(x -> -infinity) x^3 = -infinity$

f) $f(x) = frac(x^2 + |x| + 1, |x| - 2)$

\*Pour $x > 0$ on a : $f(x) = frac(x^2 + x + 1, x - 2)$

$lim_(x -> +infinity) f(x) = lim_(x -> +infinity) (frac(x^2, x)) = lim_(x -> +infinity) (x) = +infinity$

\*Pour $x < 0$ on a : $f(x) = frac(x^2 - x + 1, -x - 2)$

$lim_(x -> -infinity) f(x) = lim_(x -> -infinity) (frac(x^2, -x)) = lim_(x -> -infinity) (-x) = +infinity$

// Source: Corrige T1 p.45

=== Exercice 4

Calculer dans chacun des cas les limites en $+infinity$ et en $-infinity$ des fonctions f, g, h, p, E, q, r $= 2x - 4$.

a. $f(x) = frac(x, x + 1)$ #h(1cm) ; #h(0.5cm) b. $g(x) = 3x^2 - 2x + 1$

c. $h(x) = frac(1, x^2)$ #h(1cm) ; #h(0.5cm) d. $p(x) = frac(x^2 + 1, x)$

==== Corrigé

a)

- $lim_(|x| -> +infinity) f(x) = lim_(|x| -> +infinity) (frac(-1, x^2)) = 0$

- \* $lim_(x -> +infinity) g(x) = lim_(x -> +infinity) (3x^3) = +infinity$

\* $lim_(x -> -infinity) g(x) = lim_(x -> -infinity) (3x^3) = -infinity$

- $lim_(x -> +infinity) [f(x) + g(x)] = +infinity$ et $lim_(x -> -infinity) [f(x) + g(x)] = -infinity$

- $(f dot g)(x) = f(x) dot g(x) = frac(-3x^3 - 2x + 1, x^2)$

\* $lim_(x -> +infinity) f(x) dot g(x) = lim_(x -> +infinity) frac(-3x^3, x^2) = lim_(x -> +infinity) -3x = -infinity$

\* $lim_(x -> -infinity) f(x) dot g(x) = lim_(x -> -infinity) -3x = +infinity$

- $(frac(f, g))(x) = frac(f(x), g(x)) = frac(-1, x^2(3x^3 + 2x - 1)) = frac(-1, 3x^5 + 2x^3 - x^2)$

$lim_(|x| -> +infinity) frac(f(x), g(x)) = lim_(|x| -> +infinity) (frac(-1, 3x^5)) = 0$

b)

- \* $lim_(x -> +infinity) f(x) = lim_(x -> +infinity) (frac(x^2, x)) = lim_(x -> +infinity) (x) = +infinity$

\* $lim_(x -> -infinity) f(x) = lim_(x -> -infinity) (frac(x^2, x)) = lim_(x -> -infinity) (x) = -infinity$

- \* $lim_(x -> +infinity) g(x) = lim_(x -> +infinity) (frac(2x, x^3)) = lim_(x -> +infinity) (frac(2, x^2)) = 0$

\* $lim_(x -> -infinity) g(x) = lim_(x -> -infinity) (frac(2, x^2)) = 0$

- $lim_(x -> +infinity) [f(x) + g(x)] = +infinity$ et $lim_(x -> -infinity) [f(x) + g(x)] = -infinity$

- $(f dot g)(x) = f(x) dot g(x) = frac(x^2(2x - 1), (x + 1)(x^3 - 1)) = frac(2x^3 - x^2, x^4 + x^3 - x - 1)$

\* $lim_(x -> +infinity) [f(x) dot g(x)] = lim_(x -> +infinity) frac(2x^3, x^4) = lim_(x -> +infinity) frac(2, x) = 0$

\* $lim_(x -> -infinity) [f(x) dot g(x)] = lim_(x -> -infinity) frac(2x^3, x^4) = lim_(x -> -infinity) frac(2, x) = 0$

- $(frac(f, g))(x) = frac(f(x), g(x)) = frac(x^2(x^3 - 1), (x + 1)(2x - 1)) = frac(x^5 - x^2, 2x^2 + x - 1)$

\* $lim_(x -> +infinity) (frac(f, g))(x) = lim_(x -> +infinity) frac(x^5, 2x^2) = lim_(x -> +infinity) frac(x^3, 2) = +infinity$

\* $lim_(x -> -infinity) (frac(f, g))(x) = lim_(x -> -infinity) frac(x^5, 2x^2) = lim_(x -> -infinity) frac(x^3, 2) = -infinity$

// Source: Corrige T1 p.45
c)

- \* $lim_(x -> +infinity) f(x) = lim_(x -> +infinity) (frac(-3x^3, x^2)) = lim_(x -> +infinity) (-3x) = -infinity$

\* $lim_(x -> -infinity) f(x) = lim_(x -> -infinity) (frac(-3x^3, x^2)) = lim_(x -> -infinity) (-3x) = +infinity$

- \* $lim_(x -> +infinity) g(x) = lim_(x -> +infinity) (frac(x^4, -x^5)) = lim_(x -> +infinity) (frac(1, -x)) = 0$

\* $lim_(x -> -infinity) g(x) = lim_(x -> -infinity) (frac(x^4, -x^5)) = lim_(x -> -infinity) (frac(1, -x)) = 0$

- $lim_(x -> +infinity) [f(x) + g(x)] = -infinity$ et $lim_(x -> -infinity) [f(x) + g(x)] = +infinity$

- $(f dot g)(x) = f(x) dot g(x) = frac((-3x^3 + 2)(x^4 - 6x^3), (x^2 + x^3)(1 - x^5))$

$ = frac(-3x^7 + 18x^6 + 2x^4 - 12x^3, -x^8 - x^7 + x^3 + x^2) $

\* $lim_(|x| -> +infinity) [f(x) dot g(x)] = lim_(|x| -> +infinity) frac(-3x^7, -x^8) = lim_(|x| -> +infinity) frac(3, x) = 0$

- $(frac(f, g))(x) = frac(f(x), g(x)) = frac((-3x^3 + 2)(1 - x^5), (x^2 + x^3)(x^4 - 6x^3))$

$ = frac(3x^8 - 2x^5 - 3x^3 + 2, x^7 - 5x^6 - 6x^5) $

\* $lim_(x -> +infinity) (frac(f, g))(x) = lim_(x -> +infinity) frac(3x^8, x^7) = lim_(x -> +infinity) (3x) = +infinity$

\* $lim_(x -> -infinity) (frac(f, g))(x) = lim_(x -> -infinity) frac(3x^8, x^7) = lim_(x -> -infinity) (3x) = -infinity$

// Source: Corrige T1 p.46

=== Exercice 5

Calculer les limites ci-dessous.

$ lim_(x -> -infinity) frac(1, 3x - 1) quad ; quad lim_(x -> +infinity) frac(3x^3, (3x^2 + 5)^2) quad ; quad lim_(x -> +infinity) frac(1, sqrt(3x + 4)) quad ; quad lim_(x -> -infinity) frac(3x^2, 3x + 4) $

==== Corrigé

- On a : $lim_(x -> 3^-) (3x) = 9$ et $lim_(x -> 3^-) (x - 3)(2x + 5) = 0^-$

d'où $lim_(x -> 3^-) frac(3x, (x - 3)(2x + 5)) = -infinity$

- On a : $lim_(x -> 3^+) (3x) = 9$ et $lim_(x -> 3^+) (x - 3)(2x + 5) = 0^+$

d'où $lim_(x -> 3^+) frac(3x, (x - 3)(2x + 5)) = +infinity$

- On a : $lim_(x -> (-2)^-) (-3x^2 + 1) = -11$

aussi on a :

#table(
  columns: 4,
  align: center,
  [$x$], [$-infinity$], [$-2$], [$+infinity$],
  [Signe de $(2x + 4)$], [$-$], [$0$], [$+$],
)

ce qui donne : $lim_(x -> (-2)^-) (2x + 4) = 0^-$

#h(2cm) et $lim_(x -> (-2)^+) (2x + 4) = 0^+$

d'où $lim_(x -> (-2)^-) frac(-3x^2 + 1, 2x + 4) = +infinity$

et $lim_(x -> (-2)^+) frac(-3x^2 + 1, 2x + 4) = -infinity$

// Source: Corrige T1 p.46

=== Exercice 6

Calculer les limites ci-dessous.

$ lim frac(3x + 9, -2x - 1) quad ; quad lim frac(x^2 + 3, 2x^3 - 1) $

==== Corrigé

a) Soit $f(x) = frac(-3x + 9, x^2 - 2x - 3)$

Posons $A(x) = x^2 - 2x - 3 = 0$

On a : $a - b + c = 0$ donc $x' = -1$ et $x'' = 3$

par suite : $A(x) = (x + 1)(x - 3)$

Pour $x eq.not -1$ et $x eq.not 3$ on aura :

$ f(x) = frac(-3(x - 3), (x + 1)(x - 3)) = frac(-3, x + 1) = g(x) $

$lim_(x -> 3^-) f(x) = g(3) = frac(-3, 4)$

car $g$ est continue en 3.

b) Soit $f(x) = frac(x - 1, x^3 + 1)$

On sait que : $x^3 + 1 = (x + 1)(x^2 - x + 1)$

#h(5cm) _positif_

#table(
  columns: 4,
  align: center,
  [$x$], [$-infinity$], [$-1$], [$+infinity$],
  [Signe de $(x^3 + 1)$], [$-$], [$0$], [$+$],
)

il résulte

$lim_(x -> (-1)^-) frac(x - 1, x^3 + 1) = frac(-2, 0^-) = +infinity$ et $lim_(x -> (-1)^+) frac(x - 1, x^3 + 1) = frac(-2, 0^+) = -infinity$

*Conclusion* : $f$ n'admet pas de limite en $(-1)$

c) Soit $f(x) = (x - 1) sqrt(frac(x, x - 1))$

pour $x > 1$ : $f(x) = (sqrt(x) - 1)^2 frac(sqrt(x), sqrt(x - 1))$

$= sqrt(x - 1) times sqrt(x) = g(x)$

$lim_(x -> 1^+) f(x) = g(1) = 0$ ($g$ est continue à droite en 1)

donc $lim_(x -> 1^+) f(x) = 0$

d) Soit $f(x) = frac((x + 3)(x - 2), |x - 2|)$

Pour $x > 2$, on a : $f(x) = frac((x + 3)(x - 2), (x - 2)) = (x + 3)$

soit $g(x) = (x + 3)$ continue sur $RR$ donc

$lim_(x -> 2^+) f(x) = g(2) = 5$

// Source: Corrige T1 p.46-47

=== Exercice 7

Calculer dans chacun des cas ci-dessous, la limite à droite et la limite à gauche respectivement à droite en a.

==== Corrigé

a) - $lim_(x -> 2^-) frac(-4, (x - 2)^3) = +infinity$ car $lim_(x -> 2^-) (x - 2)^3 = 0^-$

- $lim_(x -> 2^+) frac(-4, (x - 2)^3) = -infinity$ car $lim_(x -> 2^+) (x - 2)^3 = 0^+$

b) Soit $f(x) = frac(2, (3 - x)^4) + 2 sqrt(x)$

- Comme $lim_(x -> 3) (3 - x)^4 = 0^+$ alors $lim_(x -> 3) frac(2, (3 - x)^4) = +infinity$

et $lim_(x -> 3) (2 sqrt(x)) = 2 sqrt(3)$

d'où $lim_(x -> 3) f(x) = lim_(x -> 3^-) f = lim_(x -> 3^+) f = +infinity$

c) Soit $f(x) = frac(2x - x^3, sqrt(x^2 + 2x))$

#table(
  columns: 5,
  align: center,
  [$x$], [$-infinity$], [$-2$], [$0$], [$+infinity$],
  [Signe de $(x^2 + 2x)$], [$+$], [$0 quad -$], [$0$], [$+$],
)

$D f = ]-infinity, -2[ union ]0, +infinity[$

Comme $lim_(x -> (-2)^-) (2x - x^3) = 4$ et $lim_(x -> (-2)^-) sqrt(2x + x^2) = 0^+$

d'où $lim_(x -> (-2)^-) f(x) = +infinity$

// Source: Corrige T1 p.47

=== Exercice 8

Calculer dans chacun des cas ci-dessous les limites de la fonction f aux bornes de son ensemble de définition.

a. $f(x) = frac(1, x - 1)$ #h(1cm) ; #h(0.5cm) b. $f(x) = frac(x, (x - 1)^2)$

c. $f(x) = frac(1, x^2 - 1)$ #h(1cm) ; #h(0.5cm) d. $f(x) = frac(x^2, x^2 - 1)$

==== Corrigé

a)

Soit $f(x) = frac(-x - 5, x)$ ; $D f = RR^* = ]-infinity, 0[ union ]0, +infinity[$

- $lim_(|x| -> +infinity) f(x) = lim_(|x| -> +infinity) frac(-x, x) = -1$

- $lim_(x -> 0^+) f(x) = lim_(x -> 0^+) frac(-x - 5, x) = frac(-5, 0^+) = -infinity$

- $lim_(x -> 0^-) f(x) = lim_(x -> 0^-) frac(-x - 5, x) = frac(-5, 0^-) = +infinity$

b) Soit $f(x) = frac(3x - 1, 2 - 5x)$ ; $D f = RR backslash {frac(2, 5)}$

- $lim_(|x| -> +infinity) f(x) = lim_(|x| -> +infinity) frac(3x, -5x) = -frac(3, 5)$

#table(
  columns: 4,
  align: center,
  [$x$], [$-infinity$], [$frac(2, 5)$], [$+infinity$],
  [Signe de $(2 - 5x)$], [$+$], [$0$], [$-$],
)

- $lim_(x -> (frac(2, 5))^-) (3x - 1) = frac(1, 5)$ et $lim_(x -> (frac(2, 5))^-) (2 - 5x) = 0^+$

$"donc"$ $lim_(x -> (frac(2, 5))^-) f(x) = +infinity$

- $lim_(x -> (frac(2, 5))^+) (2 - 5x) = 0^-$ $"donc"$ $lim_(x -> (frac(2, 5))^+) f(x) = -infinity$

c) Soit $f(x) = frac(1 - x^3, 2x + 3)$ ; $D f = RR backslash {-frac(3, 2)}$

- $lim_(|x| -> +infinity) f(x) = lim_(|x| -> +infinity) frac(-x^3, 2x) = lim_(|x| -> +infinity) frac(-x^2, 2) = -infinity$

#table(
  columns: 4,
  align: center,
  [$x$], [$-infinity$], [$-frac(3, 2)$], [$+infinity$],
  [Signe de $(2x + 3)$], [$-$], [$0$], [$+$],
)

- $lim_(x -> (-frac(3, 2))^-) (1 - x^3) = frac(35, 8)$ et $lim_(x -> (-frac(3, 2))^-) (2x + 3) = 0^-$

$"donc"$ $lim_(x -> (-frac(3, 2))^-) f(x) = -infinity$

- $lim_(x -> (-frac(3, 2))^+) (2x + 3) = 0^+$ $"donc"$ $lim_(x -> (-frac(3, 2))^+) f(x) = +infinity$

// Source: Corrige T1 p.47
d) Soit $f(x) = frac(-3x^2 + x, -5x + 10)$ ; $D f = RR backslash {2}$

- $lim_(x -> +infinity) f(x) = lim_(x -> +infinity) frac(-3x^2, -5x) = lim_(x -> +infinity) frac(3x, 5) = +infinity$

- $lim_(x -> -infinity) f(x) = lim_(x -> -infinity) frac(-3x^2, -5x) = lim_(x -> -infinity) frac(3x, 5) = -infinity$

// Source: Corrige T1 p.48

=== Exercice 9

Calculer dans chacun des cas ci-dessous les limites de la fonction f aux bornes de son ensemble de définition.

a. $f(x) = frac(x - 2, x^2 - 5x + 6)$ #h(1cm) ; #h(0.5cm) b. $f(x) = frac(x - 1, x^2 - 1)$

==== Corrigé

a) Soit $f(x) = frac(-2x + 3, x^2 - 5)$

$x^2 - 5 = 0 arrow.l.r.double x^2 = 5 arrow.l.r.double x = sqrt(5)$ ou $x = -sqrt(5)$

$D f = {x in RR "telque" x^2 - 5 eq.not 0} = RR backslash {-sqrt(5), sqrt(5)}$

- $lim_(|x| -> +infinity) f(x) = lim_(|x| -> +infinity) frac(-2x, x^2) = lim_(|x| -> +infinity) frac(-2, x) = 0$

#table(
  columns: 5,
  align: center,
  [$x$], [$-infinity$], [$-sqrt(5)$], [$sqrt(5)$], [$+infinity$],
  [Signe de $(x^2 - 5)$], [$+$], [$0 quad - quad 0$], [], [$+$],
)

- $lim_(x -> (-sqrt(5))^-) (-2x + 3) = 2 sqrt(5) + 3 > 0$ et $lim_(x -> (-sqrt(5))^-) (x^2 - 5) = 0^+$

$"donc"$ $lim_(x -> (-sqrt(5))^-) f(x) = +infinity$

- $lim_(x -> (-sqrt(5))^+) (-2x + 3) = 2 sqrt(5) + 3 > 0$ et $lim_(x -> (-sqrt(5))^+) (x^2 - 5) = 0^-$

$"donc"$ $lim_(x -> (-sqrt(5))^+) f(x) = -infinity$

- $lim_(x -> (sqrt(5))^-) (-2x + 3) = -2 sqrt(5) + 3 < 0$ et $lim_(x -> (sqrt(5))^-) (x^2 - 5) = 0^-$

$"donc"$ $lim_(x -> (sqrt(5))^-) f(x) = +infinity$ (de la forme $frac("constante negative", 0^-)$)

- $lim_(x -> (sqrt(5))^+) (-2x + 3) = -2 sqrt(5) + 3 < 0$ et $lim_(x -> (sqrt(5))^+) (x^2 - 5) = 0^+$

$"donc"$ $lim_(x -> (sqrt(5))^+) f(x) = -infinity$

// Source: Corrige T1 p.48-49
b)

Soit $f(x) = frac(-x^4 + 2x, x^2 + 2)$ ; $x^2 + 2 > 0$ donc $D f = RR$

- $lim_(|x| -> +infinity) f(x) = lim_(|x| -> +infinity) frac(-x^4, x^2) = lim_(|x| -> +infinity) (-x^2) = -infinity$

c) Soit $f(x) = frac(x^3 - 2x^2 + 1, x^2 + 3x)$

$x^2 + 3x = 0 arrow.l.r.double x(x + 3) = 0 arrow.l.r.double x = 0$ ou $x = -3$

$D f = {x in RR "telque" x^2 + 3x eq.not 0} = RR^* backslash {-3}$

- $lim_(x -> +infinity) f(x) = lim_(x -> +infinity) frac(x^3, x^2) = lim_(x -> +infinity) (x) = +infinity$

- $lim_(x -> -infinity) f(x) = lim_(x -> -infinity) frac(x^3, x^2) = lim_(x -> -infinity) (x) = -infinity$

#table(
  columns: 5,
  align: center,
  [$x$], [$-infinity$], [$-3$], [$0$], [$+infinity$],
  [Signe de $(x^2 + 3x)$], [$+$], [$0 quad - quad 0$], [], [$+$],
)

- $lim_(x -> (-3)^-) (x^3 - 2x^2 + 1) = -44 < 0$ et $lim_(x -> (-3)^-) (x^2 + 3x) = 0^+$

$"donc"$ $lim_(x -> (-3)^-) f(x) = -infinity$ (de la forme $frac(-44, 0^+)$)

// Source: Corrige T1 p.49
- $lim_(x -> (-3)^+) (x^3 - 2x^2 + 1) = -44 < 0$ et $lim_(x -> (-3)^+) (x^2 + 3x) = 0^-$

$"donc"$ $lim_(x -> (-3)^+) f(x) = +infinity$ (de la forme $frac(-44, 0^-)$)

- $lim_(x -> 0^-) (x^3 - 2x^2 + 1) = 1 > 0$ et $lim_(x -> 0^-) (x^2 + 3x) = 0^-$

$"donc"$ $lim_(x -> 0^-) f(x) = -infinity$ (de la forme $frac(1, 0^-)$)

- $lim_(x -> 0^+) (x^3 - 2x^2 + 1) = 1 > 0$ et $lim_(x -> 0^+) (x^2 + 3x) = 0^+$

$"donc"$ $lim_(x -> 0^+) f(x) = +infinity$ (de la forme $frac(1, 0^+)$)

d) Soit $f(x) = frac(-3x^3 + x + 1, x^2 + x - 2)$

$x^2 + x - 2 = 0$ et $a + b + c = 0$

$arrow.l.r.double x' = 1$ ou $x'' = -2$

$D f = {x in RR "telque" x^2 + x - 2 eq.not 0} = RR backslash {-2, 1}$

- $lim_(x -> +infinity) f(x) = lim_(x -> +infinity) frac(-3x^3, x^2) = lim_(x -> +infinity) (-3x) = -infinity$

- $lim_(x -> -infinity) f(x) = lim_(x -> -infinity) frac(-3x^3, x^2) = lim_(x -> -infinity) (-3x) = +infinity$

#table(
  columns: 5,
  align: center,
  [$x$], [$-infinity$], [$-2$], [$1$], [$+infinity$],
  [Signe de $(x^2 + x - 2)$], [$+$], [$0 quad - quad 0$], [], [$+$],
)

- $lim_(x -> (-2)^-) (-3x^3 + x + 1) = 23 > 0$ et $lim_(x -> (-2)^-) (x^2 + x - 2) = 0^+$

$"donc"$ $lim_(x -> (-2)^-) f(x) = +infinity$ (de la forme $frac(23, 0^+)$)

- $lim_(x -> (-2)^+) (-3x^3 + x + 1) = 23 > 0$ et $lim_(x -> (-2)^+) (x^2 + x - 2) = 0^-$

$"donc"$ $lim_(x -> (-2)^+) f(x) = -infinity$ (de la forme $frac(23, 0^-)$)

- $lim_(x -> 1^-) (-3x^3 + x + 1) = -1 < 0$ et $lim_(x -> 1^-) (x^2 + x - 2) = 0^-$

$"donc"$ $lim_(x -> 1^-) f(x) = +infinity$ (de la forme $frac(-1, 0^-)$)

- $lim_(x -> 1^+) (-3x^3 + x + 1) = -1 < 0$ et $lim_(x -> 1^+) (x^2 + x - 2) = 0^+$

$"donc"$ $lim_(x -> 1^+) f(x) = -infinity$ (de la forme $frac(-1, 0^+)$)

// Source: Corrige T1 p.49

=== Exercice 10

Calculer dans chacun des cas ci-dessous les limites de la fonction f aux bornes de son ensemble de définition.

// Source: Manuel T1 p.76

==== Corrigé

a) Soit $f(x) = frac(|x^3 - 3|, |x + 2|)$

$D f = {x in RR "telque" x + 2 eq.not 0} = RR backslash {-2}$

$f(x) = |g(x)|$ avec $g(x) = frac(x^3 - 3, x + 2)$

- $lim_(|x| -> +infinity) g(x) = lim_(|x| -> +infinity) frac(x^3, x) = lim_(|x| -> +infinity) (x^2) = +infinity$

$"d'où"$ $lim_(|x| -> +infinity) f(x) = +infinity$

- on a : $f(x) = frac(|x^3 - 3|, |x + 2|) = frac(|x^3 - 3|, |x + 2|)$

\* $lim_(x -> (-2)^-) |x^3 - 3| = 5$ et $lim_(x -> (-2)^-) |x + 2| = 0^+$

$"d'où"$ $lim_(x -> (-2)^-) f(x) = frac(5, 0^+) = +infinity$

$"par suite"$ $lim_(x -> (-2)^+) f(x) = lim_(x -> (-2)^-) f(x) = +infinity$

// Source: Corrige T1 p.50
b) Soit $f(x) = frac(|x + 2|, |x^2 - 5|)$

$x^2 - 5 = 0 arrow.l.r.double x^2 = 5 arrow.l.r.double x = sqrt(5)$ ou $x = -sqrt(5)$

$D f = {x in RR "telque" x^2 - 5 eq.not 0} = RR backslash {-sqrt(5), sqrt(5)}$

- $lim_(|x| -> +infinity) frac(x + 2, x^2 - 5) = lim_(|x| -> +infinity) frac(x, x^2) = lim_(|x| -> +infinity) frac(1, x) = 0$

d'où $lim_(|x| -> +infinity) f(x) = 0$

- on a : $f(x) = frac(|x + 2|, |x^2 - 5|) = frac(|x + 2|, |x^2 - 5|)$

\* $lim_(x -> sqrt(5)) |x^2 - 5| = 0^+$ et $lim_(x -> sqrt(5)) |x + 2| = sqrt(5) + 2$ (positif)

$"d'où"$ $lim_(x -> sqrt(5)) f(x) = frac(sqrt(5) + 2, 0^+) = +infinity$

$"par suite"$ $lim_(x -> sqrt(5)^-) f(x) = lim_(x -> sqrt(5)^+) f(x) = +infinity$

\* $lim_(x -> (-sqrt(5))^-) |x^2 - 5| = 0^+$ et $lim_(x -> (-sqrt(5))^-) |x + 2| = sqrt(5) - 2$ (positif)

$"d'où"$ $lim_(x -> (-sqrt(5))^-) f(x) = frac(sqrt(5) - 2, 0^+) = +infinity$

$"par suite"$ $lim_(x -> (-sqrt(5))^+) f(x) = lim_(x -> (-sqrt(5))^-) f(x) = +infinity$

// Source: Corrige T1 p.50
c)

Soit $f(x) = frac(|x| dot (2 - x), 1 - |x|)$

$1 - |x| = 0 arrow.l.r.double |x| = 1 arrow.l.r.double x = 1$ ou $x = -1$

$D f = {x in RR "telque" 1 - |x| eq.not 0} = RR backslash {-1, 1}$

#table(
  columns: 5,
  align: center,
  [$x$], [$-infinity$], [$-1$], [$1$], [$+infinity$],
  [Signe de $(1 - |x|)$], [$-$], [$0 quad + quad 0$], [], [$-$],
)

- Pour $x > 1$ : $f(x) = frac(x(2 - x), 1 - x) = frac(2x - x^2, 1 - x)$

$lim_(x -> +infinity) f(x) = lim_(x -> +infinity) frac(-x^2, -x) = lim_(x -> +infinity) (x) = +infinity$

- Pour $x < -1$ : $f(x) = frac(-x(2 - x), 1 + x) = frac(-2x + x^2, 1 + x)$

$lim_(x -> -infinity) f(x) = lim_(x -> -infinity) frac(x^2, x) = lim_(x -> -infinity) (x) = -infinity$

- $lim_(x -> (-1)^-) |x| dot (2 - x) = 3$ et $lim_(x -> (-1)^-) (1 - |x|) = 0^-$

$"donc"$ $lim_(x -> (-1)^-) f(x) = -infinity$ (de la forme $frac(3, 0^-)$)

- $lim_(x -> (-1)^+) |x| dot (2 - x) = 3$ et $lim_(x -> (-1)^+) (1 - |x|) = 0^+$

$"donc"$ $lim_(x -> (-1)^+) f(x) = +infinity$ (de la forme $frac(3, 0^+)$)

- $lim_(x -> 1^-) |x| dot (2 - x) = 1$ et $lim_(x -> 1^-) (1 - |x|) = 0^+$

$"donc"$ $lim_(x -> 1^-) f(x) = +infinity$ (de la forme $frac(1, 0^+)$)

- $lim_(x -> 1^+) |x| dot (2 - x) = 1$ et $lim_(x -> 1^+) (1 - |x|) = 0^-$

$"donc"$ $lim_(x -> 1^+) f(x) = -infinity$ (de la forme $frac(1, 0^-)$)

// Source: Corrige T1 p.50-51
d)

$ f(x) = frac(x^2 - |x| - 1, |2x| - 3) $

$|2x| - 3 = 0 arrow.l.r.double |2x| = 3 arrow.l.r.double 2x = 3$ ou $2x = -3$

$arrow.l.r.double x = frac(3, 2)$ ou $x = -frac(3, 2)$

$D f = {x in RR "telque" |2x| - 3 eq.not 0} = RR backslash {-frac(3, 2), frac(3, 2)}$

#table(
  columns: 5,
  align: center,
  [$x$], [$-infinity$], [$-frac(3, 2)$], [$frac(3, 2)$], [$+infinity$],
  [Signe de $(|2x| - 3)$], [$+$], [$0 quad - quad 0$], [], [$+$],
)

- Pour $x > frac(3, 2)$ : $f(x) = frac(x^2 - x - 1, 2x - 3)$

$lim_(x -> +infinity) f(x) = lim_(x -> +infinity) frac(x^2, 2x) = lim_(x -> +infinity) frac(x, 2) = +infinity$

- Pour $x < -frac(3, 2)$ :

$f(x) = frac(x^2 + x - 1, -2x - 3)$

$lim_(x -> -infinity) f(x) = lim_(x -> -infinity) frac(x^2, -2x) = lim_(x -> -infinity) (frac(x, -2)) = +infinity$

- $lim_(x -> (frac(3, 2))^-) x^2 - |x| - 1 = -frac(1, 4)$ et $lim_(x -> (frac(3, 2))^-) (|2x| - 3) = 0^-$

$"donc"$ $lim_(x -> (frac(3, 2))^-) f(x) = +infinity$ (de la forme $frac(-0.25, 0^-)$)

- $lim_(x -> (frac(3, 2))^+) x^2 - |x| - 1 = -frac(1, 4)$ et $lim_(x -> (frac(3, 2))^+) (|2x| - 3) = 0^+$

$"donc"$ $lim_(x -> (frac(3, 2))^+) f(x) = -infinity$ (de la forme $frac(-0.25, 0^+)$)

// Source: Corrige T1 p.51
- $lim_(x -> (-frac(3, 2))^-) x^2 - |x| - 1 = -frac(1, 4)$ et $lim_(x -> (-frac(3, 2))^-) (|2x| - 3) = 0^+$

$"donc"$ $lim_(x -> (-frac(3, 2))^-) f(x) = -infinity$ (de la forme $frac(-0.25, 0^+)$)

- $lim_(x -> (-frac(3, 2))^+) x^2 - |x| - 1 = -frac(1, 4)$ et $lim_(x -> (-frac(3, 2))^+) (|2x| - 3) = 0^-$

$"donc"$ $lim_(x -> (-frac(3, 2))^+) f(x) = +infinity$ (de la forme $frac(-0.25, 0^-)$)

// Source: Corrige T1 p.51

=== Exercice 11

Calculer dans chacun des cas ci-dessous les limites de la fonction f en $+infinity$ et en $-infinity$.

a. $f(x) = sqrt(frac(x, x + 1))$ #h(1cm) ; #h(0.5cm) b. $f(x) = frac(1, sqrt(x)) - frac(1, 10) + frac(1, sqrt(x^2))$

c. $f(x) = frac(1, sqrt(x) - 1) + E(x) + frac(sqrt(x^2 + 1), x - 1)$

==== Corrigé

a) $f(x) = sqrt(x^2 + |x| - 1)$

$lim_(x -> +infinity) x^2 + |x| - 1 = +infinity$ et $lim_(x -> -infinity) x^2 + |x| - 1 = +infinity$

$"d'où"$ $lim_(x -> +infinity) f(x) = lim_(x -> -infinity) f(x) = +infinity$

b) $f(x) = x sqrt(frac(x - 1, x + 1))$

- $lim_(x -> +infinity) frac(x - 1, x + 1) = lim_(x -> +infinity) frac(x, x) = 1 arrow.double lim_(x -> +infinity) sqrt(frac(x - 1, x + 1)) = sqrt(1) = 1$

$"d'où"$ $lim_(x -> +infinity) f(x) = lim_(x -> +infinity) x sqrt(frac(x - 1, x + 1)) = +infinity$

#h(4cm) _$underbrace(, 1)$_

- $lim_(x -> -infinity) frac(x - 1, x + 1) = lim_(x -> -infinity) frac(x, x) = 1 arrow.double lim_(x -> -infinity) sqrt(frac(|x - 1|, |x + 1|)) = sqrt(1) = 1$

$"d'où"$ $lim_(x -> -infinity) f(x) = lim_(x -> -infinity) x sqrt(frac(x - 1, x + 1)) = -infinity$

#h(4cm) _$underbrace(, 1)$_

// Source: Corrige T1 p.51-52
c) $f(x) = frac(-1, x - 4) + sqrt(frac(3x, (x - 1)^3))$

- \* $lim_(x -> +infinity) frac(3x, (x - 1)^3) = lim_(x -> +infinity) frac(3x, x^3 - 3x^2 + 3x - 1) = lim_(x -> +infinity) frac(3x, x^3)$

$= lim_(x -> +infinity) frac(3, x^2) = 0 arrow.double lim_(x -> +infinity) sqrt(frac(3x, (x - 1)^3)) = sqrt(0) = 0$

\* $lim_(x -> +infinity) frac(-1, x - 4) = frac(-1, +infinity) = 0$

#h(1cm) $"d'où"$ $lim_(x -> +infinity) f(x) = 0 + 0 = 0$

- \* $lim_(x -> -infinity) frac(3x, (x - 1)^3) = lim_(x -> -infinity) frac(3x, x^3) = lim_(x -> -infinity) frac(3, x^2) = 0 arrow.double lim_(x -> -infinity) sqrt(frac(3x, (x - 1)^3)) = sqrt(0) = 0$

\* $lim_(x -> -infinity) frac(-1, x - 4) = frac(-1, -infinity) = 0$

#h(1cm) $"d'où"$ $lim_(x -> -infinity) f(x) = 0 + 0 = 0$

d) $f(x) = x - frac(1, sqrt((-x + 2)^6))$

- $lim_(x -> +infinity) (-x + 2)^6 = +infinity$

$"donc"$ $lim_(x -> +infinity) sqrt((-x + 2)^6) = +infinity$ par suite $lim_(x -> +infinity) frac(1, sqrt((-x + 2)^6)) = 0$

il résulte : $lim_(x -> +infinity) f(x) = lim_(x -> +infinity) (x - underbrace(frac(1, sqrt((-x + 2)^6)), arrow.t 0)) = +infinity$

- $lim_(x -> -infinity) (-x + 2)^6 = +infinity$

$"donc"$ $lim_(x -> -infinity) sqrt((-x + 2)^6) = +infinity$ par suite $lim_(x -> -infinity) frac(1, sqrt((-x + 2)^6)) = 0$

il résulte : $lim_(x -> -infinity) f(x) = lim_(x -> -infinity) (x - underbrace(frac(1, sqrt((-x + 2)^6)), arrow.t 0)) = -infinity$

// Source: Corrige T1 p.52

=== Exercice 12

Dans le plan muni d'un repère, on a tracé la courbe représentative $C_f$ de la fonction $f : x |-> x + sqrt(x)$.

1. Déterminer son ensemble de définition.

2. Calculer les limites de f aux bornes de son ensemble de définition.

3. Montrer que C admet une asymptote verticale dont on donnera son équation.

#cetz.canvas({
  import cetz.draw: *
  // Axes
  line((-1, 0), (4, 0), stroke: 0.5pt, mark: (end: ">"))
  line((0, -2), (0, 3), stroke: 0.5pt, mark: (end: ">"))
  content((4, -0.3), $x$)
  content((-0.3, 3), $y$)
  // Courbe f(x) = x + sqrt(x)
  bezier((0, 0), (1, 2), (0.3, 0.8), (0.7, 1.7), stroke: blue + 1.5pt)
  bezier((1, 2), (3, 3), (1.5, 2.3), (2.5, 2.8), stroke: blue + 1.5pt)
})

==== Corrigé

$f(x) = x + frac(1, x^2)$

1) $D f = {x in RR, x^2 eq.not 0} = RR^*$

2) Graphiquement on a :

$circled(times)$ $lim_(x -> -infinity) f(x) = -infinity$ #h(1cm) $circled(times)$ $lim_(x -> +infinity) f(x) = +infinity$

$circled(times)$ $lim_(x -> 0^-) f(x) = +infinity$ #h(1cm) $circled(times)$ $lim_(x -> 0^+) f(x) = +infinity$

3) $lim_(x -> 0^-) f(x) = +infinity$ et $lim_(x -> 0^+) f(x) = +infinity$

d'où la droite d'équation $x = 0$ *(la droite des ordonnées)* est une asymptote verticale pour C

// Source: Corrige T1 p.52

=== Exercice 13

Soit f la fonction définie sur $RR$ par $f(x) = frac(x^2, x + 1)$.

On désigne par C sa courbe représentative dans un repère $(O, arrow(i), arrow(j))$.

1. Déterminer la limite de f en $-infinity$.

2. a. Vérifier que pour tout réel $x$, $f(x) = frac(x^2, x + 1)$.

#h(0.5cm) b. En déduire la limite de f en $+infinity$. Interpréter le résultat.

==== Corrigé

1) \* $lim_(x -> -infinity) (x^2 + 1) = +infinity$ donc $lim_(x -> -infinity) sqrt(x^2 + 1) = +infinity$

\* $lim_(x -> -infinity) (-x) = +infinity$

$"d'où"$ $lim_(x -> -infinity) f(x) = lim_(x -> -infinity) sqrt(x^2 + 1) + (-x) = +infinity$

2) a) pour tout réel $x$ on a :

$ (sqrt(x^2 + 1) - x)(sqrt(x^2 + 1) + x) = (sqrt(x^2 + 1))^2 - x^2 $

$ = x^2 + 1 - x^2 = 1 $

Donc $f(x) = frac(1, sqrt(x^2 + 1) + x)$ ; $x in RR$

b)

$lim_(x -> +infinity) (x^2 + 1) = +infinity$ alors $lim_(x -> +infinity) sqrt(x^2 + 1) = +infinity$

$"d'où"$ $lim_(x -> +infinity) (sqrt(x^2 + 1) + underbrace(x, +infinity)) = +infinity$

ce qui donne : $lim_(x -> +infinity) frac(1, sqrt(x^2 + 1) + x) = lim_(x -> +infinity) f(x) = 0$

Ainsi la droite d'équation $y = 0$ est asymptote horizontale à C au voisinage de plus l'infini

// Source: Corrige T1 p.52-53

=== Exercice 14

On considère la fonction $f : x |-> frac(2x^2 - 4x + 6, x - 3) + 2$.

On désigne par C sa courbe représentative dans un repère $(O, arrow(i), arrow(j))$.

1. Déterminer l'ensemble de définition de f.

2. Écrire le trinôme $x^2 - 3x + 2$.

3. Déterminer les limites de f aux bornes de son ensemble de définition, en précisant les asymptotes à C.

==== Corrigé

$ f(x) = frac(2x^2 - 4x + 6, x^2 - 3x + 2) $

1)

$D f = {x in RR, x^2 - 3x + 2 eq.not 0}$

Or on a :

$x^2 - 3x + 2 = 0$

$a + b + c = 0$ donne $x' = 1$ et $x'' = 2$

Par suite $D f = RR backslash {1, 2}$

2) Rappelons que : $a x^2 + b x + c =$

$a(x - x')(x - x'')$

Donc $x^2 - 3x + 2 = (x - 1)(x - 2)$

3)

\* $lim_(x -> +infinity) f(x) = lim_(x -> +infinity) frac(2x^2, x^2) = 2$

$lim_(x -> -infinity) f(x) = lim_(x -> -infinity) frac(2x^2, x^2) = 2$

Ce qui prouve que la droite d'équation $y = 2$ est une asymptote horizontale à la courbe C de $f$ au voisinage de $+infinity$ et de $-infinity$

// Source: Corrige T1 p.53
\*

#table(
  columns: 5,
  align: center,
  [$x$], [$-infinity$], [$1$], [$2$], [$+infinity$],
  [Signe de $(x^2 - 3x + 2)$], [$+$], [$0 quad - quad 0$], [], [$+$],
)

\*- $lim_(x -> 1^-) (x^2 - 3x + 2) = 0^+$ et $lim_(x -> 1^-) (2x^2 - 4x + 6) = 4$

$"donc"$ $lim_(x -> 1^-) f(x) = frac(4, 0^+) = +infinity$

- $lim_(x -> 1^+) (x^2 - 3x + 2) = 0^-$ et $lim_(x -> 1^+) (2x^2 - 4x + 6) = 4$

$"donc"$ $lim_(x -> 1^+) f(x) = frac(4, 0^-) = -infinity$

Donc la droite d'équation $x = 1$ est une asymptote verticale à la courbe C de $f$

\*- $lim_(x -> 2^-) (x^2 - 3x + 2) = 0^-$ et $lim_(x -> 2^-) (2x^2 - 4x + 6) = 6$

$"donc"$ $lim_(x -> 2^-) f(x) = frac(6, 0^-) = -infinity$

- $lim_(x -> 2^+) (x^2 - 3x + 2) = 0^+$ et $lim_(x -> 2^+) (2x^2 - 4x + 6) = 6$

$"donc"$ $lim_(x -> 2^+) f(x) = frac(6, 0^+) = +infinity$ #h(0.5cm) (*)

Donc la droite d'équation $x = 2$ est une asymptote verticale à la courbe C de $f$

4) Pour tout $x in D f$ on a :

$ f(x) - 2 = frac(2x^2 - 4x + 6, x^2 - 3x + 2) - 2 $

$ = frac((2x^2 - 4x + 6) - 2(x^2 - 3x + 2), x^2 - 3x + 2) $

$ = frac(2x^2 - 4x + 6 - 2x^2 + 6x - 4, x^2 - 3x + 2) $

$ = frac(2x + 2, x^2 - 3x + 2) $

$Delta$ D'équation $y = 2$ est une asymptote horizontale à la courbe C de $f$ au voisinage de $+infinity$ et de $-infinity$

On va tout d'abord étudier le signe de $f(x) - 2$ :

#table(
  columns: 7,
  align: center,
  [$x$], [$-infinity$], [$-1$], [$1$], [$2$], [], [$+infinity$],
  [Signe de $(x^2 - 3x + 2)$], [$+$], [$+$], [$0 quad -$], [$0$], [], [$+$],
  [Signe de $(2x + 2)$], [$-$], [$0 quad +$], [$+$], [], [], [$+$],
  [Signe de $frac(2x + 2, x^2 - 3x + 2)$], [$-$], [], [$+$], [$-$], [], [$+$],
)

D'où :

// Source: Corrige T1 p.54
#table(
  columns: 7,
  align: center,
  [$x$], [$-infinity quad -1$], [], [$1 quad 2$], [], [], [$+infinity$],
  [Signe de $(f(x) - 2)$], [$-$], [$+$], [$-$], [], [$+$], [],
  [Position relative], [$Delta$ aux dessus de C], [$Delta$ aux dessous de C], [$Delta$ aux dessus de C], [], [$Delta$ aux dessous de C], [],
)

$A(-1, 2)$ : point d'intersection de C avec $Delta$

// Source: Corrige T1 p.54

=== Exercice 15

Soit f la fonction définie sur

$RR \\ {2}$ par $f(x) = frac(x^2 - x - 10, x - 2)$.

On désigne par C sa courbe représentative dans un repère $(O, arrow(i), arrow(j))$.

1. Étudier les limites de f aux bornes de son ensemble de définition.

2. Vérifier que pour tout $x eq.not 2$, $f(x) = x + 1 + frac(5x - 14, (x - 2)^2)$.

3. En déduire les asymptotes à C.

4. Préciser la position de C par rapport à son asymptote en $+infinity$ (respectivement en $-infinity$).

==== Corrigé

$ f(x) = frac(x^2 + x - 10, (x - 2)^2) $

1)

\* $lim_(x -> +infinity) f(x) = lim_(x -> +infinity) frac(x^2, x^2) = 1$

$lim_(x -> -infinity) f(x) = lim_(x -> -infinity) frac(x^2, x^2) = 1$

\*- $lim_(x -> 2) (x^2 + x - 10) = -4$ et $lim_(x -> 2) (x - 2)^2 = 0^+$

$"donc"$ $lim_(x -> 2) f(x) = frac(-4, 0^+) = -infinity$

2) pour $x eq.not 2$

$ 1 + frac(5x - 14, (x - 2)^2) = frac((x - 2)^2 + (5x - 14), (x - 2)^2) = frac(x^2 + x - 10, (x - 2)^2) = f(x) $

3) On a

$lim_(x -> 2) f(x) = -infinity$

Donc la droite d'équation $x = 2$ est une asymptote verticale à C.

On a \* $lim_(x -> +infinity) f(x) = lim_(x -> -infinity) f(x) = 1$

Donc la droite $D$ d'équation : $y = 1$ est une asymptote horizontale à C.

// Source: Corrige T1 p.54
4) $f(x) - 1 = frac(5x - 14, (x - 2)^2)$ ; $Delta: y = 1$

le signe de $(f(x) - 1)$ _est celui de_ $(5x - 14)$

#table(
  columns: 4,
  align: center,
  [$x$], [$-infinity$], [$14/5$], [$+infinity$],
  [$f(x) - x$], [$-$], [$0$], [$+$],
  [Position relative], [$Delta "/" C$], [], [$C "/" Delta$],
)

// Source: Corrige T1 p.54

=== Exercice 16

On considère la fonction $f : x |-> frac(x + 4, x)$.

On désigne par C sa courbe représentative dans un repère $(O, arrow(i), arrow(j))$.

1. a. Déterminer l'ensemble de définition de f.

#h(0.5cm) b. Étudier la parité de f.

3. Montrer que pour tout réel x non nul, $f(x) = 1 + frac(4, x)$.

5. a. En déduire que f admet une asymptote D d'équation $x = 0$ et $x + 4$.

#h(0.5cm) b. Étudier la position de C par rapport à D.

#h(0.5cm) c. Étudier la limite de f en $-infinity$ et préciser l'asymptote.

#h(0.5cm) d. Étudier la position de C par rapport à cette asymptote.

// Source: Manuel T1 p.77

==== Corrigé

1) $f(x) = frac(sqrt(1 + x^2) - 1, x)$

a) $D f = {x in RR "telque" x eq.not 0} = RR^*$

b) - Pour $x in RR^*$, on a : $(-x) in D f$

- $f(-x) = frac(sqrt(1 + (-x)^2) - 1, (-x)) = -(frac(sqrt(1 + x^2) - 1, x))$

donc : $f(-x) = -f(x)$

Conclusion : $f$ est une fonction impaire

2) a) - Pour $x in RR^*$

$ f(x) = frac((sqrt(1 + x^2) - 1) times (sqrt(1 + x^2) + 1), x(sqrt(1 + x^2) + 1)) = frac((1 + x^2) - 1, x(sqrt(1 + x^2) + 1)) $

$ f(x) = frac(x^2, x(sqrt(1 + x^2) + 1)) = frac(x, sqrt(1 + x^2) + 1) $

b)

Pour $x eq.not 0$ on a : $f(x) = frac(x, sqrt(1 + x^2) + 1) = g(x)$

$g$ est continue en 0 d'où $lim_(x -> 0) f(x) = g(0) = 0$

$lim_(x -> 0) f(x) = 0$ : nombre fini donc $f$ admet un prolongement par continuité en 0

// Source: Corrige T1 p.55
3) a) Pour $x > 0$ on a : $sqrt(x^2) = x$

$ f(x) = frac(sqrt(1 + x^2) - 1, x) = frac(sqrt(1 + x^2), x) - frac(1, x) = frac(sqrt(1 + x^2), sqrt(x^2)) - frac(1, x) $

$ f(x) = sqrt(frac(1 + x^2, x^2)) - frac(1, x) ; x > 0 $

b)

$lim_(x -> +infinity) frac(1 + x^2, x^2) = lim_(x -> +infinity) frac(x^2, x^2) = 1$ d'où $lim_(x -> +infinity) sqrt(frac(1 + x^2, x^2)) = 1$

et comme $lim_(x -> +infinity) frac(1, x) = 0$ on aura : $lim_(x -> +infinity) f(x) = 1$

Donc la droite $D$ d'équation $y = 1$ est une asymptote horizontale à la courbe C de $f$ au voisinage de $+infinity$

b) $D' = S_O(D)$ et la courbe $C$ est symétrique par rapport à $O$. Comme $C$ est au dessous de $D$

alors $C$ est au dessus de son asymptote $D'$

c)

- Pour $x in ]0, +infinity[$ on a : $f(x) = frac(x, sqrt(1 + x^2) + 1)$

\*comme : $sqrt(1 + x^2) + 1 > sqrt(1 + x^2) > sqrt(x^2) = x > 0$

alors $frac(x, sqrt(1 + x^2) + 1) < 1$ d'où $f(x) < 1$

par suite la courbe $C$ est dessous de l'asymptote $D$ : $y = 1$ sur $]0, +infinity[$

- Pour $x in ]-infinity, 0[$ on a : $f(x) = frac(x, sqrt(1 + x^2) + 1) < 0 < 1$

d'où $f(x) < 1$ ce qui prouve que la courbe $C$ est dessous de l'asymptote $D$ : $y = 1$ sur $]-infinity, 0[$

4) a) $lim_(x -> +infinity) f(x) = 1$ et comme $f$ est impaire

alors $lim_(x -> -infinity) f(x) = -1$

Donc la droite $D'$ d'équation $y = -1$ est une asymptote horizontale à la courbe C de $f$ au voisinage de $-infinity$

// Source: Corrige T1 p.55
Remarque : on pourra montrer que pour tout $x in RR^*$ que $f(x) > -1$

(On distinguera le cas $x > 0$ et $x < 0$)

=== Exercice 17

Soit la fonction $f : x |-> frac(x, x + 1)$.

On désigne par C sa courbe représentative dans un repère $(O, arrow(i), arrow(j))$.

1. Étudier la parité de f.

2. Vérifier que pour tout $x gt.eq 1$, $f(x) = 1 - frac(1, x + 1)$.

En déduire : $lim_(x -> +infinity) f(x)$.

3. Déterminer les asymptotes $C_f$.

==== Corrigé

1) $f(x) = frac(sqrt(x^2 - 1), x^3)$

- $D f = {x in RR "telque" x^2 - 1 gt.eq 0 "et" x^3 eq.not 0}$

#table(
  columns: 5,
  align: center,
  [$x$], [$-infinity$], [$-1$], [$1$], [$+infinity$],
  [Signe de $(x^2 - 1)$], [$+$], [$0 quad - quad 0$], [], [$+$],
)

$D f = ]-infinity, -1] union [1, +infinity[$

- Pour $x in D f arrow.double x lt.eq -1$ ou $x gt.eq 1$

$arrow.double -x gt.eq 1$ ou $-x lt.eq -1$, donc $(-x) in D f$

- $f(-x) = frac(sqrt((-x)^2 - 1), (-x)^3) = frac(sqrt(x^2 - 1), -x^3) = -(frac(sqrt(x^2 - 1), x^3))$

donc : $f(-x) = -f(x)$

Conclusion : $f$ est une fonction impaire

// Source: Corrige T1 p.56
2) - Pour $x gt.eq 1$ on a : $x^3 = sqrt(x^6)$

$ f(x) = frac(sqrt(x^2 - 1), x^3) = frac(sqrt(x^2 - 1), sqrt(x^6)) = sqrt(frac(x^2 - 1, x^6)) $

$lim_(x -> +infinity) frac(x^2 - 1, x^6) = lim_(x -> +infinity) frac(x^2, x^6) = lim_(x -> +infinity) frac(1, x^4) = 0$

$arrow.double lim_(x -> +infinity) f(x) = 0$

$lim_(x -> +infinity) f(x) = 0$ et comme $f$ est impaire

alors $lim_(x -> -infinity) f(x) = 0$

3) $lim_(x -> +infinity) f(x) = 0$ et $lim_(x -> -infinity) f(x) = 0$

Donc la droite $D$ d'équation $y = 0$ est une asymptote horizontale au voisinage de $-infinity$ et de $+infinity$

4) l'asymptote $D$ : $y = 0$

- pour $x > 1$ on a : $f(x) > 0$

ce qui prouve que la courbe $C$ est dessus de l'asymptote $D$ sur $[1, +infinity[$

Le point d'abscisse 1 est commun à C et D

- pour $x < -1$ : $f(x) < 0$

ce qui prouve que la courbe $C$ est dessous de l'asymptote $D$ sur $]-infinity, -1]$

Le point d'abscisse $-1$ est commun à C et D

// Source: Corrige T1 p.56

=== Exercice 18

Soit la fonction définie sur $RR^*$ et $P = 1$ par

$ f(x) = frac(x, 2x - 1) $

On désigne par C sa courbe représentative dans un repère $(O, arrow(i), arrow(j))$.

1. Étudier les limites de f aux bornes de son ensemble de définition.

2. a. Montrer que la droite D d'équation $y = frac(1, 2)$ est une asymptote à C au voisinage de $+infinity$.

#h(0.5cm) b. Étudier la position de C par rapport à D.

==== Corrigé

$ f(x) = frac(x^2 - 2x + 2, 2x) $

1) $D_f = RR^*$

- $lim_(x -> +infinity) f(x) = lim_(x -> +infinity) frac(x^2, 2x) = lim_(x -> +infinity) (frac(x, 2)) = +infinity$

- $lim_(x -> 0^+) (x^2 - 2x + 2) = 2$ et $lim_(x -> 0^+) (2x) = 0^+$

$"donc"$ $lim_(x -> 0^+) f(x) = +infinity$ (de la forme $frac(2, 0^+)$)

2) a)

$ f(x) - (frac(x, 2) - 1) = (frac(x, 2) - 1 + frac(1, x)) - frac(x, 2) + 1 = frac(1, x) $

$plus.circle$ $lim_(x -> +infinity) [f(x) - (frac(x, 2) - 1)] = lim_(x -> +infinity) (frac(1, x)) = 0$

Donc la droite $D$ d'équation : $y = frac(x, 2) - 1$ est une asymptote oblique à la courbe C de $f$ au voisinage de $+infinity$

b) $plus.circle$ $f(x) - (frac(x, 2) - 1) = frac(1, x) > 0$ sur $]0, +infinity[$

Donc C est au dessus de D

// Source: Corrige T1 p.56

=== Exercice 19

On considère la fonction $f : x |-> x + sqrt(x + 1) - frac(1, x)$.

Dans le plan muni d'un repère orthonormé, on désigne par C la courbe représentative de f.

1. Déterminer l'ensemble de définition de f.

2. Calculer les limites de f aux bornes de son ensemble de définition.

3. a. Soit la droite d'équation $y = x - 1$.

#h(0.5cm) a. Déterminer les coordonnées du point d'intersection de $Delta$ et de C.

#h(0.5cm) b. Étudier la position de C par rapport à $Delta$.

==== Corrigé

$ f(x) = -x + 1 + frac(x - 1, (x - 2)^2) $

1) $D f = {x in RR "telque" (x - 2) eq.not 0} = RR backslash {2}$

2) - $lim_(x -> +infinity) (-x + 1) = -infinity$

et $lim_(x -> +infinity) frac(x - 1, (x - 2)^2) = lim_(x -> +infinity) frac(x - 1, x^2 - 4x + 4) = lim_(x -> +infinity) frac(x, x^2) = lim_(x -> +infinity) frac(1, x) = 0$

$"d'où"$ $lim_(x -> +infinity) f(x) = -infinity$

- $lim_(x -> -infinity) (-x + 1) = +infinity$

et $lim_(x -> -infinity) frac(x - 1, (x - 2)^2) = lim_(x -> -infinity) frac(x - 1, x^2 - 4x + 4) = lim_(x -> -infinity) frac(x, x^2) = lim_(x -> -infinity) frac(1, x) = 0$

$"d'où"$ $lim_(x -> -infinity) f(x) = +infinity$

// Source: Corrige T1 p.57
- $lim_(x -> 2) (frac(x - 1, (x - 2)^2)) = +infinity$ (de la forme $frac(1, 0^+)$) et $lim_(x -> 2) (-x + 1) = -1$

$lim_(x -> 2) f(x) = +infinity + (-1) = +infinity$

$"donc"$ $lim_(x -> 2^-) f(x) = lim_(x -> 2^+) f(x) = +infinity$

3) $Delta$ d'équation : $y = -x + 1$

a) $M(x, y) in C sect Delta$

$ arrow.l.r.double cases(
  y = f(x),
  y = -x + 1
) $

$f(x) = -x + 1 arrow.l.r.double -x + 1 + frac(x - 1, (x - 2)^2) = -x + 1$

$arrow.l.r.double frac(x - 1, (x - 2)^2) = 0 arrow.l.r.double x = 1$

Or pour $x = 1$ on a : $y = 0$

Conclusion : $C sect Delta = {A (1, 0)}$

b) $plus.circle$ $f(x) - (-x + 1) = frac(x - 1, (x - 2)^2)$

#table(
  columns: 5,
  align: center,
  [$x$], [$-infinity$], [$1$], [$2$], [$+infinity$],
  [Signe de $f(x) - (-x + 1)$], [$-$], [$+ quad +$], [], [$+$],
  [Position relative de C par rapport à $Delta$], [C est au Dessous de $Delta$], [C au dessus de $Delta$], [C est au dessus de $Delta$], [C est au dessous de $Delta$],
)

4) a) $M N = |f(x) - (-x + 1)|$

$ M N = |frac(x - 1, (x - 2)^2)| = frac(|x - 1|, (x - 2)^2) $

b)

$lim_(|x| -> +infinity) [f(x) - (-x + 1)] = lim_(|x| -> +infinity) frac(x - 1, (x - 2)^2) = lim_(|x| -> +infinity) frac(1, x) = 0$

// Source: Corrige T1 p.57
c) la droite $Delta$ d'équation : $y = -x + 1$ est une asymptote oblique à la courbe C de $f$ au voisinage de $+infinity$ et de $-infinity$

// Source: Corrige T1 p.57

=== Exercice 20

Soit la fonction $f : x |-> x + sqrt(x) + a + b$, où $a, x + 1$ et $a, b$ et c sont trois réels.

On désigne par C sa courbe représentative dans un repère orthonormé $(O, arrow(i), arrow(j))$.

1. On suppose que $f(0) = 0$, $f'(1) = 1$.

2. Déterminer les coordonnées du point d'intersection de la parabole P par rapport à la définition de f.

==== Corrigé

$ f(x) = a x + b + frac(1, 3 - x) $

1) $D f = {x in RR "telque" (3 - x) eq.not 0} = RR backslash {3}$

2) $cases(
  f(2) = 1,
  f(4) = -3
) arrow.l.r.double cases(
  2a + b + 1 = 1,
  4a + b - 1 = -3
)$

$arrow.l.r.double cases(
  b = -2a,
  4a - 2a = -2
) arrow.l.r.double cases(
  a = -1,
  b = 2
)$

$"donc"$ $f(x) = -x + 2 + frac(1, 3 - x)$

3) a)

- $lim_(x -> 3^+) (-x + 2) = -1$ et $lim_(x -> 3^+) (frac(1, 3 - x)) = -infinity$

#h(5cm) $underbrace(, 0^-)$

$lim_(x -> 3^+) f(x) = -infinity$

- $lim_(x -> 3^-) (-x + 2) = -1$ et $lim_(x -> 3^-) (frac(1, 3 - x)) = +infinity$

#h(5cm) $underbrace(, 0^+)$

$lim_(x -> 3^-) f(x) = +infinity$

d'où la droite $D$ d'équation : $x = 3$ est une asymptote verticale à la courbe C de $f$

b) $D'$ : $y = -x + 2$

$M(x, y) in D sect D' arrow.l.r.double cases(x = 3, y = -x + 2 = -3 + 2 = -1)$

Conclusion : $D sect D' = {I (3, -1)}$

// Source: Corrige T1 p.58
4) $M(x, y)$ et $N = S_I(M)$

a) $I$ milieu de segment $[M N]$ d'où

$ cases(
  frac(x_M + x_N, 2) = x_I,
  frac(y_M + y_N, 2) = y_I
) arrow.l.r.double cases(
  x_N = 2 x_I - x_M,
  y_N = 2 y_I - y_M
) arrow.l.r.double cases(
  x_N = 6 - x,
  y_N = -2 - y
) $

Donc $N(6 - x, -2 - y)$

b)

$N(6 - x, -2 - f(x))$

$N in C$ si et seulement si

$6 - x eq.not 3$ et $f(6 - x) = -2 - f(x)$

c) pour $x eq.not 3$ on a : $6 - x eq.not 3$

$f(6 - x) = -(6 - x) + 2 + frac(1, 3 - (6 - x))$

$= -6 + x + 2 + frac(1, x - 3)$

$= -4 + x - frac(1, 3 - x)$

$= -2 - 2 + x - frac(1, 3 - x)$

$= -2 - (2 - x + frac(1, 3 - x))$

$= -2 - f(x)$ d'où $N in C$

*CONCLUSION* :

$(6 - x) in D f$ et $f(2 times 3 - x) = 2 times (-1) - f(x)$

D'où le point $I(3, -1)$ est un centre de symétrie pour la courbe $C$

// Source: Corrige T1 p.58

=== Exercice 21

On considère la fonction $f : x |-> x + frac(x^2, x - 1)$.

On désigne par C sa courbe représentative dans un repère orthonormé $(O, arrow(i), arrow(j))$.

1. a. Soit a un réel différent de $-1$, M un point de C et N un point de la parabole P de même abscisse a.

#h(0.5cm) b. Calculer en fonction de x, la distance MN.

#h(0.5cm) c. Calculer la limite de $h(x) = (x - 1)^2 - x^2 + 1$ quand x tend vers $+infinity$ et vers $-infinity$.

#h(0.5cm) d. A quelle condition la distance MN est-elle inférieure ou égale à $0.01$ ?

// Source: Manuel T1 p.78

==== Corrigé

$ f(x) = a x^2 + b x + c - frac(1, x + 1) ; x eq.not -1 $

1) $cases(
  f(0) = 0,
  f(1) = frac(1, 2),
  f(2) = frac(8, 3)
) arrow.l.r.double cases(
  c - 1 = 0,
  a + b + c - frac(1, 2) = frac(1, 2),
  4a + 2b + c - frac(1, 3) = frac(8, 3)
)$

$arrow.l.r.double cases(
  c = 1,
  a + b = 0,
  4a + 2b = 2
) arrow.l.r.double cases(
  c = 1,
  b = -a,
  4a - 2a = 2
) arrow.l.r.double cases(
  a = 1,
  b = -1,
  c = 1
)$

$"d'où"$ $f(x) = x^2 - x + 1 - frac(1, x + 1)$

2) $(P)$ : $y = x^2 - x + 1$

a) $plus.circle$ $f(x) - (x^2 - x + 1) = frac(-1, x + 1)$

#table(
  columns: 4,
  align: center,
  [$x$], [$-infinity$], [$-1$], [$+infinity$],
  [Signe de $f(x) - (x^2 - x + 1)$], [$+$], [], [$-$],
  [Position relative de C par rapport à $P$], [C est au dessus de $P$], [], [C est au dessous de $P$],
)

b)

$x eq.not -1$ ; $M N = |f(x) - (x^2 - x + 1)| = frac(|-1|, |x + 1|) = frac(1, |x + 1|)$

c)

$lim_(|x| -> +infinity) [f(x) - (x^2 - x + 1)] = lim_(|x| -> +infinity) (-frac(1, x + 1)) = 0$

d) $M N lt.eq 0.01 arrow.l.r.double frac(1, |x + 1|) lt.eq frac(1, 100) arrow.l.r.double |x + 1| gt.eq 100$

$arrow.l.r.double x + 1 lt.eq -100$ ou $x + 1 gt.eq 100$

$arrow.l.r.double x lt.eq -101$ ou $x gt.eq 99$

== Avec l'ordinateur

On se donne un rectangle ABCD tel que $A B = a$ et $B C = b$.

Soit MNP un triangle inscrit de sommet principal P et ABCD un rectangle tel que :
- a et b supplémentaires à $frac(pi, 2)$.
- C(approche) [PA].
- D(approche) [PM].

Soit B le projeté orthogonal de P sur (MN) et on note $P H = s$.

On désigne par $A(s)$ l'aire du triangle MNP.

1. Montrer $M H = frac(4 s, 2s + b)$.

2. En déduire que $A(s) = frac(2s times b, 2s + b)$.

On se propose dans cette séquence, d'étudier le comportement de l'aire $A(s)$ du triangle MNP lorsque P varie sur la perpendiculaire à (AB) en H.

- Ouvrir un nouveau fichier cabri et faire apparaître les axes.
- Construire le rectangle ABCD (On pourra prendre $A B = 2$ et $B C = 1$).
- La médiatrice de (AB) : coupe [CD] en L.
- Placer un point variable P point sur un demi-droite [LB].
- Reporter sur l'axe des abscisses la longueur PH.
- Reporter sur l'axe des ordonnées la longueur MH.
- Placer sur l'axe des ordonnées le point K tel que $O K = P H dot M H$ puis le point m de coordonnées (PH, OK).
- Déplacer le point P et conjecturer le comportement de $A(s)$.

#cetz.canvas({
  import cetz.draw: *
  // Rectangle ABCD avec triangle inscrit
  rect((0, 0), (4, 2), stroke: blue + 1pt)
  content((-0.3, -0.3), $A$)
  content((4.3, -0.3), $B$)
  content((4.3, 2.3), $C$)
  content((-0.3, 2.3), $D$)
  // Triangle MNP inscrit
  line((0, 0.8), (4, 0.8), stroke: green + 0.5pt)
  line((0, 0.8), (2, 3.5), stroke: green + 1pt)
  line((4, 0.8), (2, 3.5), stroke: green + 1pt)
  content((2, 3.8), $P$)
  content((-0.3, 0.8), $M$)
  content((4.3, 0.8), $N$)
  // Hauteur PH
  line((2, 0.8), (2, 3.5), stroke: (dash: "dashed", paint: gray))
  content((2.3, 0.5), $H$)
  // Triangle coloré
  // fill triangle
})

// Source: Manuel T1 p.79
== Math - culture

Aborder la notion d'infini en mathématiques peut se faire de plusieurs façons. La première et la plus simple consiste à poser un élément dénommé infini et à le caractériser par certaines de ses propriétés. Un tel élément n'a cependant aucun lien _a priori_ avec la notion courante d'infini.

Georg Cantor est le premier à donner une caractérisation de cette notion en termes formels.

_Un ensemble est infini s'il est en bijection bilatérale avec l'une de ses parties strictes._

Ainsi l'ensemble $ZZ$ des entiers relatifs, est infini car l'application $n |-> 2n$ le met en bijection avec l'ensemble des entiers pairs.

L'image primitive d'infini est l'idée d'un très grand nombre : les étoiles dans le ciel, les gouttes d'eau de la mer.

L'antiquité ne disposait pas de moyens commodes d'exprimer les grands nombres, aussi ils pouvaient paraître infinis.

Au XIXème siècle, Cauchy (1789-1857) et Weierstrass (1815-1897) ont réussi à donner une définition claire du concept de limite, en abandonnant l'idée de mouvement pour prendre celle d'approximation aussi fine que l'on veut. Ainsi une fonction qui tend vers l'infini est une fonction qui peut prendre des valeurs arbitrairement grandes.
