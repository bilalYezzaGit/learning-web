// =============================================================================
// Module 1 : Généralités sur les fonctions
// Programme : 3ème Math (Tunisie)
// Source : Manuel scolaire CNP (T1, p.5–20) + Corrigé CMS (T1, p.1–15)
// =============================================================================

= Chapitre 1 : Généralités sur les fonctions

#quote[Le livre de la nature est écrit dans un langage mathématique.][Galilée]

// Source: Manuel T1 p.6

== Pour commencer

=== Activité 1

Le plan est muni d'un repère $(O, arrow(i), arrow(j))$.
Parmi les courbes $C_1$, $C_2$, $C_3$, $C_4$ et $C_5$ tracées ci-dessous, préciser celles qui représentent graphiquement une fonction et préciser l'ensemble de définition de la fonction en question.

// Figure : cinq courbes C₁ à C₅
#import "@preview/cetz:0.3.4"
#grid(
  columns: 3,
  gutter: 12pt,
  // C₁ — fonction (allure sinusoïdale avec max local)
  cetz.canvas(length: 0.6cm, {
    import cetz.draw: *
    line((-3, 0), (3.5, 0), mark: (end: ">"), stroke: 0.6pt)
    line((0, -2.5), (0, 2.5), mark: (end: ">"), stroke: 0.6pt)
    content((-0.3, -0.3), $O$, anchor: "north-east")
    content((3.2, -0.4), $arrow(i)$)
    content((-0.4, 2.2), $arrow(j)$)
    content((2.5, 2), text(fill: blue)[$C_1$])
    bezier((-2.5, -2), (-0.5, 1.8), (-1.5, 1.5), (-1, 2.2), stroke: (paint: red, thickness: 0.8pt))
    bezier((-0.5, 1.8), (2.5, -1), (0, 0.5), (1.5, -1.5), stroke: (paint: red, thickness: 0.8pt))
  }),
  // C₂ — parabole couchée (NON fonction)
  cetz.canvas(length: 0.6cm, {
    import cetz.draw: *
    line((-1.5, 0), (3.5, 0), mark: (end: ">"), stroke: 0.6pt)
    line((0, -2.5), (0, 2.5), mark: (end: ">"), stroke: 0.6pt)
    content((-0.3, -0.3), $O$, anchor: "north-east")
    content((3.2, -0.4), $arrow(i)$)
    content((-0.4, 2.2), $arrow(j)$)
    content((2.5, -2), text(fill: blue)[$C_2$])
    // Branche supérieure
    bezier((-1, 0), (3, 2), (0.5, 0.3), (2, 1.5), stroke: (paint: red, thickness: 0.8pt))
    // Branche inférieure
    bezier((-1, 0), (3, -2), (0.5, -0.3), (2, -1.5), stroke: (paint: red, thickness: 0.8pt))
  }),
  // C₃ — segment (fonction constante sur un intervalle)
  cetz.canvas(length: 0.6cm, {
    import cetz.draw: *
    line((-2.5, 0), (3.5, 0), mark: (end: ">"), stroke: 0.6pt)
    line((0, -1.5), (0, 2.5), mark: (end: ">"), stroke: 0.6pt)
    content((-0.3, -0.3), $O$, anchor: "north-east")
    content((-0.4, 2.2), $arrow(j)$)
    content((3.2, -0.4), $arrow(i)$)
    content((3, 1.5), text(fill: blue)[$C_3$])
    // Segment de (-1, 1) à (2, 1)
    circle((-1, 1), radius: 0.08, fill: black)
    line((-1, 1), (2, 1), stroke: (paint: red, thickness: 0.8pt))
    circle((2, 1), radius: 0.08, fill: black)
  }),
  // C₄ — courbe fermée ellipse (NON fonction)
  cetz.canvas(length: 0.6cm, {
    import cetz.draw: *
    line((-2, 0), (3.5, 0), mark: (end: ">"), stroke: 0.6pt)
    line((0, -2.5), (0, 2.5), mark: (end: ">"), stroke: 0.6pt)
    content((-0.3, -0.3), $O$, anchor: "north-east")
    content((3.2, -0.4), $arrow(i)$)
    content((-0.4, 2.2), $arrow(j)$)
    content((2.5, 2), text(fill: blue)[$C_4$])
    // Ellipse (approximée par 4 béziers)
    bezier((1, 2), (-1, 0), (-0.2, 2), (-1, 1.2), stroke: (paint: red, thickness: 0.8pt))
    bezier((-1, 0), (1, -2), (-1, -1.2), (-0.2, -2), stroke: (paint: red, thickness: 0.8pt))
    bezier((1, -2), (3, 0), (2.2, -2), (3, -1.2), stroke: (paint: red, thickness: 0.8pt))
    bezier((3, 0), (1, 2), (3, 1.2), (2.2, 2), stroke: (paint: red, thickness: 0.8pt))
  }),
  // C₅ — courbe oscillante avec sauts (fonction)
  cetz.canvas(length: 0.6cm, {
    import cetz.draw: *
    line((-2.5, 0), (3.5, 0), mark: (end: ">"), stroke: 0.6pt)
    line((0, -2.5), (0, 2.5), mark: (end: ">"), stroke: 0.6pt)
    content((-0.3, -0.3), $O$, anchor: "north-east")
    content((3.2, -0.4), $arrow(i)$)
    content((-0.4, 2.2), $arrow(j)$)
    content((3, 1.5), text(fill: blue)[$C_5$])
    bezier((-2, 1.5), (-0.5, -1), (-1.5, -0.5), (-1, -1.5), stroke: (paint: red, thickness: 0.8pt))
    bezier((-0.5, -1), (1, 1.5), (0, 0.5), (0.5, 1.8), stroke: (paint: red, thickness: 0.8pt))
    bezier((1, 1.5), (3, -0.5), (1.5, 0.5), (2.5, -1), stroke: (paint: red, thickness: 0.8pt))
  }),
)

=== Activité 2

Déterminer l'ensemble de définition de chacune des fonctions suivantes.

a. $f : x mapsto frac(5x - 1, x + 3)$ \

b. $g : x mapsto sqrt(1 - x)$ \

c. $h : x mapsto frac(4, 6 - x) - frac(1, x)$ \

d. $k : x mapsto frac(1, sqrt(1 + x)) + frac(1, x - 1)$

// Source: Manuel T1 p.7

== Cours

=== 1. Rappels

==== 1.1 Représentation graphique

===== Activité 1

1. Dans le plan muni d'un repère orthogonal $(O, arrow(i), arrow(j))$, représenter les courbes $C$ et $C'$ d'équations respectives $y = frac(1, x - 2)$ et $y = x^2 - 2x$.

2. Déterminer graphiquement le nombre de points d'intersection de $C$ et $C'$.

3. a. Montrer que si $x^2 - 2x = frac(1, x - 2)$ alors $x^3 - 4x^2 + 4x - 1 = 0$.

   b. En déduire que le polynôme P défini par $P(x) = x^3 - 4x^2 + 4x - 1$ admet au moins deux racines.

4. a. Vérifier que 1 est une racine de P.

   b. En déduire les autres racines de P.

===== Activité 2

On a représenté dans un repère orthogonal $(O, arrow(i), arrow(j))$, les courbes des fonctions $f$, $g$ et $h$ définies sur $]0, +infinity[$ par

$f : x mapsto sqrt(x + 3)$ #h(1cm) ; #h(1cm) $g : x mapsto sqrt(x) + 3$ #h(1cm) ; #h(1cm) $h : x mapsto 2sqrt(x + 3) + 3$.

Identifier chacune d'entre elles.

// Trois courbes : f(x)=√(x+3), g(x)=√x+3, h(x)=2√(x+3)+3
#cetz.canvas({
  import cetz.draw: *
  // Axes
  line((-4, 0), (6, 0), mark: (end: ">"), stroke: 0.8pt)
  line((0, -0.5), (0, 8), mark: (end: ">"), stroke: 0.8pt)
  content((6, -0.4), $x$)
  content((-0.3, 8), $y$)
  content((-0.3, -0.3), $O$)
  // Graduations
  for i in range(-3, 6) {
    if i != 0 { line((i, -0.1), (i, 0.1), stroke: 0.3pt) }
  }
  for i in range(1, 8) {
    line((-0.1, i), (0.1, i), stroke: 0.3pt)
  }
  // C₁ : f(x) = √(x+3), D_f = [-3, +∞[
  // f(-3)=0, f(0)=√3≈1.73, f(1)=2, f(6)=3
  bezier((-3, 0), (0, 1.73), (-2, 0.7), (-1, 1.25), stroke: (paint: blue, thickness: 1pt))
  bezier((0, 1.73), (5.5, 2.92), (2, 2.24), (4, 2.65), stroke: (paint: blue, thickness: 1pt))
  content((5.5, 2.5), text(fill: blue)[$C_1$])
  // C₂ : g(x) = √x + 3, D_g = [0, +∞[
  // g(0)=3, g(1)=4, g(4)=5, g(9)=6
  bezier((0, 3), (3, 4.73), (1, 4), (2, 4.41), stroke: (paint: red, thickness: 1pt))
  bezier((3, 4.73), (5.5, 5.35), (4, 5), (5, 5.24), stroke: (paint: red, thickness: 1pt))
  content((5.5, 5.7), text(fill: red)[$C_2$])
  // C₃ : h(x) = 2√(x+3) + 3, D_h = [-3, +∞[
  // h(-3)=3, h(0)=2√3+3≈6.46, h(1)=7, h(3)=2√6+3≈7.9
  bezier((-3, 3), (0, 6.46), (-2, 4.4), (-1, 5.5), stroke: (paint: green.darken(20%), thickness: 1pt))
  bezier((0, 6.46), (3, 7.9), (1, 7), (2, 7.5), stroke: (paint: green.darken(20%), thickness: 1pt))
  content((3, 7.5), text(fill: green.darken(20%))[$C_3$])
})

==== 1.2 Sens de variation d'une fonction

===== Activité 1

Le plan est muni d'un repère orthogonal $(O, arrow(i), arrow(j))$.
La courbe $C$ tracée ci-contre, est la représentation graphique d'une fonction $f$ définie sur $[-1, 3]$.

1. Lire graphiquement les variations de la fonction $f$.

2. Construire les courbes représentatives des fonctions

   $-f : x mapsto -f(x)$ #h(1cm) ; #h(1cm) $|f| : x mapsto |f(x)|$ #h(1cm) ; #h(1cm) $h : x mapsto 2f(x)$.

   Expliquer le procédé de construction.

3. Lire graphiquement les variations de chacune des fonctions $-f$, $|f|$ et $h$.

// Courbe de f sur [-1, 3] : croissante sur [-1, 1], décroissante sur [1, 3]
#cetz.canvas({
  import cetz.draw: *
  // Axes
  line((-2, 0), (4.5, 0), mark: (end: ">"), stroke: 0.8pt)
  line((0, -2), (0, 3), mark: (end: ">"), stroke: 0.8pt)
  content((4.5, -0.3), $x$)
  content((-0.3, 3), $y$)
  content((-0.3, -0.3), $O$)
  // Graduations
  for i in (-1, 1, 2, 3) {
    line((i, -0.1), (i, 0.1), stroke: 0.3pt)
    content((i, -0.4), str(i))
  }
  // Courbe C : f croissante sur [-1,1], max en 1, décroissante sur [1,3]
  // f(-1) ≈ -1, f(0) ≈ 0.5, f(1) ≈ 2, f(2) ≈ 1, f(3) ≈ -1.5
  bezier((-1, -1), (1, 2), (0, 1.5), (0.5, 2.1), stroke: (paint: blue, thickness: 1pt))
  bezier((1, 2), (3, -1.5), (1.5, 1.5), (2.5, -1), stroke: (paint: blue, thickness: 1pt))
  content((2.5, 1.5), text(fill: blue)[$C$])
  // Points extrêmes
  circle((-1, -1), radius: 0.06, fill: blue)
  circle((3, -1.5), radius: 0.06, fill: blue)
})

#block(stroke: 0.5pt, inset: 8pt, radius: 4pt)[
  Soit $f$ une fonction définie sur un intervalle $I$.

  - La fonction $f$ est *croissante* sur $I$ si pour tous réels $a$ et $b$ de $I$ tels que $a <= b$, $f(a) <= f(b)$.

  - La fonction $f$ est *décroissante* sur $I$ si pour tous réels $a$ et $b$ de $I$ tels que $a <= b$, $f(a) >= f(b)$.

  - La fonction $f$ est *constante* sur $I$ si pour tous réels $a$ et $b$ de $I$, $f(a) = f(b)$.

  Une fonction est dite *monotone* sur un intervalle $I$ lorsqu'elle est croissante sur $I$ ou décroissante sur $I$.
]

// Source: Manuel T1 p.8

==== 1.3 Fonctions paires – Fonctions impaires

===== Activité 1

Le plan est muni d'un repère orthogonal $(O, arrow(i), arrow(j))$.
Soit $f$ une fonction paire définie sur $RR$.
On a représenté ci-dessous l'ensemble ${M(x, f(x)) "tels que" x >= 0}$.

