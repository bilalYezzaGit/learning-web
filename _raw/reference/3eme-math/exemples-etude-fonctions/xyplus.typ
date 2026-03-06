// ==========================================================================
// XY Plus 3eme Math - Tome 1 - Chapitre 7
// Exemples d'etude de fonctions
// Source : XY Plus 3eme Math Tome 1 (CAEU Med Ali - Zied Belhadj, Lassaad Kallel)
// Pages PDF : 96 a 141
// ==========================================================================

#import "@preview/cetz:0.3.4"

// =========================================================================
// RESUME DE COURS
// =========================================================================

// Source: XY Plus T1 p.96
= Chapitre 7 : Exemples d'etude de fonctions

== 1. Elements de symetries d'une courbe

Le plan est muni d'un repere orthogonal $(O, arrow(i), arrow(j))$.

Soit $f$ une fonction definie sur un ensemble $D$ et $cal(C)$ sa courbe representative.

=== Axe de symetrie

La droite $Delta : x = a$ est un axe de symetrie de $cal(C)$, si et seulement si,
pour tout $x$ appartenant a $D$, $2a - x$ appartient a $D$ et $f(2a - x) = f(x)$

=== Centre de symetrie

La droite $I(a, b)$ est centre de symetrie de $cal(C)$, si et seulement si,
pour tout $x$ appartenant a $D$, $2a - x$ appartient a $D$ et $f(2a - x) = 2b - f(x)$

== 2. Branches paraboliques

=== Fonction polynome

*Theoreme*

Soit $f$ un fonction polynome de degre $n$, $n gt.eq 2$. Alors $frac(f(x), x)$ tend vers l'infini quand $x$ tend vers l'infini.

On dit que la courbe representative $cal(C)$ de $f$ dans un repere $(O, arrow(i), arrow(j))$ admet une *branche parabolique de direction* $(O, arrow(j))$, au voisinage de l'infini.

La courbe $cal(C)$ aura l'une des 4 formes suivantes :

#figure(
  cetz.canvas({
    import cetz.draw: *
    // Parabolic branch shapes (4 forms)
    // Form 1: opens up-right
    set-style(stroke: (paint: black, thickness: 0.8pt))
    line((-1, 0), (1, 0), mark: (end: ">"))
    line((0, -1), (0, 1), mark: (end: ">"))
    content((1.1, -0.2), $arrow(i)$)
    content((-0.2, 1.1), $arrow(j)$)
    content((-0.2, -0.2), $O$)
    // Upward parabola
    bezier((-0.6, -0.8), (0, -0.3), (-0.3, -0.8))
    bezier((0, -0.3), (0.6, 0.8), (0.3, 0.0))
    // Downward parabola
    bezier((-0.6, 0.8), (0, 0.3), (-0.3, 0.8))
    bezier((0, 0.3), (0.6, -0.8), (0.3, 0.0))
  }),
  caption: [Branches paraboliques de direction $(O, arrow(j))$]
)

=== Fonction $sqrt(f)$

*Theoreme*

Soit $f$ la fonction $f : x arrow.r.bar sqrt(a x + b)$, $a eq.not 0$. Alors $frac(f(x), x)$ tend vers zero quand $x$ tend vers l'infini.

On dit que la courbe representative $cal(C)$ de $f$ dans un repere $(O, arrow(i), arrow(j))$ admet une *branche parabolique de direction* $(O, arrow(i))$ au voisinage de l'infini.

La courbe $cal(C)$ aura l'une des 4 formes suivantes :

#figure(
  cetz.canvas({
    import cetz.draw: *
    set-style(stroke: (paint: black, thickness: 0.8pt))
    line((-1, 0), (1, 0), mark: (end: ">"))
    line((0, -1), (0, 1), mark: (end: ">"))
    content((1.1, -0.2), $arrow(i)$)
    content((-0.2, 1.1), $arrow(j)$)
    content((-0.2, -0.2), $O$)
    // Sqrt-type curves (horizontal parabolic branches)
    bezier((-0.8, -0.5), (0.8, 0.2), (0, -0.2))
    bezier((-0.8, 0.5), (0.8, -0.2), (0, 0.2))
  }),
  caption: [Branches paraboliques de direction $(O, arrow(i))$]
)

// =========================================================================
// ENONCES DES EXERCICES
// =========================================================================

// Source: XY Plus T1 p.97
= EXERCICES

== Exercice 1

On considere la fonction $f$ definie sur $RR$ par $f(x) = x^2 + 4x$.

$cal(C)$ est la representation graphique de $f$ dans un repere orthonorme $(O, arrow(i), arrow(j))$.

1) #[
  a) Etudier $f$ et tracer $cal(C)$.

  b) Determiner graphiquement et suivant les valeurs du reel $k$ le nombre de solutions de l'equation $x^4 + 4x^2 + k = 0$.
]

2) Soit $F(-2, -frac(15, 4))$ et $Delta$ la droite d'equation $y = -frac(17, 4)$.

  a) Montrer que $M in cal(C) arrow.l.r.double M F = M H$ avec $H$ le projete orthogonal de $M$ sur $Delta$.

  b) Soit $M(a, f(a))$ un point de la courbe $cal(C)$ et $H$ son projete orthogonal sur la droite $Delta$.

  Montrer que la tangente $(T)$ a $cal(C)$ en $M$ est la mediatrice du segment $[F H]$

  c) En deduire un procede pour construire la tangente a la parabole au point $M$.

3) Soit la fonction $g : x arrow.r.bar (x + 1)^2 - 2|x + 1| - 3$.

  On designe par $cal(C)'$ sa representation graphique dans le repere $(O, arrow(i), arrow(j))$.

  a) Montrer que la droite $D$ d'equation $x = -1$ est un axe de symetrie de $cal(C)'$.

  b) Tracer $cal(C)'$ en utilisant la courbe $cal(C)$.

  c) Interpreter graphiquement la derivabilite de $g$ en $-1$.

  d) Dresser le tableau de variation de $g$ en utilisant $cal(C)'$.

// Source: XY Plus T1 p.97 (suite)
== Exercice 2

Soient les fonctions $f : x arrow.r.bar x^2 - 4x + 2$ et $g : x arrow.r.bar -x^2 - 4x + 2$.

$cal(C)_f$ et $cal(C)_g$ les representations graphiques respectives de $f$ et $g$ sur un repere orthonorme $(O, arrow(i), arrow(j))$.

1) #[
  a) Etudier $f$ et $g$.

  b) Montrer que $cal(C)_f$ et $cal(C)_g$ sont tangentes au point d'abscisse $0$.

  c) Tracer $cal(C)_f$ et $cal(C)_g$.
]

2) Soit $h : x arrow.r.bar cases(x^2 - 4x + 2 quad & "si" x gt.eq 0, -x^2 - 4x + 2 quad & "si" x < 0)$

  a) Verifier que $h$ est derivable en zero.

  b) Tracer la courbe $(Gamma)$ de $h$ dans le repere $(O, arrow(i), arrow(j))$.

  c) Montrer que $Omega(0, 2)$ est un centre de symetrie de $(Gamma)$.

3) Soit $D_a$ la droite d'equation $y = a x + 2$, $a in RR$.

  Determiner suivant $a$ le nombre de points d'intersection de $(Gamma)$ et $D_a$.

// Source: XY Plus T1 p.98
== Exercice 3

Soit la fonction $f$ definie, pour tout $x$ reel, par : $f(x) = -2x^3 + 3x^2 + 2$

1) Etudier et construire sa courbe representative $cal(C)$ dans un repere orthonorme $(O, arrow(i), arrow(j))$.

2) Montrer que $omega(frac(1, 2), frac(5, 2))$ est un centre de symetrie $cal(C)$.

3) Donner l'equation de la courbe $cal(C)$ dans le repere $(omega, arrow(i), arrow(j))$. Retrouver le resultat de la question 2.

4) Ecrire l'equation de la tangente a $cal(C)$ au point d'abscisse $x_0$. Determiner les equations des tangentes a $cal(C)$ issues du point $A(2, -2)$.

5) Determiner graphiquement et suivant $m$ le nombre de solutions de l'equation $(E_m) : 2x(x - 3) = frac(2 - m, x)$ (ou $m$ est un parametre reel).

// Source: XY Plus T1 p.98 (suite)
== Exercice 4

On considere la fonction $f$ definie sur $RR$ par $f(x) = x^3 - 6x^2 + 9x - 2$.

$cal(C)$ est la representation graphique de $f$ dans un repere orthonorme $(O, arrow(i), arrow(j))$.

I/

1) Dresser le tableau de variation de $f$.

2) Donner une equation de la tangente $Delta$ a $cal(C)$ au point $I(2, 0)$.

  Etudier la position relative de $cal(C)$ par rapport sa tangente $Delta$ en $I$.

3) #[
  a) Tracer $cal(C)$ et $Delta$.

  b) En deduire que l'equation $f(x) = 0$ admet exactement trois solutions $2$, $x_1$ et $x_2$ et faire le tableau de signe de $f(x)$.

  (On ne cherchera pas a determiner $x_1$ et $x_2$).
]

4) Soit $D_k$ la droite de coefficient directeur $k$ ($k in RR$) et passant par le point de $cal(C)$ d'abscisse zero.

  a) Donner une equation cartesienne de $D_k$.

  b) Determiner $k$ pour que $D_k$ coupe $cal(C)$ en deux points distincts $M'$ et $M''$ autre que $A(0, -2)$.

  c) Lorsque $D_k$ coupe $cal(C)$ en deux points distincts autre que $A$ determiner l'ensemble des points $I_k$ milieu de $[M' M'']$ lorsque $k$ varie.

II/ Soit $g$ la fonction definie par $g(x) = cases(x^3 - 6x^2 + 9x - 2 quad & "si" x lt.eq 3, (x - 3)^2 (x - 6) - 2 quad & "si" x > 3)$

1) Montrer que $g$ est continue en $3$.

2) Montrer que $g$ est derivable sur $RR$ et calculer $g'(x)$.

3) Soient $Omega(3, -2)$ et $Gamma$ la representation graphique de $g$ dans le repere $(O, arrow(i), arrow(j))$.

  Montrer que $Omega$ est un centre de symetrie de $Gamma$.

4) En deduire la construction de $Gamma$.

// Source: XY Plus T1 p.99
== Exercice 5

On considere la fonction $f$ definie sur $RR$ par $f(x) = x^3 - 3x^2 + 4$.

$cal(C)$ est la representation graphique de $f$ dans un repere $(O, arrow(i), arrow(j))$.

1) #[
  a) Dresser le tableau de variation de $f$.

  b) Montrer que $cal(C)$ admet un centre de symetrie que l'on precisera.

  c) Tracer $cal(C)$.
]

2) Soit $g$ la fonction definie par $g(x) = |x|^3 - 3x^2 + 2$.

  $cal(C)'$ la courbe de $g$ dans le repere $(O, arrow(i), arrow(j))$.

  a) Tracer $cal(C)'$ en utilisant $cal(C)$.

  b) Determiner graphiquement et suivant les valeurs de $k$ le nombre de solutions de l'equation $(E_k) : |x|^3 - 3(x^2 + k) - 2 = 0$.

3) Soit $h : x arrow.r.bar frac(1, 4) x^3 - frac(3, 2) x^2 + 8$.

  $Gamma$ est la courbe representative de $h$ dans le repere $(O, arrow(i), arrow(j))$.

  a) Montrer que pour tout reel $x$, on a : $h(2x) = 2f(x)$.

  b) En deduire que $Gamma$ est l'image de $cal(C)$ par une homothetie de centre $O$ et de rapport qu'on precisera.

// Source: XY Plus T1 p.99 (suite)
== Exercice 6

Soit $f$ la fonction definie par $f(x) = sqrt(x^2 + x + 1)$ et soit $g = -f$.

On designe par $cal(C)_f$ et $cal(C)_g$ leurs courbes representatives dans un repere orthogonal $(O, arrow(i), arrow(j))$.

1) Determiner le domaine de definition $D_f$ de la fonction $f$.

2) #[
  a) Determiner la forme canonique de $x^2 + x + 1$.

  b) Montrer que les droites $Delta_1 : y = x + frac(1, 2)$ est asymptote a $cal(C)_f$ au voisinage de $+infinity$.

  c) Preciser la position relative de la courbe $cal(C)_f$ par rapport a $Delta_1$.

  d) Montrer que la droite $Delta : x = -frac(1, 2)$ est un axe de symetrie pour $cal(C)_f$.
]

3) Etudier $f$ et tracer $cal(C)_f$ et $cal(C)_g$.

4) Verifier que $cal(C)_f union cal(C)_g$ a pour equation $x^2 - y^2 + x + 1 = 0$.

5) On considere les vecteurs $arrow(u) = arrow(i) + arrow(j)$, $arrow(v) = -arrow(i) + arrow(j)$ et $Omega(-frac(1, 2), 0)$.

  a) Determiner une equation de $(Gamma) = cal(C)_f union cal(C)_g$ dans le repere $(Omega, arrow(u), arrow(v))$.

  b) Conclure.

// Source: XY Plus T1 p.99-100
== Exercice 7

Soit $f$ la fonction definie par $f(x) = sqrt(x^2 - 2x - 3)$

On designe par $cal(C)$ la courbe representative de $f$ dans un repere orthonorme $(O, arrow(i), arrow(j))$.

// Source: XY Plus T1 p.100
1) Etudier les variations de $f$.

2) Montrer que $f$ n'est pas derivable a droite en $3$. Interpreter graphiquement le resultat.

3) Montrer que la courbe $cal(C)$ de $f$ admet la droite $D : x = 1$ comme axe de symetrie.

4) #[
  a) Montrer que la courbe $cal(C)$ de $f$ admet la droite $Delta : y = x - 1$ comme asymptote au voisinage de $+infinity$.

  b) Montrer que pour tout reel $x$, $x^2 - 2x - 3 < (x - 1)^2$

  c) En deduire la position de la courbe $cal(C)$ par rapport a $Delta$.
]

