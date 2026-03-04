// =============================================================================
// Transcription fidele : XY Plus 3eme Math Tome 1 — Chapitre 5
// Nombre Derive
// Source : CAEU Med Ali, pages 59 a 73
// =============================================================================

#import "@preview/cetz:0.3.4"

// --- Blocs colores ---
#let definition-block(body) = block(
  fill: rgb("#f0f7ff"),
  inset: 12pt,
  radius: 4pt,
  width: 100%,
  body,
)

#let theoreme-block(body) = block(
  fill: rgb("#e8f5e9"),
  inset: 12pt,
  radius: 4pt,
  width: 100%,
  body,
)

#let remarque-block(body) = block(
  fill: rgb("#fff7f0"),
  inset: 12pt,
  radius: 4pt,
  width: 100%,
  body,
)

// =============================================================================
// RESUME DE COURS
// =============================================================================

#align(center, text(size: 18pt, weight: "bold")[Chapitre 5])
#align(center, text(size: 16pt, weight: "bold")[Nombre Derive])

#v(1em)

// Source: XY Plus T1 p.59

= 1. Derivabilite d'une fonction en un point

#definition-block[
  *Definition*

  Soit $f$ une fonction definie sur un intervalle ouvert $I$ et $x_0$ un reel de $I$.

  On dit que $f$ est derivable en $x_0$, si et seulement si, *il existe un nombre reel $ell$*
  tel que :
  $ lim_(x arrow.r x_0) frac(f(x) - f(x_0), x - x_0) = ell . $

  Le reel $ell$ est alors appele le nombre derive de $f$ en $x_0$ et il est note $f'(x_0)$.
]

#v(0.5em)

*Autre ecriture :* En posant $x - x_0 = h$

$f$ est derivable en $x_0$ si et seulement si $lim_(h arrow.r 0) frac(f(x_0 + h) - f(x_0), h) = ell quad (ell in RR)$.

// Source: XY Plus T1 p.59

= 2. Tangente a une courbe

#theoreme-block[
  *Theoreme*

  Le plan est muni d'un repere $(O, arrow(i), arrow(j))$. Soit $f$ une fonction
  definie sur un intervalle ouvert $I$ et $x_0$ un reel de $I$.

  $f$ est derivable en $x_0$ si et seulement si la courbe $cal(C)$ de $f$ admet au point
  $A(x_0, f(x_0))$ une tangente $Delta$ de coefficient directeur $f'(x_0)$.

  Cette tangente est d'equation $y = f'(x_0)(x - x_0) + f(x_0)$.

  Un vecteur directeur de cette tangente $arrow(u) vec(1, f'(x_0))$.
]

#remarque-block[
  *Remarque :* Si $f'(x_0) = 0$ alors la tangente a $cal(C)$ au point d'abscisse $x_0$ est parallele a $(O, arrow(i))$.
]

// Source: XY Plus T1 p.59

*Construction de la tangente :*