// Demi-courbe de f (paire) pour x ≥ 0 — à compléter par symétrie / axe Oy
#cetz.canvas({
  import cetz.draw: *
  // Axes
  line((-4, 0), (4.5, 0), mark: (end: ">"), stroke: 0.8pt)
  line((0, -1), (0, 3.5), mark: (end: ">"), stroke: 0.8pt)
  content((4.5, -0.3), $x$)
  content((-0.3, 3.5), $y$)
  content((-0.3, -0.3), $O$)
  // Demi-courbe pour x ≥ 0 (partie donnée)
  bezier((0, 1), (1.5, 2.5), (0.5, 1.8), (1, 2.5), stroke: (paint: blue, thickness: 1pt))
  bezier((1.5, 2.5), (4, 1), (2, 2.3), (3, 1.5), stroke: (paint: blue, thickness: 1pt))
  circle((0, 1), radius: 0.06, fill: blue)
})

#block(stroke: 0.5pt, inset: 8pt, radius: 4pt)[
  Le plan est muni d'un repère orthogonal $(O, arrow(i), arrow(j))$.
  Soit $f$ une fonction définie sur un ensemble $D$.
  On dit que $f$ est une *fonction paire* si pour tout $x$ appartenant à $D$, $-x$ appartient à $D$ et $f(-x) = f(x)$.
  La fonction $f$ est paire, si et seulement si, sa courbe représentative est symétrique par rapport à l'axe des ordonnées.
]

Reproduire la courbe donnée et achever le tracé de la courbe représentative de $f$.

===== Activité 2

Le plan est muni d'un repère $(O, arrow(i), arrow(j))$.
Soit $g$ une fonction impaire définie sur $[-1, 1]$.
On a représenté ci-dessous l'ensemble ${M(x, g(x)) "tel que" 0 < x <= 1}$.

// Demi-courbe de g (impaire) pour 0 < x ≤ 1 — à compléter par symétrie / O
#cetz.canvas({
  import cetz.draw: *
  // Axes
  line((-1.5, 0), (1.8, 0), mark: (end: ">"), stroke: 0.8pt)
  line((0, -1.5), (0, 1.8), mark: (end: ">"), stroke: 0.8pt)
  content((1.8, -0.3), $x$)
  content((-0.3, 1.8), $y$)
  content((-0.3, -0.3), $O$)
  // Graduations
  line((1, -0.1), (1, 0.1), stroke: 0.3pt)
  content((1, -0.3), $1$)
  line((-0.1, 1), (0.1, 1), stroke: 0.3pt)
  content((-0.3, 1), $1$)
  // Demi-courbe : fonction affine par morceaux pour 0 < x ≤ 1
  // Segment de (0, 0) ouvert à (0.5, 1)
  line((0.05, 0.1), (0.5, 1), stroke: (paint: blue, thickness: 1pt))
  circle((0, 0), radius: 0.06, fill: white, stroke: blue)  // point ouvert en 0
  // Segment de (0.5, 1) à (1, 1)
  line((0.5, 1), (1, 1), stroke: (paint: blue, thickness: 1pt))
  circle((1, 1), radius: 0.06, fill: blue)  // point fermé en 1
})

#block(stroke: 0.5pt, inset: 8pt, radius: 4pt)[
  Le plan est muni d'un repère orthogonal $(O, arrow(i), arrow(j))$.
  Soit $f$ une fonction définie sur un ensemble $D$.
  On dit que $f$ est une *fonction impaire* si pour tout $x$ appartenant à $D$, $-x$ appartient à $D$ et $f(-x) = -f(x)$.
  La fonction $f$ est impaire, si et seulement si, sa courbe représentative est symétrique par rapport à l'origine du repère.
]

1. Reproduire la courbe donnée et achever le tracé de la courbe représentative de $g$.

2. Quelle est l'image de 0 par $g$ ?

3. Donner l'expression de $g(x)$ pour tout $x in [-1, 1]$.

=== 2. Restriction d'une fonction

==== Activité 1

Le plan est muni d'un repère $(O, arrow(i), arrow(j))$.

1. Représenter la parabole $C$, représentative de la fonction $f$ définie sur $RR$ par $f(x) = x^2 + 6x + 5$.

2. On désigne par $C'$ l'ensemble des points de $C$ d'abscisses appartenant à l'intervalle $[-3, 0]$ et par $g$ la fonction dont la représentation graphique est la courbe $C'$.
   Colorier $C'$ et donner l'expression de $g$.

// Source: Manuel T1 p.9

#block(stroke: 0.5pt, inset: 8pt, radius: 4pt, fill: rgb("#f0f7ff"))[
  *Définition*

  Soit $f$ une fonction définie sur un ensemble $E$ et $C$ sa représentation graphique dans un repère $(O, arrow(i), arrow(j))$.
  Soit $D$ une partie de $E$. On appelle *restriction* de la fonction $f$ à $D$, la fonction $g$ définie sur $D$ par $g(x) = f(x)$, pour tout $x$ de $D$.
  La représentation graphique de $g$ est l'ensemble des points de $C$ ayant pour coordonnées $(x, f(x))$, $x$ appartenant à $D$.
]

// Figure en marge : restriction de f à [a, b]
#cetz.canvas(length: 0.5cm, {
  import cetz.draw: *
  // Axes
  line((-1, 0), (8, 0), mark: (end: ">"), stroke: 0.6pt)
  line((0, -1), (0, 4), mark: (end: ">"), stroke: 0.6pt)
  content((-0.3, -0.3), $O$)
  // Courbe complète f (en gris)
  bezier((-0.5, 2), (3, 3.5), (1, 3), (2, 3.8), stroke: (paint: gray, thickness: 0.6pt))
  bezier((3, 3.5), (7, 1.5), (4, 2.5), (6, 1), stroke: (paint: gray, thickness: 0.6pt))
  // Restriction g sur [a, b] (en bleu épais)
  bezier((2, 3.6), (5, 2), (3, 3.2), (4, 2.3), stroke: (paint: blue, thickness: 1.2pt))
  // Marqueurs a et b
  line((2, -0.1), (2, 0.1), stroke: 0.5pt)
  content((2, -0.4), $a$)
  line((5, -0.1), (5, 0.1), stroke: 0.5pt)
  content((5, -0.4), $b$)
  // Projections en pointillés
  line((2, 0), (2, 3.6), stroke: (paint: gray, thickness: 0.3pt, dash: "dashed"))
  line((5, 0), (5, 2), stroke: (paint: gray, thickness: 0.3pt, dash: "dashed"))
})

==== Activité 2

On considère la fonction $f$ définie sur $RR$ par $f(x) = 2|x - 2| - |x + 3| - x^2$.

1. Donner l'expression de la fonction $g$, restriction de $f$ à l'intervalle $[2, +infinity[$.

2. Représenter graphiquement $g$.

==== Activité 3

Le plan est muni d'un repère orthonormé $(O, arrow(i), arrow(j))$.

1. Pour tout $x > 0$, on désigne par P le point de $(O, arrow(i))$ d'abscisse $x$.

   a. Montrer qu'il existe un unique point $M$ d'ordonnée positive, tel que le triangle $O P M$ soit rectangle en $P$ et d'aire égale à 1.

   b. Sur quelle courbe varie le point $M$ lorsque le point $P$ varie ?

   c. On désigne par $g$ la fonction qui à $x$ associe l'ordonnée de $M$. Donner l'expression de $g$.

   d. Pour quelles valeurs de $x$, a-t-on $2 <= g(x) <= 10$ ?

2. Pour tout $x > 0$, on désigne par $N$ le point de coordonnées $(0, g(x))$.
   Existe-t-il une valeur de $x$ pour laquelle le périmètre du rectangle $O P M N$ est égal à 2 ?

=== 3. Majorant – Minorant

==== Activité 1

On a représenté dans le repère $(O, arrow(i), arrow(j))$, ci-dessous, la courbe représentative d'une fonction $f$ définie sur $]-infinity, 5]$.

// Courbe de f sur ]-∞, 5] avec max local ≈ 4.5 et min local ≈ -4.5
#cetz.canvas({
  import cetz.draw: *
  // Axes
  line((-5, 0), (6.5, 0), mark: (end: ">"), stroke: 0.8pt)
  line((0, -5.5), (0, 5.5), mark: (end: ">"), stroke: 0.8pt)
  content((6.5, -0.3), $x$)
  content((-0.3, 5.5), $y$)
  content((-0.3, -0.3), $O$)
  // Graduations
  for i in (-4, -3, -2, -1, 1, 2, 3, 4, 5) {
    line((i, -0.1), (i, 0.1), stroke: 0.3pt)
  }
  for i in (-4, -3, -2, -1, 1, 2, 3, 4) {
    line((-0.1, i), (0.1, i), stroke: 0.3pt)
  }
  // Courbe : monte vers max en x ≈ -2/3, descend vers min en x ≈ 2, remonte vers x=5
  bezier((-4, -3), (-0.67, 4.5), (-3, 1), (-1.5, 4.8), stroke: (paint: blue, thickness: 1pt))
  bezier((-0.67, 4.5), (2, -4.5), (0.3, 2), (1.2, -4.5), stroke: (paint: blue, thickness: 1pt))
  bezier((2, -4.5), (5, 3), (3, -3), (4.5, 2), stroke: (paint: blue, thickness: 1pt))
  // Points remarquables
  circle((-0.67, 4.5), radius: 0.06, fill: blue)
  circle((2, -4.5), radius: 0.06, fill: blue)
  circle((5, 3), radius: 0.06, fill: blue)
  // Projections en pointillés pour le max
  line((-0.67, 0), (-0.67, 4.5), stroke: (paint: gray, thickness: 0.3pt, dash: "dashed"))
  content((-0.67, -0.5), $-frac(2,3)$)
})

// Source: Manuel T1 p.10

Répondre par vrai ou faux.

1. La fonction $f$ admet un maximum sur $]-infinity, 5]$ en $-frac(2, 3)$.

2. La restriction de $f$ à $]-infinity, 0]$ admet un maximum en $-frac(2, 3)$.

3. La fonction $f$ admet un maximum sur $]-infinity, 5]$ en $2$.

4. Le réel $-4.5$ est un minimum de la fonction $f$ sur $]-infinity, 5]$.

5. La restriction de $f$ à $[-2, 2]$ admet un minimum en $0$.

6. Pour tout $x in ]-infinity, 5]$, $f(x) <= 4$.

7. Pour tout $x in ]-infinity, 5]$, $f(x) <= 10$.

8. Pour tout $x in ]-infinity, 5]$, $-4.5 <= f(x)$.

9. Pour tout $x in ]-infinity, 5]$, $-6 <= f(x)$.

10. Pour tout $x in ]-infinity, 5]$, $-5 <= f(x) <= 3$.

#block(stroke: 0.5pt, inset: 8pt, radius: 4pt, fill: rgb("#f0f7ff"))[
  Soit $f$ une fonction définie sur un ensemble $D$.
  S'il existe un réel $x_0$, appartenant à $D$ tel que pour tout $x$ de $D$, $f(x) <= f(x_0)$, on dit que la fonction $f$ admet sur $D$ un *maximum* en $x_0$ ou encore que $f(x_0)$ est un maximum de $f$ sur $D$.
]

#block(stroke: 0.5pt, inset: 8pt, radius: 4pt, fill: rgb("#f0f7ff"))[
  Soit $f$ une fonction définie sur un ensemble $D$.
  S'il existe un réel $x_0$ appartenant à $D$ tel que pour tout $x$ de $D$, $f(x_0) <= f(x)$, on dit que la fonction $f$ admet sur $D$ un *minimum* en $x_0$ ou encore que $f(x_0)$ est un minimum de $f$ sur $D$.
]

#block(stroke: 0.5pt, inset: 8pt, radius: 4pt, fill: rgb("#fff7f0"))[
  *Définition*

  Soit $f$ une fonction définie sur un ensemble $D$.

  - La fonction $f$ est dite *majorée* sur $D$ s'il existe un réel $M$ tel que pour tout $x$ de $D$, $f(x) <= M$.

  - La fonction $f$ est dite *minorée* sur $D$ s'il existe un réel $m$ tel que pour tout $x$ de $D$, $m <= f(x)$.

  - La fonction $f$ est dite *bornée* sur $D$ s'il existe deux réels $m$ et $M$ tels que pour tout $x$ de $D$, $m <= f(x) <= M$.
]

==== Activité 2

Le plan est muni d'un repère orthonormé $(O, arrow(i), arrow(j))$.

Soit $f$ la fonction définie sur $RR$ par $f(x) = frac(x + 1, |x| + 1)$.

Montrer que tous les points de la courbe $C$ de $f$ se trouvent dans la région du plan délimitée par les droites $y = -1$ et $y = 1$.

=== 4. Fonctions affines par intervalles

==== 4.1 Définition d'une fonction affine par intervalles

===== Activité 1

Un cycliste se dirige de la ville B vers la ville A.
On désigne par $d(t)$ la distance (en km) qui à l'instant $t$ (en heure) le sépare de la ville A.
Soit $d$ la fonction qui à $t$ associe $d(t)$.
Dans le graphique ci-contre, la courbe $C$ est la représentation graphique de la fonction $d$.