5) Tracer la courbe $cal(C)$.

6) Soit $g$ la fonction definie par $g(x) = sqrt(|x^2 - 2x - 3|)$

  En utilisant $cal(C)$, tracer la courbe $cal(C)'$ de $g$ dans le meme repere.

7) Soit $h$ la fonction definie par $h(x) = sqrt(|x^2 - 2x| - 3)$

  Tracer la courbe de $cal(C)''$ en utilisant la courbe $cal(C)$.

// Source: XY Plus T1 p.100 (suite)
== Exercice 8

On considere la fonction $f$ definie sur $RR backslash {-2, 2}$ par $f(x) = frac(2x^2 - 3x + 2, x^2 - 4)$

On designe par $cal(C)$ sa courbe representative dans un repere orthogonal $(O, arrow(i), arrow(j))$.

1) On se propose de determiner les reels $a$, $b$ et $c$ tels que $f(x) = a + frac(b, x + 2) + frac(c, x - 2)$ pour tout $x$ different de $2$ et $-2$.

  a) Calculer $lim_(x arrow 2) (x - 2) f(x)$ et en deduire la valeur de $c$.

  b) Calculer $lim_(x arrow -2) (x + 2) f(x)$ et en deduire la valeur de $b$.

  c) Calculer $lim_(x arrow +infinity) f(x)$ et en deduire la valeur de $a$.

2) Etudier $f$.

3) Tracer la courbe $cal(C)$.

4) Soit $m$ un reel. Discuter suivant les valeurs de $m$ le nombre de points d'intersection de $cal(C)$ avec la droite d'equation $y = m$.

5) #[
  a) Determiner l'abscisse du point ou $cal(C)$ coupe son asymptote parallele a $(O x)$.

  En deduire la position de $cal(C)$ par rapport a son asymptote horizontale.
]

6) En utilisant $cal(C)$ tracer la courbe de la fonction $g : x arrow.r.bar f(-|x|)$.

// Source: XY Plus T1 p.100 (suite)
== Exercice 9

1) Etudier la fonction $f$ definie par $f(x) = frac(2x - 3, x^2 - 3x + 2)$ et preciser les asymptotes de la courbe $cal(C)$ de $f$.

2) #[
  a) Construire sa courbe representative dans un repere orthogonal $(O, arrow(i), arrow(j))$

  b) Soit $Omega(frac(3, 2), 0)$. Ecrire l'equation de $cal(C)$ dans le repere $(Omega, arrow(i), arrow(j))$.

  En deduire que $Omega$ est un centre de symetrie de $cal(C)$.
]

// Source: XY Plus T1 p.101
== Exercice 10

On considere la fonction definie par $f(x) = frac(6 + x - x^2, 2 - x)$

1) Etudier $f$ et tracer sa courbe $cal(C)$ dans un repere orthonorme $(O, arrow(i), arrow(j))$.

2) Soit $g$ la fonction definie par $g(x) = |frac(x - 3, x - 2)| (x + 2)$

  a) En utilisant $cal(C)$ tracer la courbe $cal(C)'$ dans le meme repere.

  b) Determiner le tableau de variation de $g$.

// Source: XY Plus T1 p.101 (suite)
== Exercice 11

On appelle $f$ la fonction numerique de la variable reelle definie sur $]-2, +infinity[$ :

$ f(x) = frac(x^2 + 4x + 2, 2(x + 2)) $

On note $cal(C)$ sa courbe representative dans le repere orthonorme $(O, arrow(i), arrow(j))$ d'unite graphique 2 cm.

1) Etudier la limite de $f(x)$ lorsque $x$ tend vers $-2$.

  En deduire l'existence d'asymptote $D$ a la courbe $cal(C)$.

  Donner une equation de cette asymptote.

2) #[
  a) Etudier la limite de $f(x)$ lorsque $x$ tend vers $+infinity$.

  b) Determiner trois nombres reels $a$, $b$ et $c$ tels que pour tout $x$ appartenant a $]-2, +infinity[$, $f(x) = a x + b + frac(c, x + 2)$.

  c) Montrer que la droite $Delta : y = frac(x, 2) + 1$ est asymptote a la courbe $cal(C)$.

  Etudier la position relative de la courbe $cal(C)$ et la droite $Delta$.
]

3) #[
  a) Montrer que pour tout $x$ appartenant a $]-2, +infinity[$ : $f'(x) = frac(1, 2) + frac(1, (x + 2)^2)$.

  b) En deduire les variations de la fonction $f$ et dresser le tableau de variation de cette fonction sur $]-2, +infinity[$.
]

4) Tracer les asymptotes $D$ et $Delta$ et la courbe $cal(C)$.

5) Soit $delta_m : y = frac(1, 2) x + m$ ou $m$ est un parametre reel.

  Determiner, graphiquement, le nombre de points d'intersection de $cal(C)$ et la droite $delta_m$.

6) #[
  a) Tracer sur le meme graphique la courbe representative $cal(H)$ de la fonction de la variable reelle definie sur $]0, +infinity[$ par $h(x) = frac(1, x)$.

  b) Determiner graphiquement une valeur approchee a $10^(-1)$ pres de la solution de l'equation $f(x) = h(x)$.
]

7) #[
  a) Montrer que sur $]0, +infinity[$ l'equation $f(x) = h(x)$ est equivalente a $x^3 + 4x^2 - 4 = 0$.

  b) Soit $g$ la fonction definie sur $]0, +infinity[$ par $g(x) = x^3 + 4x^2 - 4$.

  Montrer que l'equation $g(x) = 0$ admet une solution unique $x_0$ sur l'intervalle $[0.5 ; 1]$.

  c) Determiner une valeur approchee de $x_0$ a $10^(-2)$ pres par defaut.
]

// Source: XY Plus T1 p.102 (suite de l'exercice 11)
8) Soit $k$ la fonction definie par $cases(k(x) = frac(x^2 + 4x + 2, 2(x + 2)) quad & "si" -2 < x < x_0, k(x) = frac(1, x) quad & "si" x gt.eq x_0)$

  Donner le trace de la courbe de $k$ en utilisant les courbes $cal(C)$ et $cal(H)$.

  Donner le tableau de variation de $k$.

// Source: XY Plus T1 p.102
== Exercice 12

Soit $f : x arrow.r.bar frac(x^2 + 2x - 2, x - 1)$

On note $cal(C)$ sa courbe representative dans le repere orthonorme $(O, arrow(i), arrow(j))$.

1) #[
  a) Montrer que pour tout $x in RR backslash {1}$, $f(x) = a x + b + frac(c, x - 1)$ ou $a$, $b$ et $c$ des reels a determiner.

  b) En deduire que $cal(C)$ admet deux asymptotes dont on donnera les equations.

  c) Montrer que $Omega(1, 4)$ est un centre de symetrie de $cal(C)$.
]

2) #[
  a) Etudier les variations de $f$.

  b) Tracer $cal(C)$ dans un repere orthonorme $(O, arrow(i), arrow(j))$.
]

3) Soit $D$ la droite de coefficient directeur $k$ ($k in RR$) et passant par $Omega$.

  a) Donner une equation de $D_k$.

  b) Determiner suivant les valeurs de $k$ le nombre de points d'intersection de $cal(C)$ et $D_k$.

  c) Dans le cas ou $D_k$ coupe $cal(C)$ en deux points $M'$ et $M''$ :
    - Verifier que $Omega$ est le milieu de $[M' M'']$.
    - Montrer que les tangentes a $cal(C)$ en $M'$ et $M''$ sont paralleles.

4) Soit $g : x arrow.r.bar frac(x^2, |x| - 1)$

  a) Verifier que pour tout $x in RR_+ backslash {1}$, $g(x) = f(x) - 2$.

  b) En deduire la construction $cal(C)'$ courbe de $g$.

  c) Dresser alors le tableau de variations de $g$.

// Source: XY Plus T1 p.102-103
== Exercice 13

Soit $f : x arrow.r.bar frac(x^2 - 3x + 3, x - 2)$

On note $cal(C)$ sa courbe representative dans le repere $(O, arrow(i), arrow(j))$

1) Etudier les variations de $f$.

2) #[
  a) Montrer que la droite $D : y = x - 1$ est une asymptote oblique a $cal(C)$.

  b) Etudier la position relative de $cal(C)$ et $D$.

  c) Construire $cal(C)$.
]

// Source: XY Plus T1 p.103
  d) Ecrire une equation de $cal(C)$ dans le repere $(Omega, arrow(u), arrow(j))$ avec $arrow(u) = arrow(i) + arrow(j)$ ; et en deduire que $Omega$ est un centre de symetrie de $cal(C)$.

3) Soit $D_a$ la droite d'equation $y = -3x + a$, $a in RR$.

  a) Determiner les equations des tangentes a $cal(C)$ paralleles a $D_a$ et faire la construction.

  b) Montrer que les abscisses des points d'intersection de $cal(C)$ et $D_a$ sont les solutions de l'equation : $(E) : 4x^2 - (9 + a) x + 3 + 2a = 0$

  c) Determiner suivant les valeurs de $a$ le nombre de points d'intersection de $cal(C)$ et $D_a$.

  d) Verifier les resultats graphiquement.

4) La droite $D_a$ coupe l'asymptote verticale en $P$ et l'asymptote oblique en $Q$, on suppose que $D_a$ coupe $cal(C)$ en deux point $M'$ et $M''$.

  a) Determiner les coordonnees de $P$ et $Q$

  b) Montrer que $overline(P M') dot overline(Q M')$ est constante qu'on precisera

5) Soit $g : x arrow.r.bar frac(x^2 - 3x + 3, |x - 2|)$

  a) Utiliser $cal(C)$ pour tracer $cal(C)'$ courbe de $g$

  b) Dresser le tableau de variations de $g$

  c) Determiner graphiquement et suivant les valeurs du reel $m$ le nombre de solutions ainsi que leurs signes de l'equation $(E_m) : x^2 - 3(x + m|x - 2|) + 3(1 - |x - 2|) = 0$

// =========================================================================
// CORRIGES
// =========================================================================

// Source: XY Plus T1 p.104
= CORRIGES

== Corrige Exercice 1

$f : x arrow.r.bar x^2 + 4x$

1) a) $f$ est une fonction polynome donc derivable sur $RR$ :

$f'(x) = 2x + 4$

$f'(x) = 0 arrow.l.r.double x = -2$.

#figure(
  table(
    columns: 4,
    align: center,
    [$x$], [$-infinity$], [$-2$], [$+infinity$],
    [$f'(x)$], [], [$0$], [],
    [$f(x)$], [], [], [],
  ),
  caption: [Tableau de variation de $f$]
)

// Variation: f'(x) < 0 pour x < -2 (f decroissante de +inf a -4)
// f'(x) > 0 pour x > -2 (f croissante de -4 a +inf)

$lim_(|x| arrow +infinity) f(x) = lim_(|x| arrow +infinity) x^2 = +infinity$

b) $x^4 + 4x^2 + k = 0$ $(E_k)$

$arrow.l.r.double x^4 + 4x^2 = -k$

on pose $X = x^2 gt.eq 0$ l'equation devient :

$X^2 + 4X = -k$ et $X gt.eq 0$ $quad (E'_k)$

$f(X) = -k$ avec $X gt.eq 0$

Soit $Delta_k$ la droite d'equation $y = -k$.

Le nombre de solutions de $cases(f(X) = -k, X gt.eq 0)$ est egal au nombre de points d'intersections de la droite $Delta_k$ et la branche $cal(C)_+$ de $cal(C)$ definie par les abscisses positives.

Donc :

Si $-k < 0 arrow.l.r.double k > 0$ alors $cal(C)_+ sect Delta_k = emptyset$
$arrow.double$ nombre de solutions $= 0$

Si $k = 0$ alors $cal(C)_+ sect Delta_k = {O}$
$arrow.double$ nombre de solutions de $E'_k =$ nombre de solutions de $E_k = 1$

Si $-k > 0 arrow.l.r.double k < 0$ alors $cal(C)_+ sect Delta_k = {1 "pt"}$
$arrow.double$ nombre de solutions $E'_k =$ une solution $alpha$ strictement positive
$arrow.double$ nombre de solutions $E'_k = 2$ solutions $sqrt(alpha)$ et $-sqrt(alpha)$

// Source: XY Plus T1 p.105
2) a) #underline[1er sens] :

soit $M(x, f(x)) in cal(C) arrow.double H(x, -frac(17, 4))$

$M F^2 = (x + 2)^2 + (y + frac(15, 4))^2$ avec $y = f(x) = x^2 + 4x$

$= x^4 + 8x^3 + frac(49, 2) x^2 + 34x + frac(289, 16)$

$M H^2 = (x - x)^2 + (y + frac(17, 4))^2$

$= x^4 + 8x^3 + frac(49, 2) x^2 + 34x + frac(289, 16)$

donc $M F^2 = M H^2$ d'ou $M F = M H$.

#underline[2eme sens] : $M(x, y) in P$ tq $M F = M H$

$H(x, -frac(17, 4))$ et $M F^2 = M H^2$

$arrow.double (x + 2)^2 + (y + frac(15, 4))^2 = (y + frac(17, 4))^2$

$arrow.double x^2 + 4x + 4 + cancel(y^2) + frac(15, 2) y + frac(225, 16) = cancel(y^2) + frac(17, 2) y + frac(289, 16)$

$arrow.double y = x^2 + 4x$

$arrow.double M in cal(C)$

Conclusion : $M in cal(C) arrow.l.r.double M F = M H$.

b) $M(a, f(a))$ et $H(a, -frac(17, 4))$.

$T : y = f'(a)(x - a) + f(a)$ d'ou $T : y = (2a + 4)(x - a) + a^2 + 4a$

$T : y = (2a + 4) x - a^2$. $arrow(u) vec(1, 2a + 4)$ est un vecteur directeur de $T$.