#figure(
  cetz.canvas({
    import cetz.draw: *

    // Cas f'(x_0) < 0
    set-style(stroke: 0.8pt)
    rect((-6, -3), (-2, 1), stroke: 0.5pt + gray)
    line((-6, -2.5), (-2, -2.5), stroke: 0.5pt, mark: (end: ">"))
    line((-5.5, -3), (-5.5, 1), stroke: 0.5pt, mark: (end: ">"))
    content((-5.2, -2.8), $O$, anchor: "north-west")
    content((-5.2, -2.2), $arrow(i)$, anchor: "north-west")

    // Courbe C
    bezier((-5, 0.5), (-3.5, -1.5), (-4.5, 0.8), (-3.8, -1.2), stroke: 1pt)
    content((-5, 0.8), $cal(C)$, anchor: "south")

    // Point M et tangente avec pente negative
    circle((-4, -0.2), radius: 0.05, fill: black)
    content((-3.8, -0.0), $M$, anchor: "south-west")
    line((-5, 0.8), (-2.5, -1.7), stroke: 0.8pt)
    content((-2.8, -1.0), $T$, anchor: "west")

    // Vecteur u
    line((-4, -0.2), (-3.5, -0.7), stroke: 0.8pt, mark: (end: ">"))
    content((-3.3, -0.5), $arrow(u)$, anchor: "west")

    content((-4, -3.3), $f'(x_0) < 0$, anchor: "north")
    content((-4, -2.8), $x_0$, anchor: "north")

    // Cas f'(x_0) > 0
    rect((0, -3), (4, 1), stroke: 0.5pt + gray)
    line((0, -2.5), (4, -2.5), stroke: 0.5pt, mark: (end: ">"))
    line((0.5, -3), (0.5, 1), stroke: 0.5pt, mark: (end: ">"))
    content((0.8, -2.8), $O$, anchor: "north-west")
    content((0.8, -2.2), $arrow(i)$, anchor: "north-west")

    // Courbe
    bezier((0.5, -2), (3.5, 0.5), (1.5, -2), (2.5, 0.8), stroke: 1pt)
    content((3.5, 0.8), $cal(C)$, anchor: "south")

    // Tangente avec pente positive
    line((0.5, -1.8), (3.5, 1), stroke: 0.8pt)
    content((3.5, 1.2), $T$, anchor: "south")

    circle((2, -0.5), radius: 0.05, fill: black)
    content((2.2, -0.3), $M$, anchor: "south-west")

    line((2, -0.5), (2.5, 0), stroke: 0.8pt, mark: (end: ">"))
    content((2.7, 0.1), $arrow(u)$, anchor: "west")

    content((2, -3.3), $f'(x_0) > 0$, anchor: "north")
    content((2, -2.8), $x_0$, anchor: "north")

    // Cas f'(x_0) = 0
    rect((6, -3), (10, 1), stroke: 0.5pt + gray)
    line((6, -2.5), (10, -2.5), stroke: 0.5pt, mark: (end: ">"))
    line((6.5, -3), (6.5, 1), stroke: 0.5pt, mark: (end: ">"))
    content((6.8, -2.8), $O$, anchor: "north-west")
    content((6.8, -2.2), $arrow(i)$, anchor: "north-west")

    // Courbe avec tangente horizontale
    bezier((6.5, -1.5), (9.5, -1.5), (7.5, 0.5), (8.5, 0.5), stroke: 1pt)
    content((9.5, -1.2), $cal(C)$, anchor: "south")

    // Tangente horizontale
    line((7, 0.2), (9.5, 0.2), stroke: 0.8pt)
    content((9.5, 0.5), $T$, anchor: "south")

    circle((8, 0.2), radius: 0.05, fill: black)
    content((8.2, 0.4), $M$, anchor: "south-west")

    content((8, -3.3), $f'(x_0) = 0$, anchor: "north")
    content((8, -2.8), $x_0$, anchor: "north")
  }),
  caption: [Construction de la tangente selon le signe de $f'(x_0)$],
)

// Source: XY Plus T1 p.59-60

*Tangente parallele a l'axe des ordonnees :*

Si $lim_(x arrow.r x_0) frac(f(x) - f(x_0), x - x_0) = infinity$ alors $f$ n'est pas derivable en $x_0$ et la tangente a $cal(C)$ au
point d'abscisse $x_0$ est parallele a $(O, arrow(j))$ a pour equation $x = x_0$.

#figure(
  cetz.canvas({
    import cetz.draw: *

    set-style(stroke: 0.8pt)
    rect((-3, -2), (3, 3), stroke: 0.5pt + gray)
    line((-3, -1), (3, -1), stroke: 0.5pt, mark: (end: ">"))
    line((-2, -2), (-2, 3), stroke: 0.5pt, mark: (end: ">"))
    content((-1.7, -1.3), $O$, anchor: "north-west")
    content((-1.5, -0.7), $arrow(i)$, anchor: "north-west")

    // Courbe avec tangente verticale
    bezier((-1, -1.5), (2, 2.5), (0.5, 1), (1, 2), stroke: 1pt)
    content((2, 2.8), $cal(C)$, anchor: "south")

    // Tangente verticale
    line((1, -1.5), (1, 3), stroke: 0.8pt + blue)

    circle((1, 1.5), radius: 0.05, fill: black)
    content((1.3, 1.7), $M$, anchor: "south-west")

    content((1, -1.8), $x_0$, anchor: "north")

    content((0, -2.5), $display(lim_(x arrow.r x_0) frac(f(x) - f(x_0), x - x_0))$ est infinie, anchor: "north")
  }),
  caption: [Tangente parallele a l'axe des ordonnees],
)

// Source: XY Plus T1 p.60

= 3. Nombre derive de fonctions usuelles

#theoreme-block[
  *Theoreme*

  #table(
    columns: 3,
    align: (center, center, center),
    table.header([*Fonction $f$*], [*$f$ est derivable en $a$ ou*], [*$f'(a)$*]),
    [$f : x arrow.r.bar beta$ (constante)], [$a in RR$], [$0$],
    [$f : x arrow.r.bar alpha x + beta$], [$a in RR$], [$alpha$],
    [$f : x arrow.r.bar (x - alpha)^2 + beta$], [$a in RR$], [$2(a - alpha)$],
    [$f : x arrow.r.bar frac(1, alpha x + beta)$], [$a in RR without brace.l -frac(beta, alpha) brace.r$], [$f'(a) = frac(-alpha, (alpha a + beta)^2)$],
    [$f : x arrow.r.bar sqrt(x + alpha)$], [$a in bracket.r -alpha, +infinity bracket.l$], [$f'(a) = frac(1, 2 sqrt(a + alpha))$],
    [$f : x arrow.r.bar frac(alpha x + beta, lambda x + gamma)$], [$a in RR without brace.l -frac(gamma, lambda) brace.r$], [$f'(a) = frac(alpha gamma - lambda beta, (lambda a + gamma)^2)$],
  )
]

// Source: XY Plus T1 p.60

= 4. Operations algebriques sur les fonctions derivables en a

- Soient $f$ et $g$ deux fonctions definies sur un intervalle ouvert $I$ et $a$ un reel
  de $I$. $alpha$ et $beta$ deux reels.

- Si $f$ et $g$ sont derivables en $a$ alors $f + g$, $f g$, $alpha f + beta g$ sont derivables en $a$
  et on a :

  $ (f + g)'(a) = f'(a) + g'(a) $
  $ (f g)'(a) = f'(a) g(a) + f(a) g'(a) $
  $ (alpha f + beta g)'(a) = alpha f'(a) + beta g'(a) $

- Soit $k$ un entier naturel strictement superieur a 1.
  Si la fonction $f$ est derivable en $a$ alors la fonction $f^k$ est derivable en $a$ et
  on a : $(f^k)'(a) = k f'(a) f^(k-1)(a)$

// Source: XY Plus T1 p.61

- Si $a$ est un reel et $f$ est une fonction polynome definie par :
  $f(x) = b_0 + b_1 x + b_2 x^2 + dots.c + b_k x^k$ alors $f$ est derivable en $a$ et on a
  $f'(a) = b_1 + 2 b_2 a + dots.c + k b_k a^(k-1)$.

- Soient $f$ et $g$ deux fonctions definies sur un intervalle ouvert $I$ et $a$ un reel
  de $I$. Si $f$ et $g$ sont deux fonctions derivables en $a$ et si $g$ ne s'annule pas en $a$
  alors les fonctions $frac(1, g)$ et $frac(f, g)$ sont derivables en $a$ et on a :

  $ (frac(1, g))'(a) = frac(-g'(a), (g(a))^2) $

  $ (frac(f, g))'(a) = frac(f'(a) g(a) - f(a) g'(a), (g(a))^2) $

- Si $f$ est derivable en $a$ et $f(a) > 0$ alors $sqrt(f)$ est derivable en $a$ $(sqrt(f))'(a) = frac(f'(a), 2 sqrt(f(a)))$

// Source: XY Plus T1 p.61

= 5. Nombre derive a droite -- Nombre derive a gauche

#definition-block[
  *Definition*

  - Soit $f$ une fonction definie sur un intervalle de la forme $bracket.r b ; a bracket.r$

    On dit que $f$ est derivable a gauche en $a$, si le rapport $frac(f(a + h) - f(a), h)$ admet
    une limite finie quand $h$ tend vers $0^-$.
    Cette limite est alors notee $f'_g (a)$ et est appelee le nombre derive de $f$ a
    gauche en $a$.

  - Soit $f$ une fonction definie sur un intervalle de la forme $bracket.l a, b bracket.l$.

    On dit que $f$ est derivable a droite en $a$, si le rapport $frac(f(a + h) - f(a), h)$ admet une
    limite finie quand $h$ tend vers $0^+$.
    Cette limite est alors notee $f'_d (a)$.
]

#theoreme-block[
  *Theoreme*

  Soit $f$ une fonction definie sur un intervalle ouvert $I$ et $a$ un reel de $I$.
  La fonction $f$ est derivable en $a$, si et seulement si, $f$ est derivable a droite et a
  gauche et $f'_g (a) = f'_d (a)$. On a $f'(a) = f'_g (a) = f'_d (a)$.
]

// Source: XY Plus T1 p.61-62

= 6. Demi tangentes a une courbe

Le plan est muni d'un repere $(O, arrow(i), arrow(j))$.
Soit $f$ une fonction definie sur un intervalle ouvert $I$ et $a$ un reel de $I$.

- $f$ est derivable a droite en $a$, si et seulement si, la courbe representative de $f$
  admet au point $A(a, f(a))$ une demi tangente determinee par :

  $ T^+ : cases(y = f'_d (a)(x - a) + f(a), x gt.eq a) $

  Un vecteur directeur de cette demi tangente est $arrow(u)_d vec(1, f'_d (a))$.

- $f$ est derivable a gauche en $a$, si et seulement si, la courbe representative de $f$
  admet au point $A(a, f(a))$ une demi tangente determinee par :

  $ T^- : cases(y = f'_g (a)(x - a) + f(a), x lt.eq a) $

  Un vecteur directeur de cette demi tangente est $arrow(u)_d vec(-1, -f'_g (a))$.

#remarque-block[
  *Remarque :*
  - Si $T^+$ et $T^-$ sont secantes alors $f$ n'est pas derivable en $a$.
  - Si $T^+$ et $T^-$ sont portees par la meme droite alors $f$ est derivable en $a$.
]

// Source: XY Plus T1 p.62

= 7. Approximation affine d'une fonction

#definition-block[
  *Definition*

  Soit $f$ une fonction definie sur un intervalle ouvert $I$ et $x_0$ un reel de $I$.
  Si $f$ est derivable en $x_0$, alors le reel $f(x_0) + f'(x_0) h$ est une approximation
  affine de $f(x_0 + h)$ et on ecrit $f(x_0 + h) approx f(x_0) + f'(x_0) h$, pour $h$ voisin de zero.
]

#figure(
  cetz.canvas({
    import cetz.draw: *

    set-style(stroke: 0.8pt)

    // Axes
    line((-1, 0), (5, 0), stroke: 0.5pt, mark: (end: ">"))
    line((0, -0.5), (0, 4), stroke: 0.5pt, mark: (end: ">"))

    // Courbe
    bezier((0.5, 0.5), (4.5, 3.5), (2, 1), (3.5, 3.8), stroke: 1pt)
    content((1, 1.5), [Tangente], anchor: "east")

    // Tangente au point c
    line((1.5, 0.8), (4.5, 3.2), stroke: 0.8pt + blue)

    // Points
    line((2.5, 0), (2.5, 1.8), stroke: 0.4pt + gray, dash: "dashed")
    line((3.5, 0), (3.5, 2.8), stroke: 0.4pt + gray, dash: "dashed")

    content((2.5, -0.3), $c$, anchor: "north")
    content((3.5, -0.3), $c + h$, anchor: "north")

    // Annotations
    line((2.5, 1.8), (3.5, 1.8), stroke: 0.4pt, mark: (end: ">"))
    content((3, 1.5), $h$, anchor: "north")

    line((3.5, 1.8), (3.5, 2.6), stroke: 0.4pt, mark: (end: ">"))
    content((3.8, 2.2), $h f'(c)$, anchor: "west")

    content((-0.3, 1.8), $f(c)$, anchor: "east")
    content((4.8, 3.2), $f(c+h)$, anchor: "west")
  }),
  caption: [Approximation affine : $f(c + h) approx f(c) + h f'(c)$],
)

// Source: XY Plus T1 p.62

= 8. Derivabilite et continuite

#theoreme-block[
  *Theoreme*

  Soit $f$ une fonction definie sur un intervalle ouvert $I$ et $x_0$ un reel de $I$.
  Si $f$ est derivable en $x_0$ alors $f$ est continue en $x_0$.
]

#remarque-block[
  *Remarque :* La reciproque n'est pas toujours vraie : c'est-a-dire si $f$ n'est pas
  derivable en $x_0$ alors elle peut etre continue en $x_0$ comme elle peut ne pas
  l'etre. Mais si $f$ n'est pas continue en $x_0$ alors elle n'est pas derivable en $x_0$.

  *$f$ est continue mais n'est pas derivable en $a$.*
]

#figure(
  cetz.canvas({
    import cetz.draw: *

    set-style(stroke: 0.8pt)

    // Axes
    line((-1, 0), (4, 0), stroke: 0.5pt, mark: (end: ">"))
    line((0, -0.5), (0, 3), stroke: 0.5pt, mark: (end: ">"))
    content((0.3, -0.3), $O$, anchor: "north-west")
    content((0.5, 0.2), $arrow(i)$, anchor: "south")

    // Point anguleux en a
    line((0.5, 2.5), (2, 0.5), stroke: 1pt)
    line((2, 0.5), (3.5, 2), stroke: 1pt)
    content((3.5, 2.3), $cal(C)$, anchor: "south")

    // Demi-tangentes
    line((0.5, 2.5), (2.5, 0), stroke: 0.5pt + blue, dash: "dashed")
    line((1.5, 0.5), (3.8, 2.5), stroke: 0.5pt + blue, dash: "dashed")

    // Point A
    circle((2, 0.5), radius: 0.05, fill: black)
    content((2.2, 0.2), $A$, anchor: "north-west")
    content((2, -0.3), $a$, anchor: "north")
  }),
  caption: [Point anguleux : $f$ est continue mais non derivable en $a$],
)

#pagebreak()

// =============================================================================
// EXERCICES (ENONCES)
// =============================================================================

#align(center, text(size: 18pt, weight: "bold")[EXERCICES])

#v(1em)

// Source: XY Plus T1 p.63

== Exercice 1

Etudier la derivabilite de chacune des fonctions suivantes au point
d'abscisse $x_0$ et donner l'equation de la tangente ou demi-tangente a $cal(C)$ en
ce point, $cal(C)$ est la courbe de $f$ dans un repere $(O, arrow(i), arrow(j))$

1) $f(x) = x^3 - x^2 + 2x + 1$ #h(2em) $x_0 = 1$

2) $f(x) = frac(x^2 + x - 2, x + 3)$ #h(2em) $x_0 = 0$