#cetz.canvas({
  import cetz.draw: *
  // Axes
  line((-0.3, 0), (5.5, 0), mark: (end: ">"), stroke: 0.8pt)
  line((0, -0.3), (0, 6), mark: (end: ">"), stroke: 0.8pt)
  content((5.5, -0.4), $t$ + " (h)")
  content((-0.5, 6), $d$ + " (km)")
  content((-0.3, -0.3), $O$)
  // Graduations
  for i in range(1, 5) {
    line((i, -0.1), (i, 0.1), stroke: 0.5pt)
    content((i, -0.4), str(i))
  }
  content((-0.4, 5), $50$)
  line((-0.1, 5), (0.1, 5), stroke: 0.5pt)
  // Courbe décroissante par morceaux : (0,50) → (1,35) → (1.5,35) → (3,15) → (4,0)
  line((0, 5), (1, 3.5), stroke: (paint: blue, thickness: 1.2pt))
  line((1, 3.5), (1.5, 3.5), stroke: (paint: blue, thickness: 1.2pt))  // pause
  line((1.5, 3.5), (3, 1.5), stroke: (paint: blue, thickness: 1.2pt))
  line((3, 1.5), (4, 0), stroke: (paint: blue, thickness: 1.2pt))
  // Label C
  content((2.5, 4), $C$, fill: blue)
})

1. Quelle est la distance qui sépare les deux villes ?

2. Au bout de combien de temps le cycliste arrivera-t-il à la ville A ?

3. Donner l'expression de $d(t)$ pour tout $t in [0, 4]$.

// Source: Manuel T1 p.11

#block(stroke: 0.5pt, inset: 8pt, radius: 4pt, fill: rgb("#fff7f0"))[
  *Définition*

  On appelle *fonction affine par intervalles* toute fonction définie sur une réunion d'intervalles et telle que sa restriction à chacun de ces intervalles soit affine.
]

===== Activité 2

Dans le plan muni d'un repère orthogonal $(O, arrow(i), arrow(j))$, les points $A(0, 4)$, $B(3, 0)$, $C(-3, 0)$ sont fixes et $M$ est un point variable de la droite $(B C)$, d'abscisse $x$.
On désigne par $H$ le projeté orthogonal de $M$ sur la droite $(A B)$ et par $K$ le projeté orthogonal de $M$ sur la droite $(A C)$.
On considère la fonction $f : x mapsto M H + M K$.

1. Donner l'expression de $f(x)$ pour tout réel $x$.

2. Montrer que la restriction de $f$ à l'intervalle $[-3, 3]$ est une fonction constante.

3. Déterminer les valeurs de $x$ pour lesquelles $M H + M K = 6$.

4. Existe-t-il des points $M$ tels que $M H = M K$ ?

==== 4.2 Fonction partie entière

===== Activité 1

1. Pour chacun des réels suivants, donner un encadrement entre deux entiers consécutifs.

   $-1.2$ #h(0.5cm) ; #h(0.5cm) $-1.99999999$ #h(0.5cm) ; #h(0.5cm) $frac(56, 49)$ #h(0.5cm) ; #h(0.5cm) $-sqrt(3)$ #h(0.5cm) ; #h(0.5cm) $5sqrt(13)$ #h(0.5cm) ; #h(0.5cm) $pi$ #h(0.5cm) ; #h(0.5cm) $-2pi$.

2. Pour chacun des réels suivants, déterminer le plus grand entier qui lui est inférieur.

   $5.1$ #h(0.5cm) ; #h(0.5cm) $-5.000002$ #h(0.5cm) ; #h(0.5cm) $sqrt(26)$ #h(0.5cm) ; #h(0.5cm) $-frac(76, 15)$ #h(0.5cm) ; #h(0.5cm) $4 + sqrt(3)$.

#block(stroke: 0.5pt, inset: 8pt, radius: 4pt, fill: rgb("#fff7f0"))[
  *Définition*

  - On appelle *partie entière* d'un réel $x$ et on note $E(x)$, le plus grand entier inférieur ou égal à $x$.

  - On appelle *fonction partie entière* la fonction qui à tout réel associe sa partie entière.

  Soit $E$ la fonction partie entière.
  Pour tout réel $x$, il existe un entier $n$ tel que $x$ appartient à $[n, n+1[$. On a alors $E(x) = n$.
]

===== Activité 2

Déterminer et représenter graphiquement la restriction de la fonction partie entière à l'intervalle $[-3, 2]$.

// Source: Manuel T1 p.12

=== 5. La fonction $x mapsto sqrt(f(x))$

==== Activité 1

Dans la figure ci-contre le triangle $A B C$ est rectangle en $A$.
On pose $A C = x$ et $A B = y$.

#import "@preview/cetz:0.3.4"
#cetz.canvas({
  import cetz.draw: *
  // Triangle ABC rectangle en A, hypoténuse BC = 5
  line((0, 0), (4, 0), stroke: 0.8pt)
  line((0, 0), (0, 2.5), stroke: 0.8pt)
  line((4, 0), (0, 2.5), stroke: 0.8pt)
  // Marque angle droit
  line((0.3, 0), (0.3, 0.3), stroke: 0.5pt)
  line((0.3, 0.3), (0, 0.3), stroke: 0.5pt)
  // Labels
  content((-0.3, -0.3), $A$)
  content((4.3, -0.3), $C$)
  content((-0.3, 2.8), $B$)
  content((2, -0.4), $x$)
  content((-0.4, 1.25), $y$)
  content((2.4, 1.6), $5$)
})

1. Exprimer $y$ en fonction de $x$.

2. En déduire l'aire de $A B C$.

==== Activité 2

On considère la fonction $f : x mapsto sqrt(x)$.

1. Pour quelles valeurs de $x$, les réels $f(x^3)$, $f(x + 2)$ et $f(1/x)$ existent-ils ?

2. En déduire l'ensemble de définition de chacune des fonctions

   $k : x mapsto f(x^3)$, #h(0.5cm) $m : x mapsto f(x + 2)$ #h(0.5cm) et #h(0.5cm) $s : x mapsto f(1/x)$.

==== Activité 3

Donner l'ensemble de définition de chacune des fonctions

$f : x mapsto sqrt(x^2 - 1)$ #h(1cm) ; #h(1cm) $g : x mapsto sqrt(frac(1, x^2) - frac(1, x)) + 2$ ;

$h : x mapsto frac(1, sqrt(x - 1))$ #h(1cm) ; #h(1cm) $k : x mapsto frac(1, sqrt(|x - 1|))$.

==== Activité 4

1. Soit $f$ une fonction définie et positive sur un intervalle $I$.

   a. Montrer les propriétés ci-dessous :

      Si $f$ est croissante sur $I$ alors $sqrt(f)$ est croissante sur $I$.

      Si $f$ est décroissante sur $I$ alors $sqrt(f)$ est décroissante sur $I$.

   b. Montrer que si $f$ est majorée sur $I$ alors $sqrt(f)$ est majorée sur $I$.

2. Pour chacune des fonctions ci-dessous, préciser son ensemble de définition et étudier ses variations.

   $m : x mapsto sqrt(x - 3)$ #h(1cm) ; #h(1cm) $h : x mapsto frac(1, 2sqrt(x^2 + 1))$ #h(1cm) ; #h(1cm) $k : x mapsto sqrt(x(1 - x))$.

// Source: Manuel T1 p.13

#block(stroke: 0.5pt, inset: 8pt, radius: 4pt, fill: rgb("#e8f5e9"))[
  *Théorème*

  Soit $f$ une fonction définie et positive sur un intervalle $I$.

  - Si $f$ est croissante sur $I$ alors $sqrt(f)$ est croissante sur $I$.

  - Si $f$ est décroissante sur $I$ alors $sqrt(f)$ est décroissante sur $I$.

  - Si $f$ est majorée sur $I$ alors $sqrt(f)$ est majorée sur $I$.
]

=== 6. Opérations sur les fonctions

Soit $D$ une partie de $RR$. Nous pouvons munir l'ensemble des fonctions définies sur $D$ et à valeurs dans $RR$ d'une addition, d'une multiplication et de la multiplication par un réel de la manière suivante :

- La fonction $f + g$ est la fonction définie sur $D$ par $(f + g)(x) = f(x) + g(x)$.

- La fonction $f g$ est la fonction définie sur $D$ par $(f g)(x) = f(x) dot g(x)$.

- Pour tout réel $lambda$, la fonction $lambda f$ est la fonction définie sur $D$ par $(lambda f)(x) = lambda dot f(x)$.

==== Activité 1

1. Vérifier que pour toutes fonctions $f$ et $g$ définies sur un même ensemble $D$, on a
   $f + g = g + f$ #h(0.5cm) ; #h(0.5cm) $f g = g f$.

2. Soit les fonctions $f$, $g$ et $h$ définies pour tout réel $x$ par
   $f(x) = (x - 1)^2 - 2$ #h(0.5cm) ; #h(0.5cm) $g(x) = x - 1$ #h(0.5cm) et #h(0.5cm) $h(x) = 2|x - 2| - |x + 3|$.

   Donner les expressions des fonctions $f + h$ #h(0.3cm) ; #h(0.3cm) $f g$ #h(0.3cm) ; #h(0.3cm) $h^2$ #h(0.3cm) ; #h(0.3cm) $2f + 3g^2$.

   a. Résoudre dans $RR$, les équations $f(x) = 0$ et $h(x) = 0$.

   b. Donner l'ensemble de définition des fonctions

      $x mapsto frac(1, f(x))$ #h(0.3cm) ; #h(0.3cm) $x mapsto frac(1, h(x))$ #h(0.3cm) ; #h(0.3cm) $x mapsto frac(1, h^2(x))$ ;

      $x mapsto frac(f(x), g(x))$ #h(0.3cm) ; #h(0.3cm) $x mapsto frac(h(x), g(x))$.

#block(stroke: 0.5pt, inset: 8pt, radius: 4pt)[
  Soit $f$ et $g$ deux fonctions définies sur un ensemble $D$ telles que $g(x) eq.not 0$ pour tout $x in D$.

  La fonction $x mapsto frac(1, g(x))$ est notée $frac(1, g)$.

  La fonction $x mapsto frac(f(x), g(x))$ est notée $frac(f, g)$.
]

==== Activité 2

1. Montrer que si $f$ et $g$ sont croissantes, alors $f + g$ est croissante.

2. Montrer que si $f$ et $g$ sont décroissantes, alors $f + g$ est décroissante.

3. Donner les variations de chacune des fonctions ci-dessous.

   $f : x mapsto -x + 5 + frac(1, x)$ sur $]0, +infinity[$.

   $g : x mapsto x^2 - 1 + sqrt(x + 3)$ sur $[1, +infinity[$.

// Source: Manuel T1 p.14

== QCM – VRAI – FAUX

=== QCM

Cocher la réponse exacte.

1. La fonction $f$ définie sur $[-1, +infinity[$ par $f(x) = frac(3x, 1 + |x|)$

   $square$ est paire #h(2cm) $square$ est impaire #h(2cm) $square$ n'est ni paire, ni impaire.

2. Le plan est muni d'un repère orthogonal $(O, arrow(i), arrow(j))$.
   Une des courbes suivantes ne représente ni une fonction paire ni une fonction impaire. Laquelle ?

   // Trois courbes pour identifier parité/imparité
   #grid(
     columns: 3,
     gutter: 8pt,
     cetz.canvas(length: 0.45cm, {
       import cetz.draw: *
       line((-3.5, 0), (3.5, 0), mark: (end: ">"), stroke: 0.5pt)
       line((0, -2.5), (0, 2.5), mark: (end: ">"), stroke: 0.5pt)
       content((3, 2), text(fill: blue)[$C_1$])
       // Courbe symétrique / Oy (paire)
       bezier((-3, 1), (-1.5, -1.5), (-2.5, -0.5), (-2, -1.5), stroke: (paint: red, thickness: 0.8pt))
       bezier((-1.5, -1.5), (0, 2), (-0.8, -0.5), (-0.3, 1.5), stroke: (paint: red, thickness: 0.8pt))
       bezier((0, 2), (1.5, -1.5), (0.3, 1.5), (0.8, -0.5), stroke: (paint: red, thickness: 0.8pt))
       bezier((1.5, -1.5), (3, 1), (2, -1.5), (2.5, -0.5), stroke: (paint: red, thickness: 0.8pt))
     }),
     cetz.canvas(length: 0.45cm, {
       import cetz.draw: *
       line((-3.5, 0), (3.5, 0), mark: (end: ">"), stroke: 0.5pt)
       line((0, -2.5), (0, 2.5), mark: (end: ">"), stroke: 0.5pt)
       content((3, -2), text(fill: blue)[$C_2$])
       // Courbe type 1/x (impaire), asymptote verticale x=0
       bezier((-3, -0.3), (-0.3, -2), (-1.5, -0.5), (-0.5, -1.5), stroke: (paint: red, thickness: 0.8pt))
       bezier((0.3, 2), (3, 0.3), (0.5, 1.5), (1.5, 0.5), stroke: (paint: red, thickness: 0.8pt))
     }),
     cetz.canvas(length: 0.45cm, {
       import cetz.draw: *
       line((-3.5, 0), (3.5, 0), mark: (end: ">"), stroke: 0.5pt)
       line((0, -2.5), (0, 2.5), mark: (end: ">"), stroke: 0.5pt)
       content((3, 2), text(fill: blue)[$C_3$])
       // Courbe en S (ni paire ni impaire)
       bezier((-3, -1.5), (0, 0.5), (-2, -1), (-1, 0), stroke: (paint: red, thickness: 0.8pt))
       bezier((0, 0.5), (3, 2), (1, 1), (2, 1.8), stroke: (paint: red, thickness: 0.8pt))
     }),
   )

   $square$ $C_1$ #h(3cm) $square$ $C_2$ #h(3cm) $square$ $C_3$

3. La fonction $f$ définie sur $RR$ par $f(x) = frac(-2, x^2 + 4)$

   $square$ n'est pas majorée sur $RR$ #h(1cm) $square$ n'est pas minorée sur $RR$ #h(1cm) $square$ est bornée sur $RR$.

4. L'ensemble de définition de la fonction $x mapsto sqrt(4 - 2x)$ est

   $square$ $]-infinity, -2]$ #h(2cm) $square$ $[2, +infinity[$ #h(2cm) $square$ $RR$.

5. L'ensemble de définition de la fonction $x mapsto frac(2x^2 - 1, 1 - |x|)$ est

   $square$ $RR without {1}$ #h(2cm) $square$ $RR without {-1}$ #h(2cm) $square$ $RR without {1, -1}$.

=== Corrigé du QCM

*1)* c) $f$ n'est ni paire, ni impaire

