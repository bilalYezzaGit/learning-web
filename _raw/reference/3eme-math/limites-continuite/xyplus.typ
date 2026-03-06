// =============================================================================
// Transcription fidele : XY Plus 3eme Math Tome 1 (CAEU Med Ali)
// Chapitre 3 — Limites et Continuite
// Pages 26 a 40
// =============================================================================

#import "@preview/cetz:0.3.4"

// ---------------------------------------------------------------------------
// RESUME DE COURS
// ---------------------------------------------------------------------------

// Source: XY Plus T1 p.26

#align(center, text(size: 18pt, weight: "bold")[Chapitre 3 \ Limites et Continuite])

#v(1em)

== 1. Limite en un reel a d'une fonction continue en a

#block(
  fill: rgb("#e8f5e9"),
  inset: 12pt,
  radius: 4pt,
  width: 100%,
)[
  *Theoreme*

  Soit $f$ une fonction definie sur un intervalle ouvert $I$ et $a$ un reel de $I$.

  $f$ est continue en $a$, si et seulement si, $lim_(x arrow a) f(x) = f(a)$
]

#block(
  fill: rgb("#e8f5e9"),
  inset: 12pt,
  radius: 4pt,
  width: 100%,
)[
  *Theoreme*

  Soit $f$ une fonction definie sur un intervalle ouvert $I$, sauf peut etre en un reel $a$ de $I$.

  $lim_(x arrow a) f(x) = ell$ si, et seulement si, $lim_(x arrow a^+) f(x) = lim_(x arrow a^-) f(x) = ell$
]

#v(1em)

== 2. Calcul de limites

#block(
  fill: rgb("#e8f5e9"),
  inset: 12pt,
  radius: 4pt,
  width: 100%,
)[
  *Theoreme*

  Soit $f$ une fonction definie sur un intervalle ouvert $I$, sauf peut etre en un reel $a$ de $I$ et soit $g$ une fonction definie sur l'intervalle $I$.

  Si $g$ est continue en $a$ et si $g(x) = f(x)$ pour $x eq.not a$ alors $lim_(x arrow a) f(x) = g(a)$.
]

#v(1em)

== 3. Prolongement par continuite

#block(
  fill: rgb("#e8f5e9"),
  inset: 12pt,
  radius: 4pt,
  width: 100%,
)[
  *Theoreme et definition*

  Soit $f$ une fonction definie sur un intervalle $I$, sauf en un reel $a$ de $I$, et admettant une limite $ell$ en $a$.

  Alors la fonction $g$ definie par : $g(x) = cases(f(x) "si" x eq.not a, ell "si" x = a)$

  est continue en $a$.
]

#figure(
  grid(
    columns: 2,
    gutter: 2em,
    cetz.canvas({
      import cetz.draw: *
      // Axes
      line((-0.5, 0), (4.5, 0), mark: (end: ">"))
      line((0, -0.5), (0, 3), mark: (end: ">"))
      // Courbe Cf avec trou en a
      bezier((0.5, 1), (1.5, 2), (1, 1.8))
      bezier((1.5, 2), (2.5, 2.5), (2, 2.2))
      circle((2.5, 2.5), radius: 0.06, fill: white, stroke: black)
      bezier((2.5, 2.5), (4, 1.5), (3.5, 1.8))
      // Labels
      content((1.5, -0.3), $a$)
      content((3.5, -0.3), $b$)
      content((3.5, 2.8), $cal(C)_f$)
    }),
    cetz.canvas({
      import cetz.draw: *
      // Axes
      line((-0.5, 0), (4.5, 0), mark: (end: ">"))
      line((0, -0.5), (0, 3), mark: (end: ">"))
      // Courbe Cg continue (prolongement)
      bezier((0.5, 1), (1.5, 2), (1, 1.8))
      bezier((1.5, 2), (2.5, 2.5), (2, 2.2))
      circle((2.5, 2.5), radius: 0.06, fill: black)
      bezier((2.5, 2.5), (4, 1.5), (3.5, 1.8))
      // Labels
      content((1.5, -0.3), $a$)
      content((3.5, -0.3), $b$)
      content((3.5, 2.8), $cal(C)_g$)
    }),
  ),
  caption: [Prolongement par continuite]
)

#block(
  fill: rgb("#fff7f0"),
  inset: 12pt,
  radius: 4pt,
  width: 100%,
)[
  *Vocabulaire*

  On dit que la fonction $g$ est le prolongement par continuite en $a$ de la fonction $f$.

  On dit aussi que $f$ est prolongeable par continuite en $a$.
]

#v(1em)

== 4. Operations sur les limites finies

#block(
  fill: rgb("#e8f5e9"),
  inset: 12pt,
  radius: 4pt,
  width: 100%,
)[
  *Theoreme*

  Soient $f$ et $g$ deux fonctions definies sur un intervalle ouvert $I$, sauf peut-etre en un reel $a$ de $I$ et telles que $f$ et $g$ admettent pour limites respectives $ell$ et $ell'$ en $a$.

  Alors

  // Source: XY Plus T1 p.27

  - $lim_a (f + g) = ell + ell'$ #h(4em) - $lim_a k f = k ell$ #h(1em) ($k in RR$)
  - $lim_a |f| = |ell|$ #h(6.5em) - $lim_a f g = ell space ell'$
  - Si $ell eq.not 0$ alors $lim_a frac(1, f) = frac(1, ell)$ #h(2em) - Si $ell' eq.not 0$ alors $lim_a frac(f, g) = frac(ell, ell')$
]