3) $f(x) = sqrt(x^2 - 2x)$ #h(2em) $x_0 = 3$ ; #h(1em) $x_0 = 2$

4) $f(x) = x^2 + 2|x|$ #h(2em) $x_0 = 0$

// Source: XY Plus T1 p.63

== Exercice 2

Soit $h$ un reel proche de zero. Montrer que :

a) $(1 + h)^2 approx 1 + 2h$ #h(3em) b) $(1 + h)^3 approx 1 + 3h$

c) $(1 + h)^n approx 1 + n h$ #h(1em) $(n gt.eq 2)$ #h(3em) d) $sqrt(1 + h) approx 1 + frac(1, 2) h$ #h(3em) e) $frac(1, 1 + h) approx 1 - h$

// Source: XY Plus T1 p.63

== Exercice 3

Soit $f : x arrow.r.bar x^2$

1) Montrer que $f$ est derivable en tout $x_0 in RR$ et calculer $f'(x_0)$.

2) Soient $A$, $B$ et $M_0$ trois points de la courbe $cal(C)$ de $f$ dans un repere $(O, arrow(i), arrow(j))$
   d'abscisses respectives $a$, $b$ et $x_0$ ($A$ et $B$ distincts).

   a) Trouver une relation entre $a$, $b$ et $x_0$ pour que la tangente a $cal(C)$ au point
      $M_0$ soit parallele a la droite $(A B)$.

   b) En deduire une construction geometrique de la tangente a $cal(C)$.