$F(-2, -frac(15, 4))$ $H(a, -frac(17, 4))$ donc $arrow(F H) vec(a + 2, -frac(1, 2))$.

$arrow(u) dot arrow(F H) = (a + 2) + (-frac(1, 2))(2a + 4) = a + 2 - a - 2 = 0$.

Soit $I$ le milieu de $[F H]$. On a : $I(frac(-2 + a, 2), -4)$.

Verifions que $I(frac(-2 + a, 2), -4)$ appartient a $T : y = (2a + 4) x - a^2$,

$(2a + 4)(frac(-2 + a, 2)) - a^2 = (a + 2)(a - 2) - a^2 = a^2 - 4 - a^2 = -4$

D'ou $I$ appartient a la tangente $T$.

Conclusion : La droite $T$ est la perpendiculaire a $[F H]$ passant par son milieu donc $T$ est la mediatrice de $[F H]$.

c) Methode de construction d'une tangente a la parabole $cal(C)$ en un point $M$ :

Soit $M$ un point de la parabole $cal(C)$.

// Source: XY Plus T1 p.106
On projette orthogonalement $M$ sur $Delta : y = -frac(17, 4)$. On obtient un point $H$.

La mediatrice de $[F H]$ est la tangente en $M$ a $cal(C)$.

3) $g : x arrow.r.bar (x + 1)^2 - 2|x + 1| - 3$.

  a) $D_g = RR$ $D : x = -1$ axe de symetrie de $cal(C)'$ ssi $g(2a - x) = g(x)$ avec $a = -1$

  $2a - x = -2 - x$

  $g(-2 - x) = (-2 - x + 1)^2 - 2|-2 - x + 1| - 3 = (-1 - x)^2 - 2|-1 - x| - 3 = g(x)$

  Donc $D$ est un axe de symetrie de $cal(C)'$.

  b) Si $x lt.eq -1$ alors $|x + 1| = -x - 1$

  Donc $g(x) = (x + 1)^2 + 2(x + 1) - 3 = x^2 + 2x + 1 + 2x + 2 - 3 = x^2 + 4x = f(x)$

  Donc sur $]-infinity, -1] : cal(C)' = cal(C)$.

  On trace la partie de $cal(C)'$ de sur $[-1, +infinity[$ par symetrie par rapport a $D$.

  c) Le point d'abscisse $-1$ est un point anguleux pour la courbe $cal(C)'$ de $g$ donc $g$ n'est pas derivable en $-1$.

  La courbe $cal(C)'$ admet, a gauche, au point d'abscisse $-1$ une demi tangente

  d) Tableau de variations de $g$ a partir de $cal(C)'$ :

  // Tableau: x de -inf a -2: f'(x) -, g decroit de +inf a -4
  // x = -2: g'(x) = 0, g(-2) = -4
  // x de -2 a -1: g'(x) +, g croit de -4 a -3
  // x = -1: g'(x) n'existe pas (|-2|), g(-1) = -3
  // x de -1 a 0: g'(x) -, g decroit de -3 a -4
  // x = 0: g'(x) = 0, g(0) = -4
  // x de 0 a +inf: g'(x) +, g croit de -4 a +inf

// Source: XY Plus T1 p.107
== Corrige Exercice 2

1) a) $f : x arrow.r.bar x^2 - 4x + 2$ : $f$ polynome donc derivable sur $RR$. $f'(x) = 2x - 4$

  // Tableau de variation de f:
  // x: -inf ... 2 ... +inf
  // f'(x): - 0 +
  // f(x): +inf \ -2 / +inf

  $lim_(|x| arrow +infinity) f(x) = lim_(|x| arrow +infinity) x^2 = +infinity$

  $g : x arrow.r.bar -x^2 - 4x + 2$ : $g$ polynome donc derivable sur $RR$. $g'(x) = -2x - 4$

  // Tableau de variation de g:
  // x: -inf ... -2 ... +inf
  // g'(x): + 0 -
  // g(x): -inf / 6 \ -inf

  $lim_(|x| arrow +infinity) g(x) = lim_(|x| arrow +infinity) -x^2 = -infinity$

  b) $f'(0) = g'(0) = -4$

  $f(0) = g(0) = 2$

  $arrow.double cal(C)_f$ et $cal(C)_g$ admettent la meme tangente au point d'abscisse zero : $T : y = -4x + 2$

  $arrow.double cal(C)_f$ et $cal(C)_g$ sont tangentes d'abscisse zero.

// Source: XY Plus T1 p.108
2) a) $h : x arrow.r.bar cases(f(x) quad & "si" x gt.eq 0, g(x) quad & "si" x < 0)$

  $h$ derivable a droite en zero et $h'_d (0) = f'(0) = -4$

  $h$ derivable a gauche et $h'_g (0) = g'(0) = -4$

  $h'_g (0) = h'_d (0) = -4 arrow.double h$ derivable en zero et $h'(0) = -4$

  b) Voir figure.

  c) $h$ etant definie sur $RR$ donc pour tout $x in RR$, $-x in RR$.

  - Si $x > 0$, on a $-x < 0$ :

  $h(x) + h(-x) = f(x) + g(-x) = x^2 - 4x + 2 - x^2 - 4(-x) + 2 = 4 = 2 times 2$

  - Si $x < 0$, on a $-x > 0$ :

  $h(x) + h(-x) = g(x) + f(-x) = -x^2 - 4x + 2 - x^2 + 4x + 2 = 4 = 2 times 2$

  - Si $x = 0$, $h(2 times 0 - 0) + h(0) = 2 h(0) = 4$

  On conclut que pour tout reel $x$, $h(-x) + h(x) = 2 times 2$ donc le point $Omega(0, 2)$ est un centre de symetrie pour la courbe $(Gamma)$.

3) $M(x, y) in D_a sect Gamma arrow.l.r.double cases(y = a x + 2, y = f(x)) "ou" cases(y = a x + 2, y = g(x))$

  $arrow.double f(x) = a x + 2$ ou $g(x) = a x + 2$

  donc le nombre de points d'intersection de $D_a$ et $Gamma$ est egal au nombre de solutions des equations

  donc : $x^2 - 4x + 2 = a x + 2$ ou $-x^2 - 4x + 2 = a x + 2$

  $arrow.double x^2 - (4 + a) x = 0$ ou $-x^2 - (4 + a) x = 0$

  $arrow.double x = 0$ ou $x = 4 + a$ ou $x = -4 - a$

  donc - Si $a = -4$ alors on a une seule solution : $x = 0$
  $arrow.double$ un seul point d'intersection

  - Si $a eq.not -4$ alors on a trois solutions $arrow.double D_a sect Gamma = {3 "points"}$

// Source: XY Plus T1 p.108-109
== Corrige Exercice 3

1) La fonction $f$ est definie, continue et derivable sur $bold(R)$ puisque c'est une fonction polynome.

  Pour tout reel $x$, $f'(x) = -6x^2 + 6x$

  $f'(x) = 0 arrow.l.r.double 6x(-x + 1) = 0 arrow.l.r.double x = 0$ ou $x = 1$

  // Tableau de variation:
  // x: -inf ... 0 ... 1 ... +inf
  // f'(x): - 0 + 0 -
  // f(x): +inf \ 2 / 3 \ -inf

// Source: XY Plus T1 p.109
2) Pour tout $x in bold(R)$, on a $(2 times frac(1, 2) - x) in bold(R)$.

  $f(2 times frac(1, 2) - x) = f(1 - x) = -2(1 - x)^3 + 3(1 - x)^2 + 2$

  $= -2(1 - 3x + 3x^2 - x^3) + 3(1 - 2x + x^2) + 2$

  $= -2 + 6x - 6x^2 + 2x^3 + 3 - 6x + 3x^2 + 2$

  $= 2x^3 - 3x^2 + 3$

  $2 times frac(5, 2) - f(x) = 5 - (-2x^3 + 3x^2 + 2) = 5 + 2x^3 - 3x^2 - 2 = 2x^3 - 3x^2 + 3$

  Donc $f(2 times frac(1, 2) - x) = 2 times frac(5, 2) - f(x)$.

  D'ou le point $omega (frac(1, 2), frac(5, 2))$ est un centre de symetrie pour la courbe $cal(C)$ de $f$.

3) On ecrit l'equation de la courbe $cal(C)$ dans le repere $(omega, arrow(i), arrow(j))$.

  Soit $M(x, y)$ dans le repere $(O, arrow(i), arrow(j))$ et $M(X, Y)$ dans le repere $(omega, arrow(i), arrow(j))$.

  $arrow(O M) = arrow(O Omega) + arrow(Omega M) = frac(1, 2) arrow(i) + frac(5, 2) arrow(j) + X arrow(i) + Y arrow(j)$

  $= (frac(1, 2) + X) arrow(i) + (frac(5, 2) + Y) arrow(j)$ et $arrow(O M) = x arrow(i) + y arrow(j)$ donc $cases(x = frac(1, 2) + X, y = frac(5, 2) + Y)$

  $M(x, y) in cal(C) arrow.l.r.double f(x) = y$

  $arrow.l.r.double frac(5, 2) + Y = -2(frac(1, 2) + X)^3 + 3(frac(1, 2) + X)^2 + 2$

  $arrow.l.r.double frac(5, 2) + Y = -frac(1, 4) - frac(3, 2) X - 3 X^2 - 2X^3 + frac(3, 4) + 3X + 3X^2 + 2$

  $arrow.l.r.double frac(5, 2) + Y = frac(5, 2) + frac(3, 2) X - 2X^3$

  $arrow.l.r.double Y = -2X^3 + frac(3, 2) X$

  $arrow.l.r.double G(X) = Y$

  Dans le repere $(omega, arrow(i), arrow(j))$, la courbe $cal(C)$ est la courbe representative de la fonction $G$ definie sur $RR$ par $G(X) = -2X^3 + frac(3, 2) X$.

  Cette fonction est impaire, $omega$ l'origine du repere est un centre de symetrie pour $cal(C)$.

  $cal(C)$ admet deux branches paraboliques de direction $(O, arrow(j))$, l'une au voisinage de $+infinity$ et l'autre au voisinage de $-infinity$.

// Source: XY Plus T1 p.110
4) Soit $(T)$ une tangente a la courbe $cal(C)$ au point d'abscisse $x_0$.

  $(T) : y = f'(x_0)(x - x_0) + f(x_0)$ d'ou $(T) : y = (-6x_0^2 + 6x_0)(x - x_0) + (-2x_0^3 + 3x_0^2 + 2)$

  $(T) : y = (-6x_0^2 + 6x_0) x + 4x_0^3 - 3x_0^2 + 2$

  $(T)$ est issue du point $A(2 ; -2)$ c'est a dire $(T)$ passe par $A(2 ; -2)$ si et seulement si

  $-2 = (-6x_0^2 + 6x_0) 2 + 4x_0^3 - 3x_0^2 + 2$

  $4x_0^3 - 15x_0^2 + 12x_0 + 4 = 0$ $(E)$

  On remarque que la courbe $cal(C)$ passe par le point $A(2 ; -2)$.

  Donc $x_0 = 2$ est une racine de l'equation $(E)$. Par consequent :

  $(E) arrow.l.r.double (x_0 - 2)(4x_0^2 + b x_0 - 2) = 0 arrow.l.r.double 4x_0^3 + (b - 8)x_0^2 - 2(b + 1) x_0 + 4 = 0$.

  Cette egalite est vraie pour tout reel $x_0$ si et seulement si

  $cases(b - 8 = -15, b + 1 = -16) arrow.l.r.double b = -7$

  L'equation $(E)$ est equivalente a $(x_0 - 2)(4x_0^2 - 7x_0 - 2) = 0$

  $arrow.l.r.double x_0 = 2$ ou $4x_0^2 - 7x_0 - 2 = 0$

  $arrow.l.r.double x_0 = frac(7 - 9, 8) = frac(-1, 4)$ ou $x_0 = frac(7 + 9, 8) = 2$

  Deux tangentes $(T_1)$ et $(T_2)$ sont issues de $A$, l'une au point d'abscisse $x_0 = 2$ c'est le point $A$, et l'autre $(T_2)$ au point d'abscisse $-frac(1, 4)$. La tangente $(T_2)$ correspond a la tangente au point $B(-frac(1, 4), frac(71, 32))$.

5) Pour tout $x$ different de $0$, l'equation $2x(x - 3) = frac(2 - m, x)$ est equivalente a :

  $2x^2 - 3x = frac(2 - m, x)$

  $2x^3 - 3x^2 = 2 - m$

  $-2x^3 + 3x^2 + 2 = m$

  $f(x) = m$

  Donc le nombre de solutions de l'equation $2x(x - 3) = frac(2 - m, x)$ est le nombre de points, d'abscisses non nulles, d'intersection entre $cal(C)$ et $D_m : y = m$ ou $m$ est un parametre reel.

  On remarque que $f(0) = 2$ donc au niveau de $m = 2$, il faut tenir compte de la condition exigee sur $x$.

  // Tableau de discussion:
  // m: -inf ... 2 ... 3 ... +inf
  // Nombre de points communs a D_m et C: 1 | (1) | 3 | (2) | 1

// Source: XY Plus T1 p.111
== Corrige Exercice 4

$f(x) = x^3 - 6x^2 + 9x - 2$

I/

1) $f$ est une fonction polynome donc derivable sur $RR$ et pour tout $x in RR$ :

  $f'(x) = 3x^2 - 12x + 9$

  $f'(x) = 0 arrow.l.r.double 3x^2 - 12x + 9 = 0$

  $a + b + c = 0 arrow.double x = 1$ ou $x = frac(c, a) = 3$

  // Tableau de variation:
  // x: -inf ... 1 ... 3 ... +inf
  // g'(x): + 0 - 0 +
  // g(x): -inf / 2 \ -2 / +inf

  $lim_(x arrow -infinity) f(x) = lim_(x arrow -infinity) x^3 = -infinity$ ; $lim_(x arrow +infinity) f(x) = lim_(x arrow +infinity) x^3 = +infinity$