car : par exemple $3 in D_f$ mais $(-3) in.not D_f$

*2)* b) $(C_2)$ ne presente ni une fonction paire ni impaire car $(C_2)$ est ni symetrique par rapport a l'axe des ordonnees ni symetrique par rapport a $O$ l'origine du repere.

*3)* c) $f$ est bornee sur $I R$

car : $ast f(x) gt.eq 0$ pour tout $x in I R$

$ast x^2 gt.eq 0 arrow.double x^2 + 4 gt.eq 4 arrow.double$
$ arrow.double frac(1, x^2 + 4) lt.eq frac(1, 4)$
$ arrow.double frac(2, x^2 + 4) lt.eq frac(1, 2)$
$ arrow.double f(x) lt.eq frac(1, 2)$

par suite : $0 lt.eq f(x) lt.eq frac(1, 2)$ pour tout $x in I R$

*4)* $f(x) = sqrt(|4 - 2 x|)$

c) $D_f = I R$. #h(1cm) car pour tout $x in I R$,

on a #h(0.5cm) $|4 - 2 x| gt.eq 0$

*5)* c) $D_f = I R without {-1, 1}$

car : $1 - |x| = 0 arrow.l.r.double |x| = 1$

$arrow.l.r.double x = -1 #h(0.5cm) "ou" #h(0.5cm) x = 1$

// Source: Corrige T1 p.1

=== VRAI – FAUX

Répondre par vrai ou faux en justifiant la réponse.

1. Si $f$ est une fonction paire définie sur $RR$, alors $f(0) = 0$.

2. Si $f$ est bornée sur $D$, alors $f$ admet un minimum sur $D$.

3. Si $f$ admet un maximum sur $D$, alors $f$ est bornée sur $D$.

4. Si $f$ n'est pas bornée sur $D$, alors elle n'admet ni un minimum ni un maximum sur $D$.

5. Soit $f$ une fonction définie sur $[0, +infinity[$.
   Si la restriction de $f$ à $[1, 3]$ est bornée sur $[1, 3]$, alors $f$ est bornée sur $[0, +infinity[$.

// Source: Manuel T1 p.15

=== Corrigé Vrai – Faux

*1)* Faux :

contre exemple : $f(x) = 1 + x^2$

$f$ est bornee sur $I R$ mais $f$ n'admet pas un minimum sur $I R$

*2)* Faux :

contre exemple : $f(x) = frac(2, x^2 + 4)$, $in I R$,

$0 lt.eq f(x) lt.eq frac(1, 2)$ #h(1cm) (voir QCM)

*3)* Faux :

contre exemple : $f(x) = -x^2$, $D = I R$

on a, $f(x) lt.eq 0$ pour $"tout" x in D$ et $f(0) = 0$

$f$ admet un maximum en 0 mais $f$ n'est pas minoree

*4)* Faux :

contre exemple : $f(x) = x^2$

$f$ n'est pas bornee mais $f$ est minoree par 0.

*5)* Faux :

contre exemple : $f(x) = sqrt(x)$

$1 lt.eq x lt.eq 3 arrow 1 lt.eq f(x) lt.eq sqrt(3)$

$f$ est bornee sur $[1, 3]$ mais $f$ n'est pas majoree.

// Source: Corrige T1 p.2

== Mobiliser ses compétences

=== Situation

Dans le plan muni d'un repère $(O, arrow(i), arrow(j))$, on a représenté les fonctions $f$ et $g$ définies sur $]1, +infinity[$ par $f(x) = sqrt(x + 2)$ et $g(x) = frac(sqrt(2), x - 1)$.

#cetz.canvas({
  import cetz.draw: *
  // Axes
  line((-0.5, 0), (14, 0), mark: (end: ">"), stroke: 0.8pt)
  line((0, -0.5), (0, 4), mark: (end: ">"), stroke: 0.8pt)
  content((14, -0.4), $x$)
  content((-0.3, 4), $y$)
  content((-0.3, -0.3), $O$)
  // Graduations
  for i in range(1, 13) {
    line((i, -0.08), (i, 0.08), stroke: 0.3pt)
  }
  for i in range(1, 4) {
    line((-0.08, i), (0.08, i), stroke: 0.3pt)
    content((-0.3, i), str(i))
  }
  content((4, -0.3), $4$)
  content((8, -0.3), $8$)
  content((12, -0.3), $12$)
  // C_f : f(x) = √(x+2), x ∈ ]1, +∞[
  // Points : (1, √3≈1.73), (2, 2), (4, √6≈2.45), (7, 3), (12, √14≈3.74)
  bezier((1.1, 1.76), (7, 3), (3, 2.24), (5, 2.65), stroke: (paint: blue, thickness: 1pt))
  bezier((7, 3), (13, 3.87), (9.5, 3.39), (11.5, 3.67), stroke: (paint: blue, thickness: 1pt))
  content((12.5, 3.5), $C_f$, fill: blue)
  // C_g : g(x) = √2/(x-1), x ∈ ]1, +∞[
  // Points : (1.5, 2.83), (2, 1.41), (3, 0.71), (5, 0.35), (8, 0.20), (12, 0.13)
  bezier((1.2, 3.5), (3, 0.71), (1.5, 2.0), (2, 1.2), stroke: (paint: red, thickness: 1pt))
  bezier((3, 0.71), (13, 0.12), (5, 0.35), (9, 0.18), stroke: (paint: red, thickness: 1pt))
  content((6, 0.8), $C_g$, fill: red)
  // Point d'intersection approximatif α ≈ 1.8
  circle((1.8, 1.95), radius: 0.06, fill: black)
  // Asymptote verticale x = 1 (en pointillés)
  line((1, -0.3), (1, 3.8), stroke: (paint: gray, thickness: 0.5pt, dash: "dashed"))
})

1. Résoudre graphiquement l'équation $f(x) = g(x)$.

2. On se propose de déterminer par le calcul la solution de l'équation $f(x) = g(x)$.

   a. Vérifier que si $alpha$ est une solution de l'équation $f(x) = g(x)$, alors $alpha$ est une solution de l'équation $(x - 1)^2 (x + 2) = 2$.

   b. Résoudre l'équation $(x - 1)^2 (x + 2) = 2$.

   c. En déduire la solution de l'équation $f(x) = g(x)$.

3. Résoudre graphiquement les inéquations $f(x) > g(x)$ et $f(x) < g(x)$.

4. Représenter graphiquement la fonction $h$ définie sur $]1, +infinity[$ par

   $ h(x) = cases(
     frac(sqrt(2), x - 1) & "si" x in ]1\, alpha],
     sqrt(x + 2) & "si" x > alpha.
   ) $

// Source: Manuel T1 p.16–18

=== Corrigé – Mobiliser ses compétences

$ f(x) = sqrt(x + 2) $
$ g(x) = frac(sqrt(2), x - 1) $
$ "pour" x in ]1, +infinity[ $

// TODO: figure complexe -- Graphique avec deux courbes C_h et C_f/C_g se coupant en un point,
// repere orthogonal, C_h courbe croissante type racine, l'autre courbe decroissante type hyperbole

*1)* Graphiquement $f(x) = g(x)$ *pour*

$x approx 1,8$

*2)* a) si $alpha$ est une solution de l'equation $f(x) = g(x)$ alors : $f(alpha) = g(alpha)$

$arrow.double sqrt(alpha + 2) = frac(sqrt(2), alpha - 1) arrow.double (alpha - 1) sqrt(alpha + 2) = sqrt(2)$

$arrow.double (alpha - 1)^2 (alpha + 2) = 2$

d'ou $alpha$ est une solution de l'equation :
$(x - 1)^2 (x + 2) = 2$

b) $(x - 1)^2 (x + 2) = 2$

equivaut a : $(x^2 - 2 x + 1)(x + 2) = 2$

$arrow.l.r.double x^3 + 2 x^2 - 2 x^2 - 4 x + x + 2 = 2$

$arrow.l.r.double x^3 - 3 x = 0 arrow.l.r.double x(x^2 - 3) = 0$

$arrow.l.r.double x(x - sqrt(3))(x + sqrt(3)) = 0$

$arrow.l.r.double x = 0 #h(0.5cm) "ou" #h(0.5cm) x = -sqrt(3) #h(0.5cm) "ou" #h(0.5cm) x = sqrt(3)$

c) $ cases(f(x) = g(x), x in ]1, +infinity[) arrow.l.r.double x = sqrt(3)$

*3)* $bullet f(x) > g(x) arrow.l.r x > sqrt(3)$

$bullet f(x) < g(x) arrow.l.r 1 < x < sqrt(3)$

*4)*

$h(x) = cases(
  g(x) & "si" x in ]1 \, alpha],
  f(x) & "si" x in ]1 \, +infinity[
)$

// Source: Corrige T1 p.3

== Exercices et problèmes

=== Exercice 1

Déterminer l'ensemble de définition et étudier la parité de chacune des fonctions suivantes.

$f : x mapsto frac(x, 1 + x^2)$ #h(1cm) ; #h(1cm) $g : x mapsto x sqrt(x)$ ;

$h : x mapsto sqrt(|x|)$ #h(1cm) ; #h(1cm) $k : x mapsto x + x^2 - x + 1$.

==== Corrigé

a) $f(x) = frac(x, 1 + x^2)$

- $D_f = I R$

- $f$ est impaire car : pour tout $x in D_f = I R$,

on a $(-x) in D_f$

et $f(-x) = frac(-x, 1 + (-x)^2) = frac(-x, 1 + x^2)$

$f(-x) = -f(x)$

b) $g(x) = sqrt(x)$, $D_g = [0, +infinity[$

$g$ n'est ni paire ni impaire

c) $h(x) = sqrt(|x|)$

- $D_h = I R$

- $h$ est paire car : pour tout $x in D_h = I R$,

on a $(-x) in D_h$

et $h(-x) = sqrt(|-x|) = sqrt(|x|) = h(x)$

d) $k(x) = x^2 - x + 1$

- $D_k = I R$

- $k$ n'est ni paire ni impaire

par exemple $k(1) = 1$ ; $k(-1) = 3$

$k(-1) eq.not -k(1)$

=== Exercice 2

Soit $f$ et $g$ deux fonctions définies sur un même ensemble $D$, $a$ et $b$ deux réels.

1. Que peut-on dire des fonctions $f g$ et $a f + b g$ lorsque les fonctions $f$ et $g$ sont paires ?

2. Que peut-on dire des fonctions $f g$ et $a f + b g$ lorsque les fonctions $f$ et $g$ sont impaires ?

==== Corrigé

*1)* si $f$ et $g$ sont des fonctions paires,

alors pour tout $x in D$, on a $(-x) in D$

et $f(-x) = f(x)$ ; $g(-x) = g(x)$

$ast (a f + b dot g)(-x) = a f(-x) + b dot g(-x)$

$= a f(x) + b g(x) = (a f + b g)(x)$

$a f + b g$ est paire.

*2)* si $f$ et $g$ sont impaires

alors pour tout $x in D$, on a $(-x) in D$

$"et" f(-x) = -f(x)$ ; $g(-x) = -g(x)$

$ast (f dot g)(-x) = f(-x) dot g(-x)$
$= (-f(x)) dot (-g(x))$
$= f(x) dot g(x) = (f dot g)(x)$

$f dot g$ est paire

$ast (a f + b g)(-x) = a f(-x) + b g(-x)$
$= -a f(x) - b g(x)$
$= -[a f(x) + b g(x)]$
$= -(a f + b g)(x)$

$a f + b g$ est impaire.

// Source: Corrige T1 p.3-4

=== Exercice 3

Le plan est muni d'un repère orthonormé $(O, arrow(i), arrow(j))$.
On a tracé ci-dessous les courbes représentatives $C$ et $C'$ des fonctions $f$ et $g$.

// Deux courbes C et C' de f et g avec extrema locaux
#cetz.canvas({
  import cetz.draw: *
  // Axes
  line((-3, 0), (5, 0), mark: (end: ">"), stroke: 0.8pt)
  line((0, -3), (0, 4), mark: (end: ">"), stroke: 0.8pt)
  content((5, -0.3), $x$)
  content((-0.3, 4), $y$)
  content((-0.3, -0.3), $O$)
  // Graduations
  for i in (-2, -1, 1, 2, 3, 4) {
    line((i, -0.1), (i, 0.1), stroke: 0.3pt)
    content((i, -0.4), str(i))
  }
  for i in (-2, -1, 1, 2, 3) {
    line((-0.1, i), (0.1, i), stroke: 0.3pt)
  }
  // Courbe C (f) — max local en x=1, min local en x=3
  bezier((-2, -1), (1, 3), (-0.5, 2), (0.5, 3.2), stroke: (paint: blue, thickness: 1pt))
  bezier((1, 3), (3, -1), (1.5, 2), (2.5, -1.5), stroke: (paint: blue, thickness: 1pt))
  bezier((3, -1), (4.5, 1), (3.5, -0.5), (4, 0.5), stroke: (paint: blue, thickness: 1pt))
  content((4.5, 1.5), text(fill: blue)[$C$])
  // Courbe C' (g) — min en x=0, max en x=2
  bezier((-2, 2.5), (0, -2), (-1, 0), (-0.3, -2.2), stroke: (paint: red, thickness: 1pt))
  bezier((0, -2), (2, 2), (0.5, -1), (1.5, 2.2), stroke: (paint: red, thickness: 1pt))
  bezier((2, 2), (4.5, -0.5), (2.5, 1.5), (4, -0.8), stroke: (paint: red, thickness: 1pt))
  content((4.5, -1), text(fill: red)[$C'$])
})