// Source: XY Plus T1 p.63

== Exercice 4

Soit $f : x arrow.r.bar a x + frac(b, x + 1)$, $cal(C)_f$ la courbe de $f$ dans un repere orthonorme
$(O, arrow(i), arrow(j))$.

1) Soit $x_0 in RR without brace.l -1 brace.r$, montrer que $f$ est derivable en $x_0$ et que $f'(x_0) = a - frac(b, (x_0 + 1)^2)$

2) Determiner $a$ et $b$ pour que la tangente a $cal(C)_f$ au point d'abscisse $x_0 = 1$
   soit la droite $D$ d'equation $3x - 4y + 3 = 0$

3) On pose $a = b = 1$ ($f(x) = x + frac(1, x + 1)$ et $f'(x) = 1 - frac(1, (x + 1)^2)$)

   Soient $M$ et $N$ deux points de $cal(C)_f$ d'abscisses respectives $alpha$ et $-2 - alpha$.
   Montrer que les tangentes a $cal(C)_f$ aux points $M$ et $N$ sont paralleles.

// Source: XY Plus T1 p.63-64

== Exercice 5

Soit $f : x arrow.r.bar cases(x^2 + x - 6 quad & "si" x lt.eq 2, sqrt(x^2 - 4) + x - 2 quad & "si" x > 2)$

$cal(C)$ designe la courbe de $f$ dans un repere $(O, arrow(i), arrow(j))$.

1) Montrer que $f$ est continue en 2.

2) Etudier la derivabilite de $f$ en 2.

3) Determiner le point $M_0$ d'abscisse $x_0 < 2$ en lequel la tangente a $cal(C)$ est
   horizontale.

4) a) Soit $x_0 > 2$, Montrer que $f$ est derivable en $x_0$ et calculer $f'(x_0)$.

   b) Determiner le point $N_0$ d'abscisse $x_0$ ($x_0 > 2$) de $cal(C)$ ou la tangente est
      parallele a la droite d'equation $y = (frac(2, sqrt(3)) + 1) x - 2$

// Source: XY Plus T1 p.64

== Exercice 6

Soit $f : x arrow.r.bar a x^2 + b x + c$, $cal(C)_f$ la courbe de $f$ dans un repere orthonorme
$(O, arrow(i), arrow(j))$.

1) Montrer que pour tout $x_0$ reel, $f$ est derivable en $x_0$ et calculer $f'(x_0)$.

2) Determiner les reels $a$, $b$ et $c$ pour que $cal(C)_f$ passe par $A(0, 1)$ et $B(1, 4)$ et
   admette en $A$ une tangente de coefficient directeur 1.

3) On pose $f(x) = 2x^2 + x + 1$.
   Determiner le point de $cal(C)_f$ ou la tangente $Delta$ est perpendiculaire a la droite
   d'equation $x - 7y + 7 = 0$ et donner une equation de $Delta$.

// Source: XY Plus T1 p.64

== Exercice 7

La courbe $(C)$ ci-contre est celle d'une fonction
definie sur $RR$.

- L'axe $(O, arrow(i))$ est une asymptote a $(C)$ au voisinage de $(-infinity)$.
- L'axe $(O, arrow(j))$ est une asymptote a $(C)$.
- $D : y = 2x + 2$ est une asymptote a $(C)$ au voisinage de $(+infinity)$.
- La droite $T$ est tangente a $(C)$ au point d'abscisse $(-1)$.

Par une lecture graphique :

1) Determiner : $lim_(x arrow.r -infinity) f(x)$ et $lim_(x arrow.r -infinity) frac(1, f(x))$.

2) Determiner : $lim_(x arrow.r +infinity) f(x)$ et $lim_(x arrow.r +infinity) f(x) - 2x - 2$

3) Determiner : $f'(-2)$, $f'_d (-4)$ et $lim_(x arrow.r -4^-) frac(f(x) + 2, x + 4)$.

4) a) Donner une approximation affine de $f(-0,99999)$.

   b) Soit $g$ la fonction definie sur $bracket.r -4, 0 bracket.l$ par : $g(x) = x^2 f(x)$.
      Calculer $g'(-1)$.

// Source: XY Plus T1 p.65

== Exercice 8

Le plan est muni d'un repere orthonorme $(O, arrow(i), arrow(j))$. On designe par
$(zeta)$ et $(zeta ')$ les courbes representatives respectives des fonctions $f$ et $g$
definies

par : $f(x) = x + 5 + frac(4, x - 1)$ et $g(x) = sqrt(x^2 - 4) + x + 3$

1) a) Montrer que $f$ est derivable en tout element $a$ de $RR without brace.l 1 brace.r$ et calculer $f'(a)$.

   b) Determiner les points de $(zeta)$ ou la tangente est parallele a la droite des
      abscisses.

   c) Determiner les points de $(zeta)$ ou la tangente est perpendiculaire a la droite
      $Delta$ d'equation $4x + 3y - 3 = 0$

2) a) Montrer que la droite $Delta '$ d'equation $y = 2x + 3$ est une asymptote oblique a
   $(zeta ')$ au voisinage de $+infinity$

   b) Etudier la position de $(zeta ')$ par rapport a $Delta '$.

3) Soit $h$ la fonction definie sur $RR$

   par : $cases(h(x) = f(x) quad & "si" x in bracket.r -infinity\, 0 bracket.l, h(x) = x^3 - 2x + 1 quad & "si" x in bracket.l 0\, 2 bracket.l quad (m in RR), h(x) = sqrt(x^2 - 4) + x + m quad & "si" x in bracket.l 2\, +infinity bracket.l)$

   On designe par $(zeta '')$ sa courbe representative dans le repere $(O, arrow(i), arrow(j))$.

   a) Etudier la continuite de $h$ en 0.

   b) Etudier la derivabilite de $h$ en 0 et interpreter geometriquement le
      resultat.

   c) Determiner $m$ pour que $h$ soit continue en 2.

4) On prend pour la suite $m = 3$.

   a) Etudier la derivabilite de $h$ en 2 et interpreter geometriquement
      les resultats.

   b) Montrer que $h$ est derivable en tout reel $a$ de $bracket.r 2, +infinity bracket.l$ et calculer $h'(a)$

   c) Ecrire l'equation de la tangente a la courbe $(zeta '')$ au point d'abscisse
      $2 sqrt(2)$.

#pagebreak()

// =============================================================================
// CORRIGES
// =============================================================================

#align(center, text(size: 18pt, weight: "bold")[CORRIGES])

#v(1em)

// Source: XY Plus T1 p.66

== Corrige Exercice 1

*1)* $f(x) = x^3 - x^2 + 2x + 1$, $D_f = RR$, $x_0 = 1$, $f(1) = 3$.

$f$ est une fonction polynome donc derivable en tout reel $a$ et
$f'(a) = 3a^2 - 2a + 2$. Il en resulte que $f$ est derivable en 1 et $f'(1) = 3$.

