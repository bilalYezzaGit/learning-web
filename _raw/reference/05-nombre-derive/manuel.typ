// =============================================================================
// Module 5 : Nombre dérivé
// Programme : 3ème Math (Tunisie)
// Source : Manuel scolaire CNP (T1, p.80-99) + Corrigé CMS (T1, p.59-71)
// =============================================================================

#import "@preview/cetz:0.3.4"

// Source: Manuel T1 p.80
= Chapitre 5 : Nombre dérivé

#emph[« Il ne dépend que de nous de suivre la route qui monte et d'éviter celle qui descend. »]

#align(right)[*Platon*]


// Source: Manuel T1 p.81
== Pour commencer

=== Activité 1

Le plan est muni d'un repère orthogonal $(O, arrow(i), arrow(j))$.

Soit les points $A(2, -1)$, $B(5, 2)$ et $C(1, 3)$.

1. Déterminer le coefficient directeur de la droite $(A B)$.
2. Déterminer une équation de la droite passant par $C$ et parallèle à la droite $(A B)$.

=== Activité 2

On considère les fonctions $f : x mapsto sqrt(x - 3)$ et $g : x mapsto frac(2x, x - 1)$.

1. Déterminer une valeur approchée à $10^(-2)$ près de $f(3,001)$.
2. Déterminer une valeur approchée à $10^(-2)$ près de $g(-3,001)$.

=== Activité 3

Dans le plan muni d'un repère orthogonal $(O, arrow(i), arrow(j))$, on a représenté la parabole $P$

d'équation $y = x^2$, l'hyperbole $H$ d'équation $y = frac(-1, x)$, le point $A$ de $P$ d'abscisse 1 et le point $B$ de $H$ d'abscisse 1.

#cetz.canvas({
  import cetz.draw: *
  // Axes
  line((-3, 0), (4, 0), stroke: 0.5pt, mark: (end: ">"))
  line((0, -2.5), (0, 4), stroke: 0.5pt, mark: (end: ">"))
  content((4, -0.3), $x$)
  content((-0.3, 4), $y$)
  content((-0.3, -0.3), $O$)
  // Graduations
  content((1, -0.3), text(size: 7pt)[$1$])
  content((-0.3, 1), text(size: 7pt)[$1$])
  // Parabole y = x^2
  bezier((-1.8, 3.24), (-1, 1), (-1.5, 2.25), (-1.2, 1.44), stroke: blue + 1.5pt)
  bezier((-1, 1), (0, 0), (-0.7, 0.49), (-0.3, 0.09), stroke: blue + 1.5pt)
  bezier((0, 0), (1, 1), (0.3, 0.09), (0.7, 0.49), stroke: blue + 1.5pt)
  bezier((1, 1), (1.8, 3.24), (1.2, 1.44), (1.5, 2.25), stroke: blue + 1.5pt)
  // Hyperbole y = -1/x (branche x > 0)
  bezier((0.3, -3.33), (0.5, -2), (0.35, -2.86), (0.4, -2.5), stroke: red + 1.5pt)
  bezier((0.5, -2), (1, -1), (0.6, -1.67), (0.8, -1.25), stroke: red + 1.5pt)
  bezier((1, -1), (2, -0.5), (1.3, -0.77), (1.7, -0.59), stroke: red + 1.5pt)
  bezier((2, -0.5), (3.5, -0.29), (2.5, -0.4), (3, -0.33), stroke: red + 1.5pt)
  // Hyperbole y = -1/x (branche x < 0)
  bezier((-3.5, 0.29), (-2, 0.5), (-3, 0.33), (-2.5, 0.4), stroke: red + 1.5pt)
  bezier((-2, 0.5), (-1, 1), (-1.7, 0.59), (-1.3, 0.77), stroke: red + 1.5pt)
  bezier((-1, 1), (-0.5, 2), (-0.8, 1.25), (-0.6, 1.67), stroke: red + 1.5pt)
  bezier((-0.5, 2), (-0.3, 3.33), (-0.4, 2.5), (-0.35, 2.86), stroke: red + 1.5pt)
  // Points A(1,1) et B(1,-1)
  circle((1, 1), radius: 0.06, fill: blue, stroke: blue)
  content((1.3, 1.3), text(size: 7pt)[$A$])
  circle((1, -1), radius: 0.06, fill: red, stroke: red)
  content((1.3, -1.3), text(size: 7pt)[$B$])
  // Labels courbes
  content((2, 3.5), text(size: 7pt, fill: blue)[$P$])
  content((3, -0.7), text(size: 7pt, fill: red)[$H$])
})

1. On note $E$ le point de $P$ d'abscisse $1,5$.

#h(0.5cm) a. Déterminer une équation cartésienne de la droite $(A E)$.

#h(0.5cm) b. Tracer la droite $(A E)$.

2. On note $F$ le point de $H$ d'abscisse $-0,5$.

#h(0.5cm) a. Déterminer une équation cartésienne de la droite $(B F)$.

#h(0.5cm) b. Tracer la droite $(B F)$.


// Source: Manuel T1 p.82
== Cours

=== 1. Nombre dérivé

==== Activité 1

Un mobile se déplace sur un axe $(x'x)$ muni d'un repère $(O, i)$ (1 unité = 1m).

L'abscisse $x(t)$ du mobile est donnée en fonction du temps $t$ (en secondes), par la loi horaire du mouvement $x(t) = t^2 - 3t$.

1. Déterminer la vitesse moyenne du mobile entre les instants $t_0$ et $t_1 = 4$.

2. Quelle est la vitesse du mobile à l'instant $t_0 = 2$ ?

#block(fill: rgb("#fff7f0"), inset: 10pt, radius: 4pt, width: 100%)[
  *Remarque*

  La vitesse moyenne entre les instants $t_0 = 0$ et $t_1 = 4$ est le quotient de la distance parcourue par la durée.
]

==== Activité 2

La distance (en mètre) parcourue par un mobile à l'instant $t$ (en secondes) est donnée par la fonction $d : [1, + infinity[ arrow.r RR$, $t mapsto 5t^2$, $t gt.eq 0$.

On a représenté dans le plan muni d'un repère orthogonal la fonction $d$.

1. a. Déterminer la distance parcourue par le mobile aux instants $t = 1$, $t = 2$, $t = 3$, $t = 4$ et $t = 5$.

#h(0.5cm) b. Calculer la vitesse moyenne du mobile sur chacun des intervalles de temps $[0, 1]$, $[1, 2]$, $[1, 3]$, $[4, 5]$ et $[1, 5]$.

2. On se propose de déterminer la vitesse exacte de la vitesse instantanée à l'instant $t_0 = 4$.

#h(0.5cm) a. Soit $h$ un nombre réel. Déterminer la vitesse moyenne entre les instants $4$ et $4 + h$.

#h(0.5cm) b. En déduire la valeur exacte de la vitesse instantanée à l'instant $t_0 = 4$.

#block(fill: rgb("#fff7f0"), inset: 10pt, radius: 4pt, width: 100%)[
  *Remarque*

  La vitesse instantanée à l'instant $t$ entre les instants $t$ et $t + h$ est la limite lorsque $h$ tend vers 0 de la vitesse moyenne entre les instants $t$ et $t + h$.
]

==== Activité 3

Le plan est muni d'un repère orthogonal $(O, arrow(i), arrow(j))$.

On considère la parabole $P$ de la courbe représentative de la fonction $f : x mapsto 1 + x^2$.

On considère les points $A(0, 1)$ et $B(b, (1+b)^2)$, $b eq.not 0$.

1. Calculer le coefficient directeur (ou pente) de la droite $(A B)$.

2. Calculer la limite $L$ de $m(b)$ lorsque $b$ tend vers zéro.

3. Que devient l'équation de la droite $(A B)$ lorsque $B$ se rapproche de $A$ ?

4. On désigne par $T$ la droite d'équation $y = L x + 1$.

Reproduire le graphique. Tracer la droite $T$ et les droites $(A B)$ pour $b = 1$ et $b = 0,5$.

#block(fill: rgb("#f0f7ff"), inset: 12pt, radius: 4pt, width: 100%)[
  *Définition*

  Soit $f$ une fonction définie sur un intervalle ouvert $I$ et $a$ un réel de $I$.

  On dit que $f$ est dérivable en $a$, s'il existe un nombre réel $ell$ tel que

  $ lim_(h arrow 0) frac(f(a + h) - f(a), h) = ell $

  ou encore $quad lim_(x arrow a) frac(f(x) - f(a), x - a) = ell$

  Le réel $ell$ est alors appelé le nombre dérivé de $f$ en $a$ et il est noté $f'(a)$.
]

// Source: Manuel T1 p.83
=== Conséquence

Le plan est muni d'un repère $(O, arrow(i), arrow(j))$.

Soit $f$ une fonction définie sur un intervalle ouvert $I$ et $a$ un réel de $I$.

$f$ est dérivable en $a$, si et seulement si, la courbe représentative de $f$ admet au point $M(a, f(a))$ une tangente de pente un nombre réel.

Cette tangente est d'équation $y = f'(a)(x - a) + f(a)$.

Un vecteur directeur de cette tangente est $arrow(u) vec(1, f'(a))$.

#cetz.canvas({
  import cetz.draw: *
  // Axes
  line((-0.5, 0), (5, 0), stroke: 0.5pt, mark: (end: ">"))
  line((0, -0.5), (0, 4), stroke: 0.5pt, mark: (end: ">"))
  content((5, -0.3), $x$)
  content((-0.3, 4), $y$)
  content((-0.3, -0.3), $O$)
  // Courbe
  bezier((0.5, 3), (1.5, 1), (0.8, 2), (1.2, 1.2), stroke: blue + 1.5pt)
  bezier((1.5, 1), (2.5, 1.5), (1.8, 0.8), (2.2, 1.2), stroke: blue + 1.5pt)
  bezier((2.5, 1.5), (4, 3.5), (3, 2), (3.5, 2.8), stroke: blue + 1.5pt)
  // Point M
  circle((2.5, 1.5), radius: 0.06, fill: blue, stroke: blue)
  content((2.8, 1.2), text(size: 7pt)[$M(a, f(a))$])
  // Tangente en M
  line((1, 0.5), (4, 2.5), stroke: red + 1pt)
  content((4.2, 2.7), text(size: 7pt, fill: red)[$T$])
  // Projection
  line((2.5, 0), (2.5, 1.5), stroke: (dash: "dashed", paint: gray))
  content((2.5, -0.3), text(size: 7pt)[$a$])
})

#block(fill: rgb("#fff7f0"), inset: 10pt, radius: 4pt, width: 100%)[
  *Remarque*

  La droite $D$ est la tangente de la parabole $P$ au point $F$ si la droite $D$ passe par $F$ et a pour coefficient directeur $f'(a)$.
]

==== Activité 4

Le plan est muni d'un repère orthogonal $(O, arrow(i), arrow(j))$.

On considère la droite $D$ d'équation $y = frac(x, 4) + 1$ et le point $F(0, 1)$.

Soit $M(x, y)$ un point et $H$ son projeté orthogonal sur $D$.

1. a. Calculer les distances $M F$ et $M H$.

#h(0.5cm) b. En déduire que $M F = M H$, si et seulement si, $y = x^2$.

2. Quel est l'ensemble des points $M$ tels que $M F = M H$ ?

3. Montrer que la fonction $f : x mapsto x^2 + frac(1, 4)$ est dérivable en tout réel $a$.

4. Soit $A(2, 2)$ un point de la parabole $P$ d'équation $y = x^2 + frac(1, 4)$.

$A'$ son projeté orthogonal sur la droite $D$ et $T$ la tangente à la parabole $P$ en $A$.

#h(0.5cm) a. Donner une équation de la tangente $T$.

#h(0.5cm) b. Que représente la droite $T$ pour le segment $[F A']$ ?

5. Soit $a$ un réel et $M(a, frac(1, 4) a^2)$ un point de la parabole $P$ et $H'$ son projeté orthogonal sur $D$.

Que représente la tangente à $P$ en $M$ pour le segment $[F H']$ ?

6. En déduire un procédé pour construire la tangente à la parabole au point $M$.

==== Activité 5

Le plan est muni d'un repère orthogonal $(O, arrow(i), arrow(j))$.

On désigne par $H$ l'hyperbole d'équation $y = frac(a, x) + b$ et $M(a, frac(a, a) + b)$ un point de $H$ avec $a eq.not 0$.

1. Montrer que la fonction $f : x mapsto frac(a, x) + b$ est dérivable en tout réel non nul $a$.

2. Écrire une équation de la tangente $T$ à $H$ au point $M$.

3. La droite $T$ coupe l'axe des abscisses en $N$ et l'axe des ordonnées en $N'$.

Déterminer les coordonnées de $N$ et de $N'$ en fonction de $a$.

4. Calculer l'aire du triangle $O N N'$.

// Source: Manuel T1 p.84
=== 2. Approximation affine d'une fonction

==== Activité 1

Soit $f$ une fonction définie sur un intervalle ouvert $I$ et $a$ un réel de $I$.

On suppose que $f$ est dérivable en $a$.

On pose $g(x) = frac(f(x) - f(a), x - a) - f'(a)$.

1. Montrer que $lim_(x arrow a) g(x) = 0$.

2. Vérifier que $f(x) = f(a) + f'(a)(x - a) + (x - a) g(x)$ et en déduire que $f$ est continue en $a$.

#block(fill: rgb("#e8f5e9"), inset: 12pt, radius: 4pt, width: 100%)[
  *Théorème*

  Soit $f$ une fonction définie sur un intervalle ouvert $I$ et $a$ un réel de $I$.

  Si $f$ est dérivable en $a$, alors $f$ est continue en $a$.
]

==== Activité 2

Dans le plan muni d'un repère orthogonal $(O, arrow(i), arrow(j))$, on a représenté la courbe $C$ représentative de la fonction $f : x mapsto x sqrt(x)$.

On désigne par $A$ le point de la courbe $C$ d'abscisse 1.

1. a. Montrer que la fonction $f$ est dérivable en 1.

#h(0.5cm) b. Déterminer l'équation de la tangente $D$ à la courbe $C$ au point d'abscisse 1.

