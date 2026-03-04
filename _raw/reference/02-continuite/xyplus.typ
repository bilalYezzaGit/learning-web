// =============================================================================
// Transcription fidele : XY Plus 3eme Math Tome 1 (CAEU Med Ali)
// Chapitre 2 — Continuite
// Pages 15 a 25
// Auteurs : Zied Belhadj, Lassaad Kallel
// =============================================================================

#import "@preview/cetz:0.3.4"

// ---------------------------------------------------------------------------
// RESUME DE COURS
// ---------------------------------------------------------------------------

// Source: XY Plus T1 p.15

#align(center, text(size: 18pt, weight: "bold")[Chapitre 2 \ Continuite])

#v(1em)

== 1. Continuite en un reel graphiquement

- Lorsque la representation graphique de $f$ sur un intervalle ouvert $I$, met en evidence un trace continu de la courbe, la fonction $f$ est continue en tout reel $a$ de $I$.

#figure(
  cetz.canvas({
    import cetz.draw: *
    // Axes
    line((-0.5, 0), (5, 0), mark: (end: ">"))
    line((0, -0.5), (0, 3), mark: (end: ">"))
    // Courbe continue
    bezier((0.5, 1.5), (2, 2.5), (1, 2.8))
    bezier((2, 2.5), (4.5, 1.5), (3, 0.8))
    // Point a et f(a)
    line((3.5, 0), (3.5, 1.2), stroke: (dash: "dashed"))
    line((0, 1.2), (3.5, 1.2), stroke: (dash: "dashed"))
    content((3.5, -0.3), $a$)
    content((-0.4, 1.2), $f(a)$)
    // Labels
    content((2.5, 2.8), $cal(C)_f$)
    content((-0.3, 2.8), $y$)
    content((4.8, -0.3), $x$)
  }),
  caption: [Courbe continue : $f$ est continue en tout reel $a$ de $I$]
)

- Lorsqu'on observe une rupture (ou un saut) dans le trace de $f$ de part et d'autre du point $A(a, f(a))$ bien que d'abscisse appartenant a son ensemble de definition, alors la fonction $f$ est discontinue en $a$.

#figure(
  cetz.canvas({
    import cetz.draw: *
    // Axes
    line((-0.5, 0), (5, 0), mark: (end: ">"))
    line((0, -0.5), (0, 3.5), mark: (end: ">"))
    // Courbe avec saut
    bezier((0.5, 0.5), (2.5, 1.5), (1.5, 0.8))
    circle((2.5, 1.5), radius: 0.06, fill: black)
    content((2.8, 1.7), $A$)
    // Branche apres le saut
    bezier((2.5, 2.5), (4.5, 3), (3.5, 2.8))
    // Projections
    line((2.5, 0), (2.5, 1.5), stroke: (dash: "dashed"))
    line((0, 1.5), (2.5, 1.5), stroke: (dash: "dashed"))
    content((2.5, -0.3), $a$)
    content((-0.4, 1.5), $f(a)$)
    // Labels
    content((4, 3.2), $cal(C)_f$)
  }),
  caption: [Discontinuite en $a$ : rupture dans le trace]
)

#v(1em)

== 2. Continuite de certaines fonctions usuelles

#block(
  fill: rgb("#e8f5e9"),
  inset: 12pt,
  radius: 4pt,
  width: 100%,
)[
  *Theoreme*

  - Toute fonction constante est continue en tout reel $a$.
  - La fonction $x mapsto x$ est continue en tout reel $a$.
  - Toute fonction lineaire est continue en tout reel $a$.
  - Toute fonction affine est continue en tout reel $a$.
  - La fonction $x mapsto x^2$ est continue en tout reel $a$.
  - Toute fonction polynome est continue en tout reel $a$.
  - La fonction $x mapsto frac(1, x)$ est continue en tout reel non nul $a$.
  - Toute fonction rationnelle est continue en tout reel ou elle est definie.
]

#v(1em)

== 3. Operations algebriques sur les fonctions continues

#block(
  fill: rgb("#e8f5e9"),
  inset: 12pt,
  radius: 4pt,
  width: 100%,
)[
  *Theoreme*

  Soit $f$ et $g$ deux fonctions definies sur un intervalle ouvert $I$. Soit $a$ un reel de $I$ et $k$ un reel.

  - Si $f$ et $g$ sont continues en $a$ alors les fonctions $f + g$, $f g$ et $k f$ sont continues en $a$.
  - Si $f$ est continue en $a$ et si $f(a) eq.not 0$ alors la fonction $frac(1, f)$ est continue en $a$.
  - Si $f$ et $g$ sont continues en $a$ et si $g(a) eq.not 0$ alors la fonction $frac(f, g)$ est continue en $a$.
]

#v(1em)

== 4. Continuite a droite -- Continuite a gauche

#block(
  fill: rgb("#e8f5e9"),
  inset: 12pt,
  radius: 4pt,
  width: 100%,
)[
  *Theoreme*

  Soit $f$ une fonction definie sur un intervalle ouvert contenant $a$.

  $f$ est continue en $a$, si et seulement si, $f$ est continue a droite et a gauche en $a$.
]

#block(
  fill: rgb("#e8f5e9"),
  inset: 12pt,
  radius: 4pt,
  width: 100%,
)[
  *Theoreme*

  Soit $f$ une fonction definie et positive sur un intervalle $I$ et $a$ un reel de $I$.
  - Si $f$ est continue a droite en $a$, alors $sqrt(f)$ est continue a droite en $a$.
  - Si $f$ est continue a gauche en $a$, alors $sqrt(f)$ est continue a gauche en $a$.
]