2) $Delta$ : tangente a $cal(C)$ en $I(2, 0)$

  $arrow.double Delta : y = f'(2)(x - 2) + f(2)$

  $Delta : y = -3x + 6$

  *Position relative de $Delta$ et $cal(C)$* :

  $f(x) - y_Delta = x^3 - 6x^2 + 9x - 2 + 3x - 6 = x^3 - 6x + 12x - 8$

  $= (x - 2)^3 = (x - 2)(x - 2)^2$

  // Tableau de signe:
  // x: -inf ... -2 ... +inf
  // x - 2: - 0 +
  // Position de C par rapport a Delta: C au dessous de Delta / C inter Delta = {I} \ C au dessus de Delta

3) a) Construction :

  La courbe $(cal(C))$ admet deux branches paraboliques de direction $(O, arrow(j))$, l'une au voisinage de $+infinity$ et l'autre au voisinage de $-infinity$.

// Source: XY Plus T1 p.112
  b) $cal(C)$ coupe l'axe de abscisse en trois points d'abscisses $x_1$, $x_2$ et $2$ ($x_1 < x_2$) donc l'equation $f(x) = 0$ admet exactement trois solutions distinctes $x_1$, $x_2$ et $2$.

  // Tableau de signe de f(x):
  // x: -inf ... x_1 ... 2 ... x_2 ... +inf
  // f(x): - 0 + 0 - 0 +

  ($cal(C)$ au dessous de $(O, arrow(i)) arrow.double f(x) < 0$)

  ($cal(C)$ au dessus de $(O, arrow(i)) arrow.double f(x) > 0$)

4) a) $D_k$ de coefficient directeur $k arrow.double D_k : y = k x + b$

  $D_k$ passe par $A(0, -2) arrow.double b = -2 arrow.double D_k : y = k x - 2$

  b) $M(x, y) in D_k sect cal(C) arrow.l.r.double cases(y = k x - 2, y = f(x))$

  $f(x) = k x - 2 arrow.double x^3 - 6x^2 + 9x - 2 = k x - 2$

  $arrow.double x^3 - 6x^2 + (9 - k) x = 0$ $(E_k)$

  $(E_k) arrow.l.r.double x [x^2 - 6x + 9 - k] = 0$

  $arrow.l.r.double x = 0$ ou $x^2 - 6x + 9 - k = 0$

  $Delta_k$ coupe $cal(C)$ en deux points distincts $M'$ et $M''$ autre que $A$ si l'equation $(E'_k) : x^2 - 6x + 9 - k = 0$ admet deux solutions distinctes et non nulles ;

  or zero est solution de $(E'_k)$ lorsque $k = 9$ et dans ce cas $Delta_k$ coupe $cal(C)$ en deux points $A(0, 7)$ et $B(6, f(6))$.

  Ainsi, $Delta_k$ coupe $cal(C)$ en deux points distincts $M'$ et $M''$ autre que $A$ si et seulement si $cases(k eq.not 9 "(solution non nulle)", Delta' = 9 - 9 + k > 0 "(le discriminant reduit de" E'_k")")$

  ce qui equivaut a $cases(k eq.not 9, k > 0)$

  Conclusion : $Delta_k$ coupe $cal(C)$ en deux points distincts $M'$ et $M''$ autre que $A$ lorsque $k in ]0, +infinity[ backslash {9}$

// Source: XY Plus T1 p.113
  c) $M'(x', y')$, $M''(x'', y'')$ ; $x'$ et $x''$ solution de l'equation $(E'_k)$

  $I_k (x, y)$ tel que $cases(x = frac(x' + x'', 2), y = k x - 2 "(car" I_k in D_k")")$

  $frac(x' + x'', 2) = frac(S, 2) = frac(-b, 2a)$ ($S$ : Somme des solutions d'une equation du second degre $arrow.double S = frac(-b, a)$ dans $(E'_k)$ $cases(a = 1, b = -6)$)

  $= frac(6, 2) = 3$

  $arrow.double I_k : cases(x = 3, y = 3k - 2)$ avec $k > 0$ et $k eq.not 9$

  $arrow.double 3k - 2 > -2$ et $3k - 2 eq.not 25$

  donc l'ensemble des points $I_k$ est defini par : $cases(x = 3, y in ]-2, +infinity[ backslash {25})$

  ou bien l'ensemble des points $I_k$ est $[E F] backslash {E, F}$ avec $E(3, -2)$ et $F(3, 25)$

II/ $g : x arrow.r.bar cases(f(x) quad & "si" x lt.eq 3, (x - 3)^2 (x - 6) - 2 quad & "si" x > 3)$

1) Continuite de $g$ :

  $f$ est continue sur $RR$ donc continue a gauche en $3$ et $f(x) = g(x)$ pour tout $x in [3, +infinity[$

  donc $lim_(x arrow 3^-) g(x) = f(3) = -2$

  La fonction $h : x arrow.r.bar (x - 3)^2 (x - 6)$ est polynome donc continue sur $RR$ et en particulier $h$ est continue a droite en $3$.

  Pour tout $x in ]3, +infinity[$, $g(x) = h(x)$ donc $lim_(x arrow 3^+) g(x) = h(3) = -2$

  $lim_(x arrow 3^-) g(x) = lim_(x arrow 3^+) g(x) = -2$ donc $g$ est continue en $3$

2) - Sur $]-infinity, 3[$ : $g(x) = f(x) arrow.double g$ est derivable sur $]-infinity, 3[$, $g'(x) = f'(x)$

  - Sur $]3, +infinity[$ : $g(x) = (x - 3)^2 (x - 6) - 2$.

  $g$ est derivable sur $]3, +infinity[$ (operations sur les fonctions derivables)

  et $g'(x) = [(x - 3)^2]' (x - 6) + (x - 6)' (x - 3)^2 = 2(x - 3)(x - 6) + (x - 3)^2$

  $= (x - 3)(3x - 15)$

  - Derivabilite en $3$ :

  $lim_(x arrow 3^-) (frac(g(x) - g(3), x - 3)) = lim_(x arrow 3^-) frac(f(x) - f(3), x - 3) = f'_g (3) = 0$

  $arrow.double g$ derivable a gauche en $3$ et $g'_g (3) = 0$

  $lim_(x arrow 3^+) (frac(g(x) - g(3), x - 3)) = lim_(x arrow 3^+) frac((x - 3)^2 (x - 6), x - 3) = lim_(x arrow 3^+) (x - 3)(x - 6) = 0$

  $arrow.double g$ derivable a droite en $3$ et $g'_d (3) = 0$

  On a $g'_g (3) = g'_d (3) arrow.double g$ derivable en $3$ et $g'(3) = 0$

  Conclusion : $g$ derivable sur $RR$

// Source: XY Plus T1 p.114
3) $D_g = RR arrow.double 2a - x in RR ; 2a - x = 6 - x$ car $Omega(3, -2) arrow.double cases(a = 3, b = -2)$

  il faut montrer que $g(2a - x) + g(x) = 2b = -4$.

  - Si $x < 3$ alors $6 - x > 3$

  $g(2a - x) + g(x) = g(6 - x) + g(x)$

  $= (6 - x - 4)^2 (6 - x - 6) - 2 + x^3 - 6x^2 + 9x - 2$

  $= -x(3 - x)^2 + x^3 - 6x^2 + 9x - 4$

  $= cancel(-9x) + cancel(6x^2) - cancel(x^3) + cancel(x^3) - cancel(6x^2) + cancel(9x) - 4$

  $= -4$

  $= 2b$

  - Si $x > 3$ alors $6 - x < 3$

  $g(2a - 3) + g(x) = (6 - x)^3 - 6(6 - x)^2 + 9(6 - x) - 2 + (x - 3)^2 (x - 6) - 2$

  $= (x - 6) [-(x - 6)^2 + 6(x - 6) - 9 + (x - 3)^2] - 4$

  $= (x - 6) [-x^2 + 12x - 36 + 6x - 36 - 9 + x^2 - 6x + 9] - 4$

  $= (x - 6)(underbrace(-x^2 + 12x - 36 - 6x + 36 - 9 + x^2 - 6x + 9, = 0)) - 4$

  $= -4$

  $= 2b$

  - Pour $x = 3$, $g(2 times 3 - 3) + g(3) = 2g(3) = 2f(3) = 2(-2)$

  Ainsi pour tout $x in RR ; g(2a - x) + g(x) = 2b$.

  $arrow.double Omega(3, -2)$ est un centre de symetrie de $Gamma$.

4) Construction de $Gamma$ :

  sur $]-infinity, 3]$, $g(x) = f(x) arrow.double Gamma = cal(C)_f$ sur $]-infinity, 3]$ et puis on termine la construction de $Gamma$ par la symetrie centrale de centre $Omega$.

// Source: XY Plus T1 p.115
== Corrige Exercice 5

$f : x arrow.r.bar x^3 - 3x^2 + 4$

1) a) $f$ est une fonction polynome donc derivable sur $RR$

  $f'(x) = 3x^2 - 6x$

  $f'(x) = 0 arrow.l.r.double 3x^2 - 6x = 0 arrow.l.r.double x = 0$ ou $x = 2$

  // Tableau de variation:
  // x: -inf ... 0 ... 2 ... +inf
  // f'(x): + 0 - 0 +
  // f(x): -inf / 4 \ 0 / +inf

  - $lim_(x arrow +infinity) f(x) = lim_(x arrow +infinity) x^3 = +infinity$

  - $lim_(x arrow -infinity) f(x) = lim_(x arrow -infinity) x^3 = -infinity$

  b) $I(a, b)$ est un centre de symetrie de $cal(C)$ si et seulement si pour tout $x in RR$, $2a - x in RR$ et $f(2a - x) + f(x) = 2b$

  $f(2a - x) + f(x) = 2b arrow.l.r.double (2a - x)^3 - 3(2a - x)^2 + 4 + x^3 - 3x^2 + 4 = 2$

  $arrow.l.r.double 8a^3 - 12a^2 x + 6a x^2 - x^3 - 12a^2 + 12a x - 3x^2 + 4 + x^3 - 3x^2 + 4 = 2$

  $arrow.l.r.double 6(a - 1) x^2 - 12a(a - 1) x + 8a^3 - 12a^2 + 8 - 2b = 0$

  L'egalite $f(2a - x) + f(x) = 2b$ est verifiee pour tout $x in RR$ equivaut a

  $cases(6(a - 1) = 0, -12a(a - 1) = 0, 8a^3 - 12a^2 + 8 - 2b = 0) arrow.l.r.double cases(a = 1, b = 2)$

  Conclusion : $I(1, 2)$ est un centre de symetrie de la courbe $cal(C)$.

  c) La courbe $cal(C)$ admet deux branches paraboliques l'une au voisinage de $+infinity$ et l'autre au voisinage de $-infinity$.

2) $g : x arrow.r.bar |x|^3 - 3x^2 + 2$

  a) - Si $x gt.eq 0$ alors $g(x) = x^3 - 3x^2 + 2 = f(x) - 2 arrow.double cal(C)' = t_(0, -2) (cal(C))$ sur $[0, +infinity[$

  - Pour tout $x in RR$ : $g(-x) = g(x)$

// Source: XY Plus T1 p.116
  D'ou $g$ est paire donc on construit $cal(C)'$ sur $]-infinity, 0]$ par symetrie par rapport a l'axe des ordonnees.

  b) $(E_k) : |x|^3 - 3(x^2 + k) - 2 = 0 arrow.l.r.double |x|^3 - 3x^2 - 3k - 2 = 0$

  $arrow.l.r.double g(x) = 3k + 4$

  Soit $D_k$ la droite d'equation $y = 3k + 4$

  le nombre de solutions de l'equation $(E_k)$ est egal au nombre de points d'intersections de $cal(C)'$ et $D_k$ (parallele a $(O, arrow(i))$).

  // Tableau de discussion:
  // 3k + 4: -inf ... -2 ... 2 ... +inf
  // k: -inf ... -2 ... -2/3 ... +inf
  // Nombre de solutions: pas de solution / 2 solutions \ 4 solutions / 2 solutions
  //                                        \ 3 solutions /

3) $h : x arrow.r.bar frac(1, 4) x^3 - frac(3, 2) x^2 + 8$

  a) $h(2x) = frac(1, 4) (2x)^3 - frac(3, 2) (2x)^2 + 8$

  $= frac(1, 4) times 8 x^3 - frac(3, 2) times 4x^2 + 8 = 2x^3 - 6x^2 + 8$

  $= 2(x^3 - 3x^2 + 4)$

  $= 2 f(x)$

  b) Soit $M(x, f(x)) in cal(C)$ ; $M'(2x, h(2x)) in Gamma$

  $arrow(O M') = 2x arrow(i) + h(2x) arrow(j) = 2x arrow(i) + 2 f(x) arrow(j)$ (d'apres a))

  $= 2(x arrow(i) + f(x) dot arrow(j))$

  $= 2 arrow(O M)$

  donc $M' = h_(O, 2) (M)$ d'ou $Gamma = h_(O, 2) (cal(C))$

// Source: XY Plus T1 p.116-117
== Corrige Exercice 6

1) $f$ est definie si et seulement si $x^2 + x + 1 gt.eq 0$ ce qui est verifiee pour tout reel $x$ car le discriminant de $x^2 + x + 1$ est strictement negatif.

  $D_f = RR$.

2) a) $x^2 + x + 1 = (x + frac(1, 2))^2 - frac(1, 4) + 1 = (x + frac(1, 2))^2 + frac(3, 4)$.

