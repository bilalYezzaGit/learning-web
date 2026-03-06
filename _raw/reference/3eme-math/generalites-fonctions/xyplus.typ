// =============================================================================
// Module 1 : Generalites sur les fonctions — XY PLUS (CAEU Med Ali)
// Programme : 3eme Math (Tunisie)
// Source : XY Plus Tome 1, CAEU Med Ali, pages 5-14
// Auteurs : Zied Belhadj, Lassaad Kallel
// Edition 2022
// =============================================================================

#set text(lang: "fr")

= XY Plus — Chapitre 1 : Generalites sur les Fonctions

// Source: XY Plus T1 p.5

== Resume de cours

=== I. Sens de variation d'une fonction

#strong[Definitions]

#block(stroke: 0.5pt, inset: 8pt, radius: 4pt, fill: rgb("#f0f7ff"))[
- Une fonction $f$ est dite *croissante* sur un intervalle $I$ si, et seulement si :

  pour tous reels $a$ et $b$ de $I$ tels que $a lt.eq b$, on a $f(a) lt.eq f(b)$.

- Une fonction $f$ est dite *decroissante* sur un intervalle $I$ si, et seulement si :

  pour tous reels $a$ et $b$ de $I$ tels que $a lt.eq b$, on a $f(a) gt.eq f(b)$

- Une fonction $f$ est dite *constante* sur un intervalle $I$ si et seulement si,
  pour tous reels $a$ et $b$ de $I$ on a $f(a) = f(b)$.

- Une fonction est dite _monotone_ sur un intervalle $I$ lorsqu'elle est
  croissante sur $I$ ou decroissante sur $I$.
]

=== II. Fonctions paires -- Fonctions impaires

// Source: XY Plus T1 p.5

Soit une fonction $f$ definie sur un ensemble $D$ *symetrique par rapport a zero*, c'est a dire que pour tout $x$ de $D$, $(-x)$ appartient a $D$.

#block(stroke: 0.5pt, inset: 8pt, radius: 4pt, fill: rgb("#f0f7ff"))[
#table(
  columns: (auto, auto, auto),
  align: (center, center, center),
  [*Parite de $f$*], [*Definition*], [*Element de symetrie \ de la courbe $cal(C)$*],
  [Paire], [$f(-x) = f(x)$], [L'axe des ordonnees],
  [Impaire], [$f(-x) = -f(x)$], [L'origine du repere],
)
]

#block(stroke: 0.5pt, inset: 8pt, radius: 4pt, fill: rgb("#fff7f0"))[
*Consequence :*
_Si $f$ est paire ou impaire, alors on peut reduire l'etude de $f$ a $RR_+ sect D$._
]

=== III. Restriction d'une fonction

// Source: XY Plus T1 p.5

Soit $f$ une fonction definie sur un ensemble $E$
et $cal(C)$ sa representation graphique
dans un repere $(O, arrow(i), arrow(j))$. Soit $D$ une partie de $E$.
On appelle *restriction* de la fonction $f$ a $D$,

la fonction $g$ definie sur $D$ par $g(x) = f(x)$, pour tout $x in D$.

// Figure: courbe Cf avec restriction Cg sur un sous-intervalle
#import "@preview/cetz:0.3.4"
#cetz.canvas({
  import cetz.draw: *
  // Axes
  line((-0.5, 0), (5.5, 0), mark: (end: ">"))
  line((0, -1.5), (0, 3), mark: (end: ">"))
  content((5.5, -0.3), $x$)
  content((-0.3, 3), $y$)
  content((-0.3, -0.3), $O$)
  // Courbe Cf (partie complete)
  bezier((0.5, 2.5), (2.5, -1), (1.2, 0.5), (2, -0.8), stroke: gray + 0.8pt)
  bezier((2.5, -1), (5, 2), (3.2, -0.8), (4.5, 1), stroke: gray + 0.8pt)
  content((5.2, 2.2), $cal(C)_f$)
  // Points a et b
  content((1.5, -0.3), $a$)
  content((4, -0.3), $b$)
  // Restriction Cg (partie en gras)
  bezier((1.5, 0.8), (2.5, -1), (2, 0), (2.3, -0.8), stroke: black + 1.5pt)
  bezier((2.5, -1), (4, 1.2), (3, -0.8), (3.5, 0.5), stroke: black + 1.5pt)
  content((3.5, -1.2), $cal(C)_g$)
})

// Source: XY Plus T1 p.6

=== IV. Variations et operations sur les fonctions

#strong[Operations sur les fonctions :] Soit $D$ une partie de $RR$.