Dans chacun des cas suivants préciser si $f$ et $g$ admettent un maximum ou un minimum sur $I$. Dans l'affirmative préciser la(les) valeur(s) et en quel(s) réel(s) ils sont atteints.

a. $I = [-1, 1]$ #h(1cm) ; #h(1cm) b. $I = [1, 3]$ #h(1cm) ; #h(1cm) c. $I = [-2, 4]$.

==== Corrigé

a) $ast$ pour $x in I = [-1, 1]$ on a : $2 lt.eq f(x) lt.eq 3$

$f(1) lt.eq f(x) lt.eq f(-1)$

$f$ admet 2 comme minimum en 1

$f$ admet 3 comme maximum en $(-1)$

$ast$ $x in I = [-1, 1]$, $g(x) = 2$

$g$ admet un minimum et un maximum en tout reel $x_0$ de $I$

b) $ast$ pour tout $x in [1, 3]$, on a : $2 lt.eq f(x) lt.eq 4$

$f(1) lt.eq f(x) lt.eq f(3)$

2 est un minimum de $f$ en 1

4 est un maximum de $f$ en 3.

$ast$ pour tout $x in [1, 3]$, on a : $-1 lt.eq g(x) lt.eq 2$

$g(3) lt.eq g(x) lt.eq g(1)$

$(-1)$ est un minimum de $g$ en 3

$g$ admet 3 comme maximum en $(-2)$

// Source: Corrige T1 p.4

c) $ast$ pour $epsilon [-2, 4]$, on a : $0 lt.eq f(x) lt.eq 4$

$f(-2) lt.eq f(x) lt.eq f(3)$

0 est un minimum de $f$ en $(-2)$

4 est un maximum de $f$ en 3

$ast$ pour tout $x in [-2, 4]$, on a : $-1 lt.eq g(x) lt.eq 3$

$g(3) lt.eq g(x) lt.eq g(-2)$

$g$ admet $(-1)$ comme minimum en 3

$g$ admet 3 comme maximum en $(-2)$

=== Exercice 4

1. Déterminer le minimum sur $RR$ des fonctions ci-dessous.

   a. $f : x mapsto 1 + |x| + 2x^2$.

   b. $g : x mapsto |x| + |x + 1| - 4$.

2. Déterminer le maximum sur $RR$ des fonctions ci-dessous.

   a. $h : x mapsto frac(1, sqrt(x^2 + 1))$.

   b. $k : x mapsto frac(1, 1 + x^2) - 3$.

==== Corrigé

*1)* a) $f(x) = 1 + |x| + 2 x^2$

pour tout reel $x$, on a : $|x| + 2 x^2 gt.eq 0$

$arrow.double 1 + |x| + 2 x^2 gt.eq 1$

$arrow.double f(x) gt.eq 1 arrow.double f(x) gt.eq f(0)$

$f$ admet 1 comme minimum en 0.

b) $g(x) = |x + 1| - 4$

pour tout reel $x$, on a : $|x + 1| gt.eq 0$

$arrow.double |x + 1| - 4 gt.eq -4 arrow.double g(x) gt.eq -4$

$arrow.double g(x) gt.eq g(-1)$

$g$ admet $-4$ comme minimum en $(-1)$.

*2)* a) $h(x) = frac(1, |x| + 3) + 1$

pour tout reel $x$, on a : $|x| + 3 gt.eq 3$

$arrow.double frac(1, |x| + 3) lt.eq frac(1, 3)$

$arrow.double frac(1, |x| + 3) + 1 lt.eq frac(4, 3) arrow.double h(x) lt.eq frac(4, 3)$

$arrow.double h(x) lt.eq h(0)$

$f$ admet $frac(4, 3)$ comme maximum en 0.

b) $k(x) = frac(2, 1 + x^2) - 3$

pour tout reel $x$, on a : $x^2 gt.eq 0 arrow.double x^2 + 1 gt.eq 1$

$arrow.double frac(1, 1 + x^2) lt.eq 1 arrow.double frac(2, 1 + x^2) lt.eq 2$

$arrow.double frac(2, 1 + x^2) - 3 lt.eq -1 arrow.double k(x) lt.eq -1$

$arrow.double k(x) lt.eq k(0)$

$k$ admet $(-1)$ comme maximum en 0.

// Source: Corrige T1 p.4-5

=== Exercice 5

1. Donner les variations sur $]0, 1[$ de la fonction

   $f : x mapsto |x - frac(1, 2)| - frac(4, x^2)$.

2. En déduire celles de la fonction $g : x mapsto sqrt(|x - frac(1, 2)| - frac(4, x^2))$ sur $]0, 1[$.

3. Quel est le maximum de $g$ sur $]0, 1[$ ?

==== Corrigé

*1)* $f(x) = (x - frac(1, 2))^2 - frac(1, 4)$

*1)* $ast$ soit : $a$ et $b$ deux reels de $]0, frac(1, 2)]$

$a lt.eq b arrow.double a - frac(1, 2) lt.eq b - frac(1, 2) lt.eq 0$

$arrow.double (a - frac(1, 2))^2 gt.eq (b - frac(1, 2))^2$

$arrow.double (a - frac(1, 2))^2 - frac(1, 4) gt.eq (b - frac(1, 2))^2 - frac(1, 4)$

$arrow.double f(a) gt.eq f(b)$

$f$ est decroissante sur $]0, frac(1, 2)]$.

$ast$ soit : $a$ et $b$ deux reels de $]frac(1, 2), 1[$

$a lt.eq b arrow.double 0 lt.eq a - frac(1, 2) lt.eq b - frac(1, 2)$

$arrow.double (a - frac(1, 2))^2 lt.eq (b - frac(1, 2))^2$

$arrow.double (a - frac(1, 2))^2 - frac(1, 4) lt.eq (b - frac(1, 2))^2 - frac(1, 4)$

$arrow.double f(a) lt.eq f(b)$

$f$ est croissante sur $]frac(1, 2), 1[$.

*2)* $g(x) = frac(2, f(x))$

$ast$ soit : $a$ et $b$ deux reels de $]0, frac(1, 2)]$

$a lt.eq b arrow.double 0 > f(a) gt.eq f(b)$

$arrow.double frac(1, f(a)) lt.eq frac(1, f(b)) arrow.double frac(2, f(a)) lt.eq frac(2, f(b))$

$arrow.double g(a) lt.eq g(b)$

$g$ est croissante sur $]0, frac(1, 2)]$.

$ast$ soit : $a$ et $b$ deux reels de $]frac(1, 2), 1[$

$a lt.eq b arrow.double 0 < f(a) lt.eq f(b) arrow.double frac(1, f(a)) gt.eq frac(1, f(b))$

$arrow.double frac(2, f(a)) gt.eq frac(2, f(b))$

$arrow.double g(a) gt.eq g(b)$

$g$ est decroissante sur $]frac(1, 2), 1[$.

*3)* pour $epsilon in ]0, 1[$, on a:

$(x - frac(1, 2))^2 gt.eq 0 arrow.double (x - frac(1, 2))^2 - frac(1, 4) gt.eq -frac(1, 4)$

$arrow.double 0 > f(x) gt.eq -frac(1, 4)$

$g$ admet $-8$ comme maximum en $(frac(1, 2))$.

// Source: Corrige T1 p.5

=== Exercice 6

1. Majorer et minorer sur $RR$ la fonction $g : x mapsto frac(x^2, x^2 + 1)$.

2. a. Montrer que pour tout réel $x$, $2|x| <= x^2 + 1$.

   b. Majorer et minorer sur $RR$ la fonction $x mapsto frac(x^2 - 2x, x^2 + 1)$.

==== Corrigé

*1)* $g(x) = frac(x^2, x^2 + 1)$, $x in I R$

$ast$ pour tout $epsilon in I R$, on a : $g(x) gt.eq 0$

$ast x^2 + 1 gt.eq x^2 arrow.double frac(1, 1 + x^2) lt.eq frac(1, x^2) arrow.double frac(x^2, x^2 + 1) lt.eq 1$

$arrow.double g(x) lt.eq 1$

conclusion : $0 lt.eq g(x) lt.eq 1$ pour tout $x in I R$

*2)* a) pour $x in I R$,

$(x^2 - 1)^2 gt.eq 0 arrow.double x^4 - 2 x^2 + 1 gt.eq 0$

$arrow.double x^4 + 2 x^2 + 1 gt.eq 4 x^2$

$arrow.double (x^2 + 1)^2 gt.eq (2 x)^2$

$arrow.double sqrt((x^2 + 1)^2) gt.eq sqrt((2 x)^2)$

$arrow.double |x^2 + 1| gt.eq |2 x|$

d'ou $x^2 + 1 gt.eq 2|x|$ #h(0.5cm) car $x^2 + 1 gt.eq 0$

b) $ast f(x) = frac(x^2 - 2 x, x^2 + 1)$

$f(x) = frac(x^2, x^2 + 1) - frac(2 x, x^2 + 1)$

on a : $|2 x| lt.eq x^2 + 1 arrow.double -2 x lt.eq x^2 + 1$

$arrow.double frac(-2 x, 1 + x^2) lt.eq 1$

$arrow.double frac(x^2, x^2 + 1) - frac(2 x, x^2 + 1) lt.eq frac(x^2, x^2 + 1) + 1$

$arrow.double f(x) lt.eq g(x) + 1$ or $g(x) lt.eq 1$

$arrow.double f(x) lt.eq 2$

donc : $|f(x)| lt.eq 2$ #h(0.5cm) pour tout $x in I R$

$ast f(x) = g(x) - frac(2 x, x^2 + 1)$

$g(x) gt.eq 0 arrow.double g(x) - frac(2 x, x^2 + 1) gt.eq -frac(2 x, x^2 + 1)$

$arrow.double f(x) gt.eq -frac(2 x, x^2 + 1)$

d'apres a) pour tout $x in I R$ : $2 x lt.eq x^2 + 1$

$arrow.double frac(2 x, x^2 + 1) lt.eq 1 arrow.double frac(-2 x, x^2 + 1) gt.eq -1$

D'ou $f(x) gt.eq -1$

_Conclusion :_

$-1 lt.eq f(x) lt.eq 2$ pour tout $x in RR$

// Source: Corrige T1 p.6

=== Exercice 7

1. Majorer et minorer sur $]0, +infinity[$ la fonction

   $x mapsto frac(2, 1 + sqrt(x))$.

2. Majorer et minorer sur $RR$ la fonction

   $x mapsto frac(1, 1 + (2 + x)^2)$.

3. Majorer et minorer sur $RR$ la fonction

   $x mapsto frac(3, 2 + x^2)$.

==== Corrigé

*1)* $f(x) = frac(1, 1 + sqrt(x)) - 2$ #h(1cm) $x in [0, +infinity[$