Soit $(T)$ la tangente a $cal(C)_f$ au point d'abscisse $x_0 = 1$.

$(T) : y = f'(1)(x - 1) + f(1)$, donc $(T) : y = 3x$.

*2)* $f(x) = frac(x^2 + x - 2, x + 3)$, $D_f = RR without brace.l -3 brace.r$, $x_0 = 0 in D_f$, $f(0) = -frac(2, 3)$.

Pour tout $x in D_f$, $f(x) = frac(f_1(x), f_2(x))$ ou $f_1(x) = x^2 + x - 2$ et $f_2(x) = x + 3$.

Les fonctions $f$ et $f$ sont deux fonctions polynomes donc derivables en tout
reel $a$ et on $a$ : $f'_1(a) = 2a + 1$ et $f'_2(a) = 1 eq.not 0$ donc $f$ est derivable en tout reel
$a$ appartenant a $D$ et $f'(a) = frac(f'_1(a) f_2(a) - f_1(a) f'_2(a), (f_2(a))^2)$ d'ou $f'(0) = frac(5, 9)$

Soit $(T)$ la tangente a $cal(C)_f$ au point d'abscisse $x_0 = 0$.

$(T) : y = f'(0) dot x + f(0)$, donc $(T) : y = frac(5, 9) x - frac(2, 3)$.

// Source: XY Plus T1 p.66

*3)* $f(x) = sqrt(x^2 - 2x)$, $D_f = bracket.r -infinity, 0 bracket.r union bracket.l 2, +infinity bracket.l$,

- $x_0 = 3$ et $f(3) = sqrt(3)$.

  La fonction $u : x arrow.r.bar x^2 - 2x$, etant polynome, est derivable en $x_0 = 3$ et
  $u'(3) = 2 times 3 - 2 = 4$ et $u(3) = 3 > 0$ donc $f = sqrt(u)$ est derivable en 3 et

  $f'(3) = frac(u'(3), 2 sqrt(u(3))) = frac(4, 2 sqrt(3)) = frac(2 sqrt(3), 3)$

  Soit $(T)$ la tangente a $cal(C)_f$ au point d'abscisse $x_0 = 3$.

  $(T) : y = f'(3)(x - 3) + f(3)$ #h(2em) donc $(T) : y = frac(2 sqrt(3), 3) x - sqrt(3)$.

// Source: XY Plus T1 p.66-67

- $x_0 = 2$ et $f(2) = 0$.

  Pour tout $x in D_f without brace.l 2 brace.r$ on a : $frac(f(x) - f(2), x - 2) = frac(sqrt(x^2 - 2x), x - 2) = frac(x^2 - 2x, (x - 2) sqrt(x^2 - 2x)) = frac(x, sqrt(x^2 - 2x))$

  La fonction $u : x arrow.r.bar x^2 - 2x$, etant polynome, est continue sur
  $bracket.l 2, +infinity bracket.l$ et pour tout
  reel de $bracket.l 2, +infinity bracket.l$ on a $x^2 - 2x gt.eq 0$ donc $v : x arrow.r.bar sqrt(x^2 - 2x)$ est continue sur $bracket.l 2, +infinity bracket.l$

  et par suite $v$ est continue a droite en 2 et $lim_(x arrow.r 2^+) v(x) = v(2) = 0^+$ d'ou

  $lim_(x arrow.r 2^+) frac(1, sqrt(x^2 - 2x)) = +infinity$ et $lim_(x arrow.r 2) x = 2$ donc $lim_(x arrow.r 2^+) frac(f(x) - f(2), x - 2) = lim_(x arrow.r 2^+) frac(x, sqrt(x^2 - 2x)) = +infinity$.

  $f$ n'est pas derivable a droite en 2.
  Dans un repere orthogonal, la courbe $cal(C)_f$, representation graphique de $f$,
  admet une demi tangente verticale au point d'abscisse 2.

// Source: XY Plus T1 p.67

*4)* $f(x) = x^2 + 2|x|$, $D_f = RR$, $x_0 = 0$, $f(0) = 0$.

- Expressions de $f(x)$ sans "|  |" :
  $cases(f(x) = x^2 + 2x quad & "si" x gt.eq 0, f(x) = x^2 - 2x quad & "si" x lt.eq 0)$

  Pour tout $x$ appartenant a $RR without brace.l 0 brace.r$, on pose $phi(x) = frac(f(x) - f(0), x)$

  $f$ est derivable en 0 si et seulement si $lim_(x arrow.r 0) phi(x)$ est un reel.

- Pour tout $x in bracket.r 0, +infinity bracket.l$, $phi(x) = frac(x^2 + 2x, x) = x + 2$

  $lim_(x arrow.r 0^+) phi(x) = 2$ d'ou $f$ est donc derivable a droite en 0 et $f'_d (0) = 2$.

- Pour tout $x in bracket.r -infinity, 0 bracket.l$, $phi(x) = frac(x^2 - 2x, x) = x - 2$

  $lim_(x arrow.r 0^-) phi(x) = -2$ d'ou $f$ est donc derivable a gauche en 0 et $f'_g (0) = -2$.

  On a : $f'_d (0) eq.not f'_g (0)$ donc $f$ n'est pas derivable en 0.

  $cal(C)$ admet deux demi-tangentes au point d'abscisse 0.

  $T_d : cases(x gt.eq 0, y = f'_d (0) dot x + f(0)) arrow.double T_d : cases(x gt.eq 0, y = 2x)$

  $T_g : cases(x lt.eq 0, y = f'_g (0) dot x + f(0)) arrow.double T_g : cases(x lt.eq 0, y = -2x)$

// Source: XY Plus T1 p.67-68

== Corrige Exercice 2

Soit $f$ une fonction definie sur un intervalle ouvert $I$ et $a$ un reel de $I$.
Approximation affine : $f(a + h) = f(a) + h f'(a)$ ou $h$ est voisin de 0.

*a)* On considere la fonction $f : x arrow.r.bar x^2$.
$f$ est derivable pour tout reel $x_0$ et $f'(x_0) = 2 x_0$.

On pose $a = 1$, $f(1 + h) approx f(1) + h f'(1)$ donc $(1 + h)^2 approx 1 + 2h$.

*b)* On considere la fonction $f : x arrow.r.bar x^3$.
$f$ est derivable pour tout reel $x_0$ et $f'(x_0) = 3 x_0^2$.

On pose $a = 1$, $f(1 + h) approx f(1) + h f'(1)$ donc $(1 + h)^3 approx 1 + 3h$.

*c)* On considere la fonction $f : x arrow.r.bar x^n$ #h(1em) $(n gt.eq 2)$
$f$ est derivable pour tout reel $x_0$ et $f'(x_0) = n x_0^(n-1)$.

On pose $a = 1$, $f(1 + h) approx f(1) + h f'(1)$ donc $(1 + h)^n approx 1 + n h$.