#block(stroke: 0.5pt, inset: 8pt, radius: 4pt, fill: rgb("#f0f7ff"))[
#table(
  columns: (auto, auto, auto),
  align: (center, center, center),
  [*Operations*], [*Les fonctions $f$ et $g$ sont \ definies sur $D$*], [*Definitions \ (pour tout $x in D$)*],
  [Addition], [$f + g$], [$(f + g)(x) = f(x) + g(x)$],
  [Multiplication], [$f times g$], [$(f dot g)(x) = f(x) dot g(x)$],
  [Multiplication par \ un reel non nul], [$lambda f$], [$(lambda f)(x) = lambda f(x)$],
)
]

#strong[Variations de la somme de deux fonctions]

#block(stroke: 0.5pt, inset: 8pt, radius: 4pt, fill: rgb("#e8f5e9"))[
Si les fonctions $f$ et $g$ ont *le meme* sens de variation sur un intervalle $I$, alors
leur *somme* a *le meme* de variation que chacune d'elles.
]

=== V. Majorant -- minorant

// Source: XY Plus T1 p.6

#strong[Maximum, minimum]

Soit $f$ une fonction definie sur un ensemble $D$.

#block(stroke: 0.5pt, inset: 8pt, radius: 4pt, fill: rgb("#f0f7ff"))[
- S'il existe un reel $x_0$ appartenant a $D$
  tel que pour tout $x$ de $D$, $f(x) lt.eq f(x_0)$.
  On dit que la fonction $f$ admet sur $D$
  un *maximum* en $x_0$ ou encore que
  $f(x_0)$ est un maximum de $f$ sur $D$.

- S'il existe un reel $x_0$ appartenant a $D$
  tel que pour tout $x$ de $D$, $f(x) gt.eq f(x_0)$.
  On dit que la fonction $f$ admet sur $D$
  un *minimum* en $x_0$ ou encore que
  $f(x_0)$ est un minimum de $f$ sur $D$.
]

// Figures: graphique d'un maximum et d'un minimum
#import "@preview/cetz:0.3.4"
#cetz.canvas({
  import cetz.draw: *
  // Maximum figure
  line((-0.5, 0), (5, 0), mark: (end: ">"))
  line((0, -0.5), (0, 3.5), mark: (end: ">"))
  content((5, -0.3), $x$)
  content((-0.3, 3.5), $f(x)$)
  content((-0.3, -0.3), $O$)
  // Courbe avec maximum
  bezier((0.5, 0.5), (3.5, 3), (1.5, 1), (2.5, 3.2))
  bezier((3.5, 3), (4.8, 1), (4.2, 3), (4.5, 1.5))
  // Ligne horizontale y = f(x0)
  line((0, 3), (3.5, 3), stroke: (dash: "dashed"))
  line((3.5, 0), (3.5, 3), stroke: (dash: "dashed"))
  content((3.5, -0.3), $x_0$)
  content((-0.5, 3), $f(x_0)$)
  content((5, 2), $y = f(x)$)
  // Vecteurs i et j
  content((0.4, -0.3), $arrow(i)$)
  content((-0.3, 0.4), $arrow(j)$)
})

#cetz.canvas({
  import cetz.draw: *
  // Minimum figure
  line((-0.5, 0), (5, 0), mark: (end: ">"))
  line((0, -0.5), (0, 3.5), mark: (end: ">"))
  content((5, -0.3), $x$)
  content((-0.3, 3.5), $f(x)$)
  content((-0.3, -0.3), $O$)
  // Courbe avec minimum
  bezier((0.5, 3), (2.5, 0.5), (1.5, 2.5), (2, 0.5))
  bezier((2.5, 0.5), (4.8, 3), (3.5, 0.5), (4, 2.5))
  // Ligne horizontale y = f(x0)
  line((0, 0.5), (2.5, 0.5), stroke: (dash: "dashed"))
  line((2.5, 0), (2.5, 0.5), stroke: (dash: "dashed"))
  content((2.5, -0.3), $x_0$)
  content((-0.5, 0.5), $f(x_0)$)
  content((5, 2.5), $y = f(x)$)
  content((0.4, -0.3), $arrow(i)$)
  content((-0.3, 0.4), $arrow(j)$)
})

#strong[Definition :]

#block(stroke: 0.5pt, inset: 8pt, radius: 4pt, fill: rgb("#f0f7ff"))[
Soit $f$ une fonction definie sur un ensemble $D$.
- La fonction $f$ est dite *majoree* sur $D$ s'il existe un reel $M$ tel que pour tout $x$
  de $D$, $f(x) lt.eq M$
