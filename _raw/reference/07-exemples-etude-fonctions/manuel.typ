// =============================================================================
// Module 7 : Exemples d'étude de fonctions
// Programme : 3ème Math (Tunisie)
// Source : Manuel scolaire CNP (T1, p.118-135) + Corrigé CMS (T2, p.1-40)
// =============================================================================

#import "@preview/cetz:0.3.4"

= Chapitre 7 : Exemples d'étude de fonctions

#emph[" La connaissance s'acquiert par l'experience, tout le reste n'est que de l'information. "]

#align(right)[*Einstein*]

// Source: Manuel T1 p.119
== Pour commencer

=== Activite 1

Le plan est muni d'un repere $(O, arrow(i), arrow(j))$. On a represente graphiquement trois fonctions f, g et h ainsi que leurs fonctions derivees f', g' et h'.

Associer a chaque courbe celle de sa fonction derivee.

#cetz.canvas({
  import cetz.draw: *
  // Axes
  line((-3.5, 0), (4, 0), stroke: 0.5pt, mark: (end: ">"))
  line((0, -2), (0, 4), stroke: 0.5pt, mark: (end: ">"))
  content((4, -0.3), $x$)
  content((-0.3, 4), $y$)
  content((-0.3, -0.3), $O$)
  // Courbe 1 : forme de parabole ouverte vers le haut
  bezier((-3, 3.5), (-1, -0.5), (-2.5, 1.5), (-1.5, -0.3), stroke: blue + 1.5pt)
  bezier((-1, -0.5), (1, 1.5), (-0.3, -0.5), (0.5, 0.5), stroke: blue + 1.5pt)
  bezier((1, 1.5), (3, 3.5), (1.5, 2), (2.5, 3), stroke: blue + 1.5pt)
  // Courbe 2 : fonction decroissante puis croissante (forme de V arrondi)
  bezier((-3, 2), (-1.5, 0.3), (-2.5, 1.2), (-2, 0.5), stroke: red + 1.5pt)
  bezier((-1.5, 0.3), (0, 0.5), (-1, 0.2), (-0.5, 0.3), stroke: red + 1.5pt)
  bezier((0, 0.5), (1.5, 2.5), (0.5, 0.8), (1, 1.5), stroke: red + 1.5pt)
  bezier((1.5, 2.5), (3, 3.5), (2, 2.8), (2.5, 3.2), stroke: red + 1.5pt)
})

=== Activite 2

Le plan est muni d'un repere $(O, arrow(i), arrow(j))$.

Soit f une fonction derivable sur $[-5, 3]$.

On a trace ci-contre la courbe representative de sa fonction derivee f'.

1. a. Determiner graphiquement $f'(0)$, $f'(-4)$ et $f'(-1)$.

#h(0.5cm) b. Interpreter graphiquement ces nombres.

2. Une parmi les courbes ci-dessous, est la representation graphique de f, laquelle ?

#grid(
  columns: (1fr, 1fr, 1fr),
  gutter: 1em,
  [
    #cetz.canvas({
      import cetz.draw: *
      line((-2.5, 0), (2, 0), stroke: 0.5pt, mark: (end: ">"))
      line((0, -1.5), (0, 2), stroke: 0.5pt, mark: (end: ">"))
      // Courbe sinusoidale
      bezier((-2.5, -1), (-1.5, 1.5), (-2, 0.5), (-1.8, 1.5), stroke: blue + 1.5pt)
      bezier((-1.5, 1.5), (0, -1), (-1, 1), (-0.5, -0.5), stroke: blue + 1.5pt)
      bezier((0, -1), (1.5, 1.5), (0.5, -0.5), (1, 1), stroke: blue + 1.5pt)
    })
  ],
  [
    #cetz.canvas({
      import cetz.draw: *
      line((-2.5, 0), (2, 0), stroke: 0.5pt, mark: (end: ">"))
      line((0, -1.5), (0, 2), stroke: 0.5pt, mark: (end: ">"))
      // Courbe avec deux bosses
      bezier((-2.5, 0.5), (-1.5, 1.5), (-2, 0.8), (-1.8, 1.3), stroke: blue + 1.5pt)
      bezier((-1.5, 1.5), (-0.5, -0.5), (-1, 1), (-0.8, 0), stroke: blue + 1.5pt)
      bezier((-0.5, -0.5), (0.5, 1.5), (0, 0.2), (0.3, 1.2), stroke: blue + 1.5pt)
      bezier((0.5, 1.5), (1.5, 0), (1, 1), (1.3, 0.3), stroke: blue + 1.5pt)
    })
  ],
  [
    #cetz.canvas({
      import cetz.draw: *
      line((-2.5, 0), (2, 0), stroke: 0.5pt, mark: (end: ">"))
      line((0, -1.5), (0, 2), stroke: 0.5pt, mark: (end: ">"))
      // Courbe oscillante differente
      bezier((-2.5, 1), (-1.5, -0.5), (-2, 0.3), (-1.8, -0.3), stroke: blue + 1.5pt)
      bezier((-1.5, -0.5), (-0.5, 1.5), (-1, 0.2), (-0.8, 1.2), stroke: blue + 1.5pt)
      bezier((-0.5, 1.5), (0.5, -0.5), (0, 1), (0.3, 0), stroke: blue + 1.5pt)
      bezier((0.5, -0.5), (1.5, 1.5), (1, 0.3), (1.3, 1.2), stroke: blue + 1.5pt)
    })
  ]
)

// Source: Manuel T1 p.120
== Cours

=== 1. Elements de symetries d'une courbe

==== Activite 1

Le plan est muni d'un repere orthogonal $(O, arrow(i), arrow(j))$.

On a trace la courbe representative C de la fonction

$ f : x |-> frac(2x^2 - 4x + 3, (x - 1)^2) $

#cetz.canvas({
  import cetz.draw: *
  // Axes
  line((-2, 0), (5, 0), stroke: 0.5pt, mark: (end: ">"))
  line((0, -0.5), (0, 5), stroke: 0.5pt, mark: (end: ">"))
  content((5, -0.3), $x$)
  content((-0.3, 5), $y$)
  content((-0.3, -0.3), $O$)
  // Asymptote verticale x = 1
  line((1, -0.5), (1, 5), stroke: (dash: "dashed", paint: gray))
  content((1, -0.3), $1$)
  // Asymptote horizontale y = 2
  line((-2, 2), (5, 2), stroke: (dash: "dashed", paint: gray))
  content((-0.3, 2), $2$)
  // Branche gauche
  bezier((-1.5, 3), (-0.2, 4.5), (-1, 3.3), (-0.5, 4), stroke: blue + 1.5pt)
  bezier((-0.2, 4.5), (0.7, 4.8), (0.2, 4.6), (0.5, 4.7), stroke: blue + 1.5pt)
  // Branche droite
  bezier((1.3, 4.8), (2, 3.5), (1.5, 4.5), (1.7, 4), stroke: blue + 1.5pt)
  bezier((2, 3.5), (3, 2.5), (2.3, 3), (2.7, 2.7), stroke: blue + 1.5pt)
  bezier((3, 2.5), (4.5, 2.1), (3.5, 2.3), (4, 2.15), stroke: blue + 1.5pt)
})

On se propose de montrer que la droite $Delta$ d'equation $x = 1$ est un axe de symetrie de C.

Pour tout point $M(x, y)$, on note $N = S_Delta (M)$.

1. Exprimer les coordonnees de N en fonction de celles de M.

2. Soit $M_0 (x_0, f(x_0))$ ou $x_0 eq.not 1$. Verifier que

#h(0.5cm) N est un point de C, si et seulement si, $2 - x_0 eq.not 1$ et $f(2 - x_0) = f(x_0)$.

3. Conclure.

#block(fill: rgb("#e8f5e9"), inset: 12pt, radius: 4pt, width: 100%)[
  *Theoreme*

  Le plan est muni d'un repere orthogonal $(O, arrow(i), arrow(j))$. Soit f une fonction definie sur un ensemble D de courbe representative C et $Delta$ la droite d'equation $x = a$.

  La droite $Delta$ est un axe de symetrie de C, si et seulement si, pour tout x appartenant a D, $2a - x$ appartient a D et $f(2a - x) = f(x)$.
]

==== Activite 2

Le plan est muni d'un repere $(O, arrow(i), arrow(j))$.

On a trace la courbe representative C de la fonction

$ f : x |-> frac(1, 2) (x - 2)^3 (x' - 4x) - 1. $

On se propose de montrer que le point $Omega (2, -1)$ est un centre de symetrie de C.

Pour tout point $M(x, y)$, on note $N = S_Omega (M)$.

1. Exprimer les coordonnees de N en fonction de celles de M.

2. Soit $M_0 (x_0, f(x_0))$. Verifier que

#h(0.5cm) N est un point de C, si et seulement si, $f(4 - x_0) = -2 - f(x_0)$.

3. Conclure.

#block(fill: rgb("#e8f5e9"), inset: 12pt, radius: 4pt, width: 100%)[
  *Theoreme*

  Le plan est muni d'un repere orthogonal $(O, arrow(i), arrow(j))$. Soit f une fonction definie sur un ensemble D de courbe representative C et O le point de coordonnees $(a, b)$.

  Le point O est un centre de symetrie de C, si et seulement si, pour tout x appartenant a D, $2a - x$ appartient a D et $f(2a - x) + f(x) = 2b$.
]

// Source: Manuel T1 p.121
=== 2. Exemples de fonctions polynomes

==== Activite 3

Le plan est muni d'un repere orthonormal $(O, arrow(i), arrow(j))$.

Soit P la parabole, d'equation $y = x^2$ et $Delta$ la droite d'equation $y = x + 2$.

#cetz.canvas({
  import cetz.draw: *
  // Axes
  line((-3, 0), (4, 0), stroke: 0.5pt, mark: (end: ">"))
  line((0, -1), (0, 5), stroke: 0.5pt, mark: (end: ">"))
  content((4, -0.3), $x$)
  content((-0.3, 5), $y$)
  content((-0.3, -0.3), $O$)
  // Parabole y = x^2
  bezier((-2, 4), (-1, 1), (-1.7, 2.8), (-1.3, 1.5), stroke: blue + 1.5pt)
  bezier((-1, 1), (0, 0), (-0.7, 0.5), (-0.3, 0.1), stroke: blue + 1.5pt)
  bezier((0, 0), (1, 1), (0.3, 0.1), (0.7, 0.5), stroke: blue + 1.5pt)
  bezier((1, 1), (2, 4), (1.3, 1.5), (1.7, 2.8), stroke: blue + 1.5pt)
  // Droite y = x + 2
  line((-2, 0), (2.5, 4.5), stroke: red + 1pt)
  // Points A et B d'intersection
  circle((-1, 1), radius: 0.06, fill: black)
  content((-1.3, 0.7), $A$)
  circle((2, 4), radius: 0.06, fill: black)
  content((2.3, 3.7), $B$)
  // Point C
  circle((1, 1), radius: 0.06, fill: black)
  content((1.3, 0.7), $C$)
  // Region ombree (triangle ABC)
  // Indication visuelle du triangle
})

1. Determiner les coordonnees des points d'intersection A et B de $Delta$ et de P.

2. Soit C le point de P d'abscisse 1.

#h(0.5cm) Determiner l'aire du triangle ABC.

3. Soit a un reel de $[-1, 2]$ et M le point de P d'abscisse x.

#h(0.5cm) a. Exprimer l'aire S(x) du triangle AMB.

#h(0.5cm) b. Representer dans un repere orthogonal la fonction $S : x |-> S(x)$ et determiner la valeur $x_0$ dans laquelle S atteint son maximum.

==== Activite 4

Soit f la fonction definie sur $RR$ par $f(x) = x^3 - 4x^2 + 3x + 1$.

1. Justifier la continuite de f sur $RR$.

2. a. Calculer les exces $f(-1)$, $f(0)$, $f(2)$ et $f(3)$.

#h(0.5cm) b. En deduire que l'equation $f(x) = 0$ admet exactement trois solutions. On designe par $alpha$, $beta$ et $gamma$ ces solutions et on suppose que $alpha < beta < gamma$.

3. Determiner le signe de f sur chacun des intervalles $]-infinity, alpha[$, $]alpha, beta[$, $]beta, gamma[$ et $]gamma, +infinity[$.

==== Activite 3 (suite)

Le plan est muni d'un repere $(O, arrow(i), arrow(j))$.

On a represente ci-dessous les fonctions f, g et h definies sur $RR$ par

$f(x) = 2x^3 + 3$ #h(0.5cm), #h(0.5cm) $g(x) = -3x^3 + x + 3$ #h(0.5cm) et #h(0.5cm) $h(x) = x^3 + x^2 - x - 1$.

Associer a chacune de ces fonctions, sa courbe representative.

// Source: Manuel T1 p.122
==== Activite 4 (suite)

Soit n un entier $n gt.eq 2$. On considere la fonction $f : x |-> x^n$.

1. Calculer $lim frac(f(x), x)$.

2. Discuter suivant la parite de n, $lim_(x -> -infinity) frac(f(x), x)$.

#block(fill: rgb("#e8f5e9"), inset: 12pt, radius: 4pt, width: 100%)[
  *Theoreme*

  Soit f une fonction polynome de degre n, $n gt.eq 2$. Alors $frac(f(x), x^n)$ tend vers l'infini quand x tend vers $+infinity$.

  On dit que la courbe representative C de f dans un repere $(O, arrow(i), arrow(j))$ admet une branche parabolique de direction $(O, arrow(j))$, au voisinage de l'infini.
]

==== Activite 5

On considere la fonction f definie sur $RR$ par $f(x) = x^3$ et on designe par C sa courbe representative dans un repere orthogonal $(O, arrow(i), arrow(j))$.

1. On se propose d'etudier f et de representer C :

#h(0.5cm) a. Verifier que O est un centre de symetrie de C.

#h(0.5cm) b. Determiner les limites aux bornes de $[0, +infinity[$.

#h(0.5cm) c. Etudier la continuite et la derivabilite de f et determiner sa fonction derivee sur $[0, +infinity[$.

#h(0.5cm) En deduire le tableau de variation de f sur $[0, +infinity[$.

#h(0.5cm) d. Verifier que C admet une branche parabolique de direction $(O, arrow(j))$ au voisinage de $+infinity$.

#h(0.5cm) e. Tracer C.

2. En deduire les representations graphiques des fonctions

$g : x |-> f(x) - 2 = x^3 - 2$ #h(1cm) et #h(1cm) $h : x |-> f(h(x))$.

Pour l'etude et la representation graphique d'une fonction f :

- Determiner son ensemble de definition D.

- Il est parfois possible de reduire l'ensemble d'etude de f a une partie de D, c'est le cas par exemple, si f est paire ou impaire, il suffira d'etudier f pour les reels positifs de D.

- Etudier la continuite et la derivabilite de f et determiner sa fonction derivee ainsi que son signe.

- Dresser alors le tableau de variation de f en effectuant les etudes de limites necessaires.

- Tracer la courbe representative de f dans un repere $(O, arrow(i), arrow(j))$ en etudiant eventuellement les asymptotes ou les branches paraboliques.

==== Activite 6

On considere la fonction f definie sur $RR$ par $f(x) = x^3 - 3x$.

On designe par C sa courbe representative dans un repere $(O, arrow(i), arrow(j))$.

1. Verifier que O est un centre de symetrie de C.

// Source: Manuel T1 p.123
2. Etudier f.

3. Determiner les coordonnees des points d'intersection de C et de l'axe des abscisses.

4. a. Determiner une equation de la tangente $T_0$ a C en O et etudier la position de C par rapport a $T_0$.

#h(0.5cm) b. Tracer $T_0$ et C.

5. Soit g la fonction definie sur $RR$ par $g(x) = x^3 + 3x^2 - 2$.

On designe par C' sa courbe representative dans le repere $(O, arrow(i), arrow(j))$.

#h(0.5cm) a. Montrer que pour tout reel x, $g(x) = f(x + 1)$.

#h(0.5cm) b. En deduire la construction de C'.

==== Activite 7

Le plan est muni d'un repere $(O, arrow(i), arrow(j))$.

1. Representer les fonctions f et g definies sur $RR$ par $f(x) = 6x^2 - 2$ et $g(x) = x^3$.

2. On pose $h(x) = f(x) - g(x)$, $x in RR$.

#h(0.5cm) a. Montrer que $h(x) = 0$ admet exactement trois solutions.

#h(0.5cm) b. Donner une valeur approchee de chacune de ces solutions a 0,5 pres.

#h(0.5cm) c. Etudier et representer la fonction h.

3. Determiner suivant les valeurs du reel m le nombre de solutions de l'equation $f(x) = m$.

==== Activite 8

On a montre que le taux de croissance du nombre de bacteries dans une culture donnee, t heures apres le debut de l'experience est de $240 t - 5t$ bacteries par heure.

On suppose que le nombre de bacteries est de 1000 au debut de l'experience.

1. Verifier que le nombre de bacteries apres t heures est $N(t) = 240t^2 + 1 - 5t^3 + 1000$.

2. Etudier et representer la fonction $N : t |-> N(t)$.

3. Donner une estimation du temps necessaire pour que le nombre de bacteries atteigne 5000, 10000, 15000 bacteries.

==== Activite 9

On considere la fonction f definie sur $RR$ par $f(x) = x^4$ et on designe par C sa courbe representative dans un repere orthonormal $(O, arrow(i), arrow(j))$.

1. Etudier et representer la fonction f.

2. En deduire les representations graphiques des fonctions $g : x |-> f(x) + 1$ et $h : x |-> h(x^4 + 1)$.

==== Activite 10