$ast x in [0, +infinity[$

$sqrt(x) gt.eq 0 arrow.double 1 + sqrt(x) gt.eq 1$

$arrow.double frac(1, 1 + sqrt(x)) lt.eq 1$

$arrow.double frac(1, 1 + sqrt(x)) - 2 lt.eq -1$

D'ou $f(x) lt.eq -1$

On a : $frac(1, 1 + sqrt(x)) gt.eq 0$

D'ou $frac(1, 1 + sqrt(x)) - 2 gt.eq -2$

Par suite $f(x) gt.eq -2$

_Conclusion :_ pour tout $x in [0, +infinity[$

On a : $-2 lt.eq f(x) lt.eq -1$

*2)* $g(x) = frac(1, 1 + (2 + x)^2) + 1$, #h(0.5cm) $x in RR$

$(2 + x)^2 gt.eq 0 arrow.double 1 + (2 + x)^2 gt.eq 1$

$arrow.double frac(1, 1 + (2 + x)^2) lt.eq 1$

$arrow.double frac(1, 1 + (2 + x)^2) + 1 lt.eq 2$

$arrow.double g(x) lt.eq 2$

pour $x in RR$ on a :

$frac(1, 1 + (2 + x)^2) gt.eq 0$

d'ou $frac(1, 1 + (2 + x)^2) + 1 gt.eq 1$

par suite $g(x) gt.eq 1$

_Conclusion :_

$1 lt.eq g(x) lt.eq 2$ pour tout $x in RR$

*3degree)* $h(x) = frac(2, 1 + frac(1, 2 + x^2))$

pour tout reel $x$ on a :

$frac(1, 2 + x^2) gt.eq 0 arrow.double 1 + frac(1, 2 + x^2) gt.eq 1$

$arrow.double frac(1, 1 + frac(1, 2 + x^2)) lt.eq 1$

$arrow.double frac(2, 1 + frac(1, 2 + x^2)) lt.eq 2$

d'ou $h(x) lt.eq 2$

$2 + x^2 gt.eq 2 arrow.double frac(1, 2 + x^2) lt.eq frac(1, 2)$

$arrow.double 1 + frac(1, 2 + x^2) lt.eq frac(3, 2)$

$arrow.double frac(1, 1 + frac(1, 2 + x^2)) gt.eq frac(2, 3)$

$arrow.double frac(2, 1 + frac(1, 2 + x^2)) gt.eq frac(4, 3)$

d'ou $h(x) gt.eq frac(4, 3)$

// Source: Corrige T1 p.7

_Conclusion :_

$frac(4, 3) lt.eq h(x) lt.eq 2$ pour tout $x in RR$

=== Exercice 8

Le plan est muni d'un repère orthogonal $(O, arrow(i), arrow(j))$.
Soit $P$, $Q$ et $R$ les trinômes définis par

$P(x) = 2x^2 - 5x - 3$ #h(0.5cm) ; #h(0.5cm) $Q(x) = -x^2 + 2x - 1$ #h(0.5cm) ; #h(0.5cm) $R(x) = -2x^2 + x - 5$.

1. Déterminer les zéros éventuels de $P$, $Q$ et $R$.

2. En déduire, pour chaque trinôme, la position relative de sa courbe représentative et de l'axe des abscisses.

3. Résoudre alors les inéquations $frac(P(x), Q(x)) >= 0$ #h(0.5cm) ; #h(0.5cm) $frac(R(x), Q(x)) < 0$.

==== Corrigé

$1degree)$ $ast P(x) = 0 arrow.l.r.double 2 x^2 - 5 x - 3 = 0$

$Delta = 49$

$x' = frac(5 - 7, 4) = -frac(1, 2)$

$x'' = frac(5 + 7, 4) = 3$

$ast Q(x) = 0 arrow.l.r -x^2 + 2 x - 1 = 0$

$arrow.l.r x^2 - 2 x + 1 = 0 arrow.l.r (x - 1)^2 = 0$

$arrow.l.r x - 1 = 0 arrow.l.r x = 1$

$ast R(x) = 0 arrow.l.r -2 x^2 + x - 5 = 0$

$arrow.l.r 2 x^2 - x + 5 = 0$

$Delta = -39 < 0$

$R$ n'admet pas de zero.

*2)* a)

#table(
  columns: 5,
  [$x$], [$-infinity$], [$-1\/2$], [$3$], [$+infinity$],
  [$P(x)$], [$+$], [$0$], [$-$], [$0$], [$+$]
)

$ast$ pour $x in [-frac(1, 2), 3]$

$(C_P)$ est au dessous de l'axe des abscisses

$ast$ pour $x in ]-infinity, -frac(1, 2)[ union ]3, +infinity[$

$(C_P)$ est au dessus de $(O x)$

b) $Q(x) = -(x - 1)^2 lt.eq 0$, d'ou

$(C_Q)$ est au dessous de l'axe des abscisses

c) $(x) = -2 x^2 + x - 5$ ; #h(0.5cm) $Delta = -39 < 0$

donc $R(x) < 0$, pour tout $x in I R$

$(C_R)$ est au dessous de l'axe des abscisses

*3)* a) $frac(P(x), Q(x)) gt.eq 0$

$S_(I R) = [-frac(1, 2), 3] without {1}$

b) $frac(R(x), Q(x)) < 0$

$S_(I R) = emptyset$

// Source: Corrige T1 p.7

=== Exercice 9

Le plan est muni d'un repère orthogonal $(O, arrow(i), arrow(j))$.
Tracer la représentation graphique d'une fonction $f$ qui a les caractéristiques suivantes :

- la fonction $f$ est définie sur $[-4, 4]$,
- la fonction $f$ est paire,
- la fonction $f$ est majorée par 5 sur $[-4, 4]$,
- la fonction $f$ est croissante sur $[0, 1]$ et décroissante sur $[1, 4]$.
- la restriction de $f$ à $[-4, 0]$ admet un minimum égal à $-3$.

A-t-on une unique fonction qui vérifie ces conditions ?

==== Corrigé

$f$ decroissante sur $[1, 4]$
$f$ croissante sur $[0, 1]$

$(C_f)$ est symetrique par rapport a $(O y)$

$f(0) = 1$ ; $f(x) lt.eq 5$ pour tout $x in [-4, 4]$
$-3$ est au minimum de $f$ _sur_ $[-4, 0]$

par exemple :

// TODO: figure complexe -- Courbe de f paire, croissante sur [0,1] avec f(0)=1, f(1)=5,
// decroissante sur [1,4] avec minimum -3, symetrique par rapport a Oy

$ast$ il y a plusieurs.

// Source: Corrige T1 p.8

=== Exercice 10

Le plan est muni d'un repère orthonormé $(O, arrow(i), arrow(j))$.

1. Tracer les représentations graphiques des fonctions $f$ et $g$ définies sur $RR$ par

   $f(x) = |2x - 1| - 3x$ #h(1cm) et #h(1cm) $g(x) = 2 - 2|x|$.

2. Résoudre graphiquement dans $RR$, l'inéquation

   $|2x - 1| + 2|x| > 3x + 2$.

==== Corrigé

*1)* a) $f(x) = |2 x - 1| - 3 x$

$2 x - 1 = 0 (=) x = frac(1, 2)$

pour tout $x in ]-infinity, frac(1, 2)]$

$f(x) = -(2 x - 1) - 3 x = 1 - 5 x$

pour $x in [frac(1, 2), +infinity[$

$f(x) = (2 x - 1) - 3 x = -x - 1$

$f(x) = cases(
  -5 x + 1 & "si" x in ]-infinity\, frac(1, 2)],
  -x - 1 & "si" x in [frac(1, 2)\, +infinity[
)$

$f(frac(1, 2)) = -frac(3, 2)$

b) $g(x) = 2 - 2|x|$

$g(x) = cases(
  2 x + 2 & "si" x lt.eq 0,
  -2 x + 2 & "si" x gt.eq 0
)$

$g$ est paire

// TODO: figure complexe -- Graphique avec les courbes C_d (f) et C_g (g) dans un repere,
// f est affine par morceaux, g est un V inverse

*2)*

$|2 x - 1| + 2|x| > 3 x + 2$

$arrow.l.r.double |2 x - 1| - 3 x > 2 - 2|x|$

$arrow.l.r.double f(x) > g(x)$

$S_RR = ]-infinity; -0,2[ union ]3, +infinity[$

=== Exercice 11

Soit le trinôme défini sur $RR$ par $f(x) = 2x^2 - 4x$.
On désigne par $C_f$ sa courbe représentative dans un repère orthogonal $(O, arrow(i), arrow(j))$.

1. Tracer $C_f$.

2. Soit $g$ la fonction définie sur $RR$ par $g(x) = 2x^4 - 4|x|$.

   a. Étudier la parité de $g$.

   b. Vérifier que les restrictions de $f$ et $g$ à $[0, +infinity[$ sont égales.

   c. Tracer alors $C_g$ la courbe représentative de $g$.

==== Corrigé

$f(x) = 2 x^2 - 4 x$

*1)* $(C_f)$ est une parabole de sommet $S(1, -2)$

d'axe $Delta : x = 1$

$2degree)$ $g(x) = 2 x^2 - 4 dot |x|$

a) pour $x in D_g = RR$

on a : $(-x) in D_g$

et $g(-x) = 2(-x)^2 - 4|-x|$

$= 2 x^2 - 4|x| = g(x)$

$g$ est une fonction paire

b) pour $x in [0, +infinity[$

$g(x) = 2 x^2 - 4 x = f(x)$

c) Voir figure

la droite des ordonnees est un axe de symetrie pour $(C_g)$

// TODO: figure complexe -- Parabole C_f et courbe C_g (symetrique de C_f par rapport a Oy)
// C_f sommet (1,-2), C_g a deux branches symetriques

// Source: Corrige T1 p.8

=== Exercice 12

En utilisant des considérations sur la somme de fonctions, donner le sens de variation des fonctions suivantes.

a. $f(x) = -frac(1, 2) x + 3 + frac(1, x^2)$ sur $]0, +infinity[$.

b. $g(x) = x^2 + 1 + sqrt(x)$ sur $]0, +infinity[$.

c. $h(x) = 1 - x^2 + sqrt(x + 3)$ sur $]0, +infinity[$.

==== Corrigé

a) $f(x) = -frac(1, 2) x + 3 + frac(1, x)$

$I = ]0, +infinity[$

Soit $f_1(x) = -frac(1, 2) x + 3$

$f_2(x) = frac(1, x)$

$f = f_1 + f_2$

// Source: Corrige T1 p.9

pour $a$ et $b in ]0, +infinity[$

$a lt.eq b arrow.double -frac(1, 2) a gt.eq -frac(1, 2) b$

$arrow.double -frac(1, 2) a + 3 gt.eq -frac(1, 2) b + 3$

$arrow.double f_1(a) gt.eq f_2(b)$

$0 < a lt.eq b arrow.double frac(1, a) gt.eq frac(1, b)$

$arrow.double f_2(a) gt.eq f_2(b)$

par suite :

$f_1(a) + f_2(a) gt.eq f_1(b) + f_2(b)$

$arrow.double f(a) gt.eq f(b)$

donc $f$ est decroissante sur $]0, +infinity[$

b) $g = g_1 + g_2$

avec $g_1(x) = x^2 + 1$

$g_2(x) = sqrt(x)$

Soient $a$ et $b in ]0, +infinity[$

$0 < a lt.eq b arrow.double a^2 lt.eq b^2$

$arrow.double a^2 + 1 lt.eq b^2 + 1$

$arrow.double g_1(a) lt.eq g_1(b)$

$0 < a lt.eq b arrow.double sqrt(a) lt.eq sqrt(b)$

$arrow.double g_2(a) lt.eq g_2(b)$

Par suite $g_1(a) + g_2(a) lt.eq g_1(b) + g_2(b)$

$arrow.double g(a) lt.eq g(b)$

donc $g$ est croissante sur $]0, +infinity[$

c) $h = h_1 + h_2$

avec $h_1(x) = 1 - x^2$

$h_2(x) = -sqrt(x + 3)$

Soient $a$ et $b in ]0, +infinity[$

$0 < a lt.eq b arrow.double a^2 lt.eq b^2$

$arrow.double -b^2 lt.eq -a^2$

$arrow.double 1 - b^2 lt.eq 1 - a^2$

$arrow.double h_1(b) lt.eq h_1(a)$

$0 < a lt.eq b arrow.double a + 3 lt.eq b + 3$

$arrow.double sqrt(a + 3) lt.eq sqrt(b + 3)$

$arrow.double -sqrt(b + 3) lt.eq -sqrt(a^2 + 3)$

$arrow.double h_2(b) lt.eq h_2(a)$

Par suite : $h_1(a) + h_2(a) gt.eq h_1(b) + h_2(b)$

$arrow.double h(a) gt.eq h(b)$

donc $h$ est decroissante sur $]0, +infinity[$

=== Exercice 13

On considère la figure ci-dessous où $(C)$ est un cercle de centre $O$ et de rayon 1 et $M$ est un point variable sur le segment $[O A]$ distinct de $O$ et de $A$. On note $O M = x$.

// Cercle de centre O, rayon 1, point A sur Ox, M sur [OA], rectangle PQRS inscrit
#cetz.canvas({
  import cetz.draw: *
  // Axes
  line((-1.5, 0), (2, 0), mark: (end: ">"), stroke: 0.8pt)
  line((0, -1.5), (0, 1.8), mark: (end: ">"), stroke: 0.8pt)
  content((2, -0.3), $x$)
  content((-0.3, 1.8), $y$)
  content((-0.25, -0.25), $O$)
  // Cercle (C) de centre O, rayon 1
  circle((0, 0), radius: 1, stroke: (paint: blue, thickness: 0.8pt))
  // Point A sur l'axe Ox
  circle((1, 0), radius: 0.05, fill: black)
  content((1.1, -0.3), $A$)
  // Point M sur [OA], OM = x
  let mx = 0.6
  circle((mx, 0), radius: 0.05, fill: black)
  content((mx, -0.3), $M$)
  // PM vertical, P sur le cercle : PM = √(1-x²)
  let py = calc.sqrt(1 - mx * mx)
  // Rectangle PQRS symétrique
  line((mx, py), (mx, -py), stroke: (paint: red, thickness: 0.6pt))  // PS vertical
  line((-mx, py), (-mx, -py), stroke: (paint: red, thickness: 0.6pt))  // QR vertical
  line((-mx, py), (mx, py), stroke: (paint: red, thickness: 0.6pt))  // PQ haut
  line((-mx, -py), (mx, -py), stroke: (paint: red, thickness: 0.6pt))  // SR bas
  // Labels
  content((mx + 0.2, py + 0.15), $P$)
  content((-mx - 0.2, py + 0.15), $Q$)
  content((-mx - 0.2, -py - 0.15), $R$)
  content((mx + 0.2, -py - 0.15), $S$)
  // Annotation OM = x
  content((mx / 2, 0.2), $x$, fill: gray)
})

1. Exprimer l'aire $S(x)$ du rectangle $P Q R S$ en fonction de $x$.