#v(1em)

== 5. Limite et ordre

#block(
  fill: rgb("#e8f5e9"),
  inset: 12pt,
  radius: 4pt,
  width: 100%,
)[
  *Theoreme*

  Soit $f$ une fonction definie sur un intervalle ouvert $I$, sauf peut etre en un reel $a$ de $I$ et admettant pour limite $ell$ en $a$.
  - Si $f(x)$ est positif pour tout reel $x$ de $I$ distinct de $a$, alors $ell gt.eq 0$.
  - Si $f(x)$ est negatif pour tout reel $x$ de $I$ distinct de $a$, alors $ell lt.eq 0$.
]

#block(
  fill: rgb("#fff7f0"),
  inset: 12pt,
  radius: 4pt,
  width: 100%,
)[
  *Remarque*

  - L'inegalite donnant le signe de $f(x)$ peut etre stricte ou large.
  - En passant a la limite l'inegalite stricte devient large.
]

#block(
  fill: rgb("#e8f5e9"),
  inset: 12pt,
  radius: 4pt,
  width: 100%,
)[
  *Theoreme*

  Soit $f$ une fonction definie sur un intervalle ouvert $I$, sauf peut etre en un reel $a$ de $I$ et admettant pour limite $ell$ en $a$.

  Si $f(x)$ est positif pour tout reel $x$ distinct de $a$, alors $lim_a sqrt(f) = sqrt(ell)$.
]

#v(1em)

== 6. Limite a droite (ou a gauche) en a et continuite a droite (ou a gauche) en a

#block(
  fill: rgb("#e8f5e9"),
  inset: 12pt,
  radius: 4pt,
  width: 100%,
)[
  *Theoreme*

  Soit $f$ une fonction definie sur un intervalle $I$ et $a$ un reel de $I$.
  - La fonction $f$ est continue a droite en $a$ si, et seulement si, $lim_(x arrow a^+) f(x) = f(a)$.
  - La fonction $f$ est continue a gauche en $a$ si, et seulement si, $lim_(x arrow a^-) f(x) = f(a)$.
]

#block(
  fill: rgb("#e8f5e9"),
  inset: 12pt,
  radius: 4pt,
  width: 100%,
)[
  *Theoreme*

  - Soit $f$ une fonction definie sur un intervalle $[a, b[$ sauf peut etre en $a$ et $g$ une fonction definie sur un intervalle contenant $[a, b[$.

    Si $g$ est continue a droite en $a$ et si $g(x) = f(x)$ pour tout $x$ de $]a, b[$ alors $lim_(x arrow a^+) f(x) = g(a)$.

  - Soit $f$ une fonction definie sur un intervalle $]a, b]$ sauf peut etre en $b$ et $g$ une fonction definie sur un intervalle contenant $]a, b]$.

    Si $g$ est continue a gauche en $b$ et si $g(x) = f(x)$ pour tout $x$ de $]a, b[$ alors $lim_(x arrow b^-) f(x) = g(b)$.
]

// ---------------------------------------------------------------------------
// EXERCICES - ENONCES
// ---------------------------------------------------------------------------

// Source: XY Plus T1 p.28

#pagebreak()

#align(center, text(size: 18pt, weight: "bold")[EXERCICES])

#v(1em)

=== Exercice 1

Dans chacun des cas suivants, determiner la limite de la fonction $f$ au reel $x_0$ indique :

1) $f(x) = 3x^6 - 5x^3 + 1$ #h(6em) $x_0 = -1$

2) $f(x) = frac(x^2 - 1, x + 5)$ #h(6em) $x_0 = 2$

3) $f(x) = sqrt(3x^2 + 5x + 7)$ #h(5em) $x_0 = frac(1, 2)$

4) $f(x) = sqrt(-2x + 1) + frac(4, x + 3)$ #h(3em) $x_0 = -10$

5) $f(x) = (x - 4)^4 + frac(2, x^3 - 2x + 4)$ #h(3em) $x_0 = 1$

#v(1em)

=== Exercice 2

Calculer la limite de la fonction $f$ au reel $x_0$ indique :

1) $f(x) = abs(frac(1 - 2x, x^2 - 3))$ #h(6em) $x_0 = -1$

2) $f(x) = frac(x^2 + |x| + 2, |x| + 3)$ #h(5em) $x_0 = 0$

3) $f(x) = frac(sqrt(x), |x| - 25)$ #h(6em) $x_0 = 9$

#v(1em)

=== Exercice 3

Calculer la limite de la fonction $f$ au reel $x_0$ indique :

1) $f(x) = frac(2, 2x^2 + 6x)$ #h(6em) $x_0 = -3$

2) $f(x) = frac(sqrt(x) - sqrt(2), x - 2)$ #h(5.5em) $x_0 = 2$

3) $f(x) = sqrt(frac(x^3 + 125, x + 5))$ #h(5em) $x_0 = -5$