- La fonction $f$ est dite *minoree* sur $D$ s'il existe un reel $m$ tel que pour tout $x$
  de $D$, $f(x) gt.eq m$.
- La fonction $f$ est dite *bornee* sur $D$ s'il existe deux reels $m$ et $M$ tel que
  pour tout $x$ de $D$, $m lt.eq f(x) lt.eq M$.
  Une fonction $f$ est bornee sur un ensemble $D$, si elle est a la fois majoree et
  minoree.
]

// Source: XY Plus T1 p.7

=== VI. Construction d'une courbe a partir de celle d'une fonction de reference

Soit $f$ une fonction definie sur un ensemble $D$ et representee dans un
repere orthogonal $(O, arrow(i), arrow(j))$.

#block(stroke: 0.5pt, inset: 8pt, radius: 4pt, fill: rgb("#f0f7ff"))[
#table(
  columns: (auto, auto, auto),
  align: (center, center, left),
  [*Fonctions \ definies par*], [*Conditions \ d'existence*], [*Transformations permettant de passer \ de $cal(C)_f$ a $cal(C)_g$*],
  [$g(x) = f(x) + b$], [$x in D$], [Translation de vecteur $b arrow(j)$],
  [$g(x) = f(x - a)$], [$(x - a) in D$], [Translation de vecteur $a arrow(i)$],
  [$g(x) = -f(x)$], [$x in D$], [Symetrie d'axe $(O, arrow(i))$],
  [$g(x) = |f(x)|$], [$x in D$], [- $cal(C)_f = cal(C)_g$ lorsque $f(x) gt.eq 0$ \ - Symetrie d'axe $(O, arrow(i))$ lorsque $f(x) lt.eq 0$],
  [$g(x) = f(|x|)$], [$|x| in D$], [$g$ est paire, donc : \
   - sur $D sect RR_+$, $cal(C)_f = cal(C)_g = Gamma_1$ \
   - sur $D sect RR_-$, symetrique de $Gamma_1$ par \ rapport a l'axe $(O, arrow(j))$],
)
]

=== VII. Fonctions affines par intervalles

// Source: XY Plus T1 p.7

#strong[Definition :]

#block(stroke: 0.5pt, inset: 8pt, radius: 4pt, fill: rgb("#f0f7ff"))[
On appelle fonction affine par intervalles toute fonction definie sur une
reunion d'intervalles et telle que sa restriction a chacun de ces intervalles
soit affine.
La courbe representative d'une fonction affine par intervalles est une
reunion de demi-droites ou de segments de droites.
]

#strong[Fonction Partie entiere :]

#block(stroke: 0.5pt, inset: 8pt, radius: 4pt, fill: rgb("#f0f7ff"))[
- On appelle partie entiere d'un reel $x$ et on note $E(x)$, le plus grand entier
  inferieur ou egal a $x$.
- On appelle fonction partie entiere la fonction qui a tout reel associe sa partie
  entiere.
- Soit $E$ la fonction partie entiere.
  Pour tout reel $x$, il existe un entier $n in ZZ$ tel que : $n lt.eq x < n + 1$ et on a
  $E(x) = n$.
]

=== VIII. La fonction $x arrow.r.bar sqrt(f(x))$

// Source: XY Plus T1 p.7

Soit $f$ une fonction definie et positive sur un intervalle $I$.

#block(stroke: 0.5pt, inset: 8pt, radius: 4pt, fill: rgb("#e8f5e9"))[
- Si $f$ est croissante sur $I$ alors $sqrt(f)$ est croissante sur $I$.
- Si $f$ est decroissante sur $I$ alors $sqrt(f)$ est decroissante sur $I$.
- Si $f$ est majoree sur $I$ alors $sqrt(f)$ est majoree sur $I$.
]

// =========================================================================
// Source: XY Plus T1 p.8-9

== Enonces

=== Exercice 1
// Source: XY Plus T1 p.8

Soit la fonction $f : RR arrow.r RR$

$ x arrow.r.bar frac(6x^2 + x - 2, |1 - x^2| + x^2 - 1) $

1) Montrer que le domaine de definition de $f$ est $D = RR \\ [-1, 1]$

2) Simplifier $f(x)$ pour tout $x in D$.

3) a) Verifier que pour tout $x in D$, $f(x) = 3 + frac(2, x - 1)$

#h(1em) b) Etudier les variations de $f$ sur son ensemble de definition.

=== Exercice 2
// Source: XY Plus T1 p.8

Soit $f$ la fonction definie sur $RR \\ {1}$ par : $f(x) = frac(-x + 3, x - 1)$.