On considere la fonction f definie sur $RR$ par $f(x) = a x^4 + b x^2 + c$ ou $a$, $b$ et $c$ sont des reels.

1. Montrer que si $x_0$ est solution de l'equation $f(x) = 0$ alors $-x_0$ est aussi solution de cette equation.

2. On suppose que $f(x) = 0$ admet exactement trois solutions.

#h(0.5cm) a. Montrer que $c = 0$ et que $a b < 0$.

#h(0.5cm) b. Determiner alors en fonction de a et b les solutions de l'equation.

// Source: Manuel T1 p.124
=== 3. Exemples de fonctions rationnelles

==== Activite 11

On considere la fonction definie sur $RR backslash {2}$ par $f(x) = frac(2x - 2, x - 2)$.

1. On se propose de determiner les reels a et b tels que $f(x) = a + frac(b, x - 2)$.

#h(0.5cm) a. Calculer $lim_(x -> +infinity) f(x) = ... + frac(..., x - 2) = a + frac(b, x - 2)$.

#h(0.5cm) b. Verifier que $(x - 2) f(x) = a(x - 2) + b$, $x eq.not 2$, $b = ... 2$.

#h(0.5cm) c. En deduire la valeur de b.

#h(0.5cm) d. Calculer $lim f(x)$ et en deduire la valeur de a.

2. Etudier f.

3. En deduire les variations de chacune des fonctions $-4f$ et $g_k : x |-> f(x) + k$ ou k est un reel.

==== Activite 1 (fonctions rationnelles)

On considere la fonction f definie sur $RR backslash {-1}$, par $f(x) = frac(x^2 + 7x + 2, x + 1)$ et on designe par C sa courbe representative dans un repere orthogonal $(O, arrow(i), arrow(j))$.

1. On se propose de determiner les reels a, b et c tels que $f(x) = a x + b + frac(c, x + 1)$, pour tout x, $x eq.not -1$.

#h(0.5cm) a. Calculer $lim_(x -> +infinity) f(x) = x + 1$ et en deduire la valeur de c.

#h(0.5cm) b. Calculer $lim f(x)$ et en deduire la valeur de b.

#h(0.5cm) c. Calculer $lim f(x)$ et en deduire la valeur de a.

2. Etudier f.

3. En deduire les variations de chacune des fonctions $-4f$ et $g_k : x |-> f(x) + k$ ou k est un reel.

==== Activite 2 (fonctions rationnelles)

On considere la fonction definie sur $RR backslash {-1, 1}$, par $f(x) = frac(x^3 + 7x + 2, x + 1)$ et on designe par C sa courbe representative dans un repere orthogonal $(O, arrow(i), arrow(j))$.

1. On se propose de determiner les reels a, b, c et d tels que $f(x) = a + frac(b x + c, ...)$, pour tout x.

#h(0.5cm) a. Calculer $lim_(x -> +infinity) f(x) = ... $ et en deduire la valeur de a.

#h(0.5cm) b. Calculer $f(0)$ et en deduire la valeur de b.

#h(0.5cm) c. Calculer $lim f(x)$ et en deduire la valeur de a.

2. Etudier f.

4. Pour tout reel m, on considere l'equation $f_(m)$ : $(1 - m) x^2 + (7 - m) x + 2 = 0$.

#h(0.5cm) a. Discuter suivant les valeurs de m, le nombre de solutions de $f_(m)$.

#h(0.5cm) b. En deduire le nombre de points d'intersection de C avec la droite $y = m$.

5. a. Representer la fonction $g : x |-> f(-|x|)$.

#h(0.5cm) b. En deduire son tableau de variations.

// Source: Manuel T1 p.125
==== Activite 3

On considere la fonction $f : x |-> frac(6x - 3, 2x^2 - 2x + 1)$ et on designe par C sa courbe representative dans un repere $(O, arrow(i), arrow(j))$.

1. Determiner l'ensemble de definition de f.

2. Etudier f.

3. Soit I le point de C d'abscisse $frac(1, 2)$.

#h(0.5cm) a. Montrer que I est un centre de symetrie de C.

#h(0.5cm) b. Determiner une equation de la tangente T a C en I.

#h(0.5cm) c. Etudier la position relative de T et de C.

4. Tracer C et T.

==== Activite 4

Le plan est muni d'un repere $(O, arrow(i), arrow(j))$. On a represente graphiquement les fonctions

$ f : x |-> frac(x^2 - 4x + 3, x^2 - 4x) , quad g : x |-> frac(x^2 + 4, x^2 + 3x + 4) , quad h : x |-> frac((x - 1)^2, x^2 - 4) , $

$ u : x |-> frac(2x^2 + 2x - 4, x^2 - 2x - 3) , quad v : x |-> frac(2x^2 + 3x + 1, x^2 - 2x - 3) quad "et" quad w : x |-> frac(2x + 1, x^2 - 2x - 3) . $

#grid(
  columns: (1fr, 1fr, 1fr),
  gutter: 1em,
  [
    #cetz.canvas({
      import cetz.draw: *
      line((-3, 0), (5, 0), stroke: 0.5pt, mark: (end: ">"))
      line((0, -2), (0, 4.5), stroke: 0.5pt, mark: (end: ">"))
      content((5, -0.3), $x$)
      content((-0.3, 4.5), $y$)
      // Courbe C_1 avec asymptotes verticales
      bezier((-2.5, 1.2), (-0.5, 3.5), (-1.5, 1.5), (-0.8, 2.5), stroke: red + 1.2pt)
      bezier((0.5, -1.5), (2, 0.5), (0.8, -0.5), (1.5, 0.2), stroke: red + 1.2pt)
      bezier((2, 0.5), (4.5, 1), (3, 0.8), (4, 0.95), stroke: red + 1.2pt)
      content((4, 3.5), $C_1$)
    })
  ],
  [
    #cetz.canvas({
      import cetz.draw: *
      line((-3, 0), (3, 0), stroke: 0.5pt, mark: (end: ">"))
      line((0, -3), (0, 3), stroke: 0.5pt, mark: (end: ">"))
      content((3, -0.3), $x$)
      content((-0.3, 3), $y$)
      // Courbe C_2
      bezier((-2.5, -2), (-1.5, 2.5), (-2, 0), (-1.7, 2), stroke: red + 1.2pt)
      bezier((-0.5, -2.5), (1, 1), (-0.2, -1), (0.5, 0.5), stroke: red + 1.2pt)
      bezier((1, 1), (2.5, 0.5), (1.5, 0.8), (2, 0.6), stroke: red + 1.2pt)
      content((2.5, 2.5), $C_2$)
    })
  ],
  [
    #cetz.canvas({
      import cetz.draw: *
      line((-4, 0), (4, 0), stroke: 0.5pt, mark: (end: ">"))
      line((0, -1.5), (0, 4), stroke: 0.5pt, mark: (end: ">"))
      content((4, -0.3), $x$)
      content((-0.3, 4), $y$)
      // Courbe C_3 forme cloche
      bezier((-3.5, 0.5), (-1, 3), (-2.5, 1), (-1.5, 2.5), stroke: red + 1.2pt)
      bezier((-1, 3), (1, 0.5), (-0.5, 3), (0.5, 1), stroke: red + 1.2pt)
      bezier((1, 0.5), (3.5, 0.3), (2, 0.4), (3, 0.35), stroke: red + 1.2pt)
      content((3, 3.5), $C_3$)
    })
  ]
)

#grid(
  columns: (1fr, 1fr, 1fr),
  gutter: 1em,
  [
    #cetz.canvas({
      import cetz.draw: *
      line((-4, 0), (5, 0), stroke: 0.5pt, mark: (end: ">"))
      line((0, -3), (0, 4), stroke: 0.5pt, mark: (end: ">"))
      content((5, -0.3), $x$)
      content((-0.3, 4), $y$)
      // Courbe C_4
      bezier((-3.5, 2.5), (-1.5, 3.5), (-2.5, 2.8), (-2, 3.3), stroke: red + 1.2pt)
      bezier((-1, -2.5), (0.5, 1.5), (-0.5, -1), (0, 0.5), stroke: red + 1.2pt)
      bezier((0.5, 1.5), (2, 2), (1, 1.7), (1.5, 1.9), stroke: red + 1.2pt)
      bezier((2, 2), (4.5, 2), (3, 2), (4, 2), stroke: red + 1.2pt)
      content((4, 3.5), $C_4$)
    })
  ],
  [
    #cetz.canvas({
      import cetz.draw: *
      line((-3, 0), (4, 0), stroke: 0.5pt, mark: (end: ">"))
      line((0, -3), (0, 4), stroke: 0.5pt, mark: (end: ">"))
      content((4, -0.3), $x$)
      content((-0.3, 4), $y$)
      // Courbe C_5
      bezier((-2.5, 3), (-1.5, 3.5), (-2, 3.1), (-1.7, 3.3), stroke: red + 1.2pt)
      bezier((-1, -2), (0.5, 1), (-0.5, -0.5), (0, 0.5), stroke: red + 1.2pt)
      bezier((0.5, 1), (1.5, 2), (0.8, 1.3), (1.2, 1.7), stroke: red + 1.2pt)
      bezier((1.5, 2), (3.5, 2), (2, 2), (3, 2), stroke: red + 1.2pt)
      content((3, 3.5), $C_5$)
    })
  ],
  [
    #cetz.canvas({
      import cetz.draw: *
      line((-3, 0), (4, 0), stroke: 0.5pt, mark: (end: ">"))
      line((0, -2), (0, 4), stroke: 0.5pt, mark: (end: ">"))
      content((4, -0.3), $x$)
      content((-0.3, 4), $y$)
      // Courbe C_6
      bezier((-2.5, 0.5), (-1.5, 1.5), (-2, 0.8), (-1.7, 1.2), stroke: red + 1.2pt)
      bezier((-1, -1.5), (0, 0), (-0.5, -0.5), (-0.2, -0.1), stroke: red + 1.2pt)
      bezier((0, 0), (1, 0.5), (0.3, 0.1), (0.7, 0.3), stroke: red + 1.2pt)
      bezier((1, 0.5), (3.5, 0.2), (2, 0.4), (3, 0.25), stroke: red + 1.2pt)
      content((3, 3.5), $C_6$)
    })
  ]
)

Associer a chaque fonction sa courbe.

// Source: Manuel T1 p.126
==== Activite 5

On considere la fonction f definie sur $RR backslash {-2}$, par $f(x) = frac(x^2 - x - 1, x + 2)$ et on designe par C sa courbe representative dans un repere orthogonal $(O, arrow(i), arrow(j))$.

1. On se propose de determiner les reels a, b et c tels que $f(x) = a x + b + frac(c, x + 2)$, $x eq.not -2$.

#h(0.5cm) a. Determiner $lim_(x -> +infinity) frac(f(x), x)$ et en deduire la valeur de a.

#h(0.5cm) b. Determiner la valeur de c.

#h(0.5cm) c. Calculer $f(0)$ et en deduire la valeur de b.

2. Etudier f.

#h(0.5cm) a. Montrer que C admet une asymptote D au voisinage de $+infinity$ (respectivement $-infinity$) d'equation $y = x - 1$.

#h(0.5cm) b. Etudier la position relative de C et de D.

4. Tracer C et D.

5. a. Representer la fonction $g : x |-> f(-x)$.

#h(0.5cm) b. Dresser son tableau de variations.

==== Activite 6

Le volume initial d'un ballon est de $1 "m"^3$, on laisse l'air s'en echapper et on estime que, t secondes apres, le volume decroit au taux de $frac(5, 4(t+1)^2)$ $"m"^3$ / s.

$frac(5, 4(t + 1))$

1. Verifier que le volume de la balle apres t secondes est $v(t) = 1 - frac(5, 4(t + 1))$.

2. Combien de temps faut-il pour que le ballon soit vide ?

3. Etudier et representer la fonction $v : t |-> v(t)$.

4. Donner une estimation du temps necessaire pour que le volume du ballon atteigne la moitie du volume initial.

// Source: Manuel T1 p.126-127
=== 4. Fonction $sqrt(quad)$

==== Activite 1 (racine)

On considere la fonction $f : x |-> sqrt(a x + b)$, $a eq.not 0$.

1. On suppose que $a > 0$.

#h(0.5cm) Determiner $lim frac(f(x), x)$.

2. On suppose que $a < 0$.

#h(0.5cm) Determiner $lim_(x -> -infinity) frac(f(x), x)$.

// Source: Manuel T1 p.127
#block(fill: rgb("#e8f5e9"), inset: 12pt, radius: 4pt, width: 100%)[
  *Theoreme*

  Soit la fonction $f : x |-> sqrt(a x + b)$, $a eq.not 0$. Alors $frac(f(x), sqrt(x))$ tend vers zero quand x tend vers l'infini.

  On dit que la courbe representative C de f dans un repere $(O, arrow(i), arrow(j))$ admet une branche parabolique de direction $(O, arrow(i))$ au voisinage de l'infini.
]

==== Activite 2

On considere la fonction $f : x |-> sqrt(-2x + 4)$ et on designe par C sa courbe representative dans un repere $(O, arrow(i), arrow(j))$.

1. Determiner l'ensemble de definition de f.

2. Etudier f.

3. a. Etudier la derivabilite de f a gauche en 2.

#h(0.5cm) b. En deduire que C admet une demi-tangente verticale T au point d'abscisse 2.

#h(0.5cm) c. Tracer C et T.

5. En deduire les representations graphiques de chacune des fonctions $-f$ et $g : x |-> f(x - 1) - 2$.

==== Activite 3

On considere les fonctions

$f : ]-1, +infinity[ -> RR$ #h(2cm) et #h(2cm) $g : ]-frac(1, 4), +infinity[ -> RR$

$x |-> x - 2x - 1$ #h(4cm) $x |-> sqrt(4x + 1)$

On designe par $C_f$ et $C_g$ leurs courbes representatives dans un repere orthonormal $(O, arrow(i), arrow(j))$.

1. Tracer $C_f$ et $C_g$.

2. On se propose de montrer que $C_f$ et $C_g$ sont symetriques par rapport a la premiere bissectrice $Delta$ d'equation $y = x$.

Pour tout point $M(x, y)$, on note $N = S_Delta (M)$.

#h(0.5cm) a. Exprimer les coordonnees de N en fonction de celles de M.

#h(0.5cm) b. Soit $M_0 (x_0, f(x_0))$ ou $x_0 gt.eq 1$. Verifier que N est un point de $C_g$.

#h(0.5cm) c. Reciproquement, soit $M_0 (x_0, g(x_0))$ ou $x_0 gt.eq -frac(1, 4)$. Verifier que M est un point de $C_f$.

#h(0.5cm) d. Conclure.

==== Activite 4

On considere la fonction $f : x |-> sqrt(-x^2 - x - 6)$ et on designe par C sa courbe representative dans un repere orthogonal $(O, arrow(i), arrow(j))$.

1. Determiner l'ensemble de definition de f.

2. Etudier f.

3. a. Etudier la derivabilite de f a gauche en $-2$ et a droite en 3.

#h(0.5cm) b. En deduire que C admet deux demi-tangentes verticales que l'on precisera.

// Source: Manuel T1 p.128
4. a. Determiner la forme canonique de $x^2 - x - 6$.

#h(0.5cm) b. Determiner aussi $lim_(x -> 0) f(x) = x - frac(1, 2)$ et $lim_(x -> 0) f(x) = x + frac(1, 2)$.

#h(0.5cm) c. En deduire que la courbe C admet une asymptote oblique au voisinage de $+infinity$ et une autre au voisinage de $-infinity$.

5. Tracer C et ses deux asymptotes.

6. En deduire la representation graphique de la fonction $g : x |-> f(-|x|)$.

==== Activite 5

On considere la fonction $f : x |-> sqrt(-4x + 5)$ et on designe par C sa courbe representative dans un repere $(O, arrow(i), arrow(j))$.

1. Determiner l'ensemble de definition de f.

2. Etudier f.

3. Soit $Delta$ la droite d'equation $x = 2$. Montrer que $Delta$ est un axe de symetrie de C.

4. a. Determiner la forme canonique de $x^2 - 4x + 5$.

#h(0.5cm) b. Determiner aussi $lim f(x) - (x - 2)$ et $lim f(x) + (x - 2)$.

#h(0.5cm) c. En deduire que la courbe C admet une asymptote oblique au voisinage de $+infinity$ et une autre au voisinage de $-infinity$.

5. Tracer C, D et DF.

==== Activite 6

On considere la fonction $f : x |-> sqrt(1 - x^2)$ et on designe par C sa courbe representative dans un repere $(O, arrow(i), arrow(j))$.

1. Determiner l'ensemble de definition de f.

2. Etudier f.

3. a. Etudier la derivabilite de f a droite en $-1$ et a gauche en 1.

#h(0.5cm) b. En deduire que C admet deux demi-tangentes verticales que l'on precisera.

4. Verifier que D et DF sont symetriques par rapport a $Delta$.

5. Tracer C, D et DF.

==== Activite 7 (Activite 8 p.128)

On considere les fonctions f, g et h definies sur $[0, 1]$ par

$f(x) = sqrt(x)$, $g(x) = 2 sqrt(2x - x^2)$ et $h(x) = x^2$ et on designe par $C_f$, $C_g$ et $C_h$ leurs courbes representatives dans un repere $(O, arrow(i), arrow(j))$.

1. Etudier chacune des fonctions f, g et h.

3. Montrer que $g(x) = f(x) circ h(x)$, $x in [0, 1]$.

4. Tracer $C_f$, $C_g$ et $C_h$.

4. Determiner une valeur approchee a $10^(-3)$ pres de $root(4, 0.000008)$.

// Source: Manuel T1 p.129
== QCM - Vrai ou Faux

=== QCM

Cocher la reponse exacte.

1. Le plan est muni d'un repere. La courbe representative de la fonction $f : x |-> frac(1, x + 2) - frac(1, 2)$ admet pour centre de symetrie le point

#h(1cm) $square$ $O(0, 0)$ #h(2cm) $square$ $A(-2, 0)$ #h(2cm) $square$ $B(2, 0)$.

2. Le plan est muni d'un repere orthogonal. La courbe representative de la fonction $f : x |-> sqrt(1 - x^2)$ admet pour axe de symetrie la droite d'equation

#h(1cm) $square$ $x = 0$ #h(2cm) $square$ $Delta x = frac(3, 2)$ #h(2cm) $square$ $x = 1$.

3. Le plan est muni d'un repere. La courbe representative de la fonction $f : x |-> x^3 - 2x^2 + 15$ est

#cetz.canvas({
  import cetz.draw: *
  // Trois petits graphiques pour les choix
  // Graphique 1
  line((-1, 0), (3, 0), stroke: 0.5pt, mark: (end: ">"))
  line((0, -1), (0, 2), stroke: 0.5pt, mark: (end: ">"))
  bezier((0, 0.5), (1, 1.5), (0.5, 0.8), (0.8, 1.3), stroke: blue + 1pt)
  bezier((1, 1.5), (2.5, 0.3), (1.5, 1.5), (2, 0.5), stroke: blue + 1pt)
})