4) $f(x) = frac(sqrt(2x + 5) - 3, x - 2)$ #h(5em) $x_0 = 2$

5) $f(x) = frac(x + 1, x - 4) + 4$ #h(5.5em) $x_0 = 3$

6) $f(x) = abs(frac((x + 1)^3 - 1, x))$ #h(5.5em) $x_0 = 0$

// Source: XY Plus T1 p.29

#v(1em)

=== Exercice 4

On considere la fonction $f$ definie sur $RR$ par :

$ f(x) = cases(
  frac(x^3 - 3x^2 - 16x + 48, x^2 - 16) "si" x eq.not 4 "et" x eq.not -4,
  a "si" x = 4,
  b "si" x = -4
) $

1) Determiner la valeur de $a$ pour que $f$ soit continue en 4.

2) Determiner la valeur de $b$ pour que $f$ soit continue en $-4$.

#v(1em)

=== Exercice 5

On considere la fonction $f$ definie sur $RR backslash {2}$ par :

$ f(x) = cases(
  frac(x^3 - 8, x - 2) "si" x < 2,
  frac(sqrt(x - 1) - 1, x - 2) "si" x > 2
) $

1) Determiner la limite de $f$ a gauche en 2.

2) Determiner la limite de $f$ a droite en 2.

3) La fonction $f$ admet-elle une limite en 2 ?

4) La fonction $f$ est-elle prolongeable par continuite en 2 ?

#v(1em)

=== Exercice 6

1) Etudier la continuite de la fonction $f$ definie sur $RR$ par $f(x) = x E(x)$

2) Etudier la continuite de la fonction $g$ definie par $g(x) = frac(4, E(x))$.

#v(1em)

=== Exercice 7

Soit $f$ la fonction definie sur $RR backslash {-1}$ par :

$ cases(
  f(x) = frac(x^3 - 4x^2 + x + 6, (x - 2)|x + 1|),
  f(2) = -1
) $

1) Montrer que $f$ est continue en 2.

2) Etudier la limite de $f$ en $-1$.

3) Soit $g$ la fonction definie sur $RR backslash {-1}$ par : $g(x) = 8 E(-x) - f(x)$.

   Determiner la limite de $g$ en $-1$.

#v(1em)

=== Exercice 8

I- Soit $f$ la fonction definie sur $RR backslash {1}$ par : $f(x) = frac(3x^3 - 3x^2 + x - 1, x - 1)$.

// Source: XY Plus T1 p.30

1)a- Montrer que $f$ admet un prolongement par continuite $F$ en 1.

#h(0.5em) b- Verifier que pour tout $x in RR$ : $F(x) = 3x^2 + 1$.

2)a- Tracer la courbe $(C_F)$ de $F$ et la courbe $(C_h)$ de la fonction $h$ definie par :

#h(1em) $h(x) = frac(1, x)$ sur un r.o.n $(O, arrow(i), arrow(j))$.

#h(0.5em) b- Justifier graphiquement que l'equation : $F(x) = frac(1, x)$ admet dans $RR$ une unique solution $alpha$.

#h(0.5em) c- En deduire que $alpha$ est l'unique solution de l'equation : $3x^3 + x - 1 = 0$.

#h(0.5em) d- Montrer que $alpha in ]0, 1[$ et donner un encadrement de $alpha$ d'amplitude $10^(-1)$.

#v(1em)

II- Soit $g$ la fonction definie sur $RR$ par :

$ cases(
  g(x) = frac(sqrt(3x^2 + 1) - 1 - x^3, x^2),
  g(0) = frac(3, 2)
) $

1) Montrer que pour tout reel $x$ : $g(x) = frac(3, 1 + sqrt(3x^2 + 1)) - x$.

2) Montrer que $g$ est continue en zero.

3)a- Montrer que $g$ est decroissante sur $RR_+$.

#h(0.5em) b- En deduire que $g$ est bornee sur $[0, 1]$.

#h(0.5em) c- L'equation $g(x) = 3$ admet-elle une solution dans $[0, 1]$ ? Justifier votre reponse.

#v(1em)

=== Exercice 9 -- Exercice d'un devoir de controle n°1

$bold([A])$ Soit $f$ la fonction definie sur $[-3, 3]$ par : $f(x) = x sqrt(3 - |x|)$.

1) Etudier la parite de $f$.

2)a- Montrer que pour tout $x in [-3, 3]$ : $(f(x))^2 - 4 = -(|x| - 2)^2 (|x| + 1)$.

#h(0.5em) b- En deduire que pour tout $x in [-3, 3]$ : $-2 lt.eq f(x) lt.eq 2$.

#h(0.5em) c- Determiner alors l'image de l'intervalle $[-3, 3]$ par $f$.

#v(1em)

$bold([B])$ Soit $g$ la fonction definie sur $RR$ par : $g(x) = x^3 - x^2 - 2x + 1$.

1) Calculer $g(-2)$, $g(0)$, $g(1)$ et $g(2)$.

2) En deduire que l'equation $g(x) = 0$ admet exactement trois solutions dans $RR$.

// Source: XY Plus T1 p.31