// Source: XY Plus T1 p.16

#v(1em)

== 5. Continuite sur un intervalle

#block(
  fill: rgb("#f0f7ff"),
  inset: 12pt,
  radius: 4pt,
  width: 100%,
)[
  *Definition*

  - Une fonction definie sur un intervalle $]a, b[$ est dite continue sur $]a, b[$ si elle est continue en tout reel de $]a, b[$.

  - Une fonction definie sur un intervalle $]a, b]$ est dite continue sur $]a, b]$ si elle est continue sur $]a, b[$ et continue a gauche en $b$.

  - Une fonction definie sur un intervalle $[a, b[$ est dite continue sur $[a, b[$ si elle est continue sur $]a, b[$ et continue a droite en $a$.
]

#figure(
  grid(
    columns: 3,
    gutter: 1em,
    cetz.canvas({
      import cetz.draw: *
      // Axes
      line((-0.5, 0), (3.5, 0), mark: (end: ">"))
      line((0, -0.5), (0, 3), mark: (end: ">"))
      // Courbe continue a gauche en b, pas a droite en a
      bezier((0.5, 2), (1.5, 0.5), (1, 0.5))
      bezier((1.5, 0.5), (3, 1.5), (2.5, 1))
      circle((3, 1.5), radius: 0.06, fill: black)
      circle((0.5, 2), radius: 0.06, fill: white, stroke: black)
      // Projections
      line((0.5, 0), (0.5, 2), stroke: (dash: "dashed"))
      line((3, 0), (3, 1.5), stroke: (dash: "dashed"))
      line((0, 2), (0.5, 2), stroke: (dash: "dashed"))
      line((0, 1.5), (3, 1.5), stroke: (dash: "dashed"))
      content((0.5, -0.3), $a$)
      content((3, -0.3), $b$)
      content((-0.5, 2), $f(a)$)
      content((-0.5, 1.5), $f(b)$)
      content((2, 2.2), $cal(C)_f$)
    }),
    cetz.canvas({
      import cetz.draw: *
      // Axes
      line((-0.5, 0), (3.5, 0), mark: (end: ">"))
      line((0, -0.5), (0, 3), mark: (end: ">"))
      // Courbe continue a droite en a, pas a gauche en b
      bezier((0.5, 2), (2, 2.5), (1, 2.8))
      bezier((2, 2.5), (3, 0.5), (2.5, 1))
      circle((0.5, 2), radius: 0.06, fill: black)
      circle((3, 0.5), radius: 0.06, fill: white, stroke: black)
      // Projections
      line((0.5, 0), (0.5, 2), stroke: (dash: "dashed"))
      line((3, 0), (3, 0.5), stroke: (dash: "dashed"))
      line((0, 2), (0.5, 2), stroke: (dash: "dashed"))
      line((0, 0.5), (3, 0.5), stroke: (dash: "dashed"))
      content((0.5, -0.3), $a$)
      content((3, -0.3), $b$)
      content((-0.5, 2), $f(a)$)
      content((-0.5, 0.5), $f(b)$)
      content((1.5, 3), $cal(C)_f$)
    }),
    cetz.canvas({
      import cetz.draw: *
      // Axes
      line((-0.5, 0), (3.5, 0), mark: (end: ">"))
      line((0, -0.5), (0, 3), mark: (end: ">"))
      // Courbe continue sur ]a,b[
      bezier((0.5, 0.5), (2, 2), (1, 2.5))
      bezier((2, 2), (3, 1.5), (2.5, 1.5))
      content((0.5, -0.3), $a$)
      content((3, -0.3), $b$)
      content((2, 2.5), $cal(C)_f$)
    }),
  ),
  caption: [De gauche a droite : $f$ continue a gauche en $b$ (pas a droite en $a$) ; $f$ continue a droite en $a$ (pas continue a gauche en $b$) ; $f$ continue sur $]a, b[$]
)

- Soient $a$ et $b$ deux reels.
  Une fonction definie sur un intervalle $[a, b]$ est dite continue sur $[a, b]$ si elle est continue sur $]a, b[$, continue a droite en $a$ et continue a gauche en $b$.

#figure(
  cetz.canvas({
    import cetz.draw: *
    // Axes
    line((-0.5, 0), (3.5, 0), mark: (end: ">"))
    line((0, -0.5), (0, 3), mark: (end: ">"))
    // Courbe continue sur [a,b]
    circle((0.5, 2.5), radius: 0.06, fill: black)
    bezier((0.5, 2.5), (1.5, 1), (1, 0.8))
    bezier((1.5, 1), (3, 0.5), (2.5, 0.5))
    circle((3, 0.5), radius: 0.06, fill: black)
    // Projections
    line((0.5, 0), (0.5, 2.5), stroke: (dash: "dashed"))
    line((3, 0), (3, 0.5), stroke: (dash: "dashed"))
    line((0, 2.5), (0.5, 2.5), stroke: (dash: "dashed"))
    line((0, 0.5), (3, 0.5), stroke: (dash: "dashed"))
    content((0.5, -0.3), $a$)
    content((3, -0.3), $b$)
    content((-0.5, 2.5), $f(a)$)
    content((-0.5, 0.5), $f(b)$)
    content((1.5, 2.5), $cal(C)_f$)
  }),
  caption: [$f$ continue sur $[a, b]$]
)

// Source: XY Plus T1 p.17

#block(
  fill: rgb("#fff7f0"),
  inset: 12pt,
  radius: 4pt,
  width: 100%,
)[
  *Consequences*

  - Si une fonction est continue sur un intervalle $I$, alors elle est continue sur tout intervalle inclus dans $I$.
  - Toute fonction polynome est continue sur tout intervalle contenu dans $RR$.
  - Toute fonction rationnelle est continue sur tout intervalle contenu dans son ensemble de definition.
]

#v(1em)

== 6. Continuite de la fonction $|space|$

#block(
  fill: rgb("#e8f5e9"),
  inset: 12pt,
  radius: 4pt,
  width: 100%,
)[
  *Theoreme*

  Soit $f$ une fonction definie sur un intervalle $I$.

  Si $f$ est continue sur $I$, alors $|f|$ est continue sur $I$.
]