4. Soit la fonction $f : x |-> frac(3x^2 - 5x + 3, x - 1)$ et les reels a, b et c tels que $f(x) = a x + b + frac(c, x - 1)$, $x eq.not 1$.

#h(1cm) $square$ $a = 3$ #h(2cm) $square$ $c = -1$ #h(2cm) $square$ $a + b + c = 4$

5. Le plan est muni d'un repere. Soit f la fonction definie sur $D = ... $ par $f(x) = sqrt(4 + x^2)$.

et $Delta$ la droite d'equation $y = x$. La courbe representative de la fonction f

#h(1cm) $square$ est au dessus de D #h(1.5cm) $square$ est en dessous de D #h(1.5cm) $square$ coupe D.


// Source: Corrigé T2 p.1
=== Corrigé du QCM

*1)* *(a)* $O(0,0)$ est un centre de symétrie pour $C_f$. #h(1em) ($f$ est impaire)

*2)* *(b)* la droite d'équation $x = f(x) = frac(1,2)$ est un axe de symétrie pour $C_f$.

*3)* *(c)* $C_3$ est la courbe représentative de $f$. #h(1em) ($lim_(x arrow +infinity) f(x) = +infinity$)

*4)* *(a)* $a = 3$ #h(2em) ($f(x) = 3x - 2 + frac(1, x-1)$)

*5)* *(a)* $C_f$ est au dessus de $D$. #h(1em) ($4 + x^2 > x^2 arrow sqrt(4+x^2) > |x| gt.eq x arrow f(x) gt.eq x$)


=== Vrai - Faux

Repondre par vrai ou faux en justifiant la reponse.

Soit f une fonction definie sur un ensemble D et C sa courbe representative dans un repere orthogonal.

1. Si $f(2a - x) = f(x)$ alors la droite d'equation $x = a$ est un axe de symetrie de C.

2. Si f est une fonction impaire alors la courbe representative de la fonction $x |-> f(1 + x)$ admet un centre de symetrie.

3. Si f est une fonction paire alors la courbe representative de la fonction $x |-> f(1 + x)$ admet un axe de symetrie.

4. La representation graphique de la fonction $x |-> f(x + 1)$ s'obtient par une translation de C.

5. La representation graphique de la fonction $x |-> f(x) + 1$ s'obtient par une translation de C.


// Source: Corrigé T2 p.1-2
=== Corrigé Vrai – Faux

*1) Faux*

Aussi, il faux que : si $x in D$ _alors_ $(2a - x) in D$

Contre exemple : $f(x) = sqrt(x^2 - 2x)$ , $D = [2, +infinity[$

$f(2 times 1 - x) = f(x)$, mais la droite d'équation $x = 1$ n'est pas un axe de symétrie pour $C_f$.

*2) Vrai*

En effet : soit $g(x) = f(1 + x)$; #h(2em) $C_g = t_(- arrow(i))(C_f)$

Comme $O(0,0)$ est un centre de symétrie pour $C_f$ alors $I(-1,0) = t_(- arrow(i))(O)$ est un centre de symétrie pour $C_g$.

*3) Vrai*

En effet : soit $h(x) = f(1 + x)$; #h(2em) $C_h = t_(- arrow(i))(C_f)$

Comme $Delta : x = 0$ est un axe de symétrie pour $C_f$ alors $t_(- arrow(i))(Delta) = Delta' : x = -1$ est un axe de symétrie pour $C_g$.

*4) Faux*

Par exemple si $f$ est positive alors $C_(|f|) = C_f$

// Source: Corrigé T2 p.2
*5) Faux*

En effet : _soit_ $g(x) = f(|x|)$

$D_f = D_1 union D_2$ _avec_ $bold(D_1)$ $tack.t$ $_+$

Pour $x in D_1$, #h(1em) $g(x) = f(x)$

Remarque : si $D_1 = emptyset$ _alors_ $g$ _n'est pas définie_

Contre exemple $f(x) = x$


// Source: Manuel T1 p.130
== Mobiliser ses competences

=== Situation 1 : La cubique d'Agnesi

Soit deux points O et A tels que OA et $sigma^2$ le cercle de diametre OA. Soit N un point de $sigma^2$ distinct de O.

La tangente a $sigma^2$ en A, coupe la droite (ON) en un point P.

La parallele a la droite (AP) passant par N et la perpendiculaire a la droite (AP) passant par P se coupent en M.

On se propose de construire $sigma^2$ : l'ensemble des points M lorsque N varie sur le cercle $sigma^2$.

On considere un repere orthonorme tel que $O A = 4 arrow(j)$.

1. a. Determiner une equation du cercle $sigma^2$.

#h(0.5cm) b. On designe par t l'abscisse de N et par $(x, y)$ les coordonnees de M.

#h(0.5cm) Montrer que $x = 4t$ .

#h(0.5cm) c. En deduire que $y = frac(16, x^2 + 4)$.

2. Soit f la fonction definie sur $RR$ par $f(x) = frac(16, x^2 + 4)$.

#h(0.5cm) a. Etudier f.

#h(0.5cm) b. Tracer la courbe $sigma^2$ et le cercle $sigma^2$.

$sigma^2$ est appelee, la cubique d'Agnesi, au nom d'une mathematicienne italienne (1718-1799).

=== Situation 2 : courbe asymptote

On considere les fonctions $f : x |-> 4 + 3 frac(1, sqrt(x))$, $g : x |-> frac(4x + 2, x - 1)$ et on designe par $C_f$ et $C_g$ leurs courbes representatives dans un repere $(O, arrow(i), arrow(j))$.

1. a. Determiner l'ensemble de definition de f.

#h(0.5cm) b. Verifier que la fonction f est stricte.

#h(0.5cm) c. Etudier f sur $[0, +infinity[$.

#h(0.5cm) d. Calculer $lim_(x -> +infinity) f(x - 3) = 0$ et en deduire que $C_f$ admet une asymptote au voisinage de $+infinity$.

Que peut-on dire alors de la courbe?

2. a. Determiner l'ensemble de definition de g.

#h(0.5cm) b. On se propose de determiner les reels a et b tels que $g(x) = a + frac(b, ...)$.

#h(0.5cm) Calculer $lim_(x -> +infinity) g(x) = 1$ et en deduire la valeur de b.

#h(0.5cm) b. Calculer $lim g(x)$ et en deduire la valeur de a.

3. Tracer $C_f$ et $C_g$.

#h(0.5cm) a. Verifier graphiquement que l'equation $f(x) = g(x)$ admet une seule solution que l'on notera $alpha$.

#h(0.5cm) Donner une valeur approchee de $alpha$ a 0,1 pres.

#h(0.5cm) b. Representer dans le repere $(O, arrow(i), arrow(j))$ la

la fonction h definie sur $[frac(1, 3), +infinity[$ par $h(x) = frac(x, sqrt(x + 1) + sqrt(x + 1))$.


// Source: Corrigé T2 p.2-5
=== Corrigé – Mobiliser ses compétences

==== Situation 1 :

1) a) $(C)$ est de centre $I(0,2)$ de rayon $R = 2$ d'où $(C): x^2 + (y-2)^2 = 4$

#h(1em) b) $x_N = t$ _et_ $M(x,y)$ #h(1em) _d'ou_ $N(t,y)$ _et_ $P(x,4)$ _ce qui donne_ $arrow(O N) vec(t, y)$ _et_ $arrow(O P) vec(x, 4)$

$O$, $N$ _et_ $P$ sont alignés donc $mat(delim: "|", t, x; y, 4) = 4t - x y = 0$

Par suite $x y = 4t$

#h(1em) c) $N(frac(x y, 4), y) in (C) backslash {O} arrow.double (frac(x y, 4))^2 + (y - 2)^2 = 4$

$ arrow.double frac(x^2 y^2, 16) + y^2 - 4x = 0 $

$ arrow.double y [frac(x^2, 16) y + y - 4] = 0 $

$ arrow.double frac(x^2, 16) y + y - 4 #h(2em) "car" y eq.not 0 $

$ arrow.double (1 + frac(x^2, 16)) y = 4 $

D'où #h(2em) $y = frac(64, x^2 + 16)$

2) $f(x) = frac(64, x^2 + 16)$ ; $D_f = I R$ #h(2em) ($f$ est paire)

// Source: Corrigé T2 p.3
a) $f$ est dérivable sur $I R$ et $f'(x) = frac(-128x, (x^2+16)^2)$

$lim_(x arrow -infinity) f(x) = lim_(x arrow +infinity) f(x) = 0$

b) #emph[Voir figure]

// Figure: Courbe de f(x) = 64/(x²+16) avec un cercle C
// Le graphe montre une courbe en cloche passant par (0,4), symétrique par rapport à l'axe des ordonnées
// avec un cercle de centre I(0,2) et de rayon 2

==== Situation 2 :

$f(x) = sqrt(x^2 + 3)$ ; #h(2em) $bold(g)(bold(x)) = frac(4x+2, 6x-3)$

1) a) $D_f = RR$ #h(2em) _car_ $x^2 + 3 > 0$ pour tout $x in RR$

#h(1em) b) pour tout $x in D_f = RR$ on a $(-x) in D_f$ et $f(-x) = sqrt((-x)^2 + 3) = sqrt(x^2 + 3) = f(x)$

D'où $f$ est une fonction paire.

c) $f$ est dérivable sur $[0, +infinity[$ et $f'(x) = frac(2x, 2sqrt(x^2+3)) = frac(x, sqrt(x^2+3)) gt.eq 0$

$lim_(x arrow +infinity) f(x) = +infinity$ car $lim_(x arrow +infinity)(x^2 + 3) = +infinity$

#align(center)[
  #table(
    columns: 4,
    align: center,
    [$x$], [$0$], [], [$+infinity$],
    [$f'(x)$], [$0$], [$+$], [],
    [$f(x)$], [], [croissante $arrow$], [$+infinity$],
  )
  $f(x)$: de $sqrt(3)$ vers $+infinity$
]

// Source: Corrigé T2 p.4
d) $lim_(x arrow +infinity)(f(x) - x) = lim_(x arrow +infinity)(sqrt(x^2+3) - x) = lim_(x arrow +infinity) frac((x^2+3)-x^2, sqrt(x^2+3)+x) = lim_(x arrow +infinity) frac(3, sqrt(x^2+3)+x) = 0$

d'où la droite d'équation $y = x$ est une asymptote à $(C_f)$ au voisinage de $+infinity$

2) a) $bold(D)_g = I R backslash {frac(1,2)}$

#h(1em) b) \* $g(x) = a + frac(b, 6x-3)$ $arrow.double$ $(6x-3) dot g(x) = a dot (6x-3) + b$

$lim_(x arrow frac(1,2))(6x-3) dot g(x) = b$ #h(1em) or #h(1em) $(6x-3) dot g(x) = 4x + 2$

D'ou #h(1em) $lim_(x arrow frac(1,2))(6x-3) dot g(x) = 4 times frac(1,2) + 2 = 4$ #h(2em) par suite #h(1em) $boxed(b = 4)$

\* $lim_(x arrow +infinity) g(x) = lim_(x arrow +infinity)(a + frac(b, 6x-3)) = a$ #h(1em) d'autre part #h(1em) $lim_(x arrow +infinity) g(x) = lim_(x arrow +infinity) frac(4x+2, 6x-3) = lim_(x arrow +infinity) frac(4x, 6x) = frac(2,3)$

Par suite #h(1em) $boxed(a = frac(2,3))$

c) $g(x) = frac(2,3) + frac(4, 6x-3)$

$g$ est dérivable sur $I R backslash {frac(1,2)}$ #h(1em) et :
$ bold(g)'(bold(x)) = frac(-24, (6x-3)^2) < 0 $

$lim_(x arrow +infinity) g(x) = lim_(x arrow +infinity) frac(4x+2, 6x-3) = lim_(x arrow +infinity) frac(4x, 6x) = frac(2,3)$

$lim_(x arrow -infinity) g(x) = lim_(x arrow -infinity) frac(4x+2, 6x-3) = lim_(x arrow -infinity) frac(4x, 6x) = frac(2,3)$

#align(center)[
  #table(
    columns: 5,
    align: center,
    [$x$], [$-infinity$], [], [$frac(1,2)$], [$+infinity$],
    [$g'(x)$], [], [$-$], [], [$-$],
    [$g(x)$], [$frac(2,3)$], [$arrow.b$], [$-infinity | +infinity$], [$frac(2,3)$],
  )
]

$lim_(x arrow (frac(1,2))^+) g(x) = (frac(2,3) + frac(4, 6(x - frac(1,2)))) = +infinity$ #h(2em) et #h(2em) $lim_(x arrow (frac(1,2))^-) g(x) = -infinity$

// Source: Corrigé T2 p.5
\* les droites d'équations respectives #h(1em) $x = frac(1,2)$ et $y = frac(2,3)$ sont des asymptotes à $(C_g)$.

3) #emph[Voir figure — Graphe de $C_f$, $C_g$ avec les asymptotes $x = 1\/2$ et $y = 2\/3$, et la droite $y = x$]

4) a) $(C_f)$ _et_ $(C_g)$ se coupe en un unique point, d'où l'équation : $f(x) = g(x)$

admet une unique solution $alpha$

b) graphiquement : $alpha approx 1$ #h(2em) (on pourra aussi vérifier que $f(1) = g(1) = 2$ donc $alpha = 1$)

c) $h(x) = cases(g(x) "si" x in ]frac(1,2)\, alpha], f(x) "si" x in ]alpha\, +infinity[)$

// Figure: Graphe de h avec asymptote x=1/2, droite y=x

// Source: Manuel T1 p.131
== Exercices et problemes


=== Exercice 1

On considere les fonctions f et g definies par

$f : x |-> x + 1$ et $g(x) = x^3 - x^2 - 2x + 2$.

1. Etudier f. #h(5cm) 2. Montrer que le point $I(1, 0)$ est un centre de symetrie de $C$.

On designe par $C_f$ et $C_g$ leurs courbes representatives dans un repere orthogonal $(O, arrow(i), arrow(j))$.

1. Etudier la position relative de $C_f$ et $C_g$.

2. Determiner C l'ensemble des solutions f des segments $[M N]$, lorsque M et N prennent toutes les valeurs de la courbe dans $RR$.


// Source: Corrigé T2 p.6-7
==== Corrigé

$f(x) - g(x) = 2x^2 + 3x - 2$

$Delta = 25$ ; $x' = -2$ _et_ $x'' = frac(1,2)$

#align(center)[
  #table(
    columns: 6,
    align: center,
    [$x$], [$-infinity$], [$-2$], [], [$frac(1,2)$], [$+infinity$],
    [$f(x) - g(x)$], [$+$], [$0$], [$-$], [$0$], [$+$],
    [Position relative], [$C_f$ est au dessus de $C_g$], [], [$C_f$ est au dessous de $C_g$], [], [$C_f$ est au dessus de $C_g$],
  )
]

2) $M(m, f(m))$ #h(2em) _et_ #h(1em) $N(m, g(m))$

$I$ le milieu de $[M N]$ #h(2em) d'où #h(1em) $I(m, frac(f(m)+g(m), 2))$ c'est-à-dire #h(1em) $I(m, -frac(1,2) m + 2)$

Posons $I(x,y)$ #h(1em) avec $cases(x = m, y = -frac(1,2) m + 2)$ #h(1em) $m in I R$

Ce qui donne #h(1em) $y = -frac(1,2) x + 2$ #h(1em) d'où $(C)$ est la droite d'équation : #h(1em) $y = -frac(1,2) x + 2$

3) #emph[Voir figure — Graphe montrant $C_f$, $C_g$ et la droite $(C)$]

// Source: Corrigé T2 p.7

=== Exercice 2

Soit la fonction $f : x |-> x^3 - 3x^2 - 3x + C$ ou C sa courbe representative dans un repere $(O, arrow(i), arrow(j))$.

1. Etudier f.

2. Etudier la derivabilite de f en $-2$ et en 2.

3. Tracer C.

4. Determiner graphiquement suivant le reel m, le nombre de solutions de l'equation $f(x) = m$.


// Source: Corrigé T2 p.7-9
==== Corrigé

1) $f(x) = |x^2 - 4| - |x - 2|$