1) a) Etudier le sens de variations de $f$ sur $]-infinity, 1[$ et sur $]1, +infinity[$

#h(1em) b) Tracer $C_f$ la courbe de $f$ dans un r.o.n $(O, arrow(i), arrow(j))$.

2) Tracer la parabole $P$ d'equation $y = x^2 - 3$ sur le meme repere que $C_f$.

3) a) Determiner les coordonnees des points d'intersections de $C_f$ et $P$.

#h(1em) b) Resoudre graphiquement : $-1 < f(x) lt.eq x^2 - 3$

4) Soit $g$ la fonction definie par : $cases(g(x) = x^2 - 3 #h(1em) "si" #h(0.5em) x in ]-infinity\, 2], g(x) = f(x) #h(1em) "si" #h(0.5em) x in [2\, +infinity[)$

#h(1em) a) Tracer la courbe $C_g$ de $g$.

#h(1em) b) Montrer que $g$ est minoree sur $]-infinity, 2]$ et qu'elle est majoree sur $[2, +infinity[$.

=== Exercice 3
// Source: XY Plus T1 p.8

Soit $f$ une fonction definie par : pour tout $x in RR$ : $3f(x) + f(-x) = 4x^3 + 2x$.

1) Montrer que $f$ est impaire.

2) a) Donner l'expression de $f(x)$ sur $RR$.

#h(1em) b) Etudier le sens de variations de la fonction $g$ definie sur $RR$ par $g(x) = 2x^3$.

#h(1em) c) En deduire le sens de variations de $f$ sur $RR$.

3) Soit $h$ la fonction definie par $h(x) = frac(1, sqrt(f(x)))$.

#h(1em) a) Determiner le domaine de definition $D_h$ de $h$ et etudier son sens de
   variations de $h$ sur $D_h$.

#h(1em) b) Montrer que la fonction $h$ est bornee sur $[1, +infinity[$.

=== Exercice 4
// Source: XY Plus T1 p.9

Soit $f$ la fonction definie sur $RR$ par $f(x) = frac(2x, x^2 + 1)$.

1) Montrer que pour tout $x in RR$ : $2|x| lt.eq x^2 + 1$.

2) En deduire que $f$ est bornee sur $RR$.

3) Etudier le sens de variations de $f$ sur $[1, +infinity[$.

4) Soit $g$ la fonction definie sur $RR$ par : $g(x) = frac((x + 1)^2, x^2 + 1)$.

#h(1em) a) Verifier que pour tout $x in RR$ : $g(x) = f(x) + 1$.

#h(1em) b) Etudier le sens de variations de $g$ sur $[1, +infinity[$.

#h(1em) c) On designe par $C_f$ et $C_g$ les courbes respectives de $f$ et $g$ dans un repere
   orthonorme $(O, arrow(i), arrow(j))$. Montrer que $C_g$ se deduit de $C_f$ par une transformation
   simple que l'on determinera.

=== Exercice 5
// Source: XY Plus T1 p.9

Soit $f$ la fonction definie par : $f(x) = frac(sqrt(x - 2) - 1, x^2 - 4x + 3)$.

1) a) Determiner le domaine de definition $D_f$ de $f$.

#h(1em) b) Montrer que pour tout $x in D_f$ : $f(x) = frac(1, (x - 1)(sqrt(x - 2) + 1))$.

2) Soit $g$ la restriction de $f$ sur $[4, +infinity[$.

#h(1em) a) Montrer que $g$ est minoree sur $[4, +infinity[$.

#h(1em) b) Montrer que $g$ est decroissante sur $[4, +infinity[$ et en deduire qu'elle est bornee.

=== Exercice 6
// Source: XY Plus T1 p.9

On considere la fonction $f$ de $RR$ dans $RR$ definie par $f(x) = E(x) - 2E(frac(x, 2))$.

1) Donner les expressions de $f(x)$ sur l'intervalle $[-1 ; 2]$.

2) Tracer la courbe $(C_0)$ de la restriction de $f$ a l'intervalle $[-1 ; 2]$.

=== Exercice 7
// Source: XY Plus T1 p.9

Soit $f$ la fonction definie par $f(x) = E(x) + sqrt(x - E(x))$.

1) Montrer que $f$ est definie sur $RR$.

2) Tracer la courbe $(C_0)$ de la restriction de $f$ a l'intervalle $[0, 1]$.

3) Montrer que pour tout reel $x$, $f(x + k) = k + f(x)$. #h(1em) ($k in ZZ$)

4) En deduire le trace de la restriction de $f$ a l'intervalle $[-2, 3]$.

=== Exercice 8
// Source: XY Plus T1 p.9