// Source: XY Plus T1 p.117
  b) Pour tout $x in [-frac(1, 2), +infinity[$, $x + frac(1, 2) = sqrt((x + frac(1, 2))^2)$

  $lim_(x arrow +infinity) [f(x) - (x + frac(1, 2))] = lim_(x arrow +infinity) [sqrt((x + frac(1, 2))^2 + frac(3, 4)) - sqrt((x + frac(1, 2))^2)] = lim_(x arrow +infinity) frac(frac(3, 4), sqrt((x + frac(1, 2))^2 + frac(3, 4)) + sqrt((x + frac(1, 2))^2))$

  or $lim_(x arrow +infinity) (x + frac(1, 2))^2 = +infinity$ donc $lim_(x arrow +infinity) sqrt((x + frac(1, 2))^2 + frac(3, 4)) = +infinity$ et $lim_(x arrow +infinity) sqrt((x + frac(1, 2))^2) = +infinity$

  D'ou $lim_(x arrow +infinity) sqrt((x + frac(1, 2))^2 + frac(3, 4)) + sqrt((x + frac(1, 2))^2) = +infinity$ et par consequent

  $lim_(x arrow +infinity) frac(frac(3, 4), sqrt((x + frac(1, 2))^2 + frac(3, 4)) + sqrt((x + frac(1, 2))^2)) = 0 arrow.double lim_(x arrow +infinity) [f(x) - (x + frac(1, 2))] = 0$

  La droite $Delta_1 : y = x + frac(1, 2)$ est asymptote a $cal(C)_f$ au voisinage de $+infinity$.

  a) Position de $cal(C)_f$ par rapport a $Delta_1$ :

  D'apres ce qui precede : $f(x) - (x + frac(1, 2)) = frac(frac(3, 4), sqrt((x + frac(1, 2))^2 + frac(3, 4)) + sqrt((x + frac(1, 2))^2)) > 0$

  Donc la courbe de $cal(C)_f$ est situee au dessus de l'asymptote $Delta_1 : y = x + frac(1, 2)$

  pour tout $x in [-frac(1, 2), +infinity[$.

  d) Montrons que la droite $Delta : x = -frac(1, 2)$ est un axe de symetrie pour $cal(C)_f$.

  - Pour tout reel $x$, on a $2 times (-frac(1, 2)) - x in RR$.

  - $f(2 times (frac(-1, 2)) - x) = f(-1 - x) = sqrt((-1 - x)^2 + (-1 - x) + 1) = sqrt(1 + 2x + x^2 - 1 - x + 1)$

  $= sqrt(x^2 + x + 1)$

  $= f(x)$

  D'ou la droite $Delta : x = -frac(1, 2)$ est un axe de symetrie.

// Source: XY Plus T1 p.117-118
3) La fonction $x arrow.r.bar x^2 + x + 1$ est polynome donc derivable sur $RR$ et pour tout $x in RR$ $x^2 + x + 1 > 0$ donc $f$ est derivable sur $RR$.

  Pour tout reel $x$, $f'(x) = frac(2x + 1, 2 sqrt(x^2 + x + 1))$. $f'(x) = 0 arrow.l.r.double x = -frac(1, 2)$

  Le signe de $f'(x)$ est celui de $2x + 1$.

  // Tableau de variation:
  // x: -inf ... -1/2 ... +inf
  // f'(x): - 0 +
  // f(x): +inf \ sqrt(3)/2 / +inf

  $lim_(|x| arrow +infinity) (x^2 + x + 1) = lim_(|x| arrow +infinity) x^2 arrow.double lim_(|x| arrow +infinity) f(x) = +infinity$

// Source: XY Plus T1 p.118
  - Construction de $cal(C)_f$ : On construit $(C_1)$ la representation graphique de la restriction de $f$ a l'intervalle $[-frac(1, 2), +infinity[$ et on termine la deuxieme partie $(C_2)$ par symetrie par rapport a la droite $Delta : x = -frac(1, 2)$.

  $(C_1) union (C_2) = cal(C)_f$.

  - Construction de $cal(C)_g$ : Puisque $g(x) = -f(x)$ alors $cal(C)_g$ est la symetrique de $cal(C)_f$ par rapport a l'axe des abscisses.

4) Equation de $(Gamma) = cal(C)_f union cal(C)_g$ dans le repere $(O, arrow(i), arrow(j))$ :

  $M(x, y) in cal(C)_f union cal(C)_g arrow.l.r.double y = f(x)$ ou $y = -f(x)$

  $arrow.l.r.double y = sqrt(x^2 + x + 1)$ ou $y = -sqrt(x^2 + x + 1)$

  $arrow.l.r.double y^2 = x^2 + x + 1$

  $arrow.l.r.double x^2 - y^2 + x + 1 = 0$

  Par consequent $(Gamma) : x^2 - y^2 + x + 1 = 0$.

5) Equation de $(Gamma)$ dans le repere $(Omega, arrow(u), arrow(v))$ :

  Soit $M$ de coordonnees $(x, y)$ dans le repere $(O, arrow(i), arrow(j))$ $(X, Y)$ dans le repere $(Omega, arrow(u), arrow(v))$.

  $arrow(O M) = arrow(O Omega) + arrow(Omega M)$ et $arrow(O M) = x arrow(i) + y arrow(j)$ ce qui equivaut a dire

  $x arrow(i) + y arrow(j) = arrow(O Omega) + arrow(Omega M)$

  $= -frac(1, 2) arrow(i) + X arrow(u) + Y arrow(v)$

  $= -frac(1, 2) arrow(i) + X(arrow(i) + arrow(j)) + Y(-arrow(i) + arrow(j))$

  $= (-frac(1, 2) + X - Y) arrow(i) + (X + Y) arrow(j)$

  Par consequent : $cases(x = -frac(1, 2) + X - Y, y = X + Y)$ $(1)$

  or l'equation de $(Gamma)$ dans le repere $(O, arrow(i), arrow(j))$ est $x^2 - y^2 + x + 1 = 0$ $(2)$ donc l'equation de $(Gamma)$ dans le repere $(Omega, arrow(u), arrow(v))$, obtenue en remplacant dans l'equation $(2)$ $x$ et $y$ par leurs valeurs en fonction de $X$ et $Y$ donnees par $(1)$, est :

  $(-frac(1, 2) + X - Y)^2 - (X + Y)^2 + (-frac(1, 2) + X - Y) + 1 = 0$

  $arrow.l.r.double frac(1, 4) - (X - Y) + (X - Y)^2 - (X + Y)^2 - frac(1, 2) + X - Y + 1 = 0$

  $arrow.l.r.double -4X Y + frac(3, 4) = 0$

  $arrow.l.r.double X Y = frac(3, 16)$ (le produit est non nul donc $X eq.not 0$)

// Source: XY Plus T1 p.119
  On obtient donc $(Gamma) : y = frac(frac(3, 16), X)$ $(Omega, arrow(u), arrow(v))$.

  b) La courbe $(Gamma)$ est donc une hyperbole qui a pour asymptotes les axes du repere : les droites passant par $Omega$ et de vecteurs directeurs $arrow(u)$ et $arrow(v)$ et pour centre de symetrie $Omega$ l'origine du repere.

// Source: XY Plus T1 p.119
== Corrige Exercice 7

1) $f : x arrow.r.bar sqrt(x^2 - 2x - 3)$ est definie sur $]-infinity, -1] union [3, +infinity[$.

  Pour tout $x < -1$ et $x > 3$, $f'(x) = frac(x - 1, sqrt(x^2 - 2x - 3))$

  // Tableau de variation:
  // x: -inf ... -1 ... 1 ... 3 ... +inf
  // f'(x): - |///| |///| |///| +
  // f(x): +inf \ 0 |///| |///| 0 / +inf

  $lim_(|x| arrow +infinity) x^2 - 2x - 3 = lim_(|x| arrow +infinity) x^2 = +infinity arrow.double lim_(|x| arrow +infinity) f(x) = +infinity$

// Source: XY Plus T1 p.120
2) Derivabilite de $f$ a droite en $3$ : $f(3) = 0$

  Pour tout $x > 3$, on a :

  $frac(f(x) - f(3), x - 3) = frac(sqrt(x^2 - 2x - 3), x - 3) = frac(x^2 - 2x - 3, (x - 3) sqrt(x^2 - 2x - 3)) = frac((x - 3)(x + 1), (x - 3) sqrt(x^2 - 2x - 3))$

  $= frac(x + 1, sqrt(x^2 - 2x - 3))$

  $lim_(x arrow 3) (x + 1) = 4$

  $lim_(x arrow 3^+) sqrt(x^2 - 2x - 3) = 0^+$ $} arrow.double lim_(x arrow 3^+) frac(f(x) - f(3), x - 3) = +infinity$.

  La fonction $f$ n'est pas derivable a droite en $3$ et au point $A$ d'abscisse $3$ la courbe $cal(C)$ admet une demi tangente verticale.

3) - Pour tout $x in D_f$ on a $x gt.eq 3$ ou $x lt.eq -1$ donc $-x lt.eq -3$ ou $-x gt.eq 1$ et par suite $2 - x lt.eq -1$ ou $2 - x gt.eq 3$ d'ou $2 - x in D_f$.

  - $f(2 - x) = sqrt((2 - x)^2 - 2(2 - x) - 3) = sqrt(4 + x^2 - 4x - 4 + 2x - 3) = sqrt(x^2 - 2x - 3) = f(x)$

  Donc la droite $D : x = 1$ est un axe de symetrie pour la courbe $cal(C)$.

4) a) Pour tout $x gt.eq 3$, $sqrt(x^2 - 2x - 3) + x - 1 eq.not 0$ donc

  $f(x) - (x - 1) = sqrt(x^2 - 2x - 3) - (x - 1) = frac(x^2 - 2x - 3 - (x - 1)^2, sqrt(x^2 - 2x - 3) + x - 1) = frac(-4, sqrt(x^2 - 2x - 3) + x - 1)$

  $lim_(x arrow +infinity) f(x) - (x - 1) = lim_(x arrow +infinity) frac(4, sqrt(x^2 - 2x - 3) + x - 1) = 0$.

  Donc la droite $Delta : y = x - 1$ est une asymptote a la courbe $cal(C)$ representant $f$ au voisinage de $+infinity$

  b) $x^2 - 2x - 3 = (x - 1)^2 - 1 - 3 = (x - 1)^2 - 4$ d'ou $x^2 - 2x - 3 < (x - 1)^2$.

  c) - Pour tout reel $x$, $x^2 - 2x - 3 < (x - 1)^2$ donc pour tout $x gt.eq 3$ on a

  $sqrt(x^2 - 2x - 3) < sqrt((x - 1)^2)$ et par suite $f(x) < |x - 1|$ ; or $x > 3 arrow.double x - 1 > 2 > 0$

  donc $f(x) < x - 1$. Par consequent, la courbe $cal(C)$ est au dessous de l'asymptote oblique $Delta : y = x - 1$.

  - Si $x lt.eq -1$, on a $x - 1 lt.eq -2 < 0$ et par suite $sqrt(x^2 - 2x - 3) > underbrace(x - 1, "(+)") > underbrace(x - 1, "(-)")$ donc la courbe est au dessus de $Delta$ sur $]-infinity, -1]$.

// Source: XY Plus T1 p.121
5) Construction de la courbe $cal(C)$.

6) $g(x) = sqrt(|x^2 - 2x - 3|)$

  La fonction $g$ est definie sur $RR$.

  Si $x lt.eq -1$ ou $x gt.eq 3$ on a $g(x) = f(x)$, $Gamma_1(g) = cal(C)$.

  Si $-1 lt.eq x lt.eq 3$ on a $g(x) = sqrt(-(x^2 - 2x - 3)) = sqrt(-x^2 + 2x + 3)$

  La restriction de $g$ a l'intervalle $[-1, 3]$ a pour equation $y = sqrt(-x^2 + 2x + 3)$. Elle est representee par $Gamma_2 (g)$.

  Pour tout $-1 lt.eq x lt.eq 3$, on a $y = sqrt(-x^2 - 2x + 3) arrow.l.r.double y^2 = -x^2 - 2x + 3$ et $y gt.eq 0$

  $arrow.l.r.double x^2 + y^2 - 2x - 3 = 0$ et $y gt.eq 0$

  $arrow.l.r.double (x - 1)^2 + y^2 = 4$ et $y gt.eq 0$

  L'ensemble des points $M(x, y)$ de $Gamma_2 (g)$ est un demi cercle de centre $I(1, 0)$ et de rayon $2$ situee au dessus de l'axe des abscisses. $cal(C)' = Gamma_1 union Gamma_2$

// Source: XY Plus T1 p.122
7) $h(x) = sqrt(|x^2 - 2x| - 3)$

  // Tableau de |x^2 - 2x|:
  // X: -inf ... -1 ... 0 ... 2 ... 3 ... +inf
  // |x^2 - 2x|: x^2 - 2x | -x^2 + 2x | x^2 - 2x
  // |x^2 - 2x| - 3: x^2 - 2x - 3 | -x^2 + 2x - 3 | x^2 - 2x - 3

  Si $x in ]-infinity, 0] union [2, +infinity[$, $|x^2 - 2x| - 3 = x^2 - 2x - 3$ qui n'est positif que si $x lt.eq -1$ ou $x gt.eq 3$.

  Si $x in [0, 2]$, $|x^2 - 2x| - 3 = -x^2 + 2x - 3$, le discriminant de ce trinome est $Delta = 4 - 12 = -8 < 0$, donc pour tout $x in [0, 2]$, on a $-x^2 + 2x - 3 < 0$.

  Conclusion : $h$ n'est definie que sur $]-infinity, -1] union [3, +infinity[$, et pour tout $x$ de ce ensemble de definition, $h(x) = f(x)$ et la representation graphique de $h$ est la meme que celle de $f$.

// Source: XY Plus T1 p.122
== Corrige Exercice 8

1) a) $lim_(x arrow 2) (x - 2) f(x) = lim_(x arrow 2) (cancel(x - 2)) frac(2x^2 - 3x + 2, cancel((x - 2))(x + 2)) = lim_(x arrow 2) frac(2x^2 - 3x + 2, x + 2) = 1$

  D'autre part $lim_(x arrow 2) (x - 2) f(x) = lim_(x arrow 2) (x - 2) a + frac(b(x - 2), x + 2) + c = c$

  donc $c = 1$.

  b) $lim_(x arrow -2) (x + 2) f(x) = lim_(x arrow -2) (cancel(x + 2)) frac(2x^2 - 3x + 2, (x - 2) cancel((x + 2))) = lim_(x arrow -2) frac(2x^2 - 3x + 2, x - 2) = -4$

  D'autre part $lim_(x arrow -2) (x + 2) f(x) = (x + 2) a + b + (frac(x + 2, x - 2)) c = b$,

  donc $b = -4$.

  c) $lim_(x arrow +infinity) f(x) = lim_(x arrow +infinity) frac(2x^2 - 3x + 2, x^2 - 4) = lim_(x arrow +infinity) frac(2x^2, x^2) = 2$.

  Or $lim_(x arrow +infinity) f(x) = lim_(x arrow +infinity) a + frac(b, x + 2) + frac(c, x - 2) = a$ car $lim_(x arrow +infinity) frac(b, x + 2) = 0$ et $lim_(x arrow +infinity) frac(c, x - 2) = 0$.

  Il en resulte $a = 2$.

  Conclusion : Pour tout $x in RR backslash {-2, 2}$, $f(x) = 2 - frac(4, x + 2) + frac(1, x - 2)$.