3) Soit $alpha$ la solution de l'equation $g(x) = 0$ dans l'intervalle $]0, 1[$, donner un encadrement de $alpha$ d'amplitude $0,1$.

#v(1em)

$bold([C])$ Soit $h$ la fonction definie sur $RR$ par :

$ h(x) = cases(
  frac(x^2 + 8x + 15, 6 - x - x^2) "si" x < -3,
  frac(x sqrt(3 - |x|) - 2, x - 2) "si" -3 lt.eq x < 2,
  x^3 - x^2 - 2x + 1 "si" x gt.eq 2
) $

1) Montrer que $h$ est continue en $-3$.

2)a- En utilisant $bold([A])$ /2/a, montrer que pour tout $x in [0, 2[$ : $h(x) = frac((2 - x)(x + 1), f(x) + 2)$

#h(0.5em) b- Etudier alors la continuite de $h$ en 2.

// ---------------------------------------------------------------------------
// CORRIGES
// ---------------------------------------------------------------------------

// Source: XY Plus T1 p.32

#pagebreak()

#align(center, text(size: 18pt, weight: "bold")[CORRIGES])

#v(1em)

=== Exercice 1

1) $f(x) = 3x^6 - 5x^3 + 1$, $x_0 = -1$

La fonction $f$, etant une fonction polynome, donc continue sur $RR$. Elle est, en particulier, continue en $x_0 = -1$ d'ou $lim_(x arrow -1) f(x) = f(-1) = 9$.

2) $f(x) = frac(x^2 - 1, x + 5)$, $x_0 = 2$

La fonction $f$ est rationnelle donc continue sur son domaine de definition $RR backslash {-5}$ en particulier en $x_0 = 2$ d'ou $lim_(x arrow 2) f(x) = f(2) = frac(3, 7)$.

3) $f(x) = sqrt(3x^2 + 5x + 7)$, $x_0 = frac(1, 2)$

Signe de $3x^2 + 5x + 7$ : $Delta = 25 - 84 < 0$ donc pour tout reel $x$, $3x^2 + 5x + 7 > 0$

La fonction $u : x arrow.r.bar 3x^2 + 5x + 7$, etant polynome, est continue sur $RR$ et puisque $3x^2 + 5x + 7 > 0$ pour tout reel $x$ alors $f : x arrow.r.bar sqrt(3x^2 + 5x + 7)$ est continue sur $RR$ en particulier $f$ est continue en $x_0 = frac(1, 2)$. D'ou

$lim_(x arrow frac(1,2)) f(x) = f(frac(1, 2)) = frac(sqrt(41), 2)$

4) $f(x) = sqrt(-2x + 1) + frac(4, x + 3)$ ; $x_0 = -10$. $f$ est definie sur $]-infinity, frac(1, 2)] backslash {-3}$.
- La fonction $x arrow.r.bar -2x + 1$ est continue et positive sur $]-infinity, frac(1, 2)]$ (fonction polynome) donc la fonction $x arrow.r.bar sqrt(-2x + 1)$ est continue sur $]-infinity, frac(1, 2)]$ d'ou en $-10$
- La fonction $x arrow.r.bar frac(4, x + 3)$ est rationnelle et definie en $x_0 = -10$ donc elle est continue en tout point de cet ensemble en particulier en $x_0 = -10$

d'ou $f$ est continue en $-10$ et par suite

$lim_(x arrow -10) f(x) = f(-10) = sqrt(21) - frac(4, 7)$.

5) $f(x) = (x - 4)^4 + frac(x^2 - 5x + 6, x^3 - 2x + 4)$, $x_0 = 1$.

$f$ est la somme d'une fonction polynome et d'une fonction rationnelle donc $f$ est continue sur son domaine contenant 1 et par suite $lim_(x arrow 1) f(x) = f(1) = 81 + frac(2, 3) = frac(245, 3)$

// Source: XY Plus T1 p.33

=== Exercice 2

1) $f(x) = abs(frac(1 - 2x, x^2 - 3))$ et $x_0 = -1$

$x arrow.r.bar frac(1 - 2x, x^2 - 3)$ est rationnelle et definie en $-1$ donc continue en $-1$ d'ou $f$ est continue en $-1$ et par suite $lim_(x arrow -1) f(x) = f(-1) = frac(3, 2)$.

2) $f(x) = frac(x^2 + |x| + 2, |x| + 3)$, $x_0 = 0$

- La fonction $x arrow.r.bar x^2 + x$, etant polynome, est continue en tout reel donc la fonction $x arrow.r.bar |x|^2 + |x| + 2$ est continue sur $RR$
- La fonction $x arrow.r.bar |x| + 3$ est continue et ne s'annule pas sur $RR$

donc $f$ est continue sur $RR$ et par suite $lim_(x arrow 0) f(x) = f(0) = frac(2, 3)$

3) $f(x) = frac(sqrt(x) + 1, |x| - 25)$, $x_0 = 9$