2. On désigne par $S$ la fonction qui à $x$ associe $S(x)$.

   a. Quel est l'ensemble de définition de $S$ ?

   b. Donner un maximum et un minimum de $S$.

   c. Montrer que pour tout réel $x$, $4x^2(1 - x^2) <= 1$.

   d. En déduire que la fonction $S$ est majorée par 2.

   e. Pour quelle valeur de $x$, le quadrilatère $P Q R S$ est-il un carré ?
      Montrer que la fonction $S$ admet un maximum en cette valeur.

==== Corrigé

*1)* $S(x) = P S times P Q$

$P Q = 2 O M = 2 x$

Le triangle $O M P$ est rectangle en $M$ donc

$O M^2 + P M^2 = O P^2$

$arrow.double x^2 + P M^2 = 1^2$

$arrow.double P M = sqrt(1 - x^2)$

$P S = 2 P M$

$P S = 2 sqrt(1 - x^2)$

Par suite $S(x) = 4 x dot sqrt(1 - x^2)$

*2)* $S(x) = 4 x dot sqrt(1 - x^2)$

a) $D_S = [0, 1]$ car $M in [O A]$

b) $S(x) gt.eq 0$ pour tout $x in [0, 1]$

$S(x)$ est inferieure a l'aire du disque de centre $O$

de rayon 1 d'ou : $S(x) lt.eq pi times 1^2$

$S(x) lt.eq pi$

// Source: Corrige T1 p.10

*3)* a) soit $x in RR$, on a : $(2 x^2 - 1)^2 gt.eq 0$

$arrow.double 4 x^4 - 4 x^2 + 1 gt.eq 0$

$arrow.double 4 x^2 - 4 x^4 lt.eq 1$

$arrow.double 4 x^2(1 - x^2) lt.eq 1$

b) $S(x) = 4 x sqrt(1 - x^2)$ avec $x in [0, 1]$

pour $x in [0, 1]$ on a $0 lt.eq 4 x^2(1 - x^2) lt.eq 1$

d'ou $0 lt.eq sqrt(4 x^2(1 - x^2)) lt.eq sqrt(1)$

$arrow.double 0 lt.eq 2|x| dot sqrt(1 - x^2) lt.eq 1$

$arrow.double 0 lt.eq 2 x sqrt(1 - x^2) lt.eq 1$

$arrow.double 4 x sqrt(1 - x^2) lt.eq 2$

$arrow.double S(x) lt.eq 2$

*4)* a) $P Q R S$ est un carre lorsque $P Q = P S$

$arrow.l.r.double x = sqrt(1 - x^2)$ et $x in [0, 1]$

$arrow.l.r.double x^2 = 1 - x^2$ avec $x in [0, 1]$

$arrow.l.r.double 2 x^2 = 1$ et $x in [0, 1]$

$arrow.l.r.double x^2 = frac(1, 2)$ et $x in [0, 1]$

$arrow.l.r.double x = frac(1, sqrt(2))$

b) pour $x = frac(1, sqrt(2))$

$S(x) = 2$ et comme $S(x) lt.eq 2$

donc $S$ admet 2 comme maximum en $frac(1, sqrt(2))$

=== Exercice 14

Dans une feuille rectangulaire de dimension $21 "cm" times 30 "cm"$ on découpe un carré suivant le schéma ci-dessous. Avec ce carré on réalise un cylindre de révolution.

// Schéma : découpe d'un carré de côté x dans un rectangle 21×30
#cetz.canvas(length: 0.15cm, {
  import cetz.draw: *
  // Rectangle principal 30 × 21
  rect((0, 0), (30, 21), stroke: 0.8pt)
  content((15, -1.5), $30 "cm"$)
  content((-2.5, 10.5), $21 "cm"$)
  // Carré découpé (en bas à gauche)
  rect((1, 1), (13, 13), stroke: (paint: blue, thickness: 1pt), fill: rgb("#e3f2fd"))
  content((7, 7), $x$)
  // Annotations
  line((1, -0.5), (13, -0.5), mark: (start: "|", end: "|"), stroke: 0.5pt)
  content((7, -2), $x$)
})

1. Quelle est la longueur du côté du plus grand carré que l'on puisse obtenir ?
   Calculer le volume du cylindre que ce carré permet de réaliser.

2. On découpe un carré de côté $x$.

   a. À quel intervalle appartient $x$ ?

3. Exprimer le volume $V(x)$ du cylindre obtenu en fonction de $x$.

4. Déterminer une valeur approchée de $x$ à 1 cm près pour laquelle on obtient un cylindre de volume 400 cm³.

==== Corrigé

*1)* La longueur du cote du plus grand carre est $21 "cm"$

Soit R: le rayon d'un cercle de perimetre $21 "cm"$

On a : $2 pi R = 21$ d'ou $R = frac(21, 2 pi)$

$V = pi R^2 h$

$V = pi (frac(21, 2 pi))^2 times 21$

$V = frac(21^3, 4 pi) = frac(9261, 4 pi)$

$V = frac(9261, 4 pi) "cm"^3$

*2)* a) $x in ]0, 21]$

b) $V = frac(x^3, 4 pi) "cm"^3$

c) $V = 400 arrow.l.r.double frac(x^3, 4 pi) = 400$

$arrow.l.r.double x^3 = 1600 pi$

$arrow.l.r.double x = 17,127$

$x approx 17 "cm"$

// Source: Corrige T1 p.10

=== Exercice 15

1. Soit la fonction $f : t mapsto -20t^2 + 880t + 100$.

   a. Étudier le signe de $f$.

   b. Étudier les variations de $f$.

2. Le comptable d'une entreprise, créée en janvier 1995, estime que les bénéfices annuels bruts de l'entreprise sont de $B(n) = -20n^2 + 880n + 100$ en milliers de dinars, $n$ années après sa création.
   On note $B$ la fonction qui modélise la situation.

   2. Quel est l'ensemble de définition de $B$ ?

   3. Donner une estimation des bénéfices annuels bruts en janvier 2000.

   4. a. À partir des variations de la fonction $f$, déterminer celles de la fonction $B$.

      b. En quelle année $A_0$, les bénéfices annuels bruts atteindront-ils leur valeur maximale ? Donner une estimation de ce maximum.

      c. Quelles prédictions peut-on faire pour l'entreprise après l'année $A_0$ ?

==== Corrigé

*1)* $f(t) = -20 t^2 + 880 t + 100$

a) $-20 t^2 + 880 t + 100 = 0$

$arrow.l.r.double -t^2 + 44 t + 5 = 0$

$arrow.l.r.double t^2 - 44 t - 5 = 0$

$Delta' = 489$

$t' = 22 - sqrt(489)$ #h(0.5cm) et #h(0.5cm) $t'' = 22 + sqrt(489)$

#table(
  columns: 5,
  [$t$], [$-infinity$], [$22 - sqrt(489)$], [$22 + sqrt(489)$], [$+infinity$],
  [$f(t)$], [$-$], [$0$], [$+$], [$0$], [$-$]
)

b) $f(t) = -20 dot [t^2 - 44 t - 5]$

$f(t) = -20[(t - 22)^2 - 22^2 - 5]$

d'ou $f(t) = -20 dot [(t - 22)^2 - 489]$

Soient $a$ et $b in ]-infinity, 22]$

// Source: Corrige T1 p.11

$a lt.eq b lt.eq 22 arrow.double a - 22 lt.eq b - 22 lt.eq 0$

$arrow.double (a - 22)^2 gt.eq (b - 22)^2$

$arrow.double (a - 22)^2 - 489 gt.eq (b - 22)^2 - 489$

$arrow.double -20[(a - 22)^2 - 489] lt.eq -20[(b - 22)^2 - 489]$

$arrow.double f(a) lt.eq f(b)$

donc $f$ est croissante sur $]-infinity, 22]$

pour $a$ et $b in [22, +infinity[$

$22 lt.eq a lt.eq b arrow.double 0 lt.eq a - 22 lt.eq b - 22$

$arrow.double (a - 22)^2 lt.eq (b - 22)^2$

$arrow.double (a - 22)^2 - 489 lt.eq (b - 22)^2 - 489$

$arrow.double -20[(a - 22)^2 - 489] gt.eq -20[(b - 22)^2 - 489]$

$arrow.double f(a) gt.eq f(b)$

donc $f$ est decroissante sur $[22, +infinity[$

*2)* $D_B = [0, 22 + sqrt(489)]$ d'apres 1)a)

*3)* $2000 arrow.long t = 5$

$B(5) = sqrt(4000) = 63,24$ milles dinars

*4)* a) $B(t) = sqrt(f(t))$

$f$ est croissante sur $[0, 22]$

donc $B$ est croissante sur $[0, 22]$

$f$ est decroissante sur $[22, 22 + sqrt(489)]$

donc $B$ est decroissante sur

$[22, 22 + sqrt(489)]$

b) $B(t)$ est maximal pour $t = 22 arrow.long$
annee 2017

$A_m = 2017$

$B(22) = sqrt(9780)$

$B(22) = 98,89$ milles dinars

c) apres l'annee $A_m$ les benefices annuels bruts de l'entreprise commencent a decroitre.

On prevoit donc que l'entreprise commence a affronter des difficultes et finira par fermer ses portes.

// Source: Corrige T1 p.11

=== Exercice 16

Le plan est muni d'un repère orthonormé $(O, arrow(i), arrow(j))$.

1. Tracer les représentations graphiques des fonctions $f$ et $g$ définies sur $[0, +infinity[$ par

   $f(x) = sqrt(x + 1) - 1$ #h(1cm) et #h(1cm) $g(x) = 2x$.

2. Résoudre graphiquement sur $[0, +infinity[$, l'inéquation

   $frac(sqrt(x + 1) - 1, 2sqrt(x)) <= 1$. // Note: lecture approximative, vérifier avec le corrigé

==== Corrigé

*1)* $f(x) = sqrt(x + 1) - 1$

$g(x) = 2 x$, #h(1cm) $x in [0, +infinity[$

// TODO: figure complexe -- Graphique avec courbe C_f (racine translatee) et droite C_g (y=2x),
// C_f part de (0,0), C_g est une droite passant par l'origine

*2)* $cases(frac(sqrt(x + 1) - 1, sqrt(x)) lt.eq 2 sqrt(x), x in [0\, +infinity[)$

$arrow.l.r.double cases(sqrt(x + 1) - 1 lt.eq 2 x, x > 0)$

$arrow.l.r.double cases(f(x) lt.eq g(x), x > 0)$

$S = ]0, +infinity[$ #h(0.5cm) car $(C_f)$ est au dessous de $(C_g)$

=== Exercice 17

Soit le trinôme défini par $f(x) = x^2 - 6x + 6$.
On désigne par $C$ sa courbe représentative dans un repère orthogonal $(O, arrow(i), arrow(j))$.

1. Donner la forme canonique de $f$, c'est-à-dire trouver les réels $a$, $b$ et $c$ tels que pour tout réel $x$,
   $f(x) = a(x + b)^2 + c$.

2. Déterminer les variations de $f$.

3. Préciser par quelle transformation géométrique obtient-on $C$ à partir de la parabole d'équation $y = x^2$.

4. Tracer la courbe $C$.

5. Résoudre graphiquement, puis par le calcul, les inéquations $f(x) <= 0$, $f(x) < 2$ et $f(x) >= -4$.

==== Corrigé

$f(x) = x^2 - 6 x + 6$

*1)* $f(x) = (x - 3)^2 - 9 + 6$

$f(x) = (x - 3)^2 - 3$

// Source: Corrige T1 p.12

*2)* Soient $a$ et $b in ]-infinity, 3]$

$f$ est decroissante sur $]-infinity, 3]$

pour $a$ et $b in [3, +infinity[$

$3 lt.eq a lt.eq b arrow.double 0 lt.eq a - 3 lt.eq b - 3$

$arrow.double (a - 3)^2 lt.eq (b - 3)^2$

$arrow.double (a - 3)^2 - 3 lt.eq (b - 3)^2 - 3$

$arrow.double f(a) lt.eq f(b)$

$f$ est croissante sur $]3, +infinity]$

*3)* $(P) : y = x^2$

$(C)$ est l'image de $(P)$ par la translation

de vecteur $arrow(u) = 3 dot arrow(i) - 3 dot arrow(j)$

*4)* $(C)$ est la parabole de sommet $S(3, -3)$

d'axe $Delta : x = 3$

// TODO: figure complexe -- Parabole de sommet S(3,-3) avec axe x=3,
// passant par les points (0,6), (3-sqrt(3),0), (3+sqrt(3),0)

*5)* a) graphiquement $f(x) lt.eq 0$ _pour_

$x in [1,3; 4,7]$

_Calculs :_

$f(x) = 0 arrow.l.r.double x^2 - 6 x + 6 = 0$

$Delta = 36 - 24 = 12$

$sqrt(Delta) = 2 sqrt(3)$

$x' = frac(6 - 2 sqrt(3), 2) = 3 - sqrt(3)$ ; #h(0.5cm) $x'' = 3 + sqrt(3)$

#table(
  columns: 5,
  [$x$], [$-infinity$], [$3 - sqrt(3)$], [$3 + sqrt(3)$], [$+infinity$],
  [$f(x)$], [$+$], [$0$], [$-$], [$0$], [$+$]
)

$f(x) lt.eq 0 arrow.l.r.double x in [3 - sqrt(3), 3 + sqrt(3)]$

b) Graphiquement :

On trace la droite d'equation $y = 2$