#align(center)[
  #table(
    columns: 5,
    align: center,
    [$x$], [$-infinity$], [$-2$], [$2$], [$+infinity$],
    [$x^2 - 4$], [$+$], [$0$], [$-$], [$0$], [$+$],
    [$x - 2$], [], [$-$], [], [$0$], [$+$],
  )
]

\* $f$ est définie et continue sur $I R$

- pour $x in ]-infinity, -2]$

  $f(x) = (x^2 - 4) + (x - 2) = x^2 + x - 6$

- pour $x in ]-2, 2]$, #h(1em) $f(x) = -(x^2 - 4) + (x - 2) = -x^2 + x + 2$

- pour $x in ]2, +infinity[$, #h(1em) $f(x) = (x^2 - 4) - (x - 2) = x^2 - x - 2$

Par suite : #h(1em) $f(x) = cases(x^2 + x - 6 "si" x lt.eq -2, -x^2 + x + 2 "si" -2 < x lt.eq 2, x^2 - x - 2 "si" x > 2)$

\* $lim_(x arrow -infinity) bold(f(x)) = lim_(x arrow -infinity)(x^2 + x - 6) = lim_(x arrow -infinity) x^2 = +infinity$ et

$lim_(x arrow +infinity) bold(f(x)) = lim_(x arrow +infinity)(x^2 + x - 6) = lim_(x arrow +infinity) x^2 = +infinity$

2) $blacktriangleright$ dérivabilité en $(-2)$

- $lim_(x arrow (-2)^-) frac(f(x) - f(-2), x+2) = lim_(x arrow (-2)^-) frac((x^2 + x - 6) - (-4), x+2) = lim_(x arrow (-2)^-) frac(x^2 + x - 2, x+2)$

  $= lim_(x arrow (-2)^-) frac((x+2)(x-1), x+2) = lim_(x arrow (-2)^-) (x-1) = -3$

Ainsi : $f$ est dérivable à gauche en $(-2)$ et $f'_g(-2) = -3$

- $lim_(x arrow (-2)^+) frac(f(x) - f(-2), x+2) = lim_(x arrow (-2)^+) frac((-x^2 + x + 2) - (-4), x+2) = lim_(x arrow (-2)^-) frac(-x^2 + x + 6, x+2)$

  $= lim_(x arrow (-2)^-) frac(-(x+2)(x-3), x+2) = lim_(x arrow (-2)^-) (-x+3) = 5$

Ainsi : $f$ est dérivable à droite en $(-2)$ et $f'_d(-2) = 5$

Conclusion #h(1em) $f'_d(-2) eq.not f'_g(-2)$ #h(2em) $boxed("d'où " f "n'est pas dérivable en " (-2))$

// Source: Corrigé T2 p.8
$blacktriangleright$ dérivabilité en 2 :

- $lim_(x arrow 2^-) frac(f(x) - f(2), x-2) = lim_(x arrow 2^-) frac((-x^2 + x + 2) - 0, x-2) = lim_(x arrow 2^-) frac(-x^2 + x + 2, x-2)$

  $= lim_(x arrow 2^-) frac(-(x-2)(x+1), x-2) = lim_(x arrow 2^-) (-x-1) = -3$

$f$ est dérivable à gauche en 2 et $f'_g(2) = -3$

- $lim_(x arrow 2^+) frac(f(x) - f(2), x-2) = lim_(x arrow 2^+) frac((x^2 - x - 2) - 0, x-2) = lim_(x arrow 2^+) frac(x^2 - x - 2, x-2)$

  $= lim_(x arrow 2^+) frac((x-2)(x+1), x-2) = lim_(x arrow 2^+) (x+1) = 3$

D'où $f$ est dérivable à droite en 2 et $f'_d(2) = 3$

Conclusion #h(1em) $f'_d(2) eq.not f'_g(2)$ #h(2em) d'où $f$ n'est pas dérivable en 2.

3) $f$ est dérivable sur $RR backslash {-2, 2}$ et $f'(x) = cases(2x + 1 "si" x < -2, -2x + 1 "si" -2 < x < 2, 2x - 1 "si" x > 2)$

#align(center)[
  #table(
    columns: 7,
    align: center,
    [$x$], [$-infinity$], [$-2$], [$1\/2$], [], [$2$], [$+infinity$],
    [$f'(x)$], [$-$], [$||$], [$+$], [$0$], [$-$], [$||$], [$+$],
    [$f(x)$], [$+infinity$], [$arrow.b$], [$-4$], [$arrow.t$], [$9\/4$], [$arrow.b$], [$0$], [$arrow.t$], [$+infinity$],
  )
]

$lim_(x arrow -infinity) frac(f(x), x) = lim_(x arrow -infinity) frac(x^2 + x - 6, x) = lim_(x arrow -infinity) frac(x^2, x) = lim_(x arrow -infinity) x = -infinity$

$lim_(x arrow +infinity) frac(f(x), x) = lim_(x arrow +infinity) frac(x^2 - x - 2, x) = lim_(x arrow +infinity) frac(x^2, x) = lim_(x arrow +infinity) x = +infinity$

$(C)$ admet deux branches paraboliques de direction $(O, arrow(j))$ aux voisinage de $+infinity$ _et_ $-infinity$.

// Figure: Graphe de f avec points anguleux en x=-2 et x=2

// Source: Corrigé T2 p.9
4) \* si $m in ]-infinity, -4[$, l'équation $f(x) = m$ n'admet pas de solutions.

\* si $m = -4$, l'équation $f(x) = m$ admet unique solution.

\* si $m in ]-4, 0[ union ]frac(9,4), +infinity[$, l'équation $f(x) = m$ admet deux solutions.

\* si $m = 0$ ou $m = 9\/4$, l'équation $f(x) = m$ admet trois solutions.

\* si $m in ]0, 9\/4[$, l'équation $f(x) = m$ admet quatre solutions.


=== Exercice 3

1. Tracer dans un meme repere orthonormal $(O, arrow(i), arrow(j))$ les courbes representatives de la fonction $x |-> x^2 - 1$ et $x |-> -x^2 + 1$.

2. Montrer qu'on ne peut construire un triangle ABC tel que $A B = B(x)$, $A C = g(x)$ et $B C = h(x)$.

Quel est la raison ?

#h(0.5cm) $A C = B(x) + B C^2$, $B C = ...$ on en deplaisant en $A B = A C$ que $"ABC"$ peut etre le triangle "ABC" peut-il etre isocele ?


// Source: Corrigé T2 p.9-10
==== Corrigé

1) $-$ $(C_f)$ est une parabole de sommet $S(0, -1)$ d'axe la droite d'équation : $x = 0$

$-$ $(C_g)$ est une parabole de sommet $S(-1\/2, 3\/4)$ d'axe la droite d'équation : $x = -1\/2$

$-$ $(C_h)$ est une droite.

// Figure: Graphe montrant Cf (parabole), Cg (parabole) et Ch (droite)

2) \* $f(x) + g(x) = 2x^2 + x = x(2x + 1)$

Comme $x > 1$ _alors_ $x(2x + 1) > 2x + 1$ #h(2em) d'où #h(1em) $boxed(f(x) + g(x) > h(x))$

// Source: Corrigé T2 p.10
\* $f(x) + h(x) = x^2 + 2x$

$x > 1 arrow.double x^2 + 2x > x^2 + x + 1$

#h(2em) d'où #h(1em) $boxed(f(x) + h(x) gt.eq g(x))$

\* pour $x > 1$, on a : $x^2 + 3x + 2 > x^2 - 1$

#h(2em) d'où #h(1em) $boxed(g(x) + h(x) > f(x))$

\* de plus $f(x) > 0$, $g(x) > 0$ et $h(x) > 0$ _pour_ $x > 1$

Donc on peut construire un triangle $A B C$ tels que : $B C = f(x)$, $A C = g(x)$ _et_ $A B = h(x)$

3) $A C^2 = [g(x)]^2 = (x^2 + x + 1)^2 = x^4 + 2x^3 + 3x^2 + 2x + 1$

$B A^2 + B C^2 = [h(x)]^2 + [f(x)]^2 = (2x+1)^2 + (x^2 - 1)^2$

Ce qui donne $B A^2 + B C^2 = x^4 + 2x^2 + 4x + 2$

On a d'après la formule d'El-Kashi : $A C^2 = B A^2 + B C^2 - 2 dot B A times B C times cos(hat(A B C))$

$arrow.double x^4 + 2x^3 + 3x^2 + 2x + 1 = x^4 + 2x^2 + 4x + 2 - 2 dot (2x+1)(x^2 - 1) dot cos(hat(A B C))$

$arrow.double 2x^3 + x^2 - 2x - 1 = -2(2x+1)(x^2 - 1) dot cos(hat(A B C))$

$arrow.double (2x+1)(x^2 - 1) = -2(2x+1)(x^2 - 1) dot cos(hat(A B C))$

$arrow.double cos(hat(A B C)) = -frac(1,2)$ #h(2em) d'où $hat(A B C) = frac(2pi, 3)$ (angle constant indépendant de $x$)

4) $A B C$ est isocèle pour $B A = B C$

$B A = B C arrow.l.r.double f(x) = h(x)$

$arrow.l.r.double x^2 - 1 = 2x + 1$

$arrow.l.r.double x^2 - 2x + 1 = 3$

$arrow.l.r.double x - 1 = -sqrt(3)$ #h(1em) _ou_ #h(1em) $x - 1 = sqrt(3)$ $arrow.l.r.double$ $x = 1 - sqrt(3)$ _ou_ $x = 1 + sqrt(3)$

$arrow.l.r.double x = 1 + sqrt(3)$ #h(2em) _car_ $x > 1$

Finalement #h(1em) $A B C$ _est isocèle pour_ $x = 1 + sqrt(3)$


=== Exercice 4

Soit la fonction f definie sur $RR$ par $f(x) = x^4 - 4x + 3$.

C sa courbe representative dans un repere orthonormal.

1. Etudier f et tracer C.

2. a. Montrer que l'equation $f(x) = 0$ admet exactement deux solutions.

#h(0.5cm) b. Donner une valeur approchee a $10^(-1)$ pres de chacune de ces solutions.


// Source: Corrigé T2 p.10-12
==== Corrigé

1) $f(x) = -x^3 + 3x + 1$

\* $f$ est définie et continue sur tout $RR$.

// Source: Corrigé T2 p.11
\* $f$ est dérivable sur $RR$ et $f'(x) = -3x^2 + 3 = -3(x^2 - 1)$

$lim_(x arrow -infinity) f(x) = lim_(x arrow -infinity)(-x^3) = +infinity$

$lim_(x arrow +infinity) f(x) = lim_(x arrow +infinity)(-x^3) = -infinity$

#align(center)[
  #table(
    columns: 6,
    align: center,
    [$x$], [$-infinity$], [$-1$], [], [$1$], [$+infinity$],
    [$f'(x)$], [$-$], [$0$], [$+$], [$0$], [$-$],
    [$f(x)$], [$+infinity$], [$arrow.b -1$], [$arrow.t$], [$3 arrow.b$], [$-infinity$],
  )
]

\*

$lim_(x arrow -infinity) frac(f(x), x) = lim_(x arrow -infinity) frac(-x^3, x) = lim_(x arrow -infinity) (-x^2) = -infinity$

$lim_(x arrow +infinity) frac(f(x), x) = lim_(x arrow +infinity) frac(-x^3, x) = lim_(x arrow +infinity) (-x^2) = -infinity$

d'ou $(C)$ admet deux branches paraboliques de direction $(O, arrow(j))$ aux voisinage de $+infinity$ _et_ $-infinity$.

// Figure: Graphe de f avec maximum local 3 en x=1 et minimum local -1 en x=-1

2) a) l'axe des abscisses coupe $(C)$ en trois points distincts d'où l'équation $f(x) = 0$ admet exactement trois solutions distinctes dans $RR$.

b) \* $f$ est continue sur $[-2, -1]$ et $f(-2) times f(-1) = -3 < 0$

d'où l'équation $f(x) = 0$ admet une solution $alpha_1 in [-2, -1]$

Avec la calculatrice $arrow$ $f(-1,6) times f(-1,5) approx (0,296) times (-0,125) < 0$

#h(2em) _d'ou_ #h(1em) $boxed(-1,6 lt.eq alpha_1 lt.eq -1,5)$

\* $f$ est continue sur $[-0,4 ; -0,3]$ et $f(-0,4) times f(-0,3) = (-0,136)(0,127) < 0$

d'où l'équation $f(x) = 0$ admet une solution $alpha_2 in [-0,4 ; -0,3]$ #h(1em) d'où #h(1em) $boxed(-0,4 lt.eq alpha_2 lt.eq -0,3)$

\* $f$ est continue sur $[1,8 ; 1,9]$ et $f(1,8) times f(1,9) = (0,568)(-0,159) < 0$

d'où l'équation $f(x) = 0$ admet une solution $alpha_3 in [1,8 ; 1,9]$ d'où #h(1em) $boxed(1,8 lt.eq alpha_3 lt.eq 1,9)$

// Source: Corrigé T2 p.12

=== Exercice 5

Soit f la fonction definie sur $RR$ par

$ f(x) = frac(x, x^2 + 1) $

et on designe par C sa courbe representative dans un repere $(O, arrow(i), arrow(j))$.

1. Etudier f et representer C.


// Source: Corrigé T2 p.12-13
==== Corrigé

1) $f(x) = -frac(1,3) x^3 + x^2 + frac(1,3)$

\* $f$ est définie et continue sur tout $RR$.

\* $f$ est dérivable sur $RR$ et $f'(x) = -x^2 + 2x = -x(x - 2)$

$lim_(x arrow -infinity) f(x) = lim_(x arrow -infinity)(-frac(1,3) x^3) = +infinity$

$lim_(x arrow +infinity) f(x) = lim_(x arrow +infinity)(-frac(1,3) x^3) = -infinity$

#align(center)[
  #table(
    columns: 6,
    align: center,
    [$x$], [$-infinity$], [$0$], [], [$2$], [$+infinity$],
    [$f'(x)$], [$-$], [$0$], [$+$], [$0$], [$-$],
    [$f(x)$], [$+infinity$], [$arrow.b frac(1,3)$], [$arrow.t$], [$frac(5,3) arrow.b$], [$-infinity$],
  )
]

\* $lim_(x arrow -infinity) frac(f(x), x) = lim_(x arrow -infinity) frac(-x^3, 3x) = lim_(x arrow -infinity) (-frac(x^2, 3)) = -infinity$

$lim_(x arrow +infinity) frac(f(x), x) = lim_(x arrow +infinity) frac(-x^3, 3x) = lim_(x arrow +infinity) (-frac(x^2, 3)) = -infinity$

d'ou $(C)$ admet deux branches paraboliques de direction $(O, arrow(j))$ aux voisinage de $+infinity$ _et_ $-infinity$.

2) a) $blacktriangleright$ pour tout $x in D_f = RR$, on a $(2-x) in D_f$

$blacktriangleright$ $f(2-x) + f(x) = -frac(1,3)(2-x)^3 + (2-x)^2 + frac(1,3) - frac(1,3)x^3 + x^2 + frac(1,3)$

$= -frac(1,3)(8 - 12x + 6x^2 - x^3) + (4 - 4x + x^2) - frac(1,3)x^3 + x^2 + frac(2,3)$

$= -frac(8,3) + 4 + frac(2,3) = 2$

D'où #h(1em) $f(2-x) = 2 - f(x)$

Conclusion : $I(1,1)$ est un centre de symétrie pour $(C)$.

b) $T: y = f'(1) dot (x-1) + f(1)$, Par suite $T: y = x$

c) $f(x) - x = -frac(1,3) x^3 + x^2 - x + frac(1,3) = -frac(1,3)(x^3 - 3x^2 + 3x - 1) = -frac(1,3)(x-1)^3$

#align(center)[
  #table(
    columns: 4,
    align: center,
    [$x$], [$-infinity$], [$1$], [$+infinity$],
    [$f(x) - x$], [$+$], [$0$], [$-$],
    [Position], [$(C)$ au dessus de $T$], [], [$T$ au dessus de $(C)$],
  )
  $(1,1)$
]

// Source: Corrigé T2 p.13
3) #emph[Voir figure — Graphe de $f$ avec la tangente $T: y = x$, les courbes $C_g$ et $C_h$]

4) $bullet$ $g(x) = f(x) + 1$

$(C_g)$ est l'image de $(C_f)$ par la translation de vecteur $arrow(j)$.

$bullet$ $h(x) = f(x+1)$

$(C_h)$ est l'image de $(C_f)$ par la translation de vecteur $-arrow(i)$.


=== Exercice 6

On considere les fonctions $f : x |-> x^4 + x + 1$ et $g : x |-> x^4 - 1$.

On designe par $C_f$ et $C_g$ leurs courbes representatives dans un repere $(O, arrow(i), arrow(j))$.

1. Etudier chacune des fonctions f et g.

2. Etudier la position relative de $C_f$ et $C_g$.

#h(0.5cm) a. Verifier que $x = frac(5, 4)$, $f(x) = ... x in RR$, $x in [0, 2]$.

#h(0.5cm) b. Etudier la position relative de $C_f$ et $C_g$. Tracer $C_f$ et $C_g$.


// Source: Corrigé T2 p.13-15
==== Corrigé

1) $f(x) = x^3 - 4x^2 - 2x + 15$

\* $f$ est définie et continue sur tout $RR$.

\* $f$ est dérivable sur $RR$ et $f'(x) = 3x^2 - 8x - 2$

$Delta = 88 = 4 times 22$ ; #h(1em) $x' = frac(4-sqrt(22), 3)$ #h(1em) et #h(1em) $x'' = frac(4+sqrt(22), 3)$

$lim_(x arrow -infinity) bold(f(x)) = lim_(x arrow -infinity)(x^3) = -infinity$