2. On désigne par $M_1$ le point de $C$ d'abscisse $1,1$ et par $N_1$ le point de $D$ d'abscisse $1,1$.

#h(0.5cm) a. Vérifier que $M_1 N_1 lt.eq 10^(-1)$.

#h(0.5cm) b. En déduire, sans faire de calcul, une valeur approchée à $10^(-3)$ près de $(1,1)^(3/2)$.

#cetz.canvas({
  import cetz.draw: *
  // Axes
  line((-0.5, 0), (4, 0), stroke: 0.5pt, mark: (end: ">"))
  line((0, -0.5), (0, 3.5), stroke: 0.5pt, mark: (end: ">"))
  content((4, -0.3), $x$)
  content((-0.3, 3.5), $y$)
  content((-0.3, -0.3), $O$)
  // Courbe f(x) = x*sqrt(x)
  bezier((0, 0), (0.5, 0.35), (0.2, 0.09), (0.4, 0.25), stroke: blue + 1.5pt)
  bezier((0.5, 0.35), (1, 1), (0.6, 0.46), (0.8, 0.72), stroke: blue + 1.5pt)
  bezier((1, 1), (2, 2.83), (1.3, 1.48), (1.7, 2.19), stroke: blue + 1.5pt)
  bezier((2, 2.83), (2.5, 3.5), (2.2, 3.11), (2.4, 3.39), stroke: blue + 1.5pt)
  // Point A(1,1)
  circle((1, 1), radius: 0.06, fill: blue, stroke: blue)
  content((1.3, 0.8), text(size: 7pt)[$A$])
  // Tangente en A
  line((0, -0.5), (2.5, 3.25), stroke: red + 1pt)
  content((2.7, 3.3), text(size: 7pt, fill: red)[$D$])
  // Graduation
  content((1, -0.3), text(size: 7pt)[$1$])
  content((-0.3, 1), text(size: 7pt)[$1$])
})

#block(fill: rgb("#f0f7ff"), inset: 12pt, radius: 4pt, width: 100%)[
  *Définition*

  Soit $f$ une fonction définie sur un intervalle ouvert $I$ et $a$ un réel de $I$.

  Si $f$ est dérivable en $a$, alors le réel $f(x) approx f'(a)(x - a) + f(a)$ est une approximation affine de $f(a+h)$ et on écrit $f(a + h) approx f(a) + f'(a)h$, pour $h$ voisin de zéro.
]

==== Activité 3

Dans le plan muni d'un repère orthogonal $(O, arrow(i), arrow(j))$, on a tracé la courbe représentative $C$ d'une fonction $f$, ainsi que les tangentes à la courbe $C$ en chacun de ses points d'abscisses $-1$, $0$ et $1$.

1. Déterminer graphiquement $f(-1)$, $f'(0)$ et $f'(1)$.

2. Déterminer les équations des tangentes à la courbe $C$ en chacun de ses points d'abscisses respectives $-1$, $0$ et $1$.

3. Donner des approximations affines de $f(-1,001)$, $f(0,0001)$ et $f(1,1)$.

// Source: Manuel T1 p.85
==== Activité 4

En faisant réagir deux substances chimiques $A$ et $B$ on obtient un produit $C$ dont la quantité en fonction du temps est $q(t) = 2 - frac(1, t + 1)$, $t gt.eq 1$.

1. Tracer, dans un repère orthogonal $(O, arrow(i), arrow(j))$, la courbe représentative de la fonction $q : t mapsto q(t)$.

2. Calculer le taux de production moyen entre les instants $t = 1$ et $t = 3$.

3. a. Soit $h$ un réel non nul. Calculer $frac(q(3 + h) - q(3), h)$.

#h(0.5cm) b. En déduire le taux de production instantanée à l'instant $t_0 = 3$ et une approximation affine de $q(3,01)$.

#block(fill: rgb("#fff7f0"), inset: 10pt, radius: 4pt, width: 100%)[
  *Remarque*

  Les instants $t_0 = 3$ et $t_0 + h$ sont les instants entre lesquels on calcule le taux de production moyen. L'instant $t_0$ est fixe. La limite, lorsque $h$ tend vers zéro, du taux de production moyen entre les instants $t_0$ et $t_0 + h$.
]

=== 3. Nombre dérivé de fonctions usuelles

==== Activité 1

Soit $a$ un réel.

1. Soit $beta$ un réel. Montrer que la fonction constante $f : x mapsto beta$ est dérivable en $a$ et calculer $f'(a)$.

2. Montrer que la fonction $g : x mapsto x$ est dérivable en $a$ et calculer $g'(a)$.

3. Soit $alpha$ et $beta$ deux réels. Montrer que la fonction $h : x mapsto alpha x + beta$ est dérivable en $a$ et calculer $h'(a)$.

4. Soit $alpha$ et $beta$ deux réels. Montrer que la fonction $k : x mapsto (x - alpha)^2 + beta$ est dérivable en $a$ et calculer $k'(a)$.

==== Activité 2

On considère la fonction $f$ définie sur $RR backslash {-1}$ par $f(x) = frac(1, x + 1)$.

I. 1. Soit $a > -1$.

#h(0.5cm) a. Calculer $frac(f(a+h) - f(a), h)$, $h eq.not 0$ et $a + h > -1$.

#h(0.5cm) b. En déduire que $f$ est dérivable en $a$. Que vaut $f'(a)$ ?

#h(0.5cm) 2. Calculer $f'(a)$ pour $a < -1$.

II. Soit $alpha$ et $beta$ deux réels avec $alpha$ non nul. On considère la fonction $g : x mapsto frac(1, alpha x + beta)$.

3. Soit un réel $a > frac(-beta, alpha)$.

#h(0.5cm) a. Calculer $frac(g(a+h) - g(a), h)$, $h eq.not 0$ et $a + h > frac(-beta, alpha)$.

#h(0.5cm) b. En déduire que $g$ est dérivable en $a$. Que vaut $g'(a)$ ?

4. Calculer $g'(a)$ pour $a < frac(-beta, alpha)$.

// Source: Manuel T1 p.86
==== Activité 3

On considère la fonction $f$ définie sur $]0, +infinity[$ par $f(x) = sqrt(x)$.

Soit $a$ un nombre réel strictement positif.

1. Montrer que $frac(sqrt(a + h) - sqrt(a), h) = frac(1, sqrt(a + h) + sqrt(a))$, pour tout réel $h$ tel que $h eq.not 0$ et $a + h > 0$.

2. En déduire que $f$ est dérivable en $a$. Que vaut $f'(a)$ ?

Dans les activités précédentes, on a établi les résultats suivants.

#block(fill: rgb("#e8f5e9"), inset: 12pt, radius: 4pt, width: 100%)[
  *Théorème*

  Toute fonction constante est dérivable en tout réel $a$.

  La fonction $x mapsto x$ est dérivable en tout réel $a$.

  La fonction $x mapsto alpha x + beta$ est dérivable en tout réel $a$.

  La fonction $x mapsto (x - alpha)^2 + beta$ est dérivable en tout réel $a$.

  La fonction $x mapsto frac(1, alpha x + beta)$ est dérivable en tout réel $a eq.not frac(-beta, alpha)$.

  La fonction $x mapsto sqrt(x)$ est dérivable en tout réel $a > 0$.
]

Le tableau ci-dessous donne les nombres dérivés de quelques fonctions usuelles.

#table(
  columns: 2,
  align: (left, left),
  stroke: 0.5pt,
  [*Fonction $f$*], [*$f'(a)$*],
  [$f : x mapsto beta$], [$f'(a) = 0, a in RR$],
  [$f : x mapsto alpha x + beta$], [$f'(a) = alpha, a in RR$],
  [$f : x mapsto (x - alpha)^2 + beta$], [$f'(a) = 2(a - alpha), a in RR$],
  [$f : x mapsto x^n, n in NN^*$], [$f'(a) = n a^(n-1), a in RR$],
  [$f : x mapsto sqrt(x + alpha)$], [$f'(a) = frac(1, 2 sqrt(a + alpha)), a > -alpha$],
  [$f : x mapsto frac(1, alpha x + beta)$], [$f'(a) = frac(-alpha, (alpha a + beta)^2), a eq.not frac(-beta, alpha)$],
)

==== Activité 4

On considère la fonction $f$ définie sur $RR backslash {-2}$ par $f(x) = frac(1, x + 2)$.

#table(
  columns: 6,
  align: center,
  stroke: 0.5pt,
  [], [$-2,5$], [$-2,1$], [$-2,05$], [$-2,001$], [$-1,999$],
)

1. En utilisant le nombre dérivé de $f$ en $1$, estimer :

2. Comparer les résultats obtenus avec ceux affichés par la calculatrice.

// Source: Manuel T1 p.87
==== Activité 5

On considère la fonction $f$ définie sur $]0, +infinity[$ par $f(x) = sqrt(x)$.

1. En utilisant le nombre dérivé de $f$ en $25$, $100$, $10000$, estimer $sqrt(27)$, $sqrt(24)$, $sqrt(101)$, $sqrt(98)$, $sqrt(10013)$.

2. Comparer les résultats obtenus avec ceux affichés par la calculatrice.

=== 4. Opérations algébriques sur les fonctions dérivables en $a$

Les règles de dérivation suivantes résultent de la définition du nombre dérivé d'une fonction.

Soit $f$ et $g$ deux fonctions définies sur un intervalle ouvert $I$, $a$ un réel de $I$, et $alpha$ et $beta$ deux réels.

- Si $f$ et $g$ sont dérivables en $a$ alors les fonctions $f + g$, $f g$, $alpha f + beta g$ sont dérivables en $a$ et on a

#h(0.5cm) $(f + g)'(a) = f'(a) + g'(a)$,

#h(0.5cm) $(alpha f + beta g)'(a) = alpha f'(a) + beta g'(a)$,

#h(0.5cm) $(f g)'(a) = f'(a) g(a) + f(a) g'(a)$.

- Soit $k$ un entier naturel strictement supérieur à 1.

Si la fonction $f$ est dérivable en $a$ alors la fonction $f^k$ est dérivable en $a$ et on a

#h(0.5cm) $(f^k)'(a) = k f^(k-1)(a) f'(a)$.

- Si $a$ est un réel et $f$ est une fonction polynomiale définie par

#h(0.5cm) $f(x) = b_0 + b_1 x + b_2 x^2 + dots.h + b_n x^n$ alors $f$ est dérivable en $a$ et on a

#h(0.5cm) $f'(a) = b_1 + 2 b_2 a + dots.h + n b_n a^(n-1)$.

Soit $f$ et $g$ deux fonctions définies sur un intervalle ouvert $I$ et $a$ un réel de $I$.

Si $f$ et $g$ sont deux fonctions dérivables en $a$ et si $f$ ne s'annule pas en $a$ alors les fonctions

#h(0.5cm) $frac(1, f)$, $frac(g, f)$ sont dérivables en $a$ et on a

$ (frac(1, f))'(a) = frac(-f'(a), (f(a))^2) $

$ (frac(g, f))'(a) = frac(g'(a) f(a) - g(a) f'(a), (f(a))^2) $

==== Activité 1

On considère les fonctions $f$ et $g$ définies sur $RR$ par $f(x) = x^3 + 1$ et $g(x) = x^3 - x^2 - 6x + 4$.

Pour chacune des fonctions suivantes, calculer le nombre dérivé en 1 :

$f + g$, $f times g$, $frac(f, g)$, $f^2$ et $frac(f, g^2)$.

// Source: Manuel T1 p.88
==== Activité 2

Le plan est muni d'un repère orthogonal $(O, arrow(i), arrow(j))$.

Soit $f$ la fonction définie par $f(x) = x^3 - x$ et $C$ sa courbe représentative.

1. Justifier la dérivabilité de $f$ en tout réel $a$.

2. Déterminer les points de $C$ où la tangente est parallèle à l'axe des abscisses.

3. Déterminer les points de $C$ où la tangente est parallèle à la droite d'équation $y = x$.

=== 5. Fonction $sqrt(f)$

#block(fill: rgb("#e8f5e9"), inset: 12pt, radius: 4pt, width: 100%)[
  *Théorème*

  Nous admettons le théorème suivant.

  Soit $f$ une fonction définie et positive sur un intervalle ouvert $I$ et $a$ un réel de $I$.

  Si $f$ est une fonction dérivable en $a$ et si $f(a) > 0$, alors la fonction $sqrt(f)$ est dérivable en $a$ et on a

  $ (sqrt(f))'(a) = frac(f'(a), 2 sqrt(f(a))) $
]

==== Activité 1

Pour chacune des fonctions suivantes, calculer le nombre dérivé en $a$.

1. $f(x) = sqrt(3x + 5)$ ; $a = 1$. #h(1cm) 2. $g(x) = sqrt(-2x + 4)$ ; $a = 0$. #h(1cm) 3. $h(x) = sqrt(-2x^2 + 2)$ ; $a = 0$.

==== Activité 2

On considère la fonction $f$ définie sur $[-1, +1]$ par $f(x) = sqrt(1 - x^2)$.

1. En utilisant le nombre dérivé de $f$ en 0, estimer $sqrt(1 - (0,1)^2)$, $sqrt(1 - (0,01)^2)$, $sqrt(1 - (0,001)^2)$, $sqrt(1 - (0,0001)^2)$.

2. Comparer les résultats obtenus avec ceux affichés par la calculatrice.

=== 6. Nombre dérivé à droite - Nombre dérivé à gauche

==== Activité 1

On considère la fonction $f : x mapsto |x|$.

1. Représenter la fonction $f$ dans le plan muni d'un repère orthogonal $(O, arrow(i), arrow(j))$.

2. Que peut-on conjecturer sur la dérivabilité de la fonction $f$ en zéro ?

3. a. Calculer $theta(h) = frac(f(h) - f(0), h)$, $h eq.not 0$.

#h(0.5cm) b. Déterminer $lim_(h arrow 0^+) theta(h)$.

#h(0.5cm) c. Déterminer $lim_(h arrow 0^-) theta(h)$.

4. Justifier votre conjecture.

// Source: Manuel T1 p.89
#block(fill: rgb("#f0f7ff"), inset: 12pt, radius: 4pt, width: 100%)[
  *Définition*

  - Soit $f$ une fonction définie sur un intervalle de la forme $]a, b[$.

  On dit que $f$ est dérivable à gauche en $a$, si le rapport $frac(f(a + h) - f(a), h)$ admet une limite finie quand $h$ tend vers $0^-$.

  Cette limite est alors notée $f'_g (a)$ et est appelée le nombre dérivé de $f$ à gauche en $a$.

  - Soit $f$ une fonction définie sur un intervalle de la forme $]a, b[$.

  On dit que $f$ est dérivable à droite en $a$, si le rapport $frac(f(a + h) - f(a), h)$ admet une limite finie quand $h$ tend vers $0^+$.

  Cette limite est alors notée $f'_d (a)$ et est appelée le nombre dérivé de $f$ à droite en $a$.
]

==== Activité 2

Soit $f$ une fonction définie sur un intervalle ouvert $I$ et $a$ un réel de $I$.

Montrer que $f$ est dérivable en $a$, si et seulement si, $f$ est dérivable à droite et à gauche en $a$ et $f'_d (a) = f'_g (a)$.

#block(fill: rgb("#e8f5e9"), inset: 12pt, radius: 4pt, width: 100%)[
  *Théorème*

  Soit $f$ une fonction définie sur un intervalle ouvert $I$ et $a$ un réel de $I$.

  La fonction $f$ est dérivable en $a$, si et seulement si, $f$ est dérivable à droite et à gauche en $a$ et $f'_d (a) = f'_g (a)$.

  On a alors $f'(a) = f'_d (a) = f'_g (a)$.
]