// Source: XY Plus T1 p.123
2) $f$ est rationnelle donc derivable sur $RR backslash {-2, 2}$ et on a

  $f'(x) = frac((4x - 3)(x^2 - 4) - 2x(2x^2 - 3x + 2), (x^2 - 4)^2) = frac(3x^2 - 20x + 12, (x^2 - 4)^2)$

  On pose $N(x) = 3x^2 - 20x + 12$, $Delta' = 100 - 36 = 64$.

  $x' = frac(10 - 8, 3) = frac(2, 3)$ et $x'' = frac(10 + 8, 3) = 6$.

  // Tableau de variation:
  // x: -inf ... -2 ... 2/3 ... 2 ... 6 ... +inf
  // f'(x): + | + 0 - | - 0 +
  // f(x): 2 / +inf | -inf / -1/4 \ +inf | -inf \ 7/4 / 2

3) Asymptotes de la courbe $cal(C)$ de $f$ :

  $lim_(x arrow 2^+) f(x) = lim_(x arrow 2^+) 2 - frac(3, x + 2) + frac(1, x - 2) = +infinity$

  $lim_(x arrow 2^-) f(x) = lim_(x arrow 2^-) 2 - frac(3, x + 2) + frac(1, x - 2) = -infinity$

  donc la droite $Delta : x = 2$ est asymptote a $cal(C)$.

  d'ou $lim_(x arrow -2^+) frac(-3, x + 2) = -infinity$

  $lim_(x arrow -2^+) f(x) = lim_(x arrow -2^+) 2 - frac(3, x + 2) + frac(1, x - 2) = -infinity$

  $lim_(x arrow -2^-) f(x) = lim_(x arrow -2^-) 2 - frac(3, x + 2) + frac(1, x - 2) = +infinity$

  Donc la droite $Delta' : x = -2$ est asymptote a $cal(C)$.

  - $lim_(|x| arrow +infinity) f(x) = lim_(|x| arrow +infinity) frac(2x^2, x^2) = 2$ d'ou la droite $Delta'' : y = 2$ est asymptote a au voisinage de $+infinity$ et $-infinity$.

4) // Construction graphique de C

  Soit $N$ le nombre de points d'intersection de $cal(C)$ et $Delta_m : y = m$

// Source: XY Plus T1 p.124
  // Tableau de discussion de m:
  // k: -inf ... -1/4 ... 7/4 ... 2 ... +inf
  // Nombre de points communs a Delta_m et C: 2 | (1) | 0 | (1) | 1 | (1) | 2

5) - L'abscisse du point d'intersection de $cal(C)$ avec l'asymptote $Delta'' : y = 2$ est la solution de l'equation $f(x) = 2$

  $f(x) = 2 arrow.l.r.double 2 - frac(4, x + 2) + frac(1, x - 2) = 2 arrow.l.r.double frac(4, x + 2) = frac(1, x - 2) arrow.l.r.double 4(x - 2) = x + 2$

  $arrow.l.r.double x = frac(10, 3)$

6) $g(x) = f(-|x|)$.

  - La fonction $g$ est definie si et seulement si $-|x| eq.not 2$ (evident) et $-|x| eq.not -2$ donc $x eq.not 2$ et $x eq.not -2$.

  La fonction $g$ est definie sur $RR backslash {-2, 2}$.

  - Pour tout $x in RR backslash {-2, 2}$, $(-x) in RR backslash {-2, 2}$.

  $g(-x) = f(-|-x|) = f(-|x|) = g(x)$

  La fonction $g$ est donc paire.

  - Pour tout $x in ]-infinity, 0] backslash {-2}$, $g(x) = f(-(-x)) = f(x)$ la restriction de la fonction $g$ a l'intervalle $]-infinity, 0]$ est representee par $Gamma_1$ la partie de la courbe $cal(C)$ correspondante a cet intervalle.

  Puisque $g$ est paire, la restriction de $g$ a l'intervalle $[0, +infinity[$ est representee par $Gamma_2$ symetrique de $Gamma_1$ par rapport a l'axe des ordonnees.

  On pose $Gamma$ la courbe de $g$. On a donc $Gamma = Gamma_1 union Gamma_2$ (voir figure).

// Source: XY Plus T1 p.124-125
== Corrige Exercice 9

1) - $D_f = {x in RR "tel que" x^2 - 3x + 2 eq.not 0}$

  or $x^2 - 3x + 2 = 0 arrow.l.r.double x = 1$ ou $x = 2$ ($a + b + c = 0$)

  $D_f = RR backslash {1, 2}$.

  $f$ est rationnelle donc derivable sur son domaine de definition.

  Pour tout $x in RR backslash {1, 2}$, $f'(x) = frac(-2x^2 + 6x - 5, (x^2 - 3x + 2)^2)$.

  Le signe de $f'(x)$ est celui du numerateur $n(x) = -2x^2 + 6x - 5$ :

  $Delta' = 9 - 10 < 0$ donc le signe de $n(x)$ est le signe de $(-2)$.

  Pour tout $x in RR backslash {1, 2}$, $n(x) < 0$.

  - Limites aux bornes du domaine de definition de $f$ :

// Source: XY Plus T1 p.125
  $lim_(x arrow -infinity) f(x) = lim_(x arrow -infinity) frac(2x, x^2) = lim_(x arrow -infinity) frac(2, x) = 0$ $}$ $Delta : y = 0$ l'axe des abscisses

  $lim_(x arrow +infinity) f(x) = lim_(x arrow +infinity) frac(2x, x^2) = lim_(x arrow +infinity) frac(2, x) = 0$ $}$ $arrow.double$ est une asymptote a $cal(C)$ au voisinage de $+infinity$ et $-infinity$

  // Tableau de signe de x^2 - 3x + 2:
  // x: -inf ... 1 ... 2 ... +inf
  // x^2 - 3x + 2: + 0 - 0 +

  $lim_(x arrow 2^+) x^2 - 3x + 2 = 0^+$

  $lim_(x arrow 2) 2x - 3 = 1$ $} arrow.double lim_(x arrow 2^+) f(x) = +infinity$ ;

  $lim_(x arrow 2^-) x^2 - 3x + 2 = 0^-$

  $lim_(x arrow 2) 2x - 3 = 1$ $} arrow.double lim_(x arrow 2^-) f(x) = -infinity$

  D'ou la droite $Delta : x = 2$ est une asymptote a $cal(C)$.

  $lim_(x arrow 1^+) x^2 - 3x + 2 = 0^-$

  $lim_(x arrow 1) 2x - 3 = -1$ $} arrow.double lim_(x arrow 1^+) f(x) = +infinity$ et

  $lim_(x arrow 1^-) x^2 - 3x + 2 = 0^+$

  $lim_(x arrow 1) 2x - 3 = -1$ $} arrow.double lim_(x arrow 1^-) f(x) = -infinity$

  D'ou la droite $Delta' : x = 1$ est une asymptote a $cal(C)$.

  // Tableau de variation:
  // x: -inf ... 1 ... 2 ... +inf
  // f'(x): - | - | -
  // f(x): 0 \ -inf | +inf \ -inf | +inf \ 0

// Source: XY Plus T1 p.126
2) a) Construction de la courbe $cal(C)$.

  b) Montrons que le point $Omega(frac(3, 2), 0)$ est un centre de symetrie de $cal(C)$.

  On ecrit l'equation de la courbe $cal(C)$ dans le repere $(Omega, arrow(i), arrow(j))$.

  Soit $M(x, y)$ dans le repere $(O, arrow(i), arrow(j))$ et $M(X, Y)$ dans le repere $(Omega, arrow(i), arrow(j))$.

  $arrow(O M) = arrow(O Omega) + arrow(Omega M) = frac(3, 2) arrow(i) + X arrow(i) + Y arrow(j)$

  $= (frac(3, 2) + X) arrow(i) + Y arrow(j)$ et $arrow(O M) = x arrow(i) + y arrow(j)$ donc $cases(x = frac(3, 2) + X, y = Y)$

  $M(x, y) in cal(C) arrow.l.r.double f(x) = y arrow.l.r.double y = frac(2x - 3, x^2 - 3x + 2)$

  $arrow.l.r.double Y = frac(2(frac(3, 2) + X) - 3, (frac(3, 2) + X)^2 - 3(frac(3, 2) + X) + 2)$

  $arrow.l.r.double Y = frac(3 + 2X - 3, frac(9, 4) + X^2 + 3X - frac(9, 2) - 3X + 2)$

  $arrow.l.r.double Y = frac(2X, X^2 - frac(1, 4))$

  $arrow.l.r.double Y = frac(8X, 4X^2 - 1)$

  Dans le repere $(Omega, arrow(i), arrow(j))$, la courbe $cal(C)$ est la courbe representative de la fonction $G$ definie sur $RR backslash {-frac(1, 2), frac(1, 2)}$ par $G(X) = frac(8X, 4X^2 - 1)$. Cette fonction est impaire, donc sa courbe admet $Omega$, l'origine du repere, comme centre de symetrie.

// Source: XY Plus T1 p.127
== Corrige Exercice 10

1) $f(x) = frac(6 + x - x^2, 2 - x)$

  La fonction $f$ est definie sur $RR backslash {2}$.

  $f$ est rationnelle donc derivable sur son domaine de definition.

  Pour tout $x in RR backslash {2}$,

  $f'(x) = frac((1 - 2x)(2 - x) - (-1)(6 + x - x^2), (2 - x)^2) = frac(2 - 4x - x + 2x^2 + 6 + x - x^2, (2 - x)^2)$

  $f'(x) = frac(x^2 - 4x + 8, (2 - x)^2)$

  Le numerateur de $f'(x)$ est un trinome dont le discriminant reduit

  $Delta' = 4 - 8 = -4 < 0$ donc $x^2 - 4x + 8 > 0$ pour tout reel $x$, et par suite $f'(x) > 0$ pour tout reel $x in RR backslash {2}$,

  // Tableau de variation:
  // x: -inf ... 2 ... +inf
  // f'(x): + | +
  // f(x): -inf / +inf | -inf / +inf

  $lim_(x arrow +infinity) f(x) = lim_(x arrow +infinity) frac(-x^2, -x) = lim_(x arrow +infinity) x = +infinity$, $lim_(x arrow -infinity) f(x) = lim_(x arrow -infinity) frac(-x^2, -x) = lim_(x arrow -infinity) x = -infinity$

  $lim_(x arrow 2) 6 + x - x^2 = 8$

  $lim_(x arrow 2^+) (2 - x) = 0^-$ $}$ d'ou $lim_(x arrow 2^+) f(x) = -infinity$

  $lim_(x arrow 2) 6 + x - x^2 = 8$

  $lim_(x arrow 2^-) (2 - x) = 0^+$ $}$ d'ou $lim_(x arrow 2^-) f(x) = +infinity$

  D'ou la droite $Delta : x = 2$ est une asymptote verticale a la courbe $cal(C)$ de $f$.

// Source: XY Plus T1 p.128
  - Recherche de l'asymptote oblique de $cal(C)$ :

  Cherchons $a$, $b$ et $c$ tels que pour tout $x in RR backslash {2}$, $f(x) = a x + b + frac(c, 2 - x)$

  $a x + b + frac(c, 2 - x) = frac(a x(2 - x) + b(2 - x) + c, 2 - x) = frac(-a x^2 + (2a - b) x + c + 2b, 2 - x)$

  L'egalite $frac(6 + x - x^2, 2 - x) = frac(-a x^2 + (2a - b) x + c + 2b, 2 - x)$ est verifiee pour tout reel $x in RR backslash {2}$ si et seulement si

  $cases(-a = -1, 2a - b = 1, c + 2b = 6) arrow.l.r.double a = 1, b = 1$ et $c = 4$.

  $f(x) = x + 1 + frac(4, 2 - x)$.

  $lim_(|x| arrow +infinity) [f(x) - (x + 1)] = lim_(|x| arrow +infinity) frac(4, 2 - x) = 0$ d'ou la droite $Delta' : y = x + 1$ est une asymptote oblique a la courbe $cal(C)$ au voisinage de $+infinity$ et $-infinity$.

  Courbe representative de $f$ :