$lim_(x arrow +infinity) bold(f(x)) = lim_(x arrow +infinity)(x^3) = +infinity$

#align(center)[
  #table(
    columns: 6,
    align: center,
    [$x$], [$-infinity$], [$frac(4-sqrt(22), 3)$], [], [$frac(4+sqrt(22), 3)$], [$+infinity$],
    [$f'(x)$], [$+$], [$0$], [$-$], [$0$], [$+$],
    [$f(x)$], [$-infinity$], [$arrow.t f(x')$], [$arrow.b$], [$f(x'') arrow.t$], [$+infinity$],
  )
]

// Source: Corrigé T2 p.14
$lim_(x arrow -infinity) frac(f(x), x) = lim_(x arrow -infinity) frac(x^3, 3x) = lim_(x arrow -infinity)(frac(x^2,3)) = +infinity$

$lim_(x arrow +infinity) frac(f(x), x) = lim_(x arrow +infinity) frac(x^3, 3x) = lim_(x arrow +infinity)(frac(x^2,3)) = +infinity$

d'ou $(C_f)$ admet deux branches paraboliques de direction $(O, arrow(j))$ aux voisinage de $+infinity$ _et_ $-infinity$.

2) a) $(x-2)(x^2 - x - 6) = x^3 - x^2 - 6x - 2x^2 + 2x + 12 = x^3 - 3x^2 - 4x + 12$

b) $f(x) - g(x) = x^3 - 3x^2 - 4x + 12 = (x-2)(x^2 - x - 6)$

$x^2 - x - 6 = 0$

$Delta = 25$ ; $x' = -2$ _et_ $x'' = 3$

#align(center)[
  #table(
    columns: 7,
    align: center,
    [$x$], [$-infinity$], [$-2$], [], [$2$], [$3$], [$+infinity$],
    [$x - 2$], [$-$], [], [$-$], [$0$], [$+$], [$+$],
    [$x^2 - x - 6$], [$+$], [$0$], [$-$], [], [$-$], [$0$], [$+$],
    [$P$], [$-$], [$0$], [$+$], [$0$], [$-$], [$0$], [$+$],
  )
]

Par suite:
#align(center)[
  #table(
    columns: 7,
    align: center,
    [$x$], [$-infinity$], [$-2$], [], [$2$], [$3$], [$+infinity$],
    [$f(x) - g(x)$], [$-$], [$0$], [$+$], [$0$], [$-$], [$0$], [$+$],
    [P.R], [$C_g \/ C_f$], [], [$C_f \/ C_g$], [], [$C_g \/ C_f$], [], [$C_f \/ C_g$],
  )
]

3) $(C_g)$ est une parabole de sommet $S(1,4)$ _d'axe_ : $x = 1$

$x' approx -0,23$ ; $x'' approx 2,9$

$f(x') approx 15,23$ ; $f(x'') approx -0,05$

// Figure: Graphe de Cf et Cg (parabole)


=== Exercice 7

On considere la fonction $f : x |-> x + frac(4, x) + 3$ et on designe par C sa courbe representative dans un repere $(O, arrow(i), arrow(j))$.

1. Determiner l'ensemble de definition de f.

2. Etudier f.

3. a. Etudier la derivabilite de f a droite en 0.

#h(0.5cm) b. En deduire que C admet une demi-tangente verticale T au point d'abscisse 0.

4. Tracer C et T.

5. En deduire la representation graphique de la fonction $g : x |-> sqrt(-4x + 5)$.


// Source: Corrigé T2 p.14-16
==== Corrigé

1) $f(x) = x^4 + 2x^2 - 3$

- $f$ est définie et continue sur tout $RR$.

- il est clair que $f$ est une fonction paire, il suffit donc de l'étudier sur $D_E = [0, +infinity[$

- $f$ est dérivable sur $[0, +infinity[$ et $f'(x) = 4x^3 + 4x = 4x(x^2 + 1) gt.eq 0$

// Source: Corrigé T2 p.15
$lim_(x arrow +infinity) f(x) = lim_(x arrow +infinity)(x^4) = +infinity$

\* $lim_(x arrow +infinity) frac(f(x), x) = lim_(x arrow +infinity) frac(x^4, x) = lim_(x arrow +infinity)(x^3) = +infinity$

d'ou $(C_f)$ admet une branche parabolique de direction $(O, arrow(j))$ aux voisinage de $+infinity$.

#align(center)[
  #table(
    columns: 4,
    align: center,
    [$x$], [$0$], [], [$+infinity$],
    [$f'(x)$], [$0$], [$+$], [],
    [$f(x)$], [$-3$], [croissante $arrow.t$], [$+infinity$],
  )
]

2) \* $g(x) = x^3 - x$

- $g$ est définie et continue sur tout $RR$.
- il est clair que $g$ est une fonction impaire, il suffit donc de l'étudier sur $D_E = [0, +infinity[$
- $g$ est dérivable sur $[0, +infinity[$ et $g'(x) = 3x^2 - 1$

$lim_(x arrow +infinity) g(x) = lim_(x arrow +infinity)(x^3) = +infinity$

#align(center)[
  #table(
    columns: 5,
    align: center,
    [$x$], [$0$], [], [$frac(1,sqrt(3))$], [$+infinity$],
    [$g'(x)$], [$-$], [], [$0$], [$+$],
    [$g(x)$], [$0$], [$arrow.b$], [$-frac(1, 2sqrt(3)) arrow.t$], [$+infinity$],
  )
]

\* $lim_(x arrow +infinity) frac(f(x), x) = lim_(x arrow +infinity) frac(x^3, x) = lim_(x arrow +infinity)(x^2) = +infinity$

d'ou $(C_g)$ admet une branche parabolique de direction $(O, arrow(j))$ aux voisinage de $+infinity$.

3) a) $(x^2 - 1)(x^2 - x + 3) = x^4 - x^3 + 3x^2 + 2x^2 + x - 3$

b) $f(x) - g(x) = x^4 - x^3 + 2x^2 + x - 3 = (x^2 - 1)(x^2 - x + 3)$

\* $x^2 - 1 = 0 arrow.l.r.double (x-1)(x+1) = 0 arrow.l.r.double x = 1$ _ou_ $x = -1$

\* $x^2 - x + 3 = 0$, $Delta = -11 < 0$ $(a = 1 > 0)$ _d'ou_ $x^2 - x + 3 > 0$ _pour tout_ $x in RR$

#align(center)[
  #table(
    columns: 5,
    align: center,
    [$x$], [$-infinity$], [$-1$], [$1$], [$+infinity$],
    [$x^2 - 1$], [$+$], [$0$], [$-$], [$0$], [$+$],
    [$x^2 - x + 3$], [$+$], [], [$+$], [], [$+$],
    [$(x^2-1)(x^2-x+3)$], [$+$], [$0$], [$-$], [$0$], [$+$],
  )
]

// Source: Corrigé T2 p.16
Par suite:
#align(center)[
  #table(
    columns: 5,
    align: center,
    [$x$], [$-infinity$], [$-1$], [$1$], [$+infinity$],
    [$f(x) - g(x)$], [$+$], [$0$], [$-$], [$0$], [$+$],
    [P. Relative], [$(C_f)\/(C_g)$], [], [$(C_g)\/(C_f)$], [], [$(C_f)\/(C_g)$],
  )
]

4) #emph[Voir figure — Graphes de $C_f$ et $C_g$]


=== Exercice 8

On considere les fonctions $f : x |-> x^4 + x + 1$ et $g : x |-> -x + 1$. On designe par $C_f$ et $C_g$ leurs courbes representatives dans un repere $(O, arrow(i), arrow(j))$.

1. Etudier la position relative de $C_f$ et de $C_g$. Tracer $C_f$ et $C_g$.

#h(0.5cm) Le plus est muni d'un repere $(x_0, ...)$.

// Source: Manuel T1 p.132

// Source: Corrigé T2 p.16-17
==== Corrigé

1) a) $f(0) = 0^4 + a times 0 = 0$

On a : $f(x+2) = f(x)$, $x in [0, 2[$

_pour_ $x = 0$, _on aura_ $f(2) = f(0) = 0$

b) $f$ est continue à gauche en 2 d'où $lim_(x arrow 2^-) bold(f(x)) = bold(f(2))$ $arrow.double$ $lim_(x arrow 2^-)(x^4 + a x^2) = 0$

$arrow.double 16 + 4a = 0 arrow.double a = -4$

Par suite pour $x in [0, 2]$, $f(x) = x^4 - 4x^2$

2) $f_1(x) = x^4 - 4x^2$, $x in [0, 2]$

$f_1$ est dérivable sur $[0,2]$ et $f'_1(x) = 4x^3 - 8x = 4x(x^2 - 2) = 4x(x - sqrt(2))(x + sqrt(2))$

// Source: Corrigé T2 p.17

#align(center)[
  #table(
    columns: 5,
    align: center,
    [$x$], [$0$], [], [$sqrt(2)$], [$2$],
    [$f'_1(x)$], [$0$], [$-$], [$0$], [$+$],
    [$f_1(x)$], [$0$], [$arrow.b$], [$-4 arrow.t$], [$0$],
  )
]

$(C_2)$ est l'image de $(C_1)$ par la translation de vecteur $2 arrow(i)$.

// Figure: Graphe de f montrant C_1 et C_2, deux arches périodiques

3) a) soit $M(X, Y)$ un point de $(C_2)$

$M(X, Y)$ _avec_ $cases(Y = f(X), X in [2\, 4])$ $arrow.double$ $cases(Y = f(X-2), (X-2) in [0\, 2])$ $arrow.double N(X-2, Y) in (C_2)$

$arrow(M N) = vec(2, 0) = 2 arrow(i)$ #h(2em) d'où $(C_2) = t_(2 arrow(i))(C_1)$

b) voir figure.


=== Exercice 9

On considere la fonction definie sur $RR backslash {-1}$ par

$ f(x) = frac(x^3 - 1, x + 1) $

et on designe par C sa courbe representative dans un repere $(O, arrow(i), arrow(j))$.

1. On se propose de determiner les reels a et b tels que

$f(x) = ... x + a(x + 1) + frac(b, ...)$.

#h(0.5cm) a. Calculer $lim_(x -> +infinity) frac(f(x), x^2) = a + frac(1, x)$ et deduire la valeur de a.

#h(0.5cm) b. Calculer $f(0)$ et en deduire la valeur de b.

2. En deduire la representation graphique de la fonction $f : x |-> x + f(x)$.

#h(0.5cm) $f(x) = a x^2 + b x + c - frac(4, ...)$.

3. Decrire le tableau de variation de f.


// Source: Corrigé T2 p.17-19
==== Corrigé

1) #h(2em) $f(x) = frac(-2x + 5, x + 3)$ ; #h(2em) $D_f = RR backslash {-3}$

a) $f(x) = a + frac(b, x+3)$

D'une part : $(x+3)f(x) = -2x + 5$, d'autre part : $(x+3)f(x) = a dot (x+3) + b$

// Source: Corrigé T2 p.18
$lim_(x arrow (-3))(x+3)f(x) = lim_(x arrow (-3))(-2x+5) = 11$ et $lim_(x arrow (-3))(x+3)f(x) = lim_(x arrow (-3))[a(x+3) + b] = b$

D'où $boxed(b = 11)$

b) $lim_(x arrow +infinity) f(x) = lim_(x arrow +infinity)(frac(2x+5, x+3)) = lim_(x arrow +infinity)(frac(-2x, x)) = -2$ et $lim_(x arrow +infinity) f(x) = lim_(x arrow +infinity)(a + frac(b, x+3)) = a$

d'où #h(1em) $boxed(a = -2)$

conclusion : #h(1em) $f(x) = -2 + frac(11, x+3)$

2) \* $f$ est continue sur $RR backslash {-3}$

\* $f$ est dérivable sur $RR backslash {-3}$ #h(1em) et #h(1em) $f'(x) = -frac(11, (x+3)^2) < 0$

$lim_(x arrow +infinity) f(x) = lim_(x arrow -infinity) f(x) = -2$

$lim_(x arrow (-3)^-) f(x) = lim_(x arrow (-3)^-)(-2 + frac(11, x+3)) = -infinity$

$lim_(x arrow (-3)^+) f(x) = lim_(x arrow (-3)^+)(-2 + frac(11, x+3)) = +infinity$

#align(center)[
  #table(
    columns: 5,
    align: center,
    [$x$], [$-infinity$], [], [$-3$], [$+infinity$],
    [$f'(x)$], [], [$-$], [], [$-$],
    [$f(x)$], [$-2$], [$arrow.b$], [$-infinity || +infinity$], [$arrow.b -2$],
  )
]

\* les droites d'équations respectives $x = -3$ _et_ $y = -2$ sont des asymptotes à $(C)$

// Figure: Graphe de f avec asymptotes x=-3 et y=-2, et le symétrique Cg par rapport à x=3

// Source: Corrigé T2 p.19
3)

$g(x) = f(-x)$ ; $D_g = RR backslash {3}$

$cases(x in D_g, y = g(x))$ $arrow.l.r.double$ $cases((-x) in D_f, y = f(-x))$

ce qui donne : $M(x,y) in (C_g)$ $arrow.l.r.double$ ?

$M'(-x,y) in (C_f)$ #h(1em) Donc $(C_g)$ se déduit de $(C_f)$ par la symétrie orthogonale d'axe $(O, arrow(j))$

4) $k(x) = f(|x|)$ ; #h(2em) $D_k = RR$

Il est clair que $k$ est une fonction paire de plus $k(x) = f(x)$ _pour_ $x in [0, +infinity[$

$k(x) = cases(f(x) "si" x gt.eq 0, g(x) "si" x lt.eq 0)$

#align(center)[
  #table(
    columns: 4,
    align: center,
    [$x$], [$-infinity$], [$0$], [$+infinity$],
    [$k(x)$], [$-2 arrow.t$], [$5\/3 arrow.b$], [$-2$],
  )
]


=== Exercice 10

On considere la fonction f d'etude sur $RR backslash {1}$ par

$f(x) = frac(x^2 + 1, x - 1)$

et on designe par C sa courbe representative dans un repere $(O, arrow(i), arrow(j))$.

1. On se propose de determiner les reels a, b et c tels que

$f(x) = a x + b + frac(c, x - 1)$, pour tout x, $x eq.not 1$.

#h(0.5cm) a. Calculer $lim_(x -> +infinity) frac(f(x), x)$ et en deduire la valeur de a.

#h(0.5cm) b. Calculer $f(0)$ et en deduire la valeur de b.

2. Etudier f.

3. a. Montrer que C admet une asymptote au voisinage de $+infinity$ et en deduire un complement et un croisement $y = -2x - 1$.

#h(0.5cm) b. Etudier la position relative de C et de D.

5. a. Representer la fonction $f(1 | 1)$.

#h(0.5cm) b. Dresser son tableau de variation.


// Source: Corrigé T2 p.19-21
==== Corrigé

1) #h(2em) $f(x) = frac(-2x^2 + x + 2, x - 1) = a x + b + frac(c, x-1)$ ; #h(2em) $x eq.not 1$

a) d'une part : $lim_(x arrow +infinity) frac(f(x), x) = lim_(x arrow +infinity) frac(-2x^2 + x + 2, x^2 - x) = -2$ d'autre part : $lim_(x arrow +infinity) frac(f(x), x) = lim_(x arrow +infinity)(a + frac(b, x) + frac(c, x(x-1))) = a$

d'où $boxed(a = -2)$

b) d'une part : #h(1em) $lim_(x arrow 1)(x-1) f(x) = lim_(x arrow 1)(-2x^2 + x + 2) = 1$

d'autre part : $lim_(x arrow 1)(x-1) f(x) = lim_(x arrow 1)[(x-1)(a x + b) + c] = c$

d'où #h(1em) $boxed(c = 1)$

// Source: Corrigé T2 p.20
c) $f(0) = -2 arrow.double b - c = -2 arrow.double b = c - 2 arrow.double$ $boxed(b = -1)$

par suite #h(1em) $f(x) = -2x - 1 + frac(1, x-1)$

2) \* $f$ est continue sur $RR backslash {1}$

\* $f$ est dérivable sur $RR backslash {1}$ #h(1em) et #h(1em) $f'(x) = -2 - frac(1, (x-1)^2) < 0$

#align(center)[
  #table(
    columns: 5,
    align: center,
    [$x$], [$-infinity$], [], [$1$], [$+infinity$],
    [$f'(x)$], [], [$-$], [$||$], [$-$],
    [$f(x)$], [$+infinity$], [$arrow.b$], [$-infinity || +infinity$], [$arrow.b -infinity$],
  )
]

$lim_(x arrow +infinity) f(x) = lim_(x arrow +infinity)(-2x - 1 + frac(1, x-1)) = -infinity$

$lim_(x arrow -infinity) f(x) = lim_(x arrow -infinity)(-2x - 1 + frac(1, x-1)) = +infinity$

$lim_(x arrow 1^-) f(x) = lim_(x arrow 1^-)(-2x - 1 + frac(1, x-1)) = -infinity$

$lim_(x arrow 1^+) f(x) = lim_(x arrow 1^+)(-2x - 1 + frac(1, x-1)) = +infinity$ Donc la droite d'équation : $x = 1$ est une asymptote à $(C)$

4) a)

$lim_(x arrow +infinity) [f(x) - (-2x - 1)] = lim_(x arrow +infinity) frac(1, x-1) = 0$

$lim_(x arrow -infinity) [f(x) - (-2x - 1)] = lim_(x arrow -infinity) frac(1, x-1) = 0$

La droite $Delta$ d'équation : $y = -2x - 1$ est une asymptote à $(C)$ au voisinage de $+infinity$ et $-infinity$.