=== 7. Demi-tangente à une courbe

==== Activité 1

Dans le plan muni d'un repère orthogonal $(O, arrow(i), arrow(j))$, $C$ est la courbe représentative de la fonction $f$ définie sur $RR$ par

$ f(x) = cases(x^2 - 2x quad "si" x lt.eq 2, 2x - x^2 quad "si" x > 2) $

On considère le point $A(2, 0)$.

1. Calculer $f'_g (2)$ et $f'_d (2)$. La fonction $f$ est-elle dérivable en 2 ?

2. Soit $h$ un réel strictement positif et $M$ un point de $C$ d'abscisse $(2-h)$. Montrer que lorsque $M$ se rapproche de $A$, les coefficients directeurs des demi-droites $[A M)$ tendent vers le coefficient directeur de la demi-droite $[A T_1)$ où $T_1(3, -2)$.

3. Soit $h$ un réel strictement positif et $N$ un point de la courbe $C$ d'abscisse $(2+h)$. Montrer que lorsque $N$ se rapproche de $A$, les coefficients directeurs des demi-droites $[A N)$ tendent vers le coefficient directeur de la demi-droite $[A T_2)$ où $T_2(1, -2)$.

// Source: Manuel T1 p.90
=== Conséquence

Le plan est muni d'un repère $(O, arrow(i), arrow(j))$.

Soit $f$ une fonction définie sur un intervalle ouvert $I$ et $a$ un réel de $I$.

- $f$ est dérivable à droite en $a$, si et seulement si, la courbe représentative de $f$ admet en point $A(a, f(a))$ une demi-tangente déterminée par $y = f'_d (a)(x - a) + f(a)$, $x gt.eq a$.

Un vecteur directeur de cette demi-tangente est $arrow(u) vec(1, f'_d (a))$.

- $f$ est dérivable à gauche en $a$, si et seulement si, la courbe représentative de $f$ admet en point $A(a, f(a))$ une demi-tangente déterminée par $y = f'_g (a)(x - a) + f(a)$, $x lt.eq a$.

Un vecteur directeur de cette demi-tangente est $arrow(v) vec(-1, -f'_g (a))$.

==== Activité 2

Dans le plan muni d'un repère orthogonal, on a tracé les courbes respectives $C$, $C'$ et $C''$ des fonctions $f$, $g$ et $h$ définies sur $RR$, par

$ f : x mapsto |x^2 - 2x| quad ; quad g : x = cases(x^4 quad "si" x lt.eq 4, -x + 8 quad "si" x > 4) quad ; quad h : x = cases((x+2)^2 quad "si" x lt.eq 0, -x^2 + 4x quad "si" x > 0) $

#cetz.canvas({
  import cetz.draw: *
  // Premier graphe : f(x) = |x^2 - 2x|
  // Axes
  line((-1, 0), (4, 0), stroke: 0.5pt, mark: (end: ">"))
  line((0, -0.5), (0, 3), stroke: 0.5pt, mark: (end: ">"))
  content((4, -0.3), $x$)
  content((-0.3, 3), $y$)
  content((-0.3, -0.3), $O$)
  // |x^2 - 2x| : rebond en 0 et 2
  bezier((-0.5, 1.25), (0, 0), (-0.3, 0.5), (-0.1, 0.1), stroke: blue + 1.5pt)
  bezier((0, 0), (1, 1), (0.3, 0.3), (0.7, 0.8), stroke: blue + 1.5pt)
  bezier((1, 1), (2, 0), (1.3, 0.8), (1.7, 0.3), stroke: blue + 1.5pt)
  bezier((2, 0), (3, 3), (2.3, 0.3), (2.7, 1.5), stroke: blue + 1.5pt)
  content((1, -0.3), text(size: 7pt)[$1$])
  content((2, -0.3), text(size: 7pt)[$2$])
  content((3.5, 2.5), text(size: 7pt, fill: blue)[$C$])
})

Pour chacune des fonctions $f$, $g$ et $h$, identifier les points où elle n'est pas dérivable, donner les équations des demi-tangentes en ces points et les représenter.

=== 8. Dérivabilité d'une fonction sur un intervalle

#block(fill: rgb("#f0f7ff"), inset: 12pt, radius: 4pt, width: 100%)[
  *Définition*

  - Soit $a$ et $b$ finis ou infinis.

  On dit que la fonction $f$ est dérivable sur $]a, b[$ si $f$ est dérivable en tout réel de $]a, b[$.

  - Soit $a$ un réel et $b$ fini ou infini.

  On dit que la fonction $f$ est dérivable sur $[a, b[$ si $f$ est dérivable sur $]a, b[$ et si elle est dérivable à droite en $a$.

  - Soit $a$ fini ou infini et $b$ un réel.

  On dit que la fonction $f$ est dérivable sur $]a, b]$ si $f$ est dérivable sur $]a, b[$ et si elle est dérivable à gauche en $b$.

  - Soit $a$ et $b$ deux réels.

  On dit que la fonction $f$ est dérivable sur $[a, b]$ si $f$ est dérivable sur $]a, b[$ et si elle est dérivable à droite en $a$ et elle est dérivable à gauche en $b$.
]

// Source: Manuel T1 p.91
==== Activité 1

Dans chacun des cas suivants, montrer que la fonction $f$ est dérivable sur l'intervalle $I$.

1. $f : x mapsto 3x + 1$, $I = RR$.

2. $f : x mapsto sqrt(x + 1)$, $I = [-1, 1]$.

3. $f : x mapsto sqrt(x^2 + 2)$, $I = RR$.

4. $f : x mapsto 3x + 5$, $I = [2, 5]$.

5. $f : x mapsto x sqrt(x)$, $I = [0, +infinity[$.

6. $f : x mapsto sqrt(4 - x + 1)$, $I = ]-infinity, 1]$.

==== Activité 2

On considère la fonction $f$ définie sur $RR$ par

$ f(x) = cases(-x (x + 2) quad "si" x lt.eq 0, x(x + 2) quad "si" x > 0) $

1. Étudier la dérivabilité de $f$ sur l'intervalle $]-infinity, 0]$.

2. Étudier la dérivabilité de $f$ sur l'intervalle $[0, +infinity[$.

3. La fonction $f$ est-elle dérivable sur $RR$ ?

==== Activité 3

On considère la fonction $f : x mapsto |2x + 1|$ sur $]-infinity, -frac(1, 2)[$

1. Montrer que $f$ est dérivable sur chacun des intervalles $]-infinity, frac(-1, 2)[$, $]-frac(1, 2), +infinity[$ et en $frac(-1, 2)$.

2. Étudier la dérivabilité de $f$ en $frac(-1, 2)$ et en 2.

=== 10. Demi-tangente verticale

==== Activité 1

Le plan est muni d'un repère orthogonal $(O, arrow(i), arrow(j))$.

On a tracé les représentations graphiques $C_f$ et $C_g$ des fonctions $f$ et $g$ définies par $f(x) = sqrt(x)$ et $g(x) = x^2$.

Soit un réel $a > 0$ et les points $M_a(a, sqrt(a))$ et $A'(a, a^2)$.

1. Vérifier que $A$ appartient à $C_f$ et que $A'$ appartient à $C_g$.

2. Soit $I$ le milieu du segment $[A A']$.

#h(0.5cm) a. Montrer que $I$ appartient à la première bissectrice d'équation $y = x$.

#h(0.5cm) b. Montrer que les droites $(O I)$ et $(A A')$ sont perpendiculaires.

#h(0.5cm) c. En déduire que les points $A$ et $A'$ sont symétriques par rapport à la première bissectrice.

#cetz.canvas({
  import cetz.draw: *
  // Axes
  line((-0.5, 0), (5, 0), stroke: 0.5pt, mark: (end: ">"))
  line((0, -0.5), (0, 5), stroke: 0.5pt, mark: (end: ">"))
  content((5, -0.3), $x$)
  content((-0.3, 5), $y$)
  content((-0.3, -0.3), $O$)
  // Première bissectrice y = x
  line((0, 0), (4.5, 4.5), stroke: (dash: "dashed", paint: gray))
  // f(x) = sqrt(x)
  bezier((0, 0), (1, 1), (0.2, 0.45), (0.5, 0.71), stroke: blue + 1.5pt)
  bezier((1, 1), (4, 2), (1.5, 1.22), (3, 1.73), stroke: blue + 1.5pt)
  content((4.2, 2.2), text(size: 7pt, fill: blue)[$C_f$])
  // g(x) = x^2
  bezier((0, 0), (1, 1), (0.45, 0.2), (0.71, 0.5), stroke: red + 1.5pt)
  bezier((1, 1), (2, 4), (1.22, 1.5), (1.73, 3), stroke: red + 1.5pt)
  content((2.2, 4.2), text(size: 7pt, fill: red)[$C_g$])
})

// Source: Manuel T1 p.92
3. a. Écrire l'équation de la tangente $D$ à $C_g$ au point $A'$.

#h(0.5cm) b. Écrire l'équation de la tangente $D'$ à la courbe de $C_f$ au point $A'$.

#h(0.5cm) c. Montrer que $D$ et $D'$ sont symétriques par rapport à la première bissectrice.

4. a. Montrer que $C_g$ admet une demi-tangente au point $O$, déterminée par $y = 0$, $x gt.eq 0$.

#h(0.5cm) b. Peut-on tracer une demi-tangente à $C_f$ au point $O$ ?

#h(0.5cm) c. Calculer la limite de $frac(f(h) - f(0), h)$ quand $h$ tend vers $0^+$.

Le plan est muni d'un repère orthogonal $(O, arrow(i), arrow(j))$.

Soit $f$ une fonction définie sur un intervalle $I$ et $a$ un réel de $I$.

Si $lim_(h arrow 0^+) frac(f(a+h) - f(a), h) = +infinity$ (ou $-infinity$) alors la courbe $C$ admet au point $M(a, f(a))$ une demi-tangente verticale.

Si $lim_(h arrow 0^-) frac(f(a+h) - f(a), h) = +infinity$ (ou $-infinity$) alors la courbe $C$ admet au point $M(a, f(a))$ une demi-tangente verticale.

==== Activité 2

Le plan est muni d'un repère orthogonal $(O, arrow(i), arrow(j))$.

Soit la fonction $g$ définie sur $RR$ par $g(x) = -root(3, x)$.

1. Tracer $C$ la courbe représentative de $g$.

2. Étudier la limite de $frac(g(h) - g(0), h)$ quand $h$ tend vers 0.

3. Tracer les demi-tangentes à $C$ au point d'abscisse 0.


// Source: Manuel T1 p.93
== QCM - Vrai ou faux

=== QCM

Cocher la réponse exacte.

1. Dans le plan muni d'un repère $(O, arrow(i), arrow(j))$, on désigne par $C$ la courbe représentative d'une fonction $f$ dérivable en 1 et telle qu'une équation de la tangente au point d'abscisse 1 est $y = frac(x, 2) + 3$. Alors $f'(1) =$

$ square quad frac(1, 2) #h(2cm) square quad 1 #h(2cm) square quad 3 $

2. Dans le plan muni d'un repère $(O, arrow(i), arrow(j))$, on désigne par $C$ la courbe représentative de la fonction $f$ définie sur $RR$ par $f(x) = x^3$.

Alors la tangente à $C$ au point d'abscisse $-1$ a pour équation

$ square quad y = -3x - 1 #h(1cm) square quad y = 3(x+1) - 1 #h(1cm) square quad y = (x-1) - 1 $

3. Le plan est muni d'un repère $(O, arrow(i), arrow(j))$, la courbe représentative $C$ de la fonction $f$ définie par $f(x) = x^3 - x$ admet au point d'abscisse 0 une tangente de coefficient directeur

$ square quad 0 #h(2cm) square quad -1 #h(2cm) square quad 1 $

4. Dans le plan muni d'un repère $(O, arrow(i), arrow(j))$, $C_f$ est la courbe représentative d'une fonction $f$ et $T$ est la tangente à $C_f$ au point d'abscisse 2. Graphiquement on a $f'(2) =$

$ square quad 0 #h(2cm) square quad 1 #h(2cm) square quad 2 $

5. Dans le plan muni d'un repère $(O, arrow(i), arrow(j))$, on désigne par $C$ la courbe représentative de la fonction $f$ définie sur $[0, +infinity[$ par $f(x) = frac(x, sqrt(x))$. Alors il existe une tangente $C$ parallèle à

$ square quad f'(alpha)(1) #h(1cm) square quad "la droite" y = 2x + 3 #h(1cm) square quad "la droite" y = -2x + 3 $


=== Corrigé du QCM

// Source: Corrigé T1 p.59
1) $f'(1) = frac(1, 2)$ #h(1cm) $arrow.long$ (b)