2) $g(x) = |frac(x - 3, x - 2)| (-x - 2)$, $D_g = RR backslash {2}$

  // Tableau de signe de (x-3)/(x-2):
  // x: ... 2 ... 3 ...
  // x - 2: - 0 + | +
  // x - 3: - | - 0 +
  // (x-3)/(x-2): + | - 0 +

  Pour tout $x in ]2, +infinity[ union [3, +infinity[$

  $g(x) = frac(x - 3, x - 2) (x + 2) = frac(x^2 - x - 6, x - 2) = frac(-x^2 + x + 6, 2 - x) = f(x)$

  donc $cal(C)'$ est confondue avec $cal(C)$ sur l'intervalle $]-infinity, 2[$.

  Pour tout $x in ]2, 3]$ :

  $g(x) = -frac(x - 3, x - 2) (x + 2) = frac(-x^2 + x + 6, x - 2) = -frac(-x^2 + x + 6, 2 - x) = -f(x)$

// Source: XY Plus T1 p.129
  donc $cal(C)'$ est confondue avec la symetrique de $cal(C)$ par rapport a l'axe des abscisses sur l'intervalle $]-infinity, 2[$.

  // Tableau de variation de g:
  // x: -inf ... 2 ... 3 ... +inf
  // g'(x): + | - | +
  // g(x): -inf / 2 | +inf \ 0 / +inf

// Source: XY Plus T1 p.129
== Corrige Exercice 11

1) $lim_(x arrow -2) x^2 + 4x + 2 = 4 - 8 + 2 = -2$, $lim_(x arrow -2) 2(x + 2) = 0^+$ (comme $x > -2$, $2(x + 2) > 0$)

  d'ou $lim_(x arrow -2) f(x) = -infinity$.

  La courbe $cal(C)$ admet pour asymptote la droite $D$ d'equation $x = -2$

2) a) $lim_(x arrow +infinity) f(x) = lim_(x arrow +infinity) frac(x^2, 2x) = lim_(x arrow +infinity) frac(x, 2) = +infinity$.

  b) Pour tout $x in ]-2, +infinity[$,

  $f(x) = a x + b + frac(c, x + 2) = frac((a x + b)(x + 2) + c, x + 2) = frac(a x^2 + (b + 2a) x + 2b + c, x + 2)$

// Source: XY Plus T1 p.130
  Cette egalite est verifiee pour tout $x in ]-2, +infinity[$ et les denominateurs etant les memes, on compare, aux numerateurs, les coefficients des termes de meme degre :

  $cases(2a = 1, 2(b + 2a) = 4, 4b + 2c = 2) arrow.l.r.double cases(a = frac(1, 2), b + 2a = 2, 2b + c = 1) arrow.l.r.double a = frac(1, 2), b = 1, c = -1$.

  c) D'apres la question precedente on peut ecrire :

  $f(x) = frac(1, 2) x + 1 - frac(1, x + 2)$, on en deduit $lim_(x arrow +infinity) [f(x) - (frac(x, 2) + 1)] = lim_(x arrow +infinity) frac(-1, x + 2) = 0$.

  La droite d'equation $y = frac(x, 2) + 1$ est asymptote a la courbe $cal(C)$ au voisinage de $+infinity$.

  Pour etudier la position relative de la courbe $cal(C)$ et de la droite $Delta$, on etudie le signe de la difference $f(x) - (frac(x, 2) + 1)$.

  $x in ]-2, +infinity[$ alors $x + 2 > 0$ et $f(x) - (frac(x, 2) + 1) < 0$.

  La courbe $cal(C)$ est en dessous de la droite $Delta$ sur $]-2, +infinity[$.

3) a) Pour tout $x in RR backslash {2}$, $f(x) = frac(x, 2) + 1 - frac(1, x + 2)$ $(frac(1, u))' = frac(-u', u^2)$

  $f'(x) = frac(1, 2) - frac(-1, (x + 2)^2)$ d'ou $f'(x) = frac(1, 2) + frac(1, (x + 2)^2)$.

  b) $f'(x)$ est la somme de deux reels strictement positifs donc $f'(x) > 0$ pour tout reel $x$ de l'intervalle $]-2, +infinity[$. La fonction $f$ est donc croissante sur $]-2, +infinity[$.

  // Tableau de variation:
  // x: -2 ... +inf
  // f'(x): +
  // f(x): -inf / +inf

// Source: XY Plus T1 p.131
4) Construction de la courbe. (Voir figure avec les asymptotes $D$, $Delta$ et les courbes $cal(C)$ et $cal(H)$)

5) Les droites $delta_m$ sont paralleles a $Delta$ et lorsque $m = 1$ on a $Delta = delta_1$ or d'apres l'etude de la position relative de $delta$ et $cal(C)$ on conclut que $cal(C) sect delta_1 = emptyset$

  Si $m > 1$ les droites $delta_m$ sont au dessus de $delta_1$ or la courbe est au dessous de $delta_1$ donc $delta_m sect cal(C) = emptyset$

  Si $m < 1$, $delta_m$ est au dessous de $Delta$, $cal(C)$ et $delta_m$ se coupent en un point.

6) a) voir figure

  b) Graphiquement, l'abscisse du point d'intersection des courbes $cal(C)$ et $cal(H)$ est environ $0,9$.

7) a) Sur $]0, +infinity[$, $f(x) = h(x) arrow.l.r.double frac(x^2 + 4x + 2, 2(x + 2)) = frac(1, x) arrow.l.r.double x(x^2 - x + 2) = 2(x + 2)$

  $f(x) = h(x) arrow.l.r.double x^3 + 4x^2 + 2x = 2x + 4 arrow.l.r.double x^3 + 4x^2 - 4 = 0$

  Sur $]0, +infinity[$, l'equation $f(x) = h(x)$ est equivalente a $x^3 + 4x^2 - 4 = 0$.

  b) $g(x) = x^3 + 4x^2 - 4$, $g$ est une fonction polynome donc derivable sur $RR$

  et $g'(x) = 3x^2 + 8x$

  Comme $x > 0$, $g'(x) > 0$ et $g$ est une fonction croissante sur $]0, +infinity[$.

  // Tableau de variation (sur ]0, +inf[):
  // x: 0 ... x_0 ... 1 ... +inf
  // g'(x): + | +
  // g(x): -4 / 0 / +inf

  Par lecture du tableau de variation de $g$, l'image de l'intervalle $g(0, 5) approx -2, 875$ et $g(1) = 1$.

// Source: XY Plus T1 p.132
  $g$ est continue sur $[0.5 ; 1]$

  $g(0.5) < 0$

  $g(1) > 0$ $}$ d'ou $0$ est compris entre $g(0.5)$ et $g(1)$

  donc l'equation $g(x) = 0$ admet dans $[0.5 ; 1]$ une solution $x_0$.

  Cette solution est unique (d'apres le tableau de variation de $g$).

  c) $g(0, 9) approx -0, 031$ et $g(0, 91) approx 0, 0659$ soit $g(0, 9) < g(x_0) = 0 < g(0, 91)$

  alors, puisque la fonction $g$ est croissante $0, 9 < x_0 < 0, 91$.

  $x_0 approx 0, 9$ a $10^(-1)$ pres par defaut.

8) - $k(x) = cases(f(x) quad & "si" x in ]-2, x_0] "et" cal(C)_k = cal(C), frac(1, x) quad & "si" x in [x_0, +infinity[ "et" cal(C)_k = cal(H))$

  // Tableau de variation de k:
  // x: -2 ... x_0 ... +inf
  // k'(x): + | -
  // k(x): -inf / 1/x_0 \ 0

// Source: XY Plus T1 p.132-133
== Corrige Exercice 12

1) a) Pour tout $x in D_f$, $f(x) = a x + b + frac(c, x - 1)$

  1ere methode :

  - $lim_(x arrow 1) (x - 1) f(x) = lim_(x arrow 1) [(a x + b)(x - 1) + c] = c$

  D'autre part $lim_(x arrow 1) [(x - 1) f(x)] = lim_(x arrow 1) (x^2 + 2x - 2) = 1$. Donc $c = 1$.

  - $lim_(x arrow +infinity) frac(f(x), x) = lim_(x arrow +infinity) [a + frac(b, x) + frac(c, x(x - 1))] = a$

  D'autre part $lim_(x arrow +infinity) frac(f(x), x) = lim_(x arrow +infinity) frac(1, x) (frac(x^2 + 2x - 2, x - 1)) = lim_(x arrow +infinity) frac(x^2, x^2) = 1$. Donc $a = 1$.

  - $f(0) = b + frac(c, -1)$ et $c = 1$ donc $f(0) = b - 1$

  D'autre part $f(0) = frac(-2, -1) = 2$ d'ou $b - 1 = 2$ et par suite $b = 3$.

  Pour tout $x in RR backslash {1}$ : $f(x) = x + 3 + frac(1, x - 1)$.

// Source: XY Plus T1 p.133
  2eme methode :

  $f(x) = a x + b + frac(c, x - 1) arrow.l.r.double frac(x^2 + 2x - 2, x - 1) = frac(a x^2 + (b - a) x + c - b, x - 1)$

  Cette egalite est verifiee pour tout $x in RR backslash {1}$ si et seulement si

  $cases(a = 1, b - a = 2, c - b = -2) arrow.l.r.double cases(a = 1, b = 3, c = 1)$ Donc pour tout $x in RR backslash {1}$ : $f(x) = x + 3 + frac(1, x - 1)$.

  b) - $lim_(|x| arrow +infinity) [f(x) - (x + 3)] = lim_(|x| arrow +infinity) frac(1, x - 1) = 0$

  D'ou la droite $D : y = x + 3$ est une asymptote oblique a $cal(C)$ au voisinage de $plus.minus infinity$.

  - $lim_(x arrow 1^+) f(x) = lim_(x arrow 1^+) (x + 3 + frac(1, x - 1)) = +infinity$

  - $lim_(x arrow 1^-) f(x) = lim_(x arrow 1^-) (x + 3 + frac(1, x - 1)) = -infinity$

  // Signe de x - 1: ... 1 ...
  // x - 1: - | +

  D'ou la droite $D' : x = 1$ est asymptote a $cal(C)$.

  c) $Omega (1, 4)$, $a = 1$ et $b = 4$, $2a - x = 2 - x$.

  - on a $x in D_f arrow.l.r.double x eq.not 1 arrow.l.r.double -x eq.not -1 arrow.l.r.double 2 - x eq.not 1 arrow.l.r.double 2 - x in D_f$

  - $f(2 - x) + f(x) = 2 - x + 3 + frac(1, 2 - x - 1) + x + 3 + frac(1, x - 1) = 8 - frac(1, x - 1) + frac(1, x - 1) = 8$

  $= 2b$

  Le point $Omega$ est donc centre de symetrie de $cal(C)$.

2) a) $f$ est une fonction rationnelle definie sur $RR backslash {1}$ donc derivable

  et pour tout $x in RR backslash {1}$, $f'(x) = 1 + frac(-1, (x - 1)^2) = frac((x - 1)^2 - 1, (x - 1)^2)$

  $(x - 1)^2 = 1 arrow.l.r.double x - 1 = 1$ ou $x - 1 = -1 arrow.l.r.double x = 0$ ou $x = 2$

  // Tableau de variation:
  // x: -inf ... 0 ... 1 ... 2 ... +inf
  // f': + 0 - | - 0 +
  // f: -inf / 3 \ +inf | -inf \ 6 / +inf

  b) On trace $cal(C)$ sur $]-infinity, 1[$ par symetrie par rapport a $Omega$.

// Source: XY Plus T1 p.134
3) a) $D_k$ de coefficient directeur $k arrow.double D_k : y = k x + b$

  or $Omega(1, 4) in D_k arrow.double 4 = k times 1 + b arrow.double b = 4 - k$.

  D'ou $D_k : y = k x + 4 - k$.

  b) $M(x, y) in D_k sect cal(C) arrow.l.r.double cases(y = f(x) "et" x eq.not 1 quad (1), y = k x + 4 - k quad (2))$

  D'apres $(1)$ et $(2)$, $frac(x^2 + 2x - 2, x - 1) = k x + 4 - k$ ($x eq.not 1$)

  $arrow.l.r.double x^2 + 2x - 2 = (k x + 4 - k)(x - 1)$

  $arrow.l.r.double (k - 1) x^2 - 2(k - 1) x + k - 2 = 0$ $(E_k)$

  Le nombre de solutions de $(E_k)$ est le nombre de points d'intersection de $cal(C)$ et $D_k$.

  1er cas : $k = 1$, l'equation devient $1 - 2 = 0$ impossible.

  Donc $(E_k)$ n'a pas de solution et par suite $cal(C) sect D_k = emptyset$.

  2eme cas : $k eq.not 1$, $(E_k)$ du second degre.

  $a = k - 1$, $b = -2(k - 1) arrow.double b' = -(k - 1)$ et $c = k - 2$

  $Delta' = b'^2 - a c = (k - 1)^2 - (k - 2)(k - 1) = k - 1$