$f(x) < 2$ pour $x in ]0,8; 5,2[$

_Calculs :_

$f(x) < 2 arrow.l.r.double (x - 3)^2 - 3 < 2$

$arrow.l.r.double (x - 3)^2 < 5$

$arrow.l.r.double |x - 3| < sqrt(5)$

$arrow.l.r.double -sqrt(5) < x - 3 < sqrt(5)$

$arrow.l.r.double 3 - sqrt(5) < x < 3 + sqrt(5)$

$S_RR = ]3 - sqrt(5), 3 + sqrt(5)[$

c) Graphiquement :

$f(x) gt.eq -4$

$S_RR = RR$ car la droite d'equation $y = -4$

est au dessous de $(C)$

_Calculs :_

$f(x) gt.eq -4 arrow.l.r.double x^2 - 6 x + 6 gt.eq -4$

$arrow.l.r.double x^2 - 6 x + 10 gt.eq 0$

$Delta = -4 < 0$

Le signe de $(x^2 - 6 x + 10)$ est celui

de $a = 1$

donc $x^2 - 6 x + 10 > 0$ pour tout $x in RR$

$S_RR = RR$

// Source: Corrige T1 p.13

=== Exercice 18

Soit $f$ la fonction définie sur $[-2, +infinity[$ par
$f(x) = sqrt(x + 2) - 3$.
On désigne par $C_f$ sa courbe représentative dans un repère orthonormé $(O, arrow(i), arrow(j))$.

1. Déterminer les variations de $f$.

2. Préciser par quelle transformation géométrique obtient-on la courbe $C_f$ à partir de la courbe d'équation $y = sqrt(x)$.

On considère la fonction $h$ définie sur $[-2, +infinity[$ par $h(x) = sqrt(x^2 + 2) + 3$ et on désigne par $C_h$ sa courbe représentative dans le repère $(O, arrow(i), arrow(j))$.

2. Préciser la position relative de $C_f$ et $C_h$.

3. Tracer $C_f$ et $C_h$.

4. Soit $Q$ le demi-plan d'inéquation $y >= 0$ et $C$ la courbe
   $(C_f union C_h) sect Q$.

   a. Mettre en évidence $C$ sur un second graphique.

   b. De quelle fonction $k$, $C$ est-elle la représentation graphique ?

==== Corrigé

$f(x) = sqrt(x + 2) - 3$

$D_f = [-2, +infinity[$

*1)* Soient $a$ et $b in [-2, +infinity[$

$-2 lt.eq a lt.eq b arrow.double 0 lt.eq a + 2 lt.eq b + 2$

$arrow.double sqrt(a + 2) lt.eq sqrt(b + 2)$

$arrow.double sqrt(a + 2) - 3 lt.eq sqrt(b + 2) - 3$

$arrow.double f(a) lt.eq f(b)$

$f$ est croissante sur $[-2, +infinity[$

*2)* $(H) : y = sqrt(x)$

$g(x) = sqrt(x)$ pour $x in [-2, +infinity[$

$f(x) = g(x + 2) - 3$

donc $(C_f)$ est l'image de $(H)$ par la

translation de vecteur $arrow(u) = -2 dot arrow(i) - 3 dot arrow(j)$

*2')* $h(x) = -sqrt(x + 2) + 3$

$h(x) = -f(x)$

$f(x) gt.eq h(x) arrow.l.r.double$

$sqrt(x + 2) - 3 gt.eq -sqrt(x + 2) + 3 arrow.l.r.double$

$2 sqrt(x + 2) gt.eq 6 arrow.l.r.double sqrt(x + 2) gt.eq 3 arrow.l.r.double$

$x + 2 gt.eq 9 arrow.l.r.double x gt.eq 7$

$ast$ $C_f$ est au dessous de $C_g$ pour $x in [-2, 7]$

$ast$ $C_f$ est au dessus de $C_g$ pour $x in [7, +infinity[$

// TODO: figure complexe -- Graphique avec C_f (racine translatee) et C_h (symetrique par rapport a y=0)
// Les deux courbes se croisent en x=7

*3)* $(C_h) = S_((O x))(C_f)$

// TODO: figure complexe -- Graphique montrant C_f et C_h symetriques par rapport a l'axe Ox

*4)* $(C) = (C_f union C_h) sect Q$

$Q : y gt.eq 0$

// TODO: figure complexe -- Partie positive des deux courbes

b) $k(x) = |h(x)| = |f(x)|$

$k(x) = |sqrt(x + 2) - 3|$

// Source: Corrige T1 p.13-14

=== Exercice 19

Soit $f$ la fonction définie sur $RR without {-3}$ par $f(x) = frac(x - 1, x + 3)$.
On désigne par $C$ sa courbe représentative dans un repère orthogonal $(O, arrow(i), arrow(j))$.

1. Déterminer les réels $a$, $b$ et $c$ tels que pour tout réel $x$ différent de $-3$, $f(x) = frac(a, x + b) + c$.

2. Déterminer les variations de $f$.

3. Tracer la courbe $C$.

4. Déterminer graphiquement le nombre de solutions dans $RR$ de l'équation $frac(x - 1, x + 3) = frac(x^2, 4)$.

==== Corrigé

$f(x) = frac(x - 1, x + 3)$

$D_f = RR without {-3}$

*1)* $f(x) = frac((x + 3) - 4, x + 3)$

$f(x) = frac(x + 3, x + 3) - frac(4, x + 3)$

$f(x) = 1 - frac(4, x + 3)$

pour $x eq.not -3$ $f(x) = frac(-4, x + 3) + 1$

$(a = -4 ; b = 3 ; c = 1)$

*2degree)* Soient $a$ et $b in ]-infinity, -3[$

$a lt.eq b arrow.double a + 3 lt.eq b + 3 lt.eq 0$

$arrow.double frac(1, a + 3) gt.eq frac(1, b + 3)$

$arrow.double frac(-4, a + 3) lt.eq frac(-4, b + 3)$

$arrow.double frac(-4, a + 3) + 1 lt.eq frac(-4, b + 3) + 1$

$arrow.double f(a) lt.eq f(b)$

donc $f$ est croissante sur $]-infinity, -3[$

de meme $f$ est croissante sur $]-3, +infinity[$

*3)*
$(C)$ est une hyperbole d'asymptotes les droites

d'equations respectives $x = -3$ et $y = 1$

de centre $r(-3, 1)$

// TODO: figure complexe -- Hyperbole avec asymptotes x=-3 et y=1,
// centre r(-3,1), deux branches

*4)* $frac(x - 1, x + 3) = x^2 - 4 arrow.l.r.double$

$f(x) = g(x)$ #h(0.5cm) avec #h(0.5cm) $g(x) = x^2 - 4$

Soit $(C_g)$ la parabole d'equation $y = x^2 - 4$

$(C_g)$ est de sommet $S(0, -4)$

$f(x) = g(x) arrow.l.r.double x approx -1,7$ ou $x approx 2,1$

// Source: Corrige T1 p.14

=== Exercice 20

Le plan est muni d'un repère orthonormé $(O, arrow(i), arrow(j))$.
Résoudre graphiquement le système

$ S : cases(
  y = frac(3, x),
  y = x - 2.
) $

==== Corrigé

Soit $(H)$ l'hyperbole d'eq : $y = frac(3, x)$

$f(x) = frac(3, x)$

$Delta$ : la droite d'eq : $y = x - 2$

$g(x) = x - 2$

// TODO: figure complexe -- Hyperbole y=3/x et droite y=x-2 se coupant en deux points

$(H) sect Delta = {A(-1, -3); B(3, 1)}$

$S_(RR^2) = {(-1, -3); (3, 1)}$

=== Exercice 21

Le plan est muni d'un repère orthogonal $(O, arrow(i), arrow(j))$.
Résoudre graphiquement l'inéquation

$frac(x - 1, x - 3) <= 2$.

==== Corrigé

pour $x in RR without {3}$, on pose

$f(x) = frac(x - 1, x - 3)$

$f(x) = frac((x - 3) + 2, x - 3) = frac(x - 3, x - 3) + frac(2, x - 3)$

$= 1 + frac(2, x - 3)$

$(C_f)$ est l'hyperbole centre $omega(3, 1)$

d'asymptotes $x = 3$ et $y = 1$

// TODO: figure complexe -- Hyperbole centre (3,1), droite y=2, intersection

$frac(x - 1, x - 3) lt.eq 2$

$S_RR = ]-infinity, 3[ union [5, +infinity[$

// Source: Corrige T1 p.15

=== Exercice 22

Le plan est muni d'un repère orthogonal $(O, arrow(i), arrow(j))$.
Résoudre graphiquement l'inéquation

$sqrt(x) - 3 <= x^2$.

// Source: Manuel T1 p.19

==== Corrigé

$f(x) = sqrt(x - 3)$ ; #h(0.5cm) $g(x) = x^2$

$f(x) lt.eq g(x)$

// TODO: figure complexe -- Graphique avec courbe racine C_g et parabole C_f,
// C_f est au dessous de C_g pour x >= 3

$(C_f)$ est au dessous de $(C_g)$ ; #h(0.5cm) $S_RR = [3, +infinity[$

== Avec l'ordinateur

On considère les fonctions $f$ et $g$ définies par $f(x) = x^2 + 1$ et $g(x) = sqrt(x)$.
On désigne par $C_f$ et $C_g$ leurs représentations graphiques respectives dans le plan muni d'un repère orthonormé $(O, arrow(i), arrow(j))$. Soit $D$ la droite d'équation $y = x$.

On se propose dans cette séquence, de construire la courbe représentative de la fonction définie sur $RR$ par $h(x) = sqrt(x^2 + 1)$.

1. Ouvrir un nouveau fichier CABRI.

2. Montrer les axes, ainsi que la grille.

3. a. Afficher l'expression `x ^ 2 + 1`.

   b. Appliquer l'expression `x ^ 2 + 1` (la courbe $C_f$ est alors tracée).

4. a. Afficher $sqrt(x)$ en tapant `x ^ 0.5`.

   b. Appliquer cette expression (la courbe $C_g$ est alors tracée).

5. a. Afficher l'expression `x`.

   b. Appliquer cette expression (la droite $D$ d'équation $y = x$ est alors tracée).

6. Sélectionner un point sur $C_f$ que l'on nommera $M$.

7. Construire le point $N$ de $D$ ayant la même ordonnée que celle de $M$.
   Expliquer la construction.

8. Construire le point $P$ de $C_g$ ayant la même abscisse que celle de $N$.

9. Construire le point $Q$ tel que le quadrilatère $M N P Q$ soit un rectangle.

// Figure CABRI : C_f (y=x²+1), C_g (y=√x), D (y=x), et lieu de Q (y=√(x²+1))
#cetz.canvas({
  import cetz.draw: *
  // Axes
  line((-1, 0), (5, 0), mark: (end: ">"), stroke: 0.8pt)
  line((0, -1), (0, 5), mark: (end: ">"), stroke: 0.8pt)
  content((5, -0.3), $x$)
  content((-0.3, 5), $y$)
  content((-0.3, -0.3), $O$)
  // Graduations
  for i in range(1, 5) {
    line((i, -0.08), (i, 0.08), stroke: 0.3pt)
    line((-0.08, i), (0.08, i), stroke: 0.3pt)
  }
  // D : y = x (droite en pointillés)
  line((-0.5, -0.5), (4.5, 4.5), stroke: (paint: gray, thickness: 0.6pt, dash: "dashed"))
  content((4.2, 4.8), $D$)
  // C_f : y = x² + 1 (parabole)
  bezier((-0.8, 1.64), (0, 1), (-0.4, 1.16), (-0.2, 1.02), stroke: (paint: blue, thickness: 0.8pt))
  bezier((0, 1), (2, 5), (0.8, 1.64), (1.5, 3.25), stroke: (paint: blue, thickness: 0.8pt))
  content((1.8, 4.5), text(fill: blue)[$C_f$])
  // C_g : y = √x
  bezier((0, 0), (1, 1), (0.3, 0.55), (0.6, 0.77), stroke: (paint: red, thickness: 0.8pt))
  bezier((1, 1), (4, 2), (2, 1.41), (3, 1.73), stroke: (paint: red, thickness: 0.8pt))
  content((4.2, 2.2), text(fill: red)[$C_g$])
  // Lieu de Q : y = √(x² + 1)
  bezier((-0.8, 1.28), (0, 1), (-0.4, 1.08), (-0.2, 1.01), stroke: (paint: green.darken(20%), thickness: 1pt))
  bezier((0, 1), (2, 2.24), (0.8, 1.28), (1.5, 1.8), stroke: (paint: green.darken(20%), thickness: 1pt))
  bezier((2, 2.24), (4, 4.12), (2.8, 2.83), (3.5, 3.54), stroke: (paint: green.darken(20%), thickness: 1pt))
  content((3.5, 4.5), text(fill: green.darken(20%))[$y = sqrt(x^2 + 1)$])
})

10. Avec l'outil « Lieu », tracer le lieu des points $Q$ lorsque $M$ varie sur $C_f$.
    Montrer qu'une équation de ce lieu est $y = sqrt(x^2 + 1)$.

// Source: Manuel T1 p.20

== Math – culture

Augustin Cauchy publia en 1821 ses _Cours d'analyse_, qui eurent très grande audience et constituèrent le premier exposé rigoureux sur les fonctions numériques. Rénovant l'analyse fonctionnelle, il formalise, en particulier, les notions de limite, de fonction et de continuité sur un intervalle.

// [Portrait d'Augustin Cauchy]

// *****************************************************************************
// FIN PARTIE I : MANUEL SCOLAIRE (CNP)
// *****************************************************************************