2) $y = 3(x + 1) - 1$ #h(1cm) $arrow.long$ (b)

3) $f'(o) = -1$ #h(1cm) $arrow.long$ (b)

4) $f'(2) = 0$ #h(1cm) $arrow.long$ (a)

5) $y = -2x + 3$ #h(1cm) $arrow.long$ (c)


=== Vrai - Faux

Répondre par vrai ou faux en justifiant la réponse.

1. Si $f$ est une fonction dérivable à droite et à gauche en $a$, alors $f$ est dérivable en $a$.

2. La fonction $x mapsto |x|$ est dérivable en 0.

3. La fonction $x mapsto sqrt(2x+3)$ est dérivable à droite en $-frac(3, 2)$.

4. Si $f$ est continue en $a$, alors $f$ est dérivable en $a$.

5. Si $f$ est une fonction impaire dérivable en 0 alors $f'(0) = 0$.


=== Corrigé Vrai – Faux

// Source: Corrigé T1 p.59
*1) Faux* #h(1cm) le cas où $f'_g (a) eq.not f'_d (a)$ #h(0.5cm) (voir l'exemple de la question suivante $f(x) = |x|$ et $a = 0$)

*2) Faux* #h(1cm) En effet :

- pour $x > 0$, $f(x) = x$ on a :

$ lim_(x arrow.r 0^+) frac(f(x) - f(0), x - 0) = lim_(x arrow.r 0^+) frac(x, x) = 1 #h(0.5cm) d' o u #h(0.2cm) f_d '(0) = 1 $

- pour $x < 0$, $f(x) = -x$ on a :

$ lim_(x arrow.r 0^-) frac(f(x) - f(0), x - 0) = lim_(x arrow.r 0^-) frac(-x, x) = -1 #h(0.5cm) d' o u #h(0.2cm) f_g '(0) = -1 $

on aura : $f_g '(0) eq.not f_d '(0)$

_Donc $f$ n'est pas dérivable en 0_

*3) Faux* #h(1cm) En effet :

$ lim_(x arrow.r (-frac(3,2))^+) frac(f(x) - f(-frac(3,2)), x - (-frac(3,2))) = lim_(x arrow.r (-frac(3,2))^+) frac(sqrt(2x + 3), x + frac(3,2)) $

$ = lim_(x arrow.r (-frac(3,2))^+) 2(frac(sqrt(2x+3), 2x+3)) = lim_(x arrow.r (-frac(3,2))^+) (frac(2, sqrt(2x+3))) = +infinity $

car $lim_(x arrow.r (-frac(3,2))^+) (sqrt(2x+3)) = 0^+$

*4) Faux*

Contre exemple : _Soit_ $f(x) = |x|$ et $a = 0$

*5) Faux*

Contre exemple : _Soit_ $f(x) = x$

$f$ est impaire mais $f'(0) = 1$


// Source: Manuel T1 p.94
== Mobiliser ses compétences

=== Situation 1

#cetz.canvas({
  import cetz.draw: *
  // Axes
  line((-1, 0), (5, 0), stroke: 0.5pt, mark: (end: ">"))
  line((0, -1), (0, 4.5), stroke: 0.5pt, mark: (end: ">"))
  content((5, -0.3), $x$)
  content((-0.3, 4.5), $y$)
  content((-0.3, -0.3), $O$)
  // Courbe f(x) = 2x^3 + x - 4
  bezier((0.5, -2.75), (1, -1), (0.7, -2), (0.9, -1.4), stroke: blue + 1.5pt)
  bezier((1, -1), (1.2, 0), (1.05, -0.6), (1.15, -0.2), stroke: blue + 1.5pt)
  bezier((1.2, 0), (2, 2), (1.4, 0.6), (1.7, 1.3), stroke: blue + 1.5pt)
  bezier((2, 2), (2.5, 4), (2.2, 2.7), (2.4, 3.5), stroke: blue + 1.5pt)
  // Tangente au point
  line((0.5, -2), (2.5, 4), stroke: red + 1pt)
})

Dans le plan muni d'un repère orthogonal $(O, arrow(i), arrow(j))$, on a représenté la fonction $f$ définie sur $RR$ par $f(x) = 2x^3 + x - 4$.

1. Résoudre graphiquement l'équation $f(x) = 0$.

2. On désigne par $alpha$ la solution de l'équation $f(x) = 0$.

Montrer que $alpha in ]1, 2[$.

3. On se propose de déterminer des valeurs approchées de $alpha$ par excès en appliquant la méthode de Newton.

#h(0.5cm) a. Déterminer l'abscisse $x_1$ du point d'intersection de l'axe des abscisses et de la tangente à la courbe au point d'abscisse 1.

#h(0.5cm) Vérifier que $x_1 in [1, x_1]$.

#h(0.5cm) b. Déterminer l'abscisse $x_2$ du point d'intersection de l'axe des abscisses et de la tangente à la courbe au point d'abscisse $x_1$.

#h(0.5cm) Vérifier que $x_1 in ]1, x_1[$.

#h(0.5cm) c. Réitérer le procédé en considérant la tangente au point d'abscisse $x_2$.

En déduire un encadrement plus précis de $alpha$.

=== Situation 2

Soit $f$ la fonction définie pour tout réel $x$ différent de 1 par $f(x) = frac(1 - x^n, 1 - x)$.

1. Montrer que pour tout réel $x$ différent de 1, $f(x) = 1 + x + x^2 + dots.h + x^(n-1)$.

2. Soit $a$ un réel différent de 1, calculer de deux manières différentes le réel $f'(a)$.

3. En déduire la somme $1 + 2a + 3a^2 + dots.h + n a^(n-1)$.


=== Corrigé – Mobiliser ses compétences

// Source: Corrigé T1 p.59-60
==== Situation 1

1) $f(x) = 0$ _pour_ $x approx 1.2$

2) $f$ est continue sur $[1, 2]$

et $f(1) times f(2) = -14 < 0$ d'où $alpha in [1, 2]$

3) a) (T) : la tangente à $(C f)$ au point d'abscisse 1

$f(x) = 2x^3 + x - 4$

Pour tout $a in RR : f'(a) = 6a^2 + 1$

d'où $f'(1) = 7$

- $(T) : y = f'(1)(x - 1) + f(1) = 7(x - 1) - 1$

$(T) : y = 7x - 8$

- Intersection de (T) est la droite $(O x)$

$ M(x, y) in (T) sect (O x) : cases(y = 0, y = 7x - 8) arrow.l.r.double cases(y = 0, x = frac(8, 7)) $

_donc_ $#rect[$ $x_1 = frac(8, 7)$ $]$

- $f$ est continue sur $[1, frac(8, 7)]$

$f(1) = -1$ et $f(frac(8, 7)) = frac(44, 343)$

$f(1) times f(frac(8, 7)) < 0$ d'où $alpha in [1, frac(8, 7)]$

// Source: Corrigé T1 p.60 (colonne droite, suite Situation 1)
b) $(T_1)$ : la tangente à $(C f)$ au point d'abscisse $frac(8, 7)$

$f'(frac(8, 7)) = frac(433, 49)$ et $f(frac(8, 7)) = frac(44, 343)$

- $(T_1) : y = frac(433, 49)(x - frac(7, 8)) + frac(44, 343)$

- Intersection de $(T_1)$ est la droite $(O x)$

$ M(x, y) in (T_1) sect (O x) : cases(y = 0, y = frac(433, 49)(x - frac(7, 8)) + frac(44, 343)) $

$ arrow.l.r.double cases(y = 0, x = frac(3420, 3031)) #h(1cm) "donc" #h(0.3cm) #rect[$ x_2 = frac(3420, 3031) $] $

- $f$ est continue sur $[1, x_2]$

_vérifier (à l'aide d'une calculatrice que :_

$f(1) times f(frac(3420, 3031)) < 0$ d'où $alpha in [1, x_2]$

c) $(T_2)$ : la tangente à $(C f)$ au point d'abscisse $x_2$

coupe (Ox) au point d'abscisse $x_3$

de même procédure on détermine $x_3$

d'où $alpha in [1, x_3]$

// Source: Corrigé T1 p.60 (colonne gauche)
==== Situation 2

$ f(x) = frac(1 - x^10, 1 - x) ; x eq.not 1 $

1) $u_n = x^n, n in NN$

$(u_n)$ est une suite géométrique de raison $q = x eq.not 1$

$"alors :" u_0 + u_1 + ... + u_n = u_0 (frac(1 - q^(n+1), 1 - q))$

ce qui donne : $1 + x + x^8 + ... + x^9 = frac(1 - x^10, 1 - x)$

Ou bien développer et vérifier que :

$(1 - x)(1 + x + x^8 + ... + x^9) = 1 - x^10$

2)

// Source: Corrigé T1 p.60 (colonne droite, Situation 2)
$f(x) = 1 + x + x^2 + ... + x^9$

- $f'(a) = 1 + 2a + 3a^2 + 4a^3 ... + 9a^8$

D'autre part :

$f = frac(g, h)$ _avec_ $g(x) = 1 - x^10$ _et_ $h(x) = 1 - x$

$ bullet f'(a) = frac(g'(a) dot.c h(a) - h'(a) dot.c g(a), [h(a)]^2) $

$ = frac(-10a^9 (1 - a) + (1 - a^10), (1 - a)^2) $

$ = frac(1 + 9a^10 - 10a^9, (1 - a)^2) $

3) on aura donc :

$ 1 + 2a + 3a^2 + 4a^3 ... + 9a^8 = frac(1 + 9a^10 - 10a^9, (1 - a)^2) ; a eq.not 1 $


// Source: Manuel T1 p.95
== Exercices et problèmes


=== Exercice 1

Calculer le nombre dérivé de la fonction $f$ en $a$.

1. $f(x) = 3x + 2$ ; $a = 1$.

2. $f(x) = x^2 - 3x + 1$ ; $a = 2$.

3. $f(x) = frac(x, x + 2)$ ; $a = 0$.


==== Corrigé


1) $f(x) = x^4 - 3x^2 + 5$

Pour tout réel $a$ on a :

$f'(a) = 4a^3 - 6a$ #h(0.5cm) d'où $f'(1) = -2$

2) $f(x) = frac(4, 2x + 3) = 4 times (frac(1, 2x + 3))$

Pour tout réel $a eq.not -frac(3, 2)$ on a :

$f'(a) = 4 times (frac(-2, (2x + 3)^2)) = frac(-8, (2x + 3)^2)$

d'où $f'(-1) = frac(-8, 1) = -8$

// Source: Corrigé T1 p.61
3) $f(x) = frac(3x + 5, -2x + 3)$

Pour tout réel $a eq.not frac(3, 2)$ on a :

$f'(a) = frac(3 times 3 - (-2) times 5, (-2a + 3)^2) = frac(19, (-2a + 3)^2)$

d'où $f'(frac(1, 3)) = frac(1539, 49)$

4) $f(x) = frac(-3, x^2 + 3) = -3(frac(1, x^2 + 3))$

Pour tout réel $a$ on a :

$f'(a) = -3(frac(-2a, (a^2 + 3)^2)) = frac(6a, (a^2 + 3)^2)$

d'où $f'(2) = frac(12, 49)$

5) $f(x) = (2x + 3)^3$

Pour tout réel $a$ on a :

$f'(a) = 3 times 2 times (2a + 3)^2 = 6(2a + 3)^2$

d'où $f'(frac(1, 2)) = 96$

6) $f(x) = sqrt(4x + 5)$

Pour tout réel $a in bracket.r -frac(5, 4), +infinity [$ on a :

$f'(a) = frac(4, 2sqrt(4a + 5)) = frac(2, sqrt(4a + 5))$

d'où $f'(0) = frac(2, sqrt(5)) = frac(2, 5) sqrt(5)$

7) $f(x) = 2x sqrt(x)$

pour $in bracket.r 0, +infinity [$, $f'(a) = 2(sqrt(a) + x dot.c frac(1, 2sqrt(a))) = 3sqrt(a)$

d'où $f'(1) = 3$

// Source: Corrigé T1 p.61 (colonne droite)
8) $f(x) = sqrt(-x^2 + 5x - 4)$

Or on a : $-x^2 + 5x - 4 = 0$

$a + b + c = 0$ donne $x' = 1$ _et_ $x'' = 4$

#align(center)[
  #table(
    columns: 5,
    align: center,
    [$x$], [$-infinity$], [1], [4], [$+infinity$],
    [Signe de $(-x^2 + 5x - 4x^2)$], [$-$], [0], [$+$], [0], [$-$],
  )
]

Pour tout réel $a in bracket.r 1, 4 [$ on a :

$f'(a) = frac(-2a + 5, 2sqrt(-a^2 + 5a - 4))$

d'où $f'(3) = frac(-1, 2sqrt(2)) = -frac(sqrt(2), 4)$


=== Exercice 2

Pour chacune des fonctions ci-dessous, étudier la continuité, la dérivabilité à droite, la dérivabilité à gauche et la dérivabilité en 0.

1. $f(x) = |3x - 1|$.

2. $f(x) = |x^2 - 1|$.

3. $f(x) = cases(x^2 + 1 quad "si" x lt.eq 0, sqrt(1 + x) quad "si" x > 0)$


==== Corrigé


1) $f(x) = |x| sqrt(x)$ et $D f = [0, +infinity [$

_donc_ $f(x) = x sqrt(x)$

a) $f$ est continue à droite en 0 comme étant produit de deux fonctions continues

b)
$ lim_(x arrow.r 0^+) frac(f(x) - f(0), x - 0) = lim_(x arrow.r 0^+) frac(x sqrt(x), x) = lim_(x arrow.r 0^+) sqrt(x) = 0 $

d'où $f$ est dérivable à droite en 0 et $f_d '(0) = 0$

2) $g(x) = |x - 1|$

a) la fonction $h(x) = x - 1$ est continue en 1 d'où

$g = |h|$ est continue en 1

b) - pour $x > 1$ on a : $g(x) = x - 1$

$lim_(x arrow.r 1^+) frac(g(x) - g(1), x - 1) = lim_(x arrow.r 1^+) (frac(x - 1, x - 1)) = 1$