On considere $f$ de $]0, +infinity[$ dans $RR$ definie par $f(x) = x dot E(frac(1, x))$.

1) Montrer que pour tout reel $x in ]0, +infinity[$ et pour tout entier $n in NN$ : $f(x) = n x$.

2) Tracer la courbe de $f$ dans un repere orthonorme $(O, arrow(i), arrow(j))$.

// =========================================================================
// Source: XY Plus T1 p.10-14

== Corriges

=== Exercice 1 -- Corrige
// Source: XY Plus T1 p.10

$f(x) = frac(6x^2 + 4x - 2, |1 - x^2| + x^2 - 1)$

*1)* $f$ est definie si et seulement si $|1 - x^2| + x^2 - 1 eq.not 0$

Or $|1 - x^2| + x^2 - 1 = 0$ signifie $|1 - x^2| = 1 - x^2$ signifie $1 - x^2 gt.eq 0$

signifie $x in [-1, 1]$.

$E = D_f = RR \\ [-1, 1] = ]-infinity, -1[ union ]1, +infinity[$.

*2)* Pour tout $x in D_f$ on a $1 - x^2 < 0$ d'ou $|1 - x^2| = x^2 - 1$

$ f(x) = frac(6(x + 1)(x - frac(1, 3)), x^2 - 1 + x^2 - 1) = frac((x + 1)(6x - 2), 2(x - 1)(x + 1)) = frac(3x - 1, x - 1) $

*3)* a) Pour tout $x in E$, $f(x) = frac(3(x - 1) + 2, x - 1) = frac(3(x - 1), x - 1) + frac(2, x - 1) = 3 + frac(2, x - 1)$.

b) Soient $a$ et $b$ deux reels de $]1, +infinity[$ tel que $a < b$.

$1 < a < b$ donc $0 < a - 1 < b - 1$

d'ou $frac(1, a - 1) > frac(1, b - 1)$ car $a - 1$ et $b - 1$ sont de meme signe.

$3 + frac(1, a - 1) > 3 + frac(1, b - 1)$ donc $f(a) > f(b)$ d'ou $f$ est decroissante sur $]1, +infinity[$.

De meme on trouve que $f$ est decroissante sur $]-infinity, -1[$.

=== Exercice 2 -- Corrige
// Source: XY Plus T1 p.10-11

*1)* a) On verifie que pour tout $x in RR \\ {1}$ que $f(x) = -1 + frac(2, x - 1)$ et on montre comme a
l'exercice 1 que $f$ est decroissante sur $]-infinity, 1[$ et sur $]1, +infinity[$

b) et 2) on trace l'allure de $C_f$ et $P$ en utilisant un tableau de valeurs

// TODO: figure complexe — Graphique montrant la courbe Cf (hyperbole avec asymptotes x=1 et y=-1) et la parabole P (y = x^2 - 3) dans un meme repere, avec les points d'intersection M1, M2, M3

*3)* a) $M(x, y) in C_f sect P$ ssi $cases(y = f(x), y = x^2 - 3)$ ssi $cases(y = f(x), frac(-x + 3, x - 1) = x^2 - 3)$ ssi $cases(y = f(x), x(x^2 - x - 2) = 0)$

On trouve que $C_f sect P = {M_1(-1, -2), M_2(0, -3), M_3(2, 1)}$.

b) On cherche les abscisses des points de $C_f$ situes au dessus de l'asymptote
horizontale et au dessous ou sur la parabole $P$

Donc l'ensemble des solutions est l'intervalle $[2, +infinity[$

*4)* a) Voir figure

b) Pour tout $x in ]-infinity, 2]$, $x^2 gt.eq 0$ signifie que $x^2 - 3 gt.eq -3$ donc $g$ est minoree par $-3$
sur $]-infinity, 2]$

Sur $[2, +infinity[$ $g$ est decroissante car $f$ est decroissante sur $]1, +infinity[$

d'ou pour tout $x in [2, +infinity[$ $g(x) lt.eq g(2)$

donc $g$ est majoree sur $[2, +infinity[$ par $g(2) = 1$

=== Exercice 3 -- Corrige
// Source: XY Plus T1 p.11

*1)* On a pour tout $x in RR$ : $f(-x) = 4x^3 + 2x - 3f(x)$ donc $f(-x) = -4x^3 - 2x - 3f(-x)$

d'ou pour tout $x in RR$ : $f(-x) + f(x) = -3(f(-x) + f(x))$

ce qui implique que pour tout $x in RR$ : $f(-x) = -f(x)$ d'ou $f$ est impaire.

*2)* a) On a pour tout $x in RR$ : $f(-x) + 3f(x) = 4x^3 + 2x$ or $f$ est impaire,

donc pour tout $x in RR$ : $-f(x) + 3f(x) = 4x^3 + 2x$

d'ou pour tout $x in RR$ : $f(x) = 2x^3 + x$

b) On montre que $g$ est croissante sur $RR$.