#v(1em)

== 7. Continuite de la fonction $sqrt(space)$

#block(
  fill: rgb("#e8f5e9"),
  inset: 12pt,
  radius: 4pt,
  width: 100%,
)[
  *Theoreme*

  Soit $f$ une fonction definie et positive sur un intervalle $I$.

  Si $f$ est continue sur $I$, alors $sqrt(f)$ est continue sur $I$.
]

#v(1em)

== 8. Image d'un intervalle par une fonction continue

#block(
  fill: rgb("#e8f5e9"),
  inset: 12pt,
  radius: 4pt,
  width: 100%,
)[
  *Theoreme*

  L'image d'un intervalle par une fonction continue est un intervalle.
]

#figure(
  grid(
    columns: 2,
    gutter: 2em,
    cetz.canvas({
      import cetz.draw: *
      // Axes
      line((-1.5, 0), (1.5, 0), mark: (end: ">"))
      line((0, -0.5), (0, 2), mark: (end: ">"))
      // Parabole y = x^2
      bezier((-1.2, 1.44), (0, 0), (-0.6, 0))
      bezier((0, 0), (1.2, 1.44), (0.6, 0))
      content((0.3, -0.3), $O$)
      content((-1.2, -0.3), $-1$)
      content((1.2, -0.3), $1$)
      content((0.3, 1.5), $1$)
      content((0.8, 1.7), $()$)
    }),
    cetz.canvas({
      import cetz.draw: *
      // Axes
      line((-1.5, 0), (1.5, 0), mark: (end: ">"))
      line((0, -0.5), (0, 2), mark: (end: ">"))
      // Parabole
      bezier((-1.2, 1.44), (0, 0), (-0.6, 0))
      bezier((0, 0), (1.2, 1.44), (0.6, 0))
      // Intervalle J image
      content((0.3, -0.3), $O$)
      content((-1.2, -0.3), $-1$)
      content((1.2, -0.3), $1$)
      content((-0.3, 1.5), $f(J)$)
      content((0.8, 0.3), $J$)
    }),
  ),
  caption: [L'image d'un intervalle par une fonction continue est un intervalle]
)

#block(
  fill: rgb("#fff7f0"),
  inset: 12pt,
  radius: 4pt,
  width: 100%,
)[
  *Remarque :*

  La continuite est une condition suffisante mais n'est pas necessaire pour que l'image d'un intervalle soit un intervalle.
]

#v(1em)

== 9. Resolution d'equations de la forme $f(x) = k$

#block(
  fill: rgb("#e8f5e9"),
  inset: 12pt,
  radius: 4pt,
  width: 100%,
)[
  *Theoreme*

  Soit $f$ une fonction definie et continue sur un intervalle $I$.

  Soient $a$ et $b$ deux reels de $I$ tels que $a < b$.

  Pour tout reel $k$ *compris* entre $f(a)$ et $f(b)$, l'equation $f(x) = k$ possede *au moins* une solution dans l'intervalle $[a, b]$.
]

#figure(
  cetz.canvas({
    import cetz.draw: *
    // Axes
    line((-0.5, 0), (7, 0), mark: (end: ">"))
    line((0, -0.5), (0, 4), mark: (end: ">"))
    // Courbe avec plusieurs intersections avec y = k
    bezier((0.5, 1), (1.5, 3.5), (1, 3))
    bezier((1.5, 3.5), (2.5, 1.5), (2, 1.5))
    bezier((2.5, 1.5), (3.5, 3), (3, 3.2))
    bezier((3.5, 3), (4.5, 0.5), (4, 0.8))
    bezier((4.5, 0.5), (6, 3.5), (5.5, 3))
    // Ligne y = k
    line((0, 2), (6.5, 2), stroke: (dash: "dashed"))
    content((-0.3, 2), $k$)
    // f(a) et f(b)
    line((0, 1), (0.5, 1), stroke: (dash: "dashed"))
    line((0, 3.5), (6, 3.5), stroke: (dash: "dashed"))
    content((-0.5, 1), $f(a)$)
    content((-0.5, 3.5), $f(b)$)
    // Points x_0, x_1, x_2
    content((0.5, -0.3), $a$)
    content((1.2, -0.3), $x_0$)
    content((3.2, -0.3), $x_1$)
    content((5.2, -0.3), $x_2$)
    content((6, -0.3), $b$)
  }),
  caption: [Theoreme des valeurs intermediaires : $f(x) = k$ admet au moins une solution]
)