b) $f(x) - (-2x - 1) = frac(1, x-1)$

Signe de $f(x) - (-2x - 1)$

#align(center)[
  #table(
    columns: 4,
    align: center,
    [$x$], [$-infinity$], [$1$], [$+infinity$],
    [$f(x) - (-2x - 1)$], [$-$], [$||$], [$+$],
    [Position relative], [$D \/ C$], [], [$C \/ D$],
  )
]

// Source: Corrigé T2 p.21
4) #emph[Voir figure — Graphe de $f$ avec les asymptotes $x = 1$ et $y = -2x - 1$, courbe $C_1$ (valeur absolue)]

5) a) $(C_1)$ est la courbe représentative de $|f|$.

b)
#align(center)[
  #table(
    columns: 6,
    align: center,
    [$x$], [$-infinity$], [$frac(1-sqrt(17), 4)$], [$1$], [$frac(1+sqrt(17), 4)$], [$+infinity$],
    [], [$+infinity$], [$arrow.b$], [$+infinity || +infinity$], [$arrow.b$], [$+infinity$],
    [$|f(x)|$], [], [], [$0$], [], [], [$0$], [],
  )
]

$f(x) = 0 arrow.l.r.double -2x^2 + x + 2 = 0$

$Delta = 17$ ; $x' = frac(-1-sqrt(17), -4) = frac(1+sqrt(17), 4)$ et $x' = frac(-1+sqrt(17), -4) = frac(1-sqrt(17), 4)$


=== Exercice 11

On considere la fonction definie sur $RR backslash {-1, 2}$ par

$f(x) = x^2 - 5x - 2$ et on designe par C sa courbe representative dans un repere orthogonal $(O, arrow(i), arrow(j))$.

1. On se propose de determiner les reels a, b et c tels que

$f(x) = a + frac(b, x - 1) + frac(c, x - 2)$.

#h(0.5cm) a. Determiner $lim f(x)$ et en deduire la valeur de a.

#h(0.5cm) b. Determiner la valeur de c.

#h(0.5cm) c. Calculer $f(0)$ et en deduire la valeur de b.

2. Etudier f.


// Source: Corrigé T2 p.21-23
==== Corrigé

1) #h(2em) $f(x) = frac(x^2 - 2x - 2, x + 2) = a x + b + frac(c, x + 2)$ ; #h(2em) $x eq.not 1$

a) d'une part : $lim_(x arrow +infinity) frac(f(x), x) = lim_(x arrow +infinity) frac(x^2-2x-2, x^2+2x) = 1$ d'autre part : $lim_(x arrow +infinity) frac(f(x), x) = lim_(x arrow +infinity)(a + frac(b, x) + frac(c, x(x+2))) = a$

d'où $boxed(a = 1)$

// Source: Corrigé T2 p.22
b) d'une part : $lim_(x arrow (-2))(x+2)f(x) = lim_(x arrow (-2))(x^2 - 2x - 2) = 6$

D'autre part : $lim_(x arrow (-2))(x+2)f(x) = lim_(x arrow 1)[(x+2)(a x + b) + c] = c$

d'où $boxed(c = 6)$

c) $f(0) = -1 arrow.double b - frac(c,2) = -1 arrow.double b = -1 - frac(c,2) arrow.double$ $boxed(b = -4)$

par suite #h(1em) $f(x) = x - 4 + frac(6, x+2)$

2) \* $f$ est continue sur $RR backslash {-2}$

\* $f$ est dérivable sur $RR backslash {-2}$ #h(1em) et #h(1em) $f'(x) = 1 - frac(6, (x+2)^2) = frac((x+2)^2 - 6, (x+2)^2) = frac((x+2-sqrt(6))(x+2+sqrt(6)), (x+2)^2)$

#align(center)[
  #table(
    columns: 6,
    align: center,
    [$x$], [$-infinity$], [$-2-sqrt(6)$], [$-2$], [$-2+sqrt(6)$], [$+infinity$],
    [$f'(x)$], [$+$], [$0$], [$-$], [$||$], [$-$], [$0$], [$+$],
    [$f(x)$], [$-infinity$], [$arrow.t -6-2sqrt(6)$], [$arrow.b$], [$+infinity || -infinity$], [$arrow.b -6+2sqrt(6) arrow.t$], [$+infinity$],
  )
]

$lim_(x arrow +infinity) f(x) = lim_(x arrow +infinity)(x - 4 + frac(6, x+2)) = +infinity$

$lim_(x arrow -infinity) f(x) = lim_(x arrow -infinity)(x - 4 + frac(6, x+2)) = -infinity$

$lim_(x arrow (-2)^-) f(x) = lim_(x arrow (-2)^-)(x - 4 + frac(6, x+2)) = -infinity$

$lim_(x arrow (-2)^+) f(x) = lim_(x arrow (-2)^+)(x - 4 + frac(6, x+2)) = +infinity$

3) a)

$lim_(x arrow +infinity) [f(x) - (x-4)] = lim_(x arrow +infinity) frac(6, x+2) = 0$

$lim_(x arrow -infinity) [f(x) - (x-4)] = lim_(x arrow -infinity) frac(6, x+2) = 0$

La droite $D$ d'équation : $y = x - 4$ est une asymptote à $(C)$ au voisinage de $+infinity$ et $-infinity$.

// Source: Corrigé T2 p.23
b) $f(x) - (x-4) = frac(6, x+2)$

#align(center)[
  #table(
    columns: 4,
    align: center,
    [$x$], [$-infinity$], [$-2$], [$+infinity$],
    [$f(x) - (x-4)$], [$-$], [$||$], [$+$],
    [Position relative], [$D \/ C$], [], [$C \/ D$],
  )
]

4) $lim_(x arrow (-2)^-) f(x) = -infinity$ et $lim_(x arrow (-2)^+) f(x) = +infinity$

La droite d'équation : $x = -2$ est une asymptote à $(C)$

5) $cases(x = -2, y = x - 4) arrow.l.r.double cases(x = -2, y = -6)$ d'où $D sect D' = {I(-2, -6)}$

\* $x in D_f arrow.double x eq.not -2 arrow.double -x eq.not 2 arrow.double -4-x eq.not -2 arrow.double (-4-x) in D_f$

\* $f(-4-x) + f(x) = [(-4-x) - 4 + frac(6, -4-x+2)] + x - 4 + frac(6, x+2) = -x - 8 - frac(6, x+2) + x - 4 + frac(6, x+2) = -12$

d'où $f(-4-x) = -12 - f(x)$

par suite le point $I(-2, -6)$ est un centre de symétrie pour $(C)$.

6) #emph[Voir figure — Graphe de $f$ avec asymptotes et droite $D: y = x - 4$]


=== Exercice 12

On considere la fonction f definie sur $RR backslash {0}$ par

$ f(x) = x + frac(4, x) + 3 $

et on designe par C sa courbe representative dans un repere $(O, arrow(i), arrow(j))$.

1. On se propose de determiner les reels a, b, c et d tels que $f(x) = a x + b + frac(c, x) + frac(d, ...)$.

#h(0.5cm) a. Calculer $lim_(x -> +infinity) frac(f(x), x)$ et en deduire la valeur de a.

#h(0.5cm) b. Calculer $f(0)$ et en deduire la valeur de b.

2. Etudier f.

4. Soit en reel. Discuter suivant les valeurs de m le nombre d'intersection de C avec la droite d'equation $y = m$.

#h(0.5cm) a. Representer la fonction $f(1 | 1)$ en les sous-intervalles de variation.

5. En deduire les sous-intervalles de variation.


// Source: Corrigé T2 p.23-26
==== Corrigé

1) #h(2em) $f(x) = frac(-x^2 - 3x + 2, x^2 + 4x)$ ; #h(1em) $D_f = RR backslash {-4, 0}$

// Source: Corrigé T2 p.24
$f(x) = a + frac(b, x) + frac(c, x+4)$

a) $lim_(x arrow (-4))(x+4) f(x) = lim_(x arrow (-4))(frac(-x^2 - 3x + 2, x)) = frac(1,2)$,

d'autre part : $bold(lim)_(x arrow (-4))(x+4) f(x) = lim_(x arrow (-4))[(a + frac(b, x))(x+4) + c] = c$

ce qui donne #h(1em) $c = frac(1,2)$

b) $lim_(x arrow 0)[x f(x)] = lim_(x arrow (-4))(frac(-x^2 - 3x + 2, x + 4)) = frac(1,2)$, d'autre part : $lim_(x arrow 0) x f(x) = lim_(x arrow 0)[b + (a + frac(c, x+4))x + c] = b$

ce qui donne #h(1em) $b = frac(1,2)$

c) $lim_(x arrow +infinity) f(x) = lim_(x arrow +infinity)(frac(-x^2, x^2)) = -1$ d'autre part : $lim_(x arrow +infinity) f(x) = lim_(x arrow +infinity)(a + frac(b, x) + frac(c, x+4)) = a$

ce qui donne #h(1em) $bold(a = -1)$

Par suite #h(2em) $f(x) = -1 + frac(1, 2x) + frac(1, 2(x+4))$

2) \* $f$ est continue sur $RR backslash {-4, 0}$

\* $f$ est dérivable sur $RR backslash {-4, 0}$ #h(1em) et #h(1em) $f'(x) = frac(-1, 2x^2) - frac(1, 2(x+4)^2) < 0$

#align(center)[
  #table(
    columns: 6,
    align: center,
    [$x$], [$-infinity$], [$-4$], [], [$0$], [$+infinity$],
    [$f'(x)$], [$-$], [], [$-$], [$||$], [$-$],
    [$f(x)$], [$-1 arrow.b$], [$+infinity || -infinity$], [$arrow.b$], [$+infinity || -infinity$], [$arrow.b -1$],
  )
]

$lim_(x arrow +infinity) f(x) = lim_(x arrow +infinity)(-1 + frac(1,2x) + frac(1, 2(x+4))) = -1$

$lim_(x arrow -infinity) f(x) = lim_(x arrow -infinity)(-1 + frac(1,2x) + frac(1, 2(x+4))) = -1$

$lim_(x arrow (-4)^-) f(x) = lim_(x arrow (-4)^-)(-1 + frac(1,2x) + frac(1, 2(x+4))) = -infinity$ ; #h(1em) $lim_(x arrow (-4)^+) f(x) = lim_(x arrow (-4)^+)(-1 + frac(1,2x) + frac(1, 2(x+4))) = +infinity$

$lim_(x arrow 0^-) f(x) = lim_(x arrow 0^-)(-1 + frac(1,2x) + frac(1, 2(x+4))) = -infinity$ ; #h(1em) $lim_(x arrow 0^+) f(x) = lim_(x arrow 0^+)(-1 + frac(1,2x) + frac(1, 2(x+4))) = +infinity$

// Source: Corrigé T2 p.25
3) Les droites d'équations respectives : $x = -4$,

$x = 0$ _et_ $y = -1$ sont des asymptotes à $(C)$.

// Figure: Graphe de f avec trois branches et asymptotes x=-4, x=0, y=-1

4) \* $m = -1 arrow.long.r$ un seul point d'intersection

\* $m eq.not -1 arrow.long.r$ deux points d'intersection

5) a) $g(x) = f(-|x|)$ ; #h(2em) $D_g = RR backslash {-4, 0, 4}$

\* pour $x in ]-infinity, 0[ backslash {-4}$, #h(1em) $g(x) = f(x)$

\* pour $x in ]0, +infinity[ backslash {4}$, #h(1em) $g(x) = f(-x)$

\* $g$ est une fonction paire

$C_1$ : la courbe de la restriction de $f$ _sur_ $]-infinity, 0[ backslash {-4}$

$C_g = C_1 union C_2$

#align(center)[
  $C_2$ : le symétrique de $C_1$ par rapport à l'axe des ordonnées
]

// Source: Corrigé T2 p.26

// Figure: Graphe de g, symétrique par rapport à Oy, avec asymptotes x=-4, x=4, y=-1

b) tableau de variations de $g$ :

#align(center)[
  #table(
    columns: 7,
    align: center,
    [$x$], [$-infinity$], [$-4$], [$0$], [], [$4$], [$+infinity$],
    [$g(x)$], [$-1 arrow.b$], [$-infinity || +infinity$], [$arrow.b -infinity || -infinity$], [$arrow.b$], [$+infinity || -infinity$], [$arrow.b -1$],
  )
]


=== Exercice 13

On considere la fonction $f : x |-> frac(x^2 + 1, x - 1)$ et on designe par C sa courbe representative dans un repere

orthogonal $(O, arrow(i), arrow(j))$.

1. Determiner l'ensemble de definition de f.

2. Etudier f.

3. Montrer que C est un centre de symetrie de C d'abscisse...

4. Determiner une equation de la tangente T a C en I.

5. Etudier la position relative de T et de C.

6. Tracer C, $Delta$ et D.

// Source: Manuel T1 p.133

// Source: Corrigé T2 p.26-28
==== Corrigé

1) $f(x) = frac(-2x+1, x^2 - x + 1)$ ; $Delta = -3 < 0$ _d'ou_ $D_f = RR$.

2) \* $f$ est continue sur $RR$

\* $f$ est dérivable sur $RR$ #h(1em) et #h(1em) $f'(x) = frac(-2(x^2-x+1) - (2x-1)(-2x+1), (x^2-x+1)^2) = frac(2x^2 - 2x - 1, (x^2-x+1)^2)$

$2x^2 - 2x - 1 = 0$ ; $Delta = 12$ ;

$x' = frac(1-sqrt(3), 2)$ #h(1em) et #h(1em) $x' = frac(1+sqrt(3), 2)$

#align(center)[
  #table(
    columns: 6,
    align: center,
    [$x$], [$-infinity$], [$frac(1-sqrt(3), 2)$], [], [$frac(1+sqrt(3), 2)$], [$+infinity$],
    [$f'(x)$], [$+$], [$0$], [$-$], [$0$], [$+$],
    [$f(x)$], [$-infinity arrow.t$], [$2\/sqrt(3)$], [$arrow.b$], [$-2\/sqrt(3) arrow.t$], [$+infinity$],
  )
]

// Source: Corrigé T2 p.27
$lim_(x arrow +infinity) f(x) = lim_(x arrow +infinity)(frac(-2x, x^2)) = lim_(x arrow +infinity) frac(-2, x) = 0$ et $lim_(x arrow -infinity) f(x) = lim_(x arrow -infinity)(frac(-2x, x^2)) = lim_(x arrow -infinity) frac(-2, x) = 0$

3) $f(frac(1,2)) = 0 arrow.double I(frac(1,2), 0)$

a) \* pour $x in D_f = RR$, on a $(1-x) in D_f$

\* $f(1-x) = frac(-2(1-x)+1, (1-x)^2 - (1-x) + 1) = frac(2x-1, x^2 - x + 1)$ donc $f(1-x) = -f(x)$

Par suite le point $I(frac(1,2), 0)$ est un centre de symétrie pour $(C)$.

b) $T : y = f'(frac(1,2)) dot (x - frac(1,2)) + f(frac(1,2))$ #h(1em) d'où #h(1em) $T : y = frac(-8,3)(x - frac(1,2))$

c)

$f(x) + frac(8,3)(x - frac(1,2)) = f(x) + frac(4,3)(2x-1) = frac(-2x+1, x^2-x+1) + frac(4,3)(2x-1)$

$= (2x-1)[frac(-1, x^2-x+1) + frac(4,3)] = frac((2x-1)(4x^2-4x+1), 3(x^2-x+1))$

$f(x) + frac(8,3)(x - frac(1,2)) = frac((2x-1)^3, 3(x^2-x+1))$

#align(center)[
  #table(
    columns: 4,
    align: center,
    [$x$], [$-infinity$], [$1\/2$], [$+infinity$],
    [$f(x) + 8\/3(2x-1)$], [$-$], [$0$], [$+$],
    [P. relative], [$T \/ (C)$], [], [$(C) \/ T$],
  )
]

Le signe de $f(x) + frac(8,3)(x - frac(1,2))$ est celui de $(2x - 1)$

4) La droite d'équation : $y = 0$ est une asymptote à $(C)$ au voisinage de $+infinity$ et $-infinity$.

// Figure: Graphe de f avec tangente T en I(1/2,0), courbe Cg

// Source: Corrigé T2 p.28
5)

$g(x) = f(x+1) - 3$

$(C_g) = t_(arrow(u))(C_f)$ #h(2em) avec $arrow(u) vec(-1, -3)$ #h(2em) voir figure


=== Exercice 14

On considere la fonction $f : x |-> sqrt(x^2 - 2x)$ et on designe par C sa courbe representative dans un repere $(O, arrow(i), arrow(j))$.

1. Etudier f et tracer C.

Soit m un reel de $RR$, la droite d'equation $y = m x$.

2. a. Etudier l'existence et le nombre de solutions de l'equation $f(x) = m x$.

#h(0.5cm) On designe par $M$ et N, lorsqu'ils existent les points d'intersection de C et de $Delta_m$ par le milieu du segment $[M N]$.

#h(0.5cm) b. Determiner en fonction de m les coordonnees du point K.

4. Quel objet dans le plan le point K decrit-il lorsque m varie ?


// Source: Corrigé T2 p.28-30
==== Corrigé

1) $f(x) = frac((x-3)^2, x-2)$ ; #h(2em) $D_f = RR backslash {2}$.

\* $f$ est continue sur $RR backslash {2}$

\* $f$ est dérivable sur $RR backslash {2}$ #h(1em) et #h(1em) $f'(x) = frac(2(x-3)(x-2) - (x-3)^2, (x-2)^2) = frac((x-3)(x-1), (x-2)^2)$