c) On a $g$ est croissante sur $RR$ et la fonction $x arrow.r.bar x$ est aussi croissante sur $RR$

(fonction affine de coefficient $1 > 0$) d'ou $f$ est croissante sur $RR$.

*3)* a) $h$ est definie ssi $f(x) > 0$ ssi $x(2x^2 + 1) > 0$ ssi $x > 0$

car pour tout $x in RR$ $2x^2 + 1 > 0$ d'ou $D_h = ]0, +infinity[$

On a $f$ est croissante sur $]0, +infinity[$ d'ou $sqrt(f)$ est croissante sur $]0, +infinity[$ et

par suite $h = frac(1, sqrt(f))$ est decroissante sur $]0, +infinity[$

b) On a pour tout $x in ]0, +infinity[$ $h(x) > 0$ et $h$ est decroissante sur $]0, +infinity[$

donc pour tout $x in [1, +infinity[$ $0 < h(x) lt.eq h(1)$ d'ou $h$ est bornee sur $[1, +infinity[$

=== Exercice 4 -- Corrige
// Source: XY Plus T1 p.12

*1)* Pour tout $x in RR$ : $(|x| - 1)^2 gt.eq 0$ ca signifie que $2|x| lt.eq x^2 + 1$.

*2)* Pour tout $x in RR$ : $2|x| lt.eq x^2 + 1$ ca signifie que $|f(x)| lt.eq 1$

donc pour tout $x in RR$ : $-1 lt.eq f(x) lt.eq 1$ d'ou $f$ est bornee sur $RR$

*3)* Soient $a$ et $b$ deux reels de $[1, +infinity[$ tel que $a < b$

On a $f(a) - f(b) = frac(2(a - b)(1 - a b), (a^2 + 1)(b^2 + 1))$ et puisque $1 lt.eq a < b$ alors $1 - a b lt.eq 0$ et $a - b < 0$

et on a $(a^2 + 1)(b^2 + 1) > 0$ d'ou $f(a) - f(b) gt.eq 0$ donc $f$ est decroissante sur $[1, +infinity[$

*4)* a) pour tout $x in RR$ : $g(x) = frac((x + 1)^2, x^2 + 1) = frac(x^2 + 1 + 2x, x^2 + 1) = 1 + frac(2x, x^2 + 1) = 1 + f(x)$