// Source: XY Plus T1 p.135
  // Tableau de discussion:
  // k: -inf ... -1 ... +inf
  // Delta': - | +
  // Nombre de points d'intersection: Aucun | 2 points

  c) 1ere idee :

  $D_k$ coupe $cal(C)$ en deux points $M'$ et $M''$ donc $k > 1$.

  On sait que $Omega$ est un centre de symetrie de $cal(C)$

  On a $M'$, $M''$ et $Omega$ sont alignes et $M'$ et $M'' in cal(C)$

  D'ou $M'$ et $M''$ sont symetriques par rapport a $Omega$ et par consequent $Omega$ est le milieu de $[M' M'']$.

  2eme idee :

  $M'(x', y') in D_k sect cal(C) arrow.l.r.double cases(x' "solution de" (E_k), y' = k x' + 4 - k)$

  $M''(x'', y'') in D_k sect cal(C) arrow.l.r.double cases(x'' "solution de" (E_k), y'' = k x'' + 4 - k)$

  Soit $I$ le milieu de $[M' M'']$

  $arrow.l.r.double cases(x_I = frac(x' + x'', 2), y_I = k x_I + 4 - k "(car" I in D_k "puisque" M' "et" M'' "sont sur" D_k")")$

  $arrow.l.r.double cases(x_I = frac(S, 2) = frac(-b, 2a) = frac(-2(k - 1), 2(k - 1)) = 1, y_I = k times 1 + 4 - k = 4) arrow.double I(1, 4) arrow.double I = Omega$.

  $M'$ d'abscisse $x'$ et $M''$ d'abscisse $x''$ ou $x'$ et $x''$ sont solutions de $(E_k)$

  Donc $frac(x' + x'', 2) = frac(-b, 2a) = 1 arrow.double x'' = 2 - x'$

  $f'(x'') = 1 - frac(1, (x'' - 1)^2)$ (on rappelle que $f'(x) = 1 - frac(1, (x - 1)^2))$

  $= 1 - frac(1, (2 - x' - 1)^2) = 1 - frac(1, (x' - 1)^2)$

  $= f'(x')$

  d'ou la tangente a $cal(C)$ en $M'$ et $M''$ sont paralleles.

// Source: XY Plus T1 p.135 (suite)
  a) Si $x in [0, +infinity[ backslash {1}$, $g(x) = frac(x^2, x - 1)$

  $f(x) - 2 = frac(x^2 + 2x - 2, x - 1) - 2 = frac(x^2 + 2x - 2 - 2x + 2, x - 1) = frac(x^2, x - 1)$

  $= g(x)$

// Source: XY Plus T1 p.136
  b) $cal(C)' = t_(0, -2) (cal(C))$ sur $[0, +infinity[ backslash {1}$.

  On a aussi pour tout $x in RR backslash {-1, 1}$, $-x in RR backslash {-1, 1}$.

  $g(-x) = frac((-x)^2, |-x| - 1) = frac(x^2, |x| - 1) = g(x)$

  Donc $g$ est paire d'ou $cal(C)'$ symetrique par rapport a $(O, arrow(j))$.

  c) // Tableau de variation de g:
  // x: -inf ... -2 ... -1 ... 0 ... 1 ... 2 ... +inf
  // g'(x): - 0 + | + 0 - | - 0 +
  // g(x): +inf \ 4 / +inf | -inf / 0 \ -inf | -inf / 4 / +inf

// Source: XY Plus T1 p.136
== Corrige Exercice 13

$f : x arrow.r.bar frac(x^2 - 3x + 3, x - 2)$

1) $f$ est une fonction rationnelle donc derivable sur $D_f = RR backslash {2}$

  $f'(x) = frac((2x - 3)(x - 2) - x^2 + 3x - 3, (x - 2)^2) = frac(x^2 - 4x + 3, (x - 2)^2)$

  $f'(x) = 0 arrow.l.r.double x^2 - 4x + 3 = 0 arrow.l.r.double x = 1$ ou $x = 3$ car $a + b + c = 1$

  // Tableau de variation:
  // x: -inf ... 1 ... 2 ... 3 ... +inf
  // f'(x): + 0 - | - 0 +
  // f(x): -inf / -1 \ +inf | -inf \ 3 / +inf

  - $lim_(x arrow +infinity) f(x) = lim_(x arrow +infinity) frac(x^2, x) = lim_(x arrow +infinity) x = +infinity$

  - $lim_(x arrow -infinity) f(x) = lim_(x arrow -infinity) frac(x^2, x) = lim_(x arrow -infinity) x = -infinity$

  - $lim_(x arrow 2^+) f(x) = +infinity$ | car : // signe de x - 2
  - $lim_(x arrow 2^-) f(x) = -infinity$ |

// Source: XY Plus T1 p.136-137
2) a) $lim_(|x| arrow +infinity) [f(x) - (x - 1)] = lim_(|x| arrow +infinity) [frac(x^2 - 3x + 3, x - 2) - frac((x - 1)(x - 2), x - 2)]$

  $= lim_(|x| arrow +infinity) (frac(1, x - 2))$

  $= 0$

  $arrow.double D : y = x - 1$ est une asymptote a $cal(C)$ au voisinage de $+infinity$ et $-infinity$

// Source: XY Plus T1 p.137
  b) $f(x) - (x - 1) = frac(1, x - 2)$

  // Tableau de signe:
  // x: -inf ... 2 ... +inf
  // f(x) - (x-1): - | +
  // Position de C et D: C au dessous en D | C au dessus de D

  c) Construction de $cal(C)$ (page suivante)

  $cal(C)$ admet une asymptote oblique : $D : y = x - 1$ et une asymptote verticale $Delta : x = 2$

// Source: XY Plus T1 p.138
  d) $M(x, y)_R arrow.r M(X, Y)_(R')$

  $arrow(O M) = x arrow(i) + y arrow(j)$

  $arrow(Omega M) = X arrow(u) + Y arrow(j)$

  $= X(arrow(i) + arrow(j)) + Y arrow(j)$

  $= X arrow(i) + (X + Y) arrow(j)$

  Or $arrow(O M) = arrow(O Omega) + arrow(Omega M)$

  Donc $x arrow(i) + y arrow(j) = 2 arrow(i) + arrow(j) + X arrow(i) + (X + Y) arrow(j)$

  $= (X + 2) arrow(i) + (X + Y + 1) arrow(j)$

  Par consequent : $cases(x = X + 2, y = X + Y + 1)$

  D'apres 2) a), on verifie facilement que $f(x) = x - 1 + frac(1, x - 2)$

  donc $M(x, y)_R in cal(C) arrow.l.r.double y = f(x) arrow.l.r.double y = x - 1 + frac(1, x - 2)$

  $arrow.l.r.double X + Y + 1 = X + 2 - 1 + frac(1, X + 2 - 2) arrow.l.r.double Y = frac(1, X)$

  d'ou l'equation de $cal(C)$ dans le repere $R'$ est $Y = frac(1, X)$.

  Si on considere $F(x) = Y = frac(1, X)$ dans $R'$.

  Le domaine est $RR^*$.

  Pour tout $X in RR^*$, $-X in RR^*$ et $F(-X) = frac(1, -X) = -F(X)$

  D'ou $F$ est impaire donc sa representation graphique $cal(C)$ est symetrique par rapport a $Omega$ l'origine du repere.

3) $D_a : y = -3x + a$.

  $T$ est tangente a $cal(C)$ au point d'abscisse $x$ donc de coefficient directeur $f'(x)$.

  $D_a$ est de coefficient directeur $-3$.

  $D_a parallel T arrow.l.r.double f'(x) = -3$

  $arrow.l.r.double frac(x^2 - 4x + 3, (x - 2)^2) = -3$

  $arrow.l.r.double 4x^2 - 16x + 15 = 0$

  $a = 4$ ; $b = -16$ ; $b' = -8$ ; $c = 15$

  $x = frac(8 - 2, 4)$ ou $x = frac(8 + 2, 4)$

  $x = frac(3, 2)$ ou $x = frac(5, 2)$

// Source: XY Plus T1 p.139
  Equation des tangentes

  $T_(frac(3, 2)) : y = -3(x - frac(3, 2)) + f(frac(3, 2)) = -frac(3, 2)$ donc $T_(frac(3, 2)) : y = -3x + 3$

  $T_(frac(5, 2)) : y = -3(x - frac(5, 2)) + f(frac(5, 2)) arrow.r f(frac(5, 2)) = frac(7, 2)$ donc $T_(frac(5, 2)) : y = -3x + 11$

  Construction des tangentes : voir figure.

  b) Soit $M(x, y) in cal(C) sect D_a arrow.l.r.double cases(y = f(x) "et" x eq.not 2 quad (1), y = -3x + a quad (2))$

  De $(1)$ et $(2)$ on obtient $frac(x^2 - 3x + 3, x - 2) = -3x + a$

  $arrow.l.r.double x^2 - 3x + 3 = (x - 2)(-3x + a)$

  $arrow.l.r.double x^2 - 3x + 3 = -3x^2 + a x + 6x - 2a$

  $arrow.l.r.double 4x^2 - (9 + a) x + 3 + 2a = 0$ $(E_a)$

  c) Le nombre de points d'intersection de $cal(C)$ et $D_a$ est egal au nombre de solutions de l'equation $(E_a)$.

  $Delta = (9 + a)^2 - 4 times 4(3 + 2a)$ (le discriminant de $(E_a)$)

  $Delta = a^2 - 14a + 33$.

  $Delta'_a =$ le discriminant reduit de $Delta$ (pour etudier le signe de $Delta$)

  $Delta'_a = 49 - 33 = 16$

  $a = 7 + 4 = 11$ ou $a = 7 - 4 = 3$

  // Tableau de discussion:
  // a: -inf ... 3 ... 11 ... +inf
  // Delta: + | - | +
  // Nombre de points d'intersection: 2 solutions / C inter D_a = {2 pts} | pas de solution / C inter D_a = emptyset | 2 solutions / C inter D_a = {2 pts}
  // Aux valeurs a = 3 et a = 11: 1 solution / C inter D_a = {1 pt}

  d) Graphiquement

  $D_a parallel T_(frac(3, 2)) parallel T_(frac(5, 2))$

  - Si $D_a$ est au dessous de $T_(frac(3, 2))$ ou au dessus de $T_(frac(5, 2))$ ($a in ]-infinity, 3[ union ]11, +infinity[$) alors elle coupe $cal(C)$ en deux points distincts.

  - Si $D_a = T_(frac(3, 2))$ ou $D_a = T_(frac(5, 2))$ ($a = 3$ ou $a = 11$) alors elle est tangente a $cal(C)$ d'ou $cal(C) sect D_a = {1 "point"}$

  - Si $D_a$ entre $T_(frac(3, 2))$ et $T_(frac(5, 2))$ ($a in ]3, 11[$) alors $cal(C) sect D_a = emptyset$

// Source: XY Plus T1 p.140
4) On se place dans le cas ou $D_a$ coupe $cal(C)$ en deux points $M'(x', y')$ et $M''(x'', y'')$.

  Donc $a in ]-infinity, 3[ union ]11, +infinity[$ et $x'$ et $x''$ sont les solutions de l'equation $(E_a)$

  a) $P(x, y) in D_a sect Delta arrow.l.r.double cases(x = 2, y = -3x + a) arrow.l.r.double cases(x = 2, y = a - b) arrow.double P(2, a - b)$

  $Q(x, y) in D_a sect D arrow.l.r.double cases(y = x - 1, y = -3x + a) arrow.l.r.double cases(x = frac(a + 1, 4), y = frac(a - 3, 4))$

  $arrow.double Q(frac(a + 1, 4), frac(a - 3, 4))$

  $overline(P M') vec(x' - 2, -3(x' - 2)) arrow.double overline(P M') vec(x' - 2, -3(x' - 2))$ on prend : $y' = -3x' + a$, car $M' in D_a$ aussi

  $overline(Q M') vec(x' - frac(a + 1, 4), -3(x' - frac(a + 1, 4))) arrow.double overline(Q M') vec(x' - frac(a + 1, 4), -3(x' - frac(a + 1, 4)))$

  $overline(P M') dot overline(Q M') = (x' - 2)(x' - frac(a + 1, 4)) + 9(x' - 2)(x' - frac(a + 1, 4))$

  $= 10(x' - 2)(x' - frac(a + 1, 4))$

  $= frac(10, 4) (x' - 2)(4x' - a - 1)$

  $= frac(5, 2) [4x'^2 - (9 + a) x' + 2a + 2]$

  Or $x'$ solution de $(E) arrow.double 4x'^2 - (9 + a) x' + 3 + 2a = 0$ ($x'$ verifie l'equation $E$)

  $arrow.double 4x'^2 - (9 + a) x' + 2a + 2 = -1$

  donc $overline(P M') dot overline(Q M') = frac(5, 2) times (-1) = frac(-5, 2)$ independant de $a$.

// Source: XY Plus T1 p.140 (suite)
5) $g : x arrow.r.bar frac(x^2 - 3x + 3, |x - 2|)$ ; $D_g = RR backslash {2}$

  a) Si $x in ]2, +infinity[$ alors $g(x) = f(x) arrow.double cal(C)' = cal(C)$ dans $]2, +infinity[$

  Si $x in ]-infinity, 2[$ alors $g(x) = -f(x) arrow.double cal(C)' = S_((O, arrow(i))) (cal(C))$ dans $]-infinity, 2[$

  Remarque :

  On trace $D' = S_((O, arrow(i))) (D)$ avant de tracer $cal(C)'$

  $D : y = x - 1$

  (voir figure)

// Source: XY Plus T1 p.141
  b) Tableau de variations de $g$ :

  // x: -inf ... 1 ... 2 ... 3 ... +inf
  // f'(x): + 0 - | - 0 +
  // f(x): +inf \ 1 / +inf | +inf \ 3 / +inf

  c) $(E_m) : x^2 - 3(x + m|x - 2|) + 3(1 - |x - 2|) = 0$

  $arrow.l.r.double x^2 - 3x - 3m|x - 2| + 3 - 3|x - 2| = 0$

  $arrow.l.r.double x^2 - 3x + 3 = |x - 2|(3m + 3)$

  $arrow.l.r.double x^2 - 3x + 3 = |x - 2| dot 3(m + 1)$

  verifions si $x = 2$ solution de $(E_m) : 2^2 - 3 times 2 + 3 = 0$ impossible

  $1 = 0$

  Pour $x eq.not 2$, $E_m arrow.l.r.double frac(x^2 - 3x + 3, |x - 2|) = 3m + 3 arrow.l.r.double g(x) = 3(m + 1)$.

  Soit $D_m : y = 3m + 3$ ce sont des droites paralleles a l'axe des abscisses

  Le nombre de solutions de l'equation $(E_m)$ est egal au nombre de points d'intersections de $cal(C)'$ et $D_m$.

  // Tableau de discussion final:
  // m: -inf ... -2/3 ... -1/2 ... 0 ... +inf
  // 3m + 3: -inf ... 1 ... 3/2 ... 3 ... +inf
  // C' inter D_m = emptyset: pas de solution
  // C' inter D_m = {1 pts}: 1 solution (+)
  // C' inter D_m = {2 pts}: 2 solutions (+) et (-)
  // C' inter D_m = {2 pts}: 2 solutions (+) et (-)
  // C' inter D_m = {4 pts}: 4 solutions (+), (+), (+) et (-)
  // etc.

  *Remarque :* la solution negative si le point d'intersection de $cal(C)'$ et $D_m$ a pour abscisse negative.