- La fonction $x arrow.r.bar sqrt(x) + 1$ est continue sur $[0, +infinity[$ donc continue en 9,
- La fonction $x arrow.r.bar |x| - 25$ est continue et ne s'annule pas en 9 donc $f$ est

continue en 9 et par suite $lim_(x arrow 9) f(x) = f(9) = -frac(1, 4)$.

=== Exercice 3

// Source: XY Plus T1 p.33-34

1) $f(x) = frac(x^2 - 9, 2x^2 + 6x) = frac((x + 3)(x - 3), 2x(x + 3)) = frac(x - 3, 2x)$

Soit $g$ la fonction definie sur $]-infinity, 0[$ par $g(x) = frac(x - 3, 2x)$, $g$ est rationnelle et definie en $(-3)$ donc $g$ est continue en $(-3)$ et de plus $g(x) = f(x)$ pour tout $x in ]-infinity, 0[ backslash {-3}$ donc $lim_(x arrow -3) f(x) = g(-3) = 1$.

2) $f(x) = frac(sqrt(x) - sqrt(2), x - 2)$. La fonction $f$ est definie sur $[0, +infinity[ backslash {2}$.

Pour tout $[0, +infinity[ backslash {2}$, $f(x) = frac(sqrt(x) - sqrt(2), (sqrt(x) - sqrt(2))(sqrt(x) + sqrt(2))) = frac(1, sqrt(x) + sqrt(2))$.

Soit $g$ la fonction definie sur $[0, +infinity[$ par $g(x) = frac(1, sqrt(x) + sqrt(2))$.

La fonction $: x arrow.r.bar sqrt(x) + sqrt(2)$ est continue et ne s'annule pas en 2 et donc $g$ est continue en 2 ; de plus $g(x) = f(x)$ pour tout $x eq.not 2$ donc

$lim_(x arrow 2) f(x) = g(2) = frac(1, 2sqrt(2))$.

// Source: XY Plus T1 p.34

3) $f(x) = sqrt(frac(x^3 + 125, x + 5))$.

Pour tout $x eq.not -5$, on a : $frac(x^3 + 125, x + 5) = frac((x + 5)(x^2 - 5x + 25), x + 5) = x^2 - 5x + 25$

la fonction $x arrow.r.bar x^2 - 5x + 25$ est continue et positive en tout reel donc la fonction $g$ definie par $g(x) = sqrt(x^2 - 5x + 25)$ est continue en $-5$ d'ou $lim_(x arrow (-5)) f(x) = g(-5) = 5$

4) $f(x) = frac(sqrt(2x + 5) - 3, x - 2)$. La fonction $f$ est definie sur $[-frac(5, 2), +infinity[ backslash {2}$.

Pour tout $[-frac(5, 2), +infinity[ backslash {2}$,

$f(x) = frac((sqrt(2x + 5) - 3)(sqrt(2x + 5) + 3), (x - 2)(sqrt(2x + 5) + 3)) = frac(2x + 5 - 9, (x - 2)(sqrt(2x + 5) + 3)) = frac(2x - 4, (x - 2)(sqrt(2x + 5) + 3))$

$f(x) = frac(2, sqrt(2x + 5) + 3)$. On pose $g(x) = frac(2, sqrt(2x + 5) + 3)$

La fonction $x arrow.r.bar sqrt(2x + 5) + 3$ est continue et ne s'annule pas sur $[-frac(5, 2), +infinity[$

donc $g$ est continue en 2 et par consequent $lim_(x arrow 2) f(x) = g(3) = frac(1, 3)$.

5) $f(x) = frac(x + 1, x - 4) + 4$. La fonction $f$ est definie sur $RR backslash {3, 4}$.

Pour tout $x$ appartenant a $RR backslash {3, 4}$,

$f(x) = frac(x + 1, x - 4) + 4 = frac(x + 1 + 4(x - 4), (x - 4)(x - 3)) = frac(5x - 15, (x - 4)(x - 3)) = frac(5, x - 4)$

Soit $g$ la fonction definie sur $RR backslash {4}$ par $g(x) = frac(5, x - 4)$.

La fonction $g$ est rationnelle donc continue sur $RR backslash {4}$ et $[0, 4[ subset RR backslash {4}$

La fonction $g$ est donc continue en 3 et de plus $g(x) = f(x)$ pour tout $[0, 4[ backslash {3}$ donc $lim_(x arrow 3) f(x) = g(3) = -5$.

6) $f(x) = abs(frac((x + 1)^3 - 1, x))$. La fonction $f$ est definie sur $RR^*$.

Pour tout $x$ appartenant a $RR^*$,

$f(x) = abs(frac((x + 1)^3 - 1, x)) = abs(frac(x^3 + 3x^2 + 3x + 1 - 1, x)) = abs(frac(x(x^2 + 3x + 3), x)) = |x^2 + 3x + 3|$

Soit $h(x) = |x^2 + 3x + 3|$.

La fonction $h$ est continue en tout reel d'ou $h$ est continue en 0. De plus $f(x) = h(x)$ pour tout $x eq.not 0$ donc $lim_(x arrow 0) f(x) = h(3) = 3$.

// Source: XY Plus T1 p.35

=== Exercice 4

Pour tout $x eq.not 4$ et $x eq.not -4$, on a :

$f(x) = frac(x^3 - 3x^2 - 16x + 48, x^2 - 16) = frac(x(x^2 - 16) - 3(x^2 - 16), x^2 - 16) = frac((x - 3)(x^2 - 16), x^2 - 16) = x - 3$

1) La fonction $g_1$ definie sur $]0, +infinity[$ par $g_1(x) = x - 3$ est affine donc continue en tout reel de $]0, +infinity[$ d'ou $g_1$ est continue en 4.

Aussi pour tout $x in ]0, +infinity[ backslash {4}$ on a $g_1(x) = f(x)$ donc $lim_(x arrow 4) f(x) = g_1(4) = 1$.

La fonction $f$ est continue en 4 si et seulement si $lim_(x arrow 4) f(x) = f(4) = a$.

Ainsi : pour $a = 1$, $f$ continue en 4.

2) La fonction $g_2$ definie sur $]-infinity, 0[$ par $g_2(x) = x - 3$ est affine donc continue en tout reel de $]-infinity, 0[$ d'ou $g_2$ est continue en $-4$.

Aussi pour tout $x in ]-infinity, 0[ backslash {-4}$ on a $g_2(x) = f(x)$ donc $lim_(x arrow -4) f(x) = g(-4) = -7$.

La fonction $f$ est continue en $-4$ si et seulement si $lim_(x arrow -4) f(x) = f(-4) = b$ c'est a dire pour $b = -7$, $f$ est continue en $-4$.

=== Exercice 5

$ f(x) = cases(
  frac(x^3 - 8, x - 2) "si" x < 2,
  frac(sqrt(x - 1) - 1, x - 2) "si" x > 2
) $

1) Pour tout $x < 2$ on a : $f(x) = frac(x^3 - 2^3, x - 2) = frac((x - 2)(x^2 + 2x + 4), x - 2) = x^2 + 2x + 4$.

Soit $g$ la fonction definie sur $]-infinity, 2]$ par $g(x) = x^2 + 2x + 4$.

$g$ est une fonction polynome donc continue sur $]-infinity, 2]$ d'ou $g$ est continue a gauche en 2.

Pour tout $x in ]-infinity, 2[$, $g(x) = f(x)$ donc $lim_(x arrow 2^-) f(x) = g(2) = 12$.

2) Pour tout $x > 2$ on a :

$f(x) = frac(sqrt(x - 1) - 1, x - 2) = frac((sqrt(x - 1) - 1)(sqrt(x - 1) + 1), (x - 2)(sqrt(x - 1) + 1)) = frac(x - 2, (x - 2)(sqrt(x - 1) + 1)) = frac(1, sqrt(x - 1) + 1)$

Soit $h$ la fonction definie sur $[2, +infinity[$ par $h(x) = frac(1, sqrt(x - 1) + 1)$.

la fonction $x arrow.r.bar sqrt(x - 1) + 1$ est continue et ne s'annule pas sur $[2, +infinity[$,

donc la fonction $h$ est continue sur $[2, +infinity[$ et en particulier $h$ est continue a droite en 2 et pour tout $x in ]2, +infinity[$, $h(x) = f(x)$ donc

$lim_(x arrow 2^+) f(x) = h(2) = frac(1, sqrt(2 - 1) + 1) = frac(1, 2)$.

// Source: XY Plus T1 p.36

3) $lim_(x arrow 2^+) f(x) eq.not lim_(x arrow 2^-) f(x)$ donc $f$ n'admet pas de limite en 2.

4) Puisque $f$ n'admet pas de limite en 2 donc $f$ n'est pas prolongeable par continuite en 2.

=== Exercice 6

_Rappel :_
Pour tout $x$ reel, il existe un entier relatif unique $n$ tel que $n lt.eq x < n + 1$. La partie entiere de $x$ est $E(x) = n$.

1) La fonction $f$ est definie sur $RR$.

Pour toute valeur $x$ d'un intervalle $[n, n + 1[$ on a $E(x) = n$ et

il en resulte que pour tout reel $x$ de $[n, n + 1[$, $f(x) = n dot x$.

La fonction $f$ est une fonction polynome (lineaire) sur tout intervalle $[n, n + 1[$ donc $f$ est continue sur tout intervalle $[n, n + 1[$ (avec $n in ZZ$)

c'est a dire $f$ est continue sur chaque intervalle $]n, n + 1[$ et continue a droite pour $x_0 = n$.

La fonction $x arrow.r.bar n dot x$ etant continue sur $RR$ donc $lim_(x arrow (n+1)^-) n dot x = n(n + 1)$ et par suite $lim_(x arrow (n+1)^-) f(x) = n(n + 1)$.

D'autre part, dans $[n + 1, n + 2[$ on a $f(x) = (n + 1) dot x$.

$lim_(x arrow (n+1)^+) f(x) = f(n + 1) = (n + 1)^2$

or $n(n + 1) = (n + 1)^2 arrow.l.r.double (n + 1)(n - n - 1) = 0 arrow.l.r.double n = -1$ et en remplacant $n$ par $-1$ on trouve $lim_(x arrow 0^-) f(x) = lim_(x arrow 0^+) f(x) = 0$ c'est a dire $f$ est continue en 0.

Conclusion :
- Pour tout $n in ZZ$, $f$ est continue sur tout intervalle $]n, n + 1[$ c'est a dire $f$ est continue pour toute valeur reelle non entiere.
- $f$ est continue en 0.
- $f$ est continue a droite pour les valeurs entieres non nulles de $x$.

2) $g(x) = frac(4, E(x))$

La fonction $g$ est definie pour les valeurs de $x$ telles que $E(x) eq.not 0$ donc l'ensemble de definition de $f$ est $D = ]-infinity, 0[ union [1, +infinity[$

Pour toute valeur $x$ d'un intervalle $[n, n + 1[$ ou $n in ZZ^*$, on a $E(x) = n$ et par

// Source: XY Plus T1 p.37

suite $f(x) = frac(4, n)$ donc $f$ est constante sur chaque intervalle $[n, n + 1[$ et par consequent continue pour toute valeur de l'intervalle $]n, n + 1[$ et continue a droite pour $x_0 = n$.

On a aussi $lim_(x arrow (n+1)^-) f(x) = frac(4, n)$ (fonction constante sur $[n, n + 1[$).

D'autre part dans $[n + 1, n + 2[$ on a $f(x) = frac(4, n + 1)$ (constante donc continue)

d'ou $lim_(x arrow (n+1)^+) f(x) = frac(4, n + 1)$.

Pour tout $n in ZZ^*$, on a $frac(4, n) eq.not frac(4, n + 1)$ donc, les limites a gauche et a droite en $x_0 = n + 1$ etant differentes, $f$ n'est pas continue en $x_0 = n + 1$.

*Conclusion :*
- $f$ est continue sur tout intervalle $]n, n + 1[$ ou $n in ZZ^*$.
- $f$ est continue a droite pour les valeurs entieres non nulles de $x$.

=== Exercice 7

1) Pour tout

$x in RR backslash {-2, 2}$ on a $f(x) = frac((x - 2)(x^2 - 2x - 3), (x - 2)|x + 1|) = frac(x^2 - 2x - 3, |x + 1|)$

$lim_(x arrow 2) f(x) = lim_(x arrow 2) frac(x^2 - 2x - 3, |x + 1|) = -1 = f(2)$ donc $f$ est continue en 2

2)

$x in RR backslash {-2, 2}$ on a $f(x) = frac(x^2 - 2x - 3, |x + 1|) = frac((x + 1)(x - 3), |x + 1|)$

$lim_(x arrow (-1)^+) f(x) = lim_(x arrow (-1)^+) (x - 3) = -4$

$lim_(x arrow (-1)^-) f(x) = lim_(x arrow (-1)^-) -(x - 3) = 4$

Donc $f$ n'admet pas de limite en $-1$.

3) Pour $x in ]-1, 0[$ on a $-x in ]0, 1[$ donc $E(-x) = 0$ d'ou $g(x) = -f(x)$

$lim_(x arrow (-1)^+) g(x) = lim_(x arrow (-1)^+) -f(x) = 4$

Pour $x in ]-2, -1[$ on a $-x in ]1, 2[$ donc $E(-x) = 1$ d'ou $g(x) = 8 - f(x)$

$lim_(x arrow (-1)^-) g(x) = lim_(x arrow (-1)^-) (8 - f(x)) = 4$ donc $lim_(x arrow -1) g(x) = 4$

=== Exercice 8

// Source: XY Plus T1 p.37-38

I) 1) a- Pour tout $x in RR backslash {1}$ ; $f(x) = frac((x - 1)(3x^2 + 1), x - 1) = 3x^2 + 1$

$lim_(x arrow 1) f(x) = lim_(x arrow 1) (3x^2 + 1) = 4 in RR$

Donc $f$ est prolongeable par continuite en 1. On note ce prolongement $F$.

b-

$F(x) = f(x) = 3x^2 + 1$ si $x eq.not 1$

$F(1) = 4$

donc $F(x) = 3x^2 + 1$ pour tout reel $x$

// Source: XY Plus T1 p.38

2) a-

#figure(
  cetz.canvas({
    import cetz.draw: *
    // Axes
    line((-3.5, 0), (3.5, 0), mark: (end: ">"))
    line((0, -3.5), (0, 5), mark: (end: ">"))
    content((3.8, 0), $x$)
    content((0, 5.3), $y$)
    // Courbe F(x) = 3x^2 + 1 (parabole)
    bezier((-1.5, 7.75*0.6), (-1, 4*0.6), (-1.2, 5.5*0.6))
    bezier((-1, 4*0.6), (0, 0.6), (-0.5, 1.5*0.6))
    bezier((0, 0.6), (1, 4*0.6), (0.5, 1.5*0.6))
    bezier((1, 4*0.6), (1.5, 7.75*0.6), (1.2, 5.5*0.6))
    content((1.6, 4.8), $C_F$)
    // Courbe h(x) = 1/x (branche positive)
    bezier((0.3, 3.3), (1, 1), (0.5, 1.5))
    bezier((1, 1), (3, 0.33), (2, 0.5))
    // Courbe h(x) = 1/x (branche negative)
    bezier((-0.3, -3.3), (-1, -1), (-0.5, -1.5))
    bezier((-1, -1), (-3, -0.33), (-2, -0.5))
    content((2.5, 0.8), $C_h$)
    // Graduation
    line((1, -0.1), (1, 0.1))
    content((1, -0.3), $1$)
    line((-1, -0.1), (-1, 0.1))
    content((-1, -0.3), $-1$)
  }),
  caption: [Courbes de $F(x) = 3x^2 + 1$ et $h(x) = frac(1, x)$]
)

b- La courbe de $h$ coupe la courbe de $F$ en un seul point donc l'equation $F(x) = frac(1, x)$ admet une seule solution $alpha$ dans $RR$.

c- $F(x) = frac(1, x)$ eq. a $3x^2 + 1 = frac(1, x)$ eq. a $3x^3 + x - 1 = 0$ donc $alpha$ est la seule solution de l'equation $3x^3 + x - 1 = 0$

d- On pose $S(x) = 3x^3 + x - 1$

On a $S$ est continue sur $[0, 1]$ ; $S(0) = -1$ ; $S(1) = 1$

$S(0) times S(1) < 0$ donc $alpha in ]0, 1[$

$S(0.5) = -0.125$ et $S(0.6) = 0.248$ donc $0.5 < alpha < 0.6$

// Source: XY Plus T1 p.38-39

II) 1) Pour tout $x in RR^*$ on a $g(x) = frac(3x^2 + 1 - 1 - x^3, x^2) = frac(3x^2 + 1 - 1, x^2(sqrt(3x^2 + 1) + 1)) - x = frac(3, sqrt(3x^2 + 1) + 1) - x$

2) $lim_(x arrow 0) g(x) = lim_(x arrow 0) frac(3, sqrt(3x^2 + 1) + 1) - x = frac(3, 2) = g(0)$ donc $g$ est continue en 0

3) a-

$a$ et $b in RR_+$ tel que $a < b$. On a $3a^2 + 1 < 3b^2 + 1$ donc

$1 + sqrt(3a^2 + 1) < 1 + sqrt(3b^2 + 1)$ d'ou $g(a) > g(b)$

Donc $g$ est decroissante sur $RR_+$

// Source: XY Plus T1 p.39

b-

$0 lt.eq x lt.eq 1$ et $g$ est decroissante donc $g(1) lt.eq g(x) lt.eq g(0)$

d'ou $0 lt.eq g(x) lt.eq frac(3, 2)$ donc $g$ est bornee sur $[0, 1]$

c) Pour tout $x in [0, 1]$ on a $0 lt.eq g(x) lt.eq frac(3, 2)$ donc l'equation $g(x) = 0$ n'admet pas de solutions dans $[0, 1]$.