b) On a $f$ est decroissante sur $[1, +infinity[$ donc $g$ est decroissante sur $[1, +infinity[$

c) Soient $M(x, f(x)) in C_f$ et $M'(x, g(x)) in C_g$ : $arrow(M M') = vec(0, 1)$

Donc $C_g$ est l'image de $C_f$ par la translation de vecteur $arrow(u) = vec(0, 1)$

=== Exercice 5 -- Corrige
// Source: XY Plus T1 p.12

*1)* a) $D_f = {x in RR "tel que" : x - 2 gt.eq 0 "et" x^2 - 4x + 3 eq.not 0} = [2, +infinity[ \\ {3}$

b) Pour tout $x in [2, +infinity[ \\ {3}$ : $f(x) = frac((sqrt(x - 2) - 1)(sqrt(x - 2) + 1), (x - 1)(x - 3)(sqrt(x - 2) + 1)) = frac(1, (x - 1)(sqrt(x - 2) + 1))$

*2)* a) pour tout $x in [4, +infinity[$ : $x - 1 > 0$ et $sqrt(x - 2) + 1 > 0$ donc $g$ est minoree par $0$

b) Soient $a$ et $b$ deux reels de $[4, +infinity[$ tel que $a < b$

Donc $0 < a - 1 < b - 1$ et $0 < sqrt(a - 2) + 1 < sqrt(b - 2) + 1$

d'ou $(a - 1)(sqrt(a - 2) + 1) < (b - 1)(sqrt(b - 2) + 1)$ par suite $g(a) > g(b)$

On conclut donc que $g$ est decroissante sur $[4, +infinity[$

On a montre que $g$ est decroissante sur $[4, +infinity[$

D'ou pour tout $x in [4, +infinity[$ : $g(x) lt.eq g(4)$ et par suite $g$ est majoree par $g(4)$

Conclusion pour tout $x in [4, +infinity[$ : $0 < g(x) lt.eq g(4)$ donc $g$ est bornee

=== Exercice 6 -- Corrige
// Source: XY Plus T1 p.12-13

*1)* Si $-1 lt.eq x < 0$ alors $frac(-1, 2) lt.eq frac(x, 2) < 0$ d'ou $E(x) = -1$ et $E(frac(x, 2)) = -1$

Donc $f(x) = -1 - 2(-1) = 1$.

Si $0 lt.eq x < 1$ alors $0 lt.eq frac(x, 2) < frac(1, 2)$, $E(x) = E(frac(x, 2)) = 0$.

Donc $f(x) = 0$.

Si $1 lt.eq x < 2$ donc $frac(1, 2) lt.eq frac(x, 2) < 1$, on a $E(x) = 1$ et $E(frac(x, 2)) = 0$. Donc $f(x) = 1$.

Si $x = 2$, on a $f(x) = 2 - 2 times 1 = 0$.

En resume, sur $[0, 2]$ la fonction $f$ est definie ainsi :

$ cases(
  f(x) = 1 #h(1em) &"si" x in [-1, 0[,
  f(x) = 0 #h(1em) &"si" x in [0, 1[,
  f(x) = 1 #h(1em) &"si" x in [1, 2[,
  f(2) = 0
) $

*2)* Trace de $(C_0)$

// Figure: fonction en escalier sur [-1, 2] avec valeurs 1, 0, 1, 0
#import "@preview/cetz:0.3.4"
#cetz.canvas({
  import cetz.draw: *
  // Axes
  line((-1.5, 0), (2.5, 0), mark: (end: ">"))
  line((0, -0.5), (0, 1.5), mark: (end: ">"))
  content((-0.2, -0.2), $O$)
  // Graduations
  content((-1, -0.3), $-1$)
  content((1, -0.3), $1$)
  content((2, -0.3), $2$)
  content((-0.3, 1), $1$)
  // Segments horizontaux
  line((-1, 1), (0, 1), stroke: 1.2pt)   // f=1 sur [-1, 0[
  line((0, 0), (1, 0), stroke: 1.2pt)   // f=0 sur [0, 1[
  line((1, 1), (2, 1), stroke: 1.2pt)   // f=1 sur [1, 2[
  // Points fermes (ronds pleins)
  circle((-1, 1), radius: 0.06, fill: black)
  circle((0, 0), radius: 0.06, fill: black)
  circle((1, 1), radius: 0.06, fill: black)
  circle((2, 0), radius: 0.06, fill: black)
  // Points ouverts (ronds vides)
  circle((0, 1), radius: 0.06, fill: white, stroke: black)
  circle((1, 0), radius: 0.06, fill: white, stroke: black)
  circle((2, 1), radius: 0.06, fill: white, stroke: black)
})

=== Exercice 7 -- Corrige
// Source: XY Plus T1 p.13

*1)* $f$ est definie sur $RR$ car : Pour tout $x in RR$ on a : $E(x) lt.eq x$ donc $x - E(x) gt.eq 0$

*2)* Si $x in [0, 1[$, on a $E(x) = 0$ et $f(x) = 0 + sqrt(x - 0) = sqrt(x)$.

$(C_0)$ est la representation graphique de la restriction de $f$ a l'intervalle $[0, 1]$.

// Figure: courbe y = sqrt(x) sur [0,1] avec point C en (1,1)
#import "@preview/cetz:0.3.4"
#cetz.canvas({
  import cetz.draw: *
  // Axes
  line((-1.5, 0), (3, 0), mark: (end: ">"))
  line((0, -1.5), (0, 2.5), mark: (end: ">"))
  content((-0.3, -0.3), $O$)
  content((0.3, -0.3), $arrow(i)$)
  content((-0.3, 0.4), $arrow(j)$)
  // Courbe sqrt(x) sur [0,1]
  let points = ()
  for i in range(21) {
    let t = i / 20
    points.push((t, calc.sqrt(t)))
  }
  // Dessin point par point avec des segments
  for i in range(20) {
    let t1 = i / 20
    let t2 = (i + 1) / 20
    line((t1, calc.sqrt(t1)), (t2, calc.sqrt(t2)), stroke: 1.2pt)
  }
  content((1.1, 1.2), $C$)
  content((-0.3, 1), $arrow(j)$)
  content((1, -0.3), $1$)
  // Label C_0
  content((0.6, 0.9), $cal(C)_0$)
})

*3)* $k in ZZ$ donc $E(x + k) = E(x) + k$.

$f(x + k) = E(x + k) + sqrt(x + k - E(x + k)) = E(x) + k + sqrt(x + k - E(x) - k)$

$= E(x) + k + sqrt(x - E(x))$

d'ou $f(x + k) = k + f(x)$

Soient $M(x, f(x))$ et $M'(x + k, f(x + k))$ deux points de la courbe $cal(C)$ de $f$.

$arrow(M M') = vec(k, k)$ car $f(x + k) = k + f(x)$ et par suite $t_(arrow(u))(M) = M'$ ou $arrow(u) = k(arrow(i) + arrow(j))$ et $k in ZZ$.

En appliquant a $(C_0)$ les translations de vecteurs $arrow(i) + arrow(j)$, $2(arrow(i) + arrow(j))$, $3(arrow(i) + arrow(j))$,
$-(arrow(i) + arrow(j))$, $-2(arrow(i) + arrow(j))$ : on obtient $(C_1)$, $(C_2)$, $(C_3)$, $(C_4)$ traces des restrictions de $f$
respectivement aux intervalles $[1, 2]$, $[2, 3]$, $[-1, 0]$ et $[-2, -1]$.

=== Exercice 8 -- Corrige
// Source: XY Plus T1 p.14

// Figure: courbe de f sur ]0, +inf[ avec segments sur les droites y=x, y=2x, y=3x, etc.
// TODO: figure complexe — Graphique montrant la courbe de f(x) = x.E(1/x) sur ]0, +inf[
// La courbe est formee d'une demi-droite (y=0 pour x>1) et d'une infinite de segments
// portes sur les droites y=x, y=2x, y=3x, ..., y=nx ou n in N*.
// Les segments sont sur les intervalles ]1/(n+1), 1/n] pour chaque n.

*1)* Pour tout reel $x > 1$ on a $0 < frac(1, x) < 1$ d'ou $E(frac(1, x)) = 0$ donc $f(x) = 0$ #h(1em) (1)

Pour tout $x in ]0, 1[$ on a $frac(1, x) > 1$ et la presence du facteur $E(frac(1, x))$ donne l'idee de
subdiviser l'intervalle $]0, 1]$ en intervalles $]frac(1, n + 1), frac(1, n)]$.

Si $frac(1, 2) < x lt.eq 1$ alors $1 lt.eq frac(1, x) < 2$ donc $E(frac(1, x)) = 1$ et par suite $f(x) = x$.

Si $frac(1, 3) < x lt.eq frac(1, 2)$ alors $2 lt.eq frac(1, x) < 3$ donc $E(frac(1, x)) = 2$ et $f(x) = 2x$.

Si $frac(1, 4) < x lt.eq frac(1, 3)$ alors $3 lt.eq frac(1, x) < 4$ donc $E(frac(1, x)) = 3$ et $f(x) = 3x$

$dots.h$

Si $frac(1, n + 1) < x lt.eq frac(1, n)$ alors $n lt.eq frac(1, x) < n + 1$ donc $E(frac(1, x)) = n$ et par suite

$f(x) = n x$ pour tout $n in NN^*$ #h(1em) (2)

*Conclusion :*

De (1) et (2), pour tout reel $x > 0$ et pour tout entier naturel $n$, $f(x) = n x$.

*2)* La representation graphique est donc formee d'une demi droite de l'axe des abscisses
($y = 0$ et $x > 1$) et d'une infinite de segments portes sur les droites d'equations
$y = x$, $y = 2x$, ....., $y = n x$ ou $n in NN^*$.

// Figure: segments sur les droites y=nx dans ]0, 1]
#import "@preview/cetz:0.3.4"
#cetz.canvas({
  import cetz.draw: *
  // Axes
  line((-0.3, 0), (1.5, 0), mark: (end: ">"))
  line((0, -0.3), (0, 1.5), mark: (end: ">"))
  content((-0.15, -0.15), $O$)
  // Graduations
  content((1, -0.2), $1$)
  content((0.5, -0.2), $frac(1, 2)$)
  content((0.33, -0.2), $frac(1, 3)$)
  content((0.25, -0.2), $frac(1, 4)$)
  // Demi-droite y=0 pour x > 1
  line((1, 0), (1.4, 0), stroke: 1.5pt)
  // Segment y=x sur ]1/2, 1]
  line((0.5, 0.5), (1, 1), stroke: 1.5pt)
  // Segment y=2x sur ]1/3, 1/2]
  line((0.333, 0.666), (0.5, 1), stroke: 1.5pt)
  // Segment y=3x sur ]1/4, 1/3]
  line((0.25, 0.75), (0.333, 1), stroke: 1.5pt)
  // Labels
  content((1.3, 1.3), $cal(C)$)
})