*d)* On considere la fonction $f : x arrow.r.bar sqrt(x)$.
$f$ est derivable pour tout reel strictement positif $x$ et $f'(x_0) = frac(1, 2 sqrt(x_0))$.

On pose $a = 1$, $f(1 + h) approx f(1) + h f'(1)$ ou $f'(1) = frac(1, 2)$ donc $sqrt(1 + h) approx 1 + frac(1, 2) h$.

*e)* On considere la fonction $f : x arrow.r.bar -frac(1, x)$ #h(1em) ($x eq.not 0$).
$f$ est derivable pour tout reel $x_0 eq.not 0$ et $f'(x_0) = -frac(1, x_0^2)$.

On pose $a = 1$, $f(1 + h) approx f(1) + h f'(1)$ ou $f'(1) = -1$ donc $frac(1, 1 + h) approx 1 - h$.

// Source: XY Plus T1 p.68

== Corrige Exercice 3

*1)* $f(x) = x^2$, soit $x_0 in RR$

$f$ est une fonction polynome donc derivable en $x_0$ et $f'(x_0) = 2 x_0$.

*2)* a) $A(a, f(a))$ et $B(b, f(b))$ car $A$ et $B$ appartiennent a la courbe $cal(C)$ de $f$.
   Donc $A(a, a^2)$ et $B(b, b^2)$.

   Le coefficient directeur de la droite $(A B)$ est :
   $frac(y_B - y_A, x_B - x_A) = frac(b^2 - a^2, b - a) = b + a$ (on a $a eq.not b$ car $A$ et $B$ sont distincts).

   $M_0$ d'abscisse $x_0$ donc le coefficient directeur de la tangente $T$ a la
   courbe $cal(C)$ au point $M_0$ est $f'(x_0)$.

   D'ou $(T) slash.double (A B) arrow.l.r.double f'(x_0) = b + a arrow.l.r.double 2 x_0 = b + a arrow.l.r.double x_0 = frac(b + a, 2)$.

   b) Soit $M_0(x_0, f(x_0)) in cal(C)$.
   - On construit deux points $A$ et $B$ de $cal(C)$ d'abscisses $a = x_0 - alpha$, $b = x_0 + alpha$
     ($alpha in RR$). Donc $frac(a + b, 2) = frac(x_0 - alpha + x_0 + alpha, 2) = x_0$.
   - On construit $(T)$ tangente a $cal(C)$ en $x_0$ d'abscisse $x_0$ : c'est la droite
     parallele a $(A B)$ passant par $M_0$.

#figure(
  cetz.canvas({
    import cetz.draw: *

    set-style(stroke: 0.8pt)

    // Axes
    line((-1, 0), (5, 0), stroke: 0.5pt, mark: (end: ">"))
    line((0, -0.5), (0, 5), stroke: 0.5pt, mark: (end: ">"))
    content((0.3, -0.3), $O$, anchor: "north-west")

    // Parabole x^2 (echelle reduite)
    bezier((-0.5, 0.5), (2, 4), (0.5, 0), (1.5, 3), stroke: 1pt)

    // Points A, B, M_0
    circle((0.5, 0.25), radius: 0.05, fill: black)
    content((0.3, 0.5), $A$, anchor: "east")

    circle((2, 4), radius: 0.05, fill: black)
    content((2.2, 4.2), $B$, anchor: "south-west")

    circle((1.25, 1.56), radius: 0.05, fill: black)
    content((1.45, 1.8), $M_0$, anchor: "south-west")

    // Droite (AB)
    line((0, -0.25), (2.5, 4.75), stroke: 0.5pt + gray)

    // Tangente parallele a (AB) en M_0
    line((0.25, 0.56), (2.25, 2.56), stroke: 0.8pt + blue)
    content((2.3, 2.8), $T$, anchor: "south-west")

    // Abscisses
    content((0.5, -0.3), $x_0 - alpha$, anchor: "north")
    content((1.25, -0.3), $x_0$, anchor: "north")
    content((2, -0.3), $x_0 + alpha$, anchor: "north")
  }),
  caption: [Construction geometrique de la tangente a la parabole],
)

// Source: XY Plus T1 p.69

== Corrige Exercice 4

$f(x) = a x + frac(b, x + 1)$.

*1)* Soit $x_0 in RR without brace.l -1 brace.r$.

La fonction $u : x arrow.r.bar a x$ est derivable en tout reel $x_0$ et $u'(x_0) = a$.

La fonction $v : x arrow.r.bar frac(b, x + 1)$ est derivable $x_0 eq.not -1$ et $v'(x_0) = frac(-b, (x_0 + 1)^2)$.

Donc $f = u + v$ est derivable en $x_0 eq.not -1$ et $f'(x_0) = u'(x_0) + v'(x_0)$.

$f'(x_0) = a - frac(b, (x_0 + 1)^2)$.

*2)* $D : 3x - 4y + 3 = 0$ donc $D : y = frac(3, 4) x + frac(3, 4)$.

$D$ tangente a $cal(C)_f$ au point d'abscisse $x_0 = 1$ donc $D : y = f'(1)(x - 1) + f(1)$.

$D : y = f'(1) x + f(1) - f'(1)$ et $y = frac(3, 4) x + frac(3, 4)$.

$cases(f'(1) = frac(3, 4), f(1) - f'(1) = frac(3, 4)) arrow.l.r.double cases(a - frac(b, 4) = frac(3, 4), a + frac(b, 2) - a + frac(b, 4) = frac(3, 4)) arrow.l.r.double cases(a = frac(3, 4) + frac(b, 4), frac(3, 4) b = frac(3, 4)) arrow.l.r.double cases(b = 1, a = 1)$

Donc $f(x) = x + frac(1, x + 1)$.

*3)* $T_M$ tangente a $cal(C)_f$ au point $M(alpha, f(alpha))$ de coefficient directeur $f'(alpha)$.

$T_N$ tangente a $cal(C)_f$ au point $N(-2 - alpha, f(-2 - alpha))$ de coefficient directeur $f'(-2 - alpha)$.

$f'(-2 - alpha) = 1 - frac(1, (-2 - alpha + 1)^2) = 1 - frac(1, (-1 - alpha)^2) = 1 - frac(1, (alpha + 1)^2) = f'(alpha)$.

Donc $T_M slash.double slash.double T_N$.

// Source: XY Plus T1 p.69-70

== Corrige Exercice 5

$f : x arrow.r.bar cases(x^2 + x - 6 quad & "si" x lt.eq 2, sqrt(x^2 - 4) + x - 2 quad & "si" x > 2)$

*1)* $f(2) = 2^2 + 2 - 6 = 0$.

La restriction de $f$ a l'intervalle $bracket.r -infinity, 2 bracket.r$ est une fonction polynome donc
continue sur cet intervalle d'ou $f$ est continue a gauche en 2.