d'où $g$ est dérivable à droite en 1 et $g_d '(1) = 1$

- pour $x < 1$ on a : $g(x) = -(x - 1)$

$lim_(x arrow.r 1^-) frac(g(x) - g(1), x - 1) = lim_(x arrow.r 1^-) (frac(-(x - 1), x - 1)) = -1$

d'où $g$ est dérivable à gauche en 1 et $g_g '(1) = -1$

on aura : $g_g '(0) eq.not g_d '(0)$

_Conclusion $g$ n'est pas dérivable en 1_

// Source: Corrigé T1 p.62

=== Exercice 3

Calculer, dans chaque cas, la limite de $f$ en $a$, en utilisant la notion de nombre dérivé, et déterminer $f'(a)$.

1. $lim_(x arrow 1) frac(x^3 - 1, x - 1)$

2. $lim_(x arrow 0) frac(sqrt(1 + x) - 1, x)$

3. $lim_(x arrow 4) frac(sqrt(x) - 2, x - 4)$


==== Corrigé


a) $f(x) = frac(x^2 - 16, x + 4)$. On pose $g(x) = x^2$

$g$ est dérivable en tout réel $a$ et $g'(a) = 2a$

_ainsi :_ $f(x) = frac(g(x) - g(-4), x - (-4))$

d'où $lim_(x arrow.r (-4)) f(x) = g'(-4) = -8$

b) $f(x) = frac(frac(1, x+5) - 1, x + 4)$. On pose $g(x) = frac(1, x + 5)$

$g$ est dérivable en tout réel $a eq.not -5$

_et_ $g'(a) = frac(-1, (a + 5)^2)$

donc $g$ est dérivable en $(-4)$ et $g'(-4) = -1$

_ainsi :_ $f(x) = frac(g(x) - g(-4), x - (-4))$

d'où $lim_(x arrow.r (-4)) f(x) = g'(-4) = -1$

c) $f(x) = frac(sqrt(x) - 1, x - 1)$. On pose $g(x) = sqrt(x)$

$g$ est dérivable en tout réel $a in bracket.r 0, +infinity [$

_et_ $g'(a) = frac(1, 2sqrt(a)) arrow.double g'(1) = frac(1, 2)$

_ainsi :_ $f(x) = frac(g(x) - g(1), x - 1)$

d'où $lim_(x arrow.r 1) f(x) = g'(1) = frac(1, 2)$

d) $f(x) = frac((x + 1)^2006 - 1, x)$. On pose $g(x) = (x + 1)^2006$

$g$ est dérivable en tout réel $a$

et $g'(a) = 2006 times (a + 1)^2005 arrow.double g'(0) = 2006$

_ainsi :_ $f(x) = frac(g(x) - g(0), x - 0)$

d'où $lim_(x arrow.r 0) f(x) = g'(0) = 2006$

// Source: Corrigé T1 p.62 (colonne droite)

=== Exercice 4

Le plan est muni d'un repère $(O, arrow(i), arrow(j))$.

Soit $f$ la fonction définie par $f(x) = x^3 + 4x - 7$.

1. Déterminer le nombre dérivé de $f$ en 1.

2. On désigne par $C$ la courbe représentative de $f$ et par $T$ la tangente à $C$ au point d'abscisse 1.

#h(0.5cm) a. Déterminer une équation de $T$.

#h(0.5cm) b. Tracer $T$ et $C$.


==== Corrigé


$f(x) = x^2 + 4x - 7$

1) $f$ est dérivable en tout réel $a$

_et_ $f'(a) = 2a + 4 arrow.double f'(1) = 6$

2) a)

- $(T) : y = f'(1)(x - 1) + f(1) = 6(x - 1) - 2$

$(T) : y = 6x - 8$

b) $(C f)$ est une parabole de sommet $S(-2, -11)$ et d'axe symetrie la droite d'équation $x = -2$

Utiliser un #underline[tableau des valeurs] pour tracer $(C f)$

(cours 2ème années)

// Figure: Exercice 4 - Parabole et tangente
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    import cetz.plot
    plot.plot(
      size: (8, 8),
      x-tick-step: 1,
      y-tick-step: 1,
      x-min: -6, x-max: 3,
      y-min: -12, y-max: 1,
      axis-style: "school-book",
      {
        // Parabole f(x) = x^2 + 4x - 7
        plot.add(domain: (-5.5, 2.5), x => calc.pow(x, 2) + 4*x - 7, label: $C_f$)
        // Tangente T: y = 6x - 8
        plot.add(domain: (-1, 3), x => 6*x - 8, style: (stroke: (dash: "dashed")), label: $T$)
      }
    )
  })
]

// Source: Corrigé T1 p.62 (bas droite)

=== Exercice 5

Le plan est muni d'un repère $(O, arrow(i), arrow(j))$.

Soit $f$ la fonction $f$ définie sur $]-4, +infinity[$ par $f(x) = sqrt(x + 4)$.

1. La tangente à la courbe $C$ au point d'abscisse $-3$.

2. On désigne par $C$ la courbe représentative de $f$ et par $T$ la tangente $T$ au point d'abscisse $-3$.

#h(0.5cm) a. Déterminer une équation de $T$.

#h(0.5cm) b. Tracer $T$ et $C$.


==== Corrigé


$f(x) = sqrt(x + 4)$

1) Pour tout réel $a in bracket.r -4, +infinity [$ on a :

$f'(a) = frac(1, 2sqrt(a + 4))$ #h(0.5cm) d'où $f'(0) = frac(1, 4)$

2) a) $T : y = f'(0)(x - 0) + f(0)$

$T : y = frac(1, 4) x + 2$

b) traçage de la courbe de $f$ et tangente T :

// Source: Corrigé T1 p.63 (haut, figure Exercice 5)
// Figure: Exercice 5 - Courbe sqrt(x+4) et tangente
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    import cetz.plot
    plot.plot(
      size: (8, 6),
      x-tick-step: 1,
      y-tick-step: 1,
      x-min: -6, x-max: 7,
      y-min: -1, y-max: 4,
      axis-style: "school-book",
      {
        // f(x) = sqrt(x + 4)
        plot.add(domain: (-4, 6), x => calc.sqrt(x + 4), label: $C_f$)
        // Tangente T: y = x/4 + 2
        plot.add(domain: (-6, 6), x => x/4 + 2, style: (stroke: (dash: "dashed")), label: $T$)
      }
    )
  })
]

// Source: Corrigé T1 p.63

=== Exercice 6

Le plan est muni d'un repère $(O, arrow(i), arrow(j))$.

Soit $f$ la fonction définie sur $[-1, +infinity[$ par

$ f(x) = cases(x^2 + x quad "si" x in [-1, 0], x sqrt(x) quad "si" x > 0) $

1. Montrer que pour tout $x in [-1, +infinity[$, $f(x) gt.eq 0$.

2. Déterminer le nombre dérivé de $f$ en 3.

3. On désigne par $C$ la courbe représentative de $f$ et par $T$ la tangente à $C$ au point d'abscisse 3.

#h(0.5cm) a. Déterminer une équation de $T$.

#h(0.5cm) b. Tracer $T$ et $C$.


==== Corrigé


$f(x) = frac(3x + 1, x - 1)$ ; $x in bracket.r 1, +infinity [$

1) $3 + frac(4, x - 1) = frac(3(x - 1) + 4, x - 1) = frac(3x + 1, x - 1) = f(x)$

2) $f$ est dérivable en tout réel $a in bracket.r 1, +infinity [$

_et_ $f'(a) = 4 dot.c (frac(-1, (a - 1)^2)) = frac(-4, (a - 1)^2) arrow.double f'(3) = -1$

3) a) $T : y = f'(3)(x - 3) + f(3)$

$T : y = -x + 8$

b) traçage de la courbe de $f$ et tangente T :

// Figure: Exercice 6 - Hyperbole et tangente
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    import cetz.plot
    plot.plot(
      size: (10, 7),
      x-tick-step: 1,
      y-tick-step: 1,
      x-min: -2, x-max: 12,
      y-min: -2, y-max: 10,
      axis-style: "school-book",
      {
        // f(x) = (3x+1)/(x-1), pour x > 1
        plot.add(domain: (1.2, 11), x => (3*x + 1)/(x - 1), label: $C_f$)
        // Tangente T: y = -x + 8
        plot.add(domain: (0, 11), x => -x + 8, style: (stroke: (dash: "dashed")), label: $T$)
      }
    )
    // Asymptotes
    import cetz.draw: *
    // asymptote y = 3
    line((0, 5), (10, 5), stroke: (dash: "dotted"), name: "asy-h")
    content("asy-h.start", [$"asymptote" : y = 3$], anchor: "east", padding: 0.1)
    // asymptote x = 1
    line((2.5, -1), (2.5, 9), stroke: (dash: "dotted"), name: "asy-v")
    content("asy-v.end", [$"asymptote" : x = 1$], anchor: "north", padding: 0.1)
  })
]

// Source: Corrigé T1 p.63 (colonne droite)

=== Exercice 7

Le plan est muni d'un repère $(O, arrow(i), arrow(j))$.

Soit $f$ la fonction définie sur $RR$ par $f(x) = a x^3 + b x + c$ et soit la droite $D$ d'équation $y = -x + 2$, la tangente $T$ à la courbe représentative de $f$ au point $A(1, f(1))$.

1. Déterminer les réels $a$, $b$ et $c$.

2. Représenter la fonction $f$ ainsi que la tangente $T$.


==== Corrigé


1)

- $A(-1, -8) in (C f) arrow.double f(-1) = -8$

$arrow.double a - b + c = -8$ (1)

- $f'(1)$ : le coefficient directeur de la tangente T

d'où $f'(1) = 1$

Or pour tout $x_0 in RR$ on a : $f'(x_0) = 2a x_0 + b$

$arrow.double f'(1) = 2a + b = 1$ (2)

- T passe par le point $B(1, f(1))$

et T à pour équation : $y = x - 3$

$arrow.double f(1) = -2$ (_pour_ $x = 1$ _on a_ $y = -2$)

$arrow.double a + b + c = -2$ (3)

On aura donc le système suivant :

$ cases(
  a - b + c = -8,
  2a + b = 1,
  a + b + c = -2
) arrow.l.r.double cases(
  a - (1 - 2a) + c = -8,
  b = 1 - 2a,
  a + (1 - 2a) + c = -2
) $

$ arrow.l.r.double cases(
  b = 1 - 2a,
  3a + c = -7,
  -a + c = -3
) arrow.l.r.double cases(
  a = -1,
  b = 3,
  c = -4
) $

d'où $#rect[$ f(x) = -x^2 + 3x - 4 $]$

2) $(C f)$ est une parabole de sommet $S(frac(3, 2), -frac(7, 4))$ et d'axe la

droite d'équation $x = frac(3, 2)$

// Figure: Exercice 7 - Parabole avec tangente
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    import cetz.plot
    plot.plot(
      size: (8, 7),
      x-tick-step: 1,
      y-tick-step: 1,
      x-min: -3, x-max: 7,
      y-min: -8, y-max: 2,
      axis-style: "school-book",
      {
        // f(x) = -x^2 + 3x - 4
        plot.add(domain: (-2, 6), x => -calc.pow(x, 2) + 3*x - 4, label: $cal(C)$)
        // Tangente T: y = x - 3
        plot.add(domain: (-1, 6), x => x - 3, style: (stroke: (dash: "dashed")), label: $T$)
      }
    )
  })
]

// Source: Corrigé T1 p.64

=== Exercice 8

Le plan est muni d'un repère orthogonal $(O, arrow(i), arrow(j))$.

On désigne par $P$ et $P'$ les paraboles d'équation respective $y = x^2$ et $y = -frac(1, 4) x^2 + frac(3, 4)$.

// Source: Manuel T1 p.96

1. Déterminer les coordonnées des points d'intersection de $P$ et de $P'$, on notera $A$ le point d'abscisse négative et $B$ le point d'abscisse positive.

2. Soit $T$ et $T'$ les tangentes respectives à $P$ et $P'$ au point $B$.

#h(0.5cm) a. Déterminer une équation de chacune des droites $T$ et $T'$.

3. En déduire que les droites $T$ et $T'$ sont perpendiculaires pour le point $B$.

4. En déduire que les droites $T$ et $T'$ le sont également pour le point $A$.


==== Corrigé


$P : y = x^2$

$P' : y = -frac(1, 3) x^2 + 1$

1) $M(x, y) in P sect P' arrow.l.r.double cases(y = x^2, y = -frac(1, 3) x^2 + 1)$

$ arrow.l.r.double cases(y = x^2, x^2 = -frac(1, 3) x^2 + 1) arrow.l.r.double cases(y = x^2, x^2 = frac(3, 4)) $

$ arrow.l.r.double cases(x = frac(sqrt(3), 2), y = frac(3, 4)) #h(1cm) "ou" #h(1cm) cases(x = -frac(sqrt(3), 2), y = frac(3, 4)) $

_par suite_ $P sect P' = {A(-frac(sqrt(3), 2), frac(3, 4)) ; B(frac(sqrt(3), 2), frac(3, 4))}$

2) a) $f(x) = x^2 arrow.double f'(a) = 2a$ ; $a in RR$

$g(x) = -frac(1, 3) x^2 + 1 arrow.double g'(a) = -frac(2, 3) a$ ; $a in RR$

alors on a : $f'(-frac(sqrt(3), 2)) = 2 times (-frac(sqrt(3), 2)) = -sqrt(3)$

$g'(-frac(sqrt(3), 2)) = (-frac(2, 3)) times (-frac(sqrt(3), 2)) = frac(sqrt(3), 3)$

- $T : y = f'(-frac(sqrt(3), 2))(x + frac(sqrt(3), 2)) + f(-frac(sqrt(3), 2))$

$y = -sqrt(3)(x + frac(sqrt(3), 2)) + frac(3, 4) = -sqrt(3) x - frac(3, 2) + frac(3, 4)$

$T : y = -sqrt(3) x - frac(3, 4)$

- $T' : y = g'(-frac(sqrt(3), 2))(x + frac(sqrt(3), 2)) + g(-frac(sqrt(3), 2))$

$y = frac(sqrt(3), 3)(x + frac(sqrt(3), 2)) + frac(3, 4)$