// ---------------------------------------------------------------------------
// ENONCES
// ---------------------------------------------------------------------------

// Source: XY Plus T1 p.18

#pagebreak()

#align(center, text(size: 18pt, weight: "bold")[ENONCES])

#v(1em)

=== Exercice 1

Dans chacun des cas suivants, justifier que la fonction $f$ est continue au reel $a$ indique :

+ $f(x) = frac(3, 2) x^2 - x + 1$, #h(2em) $a = -sqrt(2)$
+ $f(x) = frac(x + 2, x - 4)$, #h(2em) $a = 0 , 7$
+ $f(x) = lr(|frac(x - 3, x^2 - 1)|)$, #h(2em) $a = 3$
+ $f(x) = |x|^2 - 4|x| - frac(2, x)$, #h(2em) $a = 15$
+ $f(x) = frac(x, 2x - |x + 1|)$, #h(2em) $a = -1$
+ $f(x) = sqrt(4x^2 - 4x - 3)$, #h(2em) $a = 2$
+ $f(x) = sqrt(frac(x^2 - 2x + 1, x + 1))$, #h(2em) $a = 3$

#v(1em)

=== Exercice 2

Soit $f$ la fonction definie par
$ f(x) = cases(
  x - 1 & "si" x lt.eq 0,
  2x - 4 & "si" 0 < x < 3,
  sqrt(x + 1) & "si" x gt.eq 3
) $

+ Tracer la courbe representative de $f$ dans un repere $(O, arrow(i), arrow(j))$.

+ a) Justifier que la fonction $f$ est continue sur $]-infinity, 0]$.

  b) Justifier que la fonction $f$ est continue sur $]0, 3[$.

  c) Justifier que la fonction $f$ est continue sur $[3, +infinity[$.

+ Justifier a l'aide du graphique, que la fonction $f$ n'est pas continue sur $RR$.

#v(1em)

=== Exercice 3

Soit $f$ la fonction definie sur $RR$ par $f(x) = x - E(x)$ ou $E(x)$ designe la partie entiere de $x$.

+ Dans le plan rapporte a un repere orthonorme tracer la courbe representative de la restriction de $f$ a l'intervalle $[-3 ; 3]$.

+ Etudier la continuite de $f$ sur $[-3 ; 3]$.

#v(1em)

=== Exercice 4

Justifier que $f$ est continue sur $RR$ dans chacun des cas suivants :

+ $f(x) = -x^3 + x^2 - x + 4$
+ $f(x) = frac(x + 3, 2x^2 + 5)$
+ $f(x) = sqrt(x^2 + 3x + 5 + x^3 + 1)$
+ $f(x) = |x^2 - 3x + 2|$
+ $f(x) = |x + 3| - |5 - x|$
+ $f(x) = frac(|x + 5|, sqrt(x^2 + 1))$

// Source: XY Plus T1 p.19

#v(1em)

=== Exercice 5

La figure ci-contre est la representation graphique $C_f$ dans un repere orthonorme de la fonction $f$ definie sur $RR$ par : $f(x) = x^3 - 3x^2 + 1$

#figure(
  cetz.canvas({
    import cetz.draw: *
    // Grille et axes
    // Axes
    line((-1.5, 0), (4.5, 0), mark: (end: ">"))
    line((0, -3.5), (0, 3.5), mark: (end: ">"))
    content((0.3, -0.3), $O$)
    // Graduations
    for i in range(-1, 5) {
      line((i, -0.1), (i, 0.1))
    }
    for j in range(-3, 4) {
      line((-0.1, j), (0.1, j))
    }
    content((1, -0.4), $1$)
    content((2, -0.4), $2$)
    content((3, -0.4), $3$)
    content((4, -0.4), $4$)
    content((-1, -0.4), $-1$)
    content((-0.4, 1), $1$)
    content((-0.4, 2), $2$)
    content((-0.4, -1), $-1$)
    content((-0.4, -2), $-2$)
    content((-0.4, -3), $-3$)
    // Courbe f(x) = x^3 - 3x^2 + 1
    // Points cles: f(-1) = -3, f(0) = 1, f(1) = -1, f(2) = -3, f(3) = 1
    bezier((-0.8, -2.3), (0, 1), (-0.3, 1))
    bezier((0, 1), (1, -1), (0.5, -0.5))
    bezier((1, -1), (2, -3), (1.5, -3))
    bezier((2, -3), (3, 1), (2.5, -1))
    bezier((3, 1), (4, 9), (3.5, 3))
  }),
  caption: [Courbe de $f(x) = x^3 - 3x^2 + 1$]
)

+ En utilisant le graphique :

  a) Determiner les images des intervalles $[-1, 0]$, $[-1, 2]$ et $[0, 1]$ par $f$.

  b) Justifier que :
    - L'equation $f(x) = 4$ admet une unique solution dans $RR$.
    - L'equation $f(x) = -1$ admet exactement deux solutions dans $RR$.
    - L'equation $f(x) = 0$ admet exactement trois solutions dans $RR$.

+ a) Montrer que l'equation $f(x) = 0$ admet dans $]0, 1[$ une solution $alpha$.

  b) Donner un encadrement de $alpha$ a d'amplitude $10^(-1)$.

#v(1em)

=== Exercice 6

Soit $f$ la fonction definie sur $RR$ par
$ f(x) = cases(
  -x + 2 & "si" x lt.eq -1,
  x^2 - 2x & "si" -1 < x < 2,
  sqrt(x + 2) & "si" x gt.eq 2
) $