Le signe de $f'(x)$ est celui de $(x-3)(x-1)$

$lim_(x arrow +infinity) f(x) = lim_(x arrow +infinity)(frac(x^2, x)) = lim_(x arrow +infinity) x = +infinity$

$lim_(x arrow -infinity) f(x) = lim_(x arrow -infinity)(frac(x^2, x)) = lim_(x arrow -infinity) x = -infinity$

#align(center)[
  #table(
    columns: 7,
    align: center,
    [$x$], [$-infinity$], [$1$], [], [$2$], [$3$], [$+infinity$],
    [$f'(x)$], [$+$], [$0$], [$-$], [$||$], [$-$], [$0$], [$+$],
    [$f(x)$], [$-infinity arrow.t$], [$-4$], [$arrow.b$], [$+infinity || -infinity$], [$arrow.b 0 arrow.t$], [$+infinity$],
  )
]

$lim_(x arrow 2^-) f(x) = lim_(x arrow 2^-) frac((x-3)^2, x-2) = -infinity$ #h(2em) et #h(2em) $lim_(x arrow 2^+) f(x) = lim_(x arrow 2^+) frac((x-3)^2, x-2) = +infinity$

\* la droite $x = 2$ est une asymptote à $(C)$.

\*

$f(x) = frac(x^2 - 6x + 9, x - 2) = frac((x^2 - 6x + 8) + 1, x - 2) = frac((x-2)(x-4), x-2) + frac(1, x-2)$

$f(x) = x - 4 + frac(1, x-2)$

$lim_(x arrow +infinity) [f(x) - (x-4)] = lim_(x arrow +infinity)(frac(1, x-2)) = 0$

$lim_(x arrow -infinity) [f(x) - (x-4)] = lim_(x arrow -infinity)(frac(1, x-2)) = 0$

La droite $Delta$ d'équation : $y = x - 4$ est une asymptote à $(C)$ au voisinage de $+infinity$ et $-infinity$.

// Source: Corrigé T2 p.29
// Figure: Graphe de f avec asymptotes x=2 et y=x-4

2) $D_m : y = m dot x$

a) dans $RR backslash {2}$, $f(x) = m dot x arrow.l.r.double frac(x^2 - 6x + 9, x - 2) = m dot x arrow.l.r.double m dot x(x-2) = x^2 - 6x + 9$

$arrow.l.r.double (m-1)x^2 - 2(m-3)x - 9 = 0$

\* $bold(m = 1)$, l'équation : $f(x) = m dot x$ admet une unique solution

\* *pour $m eq.not 1$*

$Delta = 4[(m-3)^2 + 9(m-1)] = 4m(m+3)$

#align(center)[
  #table(
    columns: 5,
    align: center,
    [$x$], [$-infinity$], [$-3$], [$0$], [$+infinity$],
    [$m(m+3)$], [$+$], [$0$], [$-$], [$0$], [$+$],
  )
]

$1^("er")$ cas : $m in ]-infinity, -3[ union ]0, +infinity[ backslash {1}$

l'équation : $f(x) = m dot x$ admet deux solutions.

$2^("ème")$ cas : $m = -3$ _ou_ $m = 0$

l'équation : $f(x) = m dot x$ admet une unique solution.

$3^("ème")$ cas : $m in ]-3, 0[$

l'équation : $f(x) = m dot x$ n'admet pas de solutions.

b) $D_m : y = m dot x$ ; #h(2em) $arrow(u)_m vec(1, m)$ _est vecteur directeur de_ $D_m$

\* pour $m in ]-3, 0[$ ; #h(2em) $(C) sect D_m = emptyset$

\* pour $m in {-3, 0, 1}$ ; $(C) sect D_m$ est un point.

\* pour $m in ]-infinity, -3[ union ]0, +infinity[ backslash {1}$ ; $(C) sect D_m$ : deux points.

// Source: Corrigé T2 p.30
3) a) $x_M$ _et_ $x_N$ sont solutions de l'équation : $(m-1)x^2 - 2(m-3)x - 9 = 0$,

$m in ]-infinity, -3[ union ]0, +infinity[ backslash {1}$, d'où $x_M + x_N = frac(-b, a) = frac(2(m-3), m-1)$

$bold(K) = M \* N arrow.double X_K = frac(x_M + x_N, 2) = frac(m-3, m-1)$

b) $K in D_m$ _donc_ $y_K = m dot x_K$ ce qui donne $y_K = frac(m(m-3), m-1)$

$K(frac(m-3, m-1), frac(m(m-3), m-1))$

$x_K = frac(m-3, m-1) = 1 - frac(2, m-1) arrow.double frac(2, m-1) = 1 - x_K$ d'où $m - 1 = frac(2, 1-x_K) arrow.double m = 1 + frac(2, 1-x_K)$

$y_K = frac(m^2 - 3m, m-1) = frac((m-2)(m-1) - 2, m-1) = m - 2 - frac(2, m-1)$

par suite : $y_K = frac(2, 1-x_K) - 1 - (1-x_K)$

Ce qui donne : $y_K = x_K - 2 + frac(2, 1-x_K)$

c) on pose $g(x) = x - 2 + frac(2, 1-x)$ ; ainsi le point $K$ _décrit_ $C_g$ lorsque $m$ _varie_.


=== Exercice 15

On considere la fonction $f : x |-> sqrt(x + 4x + 3)$ et on designe par C sa courbe representative dans un repere $(O, arrow(i), arrow(j))$.

1. Determiner l'ensemble de definition de f.

2. Etudier f.

3. En deduire que C admet une demi-tangente verticale.

4. $Delta$ la droite d'equation $y = x + 2$.

#h(0.5cm) Montrer que $Delta$ est un axe de symetrie de C.

5. Tracer C.


// Source: Corrigé T2 p.30-31
==== Corrigé

1) $f(x) = sqrt(-x + 3)$

$(-x+3) gt.eq 0 arrow.l.r.double x lt.eq 3$ ; $D_f = ]-infinity, 3]$

#align(center)[
  #table(
    columns: 4,
    align: center,
    [$x$], [$-infinity$], [$3$], [$+infinity$],
    [$-x+3$], [$+$], [$0$], [$-$],
  )
]

2) $f$ est continue sur $]-infinity, 3]$, dérivable sur $]-infinity, 3[$ et $f'(x) = frac(-1, 2sqrt(-x+3)) < 0$

$lim_(x arrow -infinity)(-x+3) = +infinity$ d'où $lim_(x arrow -infinity) sqrt(-x+3) = +infinity$

#align(center)[
  #table(
    columns: 4,
    align: center,
    [$x$], [$-infinity$], [], [$3$],
    [$f'(x)$], [], [$-$], [],
    [$f(x)$], [$+infinity$], [$arrow.b$], [$0$],
  )
]

2) a) $lim_(x arrow 3^-) frac(f(x) - f(3), x - 3) = lim_(x arrow 3^-) frac(sqrt(-x+3), x-3) = lim_(x arrow 3^-) frac(-1, sqrt(-x+3)) = -infinity$

$f$ n'est pas dérivable à gauche en 3.

b) $lim_(x arrow 3^-) frac(f(x) - f(3), x-3) = -infinity$

d'où $(C)$ admet une demi tangente verticale au point d'abscisse 3.

// Source: Corrigé T2 p.31
4) $lim_(x arrow -infinity) frac(f(x), x) = lim_(x arrow -infinity) frac(sqrt(-x+3), x) = lim_(x arrow -infinity) frac(-x+3, x sqrt(-x+3)) = lim_(x arrow -infinity) frac(-1+3\/x, sqrt(-x+3)) = 0$

$(C)$ admet une branche parabolique de direction $(O, arrow(i))$ _au voisinage de_ $-infinity$.

// Figure: Graphe de f(x) = sqrt(-x+3) et Cg

5) a) $g(x) = f(|x|)$

$|x| lt.eq 3 arrow.l.r.double -3 lt.eq x lt.eq 3$ ; #h(2em) $D_g = [-3, 3]$

$g$ est une fonction paire ; pour $x in [0, 3]$, $g(x) = f(x)$

de plus $(C_g)$ est symétrique par rapport à l'axe des ordonnées.

b) #align(center)[
  #table(
    columns: 4,
    align: center,
    [$x$], [$-3$], [$0$], [$3$],
    [$g(x)$], [$0 arrow.t$], [$sqrt(3) arrow.b$], [$0$],
  )
]


=== Exercice 16

On considere la fonction f definie sur $RR$ par

$f(x) = x + frac(4, x + 1) - 3$ et on designe par C sa courbe representative dans un repere orthogonal $(O, arrow(i), arrow(j))$.

1. Determiner l'ensemble de definition de f.

2. Etudier f.

3. Le point du C d'abscisse $frac(1, 2)$ .

#h(0.5cm) a. Montrer que I est un centre de symetrie de C.

4. Determiner une equation de la tangente T a C en I.

5. Etudier la position relative de T et de C.

6. Tracer C, $Delta$ et D.


// Source: Corrigé T2 p.31-33
==== Corrigé

1) $f(x) = sqrt(-x^2 + 5x - 4)$

$-x^2 + 5x - 4 = 0$ ; $a + b + c = 0$, $x' = 1$ _et_ $x'' = 4$

#align(center)[
  #table(
    columns: 5,
    align: center,
    [$x$], [$-infinity$], [$1$], [$4$], [$+infinity$],
    [$-x^2 + 5x - 4$], [$-$], [$0$], [$+$], [$0$], [$-$],
  )
]

$D_f = [1, 4]$

2) $f$ est continue sur $[1, 4]$, dérivable sur $]1, 4[$ et $f'(x) = frac(-2x+5, 2sqrt(-x^2+5x-4))$

// Source: Corrigé T2 p.32
$f(1) = f(4) = 0$

$f(frac(5,2)) = frac(3,2)$

#align(center)[
  #table(
    columns: 5,
    align: center,
    [$x$], [$1$], [], [$5\/2$], [$4$],
    [$f'(x)$], [], [$+$], [$0$], [$-$], [],
    [$f(x)$], [$0$], [$arrow.t$], [$3\/2 arrow.b$], [$0$],
  )
]

3) a)

\* $lim_(x arrow 1^+) frac(f(x) - f(1), x-1) = lim_(x arrow 1^+) frac(sqrt(-x^2+5x-4), x-1) = lim_(x arrow 1^+) frac(-x^2+5x-4, (x-1) sqrt(-x^2+5x-4))$

$= lim_(x arrow 1^+) frac(-(x-1)(x-4), (x-1) sqrt(-x^2+5x-4)) = lim_(x arrow 1^+) frac(-(x-4), sqrt(-x^2+5x-4)) = +infinity$

$f$ n'est pas dérivable à droite en 1.

\* $lim_(x arrow 4^-) frac(f(x) - f(4), x - 4) = lim_(x arrow 1^+) frac(-(x-1), sqrt(-x^2+5x-4)) = -infinity$

$f$ n'est pas dérivable à gauche en 4.

b) $lim_(x arrow 1^+) frac(f(x) - f(1), x-1) = +infinity$ et $lim_(x arrow 4^-) frac(f(x) - f(4), x-4) = -infinity$ d'où $(C)$ admet deux demi tangentes verticales l'une au point d'abscisse 1 et l'autre au point d'abscisse 4.

4) \* $x in D_f = [1, 4]$ $arrow.double$ $1 lt.eq x lt.eq 4$ $arrow.double$ $-4 lt.eq -x lt.eq -1$

$arrow.double 1 lt.eq 5 - x lt.eq 4$ $arrow.double (5-x) in D_f$

\* \* $f(2 times frac(5,2) - x) = f(5-x) = sqrt(-(5-x)^2 + 5(5-x) - 4)$

$= sqrt(-(25 - 10x + x^2) + 25 - 5x - 4) = sqrt(-x^2 + 5x - 4) = f(x)$

Conclusion : la droite $Delta : x = 5\/2$ est axe de symétrie de $(C)$.

5) #emph[figure omise]

// Source: Corrigé T2 p.33

=== Exercice 17

On considere la fonction $f : x |-> x + sqrt(x^2 - 4)$ et on designe par C sa courbe representative dans un repere orthogonal $(O, arrow(i), arrow(j))$.

1. Determiner l'ensemble de definition de f.

2. Etudier f.

3. a. Etudier la derivabilite de f a droite en $-2$ et a gauche en 2.

#h(0.5cm) b. En deduire que C admet deux demi-tangentes verticales que l'on precisera.

// Source: Manuel T1 p.133 (suite)
4. a. Determiner la forme canonique de $x^2 - 4$.

#h(0.5cm) b. Determiner aussi $lim_(x -> +infinity) (f(x) - x)$ et $lim_(x -> -infinity) (f(x) + x)$.

#h(0.5cm) c. En deduire que la courbe C admet une asymptote oblique au voisinage de $+infinity$ et une autre au voisinage de $-infinity$.

5. Tracer C et ses deux asymptotes.


// Source: Corrigé T2 p.33-34
==== Corrigé

1) $f(x) = sqrt(4 + x^2)$

pour tout réel $x$ on a $4 + x^2 gt.eq 0$ _d'ou_ $D_f = I R$

2) $f$ est continue et dérivable sur $RR$ et $f'(x) = frac(2x, 2sqrt(4+x^2)) = frac(x, sqrt(4+x^2))$

($f$ est paire)

#align(center)[
  #table(
    columns: 4,
    align: center,
    [$x$], [$-infinity$], [$0$], [$+infinity$],
    [$f'(x)$], [$-$], [$0$], [$+$],
    [$f(x)$], [$+infinity arrow.b$], [$2 arrow.t$], [$+infinity$],
  )
]

$lim_(x arrow +infinity) f(x) = +infinity$

3) a) $lim_(x arrow +infinity)(f(x) - x) = lim_(x arrow +infinity)(sqrt(4+x^2) - x) = lim_(x arrow +infinity) frac(4, sqrt(4+x^2) + x) = 0$

$lim_(x arrow -infinity)(f(x) + x) = lim_(x arrow +infinity)(sqrt(4+x^2) + x) = lim_(x arrow +infinity) frac(4, sqrt(4+x^2) - x) = 0$

b) la droite $D : y = x$ est une asymptote à $(C)$ au voisinage de $+infinity$.

la droite $D' : y = -x$ est une asymptote à $(C)$ au voisinage de $-infinity$.

c) comme $f$ est paire alors $D$ et $D'$ sont symétriques par rapport à l'axe des ordonnées.

(ou bien : $M(x,y) in D arrow.l.r.double cases(x in I R, y = x) arrow.l.r.double cases(-x in I R, y = -(-x)) arrow.l.r.double M'(-x,y) in D'$)

4) #emph[Voir figure — Graphe de $f(x) = sqrt(4+x^2)$ avec asymptotes $D: y = x$ et $D': y = -x$, et la courbe $C_g$]

// Source: Corrigé T2 p.34
5) $g(x) = sqrt(x^2 - 4x + 8) = sqrt(4 + (x-2)^2)$

Donc $g(x) = f(x-2)$

$(C_g)$ est l'image de $(C)$ par la translation de vecteur $2 dot arrow(i)$


=== Exercice 18

On considere les fonctions f, g et h definies sur $[0, 1]$ par

$f(x) = sqrt(x)$, $g(x) = x$ et $h(x) = x^2$.

On designe par $C_f$, $C_g$ et $C_h$ leurs courbes representatives dans un repere $(O, arrow(i), arrow(j))$.

1. Etudier chacune des fonctions f, g et h.

2. Montrer que $g(x) = f(x) circ h(x)$, $x in [0, 1]$.

3. Determiner une valeur approchee a $10^(-3)$ pres de...


// Source: Corrigé T2 p.34-36
==== Corrigé

1) a) $f(x) = sqrt(-x^2 + 4x + 4)$

$-x^2 + 4x + 4 = 0$ ; $Delta = 32$, $x' = 2 - 2sqrt(2)$ _et_ $x'' = 2 + 2sqrt(2)$

#align(center)[
  #table(
    columns: 5,
    align: center,
    [$x$], [$-infinity$], [$2-2sqrt(2)$], [$2+2sqrt(2)$], [$+infinity$],
    [$-x^2 + 4x + 4$], [$-$], [$0$], [$+$], [$0$], [$-$],
  )
]

la fonction : $x arrow -x^2 + 4x + 4$ est dérivable et strictement positive sur $[0, 2]$ d'où $f$ est dérivable sur $[0, 2]$

et $f'(x) = frac(-2x + 4, 2sqrt(-x^2+4x+4)) = frac(-x+2, sqrt(-x^2+4x+4)) gt.eq 0$ ; pour $x in [0, 2]$

#align(center)[
  #table(
    columns: 4,
    align: center,
    [$x$], [$0$], [], [$2$],
    [$f'(x)$], [], [$+$], [],
    [$f(x)$], [$2 arrow.t$], [], [$2sqrt(2)$],
  )
]

b) $g(x) = 2 + x - frac(1,2) x^2$

$g$ est continue et dérivable sur $[0, 2]$

$g'(x) = 1 - x$

#align(center)[
  #table(
    columns: 5,
    align: center,
    [$x$], [$0$], [], [$1$], [$2$],
    [$g'(x)$], [], [$+$], [$0$], [$-$],
    [$g(x)$], [$2 arrow.t$], [], [$frac(5,2) arrow.b$], [$2$],
  )
]

c) $h(x) = 2 + x - frac(1,2) x^2 + frac(1,4) x^3$

$h$ est continue et dérivable sur $[0, 2]$

$h'(x) = 1 - x + frac(3,4) x^2$