$T' : y = frac(sqrt(3), 3) x + frac(5, 4)$

// Source: Corrigé T1 p.64 (colonne droite)

b) $arrow(u) vec(1, -sqrt(3))$ vecteur directeur de $T$

$arrow(u') vec(1, frac(sqrt(3), 3))$ vecteur directeur de $T'$

on a : $arrow(u) dot.c arrow(u') = 1 times 1 + (-sqrt(3)) times frac(sqrt(3), 3) = 1 - 1 = 0$

d'où $arrow(u) bot arrow(u')$ par suite $T bot T'$

3) a)

- $D : y = f'(frac(sqrt(3), 2))(x - frac(sqrt(3), 2)) + frac(3, 4) arrow.double D : y = sqrt(3) x - frac(3, 4)$

$D' : y = g'(frac(sqrt(3), 2))(x - frac(sqrt(3), 2)) + frac(3, 4) arrow.double D' : y = -frac(sqrt(3), 3) x + frac(5, 4)$

b) $m = sqrt(3)$ : coefficient directeur de D

$m = -frac(sqrt(3), 3)$ : coefficient directeur de D'

On a : $m times m' = sqrt(3) times (-frac(sqrt(3), 3)) = -1$ d'où $D bot D'$

4) graphe :

// Figure: Exercice 8 - Deux paraboles avec tangentes
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    import cetz.plot
    plot.plot(
      size: (10, 8),
      x-tick-step: 1,
      y-tick-step: 1,
      x-min: -6, x-max: 6,
      y-min: -5, y-max: 7,
      axis-style: "school-book",
      {
        // P: y = x^2
        plot.add(domain: (-2.5, 2.5), x => calc.pow(x, 2), label: $P$)
        // P': y = -x^2/3 + 1
        plot.add(domain: (-3, 3), x => -calc.pow(x, 2)/3 + 1, label: $P'$)
        // T: y = -sqrt(3)x - 3/4
        plot.add(domain: (-5, 2), x => -1.732*x - 0.75, style: (stroke: (dash: "dashed")), label: $T$)
        // T': y = sqrt(3)/3 x + 5/4
        plot.add(domain: (-5, 5), x => 0.577*x + 1.25, style: (stroke: (dash: "dashed")), label: $T'$)
        // D: y = sqrt(3)x - 3/4
        plot.add(domain: (-2, 5), x => 1.732*x - 0.75, style: (stroke: (dash: "dashed")), label: $D$)
        // D': y = -sqrt(3)/3 x + 5/4
        plot.add(domain: (-5, 5), x => -0.577*x + 1.25, style: (stroke: (dash: "dashed")), label: $D'$)
      }
    )
  })
]

// Source: Corrigé T1 p.65

=== Exercice 9

Dans le plan muni d'un repère orthogonal, on désigne par $C$ et $C'$ les courbes représentatives des fonctions $f$ et $g$ définies sur $RR$ par $f(x) = x^3 + 2x^2 - 2$ et $g(x) = x^3 + 2x^2 - x$.

1. Vérifier que $f$ et $g$ sont dérivables sur $RR$.

2. Calculer le nombre dérivé de $f$ en 1 et de $g$ en tout réel $a$.

3. Soit $a$ un réel. Montrer que les tangentes respectives à $C$ et $C'$ au point d'abscisse $a$ sont parallèles.


==== Corrigé


1) $f(x) = x^3 + 3x^2 - 2$ ; $g(x) = x^3 + 3x^2 + 1$

$f$ et $g$ sont deux fonctions polynômes donc elles sont dérivables en tout réel $a$

2) $f'(a) = g'(a) = 3a^2 + 6a$

3) les tangentes respectives à C et C' au point d'abscisse $a$ ont le même coefficient directeur puisque $f'(a) = g'(a)$

pour tout réel $a$ elles donc sont parallèles.


=== Exercice 10

Le plan est muni d'un repère orthogonal $(O, arrow(i), arrow(j))$, on désigne par $C$ la courbe représentative de la fonction $f$ définie sur $RR$ par $f(x) = cases(x^2 quad "si" x gt.eq 0, -x^3 quad "si" x < 0)$

1. $f$ est-elle continue en 0 ?

2. Calculer le nombre dérivé de $f$ en tout réel $a$.

3. En déduire, lorsqu'elles existent :

#h(0.5cm) a. les tangentes à $C$ qui sont parallèles à $l'$axe $(O x)$.

#h(0.5cm) b. les tangentes à $C$ qui sont parallèles à la première bissectrice d'équation $y = x$.

#h(0.5cm) c. les tangentes à $C$ qui sont parallèles à la deuxième bissectrice d'équation $y = -x$.


==== Corrigé


$f(x) = frac(5, 2x^2 + 3)$

1) $2x^2 + 3 eq.not 0$; pour tout réel $x$, $f$ est une fonction rationnelle définie sur tout $RR$ donc elle est dérivable en tout réel $a$

2) $f$ est dérivable en tout réel $a$

_et_ $f'(a) = 5 dot.c (frac(-4a, (2a^2 + 3)^2)) = frac(-20a, (2a^2 + 3)^2)$

3) a) $f'(a) = 0 arrow.l.r.double a = 0$

la tangente à C au point d'abscisse 0 est parallèle à l'axe $(O, arrow(i))$

b) $f$ est dérivable sur $RR$ d'où C n'admet pas de tangente parallèle à l'axe $(O, arrow(j))$

// Source: Corrigé T1 p.65 (colonne droite)
c) la droite D d'équation $y = x$ à pour coefficient directeur $m = 1$. la tangente à C est parallèle à D si et seulement si :

$f'(a) = 1 arrow.l.r.double frac(-20a, (2a^2 + 3)^2) = 1 arrow.l.r.double (2a^2 + 3)^2 = -20a$

$arrow.l.r.double 4a^4 + 12a^2 + 20a + 9 = 0$

_On considère le polynôme :_ $P(x) = 12x^2 + 20x + 9$

$a = 12; b = 20; c = 9$

$Delta = b^2 - 4a c = 20^2 - 36 times 12 = -32 < 0$ _et_ $a = 12 > 0$

d'où $P(x)$ est strictement positif sur $RR$

_par suite :_ $4a^4 + 12a^2 + 20a + 9 > 0$

ce qui prouve que : $4a^4 + 12a^2 + 20a + 9 = 0$
#align(center)[$underbrace(#h(4cm), > 0)$]

n'a pas des solutions dans $RR$

*Conclusion :* C n'admet pas des tangentes parallèles à la droite $D : y = x$

c) la droite D d'équation $y = -x$ à pour coefficient directeur $m = -1$. la tangente à C est parallèle à D si et seulement si :

$f'(a) = -1 arrow.l.r.double frac(-20a, (2a^2 + 3)^2) = -1 arrow.l.r.double (2a^2 + 3)^2 = 20a$

$arrow.l.r.double 4a^4 + 12a^2 - 20a + 9 = 0$

_On considère le polynôme :_ $P(x) = 12x^2 - 20x + 9$

$a = 12; b = -20; c = 9$

$Delta = b^2 - 4a c = 20^2 - 36 times 12 = -32 < 0$ _et_ $a = 12 > 0$

d'où $P(x)$ est strictement positif sur $RR$

_par suite :_ $4a^4 + 12a^2 - 20a + 9 > 0$

ce qui prouve que : $4a^4 + 12a^2 - 20a + 9 = 0$
#align(center)[$underbrace(#h(4cm), > 0)$]

n'a pas des solutions dans $RR$

*Conclusion :* C n'admet pas des tangentes parallèles à la droite $D : y = -x$

// Source: Corrigé T1 p.66

=== Exercice 11

Le plan muni d'un repère orthogonal $(O, arrow(i), arrow(j))$, on désigne par $C$ la courbe représentative de la fonction $f$ définie sur $RR$ par $f(x) = x^3$.

1. Vérifier que $f$ est dérivable sur $RR$.

2. Calculer le nombre dérivé de $f$ en tout réel $a$.

3. Soit $A$ et $B$ les points de $C$ d'abscisses respectives $a$ et $-a$.

#h(0.5cm) a. Déterminer les coefficients directeurs de la droite $(A B)$.

#h(0.5cm) b. Déterminer les points de $C$ lorsque la tangente est parallèle à la droite $(A B)$.


==== Corrigé


$f(x) = x^3$

1) $f$ est une fonction polynôme donc elle est dérivable en tout réel $a$ c'est-à-dire sur tout $RR$

2) $f'(a) = 3a^2$ ; $a in RR$

3)

- $A(-1, f(-1)) in (C f) arrow.double A(-1, -1)$
- $B(2, f(2)) in (C f) arrow.double B(2, 8)$

a) la droite _(AB)_ à pour coefficient directeur

$m = frac(y_B - y_A, x_B - x_A) = frac(8 - (-1), 2 - (-1)) = 3$

b) $f'(a) = 3 arrow.l.r.double 3a^2 = 3 arrow.l.r.double a^2 = 1$

$arrow.l.r.double a = 1$ ou $a = -1$

Les tangentes à la courbe C respectivement aux points d'abscisses $(-1)$ et 1 sont parallèles à la droite _(AB)_

*(en particulier la tangente en $a$ est la droite (AB))*


=== Exercice 12

Le plan muni d'un repère orthogonal $(O, arrow(i), arrow(j))$, on désigne par $C$ la courbe représentative de la fonction $f$ définie sur $RR$ par $f(x) = x^3 - 3x^2$.

Montrer que les tangentes à $C$ aux points d'abscisses 0 et 2 sont parallèles.


==== Corrigé


$f(x) = x^5 - 3x^3$

1) $D f = RR$

- pour $x in D f = RR$ on a : $(-x) in D f$
- $f(-x) = (-x)^5 - 3(-x)^3 = -x^5 + 3x^3$
$= -(x^5 - 3x^3) = -f(x)$

Donc $f$ est impaire

2) a) $f$ est une fonction polynôme donc elle est dérivable sur $RR$

b) $f'(a) = 5a^4 - 9a^2$ ; $a in RR$

// Source: Corrigé T1 p.66 (colonne droite)

3)

- le coefficient directeur de la tangente à la courbe C au point d'abscisse $a$ est $f'(a) = 5a^4 - 9a^2$

- $f'(-a) = 5(-a)^4 - 9(-a)^2 = 5a^4 - 9a^2 = f'(a)$ Donc La tangente à la courbe C au point d'abscisse $(-a)$ est parallèle à celle au point d'abscisse $a$ car elles ont le même coefficient directeur.


=== Exercice 13

Le plan muni d'un repère orthogonal $(O, arrow(i), arrow(j))$, on désigne par $C$ et $C'$ les courbes représentatives des fonctions $f$ et $g$ définies sur $RR$ par $f(x) = 2x^2 - 1$ et $g(x) = -x^2 + 2$.

1. Montrer que les courbes $C$ et $C'$ admettent au point $A$ une même tangente $T$, où $A$ est un point que l'on déterminera.

2. Montrer que $C$ et $C'$ se situent de part et d'autre de $T$ que l'on appelle tangente commune à $C$ et $C'$.


==== Corrigé


$f(x) = x^2 + 2x - 1$

$g(x) = -x^2 - 6x - 9$

1) $M(x, y) in C sect C' arrow.l.r.double cases(y = f(x), y = g(x))$

$f(x) = g(x) arrow.l.r.double x^2 + 2x - 1 = -x^2 - 6x - 9$

$arrow.l.r.double 2x^2 + 8x + 8 = 0 arrow.l.r.double x^2 + 4x + 4 = 0$

$arrow.l.r.double (x + 2)^2 = 0 arrow.l.r.double x + 2 = 0 arrow.l.r.double x = -2$

_et on a :_ $f(-2) = g(-2) = -1$

Conclusion : $C sect C' = {A(-2, -1)}$

2) _pour tout réel $a$_

$f'(a) = 2a + 2$ _et_ $g'(a) = -2a - 6$

_ainsi :_ $cases(f'(-2) = g'(-2) = -2, f(-2) = g(-2) = -1)$

Donc C et C' ont la même tangente (T) en $A$ ;

$T : y = f'(-2)(x - (-2)) + f(-2)$

$= -2(x + 2) - 1$

_donc_ $#rect[$ T : y = -2x - 5 $]$

3) a) $f(x) - (-2x - 5) = x^2 + 2x - 1 + 2x + 5$

$= x^2 + 4x + 4 = (x + 2)^2 gt.eq 0$

d'où $f(x) - (-2x - 5) gt.eq 0$

ainsi la courbe C de $f$ est au dessus de la tangente T

// Source: Corrigé T1 p.67 (colonne gauche, suite Exercice 13)

b) $g(x) - (-2x - 5) = -x^2 - 6x - 9 + 2x + 5$

$= -x^2 - 4x - 4 = -(x^2 + 4x + 4)$

$= -(x + 2)^2 lt.eq 0$

d'où $g(x) - (-2x - 5) lt.eq 0$

ainsi la courbe C' de $g$ est au dessous de la tangente T

4) graphe

// Figure: Exercice 13 - Deux paraboles avec tangente commune
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    import cetz.plot
    plot.plot(
      size: (10, 8),
      x-tick-step: 1,
      y-tick-step: 1,
      x-min: -8, x-max: 5,
      y-min: -10, y-max: 8,
      axis-style: "school-book",
      {
        // f(x) = x^2 + 2x - 1
        plot.add(domain: (-6, 3), x => calc.pow(x, 2) + 2*x - 1, label: $C_f$)
        // g(x) = -x^2 - 6x - 9
        plot.add(domain: (-7, 1), x => -calc.pow(x, 2) - 6*x - 9, label: $C_g$)
        // T: y = -2x - 5
        plot.add(domain: (-6, 3), x => -2*x - 5, style: (stroke: (dash: "dashed")), label: $T$)
      }
    )
  })
]

// Source: Corrigé T1 p.67 (colonne droite)

=== Exercice 14

Soit $f$ la fonction définie sur $RR$ par $f(x) = -x^3 + 4x - 5$.

1. Déterminer le nombre dérivé de $f$ en 1.

2. Comparer les résultats obtenus avec ceux affichés par la calculatrice.


==== Corrigé