+ Montrer que $f$ est continue sur chacun des intervalles : $]-infinity, -1]$, $]-1, 2[$ et $[2, +infinity[$.

+ a) Tracer $C_f$ la courbe de $f$ dans un repere orthonorme $(O, arrow(i), arrow(j))$.

  b) Justifier graphiquement que $f$ n'est pas continue sur $RR$.

  c) Determiner graphiquement les images par $f$ des intervalles $[-4, -2]$ et $]-1, 2[$.

#v(1em)

=== Exercice 7

Soit $f$ la fonction definie par
$ f(x) = cases(
  2|x + 2| - x + 2 & "si" x in ]-infinity, -1[,
  (2x - 1) E(x) + x & "si" x in [-1, 2[
) $

+ Montrer que $f$ est une fonction affine par intervalles.

+ Tracer $(C)$ la courbe de $f$ dans un repere orthonorme.

+ Etudier graphiquement la continuite de $f$ en $-2$, $-1$, $0$ et $1$.

// ---------------------------------------------------------------------------
// CORRIGES
// ---------------------------------------------------------------------------

// Source: XY Plus T1 p.20

#pagebreak()

#align(center, text(size: 18pt, weight: "bold")[CORRIGES])

#v(1em)

=== Exercice 1 -- Corrige

+ $f(x) = frac(3, 2) x^2 - x + 1$

  $f$, etant une fonction polynome, d'ou $f$ est continue en $a = -sqrt(2)$.

+ $f(x) = frac(x + 2, x - 4)$, #h(1em) $D_f = RR without {4}$

  $f$, etant une fonction rationnelle, $0{,}7 in D_f = RR without {4}$ donc $f$ est continue en $0{,}7$.

+ $f(x) = lr(|frac(x - 3, x^2 - 1)|)$, #h(1em) $D_f = RR without {-1, 1}$.

  On pose $g : x mapsto frac(x - 3, x^2 - 1)$.

  La fonction $g$ est rationnelle definie sur $RR without {-1, 1}$ donc $g$ est continue en $3$

  d'ou $f = |g|$ est continue en $3$.

+ $f(x) = |x|^2 - 4|x| - frac(2, x)$ ; #h(1em) $D_f = RR^*$

  $f_1 : x mapsto -4|x|$ est continue sur $RR$, $f_2 : x mapsto |x|^2$ est continue sur $RR$ et $f_3 : x mapsto frac(-2, x)$ est continue sur $RR^*$.

  D'ou $f = f_1 + f_2 + f_3$ est continue sur $RR^*$ d'ou $f$ est continue en $15$.

+ $f(x) = frac(x, 2x - |x + 1|)$

  $f_1 : x mapsto x$ est continue sur $RR$ donc continue en $-1$.

  car $x mapsto -|x + 1|$ est continue sur $RR$.

  $f_2 : x mapsto 2x - |x + 1|$ est continue sur $RR$. Donc $f_2$ est continue en $-1$.

  De plus $f_2(-1) = -2 eq.not 0$ d'ou $f = frac(f_1, f_2)$ est continue en $-1$.

+ $f(x) = sqrt(4x^2 - 4x - 3)$

  $u : x mapsto 4x^2 - 4x - 3$ est une fonction polynome donc continue en $2$ et $u(2) gt.eq 0$ d'ou $f$ est continue en $2$.

+ $f(x) = sqrt(frac(x^2 - 2x + 1, x + 1))$, #h(1em) on pose $u(x) = frac(x^2 - 2x + 1, x + 1) = frac((x - 1)^2, x + 1)$

  La fonction $u$ est rationnelle definie sur $RR without {-1}$ donc continue en $3$ et $u(3) gt.eq 0$ d'ou $f$ est continue en $3$.

// Source: XY Plus T1 p.21

#v(1em)

=== Exercice 2 -- Corrige

+ Tracage de $f$ :

#figure(
  cetz.canvas({
    import cetz.draw: *
    // Axes
    line((-3, 0), (6, 0), mark: (end: ">"))
    line((0, -5), (0, 3), mark: (end: ">"))
    content((0.3, -0.3), $O$)
    // Graduations
    line((1, -0.1), (1, 0.1))
    line((3, -0.1), (3, 0.1))
    content((1, -0.4), $1$)
    content((3, -0.4), $3$)
    content((-0.3, 1), $1$)
    // Branche 1 : y = x - 1 pour x <= 0 (demi-droite)
    // A(0, -1) et B(-2, -3)
    line((-2.5, -3.5), (0, -1))
    circle((0, -1), radius: 0.06, fill: black)
    content((0.3, -1.2), $A$)
    content((-2.2, -3.5), $B$)
    // Branche 2 : y = 2x - 4 pour 0 < x < 3 (segment ouvert)
    // C(0, -4) et D(3, 2)
    circle((0, -4), radius: 0.06, fill: white, stroke: black)
    line((0, -4), (3, 2))
    circle((3, 2), radius: 0.06, fill: white, stroke: black)
    content((0.3, -4.2), $C$)
    content((3.3, 2.2), $D$)
    // Branche 3 : y = sqrt(x+1) pour x >= 3
    // Courbe passant par (3, 2)
    circle((3, 2), radius: 0.06, fill: black)
    bezier((3, 2), (5, 2.45), (4, 2.3))
    content((4.5, 2.7), $cal(C)_f$)
    content((4, 2.7), $(C_1)$)
  }),
  caption: [Courbe representative de $f$]
)

La restriction de $f$ a l'intervalle $]-infinity, 0]$ est representee par une demi droite $[A B)$ ou $A(0, -1)$ et $B(-2, -3)$.

La restriction de $f$ a l'intervalle $]0, 3[$ est representee par un segment $[C D]$ prive des points extremites $C(0, -4)$ et $D(3, 2)$.

La restriction de $f$ a l'intervalle $[3, +infinity[$ est representee par $(C_1)$.

2) a) La fonction $x mapsto x - 1$ est un polynome donc continue sur $RR$ en particulier sur $]-infinity, 0]$ d'ou $f$ est continue sur $]-infinity, 0]$.

   b) La fonction $x mapsto 2x - 4$ est un polynome donc continue sur $RR$ en particulier sur $]0, 3[$ d'ou $f$ est continue sur $]0, 3[$.

   c) La fonction $x mapsto sqrt(x - 1)$ est continue sur $[1, +infinity[$ et $[3, +infinity[ subset [1, +infinity[$ donc $f$ est continue sur $[3, +infinity[$.

3) La representation graphique de $f$ sur $RR$ met en evidence un saut du trace a droite du point $A(0, f(0))$, la fonction est discontinue en $0$.

   Donc $f$ n'est pas continue sur $RR$.

// Source: XY Plus T1 p.21-22

#v(1em)

=== Exercice 3 -- Corrige

+ Pour tout $x in [n, n + 1[$, on a $f(x) = x - n$, pour tout $n in ZZ$, on a $f(x) = x - n$.

  Si $x in [-3 ; -2[$, on a $E(x) = -3$ et $f(x) = x + 3$.

  Si $x in [-2 ; -1[$, on a $E(x) = -2$ et $f(x) = x + 2$.

  Si $x in [-1 ; 0[$, on a $E(x) = -1$ et $f(x) = x + 1$.

  Si $x in [0 ; 1[$, on a $E(x) = 0$ et $f(x) = x$.

  Si $x in [1 ; 2[$, on a $E(x) = 1$ et $f(x) = x - 1$.

  Si $x in [2 ; 3[$, on a $E(x) = 2$ et $f(x) = x - 2$.

  Si $x = 3$ on a $E(x) = 3$ et $f(x) = 0$.

  #block(
    fill: rgb("#fff7f0"),
    inset: 10pt,
    radius: 4pt,
  )[
    *Rappel*

    Pour tout reel $x$, il existe un seul entier $n$ tel que $n lt.eq x < n + 1$ et $E(x) = n$.
  ]

// Source: XY Plus T1 p.22

#figure(
  cetz.canvas({
    import cetz.draw: *
    // Axes
    line((-3.5, 0), (3.5, 0), mark: (end: ">"))
    line((0, -0.5), (0, 1.5), mark: (end: ">"))
    content((0.2, -0.3), $O$)
    // Graduations
    for i in range(-3, 4) {
      line((i, -0.1), (i, 0.1))
      if i != 0 { content((i, -0.3), str(i)) }
    }
    content((-0.3, 1), $1$)
    // Segments de la fonction partie fractionnaire
    // [-3, -2[ : y = x + 3
    line((-3, 0), (-2, 1))
    circle((-3, 0), radius: 0.06, fill: black)
    circle((-2, 1), radius: 0.06, fill: white, stroke: black)
    // [-2, -1[ : y = x + 2
    line((-2, 0), (-1, 1))
    circle((-2, 0), radius: 0.06, fill: black)
    circle((-1, 1), radius: 0.06, fill: white, stroke: black)
    // [-1, 0[ : y = x + 1
    line((-1, 0), (0, 1))
    circle((-1, 0), radius: 0.06, fill: black)
    circle((0, 1), radius: 0.06, fill: white, stroke: black)
    // [0, 1[ : y = x
    line((0, 0), (1, 1))
    circle((0, 0), radius: 0.06, fill: black)
    circle((1, 1), radius: 0.06, fill: white, stroke: black)
    // [1, 2[ : y = x - 1
    line((1, 0), (2, 1))
    circle((1, 0), radius: 0.06, fill: black)
    circle((2, 1), radius: 0.06, fill: white, stroke: black)
    // [2, 3[ : y = x - 2
    line((2, 0), (3, 1))
    circle((2, 0), radius: 0.06, fill: black)
    circle((3, 1), radius: 0.06, fill: white, stroke: black)
    // x = 3
    circle((3, 0), radius: 0.06, fill: black)
  }),
  caption: [Courbe de $f(x) = x - E(x)$ (partie fractionnaire) sur $[-3, 3]$]
)

2) La courbe de $f$ presente une rupture aux points d'abscisses entiers.

   $f$ est continue sur chacun des intervalles $]n, n + 1[$ ou $n in {-2, -1, 0, 1, 2}$.

   $f$ est continue a droite pour les valeurs entieres de $x$.

#v(1em)

=== Exercice 4 -- Corrige

// Source: XY Plus T1 p.22

+ $f(x) = -x^3 + x^2 - x + 4$

  $f$ est une fonction polynome donc continue sur $RR$.

+ $f(x) = frac(x + 3, 2x^2 + 5)$

  $f$ est rationnelle et definie sur $RR$ donc $f$ est continue sur $RR$.

+ $f(x) = sqrt(x^2 + 3x + 5 + x^3 + 1)$

  - La fonction $f_1 : x mapsto x^3 + 1$ est une fonction polynome donc continue sur $RR$.

  - La fonction $x mapsto x^2 + 3x + 5$ est polynome donc continue sur $RR$.

  De plus, pour tout reel $x$, $x^2 + 3x + 5 > 0$ ($Delta < 0$ et $a > 0$) donc la fonction $f_2 : x mapsto sqrt(x^2 + 3x + 5)$ est continue sur $RR$.

  $f = f_1 + f_2$ somme de deux fonctions continues sur $RR$ donc $f$ est continue sur $RR$.

+ $f(x) = |x^2 - 3x + 2|$

  La fonction $g : x mapsto x^2 - 3x + 2$ est polynome donc continue sur $RR$ donc la fonction $x mapsto |x^2 - 3x + 2|$ est continue sur $RR$.

  $f$ est continue sur $RR$.

+ $f(x) = |x + 3| - |5 - x|$

  La fonction $x mapsto x + 3$ est affine donc continue sur $RR$ d'ou la fonction $f_1 : x mapsto |x + 3|$ est continue sur $RR$.

  La fonction $x mapsto 5 - x$ est affine donc continue sur $RR$ d'ou la fonction $f_1 : x mapsto |5 - x|$ est continue sur $RR$.

  $f = f_1 + f_2$ est continue sur $RR$.

// Source: XY Plus T1 p.23

6) $f(x) = frac(|x + 5|, sqrt(x^2 + 1))$

  - La fonction $x mapsto x + 5$ est affine donc continue sur $RR$ d'ou la fonction $f_1 : x mapsto |x + 5|$ est continue sur $RR$.

  - La fonction $x mapsto x^2 + 1$ est polynome donc continue sur $RR$.

  De plus, pour tout reel $x$, $x^2 + 1 > 0$ donc la fonction $f_2 : x mapsto sqrt(x^2 + 1)$ est continue sur $RR$.

  De plus, pour tout reel $x$, $f_2(x) eq.not 0$ donc $f = frac(f_1, f_2)$ est continue sur $RR$.

#v(1em)

=== Exercice 5 -- Corrige

// Source: XY Plus T1 p.23

1) a) $f([-1, 0]) = [-3, 1]$, $f([-1, 2]) = [-3, 1]$ et $f([0, 1]) = [-1, 1]$.

   b) $arrow$ La droite d'equation $y = 4$ coupe $C_f$ en un unique point donc l'equation $f(x) = 4$ admet une unique solution dans $RR$.

   $arrow$ La droite d'equation $y = -1$ coupe $C_f$ en deux points donc l'equation $f(x) = -1$ admet deux solutions dans $RR$.

   $arrow$ La droite d'equation $y = 0$ (l'axe des abscisses) coupe $C_f$ en 3 points donc l'equation $f(x) = 0$ admet 3 solutions dans $RR$.

2) a) $f$ est une fonction polynome donc continue sur $RR$, $f(0) times f(1) < 0$

   Donc l'equation $f(x) = 0$ admet au moins une solution $alpha$ dans $]0, 1[$.

   b) On utilise la methode dichotomique qui consiste a decouper l'intervalle $[0, 1]$ en dix intervalles de meme amplitude $10^(-1)$.

   #align(center,
     table(
       columns: 12,
       align: center,
       [$x$], [$0$], [$0{,}1$], [$0{,}2$], [$0{,}3$], [$0{,}4$], [$0{,}5$], [$0{,}6$], [$0{,}7$], [$0{,}8$], [$0{,}9$], [$1$],
       [$f(x)$], [$1$], [$0{,}97$], [$0{,}88$], [$0{,}75$], [$0{,}58$], [$0{,}37$], [$0{,}13$], [$-0{,}12$], [$-0{,}4$], [$-0{,}7$], [$-1$],
     )
   )

   On a $f(0{,}6) times f(0{,}7) < 0$ d'ou $0{,}6 < alpha < 0{,}7$.

#v(1em)

=== Exercice 6 -- Corrige

// Source: XY Plus T1 p.23-24

+ La fonction $x mapsto -x + 2$ est une fonction affine donc continue sur $RR$ en particulier sur $]-infinity, -1]$, d'ou $f$ est continue sur $]-infinity, -1]$.

  La fonction $x mapsto x^2 - 2x$ est une fonction polynome donc continue sur $RR$ en particulier sur $]-1, 2[$ d'ou $f$ est continue sur $]-1, 2[$.

  La fonction $x mapsto x + 2$ est affine donc continue sur $RR$ en particulier sur $[2, +infinity[$ et pour tout $x in [2, +infinity[$ : $x + 2 gt.eq 0$

  d'ou $f$ est continue sur $[2, +infinity[$.

// Source: XY Plus T1 p.24

2) a) Tracage de $f$

#figure(
  cetz.canvas({
    import cetz.draw: *
    // Axes
    line((-5.5, 0), (6, 0), mark: (end: ">"))
    line((0, -1.5), (0, 6), mark: (end: ">"))
    content((0.3, -0.3), $O$)
    // Graduations
    for i in range(-5, 6) {
      line((i, -0.1), (i, 0.1))
    }
    for j in range(-1, 6) {
      line((-0.1, j), (0.1, j))
    }
    // Branche 1: y = -x + 2 pour x <= -1 : droite decroissante
    // f(-1) = 3, f(-4) = 6
    line((-5, 7), (-1, 3))
    circle((-1, 3), radius: 0.06, fill: black)
    // Branche 2: y = x^2 - 2x pour -1 < x < 2 : parabole
    // f(-1) = 3, f(0) = 0, f(1) = -1, f(2) = 0
    circle((-1, 3), radius: 0.06, fill: white, stroke: black)
    bezier((-1, 3), (0, 0), (-0.5, 0.5))
    bezier((0, 0), (1, -1), (0.5, -1))
    bezier((1, -1), (2, 0), (1.5, -1))
    circle((2, 0), radius: 0.06, fill: white, stroke: black)
    // Branche 3: y = sqrt(x + 2) pour x >= 2
    // f(2) = 2, f(4) ~= 2.45
    circle((2, 2), radius: 0.06, fill: black)
    bezier((2, 2), (4, 2.45), (3, 2.3))
    bezier((4, 2.45), (5.5, 2.74), (5, 2.6))
    content((4.5, 3), $cal(C)_f$)
  }),
  caption: [Courbe de $f$ (exercice 6)]
)

   b) $C_f$ presente une rupture au niveau du point d'abscisse $2$ d'ou $f$ n'est pas continue en $2$ par suite $f$ n'est pas continue sur $RR$.

   c) $f([-4, -2]) = [4, 6]$ et $f(]-1, 2[) = [-1, 3[$

#v(1em)

=== Exercice 7 -- Corrige

// Source: XY Plus T1 p.24-25

+ Pour $x in ]-infinity, -1[$ :

  #align(center,
    table(
      columns: 4,
      align: center,
      [$x$], [$-infinity$], [$-2$], [$-1$],
      [$x + 2$], [], [$0$], [],
      [$|x + 2|$], [$-x - 2$], [$0$], [$x + 2$],
    )
  )

  Donc si $x in ]-infinity, -2]$ alors $f(x) = 2(-x - 2) - x + 2 = -3x - 2$

  si $x in ]-2, -1[$ alors $f(x) = 2(x + 2) - x + 2 = x + 6$

  Pour $x in [-1, 2[$ :

  si $x in [-1, 0[$ #h(1em) $E(x) = -1$ alors $f(x) = -x + 1$

  si $x in [0, 1[$ #h(1em) $E(x) = 0$ alors $f(x) = x$

  si $x in [1, 2[$ #h(1em) $E(x) = 1$ alors $f(x) = 3x - 1$

  donc
  $ f(x) = cases(
    -3x - 2 & "si" x in ]-infinity, -2],
    x + 6 & "si" x in ]-2, -1[,
    -x + 1 & "si" x in [-1, 0[,
    x & "si" x in [0, 1[,
    3x - 1 & "si" x in [1, 2[
  ) $

  Donc $f$ est une fonction affine par intervalles.

// Source: XY Plus T1 p.25

2) Tracage de $f$

#figure(
  cetz.canvas({
    import cetz.draw: *
    // Axes
    line((-5.5, 0), (3, 0), mark: (end: ">"))
    line((0, -1.5), (0, 6), mark: (end: ">"))
    content((0.3, -0.3), $O$)
    // Graduations
    for i in range(-5, 3) {
      line((i, -0.1), (i, 0.1))
    }
    for j in range(-1, 6) {
      line((-0.1, j), (0.1, j))
    }
    content((-1, -0.4), $-1$)
    content((-2, -0.4), $-2$)
    content((-3, -0.4), $-3$)
    content((1, -0.4), $1$)
    content((2, -0.4), $2$)
    content((-0.3, 1), $1$)
    content((-0.3, 2), $2$)
    content((-0.3, 3), $3$)
    content((-0.3, 4), $4$)
    content((-0.3, 5), $5$)
    // Branche 1: y = -3x - 2 pour x <= -2
    // f(-2) = 4, f(-3) = 7, f(-5) = 13
    line((-5, 13), (-2, 4))
    circle((-2, 4), radius: 0.06, fill: black)
    // Branche 2: y = x + 6 pour -2 < x < -1
    // f(-2) = 4, f(-1) = 5
    circle((-2, 4), radius: 0.06, fill: white, stroke: black)
    line((-2, 4), (-1, 5))
    circle((-1, 5), radius: 0.06, fill: white, stroke: black)
    // Branche 3: y = -x + 1 pour -1 <= x < 0
    // f(-1) = 2, f(0) = 1
    circle((-1, 2), radius: 0.06, fill: black)
    line((-1, 2), (0, 1))
    circle((0, 1), radius: 0.06, fill: white, stroke: black)
    // Branche 4: y = x pour 0 <= x < 1
    // f(0) = 0, f(1) = 1
    circle((0, 0), radius: 0.06, fill: black)
    line((0, 0), (1, 1))
    circle((1, 1), radius: 0.06, fill: white, stroke: black)
    // Branche 5: y = 3x - 1 pour 1 <= x < 2
    // f(1) = 2, f(2) = 5
    circle((1, 2), radius: 0.06, fill: black)
    line((1, 2), (2, 5))
    circle((2, 5), radius: 0.06, fill: white, stroke: black)
    content((1.5, 4), $cal(C)$)
  }),
  caption: [Courbe de $f$ (exercice 7)]
)

3) La courbe de $f$ :
  - n'a pas de rupture au point d'abscisse $-2$ donc $f$ est continue en $-2$
  - presente des ruptures aux points d'abscisses $-1$, $0$ et $1$ donc $f$ n'est pas continue en $-1$, $0$ et $1$