$lim_(x arrow.r 2^+) f(x) = lim_(x arrow.r 2^+) sqrt(x^2 - 4) + x - 2 = 0 = f(2)$, donc $f$ est continue a droite en 2.

$f$ est continue a gauche et a droite en 2 donc $f$ est continue en 2.

*2)* Pour tout $x in RR without brace.l 2 brace.r$, on pose $phi(x) = frac(f(x) - f(2), x - 2)$

- Derivabilite de $f$ a gauche en 2 :

  Pour tout $x in bracket.r -infinity, 2 bracket.l$, $phi(x) = frac(f(x) - f(2), x - 2) = frac(x^2 + x - 6, x - 2) = x + 3$

  $lim_(x arrow.r 2^-) phi(x) = 5$. $f$ est donc derivable a gauche en 2 et $f'_g (2) = 5$.

- Derivabilite de $f$ a droite en 2 : Pour tout $x in bracket.r 2, +infinity bracket.l$

  $phi(x) = frac(sqrt(x^2 - 4) + x - 2, x - 2) = frac(sqrt(x^2 - 4), x - 2) + 1 = frac(x + 2, sqrt(x^2 - 4)) + 1$

  $lim_(x arrow.r 2^+) phi(x) = +infinity$, donc $f$ n'est pas derivable a droite en 2.

  Conclusion : $f$ n'est pas derivable en 2.

*3)* Pour tout $x < 2$, $f(x) = x^2 + x - 6$.

$f$ est une fonction polynome donc derivable en tout reel pour tout reel
$x$, $f'(x_0) = 2 x_0 + 1$.

La tangente a $cal(C)$ en $M_0(x_0, f(x_0))$ est horizontale si et seulement si

$f'(x_0) = 0 arrow.l.r.double 2 x_0 + 1 = 0 arrow.l.r.double x_0 = -frac(1, 2)$.

*4)* a) Pour tout $x > 2$, $f(x) = sqrt(x^2 - 4) + x - 2$.

  Les fonctions $u : x arrow.r.bar x^2 - 4$ et $v : x arrow.r.bar x - 2$ sont polynomes donc
  derivables en tout reel $x_0$ et $u'(x_0) = 2 x_0$ et $v'(x_0) = 1$ et pour tout $x_0 > 2$
  on a $u(x_0) > 0$ donc $f = sqrt(u) + v$ est derivable en tout $x_0 > 2$ et

  $f'(x_0) = frac(u'(x_0), 2 sqrt(u(x_0))) + v'(x_0) = frac(2 x_0, 2 sqrt(x_0^2 - 4)) + 1 = frac(x_0, sqrt(x_0^2 - 4)) + 1$.

  b) $(T)$ est tangente a $cal(C)$ au point $N_0$ d'abscisse $x_0$ de coefficient directeur
  $f'(x_0)$. $D : y = (frac(2, sqrt(3)) + 1) x - 2$ de coefficient directeur $frac(2, sqrt(3)) + 1$.

  $(T) slash.double D arrow.l.r.double f'(x_0) = frac(2, sqrt(3)) + 1 arrow.l.r.double frac(x_0, sqrt(x_0^2 - 4)) + 1 = frac(2, sqrt(3)) + 1$

  $arrow.l.r.double frac(x_0, sqrt(x_0^2 - 4)) = frac(2, sqrt(3)) arrow.l.r.double frac(x_0^2, x_0^2 - 4) = frac(4, 3)$

  $arrow.l.r.double 3 x_0^2 = 4 x_0^2 - 16 arrow.l.r.double x_0^2 = 16$

  $arrow.l.r.double x_0 = 4$ ou $x_0 = -4$ (a rejeter car $x_0 > 2$)

  $arrow.l.r.double x_0 = 4$

  d'ou $N_0(4, f(4))$ c'est-a-dire $N_0(4, 2 + 2 sqrt(3))$.

// Source: XY Plus T1 p.70-71

== Corrige Exercice 6

*1)* Soit $x_0 in RR$, $f$ est une fonction polynome donc derivable en tout $x_0$ et
$f'(x_0) = 2a x_0 + b$.

*2)* $cal(C)_f$ passe par $A(0, 1) arrow.double f(0) = 1$

$cal(C)_f$ passe par $B(1, 4) arrow.double f(1) = 4$

$cal(C)_f$ admet une tangente en $A$ de coefficient directeur 1 $arrow.double f'(0) = 1$

On a donc $cases(f(0) = 1, f(1) = 4, f'(0) = 1) arrow.l.r.double cases(c = 1, a + b + c = 4, b = 1) arrow.l.r.double cases(a = 2, b = 1, c = 1)$

Donc $f(x) = 2x^2 + x + 1$.

*3)* $f(x) = 2x^2 + x + 1$ ; $f'(x_0) = 4 x_0 + 1$.

$D : x - 7y + 7 = 0 arrow.double D : y = frac(1, 7) x + 1$

$Delta$ tangente a $cal(C)_f$ au point d'abscisse $x_0 arrow.double f'(x_0)$ est le coefficient directeur
de $Delta$.

$Delta perp D arrow.l.r.double f'(x_0) times frac(1, 7) = -1 arrow.l.r.double 4 x_0 + 1 = -7$
$arrow.l.r.double x_0 = -2$

$Delta : y = f'(-2)(x + 2) + f(-2)$

$Delta : y = -7x - 7$.

*Rappel :* Soient $D : y = m x + p$ et $D' : y = m' x + p'$.

$D perp D' arrow.l.r.double m m' = -1$

$D slash.double D' arrow.l.r.double m = m'$.

// Source: XY Plus T1 p.71

== Corrige Exercice 7

*1)* $lim_(x arrow.r -infinity) f(x) = 0$

$lim_(x arrow.r -infinity) frac(1, f(x)) = -infinity$ car : sur $bracket.r -infinity, -4 bracket.r$ la courbe $(C)$ est au dessous de l'axe des
abscisses et par suite $f(x) < 0$ au voisinage de $-infinity$

*2)* $lim_(x arrow.r +infinity) f(x) = +infinity$

$lim_(x arrow.r +infinity) f(x) - 2x - 2 = 0$ car : la droite $D : y = 2x + 2$ est une asymptote a $(C)$ au
voisinage de $+infinity$

*3)* $f'(-2) = 0$, $f'_d (-4) = 4$

$lim_(x arrow.r -4^-) frac(f(x) + 2, x + 4) = lim_(x arrow.r -4^-) frac(f(x) - f(-4), x + 4) = -infinity$

*4)* a) $f(-0,99999) = f(-1 + 0,00001) approx f(-1) + 0,00001 times f'(-1)$

On a d'apres le graphique :
$f(-1) = 1$

$f'(-1) = -2$ c'est le coefficient directeur de la tangente $T$

d'ou $f(-0,99999) approx 0,99998$

b) Sur $bracket.r -4, 0 bracket.l$ : $g'(-1) = 2(-1) f(-1) + (-1)^2 f'(-1) = -4$