$f(x) = -x^4 + 4x - 5$

1) $f$ est une fonction polynôme donc elle est dérivable

en tout réel $a$ et $f'(a) = -4a^3 + 4 arrow.double f'(1) = 0$

2)

- $h_1 = 0.0001$ et assez petit

$f(1, 0001) = f(1 + 0, 0001)$

$approx f(1) + 0, 0001 times f'(1) = -2$

- $h_2 = 0, 000001$ et assez petit

$f(0, 999999) = f(1 - 0, 000001)$

$approx f(1) - 0, 000001 times f'(1) = -2$

3) la calculatrice affiche :

$f(1.0001) = -2.00000006$

$f(0.999999) = -2$


=== Exercice 15

Soit $f$ la fonction définie sur $RR$ par $f(x) = frac(5, sqrt(x + 4))$.

1. Déterminer le nombre dérivé de $f$ en 1.

2. Estimer $f(0,998)$, $f(1,0002)$, $f(25,00002)$.

3. Comparer les résultats obtenus avec ceux affichés par la calculatrice.


==== Corrigé


$f(x) = sqrt(2x + 5)$ ; $D f = [-frac(5, 2), +infinity [$

1) Pour tout réel $a in bracket.r -frac(5, 2), +infinity [$ on a :

$f'(a) = frac(2, 2sqrt(2a + 5)) = frac(1, sqrt(2a + 5))$ #h(0.5cm) d'où $f'(10) = frac(1, 5)$

2)

$circled(+) sqrt(25,0002) = f(10, 0001) = f(10 + 0.0001)$

$approx f(10) + (0, 0001) times f'(10)$

$= f(10) + frac(0, 0001, 5) = 5 + frac(0, 0001, 5) = 5 + 0, 00002$

d'où $sqrt(25,0002) approx 5, 00002$

$circled(+) sqrt(25, 000002) = f(10, 000001) = f(10 + 0.000001)$

$approx f(10) + (0, 000001) times f'(10)$

$= f(10) + frac(0, 000001, 5) = 5 + frac(0, 000001, 5) = 5 + 0, 0000002$

d'où $sqrt(25,000002) approx 5, 0000002$

3) la calculatrice affiche :

$sqrt(25, 0002) = 5, 00002$

$sqrt(25, 000002) = 5, 0000002$

// Source: Corrigé T1 p.67 (colonne droite, bas)

=== Exercice 16

On considère la fonction $f$ définie par

$ f(x) = cases(sqrt(x) quad "si" x gt.eq 0, x sqrt(-x) quad "si" x < 0) $

1. Étudier la dérivabilité de $f$ à droite et à gauche en 0.

2. La fonction $f$ est-elle dérivable en 0 ?

// Source: Manuel T1 p.97

==== Corrigé


$ f(x) = cases(x sqrt(x) #h(0.5cm) "si" x gt.eq 0, x^3 #h(0.5cm) "si" x < 0) $

1) $f(0) = 0 sqrt(0) = 0$

- $lim_(x arrow.r 0^+) f(x) = lim_(x arrow.r 0^+) (x sqrt(x)) = 0$

- $lim_(x arrow.r 0^-) f(x) = lim_(x arrow.r 0^-) (x^3) = 0$

$} arrow.double lim_(x arrow.r 0^+) f = lim_(x arrow.r 0^-) f = 0$

D'où $lim_(x arrow.r 0) f(x) = 0 = f(0)$

Ce qui prouve que $f$ est continue en 0

// Source: Corrigé T1 p.68
2)

- $lim_(x arrow.r 0^-) frac(f(x) - f(0), x - 0) = lim_(x arrow.r 0^-) frac(x^3, x)$

$= lim_(x arrow.r 0^-) x^2 = 0 = f_g '(0)$

- $lim_(x arrow.r 0^+) frac(f(x) - f(0), x - 0) = lim_(x arrow.r 0^+) frac(x sqrt(x), x)$

$= lim_(x arrow.r 0^+) sqrt(x) = 0 = f_d '(0)$

Donc $f$ est dérivable à droite et à gauche en 0

3) $f_g '(0) = f_d '(0) = 0 arrow.l.r.double f$ est dérivable en 0

et $f'(0) = 0$

// Source: Corrigé T1 p.68

=== Exercice 17

Le plan est muni d'un repère orthogonal $(O, arrow(i), arrow(j))$.

On désigne par $C$ la courbe représentative de la fonction $f$ définie sur $RR$ par

$ f(x) = cases(frac(x, sqrt(1 - x)) quad "si" x < 0, x sqrt(x + 1) quad "si" x gt.eq 0) $

Tracer la représentation graphique d'une fonction $f$ qui a les caractéristiques suivantes :

- $f$ est définie et continue sur $[-1, 1]$.

- la courbe de $f$ admet en 1 une tangente d'équation $y = 3$

- la courbe de $f$ admet en $-1$ une demi-tangente verticale.

- l'équation $f(x) = 0$ admet $-1$ et 3 pour solutions.

- $f$ admet un minimum $-2$.

- $f$ est positive sur $[2, 3]$.


==== Corrigé


$f(x) = |x^2 - 4|$ ; $D f = RR$

$f(x) = |g(x)|$ #h(0.5cm) _avec_ #h(0.5cm) $g(x) = x^2 - 4$

Comme étant une fonction polynôme $g$ est continue sur $RR$ par suite $f = |g|$ est continue sur $RR$.

2) a)

#align(center)[
  #table(
    columns: 5,
    align: center,
    [$x$], [$-infinity$], [$-2$], [$2$], [$+infinity$],
    [Signe de $(x^2 - 4)$], [$+$], [0], [$-$], [0], [$+$],
  )
]

- Pour $x in bracket.r -infinity, -2 [$ on a : $f(x) = x^2 - 4$

$lim_(x arrow.r (-2)^-) frac(f(x) - f(-2), x + 2) = lim_(x arrow.r (-2)^-) (frac(x^2 - 4, x + 2))$

$= lim_(x arrow.r (-2)^-) [frac((x - 2)(x + 2), (x + 2))] = lim_(x arrow.r (-2)^-) (x - 2) = -4$

d'où $f$ est dérivable à gauche de $(-2)$ et $#rect[$f_g '(-2) = -4$]$

- Pour $x in bracket.r -2, 2 [$ on a : $f(x) = -(x^2 - 4)$

$lim_(x arrow.r (-2)^+) frac(f(x) - f(-2), x + 2) = lim_(x arrow.r (-2)^+) (frac(-(x - 2)(x + 2), x + 2))$

$= lim_(x arrow.r (-2)^+) [-(x - 2)] = 4$

d'où $f$ est dérivable à droite de $(-2)$ et $#rect[$f_d '(-2) = 4$]$

b) $f_g '(-2) eq.not f_d '(-2)$ d'ou $f$ n'est pas dérivable en $(-2)$

c) - $(T_1)$ : la demi-tangente à $(C f)$ à gauche au point d'abscisse $(-2)$

$(T_1) : cases(y = f_g '(-2)(x + 2) + f(-2), x lt.eq -2) arrow.l.r.double cases(y = -4x - 8, x lt.eq -2)$

- $(T_2)$ : la demi-tangente à $(C f)$ à droite au point d'abscisse $(-2)$

$(T_2) : cases(y = f_d '(-2)(x + 2) + f(-2), x gt.eq -2) arrow.l.r.double cases(y = 4x + 8, x gt.eq -2)$

// Source: Corrigé T1 p.68 (colonne droite)

3) a)

- Pour $x in bracket.r 2, +infinity [$ on a : $f(x) = x^2 - 4$

$lim_(x arrow.r 2^+) frac(f(x) - f(2), x - 2) = lim_(x arrow.r 2^+) (frac(x^2 - 4, x - 2))$

$lim_(x arrow.r 2^+) frac(f(x) - f(2), x - 2) = lim_(x arrow.r 2^+) [frac((x - 2)(x + 2), (x - 2))]$

$= lim_(x arrow.r 2^+) (x + 2) = 4$

d'où $f$ est dérivable à droite de 2 et $#rect[$f_d '(2) = 4$]$

- Pour $x in bracket.r -2, -1 [$ on a : $f(x) = -(x^2 - 4)$

$lim_(x arrow.r 2^-) frac(f(x) - f(2), x - 2) = lim_(x arrow.r 2^-) (frac(-(x - 2)(x + 2), (x - 2)))$

$= lim_(x arrow.r 2^-) [-(x + 2)] = -4$

d'où $f$ est dérivable à gauche de 2 et $#rect[$f_g '(2) = -4$]$

b) $f_g '(2) eq.not f_d '(2) arrow.l.r.double f$ n'est pas dérivable en 2

c) - $(T_3)$ : la demi-tangente à $(C f)$ à droite au point d'abscisse 2

$(T_3) : cases(y = f_d '(2)(x - 2) + f(2), x gt.eq 2) arrow.l.r.double cases(y = 4x - 8, x gt.eq 2)$

- $(T_4)$ : la demi-tangente à $(C f)$ à gauche au point d'abscisse 2

$(T_4) : cases(y = f_g '(2)(x - 2) + f(2), x lt.eq 2) arrow.l.r.double cases(y = -4x + 8, x lt.eq 2)$

// Source: Corrigé T1 p.69 (haut gauche, graphe Exercice 17)
4) graphe :

// Figure: Exercice 17 - |x^2 - 4| avec demi-tangentes
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    import cetz.plot
    plot.plot(
      size: (10, 7),
      x-tick-step: 1,
      y-tick-step: 1,
      x-min: -4, x-max: 4,
      y-min: -1, y-max: 6,
      axis-style: "school-book",
      {
        // f(x) = |x^2 - 4|
        plot.add(domain: (-4, -2), x => calc.pow(x, 2) - 4, label: $C_f$)
        plot.add(domain: (-2, 2), x => -(calc.pow(x, 2) - 4))
        plot.add(domain: (2, 4), x => calc.pow(x, 2) - 4)
        // T1: y = -4x - 8, x <= -2
        plot.add(domain: (-4, -2), x => -4*x - 8, style: (stroke: (dash: "dashed")), label: $T_1$)
        // T2: y = 4x + 8, x >= -2
        plot.add(domain: (-2, -0.5), x => 4*x + 8, style: (stroke: (dash: "dashed")), label: $T_2$)
        // T3: y = 4x - 8, x >= 2
        plot.add(domain: (2, 4), x => 4*x - 8, style: (stroke: (dash: "dashed")), label: $T_3$)
        // T4: y = -4x + 8, x <= 2
        plot.add(domain: (0.5, 2), x => -4*x + 8, style: (stroke: (dash: "dashed")), label: $T_4$)
      }
    )
  })
]

// Source: Corrigé T1 p.69

=== Exercice 18

Le plan est muni d'un repère orthogonal $(O, arrow(i), arrow(j))$, on désigne par $C$ la courbe représentative de la fonction $f$ définie sur $[-1, +infinity[$ par

$ f(x) = cases(sqrt(x + 1) quad "si" x > 3, frac(1, 4) x + frac(1, 2) quad "si" -1 lt.eq x lt.eq 3) $

1. La fonction $f$ est-elle continue en 3 ?

2. Étudier la dérivabilité de $f$ à gauche en 3.

3. Déterminer une équation de la demi-tangente à $C$ à droite en 3.

4. En déduire que $C$ admet une demi-tangente verticale au point d'abscisse 3.


==== Corrigé


$ f(x) = cases(sqrt(2x - 6) #h(0.5cm) "si" x gt.eq 3, x^2 - 3x #h(0.5cm) "si" x < 3) $

1) $f(3) = sqrt(2 times 3 - 6) = sqrt(0) = 0$

- $lim_(x arrow.r 3^+) f(x) = lim_(x arrow.r 3^+) (sqrt(2x - 6)) = 0$

- $lim_(x arrow.r 3^-) f(x) = lim_(x arrow.r 3^-) (x^2 - 3x) = 0$

$} arrow.double lim_(x arrow.r 3^+) f = lim_(x arrow.r 3^-) f = 0$

D'où $lim_(x arrow.r 3) f(x) = 0 = f(3)$

D'où $f$ est continue en 3

2) a)

$lim_(x arrow.r 3^-) frac(f(x) - f(3), x - 3) = lim_(x arrow.r 3^-) frac(x^2 - 3x, x - 3)$

$= lim_(x arrow.r 3^-) frac(x(x - 3), (x - 3)) = lim_(x arrow.r 3^-) (x) = 3$

Donc $f$ est dérivable à gauche en 3 et $f_g '(3) = 3$

b)

$(T_1) : cases(y = f_g '(3)(x - 3) + f(3), x lt.eq 3) arrow.l.r.double (T_1) : cases(y = 3x - 9, x lt.eq 3)$

// Source: Corrigé T1 p.69 (colonne droite)

3) a)

$lim_(x arrow.r 3^+) frac(f(x) - f(3), x - 3) = lim_(x arrow.r 3^+) frac(sqrt(2x - 6), x - 3)$

$= lim_(x arrow.r 3^+) frac((sqrt(2x - 6))^2, (x - 3) times sqrt(2x - 6)) = lim_(x arrow.r 3^+) frac(2x - 6, (x - 3) times sqrt(2x - 6))$

$= lim_(x arrow.r 3^+) frac(2(x - 3), (x - 3) times sqrt(2x - 6)) = lim_(x arrow.r 3^+) frac(2, sqrt(2x - 6)) = frac(2, 0^+) = +infinity$

Donc $f$ n'est pas dérivable à droite en 3

b) $lim_(x arrow.r 3^+) frac(f(x) - f(3), x - 3) = +infinity$

D'où la courbe $(C f)$ admet une demi tangente verticale au point d'abscisse 3

c) $f$ n'est pas dérivable à droite en 3 donc $f$ n'est pas dérivable en 3

4) graphe