($h'(x) = 0 arrow.l.r.double frac(3,4) x^2 - x + 1 = 0$ ; $Delta = -2 < 0$)

#align(center)[
  #table(
    columns: 4,
    align: center,
    [$x$], [$0$], [], [$2$],
    [$h'(x)$], [], [$+$], [],
    [$h(x)$], [$2 arrow.t$], [], [$4$],
  )
]

// Source: Corrigé T2 p.35
2) \* $f(x) - g(x) = sqrt(-x^2+4x+4) - (2+x-frac(1,2)x^2) = frac((-x^2+4x+4) - (2+x-frac(1,2)x^2)^2, f(x) + g(x))$

$f(x) - g(x) = frac(x^3 - frac(1,4)x^4, f(x) + g(x)) = frac(x^3(4-x), 4(f(x)+g(x))) gt.eq 0$ ; _pour_ $x in [0, 2]$

car pour $x in [0, 2]$, $f(x) > 0$ _et_ $g(x) > 0$ _et_ $h(x) > 0$ #h(2em) d'après 1)

par suite $boxed(f(x) gt.eq g(x))$, _pour_ $x in [0, 2]$

\* $h(x) - f(x) = frac([h(x)]^2 - [f(x)]^2, h(x) + f(x)) = frac((2+x-frac(1,2)x^2+frac(1,4))^2 - (-x^2+4x+4), f(x) + g(x))$

$h(x) - f(x) = frac(x^4(x^2 - 4x + 12), 16(h(x) + f(x))) gt.eq 0$ _pour_ $x in [0, 2]$

Car : $x^2 - 4x + 12 > 0$ _puisque_ $Delta = -32 < 0$

par suite $boxed(h(x) gt.eq f(x))$, _pour_ $x in [0, 2]$

Conclusion : #h(2em) $h(x) gt.eq f(x) gt.eq g(x)$, _pour_ $x in [0, 2]$

3) #emph[Voir figure — Graphes de $C_h$, $C_f$ et $C_g$ sur $[0,2]$]

4) $f(0,0001) = sqrt(4,00039999)$

$g(0,0001) lt.eq f(0,0001) lt.eq h(0,0001)$

// Source: Corrigé T2 p.36
$arrow.double 2,000099995 lt.eq sqrt(4,00039999) lt.eq 2,00009999500025$

$sqrt(4,00039999) approx 2,000099995000$


=== Exercice 19

On considere les fonctions f, g et h definies sur $[0, 1]$ par

$f(x) = sqrt(x)$, $g(x) = 2 sqrt(2x - x^2)$ et $h(x) = x^2$.

On designe par $C_f$, $C_g$ et $C_h$ leurs courbes representatives dans un repere $(O, arrow(i), arrow(j))$.

1. On se propose de determiner les reels a, b, c et d tels que

$f(x) = ...$, pour tout x.

2. Montrer que $Delta$ est un axe de symetrie de C.

5. Montrer que la droite D d'equation $y = x + frac(1, 2)$ est une asymptote a $C$ au voisinage de $+infinity$.

6. Tracer C, $Delta$ et D.

// Source: Manuel T1 p.134

// Source: Corrigé T2 p.36-37
==== Corrigé

1) $f(x) = 1 - sqrt(x^2 + x)$

$x^2 + x = x(x+1)$

#align(center)[
  #table(
    columns: 5,
    align: center,
    [$x$], [$-infinity$], [$-1$], [$0$], [$+infinity$],
    [$x^2 + x$], [$+$], [$0$], [$-$], [$0$], [$+$],
  )
]

$D_f = ]-infinity, -1] union [0, +infinity[$

2) $f$ est continue sur $D_f = ]-infinity, -1] union [0, +infinity[$, dérivable sur $]-infinity, -1[ union ]0, +infinity[$

et $f'(x) = -frac(2x+1, 2sqrt(x^2+x)) = frac(-(2x+1), 2sqrt(x^2+x))$

#align(center)[
  #table(
    columns: 6,
    align: center,
    [$x$], [$-infinity$], [], [$-1$], [$0$], [$+infinity$],
    [$f'(x)$], [], [$+$], [$||$], [], [$-$],
    [$f(x)$], [$-infinity arrow.t$], [$1$], [], [$1 arrow.b$], [$-infinity$],
  )
]

$lim_(x^2 + x) = +infinity$

d'ou $lim_(x arrow +infinity) f(x) = -infinity$ de même $lim_(x arrow -infinity) f(x) = -infinity$

3) a) \* $lim_(x arrow 0^+) frac(f(x) - f(0), x - 0) = lim_(x arrow 0^+) frac(sqrt(x^2+x), x) = lim_(x arrow 0^+) frac(-x(x+1), x sqrt(x^2+x)) = lim_(x arrow 0^+) frac(-(x+1), sqrt(x^2+x)) = -infinity$

$f$ n'est pas dérivable à droite en 0.

\* $lim_(x arrow (-1)^-) frac(f(x) - f(-1), x + 1) = lim_(x arrow (-1)^-) frac(-sqrt(x^2+x), x+1) = lim_(x arrow (-1)^-) frac(-x(x+1), (x+1) sqrt(x^2+x)) = lim_(x arrow (-1)^-) frac(-x, sqrt(x^2+x)) = +infinity$

$f$ n'est pas dérivable à gauche en (-1).

b) $lim_(x arrow 0^+) frac(f(x) - f(0), x-0) = -infinity$ et $lim_(x arrow (-1)^-) frac(f(x) - f(-1), x+1) = +infinity$

d'où $(C)$ admet deux demi tangentes verticales aux points d'abscisses respectives $-1$ _et_ $0$.

4) \* $x in D_f$ $arrow.double$ $x lt.eq -1$ _ou_ $x gt.eq 0$ $arrow.double$ $-x gt.eq 1$ _ou_ $-x lt.eq 0$

$arrow.double -1 - x gt.eq 0$ _ou_ $-1 - x lt.eq -1$ $arrow.double (-1-x) in D_f$

\* $f(-1-x) = 1 - sqrt((-1-x)^2 + (-1-x)) = sqrt(1 + 2x + x^2 - 1 - x) = 1 - sqrt(x^2 + x) = f(x)$

Conclusion : la droite $Delta : x = -frac(1,2)$ est axe de symétrie de $(C)$.

// Source: Corrigé T2 p.37
5)

$lim_(x arrow +infinity)[f(x) - (-x + frac(1,2))] = lim_(x arrow +infinity)[(x + frac(1,2)) - sqrt(x^2 + x)] = lim_(x arrow +infinity) frac((x+frac(1,2))^2 - (x^2+x), (x+frac(1,2)) + sqrt(x^2+x)) = lim_(x arrow +infinity) frac(1\/4, (x+frac(1,2)) + sqrt(x^2+x)) = 0$

la droite $D : y = -x + frac(1,2)$ est une asymptote à $(C)$ au voisinage de $+infinity$.

6)
#align(center)[
  #table(
    columns: 5,
    align: center,
    [$x$], [$-infinity$], [$-1$], [$4$], [$+infinity$],
    [$f'(x)$], [$-$], [$||$], [], [$+$],
    [$f(x)$], [$+infinity arrow.b$], [$0$], [], [$0 arrow.t$], [$+infinity$],
  )
]

// Figure: Graphe de f avec les asymptotes Delta et D, demi tangentes verticales en x=-1 et x=0


=== Exercice 20

Soit f la fonction definie par $f(x) = x + sqrt(x^2 - 3x + 4)$.

On designe par $C_f$ et $C_g$ leurs courbes representatives dans un repere orthogonal $(O, arrow(i), arrow(j))$.

1. Etudier f.

2. a. Etudier la derivabilite de f a gauche en 1 et en deduire...

droite en $x_0$.

3. En deduire que C admet deux demi-tangentes verticales que l'on precisera.

4. Determiner alors.

#h(0.5cm) a. Tracer $C_f$ et $C_g$.

#h(0.5cm) b. Verifier que $C_f subset.eq C_g$ pour equation

$x^2 + y^2 - 3x - 4y + 4 = 0$.

et le point $Q (frac(3, 2), frac(1, 2))$.

Se proposer de determiner une equation de $C_1 union C_2$ dans le repere $(O, arrow(overline(X)), arrow(overline(Y)))$.

Soit M un point du plan, on designe par $(x, y)$ ses coordonnees dans $(O, arrow(i), arrow(j))$ et par $(X, Y)$ celles dans $(O, arrow(overline(X)), arrow(overline(Y)))$.

a. Exprimer x et y en fonction de X et Y.

b. En deduire que M appartient a $C_1 union C_2$ si et seulement si, $Y = ... X_0$.

c. Conclure. #h(8cm) ISX

// Source: Manuel T1 p.134

// Source: Corrigé T2 p.37-40
==== Corrigé

1) $f(x) = sqrt(x^2 - 3x - 4)$

$x^2 - 3x - 4 = 0$ ; $a - b + c = 0$, $x' = -1$ _et_ $x'' = 4$

$D_f = ]-infinity, -1] union [4, +infinity[$

#align(center)[
  #table(
    columns: 5,
    align: center,
    [$x$], [$-infinity$], [$-1$], [$4$], [$+infinity$],
    [$x^2 - 3x - 4$], [$+$], [$0$], [$-$], [$0$], [$+$],
  )
]

// Source: Corrigé T2 p.38
\* $f$ est continue sur $D_f = ]-infinity, -1] union [4, +infinity[$, dérivable sur $]-infinity, -1[ union ]4, +infinity[$ et

$f'(x) = -frac(2x - 3, 2sqrt(x^2 - 3x - 4))$

$lim_(x arrow +infinity)(x^2 - 3x - 4) = lim_(x arrow +infinity)(x^2) = +infinity$

d'où #h(1em) $lim_(x arrow +infinity) f(x) = +infinity$ #h(1em) de même #h(1em) $lim_(x arrow -infinity) f(x) = +infinity$

2) a)

$lim_(x arrow (-1)^-) frac(f(x) - f(-1), x+1) = lim_(x arrow (-1)^-) frac(sqrt(x^2-3x-4), x+1)$

\* $= lim_(x arrow (-1)^-) frac((x+1)(x-4), (x+1)sqrt(x^2-3x-4)) = lim_(x arrow (-1)^-) frac(x-4, sqrt(x^2-3x-4)) = -infinity$

$f$ n'est pas dérivable à gauche en (-1).

\* $lim_(x arrow 4^+) frac(f(x) - f(4), x-4) = lim_(x arrow 4^+) frac(sqrt(x^2-3x-4), x-4) = lim_(x arrow 4^+) frac((x+1)(x-4), (x-4) sqrt(x^2-3x-4)) = lim_(x arrow 4^+) frac(x+1, sqrt(x^2-3x-4)) = +infinity$

$f$ n'est pas dérivable à droite en 4.

b) $lim_(x arrow 4^+) frac(f(x) - f(0), x-0) = +infinity$ et $lim_(x arrow (-1)^-) frac(f(x) - f(-1), x+1) = -infinity$

d'où $(C)$ admet deux demi tangentes verticales aux points d'abscisses respectives $-1$ _et_ $4$.

3) a) forme canonique : $x^2 - 3x - 4 = (x - frac(3,2))^2 - frac(25,4)$

b) \* $lim_(x arrow +infinity)[f(x) - x + frac(3,2)] = lim_(x arrow +infinity)[sqrt((x-frac(3,2))^2 - frac(25,4)) - (x - frac(3,2))] = lim_(x arrow +infinity) frac(-25\/4, sqrt((x-frac(3,2))^2 - frac(25,4)) + (x - frac(3,2))) = 0$

\* $lim_(x arrow -infinity)[f(x) + x - frac(3,2)] = lim_(x arrow -infinity)[sqrt((x-frac(3,2))^2 - frac(25,4)) + (x - frac(3,2))] = lim_(x arrow -infinity) frac(-25\/4, sqrt((x-frac(3,2))^2 - frac(25,4)) - (x - frac(3,2))) = 0$

c) la droite $Delta_1 : y = x - frac(3,2)$ est une asymptote à $(C)$ au voisinage de $+infinity$

la droite $Delta_2 : y = -x + frac(3,2)$ est une asymptote à $(C)$ au voisinage de $-infinity$

// Source: Corrigé T2 p.39
4) a) $g = -f$, d'ou $(C_g) = S_((O x))(C)$

// Figure: Graphe de f et g = -f avec asymptotes Delta_1 et Delta_2

b) $M(x, y) in (C_f) union (C_g)$ $arrow.l.r.double$ $cases(y = f(x), "ou", y = -f(x))$ $arrow.l.r.double$ $y^2 = [f(x)]^2$

$arrow.l.r.double y^2 = x^2 - 3x - 4 arrow.l.r.double x^2 - y^2 - 3x - 4 = 0$

5) a) $bold(M)(x,y)_((O, arrow(i), arrow(j)))$ $arrow.l.r.double$ $arrow(O M) = x dot arrow(i) + y dot arrow(j)$

$bold(M)(X, Y)_((O', arrow(u), arrow(v)))$ $arrow.l.r.double$ $arrow(O' M) = X dot arrow(u) + Y dot arrow(v)$

D'une part: $arrow(O' M) = X dot (arrow(i) - arrow(j)) + Y dot (arrow(i) + arrow(j)) = (X + Y) dot arrow(i) + (Y - X) dot arrow(j)$

D'autre part: $arrow(O' M) = arrow(O M) - arrow(O O') = x dot arrow(i) + y dot arrow(j) - frac(3,2) arrow(i) = (x - frac(3,2)) dot arrow(i) + y dot arrow(j)$

Donc $cases(x - frac(3,2) = X + Y, y = -X + Y)$ ce qui donne $cases(x = X + Y + frac(3,2), y = -X + Y)$

// Source: Corrigé T2 p.40
b) $M(x, y) in (C_f) union (C_g)$ $arrow.l.r.double$ $x^2 - y^2 - 3x - 4 = 0$

$arrow.l.r.double (X + Y + frac(3,2))^2 - (Y - X)^2 - 3(X + Y + frac(3,2)) - 4 = 0$

$arrow.l.r.double (X + Y)^2 + frac(9,4) + 3(X + Y) - (Y - X)^2 - 3(X + Y + frac(3,2)) - 4 = 0$

$arrow.l.r.double 4 dot X Y + frac(9,4) - frac(9,2) - 4 = 0 arrow.l.r.double bold(Y) = frac(25, bold(16 X))$

c) soit $bold(h)(X) = frac(25, 16 X)$

$(C_f) union (C_g) = (C_h)$ l'hyperbole tracée dans le repère $(O', arrow(u), arrow(v))$.

// Source: Manuel T1 p.134
== Avec l'ordinateur

Dans le plan muni d'un repere orthonorme

$(O, arrow(i), arrow(j))$, on designe par B le point $A(0, 2)$.

A tout reel t, on designe par M le point de $(O, arrow(i))$, la fonction f qui a tout reel t, associe le diametre OE, puis le point E, puis le segment $[O E]$.

2. On note le cercle C de rayon R passant par A.

#h(0.5cm) Ajoute A tout reel t, associe le centre de M.

3. On raisonne dans le cas d'un "invariant" :

#h(0.5cm) repondre a la question : "quelle est la forme de la courbe du point A lorsque le point E parcourt le cercle C ?"

4. On utilise le programme suivant sur son ordinateur :

5. On croit le point M de coordonnees $(4, 0)$, $(E, ...)$.

#h(0.5cm) Dupliquer le point E sur l'axe des abscisses et construire les positions de M.

6. On cree les deux points M et N au moyen de la commande sur l'ordinateur.

$(O, arrow(i))$ #h(8cm) "sur"

// Source: Manuel T1 p.135

== Math - culture

Le lancement d'un nouveau produit sur le marche suit une *loi logistique* : la courbe est d'abord tres ascendante, puis s'inflechit et sa croissance ralentit et enfin elle s'aligne sur une asymptote horizontale. C'est ainsi qu'ont ete introduits les produits electromenagers, la machine a laver, la TV en couleurs etc., et aussi les services de telecommunications.

La *fonction logistique* fait partie depuis longtemps de l'arsenal theorique du marketing. L'une de ses expressions est la "*loi de Gompertz*".

#cetz.canvas({
  import cetz.draw: *
  // Axes
  line((-0.5, 0), (8, 0), stroke: 0.5pt, mark: (end: ">"))
  line((0, -0.5), (0, 4.5), stroke: 0.5pt, mark: (end: ">"))
  // Graduation y
  content((-0.3, 0.8), text(size: 7pt)[$0,2$])
  content((-0.3, 1.6), text(size: 7pt)[$0,4$])
  content((-0.3, 2.4), text(size: 7pt)[$0,6$])
  content((-0.3, 3.2), text(size: 7pt)[$0,8$])
  content((-0.3, 4), text(size: 7pt)[$1$])
  // Courbe logistique (sigmoide)
  bezier((0, 0.1), (1.5, 0.3), (0.5, 0.1), (1, 0.15), stroke: blue + 1.5pt)
  bezier((1.5, 0.3), (3, 1.5), (2, 0.5), (2.5, 0.9), stroke: blue + 1.5pt)
  bezier((3, 1.5), (4.5, 3.5), (3.5, 2.2), (4, 3), stroke: blue + 1.5pt)
  bezier((4.5, 3.5), (7, 3.9), (5, 3.7), (6, 3.85), stroke: blue + 1.5pt)
  // Asymptote y = 1
  line((0, 4), (7.5, 4), stroke: (dash: "dashed", paint: gray))
  // Titre
  content((4, 4.3), text(size: 8pt)[_Loi de Gompertz_])
})

Une torche qui emet des faisceaux de lumiere divergents forme un cone. Lorsqu'on dirige ces faisceaux vers un mur avec un certain angle, leur "intersection" avec ce mur sera une *hyperbole*.