// Source: XY Plus T1 p.72

== Corrige Exercice 8

*1)* a) $u : x arrow.r.bar x + 5$ est une fonction affine donc derivable en tout reel $a$ et $u'(a) = 1$

$v : x arrow.r.bar frac(4, x - 1)$ est une fonction rationnelle definie en tout reel $a$ de $RR without brace.l 1 brace.r$

donc derivable en tout reel $a$ de $RR without brace.l 1 brace.r$ et $v'(a) = -frac(4, (a - 1)^2)$

D'ou $f = u + v$ est derivable en tout reel $a$ de $RR without brace.l 1 brace.r$ et $f'(a) = u'(a) + v'(a)$

$ = 1 - frac(4, (a - 1)^2) $

b) Soit $T$ une tangente a $(zeta)$ au point d'abscisse $a$ de $RR without brace.l 1 brace.r$

$T$ parallele a l'axe des abscisses ssi $f'(a) = 0 arrow.l.r.double 1 - frac(4, (a - 1)^2) = 0$

$arrow.l.r.double a = 3$ ou $a = -1$

Donc la courbe $(zeta)$ admet deux tangentes horizontales aux points
d'abscisses : 3 et -1

c) Soit $T$ une tangente a $(zeta)$ au point d'abscisse $a$ de $RR without brace.l 1 brace.r$, donc de
coefficient directeur $f'(a)$.

$Delta : 4x + 3y - 3 = 0 arrow.l.r.double y = -frac(4, 3) x + 1$ donc de coefficient directeur $-frac(4, 3)$

$T perp Delta arrow.l.r.double f'(a) times (-frac(4, 3)) = -1 arrow.l.r.double a = 5$ ou $a = -3$

Donc la courbe $(zeta)$ admet deux tangentes perpendiculaires a la droite $Delta$
aux points d'abscisses 5 et -3

// Source: XY Plus T1 p.72

*2)* a) $lim_(x arrow.r +infinity) [g(x) - (2x + 3)] = lim_(x arrow.r +infinity) sqrt(x^2 - 4) - x = lim_(x arrow.r +infinity) frac(-4, sqrt(x^2 - 4) + x) = 0$

Donc la droite $Delta '$ est une asymptote oblique a la courbe $(zeta ')$ au voisinage de $+infinity$

b) $g$ est definie sur $bracket.r -infinity, -2 bracket.r union bracket.l 2, +infinity bracket.l$ :

Sur $bracket.r -infinity, -2 bracket.r$ : $g(x) - (2x + 3) = sqrt(x^2 - 4) - x > 0$ donc $(zeta ')$ est au dessus de $Delta '$

Sur $bracket.l 2, +infinity bracket.l$ : $g(x) - (2x + 3) = frac(-4, sqrt(x^2 - 4) + x) < 0$ donc $(zeta ')$ est au dessous de $Delta '$

// Source: XY Plus T1 p.72-73

*3)* a) On a $h(0) = 1$ et $lim_(x arrow.r 0^-) h(x) = lim_(x arrow.r 0^-) f(x) = f(0) = 1 = lim_(x arrow.r 0^+) h(x)$

Donc $h$ est continue en 0.

b) $lim_(x arrow.r 0^-) frac(h(x) - h(0), x) = lim_(x arrow.r 0^-) frac(f(x) - f(0), x) = f'_g (0) = f'(0) = -3$ car $f$ est derivable en 0

D'ou $h$ est derivable a gauche en 0 et $h'_g (0) = -3$.  // Note: f'(0) = 1 - 4/(0-1)^2 = 1-4 = -3

$lim_(x arrow.r 0^+) frac(h(x) - h(0), x) = lim_(x arrow.r 0^+) frac(x^3 - 2x + 1 - 1, x) = lim_(x arrow.r 0^+) x^2 - 2 = -2$

Donc $h$ est derivable a droite en 0 et $h'_d (0) = -2$.

On a $h'_g (0) eq.not h'_d (0)$ donc $h$ n'est pas derivable en 0.

D'ou $(zeta '')$ admet deux demi-tangentes secantes au point d'abscisse 0
(un point anguleux)

c) On a $h$ est continue a droite en 2 et $h(2) = m + 2$.

$h$ est continue en 2 ssi $h$ est continue a gauche en 2

ssi $lim_(x arrow.r 2^-) h(x) = h(2)$

ssi $lim_(x arrow.r 2^-) x^3 - 2x + 1 = m + 2$

ssi $m + 2 = 5$

ssi $m = 3$

// Source: XY Plus T1 p.73

*4)* On prend pour la suite $m = 3$.

a) Soit $w : x arrow.r.bar x^3 - 2x + 1$ c'est une fonction polynome donc derivable en tout
reel $a$ et $w'(a) = 3a^2 - 2$ donc $w'(2) = 10$

$lim_(x arrow.r 2^-) frac(h(x) - h(2), x - 2) = lim_(x arrow.r 2^-) frac(w(x) - w(2), x - 2) = w'(2) = 10$, donc $h$ est derivable a
gauche en 2 et $h'_g (2) = 10$

$lim_(x arrow.r 2^+) frac(h(x) - h(2), x - 2) = lim_(x arrow.r 2^+) frac(sqrt(x^2 - 4) + x - 2, x - 2)$

$= lim_(x arrow.r 2^+) frac(sqrt(x^2 - 4), x - 2) + 1 = lim_(x arrow.r 2^+) frac(x + 2, sqrt(x^2 - 4)) + 1 = +infinity$

Donc $h$ n'est pas derivable a droite en 2.

$(zeta '')$ admet une demi-tangente a gauche au point d'abscisse 2 de coefficient
directeur $h'_g (2) = 10$

$(zeta '')$ admet une demi-tangente verticale dirigee vers le haut a droite au
point d'abscisse 2

b) les fonctions $x arrow.r.bar x^2 - 4$ et $x arrow.r.bar x + 3$ sont des fonctions polynomes donc derivables en
tout reel $a$ et pour tout reel $a$ de $bracket.r 2, +infinity bracket.l$ on a $a^2 - 4 > 0$

D'ou $h$ est derivable en tout reel $a$ de $bracket.r 2, +infinity bracket.l$ et $h'(a) = frac(a, sqrt(a^2 - 4)) + 1$

c) $2 sqrt(2) in bracket.r 2, +infinity bracket.l$ donc $h(2 sqrt(2)) = sqrt(8 - 4) + 2 sqrt(2) + 3 = 2 sqrt(2) + 5$

$h'(2 sqrt(2)) = frac(2 sqrt(2), sqrt(8 - 4)) + 1 = sqrt(2) + 1$

Soit $T$ la tangente a $(zeta '')$ au point d'abscisse $2 sqrt(2)$

Donc $T$ a pour equation : $y = h'(2 sqrt(2))(x - 2 sqrt(2)) + h(2 sqrt(2)) = (sqrt(2) + 1) x + 1$