=== Exercice 9

$bold([A])$ 1) Pour tout $x in D_f = [-3, 3]$ on a $-x in D_f$

et $f(-x) = -x sqrt(3 - x) = -f(x)$ d'ou $f$ est impaire.

2) a)

Pour tout $x in [-3, 3]$ ; $(f(x))^2 - 4 = x^2(3 - |x|) - 4 = -|x|^3 + 3|x|^2 - 4$

$ = -(|x| + 1)(|x| - 2)^2 $

b)

Pour tout $x in [-3, 3]$ on a $(f(x))^2 - 4 lt.eq 0$ donc $f(x)^2 lt.eq 4$ d'ou $-2 lt.eq f(x) lt.eq 2$

c) $x arrow.r.bar 3 - |x|$ est continue positive sur $[-3, 3]$ donc $x arrow.r.bar sqrt(3 - |x|)$ est continue sur $[-3, 3]$ d'ou $f$ est continue sur $[-3, 3]$ et par suite

$f([-3, 3]) = [m, M]$ ou $m = min f$ et $M = max f$.

Or pour tout $x in [-3, 3]$ on a $-2 lt.eq f(x) lt.eq 2$ et $f(2) = 2$ et $f(-2) = -2$ donc

$f([-3, 3]) = [-2, 2]$.