// Figure: Exercice 18 - Fonction par morceaux avec demi-tangente verticale
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    import cetz.plot
    plot.plot(
      size: (8, 7),
      x-tick-step: 1,
      y-tick-step: 1,
      x-min: -1, x-max: 7,
      y-min: -3, y-max: 7,
      axis-style: "school-book",
      {
        // f(x) = x^2 - 3x, x < 3
        plot.add(domain: (-0.5, 3), x => calc.pow(x, 2) - 3*x, label: $C_f$)
        // f(x) = sqrt(2x - 6), x >= 3
        plot.add(domain: (3, 7), x => calc.sqrt(2*x - 6))
        // T1: y = 3x - 9, x <= 3
        plot.add(domain: (1, 3), x => 3*x - 9, style: (stroke: (dash: "dashed")), label: $(T_1)$)
      }
    )
  })
]

// Source: Corrigé T1 p.70

=== Exercice 19

Le plan est muni d'un repère orthogonal $(O, arrow(i), arrow(j))$.

Soit $f$ la fonction définie par

$ f(x) = frac(x, sqrt(x^2 + 1)) $

1. Vérifier que $f$ est définie et continue sur $[-2, 4]$.

2. Déterminer les équations des demi-tangentes aux points d'abscisses $-2$ et $4$.

3. Tracer $C_f$ ainsi que les demi-tangentes aux points d'abscisses $-2$ et $4$.


==== Corrigé


- $D f = [-2, 4]$ #h(0.5cm) - $cases(f(1) = 3, f'(1) = 0)$

- $cases(f(4) = -2, f_g '(4) = 0)$ #h(0.5cm) - $f$ non dérivable en $(-2)$

- $cases(f(-2) = 0, f(3) = 0)$ #h(0.5cm) - $f(x) gt.eq 0$ pour $x in [-2, 3]$

- $f$ est décroissante sur $[1, 4]$

- $f_d '(0) = 1$

1) Exemple : $f(x) = |x|$, $x in [-1, 1]$

// Figure: Exercice 19 graphe exemple
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    import cetz.plot
    plot.plot(
      size: (4, 3),
      x-tick-step: 1,
      y-tick-step: 1,
      x-min: -1.5, x-max: 1.5,
      y-min: -1.5, y-max: 1.5,
      axis-style: "school-book",
      {
        plot.add(domain: (-1, 0), x => -x)
        plot.add(domain: (0, 1), x => x)
      }
    )
  })
]

On peut trouver plusieurs fonctions qui vérifie ces conditions

// Source: Corrigé T1 p.70 (colonne droite, suite Exercice 19)
2) $f(x) = |x| arrow.l.r.double f_g '(0) = -1$ (pente de la demi-tangente)

3) $f$ non dérivable en 0 car on a : $f_g '(0) eq.not f_d '(0)$

// Figure: Exercice 19 - Courbe principale
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    import cetz.plot
    plot.plot(
      size: (8, 7),
      x-tick-step: 1,
      y-tick-step: 1,
      x-min: -3, x-max: 5,
      y-min: -3, y-max: 5,
      axis-style: "school-book",
      {
        // Courbe approximative de f passant par les points donnés
        // f(-2)=0, sommet f(1)=3, f(3)=0, f(4)=-2
        plot.add(domain: (-2, 4), x => {
          let t = x
          // Approximation cubique passant par les points clés
          -0.5*calc.pow(t, 3) + 0.5*calc.pow(t, 2) + 2*t
        }, label: $C_f$)
      }
    )
  })
]

// - $f$ est paire : $(C f)$ est symétrique par rapport à la droite $(O, arrow(j))$
// - $f$ est croissante sur $[0, 1]$
// - $f_d '(0) = 1$

// Source: Corrigé T1 p.70 (colonne droite)

=== Exercice 20

Le plan muni d'un repère orthogonal $(O, arrow(i), arrow(j))$.

Tracer la représentation graphique d'une fonction $f$ qui a les caractéristiques suivantes :

- $f$ est définie et continue sur $[-1, 1]$.

- $f(-1) = 0$, $f(0) = 1$ et $f(1) = 0$.

- $f'(0) = 0$ et $f'(1^-) = -2$.

- La courbe $C$ de $f$ admet au point $(-1, 0)$ une demi-tangente verticale.


=== Exercice 21

Soit $f$ la fonction définie sur $[-1, 1]$ par $f(x) = frac(1, 2) x^2 - frac(1, 2)$.

1. Montrer que $f'(a) = a$.

2. Déterminer les équations des demi-tangentes aux points d'abscisses $-1$ et $1$.

On désigne par $C$ la courbe représentative de $f$ dans un repère orthogonal.

3. Soit un réel $m$. On dit qu'un point $M$ de $C$ est un point que l'on appelle de contact si la tangente en $M$ est de la droite d'abscisse $m$.

4. Déterminer $O M$ est un milieu que $M$ appartient au demi-cercle $C$.

5. Soit $m$ un point de $C$ d'abscisse $b$.

Déterminer l'ordonnée de $N$ en fonction de $b$ et en déduire un segment $N$.

6. Tracer $C_f$ ainsi que les demi-tangentes aux points d'abscisses $-1$ et $1$.

7. Soit $A$ le point $C$ d'abscisse $frac(1, 2)$.

#h(0.5cm) a. Déterminer une équation de la tangente $T$ à $C_f$ au point $A$.

#h(0.5cm) b. La droite $T$ coupe l'axe des abscisses en $P$.

Déterminer les coordonnées de $P$ puis calculer $O P$.

#h(0.5cm) c. En déduire que la droite $T$ est perpendiculaire à la droite $(O A)$.

// Source: Manuel T1 p.98

==== Corrigé


$f(x) = sqrt(1 - x^2)$ ; $D f = [-1, 1]$

1)

- pour $x in D f = [-1, 1]$ on a :

$-1 lt.eq x lt.eq 1 arrow.double 1 gt.eq -x gt.eq -1 arrow.double (-x) in D f$

- $f(-x) = sqrt(1 - (-x)^2) = sqrt(1 - x^2) = f(x)$

Donc $f$ est une fonction paire

2)

$* lim_(x arrow.r 1^-) frac(f(x) - f(1), x - 1) = lim_(x arrow.r 1^-) frac(sqrt(1 - x^2), x - 1)$

$= lim_(x arrow.r 1^-) frac((sqrt(1 - x^2))^2, (x - 1) times (sqrt(1 - x^2))) = lim_(x arrow.r 1^-) frac(1 - x^2, (x - 1) times (sqrt(1 - x^2)))$

$= lim_(x arrow.r 1^-) frac(-(x - 1)(x + 1), (x - 1) times (sqrt(1 - x^2))) = lim_(x arrow.r 1^-) frac(-(x + 1), sqrt(1 - x^2)) = frac(-2, 0^+) = -infinity$

Donc $f$ n'est pas dérivable à gauche en 1

$(C f)$ admet une demi-tangente verticale au point d'abscisse 1, d'équation : $cases(x = 1, y gt.eq 0)$

$* lim_(x arrow.r (-1)^+) frac(f(x) - f(-1), x + 1) = lim_(x arrow.r (-1)^+) frac(sqrt(1 - x^2), x + 1)$

$= lim_(x arrow.r (-1)^+) frac(1 - x^2, (x + 1) times (sqrt(1 - x^2)))$

$= lim_(x arrow.r (-1)^+) frac(-(x + 1)(x - 1), (x + 1) times (sqrt(1 - x^2)))$

$= lim_(x arrow.r (-1)^+) frac(-(x - 1), sqrt(1 - x^2)) = frac(2, 0^+) = +infinity$

Donc $f$ n'est pas dérivable à droite en $(-1)$

$(C f)$ admet une demi-tangente verticale au point d'abscisse $(-1)$, d'équation : $cases(x = -1, y gt.eq 0)$

// Source: Corrigé T1 p.71

3) a)

$M(x, y)$ avec $y = f(x) = sqrt(1 - x^2) gt.eq 0$

$O M = sqrt(x^2 + f^2(x)) = sqrt(x^2 + 1 - x^2) = sqrt(1) = 1$

$O M = 1$ et $y gt.eq 0$ d'où $M in (C)$ (demi cercle)

b) $(C) : x^2 + y^2 = 1$ avec $y gt.eq 0$

_Soit_ $N(x, y)$ _avec_ $cases(x^2 + y^2 = 1, y gt.eq 0)$

$ arrow.double c cases(y^2 = 1 - x^2, y gt.eq 0) $

$arrow.double y = sqrt(1 - x^2) = f(x)$ d'où $N in (C f)$

c) $(C) = (C f)$

4)

// Figure: Exercice 21 - Demi-cercle
#align(center)[
  #cetz.canvas({
    import cetz.draw: *
    import cetz.plot
    plot.plot(
      size: (6, 6),
      x-tick-step: 1,
      y-tick-step: 1,
      x-min: -1.5, x-max: 1.5,
      y-min: -0.5, y-max: 1.5,
      axis-style: "school-book",
      {
        // Demi-cercle supérieur
        plot.add(domain: (-1, 1), x => calc.sqrt(1 - calc.pow(x, 2)))
      }
    )
  })
]

5) $f(frac(3, 5)) = sqrt(1 - frac(9, 25)) = sqrt(frac(16, 25)) = frac(4, 5) arrow.double A(frac(3, 5), frac(4, 5))$

a) Pour tout réel $a in bracket.r -1, 1 [$ on a :

$f'(a) = frac(-2a, 2sqrt(1 - a^2)) = frac(-a, sqrt(1 - a^2))$

d'où $f'(frac(3, 5)) = frac(-frac(3, 5), sqrt(1 - (frac(3, 5))^2)) = frac(-frac(3, 5), frac(4, 5)) = -frac(3, 4)$

$T : y = f'(frac(3, 5))(x - frac(3, 5)) + f(frac(3, 5)) = -frac(3, 4)(x - frac(3, 5)) + frac(4, 5)$

$T : y = -frac(3, 4) x + frac(9, 20) + frac(4, 5) = -frac(3, 4) x + frac(25, 20)$

$#rect[$T : y = -frac(3, 4) x + frac(5, 4)$]$

// Source: Corrigé T1 p.71 (colonne droite)

b)

$P(x_P, y_P) in T sect (O, arrow(i)) arrow.double cases(y_P = -frac(3, 4) x_P + frac(5, 4), y_P = 0)$

$arrow.double 0 = -frac(3, 4) x_P + frac(5, 4) arrow.double frac(3, 4) x_P = frac(5, 4) arrow.double x_P = frac(5, 3)$

d'où $P$ à pour coordonnées $(frac(5, 3), 0)$

- $O P = |frac(5, 3)| = frac(5, 3)$

- $P A = sqrt((x_A - x_P)^2 + (y_A - y_P)^2) = sqrt((frac(3, 5) - frac(5, 3))^2 + (frac(4, 5))^2)$

$= sqrt((-frac(16, 15))^2 + (frac(4, 5))^2) = sqrt(frac(256, 225) + frac(16, 25)) = sqrt(frac(400, 225)) = frac(4, 3)$

c) On a : $T = (A P)$

$O A^2 + A P^2 = 1^2 + (frac(4, 3))^2 = 1 + frac(16, 9) = frac(25, 9)$

$O P^2 = (frac(5, 3))^2 = frac(25, 9)$

_donc_ : $O A^2 + A P^2 = O P^2$

d'après la réciproque du théorème de Pythagore le triangle $O A P$ est rectangle en $A$

_par suite_ on aura : $(A P) bot (O A)$

_or_ on sait que $T = (A P)$

_Conclusion :_ $T$ est perpendiculaire à $(O A)$

// Source: Manuel T1 p.98
== Avec l'ordinateur

Soit $C$ la parabole représentative de la fonction $f : x mapsto x^2 + 2x - 5$ et $A$ le point de $C$ d'abscisse 1.

À tout point $M$ de $C$ distinct de $A$, on désigne par $k$ le coefficient directeur de la sécante $(A M)$.

On se propose dans cette séquence, d'étudier à l'aide d'un tableau, le comportement des réels $m$ lorsque $M$ varie sur la parabole $C$ puis du point $A$.

Dans la cellule A1, on tape 0 ; en $A 2 = A 1 + 2a - 3$ puis on fusionne $A 1$ et $B 1$.

On choisit une valeur initiale de $x 0$, dans $B 2$ (par exemple 1) et dans $B 1$ on calcule $f(x 0)$.

L'écart initial entre $x$ et $x 0$ étant égal à $0,2$ ; on le réduit à chaque étape à sa moitié. Ainsi dans la cellule $A 7$, on tape $0,2$ et dans la cellule $A 8$ on écrit la formule $A 7/2$, puis on la recopie vers le bas (jusqu'à $A 22$).

Dans la cellule $B 7$ on inscrit la formule $= B dollar 2 + A 7$ puis dans $C 7$, on écrit la formule $= B 7 hat 2 + 2 ast B 7 - 5$ et enfin dans $D 7$, on écrit la formule $= (C 7 - B dollar 1) / A 7$.

Recopier la plage $A 8 B 8$ vers le bas (jusqu'à $A 22 D 22$).

Que peut-on conjecturer sur la limite en $x 0$ de $f$ ?


// Source: Manuel T1 p.99
== Math - culture

Sur les chronophotographies ci-contre, on repère les positions successives de la bille au cours du temps.

Par dérivation numérique, on peut obtenir les différentes valeurs des vitesses.

Au XVIIIe siècle, Jean d'Alembert introduit la définition du nombre dérivé en tant que limite du taux d'accroissement sous une forme semblable à celle qui est utilisée et enseignée de nos jours, et c'est seulement avec les travaux de Weierstrass au milieu du XIXe siècle que le concept de nombre dérivé sera entièrement formalisé.

La première fonction continue partout mais dérivable nulle part a été construite par Weierstrass. Cette fonction a aidé à clarifier les notions de continuité et de dérivabilité, et a obligé les mathématiciens à en donner des définitions précises : auparavant, ceux-ci se contentaient des définitions « intuitives », et pensaient qu'une fonction continue était « toujours » dérivable sauf éventuellement en quelques points ; la construction de Weierstrass est venue contredire cette idée intuitive.

L'idée de Weierstrass est de partir d'une fonction $f_1$ qui est parfaitement dérivable, puis en perturbant cette première fonction en lui ajoutant une deuxième fonction, notée $f_2$, de façon que la courbe de $f_1 + f_2$ zig-zague autour de celle de $f_1$.

Par itération de ce procédé, on obtient la courbe de Weierstrass, courbe d'une fonction partout continue et nulle part dérivable.