$bold([B])$ 1) $g(-2) = -7$, $g(0) = 1$, $g(1) = -1$ et $g(2) = 1$

2) $g$ est continue sur $[-2, 0]$ / $g(-2) times g(0) < 0$ donc l'equation $g(x) = 0$ admet au moins une solution dans $[-2, 0]$.

De meme l'equation $g(x) = 0$ admet au moins une solution dans chacun des intervalles $[0, 1]$ et $[1, 2]$ or $g$ est un polynome de degre 3 donc l'equation $g(x) = 0$ admet dans $RR$ exactement 3 solutions.

3) $g$ est continue sur $[0, 1]$ tel que $g(0.4) = 0.104$ et $g(0.5) = -0.125$ donc $0.5 < alpha < 0.6$.

// Source: XY Plus T1 p.39-40

$bold([C])$ 1) $lim_(x arrow (-3)^+) f(x) = frac(2, 5) = f(-3)$ et $lim_(x arrow (-3)^-) f(x) = lim_(x arrow (-3)^-) frac(x + 5, 2 - x) = frac(2, 5) = f(-3)$ donc $f$ est continue en $-3$.

2) a- $x in [0, 2[$ on a $h(x) = frac(f(x) - 2, x - 2)$

// Source: XY Plus T1 p.40

or $(f(x))^2 - 4 = -(x - 2)^2(x + 1)$

donc $h(x) = frac((2 - x)(x + 1), f(x) + 2)$

b- $lim_(x arrow 2^-) h(x) = lim_(x arrow 2^-) frac((2 - x)(x + 1), f(x) + 2) = 0 eq.not h(2)$

$lim_(x arrow 2^+) h(x) = 1 = h(2)$

donc $h$ est continue a droite en 2 n'est pas continue a gauche en 2.
