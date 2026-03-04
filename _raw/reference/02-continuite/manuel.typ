// =============================================================================
// Module 2 : Continuité
// Programme : 3ème Math (Tunisie)
// Source : Manuel scolaire CNP (T1, p.21–39) + Corrigé CMS (T1, p.16–26)
// =============================================================================

= Chapitre 2 : Continuité

#emph[« Quelque fois on a besoin de dire des choses difficiles, mais on devrait tâcher de les dire aussi simplement que l'on peut. »]

#align(right)[*Hardy*]

// Source: Manuel T1 p.22
== Pour commencer

=== Activité 1

Résoudre dans $RR$ les inéquations suivantes.

1) $|x - 1| < frac(1, 2)$ #h(2cm) ; #h(1cm) 2) $|x + frac(1, 2)| < 0.1$ #h(2cm) ; #h(1cm) 3) $|x - 2| > 0.2$

=== Activité 2

Le plan est muni d'un repère orthonormé $(O, arrow(i), arrow(j))$.

1. Représenter sur l'axe des ordonnées l'ensemble des réels y tels que $|y - 2| < frac(1, 2)$.

2. Représenter sur l'axe des abscisses l'ensemble des réels x tels que $|x + 1| < 0.2$.

3. En déduire l'ensemble des points $M(x, y)$ du plan tels que

$ cases(
  |x + 1| < 0.2\,,
  |y - 2| < frac(1, 2)
) $

=== Activité 3

Le plan est muni d'un repère orthonormé $(O, arrow(i), arrow(j))$.

1. Tracer la parabole d'équation $y = x^2$.

2. a. Représenter l'ensemble des points $M(x, y)$ de la courbe, tels que $y in ]0.5 , 1.5[$.

#h(0.5cm) b. Déterminer graphiquement l'ensemble des abscisses de ces points.

// Source: Manuel T1 p.23
== Cours

=== 1. Continuité en un réel

==== Activité 1

Soit f la fonction définie pour tout réel x par

$ f(x) = cases(
  2x + 1 & "si" x > 1,
  3 & "si" x = 1,
  3x - 1 & "si" x < 1
) $

1. Représenter la fonction $f$ dans le plan muni d'un repère orthonormé $(O, arrow(i), arrow(j))$.

2. a. Représenter sur l'axe des ordonnées, l'ensemble des réels y tels que $|y - 3| < 0.1$.

#h(0.5cm) b. En déduire graphiquement, une condition suffisante sur x pour que $|f(x) - 3| < 0.1$.

3. Donner graphiquement une condition suffisante sur x pour que $|f(x) - 3| < 0.01$.

L'activité précédente suggère que $f(x)$ peut être rendu aussi proche que l'on veut de $f(1)$, dès que x est suffisamment proche de 1.

On dit que f est continue en 1.

#block(fill: rgb("#f0f7ff"), inset: 12pt, radius: 4pt, width: 100%)[
  *Définition*

  Soit $f$ une fonction définie sur un intervalle ouvert I et a un réel de I.

  On dit que la fonction f est continue en a si pour tout nombre $beta > 0$, il existe un nombre $alpha > 0$ tel que : si $x in I$ et $|x - a| < alpha$, alors $|f(x) - f(a)| < beta$.
]

==== Activité 2

Le plan est muni d'un repère orthonormé $(O, arrow(i), arrow(j))$.

On a représenté la fonction f définie par

$ f(x) = cases(
  1 & "si" x > 0,
  -1 & "si" x = 0,
  0 & "si" x < 0
) $

1. Reproduire la figure.

2. Calculer $|f(x) - f(0)|$.

3. Peut-on rendre la quantité $|f(x) - f(0)|$ aussi petite que l'on veut, en rapprochant x de 0 ?

L'activité précédente illustre le cas d'une fonction non continue en 0.

*Vocabulaire*

Une fonction non continue en a est dite discontinue en a.

// Source: Manuel T1 p.24
*Conséquence*

#grid(
  columns: (1fr, 1fr),
  gutter: 1em,
  [Lorsque la représentation graphique de $f$ sur un intervalle ouvert I, est et s'obtient en un seul tracé, la courbe $f$ est continue en tout réel x de I.],
  [Lorsque la représentation graphique de $f$ sur un intervalle ouvert I admet en un seul de ses points un saut au point $( a, f(a))$, la fonction $f$ est discontinue en a.]
)

#cetz.canvas({
  import cetz.draw: *
  // Graphe continu
  line((-0.5, 0), (4, 0), stroke: 0.5pt, mark: (end: ">"))
  line((0, -0.5), (0, 3), stroke: 0.5pt, mark: (end: ">"))
  content((4, -0.3), $x$)
  content((-0.3, 3), $y$)
  // Courbe continue lisse
  bezier((0.5, 0.5), (2, 2.5), (1, 0.5), (1.5, 2.5), stroke: blue + 1.5pt)
  bezier((2, 2.5), (3.5, 1), (2.5, 2.5), (3, 1), stroke: blue + 1.5pt)
  content((2, -0.3), $a$)
  line((2, 0), (2, 2.5), stroke: (dash: "dashed", paint: gray))
  content((-0.4, 2.5), $f(a)$)
  line((0, 2.5), (2, 2.5), stroke: (dash: "dashed", paint: gray))
})

#cetz.canvas({
  import cetz.draw: *
  // Graphe discontinu
  line((-0.5, 0), (4, 0), stroke: 0.5pt, mark: (end: ">"))
  line((0, -0.5), (0, 3), stroke: 0.5pt, mark: (end: ">"))
  content((4, -0.3), $x$)
  content((-0.3, 3), $y$)
  // Courbe avec saut
  bezier((0.5, 0.5), (2, 1.5), (1, 0.5), (1.5, 1.5), stroke: blue + 1.5pt)
  circle((2, 1.5), radius: 0.06, fill: white, stroke: blue + 1pt)
  circle((2, 2.5), radius: 0.06, fill: blue, stroke: blue + 1pt)
  bezier((2, 2.5), (3.5, 2), (2.5, 2.5), (3, 2), stroke: blue + 1.5pt)
  content((2, -0.3), $a$)
  line((2, 0), (2, 1.5), stroke: (dash: "dashed", paint: gray))
  content((-0.5, 2.5), $f(a)$)
  line((0, 2.5), (2, 2.5), stroke: (dash: "dashed", paint: gray))
})

=== 2. Continuité de certaines fonctions usuelles

==== Activité 1

Dans chacun des cas ci-dessous, représenter la fonction et vérifier, en utilisant le graphique, qu'elle est continue en a.

a. La fonction $x |-> x^2$ #h(0.5cm) ; #h(0.5cm) $a = -0.5$.

b. La fonction $x |-> 2x$ #h(0.5cm) ; #h(0.5cm) $a = 1$.

c. La fonction $x |-> sqrt(x)$ #h(0.5cm) ; #h(0.5cm) $a = -3$.

d. La fonction $x |-> 3x + 4$ #h(0.5cm) ; #h(0.5cm) $a = 2$.

Le théorème suivant concerne la continuité de certaines fonctions usuelles, déjà rencontrées dans les années précédentes.

#block(fill: rgb("#e8f5e9"), inset: 12pt, radius: 4pt, width: 100%)[
  *Théorème (admis)*

  Toute fonction constante est continue en tout réel a.

  La fonction $x |-> x$ est continue en tout réel a.

  Toute fonction linéaire est continue en tout réel a.

  Toute fonction affine est continue en tout réel a.

  La fonction $x |-> x^2$ est continue en tout réel a.

  La fonction $x |-> frac(1, x)$ est continue en tout réel non nul a.

  La fonction $x |-> sqrt(x)$ est continue en tout réel strictement positif a.

  Toute fonction polynôme est continue en tout réel.

  Toute fonction rationnelle est continue en tout réel où elle est définie.
]

==== Activité 2

Dans chacun des cas suivants, justifier la continuité de la fonction f en a.

1. $f(x) = 2x^4 + 4x^3 - 1$ #h(1cm) ; #h(0.5cm) $a = 0$.

2. $f(x) = x^7 - frac(3, 100) x^4 + 2x + 1^4 + frac(1, 2)$ #h(1cm) ; #h(0.5cm) $a = sqrt(2)$.

// Source: Manuel T1 p.25

1. $f(x) = x^(frac(1, 2x - 1))$ #h(1cm) ; #h(0.5cm) $a = 0.3$.

2. $f(x) = frac(|x|, x)$ #h(1cm) ; #h(0.5cm) $a = -1$.

3. $f(x) = frac(|x(x - 5)|, (x^2 + 1)(x - 3))$ .

=== 3. Continuité de la fonction $|f|$

==== Activité 1

Montrer que pour tous réels c et d, on a $|c| - |d| lt.eq |c - d|$.

2. Soit f une fonction définie sur un intervalle ouvert I contenant a.

#h(0.5cm) Montrer que si f est continue en a, alors $|f|$ est continue en a.

On a donc obtenu le théorème ci-dessous.

#block(fill: rgb("#e8f5e9"), inset: 12pt, radius: 4pt, width: 100%)[
  *Théorème*

  Soit f une fonction définie sur un intervalle ouvert I et a un réel de I.

  Si f est continue en a, alors $|f|$ est continue en a.
]

==== Activité 2

Dans chacun des cas suivants, justifier la continuité de la fonction f en a.

1. $f : x |-> |2x - 1|$ #h(1cm) ; #h(0.5cm) $a = -3$.

2. $f : x |-> sqrt(x^4 + frac(1, x^2))$ #h(1cm) ; #h(0.5cm) $a = 2$.

3. $f : x |-> frac(x + 4, sqrt(x))$ #h(1cm) ; #h(0.5cm) $a = 1986$.

=== 4. Opérations algébriques sur les fonctions continues

Le théorème ci-dessous que nous admettons, concerne la somme, le produit et le quotient de fonctions continues en un réel.

#block(fill: rgb("#e8f5e9"), inset: 12pt, radius: 4pt, width: 100%)[
  *Théorème*

  Soit f et g deux fonctions définies sur un intervalle ouvert I. Soit a un réel de I et k un réel.

  Si f et g sont continues en a alors les fonctions $f + g$, $f g$ et $k f$ sont continues en a.

  Si f est continue en a et si $f(a) eq.not 0$ alors la fonction $frac(1, f)$ est continue en a.

  Si f et g sont continues en a et si $g(a) eq.not 0$ alors la fonction $frac(f, g)$ est continue en a.
]

==== Activité 1

// Source: Manuel T1 p.26

Dans chacun des cas suivants, justifier la continuité de la fonction f en a.

1. $f(x) = x^(frac(1, 2)) + x$ #h(1cm) ; #h(0.5cm) $a = -frac(1, 2)$

2. $f(x) = frac(|x|, x)$ #h(1cm) ; #h(0.5cm) $a = -1$.

3. $f(x) = frac(|x(x - 5)|, (x^2 + 1)(x - 3))$ .

=== 5. Continuité de la fonction $root(n, f)$

==== Activité 1

1. Représenter la fonction $f : x |-> root(3, x)$ dans le plan muni d'un repère $(O, arrow(i), arrow(j))$.

2. a. Montrer que $|root(3, x) - root(3, 2)| = frac(|x - 2|, root(3, x^2) + root(3, 2x) + root(3, 4))$.

#h(0.5cm) b. En déduire que $|root(3, x) - root(3, 2)| lt.eq frac(|x - 2|, root(3, 4))$.

#h(0.5cm) c. La fonction f est-elle continue en 1 ?

==== Activité 2

Soit f une fonction positive sur un intervalle ouvert I. Soit a un réel de I tel que f soit continue en a.

1. On suppose que $f(a) eq.not 0$.

#h(0.5cm) a. Montrer que pour tout réel x de I, $|sqrt(f(x)) - sqrt(f(a))| = frac(|f(x) - f(a)|, sqrt(f(x)) + sqrt(f(a)))$.

#h(0.5cm) b. En déduire que pour tout réel x de I, $|sqrt(f(x)) - sqrt(f(a))| lt.eq frac(|f(x) - f(a)|, sqrt(f(a)))$.

#h(0.5cm) c. En déduire que $sqrt(f)$ est continue en a.

2. On suppose que $f(a) = 0$.

#h(0.5cm) a. Écrire la définition de la continuité de f en a.

#h(0.5cm) b. En déduire que $sqrt(f)$ est continue en a.

On a donc obtenu le théorème ci-dessous.

#block(fill: rgb("#e8f5e9"), inset: 12pt, radius: 4pt, width: 100%)[
  *Théorème*

  Soit f une fonction définie et positive sur un intervalle ouvert I et a un réel de I.

  Si f est continue en a, alors la fonction $root(n, f)$ est continue en a.
]

==== Activité 3

Dans chacun des cas suivants, étudier la continuité de la fonction f en a.

1. $f(x) = root(3, frac(-2, x + 1))$ #h(1cm) ; #h(0.5cm) $a = 3$.

2. $f(x) = root(5, x^3 - 2x + 1)$ #h(1cm) ; #h(0.5cm) $a = 1$.

3. $f(x) = frac(x - 3, sqrt(x - 2))$.

// Source: Manuel T1 p.27
==== Activité 4

Dans la figure ci-contre ABCD est un carré de côté 1, M est un point du segment $[A B]$, distinct de A et B et tel que $D M = x$.

On désigne par f la fonction $x |-> A M$.

1. Donner l'ensemble de définition I de f.

2. Montrer que f est continue en tout point de I.

#cetz.canvas({
  import cetz.draw: *
  // Carre ABCD
  rect((0, 0), (3, 3), stroke: 0.5pt)
  content((-0.2, -0.2), $A$)
  content((3.2, -0.2), $B$)
  content((3.2, 3.2), $C$)
  content((-0.2, 3.2), $D$)
  // Point M sur [AB]
  circle((2, 0), radius: 0.04, fill: black)
  content((2, -0.3), $M$)
  // Segment DM
  line((-0, 3), (2, 0), stroke: 0.5pt)
  content((0.7, 1.7), $x$)
})

==== Activité 5

Dans le plan muni d'un repère orthonormé $(O, arrow(i), arrow(j))$, on considère la droite D d'équation $y = 2x + 1$ et le point $A(0, 4)$.

À tout réel x, on associe le point P appartenant à la droite D, d'abscisse x.

1. Calculer AP en fonction de x.

2. Soit f la fonction définie sur $RR$ par $f(x) = A P$.

#h(0.5cm) a. Montrer que f est continue pour tout réel x.

#h(0.5cm) b. Montrer que la fonction f admet un minimum sur $RR$ que l'on déterminera.

// Source: Manuel T1 p.27 (suite)
=== 6. Continuité à droite. Continuité à gauche

==== Activité 1

Soit f la restriction à l'intervalle $[0, 3]$ de la fonction partie entière $x |-> E(x)$.

1. Représenter graphiquement $f$ dans un repère $(O, arrow(i), arrow(j))$.

2. La fonction f est-elle continue en 2 ? Justifier graphiquement.

3. Que peut-on dire de $|f(x) - 2|$ lorsque x est suffisamment proche de 2 en restant supérieur à 2 ?

4. Que peut-on dire de $|f(x) - 2|$ lorsque x se rapproche de 2 en restant inférieur à 2 ?

==== Activité 2

Le plan est muni d'un repère $(O, arrow(i), arrow(j))$.

On a représenté ci-contre, une fonction g définie sur $RR$.

1. La fonction g est-elle continue en 1 ?

2. Déterminer $g(1)$.

3. Donner graphiquement une condition suffisante sur les réels x inférieurs à 1, pour que $|g(x) - g(1)| lt.eq 0.1$.

4. Que peut-on conjecturer sur $|g(x) - g(1)|$ lorsque x se rapproche de 1 en restant supérieur à 1 ?

// Source: Manuel T1 p.28

#block(fill: rgb("#f0f7ff"), inset: 12pt, radius: 4pt, width: 100%)[
  *Définition*

  Soit f une fonction définie sur un intervalle I et a un réel de I.

  On dit que la fonction f est continue à droite en a si, pour tout $beta > 0$, il existe un $alpha > 0$ tel que : si x appartient à I et $0 lt.eq x - a < alpha$, alors $|f(x) - f(a)| < beta$.

  On dit que la fonction f est continue à gauche en a si, pour tout $beta > 0$, il existe un $alpha > 0$ tel que : si x appartient à I et $0 lt.eq a - x < alpha$, alors $|f(x) - f(a)| < beta$.
]

Le théorème que suit, établit le lien entre la continuité en un réel a et la continuité à droite et à gauche en a et se déduit des définitions.

#block(fill: rgb("#e8f5e9"), inset: 12pt, radius: 4pt, width: 100%)[
  *Théorème*

  Soit f une fonction définie sur un intervalle ouvert contenant a.

  f est continue en a, si et seulement si, f est continue à droite et à gauche en a.
]

==== Activité 3

1. Soit la fonction $f : x |-> |x|^(frac(1, 2)) + x$. Étudier la continuité à droite (respectivement à gauche) de f en $-1$.

2. Soit la fonction $f : x |-> root(3, |x|^(frac(1, 2))) + 4$. Étudier la continuité à droite de f en 2.

3. Soit la fonction $f : x |-> frac(root(3, x), 2)$. Étudier la continuité à gauche de f en 3.

==== Activité 4

Soit la fonction $x |-> sqrt(x)$.

1. Représenter graphiquement $f$ dans un repère $(O, arrow(i), arrow(j))$.

2. Montrer que f est continue à droite en 0.

#block(fill: rgb("#e8f5e9"), inset: 12pt, radius: 4pt, width: 100%)[
  *Théorème (admis)*

  Si f est continue à droite en a, alors la fonction $root(n, f)$ est continue à droite en a.

  Si f est continue à gauche en a, alors la fonction $root(n, f)$ est continue à gauche en a.
]

==== Activité 5

1. Soit la fonction $f : x |-> sqrt(2x + 1)$. Justifier que f est continue à gauche en 0.5.

2. Soit la fonction $f : x |-> root(4, (3x + 5)(1 - x))$. Justifier que f est continue à droite en $-frac(5, 3)$.

// Source: Manuel T1 p.29
=== 7. Continuité sur un intervalle

#block(fill: rgb("#f0f7ff"), inset: 12pt, radius: 4pt, width: 100%)[
  *Définition*

  - Soit a et b finis ou infinis.

  Une fonction définie sur un intervalle $]a, b[$ est dite continue sur $]a, b[$ si elle est continue en tout réel de $]a, b[$.

  - Soit a fini ou infini et b un réel.

  Une fonction définie sur un intervalle $]a, b]$ est dite continue sur $]a, b]$ si elle est continue sur $]a, b[$ et continue à gauche en b.

  - Soit a un réel et b fini ou infini.

  Une fonction définie sur un intervalle $[a, b[$ est dite continue sur $[a, b[$ si elle est continue sur $]a, b[$ et continue à droite en a.

  - Soit a et b deux réels.

  Une fonction définie sur un intervalle $[a, b]$ est dite continue sur $[a, b]$ si elle est continue sur $]a, b[$, continue à droite en a et continue à gauche en b.
]

*Conséquence*

Si une fonction est continue sur un intervalle I, alors elle est continue sur tout intervalle inclus dans I.

*Conséquence*

Toute fonction polynôme est continue sur tout intervalle contenu dans $RR$.

Toute fonction rationnelle est continue sur tout intervalle contenu dans son ensemble de définition.

==== Activité 1

On considère la fonction g définie sur $RR$, telle que

- $g(x) = (x - 1)^2 + 0.5$ #h(0.5cm) si $x gt.eq 1$,

- la restriction de g à $]-infinity, 1[$ est une fonction linéaire,

- la fonction g est continue sur $RR$.

1. Représenter la fonction g dans un repère $(O, arrow(i), arrow(j))$.

2. Donner l'expression de $g(x)$ pour tout x de $RR$.

==== Activité 2

Justifier les affirmations suivantes.

1. La fonction $x |-> |x| + 1$ est continue sur $RR$.

2. La fonction $x |-> sqrt(x + 1)$ est continue sur $[0, 1]$.

3. La fonction $x_(|->)x lt.eq 5$ est continue sur l'intervalle $]-0.1, 10]$.

4. La fonction $x |-> frac(2x - 3, x - 1)$ est continue sur l'intervalle $[-1, 0]$.

// Source: Manuel T1 p.29 (suite)

5. La fonction $x |-> sqrt(-2x + 1)$ est continue sur l'intervalle $[-0.1, 0.3]$.

6. La fonction $x |-> sqrt(-3x + 6)$ est continue sur $]- infinity, 2]$.

7. La fonction $x |-> frac(2x - 3, x - 1)$ est continue sur $]-2, 0]$.

// Source: Manuel T1 p.30
=== 8. Image d'un intervalle par une fonction continue

==== Activité 1

On a représenté ci-contre la fonction $f : x |-> x(x - 1)^2$.

1. Justifier la continuité de f sur $RR$.

2. Reproduire le graphique ci-contre et représenter chacun des ensembles de réels suivants :

$f(]2, +infinity[)$ ; $f(]-infinity, 1[)$ ; $f([0.2, 0.6])$ ; $f({x ; -0.5 lt.eq x "et" x gt.eq 2 })$.

Lequel de ces ensembles n'est pas un intervalle ?

3. Montrer que $f(]-1, 4[) = ]-4, 9[$.  // Note: checking bounds from image

4. Résoudre graphiquement l'équation $f(x) = 5$.

#cetz.canvas({
  import cetz.draw: *
  // Axes
  line((-1.5, 0), (3.5, 0), stroke: 0.5pt, mark: (end: ">"))
  line((0, -1.5), (0, 4.5), stroke: 0.5pt, mark: (end: ">"))
  content((3.5, -0.3), $x$)
  content((-0.3, 4.5), $y$)
  content((-0.2, -0.2), $O$)
  // Courbe f(x) = x(x-1)^2
  // Points cles: f(0)=0, f(1/3)=4/27~0.15 max local, f(1)=0, f(2)=2
  bezier((-1, -4), (0, 0), (-0.5, -1.5), (-0.2, 0), stroke: blue + 1.2pt)
  bezier((0, 0), (0.33, 0.15), (0.1, 0.1), (0.25, 0.15), stroke: blue + 1.2pt)
  bezier((0.33, 0.15), (1, 0), (0.5, 0.1), (0.8, 0), stroke: blue + 1.2pt)
  bezier((1, 0), (3, 12), (1.5, 0.5), (2.5, 6), stroke: blue + 1.2pt)
})

#block(fill: rgb("#fff7f0"), inset: 12pt, radius: 4pt, width: 100%)[
  *Soit f une fonction définie sur une partie D de $RR$ et A une partie de D. L'ensemble des $f(x)$ tels que x appartient à A est noté $f(A)$.*

  On écrit alors $f(A) = {f(x) ; x in A}$.
]

==== Activité 2

On a représenté ci-contre la fonction $f : x |-> frac(x, x^2 + 1)$.

1. Justifier la continuité de f sur chacun des intervalles $]-infinity, -frac(1, 2)]$ et $[frac(1, 2), +infinity[$.

2. Reproduire le graphique ci-contre et représenter les ensembles ci-dessous.

#h(0.5cm) a. $f(]-1, 2])$. #h(2cm) b. $f(]-3, 5] sect {2})$.

#cetz.canvas({
  import cetz.draw: *
  // Axes
  line((-3, 0), (4, 0), stroke: 0.5pt, mark: (end: ">"))
  line((0, -1.5), (0, 1.5), stroke: 0.5pt, mark: (end: ">"))
  content((4, -0.3), $x$)
  content((-0.3, 1.5), $y$)
  content((-0.2, -0.2), $O$)
  // Courbe f(x) = x/(x^2+1)
  // f(0)=0, f(1)=0.5, f(-1)=-0.5, max en 1 = 0.5, min en -1 = -0.5
  bezier((-3, -0.3), (-1, -0.5), (-2, -0.4), (-1.5, -0.5), stroke: blue + 1.2pt)
  bezier((-1, -0.5), (0, 0), (-0.5, -0.3), (-0.2, 0), stroke: blue + 1.2pt)
  bezier((0, 0), (1, 0.5), (0.2, 0), (0.5, 0.3), stroke: blue + 1.2pt)
  bezier((1, 0.5), (3.5, 0.25), (1.5, 0.5), (2.5, 0.3), stroke: blue + 1.2pt)
})

==== Activité 3

1. Représenter dans un repère $(O, arrow(i), arrow(j))$ la fonction f définie par

$ f(x) = cases(
  x & "si" x lt.eq 0,
  3x + 5 & "si" 0 < x lt.eq 0,
  x^2 + 1 & "si" x > 0
) $

2. Montrer graphiquement que f n'est pas continue en 0.

3. Déterminer $f(RR)$. Cet ensemble est-il un intervalle ?

4. Montrer que l'équation $f(x) = 0$ ne possède pas de solution.

5. Que peut-on dire de l'équation $f(x) = a$ ; $a eq.not 0$ ?

#block(fill: rgb("#e8f5e9"), inset: 12pt, radius: 4pt, width: 100%)[
  *Théorème (admis)*

  L'image d'un intervalle par une fonction continue est un intervalle.
]

// Source: Manuel T1 p.31
=== 9. Résolution d'équations de la forme $f(x) = k$

==== Activité 1

On a représenté dans le graphique ci-contre la fonction $x |-> x^4 dot x - 1$.

Donner un encadrement d'amplitude 0.5 des solutions de chacune des équations $f(x) = 2$ ; $f(x) = 8$.

#cetz.canvas({
  import cetz.draw: *
  // Axes
  line((-1, 0), (3, 0), stroke: 0.5pt, mark: (end: ">"))
  line((0, -2), (0, 8), stroke: 0.5pt, mark: (end: ">"))
  content((3, -0.3), $x$)
  content((-0.3, 8), $y$)
  content((-0.2, -0.2), $O$)
  // Courbe
  bezier((0, -1), (1, 0), (0.3, -0.8), (0.7, -0.2), stroke: blue + 1.2pt)
  bezier((1, 0), (2.5, 7), (1.5, 1), (2, 4), stroke: blue + 1.2pt)
})

==== Activité 2

Soit f la fonction définie sur $[0, +infinity[$ par $f(x) = x^3 - 3$.

1. Montrer que f est croissante sur $[0, +infinity[$.

2. Déterminer l'intervalle $f([0, 2])$.

3. En déduire que l'équation $x^3 - 3 = 0$ possède une solution dans l'intervalle $[0, 2]$.

==== Activité 3

1. a. Représenter les fonctions $f : x |-> sqrt(x + 5)$ #h(0.5cm) et #h(0.5cm) $g : x |-> x^2 + 1$.

#h(0.5cm) b. Résoudre graphiquement l'équation (E) : $sqrt(x + 5) - x^2 - 1 = 0$.

#h(0.5cm) c. Donner un encadrement d'amplitude 0.1 de la solution de l'équation (E).

2. On considère la fonction $h : x |-> sqrt(x + 5) - x^2 - 1$.

#h(0.5cm) a. Calculer $h(0)$ et $h(1)$.

#h(0.5cm) b. Justifier que 0 appartient à l'intervalle $h([0, 1])$.

#h(0.5cm) c. En déduire que l'équation (E) possède au moins une solution dans l'intervalle $[0, 1]$.

Le théorème suivant, que nous admettons, nous donne une condition suffisante pour qu'une équation de la forme $f(x) = k$ possède une solution.

#block(fill: rgb("#e8f5e9"), inset: 12pt, radius: 4pt, width: 100%)[
  *Théorème (admis)*

  Soit f une fonction définie et continue sur un intervalle I.

  Soit a et b deux réels de I tels que $a < b$.

  Pour tout réel k compris entre $f(a)$ et $f(b)$, l'équation $f(x) = k$ possède au moins une solution dans l'intervalle $[a, b]$.
]

#cetz.canvas({
  import cetz.draw: *
  // Illustration du TVI
  line((-0.5, 0), (5, 0), stroke: 0.5pt, mark: (end: ">"))
  line((0, -0.5), (0, 4), stroke: 0.5pt, mark: (end: ">"))
  content((5, -0.3), $x$)
  content((-0.3, 4), $y$)
  // Courbe
  bezier((1, 1), (4, 3), (2, 0.5), (3, 3.5), stroke: blue + 1.2pt)
  // Points a, b sur axe x
  content((1, -0.3), $a$)
  content((4, -0.3), $b$)
  // f(a), f(b) sur axe y
  content((-0.4, 1), $f(a)$)
  content((-0.4, 3), $f(b)$)
  // k
  content((-0.3, 2), $k$)
  // Lignes pointillees
  line((0, 1), (1, 1), stroke: (dash: "dashed", paint: gray))
  line((1, 0), (1, 1), stroke: (dash: "dashed", paint: gray))
  line((0, 3), (4, 3), stroke: (dash: "dashed", paint: gray))
  line((4, 0), (4, 3), stroke: (dash: "dashed", paint: gray))
  // Ligne k
  line((0, 2), (5, 2), stroke: (dash: "dashed", paint: red + 0.5pt))
})

// Source: Manuel T1 p.32
==== Activité 4

Dans le plan muni d'un repère $(O, arrow(i), arrow(j))$, on a représenté la fonction f définie sur $RR$ par $f(x) = 2x^3 - 3x^2 - 12x + 5$.

1. Justifier la continuité de f sur $RR$.

2. a. Calculer $f(-3)$ et $f(-2)$. En déduire que l'équation $f(x) = 0$ admet au moins une solution dans l'intervalle $[-3, -2]$.

#h(0.5cm) b. Calculer $f(0)$ et $f(1)$. En déduire que l'équation $f(x) = 0$ admet au moins une solution dans l'intervalle $[0, 1]$.

#h(0.5cm) c. Calculer $f(3)$ et $f(4)$. En déduire que l'équation $f(x) = 0$ admet au moins une solution dans l'intervalle $[3, 4]$.

#h(0.5cm) d. Montrer que l'équation $f(x) = 0$ admet exactement trois solutions réelles distinctes.

3. On désigne par $alpha$ la solution de l'équation $f(x) = 0$ dans l'intervalle $[0, 1]$.

#h(0.5cm) a. Donner une valeur approchée à l'unité près par défaut de $alpha$.

#h(0.5cm) b. Calculer $f(0.1)$, $f(0.2)$, $f(0.3)$, $f(0.4)$, $f(0.5)$, $f(0.6)$, $f(0.7)$, $f(0.8)$, $f(0.9)$, et en déduire une valeur approchée à $0.1$ près par défaut de $alpha$.

#h(0.5cm) c. Donner une valeur approchée, à 0.01 près par défaut de $alpha$.

4. On désigne par $beta$ la solution de l'équation $f(x) = 0$ dans l'intervalle $[-3, -2]$.

#h(0.5cm) Donner une valeur approchée, à 0.1 près par défaut, de $beta$.

5. On désigne par $lambda$ la solution de l'équation $f(x) = 0$ sur l'intervalle $[3, 4]$.

#h(0.5cm) Donner une valeur approchée, à 0.1 près par excès, de $lambda$.

#cetz.canvas({
  import cetz.draw: *
  // Axes
  line((-3.5, 0), (4.5, 0), stroke: 0.5pt, mark: (end: ">"))
  line((0, -20), (0, 15), stroke: 0.5pt, mark: (end: ">"))
  content((4.5, -1), $x$)
  content((-0.5, 15), $y$)
  content((-0.3, -1), $O$)
  // Courbe f(x) = 2x^3 - 3x^2 - 12x + 5
  // Points cles: f(-3)=-40, f(-1)=12, f(0)=5, f(1)=-8, f(2)=-15, f(3)=-4, f(4)=21
  bezier((-3, -8), (-1, 12), (-2, 2), (-1.5, 12), stroke: blue + 1.2pt)
  bezier((-1, 12), (0, 5), (-0.5, 10), (-0.2, 6), stroke: blue + 1.2pt)
  bezier((0, 5), (2, -15), (0.5, 0), (1.5, -15), stroke: blue + 1.2pt)
  bezier((2, -15), (4, 21), (2.5, -15), (3.5, 10), stroke: blue + 1.2pt)
})

// Source: Manuel T1 p.33
== QCM - Vrai ou Faux

=== QCM

Cocher la réponse exacte.

1. Dans le plan muni d'un repère $(O, arrow(i), arrow(j))$, $C_1$, $C_2$, $C_3$ et $C_4$ sont les courbes représentatives de trois fonctions $f$, $g$ et $k$.

Une seulement parmi ces fonctions est discontinue en a, laquelle ?

#h(1cm) $square$ f #h(2cm) $square$ g #h(2cm) $square$ h.

2. La fonction $f : x |-> sqrt(2x + 1)$ est continue en

#h(1cm) $square$ 0 #h(2cm) $square$ $-frac(1, 2)$ #h(2cm) $square$ $frac(1, 2)$.

3. Dans le plan muni d'un repère $(O, arrow(i), arrow(j))$, $C_f$ est la courbe représentative de la fonction $f$. Alors f est continue

#h(1cm) $square$ en $-1$ #h(1.5cm) $square$ à droite en $-1$ #h(1.5cm) $square$ à gauche en $-1$.

4. L'équation $4 sqrt(x + 1) - x^2 - 3 = 0$ possède une solution dans

#h(1cm) $square$ $[0, 1]$ #h(1.5cm) $square$ $[-1, 0]$ #h(1.5cm) $square$ $[2, 3]$.

5. La fonction $E : x |-> E(x)$ est continue sur

#h(1cm) $square$ $[1, 2]$ #h(1.5cm) $square$ $[1, 2[$ #h(1.5cm) $square$ $]1, 2[$.

=== Corrigé du QCM

*1)* $g$ est discontinue en $a$ #h(2em) $arrow.r$ *(b)*

*2)* $f$ est continue en $0$ ($D_f = [-frac(1,2), +infinity[$) #h(2em) $arrow.r$ *(a)*

*3)* $f$ est continue a droite en $(-1)$ #h(2em) $arrow.r$ *(b)*

*4)* $[-1, 0]$ #h(2em) $arrow.r$ *(b)*

$f(x) = 4 sqrt(x + 1) - x^2 - 3$

Car on a : $f$ est continue sur $[-1, 0]$

et $f(0) times f(-1) = -4 < 0$

*5)* $E(x) = 1$ _pour_ $x in [1, 2[$ #h(2em) $arrow.r$ *(a)*

On a : $|f(x)| = g(x) = cases(-x + 1 & "si" x lt.eq 0, 1 & "si" x > 0)$

$g$ _est continue en_ $0$ (voir figure)

#figure(
  cetz.canvas({
    import cetz.draw: *
    // Axes
    line((-1.5, 0), (3, 0), stroke: 0.5pt, mark: (end: ">"))
    line((0, -1.5), (0, 2.5), stroke: 0.5pt, mark: (end: ">"))
    content((3, -0.3), $x$)
    content((-0.3, 2.5), $y$)
    content((0.2, -0.2), $O$)
    // Courbe C_f pour x <= 0 : y = -x + 1 (droite)
    line((-1.5, 2.5), (0, 1), stroke: blue + 1pt)
    // Courbe C_f pour x > 0 : y = 1 (constante)
    line((0, 1), (3, 1), stroke: blue + 1pt)
    // Point plein en (0,1)
    circle((0, 1), radius: 0.06, fill: blue, stroke: blue)
    content((1.5, 1.5), text(blue)[$C_f$])
    // Graduations
    content((1, -0.2), $1$)
    line((1, -0.05), (1, 0.05), stroke: 0.5pt)
    content((-0.2, 1), $1$)
    line((-0.05, 1), (0.05, 1), stroke: 0.5pt)
  }),
  caption: [Courbe de $g(x) = |f(x)|$]
)

// Source: Corrige T1 p.16

=== Vrai - Faux

Répondre par vrai ou faux en justifiant la réponse.

1. Si f est continue en a, alors f est continue à droite en a.

2. Si f n'est pas continue en a, alors f n'est pas continue à droite en a.

3. Si f n'est pas continue à gauche en a, alors f n'est pas continue à droite en a.

4. f est continue en a, si et seulement si, f n'est pas continue à droite en a ou n'est pas continue à gauche en a.

5. Si $|f|$ est continue en a alors f est continue en a.

// Source: Manuel T1 p.34
=== Corrigé Vrai – Faux

*1) Vrai.*

Theoreme du cours : $f$ continue en $a$ si et seulement si $f$ est continue a droite et a gauche en $a$.

*2) Faux.*

Contre exemple Voir (QCM question 3) $a = -1$

*3) Faux*

Meme contre exemple que precedemment

*4) Vrai.*

Car si $f$ est continue a droite et a gauche en $a$ alors $f$ sera continue en $a$.

*5) Faux*

Contre exemple :

$f(x) = cases(-x + 1 & "si" x lt.eq 0, -1 & "si" x > 0)$

$f$ n'est pas continue en $0$ (voir figure)

On a : $|f(x)| = g(x) = cases(-x + 1 & "si" x lt.eq 0, 1 & "si" x > 0)$

$g$ _est continue en_ $0$ (voir figure)

// Source: Corrige T1 p.16 (colonne droite)

== Mobiliser ses compétences

=== Situation 1

Le plan est muni d'un repère $(O, arrow(i), arrow(j))$.

On a représenté ci-contre la courbe représentative d'une fonction g définie sur un intervalle ouvert.

1. Soit un réel a tel que la fonction g est continue en a et $g(a) > 0$.

#h(0.5cm) a. Représenter l'ensemble des points $M(x, g(x))$ tels que

#h(1cm) $g(a) < g(x) < frac(3, 2) g(a)$.

#h(0.5cm) b. Montrer qu'il existe un intervalle $]a - h, a + h[$ tel que

#h(1cm) pour tout $x in ]a - h, a + h[$ , on a $g(x) > frac(1, 2) g(a) > 0$.

#h(0.5cm) c. En déduire que la fonction g reste strictement positive sur cet intervalle.

2. Soit un réel b tel que la fonction g est continue en b et $g(b) < 0$.

#h(0.5cm) Montrer qu'il existe un intervalle $]b - h, b + h[$ sur lequel g reste strictement négative.

=== Situation 2

On considère la fonction f définie sur $RR$ par $f(x) = 5x^4 - 10x^2 - 8x + 10$.

1. a. Montrer que l'équation $f(x) = 0$ admet au moins une solution dans chacun des intervalles $[-3, -2]$, $[0, 3]$ et $[2, 3]$.

#h(0.5cm) b. Montrer que l'équation $f(x) = 0$ admet dans $RR$ exactement trois solutions distinctes.

2. Soit $alpha$ la solution de l'équation $f(x) = 0$ sur l'intervalle $[0, 1]$.

#h(0.5cm) Déterminer un intervalle de longueur 0.04 contenant $alpha$.

3. Soit $beta$ la solution de l'équation $f(x) = 0$ sur l'intervalle $[2, 3]$.

#h(0.5cm) Déterminer un intervalle de longueur 0.04 contenant $beta$.

#h(0.5cm) a. Calculer $f(frac(1, 4))$ et en déduire que $alpha in [frac(1, 4), frac(1, 2)]$

#h(0.5cm) b. Calculer $f(frac(3, 8))$ et en déduire que $alpha in [frac(1, 4), frac(3, 8)]$

#h(0.5cm) c. Calculer $f(frac(5, 16))$ et en déduire que $alpha in [frac(5, 16), frac(3, 8)]$

#h(0.5cm) d. Calculer $f(frac(11, 32))$ et en déduire que $alpha in [frac(5, 16), frac(11, 32)]$

#h(0.5cm) e. Calculer $f(frac(21, 64))$ et en déduire que $alpha in [frac(21, 64), frac(11, 32)]$

4. Soit $beta$ la solution de l'équation $f(x) = 0$ sur l'intervalle $[-2, -1]$.

#h(0.5cm) Déterminer un intervalle de longueur 0.04 contenant $beta$.

5. On désigne par $lambda$ la solution de l'équation $f(x) = 0$ sur l'intervalle $[2, 3]$.

#h(0.5cm) Donner une valeur approchée, à 0.1 près par excès, de $lambda$.

// Source: Manuel T1 p.35
=== Corrigé – Mobiliser ses compétences

=== Situation 1 :

*1) a)*

#figure(
  cetz.canvas({
    import cetz.draw: *
    // Axes
    line((-4, 0), (4, 0), stroke: 0.5pt, mark: (end: ">"))
    line((0, -3.5), (0, 3), stroke: 0.5pt, mark: (end: ">"))
    content((4, -0.3), $x$)
    content((-0.3, 3), $y$)
    // Courbe de g - allure generale avec maximum local puis minimum
    // g(a) > 0, g(b) < 0
    bezier((-3.5, -0.5), (-1, 2.2), (-3, 1), (-2, 2.5), stroke: blue + 1pt)
    bezier((-1, 2.2), (1, -2), (0, 1.5), (0.5, -1.5), stroke: blue + 1pt)
    bezier((1, -2), (3.5, -1), (1.5, -2.5), (3, -1), stroke: blue + 1pt)
    // Points et labels
    content((-1, -0.3), $a$)
    line((-1, -0.05), (-1, 0.05), stroke: 0.5pt)
    content((1, -0.3), $b$)
    line((1, -0.05), (1, 0.05), stroke: 0.5pt)
    // g(a) sur y
    line((-0.05, 2.2), (0.05, 2.2), stroke: 0.5pt)
    content((-0.5, 2.2), $g(a)$)
    // g(a)/2
    line((-0.05, 1.1), (0.05, 1.1), stroke: 0.5pt)
    content((2.5, 1.1), $y = frac(1,2) g(a)$)
    // g(b) sur y
    line((-0.05, -2), (0.05, -2), stroke: 0.5pt)
    content((-0.5, -2), $g(b)$)
    // Lignes horizontales en pointille
    line((-3.5, 2.2), (3.5, 2.2), stroke: (dash: "dotted", paint: gray))
    line((-3.5, 1.1), (3.5, 1.1), stroke: (dash: "dotted", paint: gray))
    line((-3.5, -2), (3.5, -2), stroke: (dash: "dotted", paint: gray))
    // Projections verticales en pointille
    line((-1, 0), (-1, 2.2), stroke: (dash: "dotted", paint: gray))
    line((1, 0), (1, -2), stroke: (dash: "dotted", paint: gray))
  }),
  caption: [Courbe de $g$]
)

*b)* $g$ est continue en $a$ donc par definition on a :

Pour $beta = frac(1,2) g(a) > 0$

il existe $h > 0$ tel que: pour $|x - a| < h$, on a :

$|g(x) - g(a)| < frac(1,2) g(a)$

$arrow.l.r.double -frac(1,2) g(a) < g(x) - g(a) < frac(1,2) g(a)$

// Source: Corrige T1 p.17
Par suite pour $x in ]a - h, a + h[$ on a :

$frac(1,2) g(a) < g(x) < frac(3,2) g(a)$

*c)* pour $x in ]a - h, a + h[ : g(x) > 0$ car $g(a) > 0$

*2)* $g$ est continue en $b$ par definition on a :

Pour $beta = -frac(1,2) g(b) > 0$ il existe $h > 0$ tel que :

Pour $|x - b| < h$, on a :

$|g(x) - g(b)| < -frac(1,2) g(b)$

Ce qui donne : pour $x in ]b - h, b + h[$ on a :

$frac(3,2) g(b) < g(x) < frac(1,2) g(b)$

Donc : $g(x) < 0$ car $g(b) < 0$

// Source: Corrige T1 p.17 (colonne droite, haut)
=== Situation 2 :

$f(x) = 5x^3 - 10 x^2 - 8x + 10$

*1) a)* \* $f$ est continue sur $[-2, -1]$

(Fonction polynome)

et $f(-2) times f(-1) = (-54) times (3) < 0$

D'ou l'equation $f(x) = 0$ admet au moins une solution dans $[-2, -1]$

\* $f$ est continue sur $[0, 1]$

(Fonction polynome)

et $f(0) times f(1) = (10) times (-3) < 0$

D'ou l'equation $f(x) = 0$ admet au moins une solution dans $[0, 1]$

\* $f$ est continue sur $[2, 3]$

(Fonction polynome)

et $f(2) times f(3) < 0$

D'ou l'equation $f(x) = 0$ admet au moins une solution dans $[2, 3]$

*b)* d'apres a) l'equation $f(x) = 0$ admet au moins trois solutions distinctes et comme l'equation $f(x) = 0$ est du troisieme degre elle admet au plus trois solutions dans $I R$

Conclusion : l'equation $f(x) = 0$ admet exactement trois solutions dans $I R$

// Source: Corrige T1 p.17 (colonne droite, bas)
*2) a)* $f(frac(1,2)) = frac(33,8)$ , $f(1) = -3$

$f(frac(1,2)) times f(1) < 0$ D'ou $frac(1,2) < alpha < 1$

Par suite $alpha in [frac(1,2), 1]$

$b)$ on a : $frac(frac(1,2) + 1,2) = frac(3,4)$ et $f(frac(3,4)) > 0$ (a calculer)

Comme : $f(frac(3,4)) times f(1) < 0$ on aura $alpha in [frac(3,4), 1]$

$c)$ $frac(frac(3,4) + 1,2) = frac(7,8)$ _et_ $f(frac(7,8)) < 0$ (a calculer)

Ainsi : $f(frac(3,4)) times f(frac(7,8)) < 0$ _par suite_ $alpha in [frac(3,4), frac(7,8)]$

meme travail en calculons a chaque fois et pour chaque intervalle $[a, b]$ le reel $f(frac(a+b,2))$ puis on applique le theoreme des valeurs intermediaires cette methode s'appelle la #underline[dichotomie]

1) meme travail on commençons par l'intervalle $[-2, -1]$ jusqu'a obtenir un intervalle $[n, m]$ tel que : $m - n approx 0.04$

2) meme travail que precedemment

// Source: Corrige T1 p.18

== Exercices et problèmes

=== Exercice 1

Dans chacun des cas suivants, justifier la continuité de la fonction f en a.

$f(x) = 2x^2 - 3x + 4$ #h(1cm) ; #h(0.5cm) $a = -3$.

$f(x) = 2x^4 - 2x^3 + x + 3x^2 + 4$ #h(1cm) ; #h(0.5cm) $a = 1000000$.

$f(x) = frac(x, (x^2 + 1)(x - 3)^5)$ #h(1cm) ; #h(0.5cm) $a = 100$.

$f(x) = 2x + 3x(x + 1) + sqrt(x - 1) + 0.000271$.

$f(x) = frac(3x + 10, x^2 - 1)$ #h(1cm) ; #h(0.5cm) $a = 0.00271$.

==== Corrigé

*1)* $f(x) = sqrt(3) x^8 - sqrt(2) x^3 + 3x + 1$ , $a = -sqrt(3)$

$f$ est une fonction polynome elle est donc continue en tout reel, en particulier en $a = -sqrt(3)$

*2)* $f(x) = frac(2x^5 - 2x + 1, x^3 - x + 1)$ ; $a = 0,2$

$(0,2)^3 - (0,2) + 1 eq.not 0$ donc $0, 2 in D_f$

$f$ est une fonction rationnelle et $0, 2 in D_f$

Donc $f$ est continue en $a = 0,2$

*3)* $f(x) = sqrt(6) (2x - 5)^3$ #h(2em) $a = -2,8$

Comme etant fonction polynome $f$ est continue en $a = -2,8$

*4)* de meme fonction polynome

*5)* de meme fonction polynome

*6)* $f(x) = frac(-10^(-3) dot x^4 + 2, 3x + 10)$ , $a = -frac(1,2)$

$D_f = I R backslash {-frac(10,3)}$

$f$ est une fonction rationnelle et $(-frac(1,2)) in D_f$

Donc $f$ est continue en $a = -frac(1,2)$

*7)* $f(x) = frac(x - 5, x^4 + 10x^2 + 3)$ , $a = -0.000251$

$f$ est une fonction rationnelle et

$(-0.000251)^4 + 10(-0.000251)^2 + 3 eq.not 0$

#h(2em) _somme des trois reels strict positifs_

$(a = -0.000251) in D_f$

donc $f$ est continue en $a$

// Source: Corrige T1 p.18 (colonne droite)

=== Exercice 2

Dans chacun des cas suivants, justifier la continuité de la fonction f en a.

$f(x) = frac(root(3, x^2 + 1), x - 5)$ #h(1cm) ; #h(0.5cm) $a = 200$.

$f(x) = frac(x^2, sqrt(x + 1))$ #h(1cm) ; #h(0.5cm) $a = sqrt(5)$.

$f(x) = frac(x, x + root(3, x - 1))$

==== Corrigé

*1)* $f(x) = frac(f_1 (x), f_2 (x))$

Avec $f_1 (x) = -|x| + 5$ et $f_2 (x) = (x - 10)^4$

\* la fonction $x arrow.r x$ est continue en $a = 201$

d'ou $f_1$ est continue en $a = 201$

\* $f_2$ est continue en $a = 201$ (fonction polynome)

de plus $f_2 (201) = 191^4 eq.not 0$

Donc $f = frac(f_1, f_2)$ est continue en $a = 201$

*2)* $f(x) = |g(x)|$ avec $g(x) = frac(x^2 - 8, 2x + 1)$

$D_g = I R backslash {-frac(1,2)}$

$g$ est une fonction rationnelle et $2 in D_g$

d'ou $g$ est continue en $a = 2$

par suite $f = |g|$ est continue en $a = 2$

*1)* $f(x) = frac(|x^2 + x - 2|, x - 2)$

Posons $f_1 (x) = x^2 + x - 2$ et $f_2 (x) = x - 2$

On a : $f = frac(|f_1|, f_2)$

\* $f_1$ est continue en $a = 51$ (fonction polynome)

Donc $|f_1|$ _est continue en_ $a = 51$

\* $f_2$ est continue en $a = 51$ (fonction polynome)

de plus $f_2 (51) = 49 eq.not 0$

D'ou $f = frac(f_1, f_2)$ est continue en $a = 51$

*4)* $f(x) = frac(1,4) |x| - |x^3| - 5|x^5|$

\* la fonction $x arrow.r x$ est continue en $a = 11$

// Source: Corrige T1 p.19
\* la fonction : $x arrow.r x^3$ est continue en $a = 11$

d'ou $f_2 : x arrow.r |x^3|$ est continue en $a = 11$

\* de meme la fonction $f_3 : x arrow.r |x^5|$ est continue en $a = 11$

donc $f$ est continue en $a = 11$ (somme de fonctions continues)

*5)* $f = frac(f_1, f_2)$

avec : $f_1 (x) = |x^3| + 2$ et $f_2 (x) = |x| - 2$

$f_1$ et $f_2$ sont continues en $a = -5$

de plus $f_2 (-5) = 3 eq.not 0$ d'ou $f = frac(f_1, f_2)$ est continue en $a = -5$

// Source: Corrige T1 p.19 (colonne droite)

=== Exercice 3

Dans chacun des cas suivants, justifier la continuité de la fonction f en a.

$f(x) = sqrt(-2x + 3)$ #h(1cm) ; #h(0.5cm) $a = 0.01$.

==== Corrigé

*1)* $f(x) = sqrt(g(x))$ avec $g(x) = 3x + 5$

$D_f = [-frac(5,3), +infinity[$

$g$ est definie et positive sur l'intervalle ouvert

$]-frac(5,3), +infinity[$ et $frac(2,3) in ]-frac(5,3), +infinity[$

Comme $g$ est une fonction polynome elle est continue en $frac(2,3)$

Alors $f = sqrt(g)$ est continue en $a = frac(2,3)$

*2)* $f = sqrt(g)$ _avec_ $g(x) = -2x + 3$

$g$ est definie et positive sur $]-infinity, frac(2,3)[$

et $0,01 in ]-infinity, frac(2,3)[$

Comme $g$ est fonction polynome donc elle est continue en $0,01$ alors $f = sqrt(g)$ est continue en $a = 0,01$

*3)* $f = sqrt(g)$ _avec_ $g(x) = 4x^2 + x + 1$ on a :

$Delta = 1 - 16 = -15 < 0$ donc le trinome

$4x^2 + x + 1 > 0$

_(signe de coefficient de monome_

_de plus haut degre_ $4 > 0$_)_

_Donc_ $g$ est definie et positive sur $I R$

de plus *$g$* est une fonction polynome donc elle est continue en $a = 1,25$

D'ou $f = sqrt(g)$ est continue en $a = 1,25$

*4)* $f(x) = g(x) dot sqrt(h(x))$

$"avec" : cases(g(x) = x - 4, h(x) = 2x^2 + 3x + 5)$

\* $g$ est continue en $a = 10$ (fonction polynome)

\* $2x^2 + 3x + 5 = 0$ avec $Delta = -31 < 0$

Le signe de $2x^2 + 3x + 5$ _et celui de_ $a = 2$

_donc_ $h(x) > 0$, _pour tout_ $x in I R$

$h$ est definie et positive sur $I R$ et $10 in I R$

$h$ est continue en $10$ donc $sqrt(h)$ est continue en $a = 10$

par suite $f$ est continue en $a = 10$ (produit de deux fonctions continues)

*5)* $f(x) = sqrt(g(x)) + h(x)$, avec :

$g(x) = x^2 + 3$ et $h(x) = frac(-5(x^2 + 2x + 2), x^4 + 5x + 3)$

\* $g$ (polynome) est definie et positive sur $I R$ de plus $g$ et continue en $a = -1$ donc $sqrt(g)$ est continue en $a = -1$

// Source: Corrige T1 p.20
\* $(-1)^4 + 5(-1) + 3 = -1 eq.not 0$ $h$ est une fonction rationnelle et $(-1) in D_h$ d'ou $h$ est continue en $(-1)$

Par suite $f = sqrt(g) + h$ est continue en $a = -1$.

=== Exercice 4

Le plan est muni d'un repère orthonormé $(O, arrow(i), arrow(j))$.

Dans la figure ci-dessous, les points $A(-2, 0)$ et $B(0, 1)$ sont fixés et le point M d'abscisse x, varie sur la droite d'équation $y = frac(x, 2)$.

Soit la fonction $f : x |-> A M + B M$.

1. Donner l'expression de $f(x)$.

2. Justifier que f est continue en tout réel.

==== Corrigé

*1)* $M(x, x)$

$arrow(A M) binom(frac(x+2,x), ) ;$ $arrow(B M) binom(frac(x,x-1), )$

$f(x) = A M + B M$

$f(x) = sqrt((x + 2)^2 + x^2) + sqrt(x^2 + (x - 1)^2)$

*2)* \* la fonction $f_1 : x arrow.r (x + 2)^2 + x^2$ est positive sur $I R$ et continue en tout reel $a$ (fonction polynome) d'ou $sqrt(f_1)$ est continue en $a$.

\* la fonction $f_2 : x arrow.r x^2 + (x - 1)^2$ est positive sur $I R$ et continue en tout reel $a$ (fonction polynome) d'ou $sqrt(f_2)$ est continue en $a$.

par suite $f = sqrt(f_1) + sqrt(f_2)$ est continue en $a$.

*3)* soit le point $C(1, 0)$

la droite d'equation : $y = x$ est la mediatrice du segment $[B C]$, d'ou $B M = C M$

$A M + B M = A M + C M$ est minimale pour $M = O$

c'est 0 dire $x = 0$.

// Source: Corrige T1 p.20 (colonne droite, haut)

=== Exercice 5

On considère la fonction f définie sur $RR$ par

$ f(x) = cases(
  sqrt(2 - x) & "si" x lt.eq 0,
  frac(x, x + 4) & "si" x > 0
) $

1. Tracer la courbe représentative de f dans un repère $(O, arrow(i), arrow(j))$.

2. Justifier la continuité de f sur $]-infinity, 0[$.

3. Justifier la continuité de f sur $]0, +infinity[$.

4. Vérifier, à l'aide du graphique, que la fonction f n'est pas continue en 0.

==== Corrigé

$f(x) = cases(sqrt(2x - 4) & "si" x gt.eq 2, x & "si" x < 2)$

*1)*

#figure(
  cetz.canvas({
    import cetz.draw: *
    // Axes
    line((-4.5, 0), (7.5, 0), stroke: 0.5pt, mark: (end: ">"))
    line((0, -2.5), (0, 4.5), stroke: 0.5pt, mark: (end: ">"))
    content((7.5, -0.3), $x$)
    content((-0.3, 4.5), $y$)
    content((0.2, -0.2), $O$)
    // Branche y = x pour x < 2
    line((-2.5, -2.5), (2, 2), stroke: blue + 1pt)
    // Point ouvert en (2, 2) pour la branche y = x
    circle((2, 2), radius: 0.06, fill: white, stroke: blue + 1pt)
    // Branche y = sqrt(2x - 4) pour x >= 2 (point (2,0), (3,sqrt(2)), (4,2), (6, 2sqrt(2))...)
    bezier((2, 0), (4, 2), (2.5, 0.8), (3, 1.5), stroke: blue + 1pt)
    bezier((4, 2), (7, 3.16), (5, 2.5), (6, 2.8), stroke: blue + 1pt)
    // Point plein en (2, 0) pour la branche sqrt(2x-4)
    circle((2, 0), radius: 0.06, fill: blue, stroke: blue)
    // Graduations
    content((2, -0.3), $2$)
    line((2, -0.05), (2, 0.05), stroke: 0.5pt)
    content((4, -0.3), $4$)
    line((4, -0.05), (4, 0.05), stroke: 0.5pt)
    content((-0.3, 2), $2$)
    line((-0.05, 2), (0.05, 2), stroke: 0.5pt)
    content((-0.3, 4), $4$)
    line((-0.05, 4), (0.05, 4), stroke: 0.5pt)
  }),
  caption: [Courbe de $f$]
)

*2)* La fonction $x arrow.r 2x - 4$ est continue et positive sur $[2, +infinity[$ donc $f$ est continue sur $[2, +infinity[$

*3)* La fonction $x arrow.r x$ est continue sur $]-infinity, 2[$ donc $f$ est continue sur $]-infinity, 2[$

*4)* La courbe $(C_f)$ presente un saut (rupture) au point $A(2, f(2))$ donc $f$ n'est pas continue en $2$.

// Source: Corrige T1 p.20 (colonne droite, bas)

=== Exercice 6

On considère la fonction f définie sur $RR$ par

$ f(x) = cases(
  x & "si" x lt.eq 0,
  x + 1 & "si" x > 0
) $

1. Tracer la courbe représentative de f dans un repère $(O, arrow(i), arrow(j))$.

2. Justifier la continuité de la fonction f sur $[0, +infinity[$.

3. Justifier la continuité de la fonction f sur $]-infinity, 0]$.

// Source: Manuel T1 p.36

4. Vérifier, à l'aide du graphique, que la fonction f n'est pas continue sur $RR$.

==== Corrigé

$f(x) = cases(frac(1,x) & "si" x > 0, -1 & "si" x lt.eq 0)$

*1)*

#figure(
  cetz.canvas({
    import cetz.draw: *
    // Axes
    line((-3, 0), (5, 0), stroke: 0.5pt, mark: (end: ">"))
    line((0, -1.5), (0, 4), stroke: 0.5pt, mark: (end: ">"))
    content((5, -0.3), $x$)
    content((-0.3, 4), $y$)
    content((0.2, -0.2), $O$)
    // Branche y = -1 pour x <= 0
    line((-3, -1), (0, -1), stroke: blue + 1pt)
    // Point plein en (0, -1)
    circle((0, -1), radius: 0.06, fill: blue, stroke: blue)
    // Branche y = 1/x pour x > 0
    // Points: (0.25, 4), (0.5, 2), (1, 1), (2, 0.5), (4, 0.25)
    bezier((0.3, 3.33), (1, 1), (0.4, 2.5), (0.6, 1.6), stroke: blue + 1pt)
    bezier((1, 1), (4.5, 0.22), (2, 0.5), (3, 0.33), stroke: blue + 1pt)
    // Graduations
    content((1, -0.3), $1$)
    line((1, -0.05), (1, 0.05), stroke: 0.5pt)
    content((-0.3, 1), $1$)
    line((-0.05, 1), (0.05, 1), stroke: 0.5pt)
    content((-0.5, -1), $-1$)
    line((-0.05, -1), (0.05, -1), stroke: 0.5pt)
    // 1/2
    content((2.5, 0.7), $frac(1,2)$)
  }),
  caption: [Courbe de $f$]
)

*2)* La fonction $x arrow.r frac(1,x)$ est continue sur $RR^*$

(Fonction rationnelle) en particulier sur $]0, +infinity[$ donc $f$ est continue sur $]0, +infinity[$

*3)* la restriction de $f$ sur $]-infinity, 0[$ est constante donc $f$ est continue sur $]-infinity, 0[$

*4)* graphiquement $(C_f)$ possede un saut au point $O(0,0)$ donc $f$ n'est pas continue en $0$.

// Source: Corrige T1 p.21

=== Exercice 7

On considère la fonction f définie sur $RR$ telle que

- la fonction $x |-> f$ est continue sur $RR$,

- $f(x) = x^2 + ax + b$, #h(0.5cm) $a, b in RR$, est une fonction affine,

- la restriction de f à $]-infinity, 1]$ est une fonction affine.

1. Représenter la fonction f dans un repère $(O, arrow(i), arrow(j))$.

2. Donner l'expression de $f(x)$ pour tout x de $RR$.

==== Corrigé

*1)* $(P)$ : La parabole d'equation : $y = -x^2 + 3$

Elle a pour sommet $S(0, 3)$ d'axe $x = 0$

#figure(
  cetz.canvas({
    import cetz.draw: *
    // Axes
    line((-5.5, 0), (5.5, 0), stroke: 0.5pt, mark: (end: ">"))
    line((0, -15), (0, 4), stroke: 0.5pt, mark: (end: ">"))
    content((5.5, -0.3), $x$)
    content((-0.3, 4), $y$)
    content((0.2, -0.2), $O$)
    // Parabole y = -x^2 + 3
    // Points : (-3, -6), (-2, -1), (-1, 2), (0, 3), (1, 2), (2, -1), (3, -6)
    bezier((-4, -13), (-2, -1), (-3.5, -9.25), (-2.5, -3.25), stroke: blue + 1pt)
    bezier((-2, -1), (0, 3), (-1.5, 0.75), (-0.5, 2.75), stroke: blue + 1pt)
    bezier((0, 3), (2, -1), (0.5, 2.75), (1.5, 0.75), stroke: blue + 1pt)
    bezier((2, -1), (4, -13), (2.5, -3.25), (3.5, -9.25), stroke: blue + 1pt)
    // Sommet S
    circle((0, 3), radius: 0.06, fill: blue, stroke: blue)
    content((-0.7, 3.3), $C_f$)
    // Point A(2, -1)
    circle((2, -1), radius: 0.06, fill: red, stroke: red)
    content((2.5, -1.3), $A$)
    // Graduations
    content((2, 0.3), $2$)
    content((-0.3, 3), $3$)
    content((-0.5, -5), $-5$)
    content((-0.5, -10), $-10$)
  }),
  caption: [Parabole $(P) : y = -x^2 + 3$]
)

\* $(P)$ passe par $A(2, -1)$

\* $A' = S_O (A)$ : symetrique de $A$ par rapport au point $O$

$arrow.double A'(-2, 1)$

\* $O$ : centre de symetrie pour $(C_f)$

\* $f(0) = 0$

\* $f(-2) = -f(2) = 1$ ($f$ impaire)

*5) a)* l'equation $f(x) = 1$ admet une unique solution dans $I R$ car la droite d'equation : $y = 1$ coupe $(C_f)$ en un seul point.

*b)* de meme l'equation $f(x) = frac(2,5)$ admet une unique solution dans $I R$.

*c)* la courbe $(C_f)$ et la droite d'equation $y = -frac(1,2)$ n'ont pas des points d'intersection donc l'equation

$f(x) = -frac(1,2)$ n'a pas de solution

*d)* de meme l'equation $f(x) = 0$ n'a pas de solution dans $I R$

// Source: Corrige T1 p.21 (colonne droite)
\* $(C_1)$ : la courbe de la restriction de $f$ sur $[2, +infinity[$

On a : $(C'_1) = S_0 (C_1)$

On a ainsi : $(C_f) = (C_1) union [A A'] union (C'_1)$

*2)* pour $x in ]-2, 0[$ , $f(x) = a x + b$

$cases(f(0) = 0, f(-2) = 1) arrow.double cases(b = 0, -2a + b = 1) arrow.double cases(a = -frac(1,2), b = 0)$

Donc $f(x) = -frac(1,2) x = -frac(x,2)$

$f(x) = cases(x^2 - 3 & "si" x lt.eq -2, -frac(1,2) x & "si" -2 < x < 2, -x^2 + 3 & "si" x gt.eq 2)$

// Source: Corrige T1 p.21 (colonne droite, bas)

=== Exercice 8

Soit $f$ le trinôme défini par $f(x) = x^2 + bx + c$.

1. Déterminer l'ensemble de définition de f.

2. Étudier la continuité de f sur son ensemble de définition.

==== Corrigé

$f(x) = frac(x, 2x - |x + 1|)$

*1)* pour $x in D_f$

$f(x) = cases(frac(x, 2x + (x + 1)) & "si" x lt.eq -1, frac(x, 2x - (x + 1)) & "si" x > -1)$

$f(x) = cases(frac(x, 3x + 1) & "si" x lt.eq -1, frac(x, x - 1) & "si" x > -1)$ et $x in D_f$

On a : $3x + 1 eq.not 0$ pour tout $x lt.eq -1$

Donc $D_f = I R backslash {1}$

*2)* \* la fonction $f_1 : x arrow.r x$ est continue sur $I R$ en particulier sur $I R backslash {1}$

\* la fonction $f_2 : x arrow.r 2x - |x + 1|$ est continue sur $I R backslash {1}$ et ne s'annule pas donc $f = frac(f_1, f_2)$ est continue sur $I R backslash {1}$

// Source: Corrige T1 p.22

=== Exercice 9

Soit $f$ le trinôme défini par $f(x) = x^2 - 4x + 1$.

On désigne par C sa courbe représentative dans un repère orthonormé $(O, arrow(i), arrow(j))$.

1. Tracer la courbe C.

2. Quelles sont les images par f des intervalles $[2, -2]$ ; $[-2, -1]$ ?

3. Quelles sont les images par f des intervalles $[-1, 2]$, $[1, 4]$ ; $[-1, 1]$ ; $[0, 3]$ ; $[2, 4]$ ?

4. Montrer que $f$ admet un minimum.

5. Déterminer l'ensemble des antécédents par f des réels de l'intervalle $[7, 13]$.

==== Corrigé

$f(x) = frac(1,2) x^2 + 5$

*1)* $(C_f)$ est une parabole de sommet $S(0, 5)$

_et d'axe ladroite des abscisses :_ $(x = 0)$

#figure(
  cetz.canvas({
    import cetz.draw: *
    // Axes
    line((-5.5, 0), (5.5, 0), stroke: 0.5pt, mark: (end: ">"))
    line((0, -0.5), (0, 12), stroke: 0.5pt, mark: (end: ">"))
    content((5.5, -0.3), $x$)
    content((-0.3, 12), $y$)
    content((0.2, -0.2), $O$)
    // Parabole y = 1/2 x^2 + 5
    // Points: (-4, 13), (-3, 9.5), (-2, 7), (-1, 5.5), (0, 5), (1, 5.5), (2, 7), (3, 9.5), (4, 13)
    // Echelle: 1 unite y = 0.8cm
    let s = 0.8
    bezier((-4, 13*s), (-2, 7*s), (-3.5, 11.125*s), (-2.5, 8.125*s), stroke: blue + 1pt)
    bezier((-2, 7*s), (0, 5*s), (-1, 5.5*s), (-0.5, 5.125*s), stroke: blue + 1pt)
    bezier((0, 5*s), (2, 7*s), (0.5, 5.125*s), (1, 5.5*s), stroke: blue + 1pt)
    bezier((2, 7*s), (4, 13*s), (2.5, 8.125*s), (3.5, 11.125*s), stroke: blue + 1pt)
    // Sommet
    circle((0, 5*s), radius: 0.06, fill: blue, stroke: blue)
    content((-0.3, 5*s), $5$)
    // Graduations
    content((2, -0.3), $2$)
    content((-2, -0.3), $-2$)
    content((-0.4, 7*s), $7$)
    content((-0.5, 11*s), $11$)
  }),
  caption: [Parabole $(C_f) : y = frac(1,2) x^2 + 5$]
)

*2)* $f(2) = 7 ; f(-2) = 7 ; f(0) = 5 ; f(sqrt(3)) = frac(13,2)$

et $f(-sqrt(2)) = 6$

*3)* \* $f(I = [1,3]) = [f(1), f(3)] = [frac(11,2), frac(19,2)]$

\* $f(]-2, 2[) = = [5, 7[$

\* $f(K = ]-infinity, 0]) = [5, +infinity[$

*4)*

$bullet f(x) = 0 arrow.l.r.double frac(1,2) x^2 + 5 = 0 arrow.l.r.double x^2 = -10 < 0$

donc $0$ n'a pas d'antecedent par $f$

// Source: Corrige T1 p.22 (colonne droite)
$bullet f(x) = 7 arrow.l.r.double x = 2 "ou" x = -2$

donc $(-2)$ et $2$ sont les antecedents de $7$ par $f$

$bullet f(x) = 9 arrow.l.r.double x^2 = 8$

$arrow.l.r.double x_1 = 2 sqrt(2) "ou" x_2 = -2 sqrt(2)$

les antecedents par $f$ de $9$ sont $x_1$ et $x_2$

*5)*

$7 lt.eq f(x) lt.eq 13 arrow.l.r.double 2 lt.eq frac(1,2) x^2 lt.eq 8$

$arrow.l.r.double 4 lt.eq x^2 lt.eq 16 arrow.l.r.double 2 lt.eq sqrt(x^2) lt.eq 4$

$arrow.l.r.double 2 lt.eq |x| lt.eq 4$

$arrow.l.r.double 2 lt.eq x lt.eq 4 "ou" 2 lt.eq -x lt.eq 4$

$arrow.l.r.double 2 lt.eq x lt.eq 4 "ou" -2 gt.eq x gt.eq -4$

donc de reels de l'intervalle $[3, 7]$ sont les reels $x in [-4, -2] union [2, 4]$

// Source: Corrige T1 p.22 (colonne droite, bas)

=== Exercice 10

Soit f le trinôme défini par $f(x) = x^2 - 4x + 1$.

On désigne par C sa courbe représentative dans un repère orthonormé $(O, arrow(i), arrow(j))$.

1. Tracer la courbe C.

2. Quelles sont les images par f des intervalles $[-1, 2]$, $[1, 3]$, $[1, K(0, 4)]$, $K(0, 7)$ ?

3. Déterminer l'ensemble des antécédents par f des réels de l'intervalle $[-2, 6]$.

==== Corrigé

$f(x) = x^2 - 4x + 1$

*1)* $f(x) = (x - 2)^2 - 3$

$(C_f)$ est une parabole de sommet $S(2, -3)$

et d'axe $x = 2$

#figure(
  cetz.canvas({
    import cetz.draw: *
    // Axes
    line((-1.5, 0), (7.5, 0), stroke: 0.5pt, mark: (end: ">"))
    line((0, -4), (0, 2), stroke: 0.5pt, mark: (end: ">"))
    content((7.5, -0.3), $x$)
    content((-0.3, 2), $y$)
    content((0.2, -0.2), $O$)
    // Parabole y = (x-2)^2 - 3
    // Points: (-1, 6), (0, 1), (1, -2), (2, -3), (3, -2), (4, 1), (5, 6)
    bezier((-0.5, 3.25), (1, -2), (0, 1), (0.5, -0.75), stroke: blue + 1pt)
    bezier((1, -2), (2, -3), (1.5, -2.75), (1.8, -2.96), stroke: blue + 1pt)
    bezier((2, -3), (3, -2), (2.2, -2.96), (2.5, -2.75), stroke: blue + 1pt)
    bezier((3, -2), (5, 3.25), (3.5, -0.75), (4, 1), stroke: blue + 1pt)
    // Sommet S
    circle((2, -3), radius: 0.06, fill: blue, stroke: blue)
    content((2.5, -3.3), $S$)
    // Courbe label
    content((5, 1.5), text(blue)[$C_f$])
    // Graduations
    content((2, 0.3), $2$)
    line((2, -0.05), (2, 0.05), stroke: 0.5pt)
    content((-0.3, 1), $1$)
    line((-0.05, 1), (0.05, 1), stroke: 0.5pt)
    content((-0.4, -3), $-3$)
    line((-0.05, -3), (0.05, -3), stroke: 0.5pt)
    // Axe de symetrie x = 2
    line((2, -3.5), (2, 1.5), stroke: (dash: "dashed", paint: gray))
  }),
  caption: [Parabole $(C_f) : y = x^2 - 4x + 1$]
)

// Source: Corrige T1 p.23
*2)* $f([2,3]) = [-3, -2]$

\* $f([0,3]) = [-3, 1]$

\* $f([0, +infinity[) = [-3, +infinity[$

*3)* $-2 lt.eq f(x) lt.eq 6 arrow.l.r.double -2 lt.eq (x-2)^2 - 3 lt.eq 6$

$arrow.l.r.double 1 lt.eq (x - 2)^2 lt.eq 9 arrow.l.r.double 1 lt.eq |x - 2| lt.eq 3$

$arrow.l.r.double cases(1 lt.eq x - 2 lt.eq 3, "ou", 1 lt.eq -(x - 2) lt.eq 3)$ $arrow.l.r.double cases(3 lt.eq x lt.eq 5, "ou", -1 lt.eq x lt.eq 1)$

Donc $E = [-1, 1] union [3, 5]$

// Source: Corrige T1 p.23 (colonne droite)

=== Exercice 11

Soit $f : x |-> x^3 + 3x^2 - 5 = 0$.

1. a. Montrer que l'équation $f(x) = 0$ admet au moins une solution dans chacun des intervalles $[-3, -2]$, $[0, 3]$ et $[2, 3]$.

On désigne par C sa courbe représentative dans un repère orthonormé $(O, arrow(i), arrow(j))$.

1. Tracer la courbe C.

2. Quelles sont les images par f des intervalles $[-2, -1]$, $[1, K(0, 4)]$ et $K(0, 7)$ ?

3. Déterminer l'ensemble des antécédents par f des réels de l'intervalle $[-2, 6]$.

==== Corrigé

$f(x) = sqrt(x + 3) - 2$

*1)* $D_f = [-3, +infinity[$

*2)* $(H) : y = sqrt(x)$

$(C_f)$ est l'image de $(H)$ par la translation de

Vecteur $arrow(u) binom(-3, -2)$

#figure(
  cetz.canvas({
    import cetz.draw: *
    // Axes
    line((-4, 0), (7, 0), stroke: 0.5pt, mark: (end: ">"))
    line((0, -2.5), (0, 2), stroke: 0.5pt, mark: (end: ">"))
    content((7, -0.3), $x$)
    content((-0.3, 2), $y$)
    content((0.2, -0.2), $O$)
    // Courbe y = sqrt(x+3) - 2
    // Points: (-3, -2), (-2, -1), (0, sqrt(3)-2 ~ -0.27), (1, 0), (6, 1)
    bezier((-3, -2), (-1, -0.59), (-2.5, -1.59), (-1.5, -0.87), stroke: blue + 1pt)
    bezier((-1, -0.59), (1, 0), (0, -0.27), (0.5, -0.1), stroke: blue + 1pt)
    bezier((1, 0), (6, 1), (2, 0.24), (4, 0.65), stroke: blue + 1pt)
    // Points importants
    circle((-3, -2), radius: 0.06, fill: blue, stroke: blue)
    content((-3, -0.3), $-3$)
    content((-0.3, -2), $-2$)
    content((1, 0.3), $1$)
  }),
  caption: [Courbe de $f(x) = sqrt(x + 3) - 2$]
)

*3)* \* $f([2,3]) = [f(2), f(3)]$

((car $f$ est croissante sur $[2,3]$))

d'ou $f([2,3]) = [sqrt(5) - 2, sqrt(6) - 2]$

\* $f([0,5]) = [f(0), f(5)]= [sqrt(3) - 2, sqrt(8) - 2]$

\* $f(]-1, +infinity[) = ]sqrt(2) - 2, +infinity[$

*4)* $f(x) gt.eq -1 arrow.l.r.double sqrt(x + 3) - 2 gt.eq -1$

$arrow.l.r.double sqrt(x + 3) gt.eq 1 arrow.l.r.double x + 3 gt.eq 1$ et $x gt.eq -2$

Par suite $E = [-2, +infinity[$

// Source: Corrige T1 p.23 (colonne droite, bas)

=== Exercice 12

Déterminer l'ensemble de définition de f.

On désigne par C sa courbe représentative dans un repère orthonormé $(O, arrow(i), arrow(j))$.

1. Tracer la courbe C.

2. Quelles sont les images par f des intervalles $[-1, 2]$, $[-1, -0.5]$ et $[k = -9]$ ?

3. Étudier l'ensemble des antécédents par f des réels de l'intervalle $[-0.5, 0.96]$.

==== Corrigé

$f(x) = frac(-2, x - 1)$

*1)* $D_f = I R backslash {1}$

*2)* $(C_f)$ est une hyperbole de centre $W(1, 0)$ d'asymptotes $x = 1$ _et_ $y = 0$

#figure(
  cetz.canvas({
    import cetz.draw: *
    // Axes
    line((-6, 0), (6, 0), stroke: 0.5pt, mark: (end: ">"))
    line((0, -5.5), (0, 5.5), stroke: 0.5pt, mark: (end: ">"))
    content((6, -0.3), $x$)
    content((-0.3, 5.5), $y$)
    content((0.2, -0.2), $O$)
    // Asymptote x = 1
    line((1, -5), (1, 5), stroke: (dash: "dashed", paint: gray))
    // Asymptote y = 0
    // (c'est l'axe des x)
    // Branche x < 1 : y = -2/(x-1) > 0 pour x < 1
    // Points: (-4, 0.4), (-2, 0.67), (-1, 1), (0, 2), (0.5, 4)
    bezier((-5, 0.33), (-2, 0.67), (-4, 0.4), (-3, 0.5), stroke: blue + 1pt)
    bezier((-2, 0.67), (0, 2), (-1, 1), (-0.5, 1.33), stroke: blue + 1pt)
    bezier((0, 2), (0.7, 4.67), (0.3, 2.86), (0.5, 4), stroke: blue + 1pt)
    // Branche x > 1 : y = -2/(x-1) < 0 pour x > 1
    // Points: (1.3, -6.67), (1.5, -4), (2, -2), (3, -1), (5, -0.5)
    bezier((1.3, -4.67), (2, -2), (1.5, -4), (1.7, -2.86), stroke: blue + 1pt)
    bezier((2, -2), (3, -1), (2.3, -1.54), (2.7, -1.15), stroke: blue + 1pt)
    bezier((3, -1), (5.5, -0.44), (4, -0.67), (5, -0.5), stroke: blue + 1pt)
    // Graduations
    content((1, 0.3), $1$)
    content((-0.3, 2), $2$)
    content((-0.5, -2), $-2$)
    content((-0.3, 4), $4$)
    content((-0.5, -4), $-4$)
  }),
  caption: [Hyperbole $(C_f) : y = frac(-2,x-1)$]
)

*3)* \* $f([2,4]) = [f(2), f(4)] = [-2, -frac(2,3)]$

Puisque on a : $f$ est croissante sur $[2,4]$

\* $f([-1,0]) = [1, 2]$ ($f$ est croissante sur $[-1,0]$)

\* $f(]-infinity, -3]) = ]0, frac(1,2)]$ ($f$ est croissante)

*4)* graphiquement on a : $(C_f)$ est au dessous de l'axe des abscisses ($f(x) < 0$) si et seulement si $x > 1$

Donc $E = ]1, +infinity[$

// Source: Corrige T1 p.23-24 (colonne droite, bas)

=== Exercice 13

Soit f la fonction définie sur $RR$ par $f(x) = x + 3$.

1. Étudier les variations de la fonction f sur $RR$.

2. Quelles sont les images par f des intervalles ci-dessous.

$[-1, 3]$, $[-1, +infinity[$, $[0, K = 4, 1]$, $[7, +infinity[$.

==== Corrigé

$f(x) = x^3$

*1)* pour tout reels $a$ et $b$ :

// Source: Corrige T1 p.24
$a lt.eq b arrow.double a^3 lt.eq b^3 arrow.double f(a) lt.eq f(b)$

Donc $f$ est croissante sur $I R$

*2)* \* $f([1,3]) = [f(1), f(3)] = [1, 27]$

\* $f([2, 5]) = [8, 125]$

\* $f(]-6, -1]) = ]-216, -1]$

Car $f$ est croissante sur chacun de ces intervalles.

=== Exercice 14

Soit f la fonction définie sur $RR$ par $f(x) = -x^2 - 3x$.

1. Étudier les variations de la fonction f sur $RR$.

2. Quelles sont les images par f des intervalles $[-1, 3]$, $[-1.5, K = 4]$, $[1, +infinity[$.

// Source: Manuel T1 p.37

==== Corrigé

$f(x) = -x^3 - 3x$

*1)* soit $a$ et $b$ deux reels

$a lt.eq b arrow.double a^3 lt.eq b^3 arrow.double -b^3 lt.eq -a^3$ #h(2em) (1)

$a lt.eq b arrow.double -3b lt.eq -3a$ #h(2em) (2)

On additionne (1) et (2) membre a membre on aura

$-b^3 - 3b lt.eq -a^3 - 3a arrow.double f(b) lt.eq f(a)$

Par suite $f$ est decroissante sur $I R$.

*2)* $f([2,3]) = [f(3), f(2)] = [-36, -14]$

Car $f$ est decroissante sur $[2,3]$

de meme :

\* $f([-5, -3]) = [f(-3), f(-5)] = [36, 140]$

\* $f(]3, 4]) = [-76, -36[$

// Source: Corrige T1 p.24 (colonne droite)

=== Exercice 16

Soit $f : x |-> x^4 + 4x + 1$.

1. Justifier la continuité de la fonction f sur $RR$.

2. Montrer que l'équation $f(x) = 0$ admet une solution dans $]-1, 0[$.

3. Donner une valeur approchée par défaut à 0.1 près de $alpha$.

==== Corrigé

$f(x) = x^3 + 4x + 1$

*1)* Comme etant fonction polynome, $f$ est continue sur $I R$

*2)* $f$ est continue sur $[-1, 0]$

$f(-1) times f(0) = -4 < 0$

Donc l'equation $f(x) = 0$ admet une solution $alpha$ dans $[-1, 0]$

*3)* (avec la calculatrice)

\* $f(-1) = -4 < 0$ , $f(0) = 1 > 0$

_et_ $f(-0,5) = -1,12 < 0$

Ainsi : $f(-0,5) times f(0) < 0$ _donc_ : $-0,5 < alpha < 0$

\* $f(-0,3) = -0,22$ _et_ $f(-0,2) = 0,19$

// Source: Corrige T1 p.25
_donne_ : $f(-0,3) times f(-0,2) < 0$

_d'ou_ $-0,3 < alpha < -0,2$

=== Exercice 17

Soit $f : x |-> -2x^5 - 7x + 4$.

1. Justifier la croissance de la fonction f sur $RR$.

2. Montrer que l'équation $f(x) = 0$ admet une solution dans $]-1, 0[$.

3. Donner une valeur approchée par défaut à 0.1 près de $alpha$.

==== Corrigé

$f(x) = -2x^3 - 7x + 4$

*1)* Comme etant fonction polynome, $f$ est continue sur $I R$

*2)* $f$ est continue sur $[0, 1]$

Et : $f(0) times f(1) = 4 times (-5) < 0$

D'ou : $f(x) = 0$ admet une solution $alpha$ dans $[0, 1]$

*3)* (on utilisera une calculatrice)

$f(0,5) = 0,25$ _et_ $f(0,6) = -0,63$

$f(0,5) times f(0,6) < 0$ d'ou $0,5 < alpha < 0,6$

=== Exercice 18

Soit $f : x |-> -2x^3 + 2x + 10$.

1. Justifier la continuité de la fonction f sur $RR$.

2. Montrer que l'équation $f(x) = 0$ admet une solution dans $]-1, 0[$.

3. Donner une valeur approchée par défaut à 0.1 près de $alpha$.

==== Corrigé

$f(x) = -2x^3 + 2x + 10$

*1)* Comme etant fonction polynome, $f$ est continue sur $I R$

*2)* $f$ est continue sur $[1, 2]$

Et : $f(1) times f(2) = 10 times (-2) < 0$

D'ou : $f(x) = 0$ admet une solution $alpha$ dans $[1, 2]$

*3)* (on utilisera une calculatrice)

$f(2) = -2$ _et_ $f(1.9) = 0,0082$

$f(2) times f(1.9) < 0$ d'ou $1.9 < alpha < 2$

// Source: Corrige T1 p.25 (colonne droite)

=== Exercice 19

1. Dans le plan muni d'un repère $(O, arrow(i), arrow(j))$, on a représenté la fonction f définie sur $RR$ par

$f(x) = x^3 - frac(3, 2) x^2 - 1$

#cetz.canvas({
  import cetz.draw: *
  // Axes
  line((-1, 0), (3, 0), stroke: 0.5pt, mark: (end: ">"))
  line((0, -2), (0, 3), stroke: 0.5pt, mark: (end: ">"))
  content((3, -0.3), $x$)
  content((-0.3, 3), $y$)
  content((-0.2, -0.2), $O$)
  // Points
  content((0.5, -0.3), $0.5$)
  content((1.5, -0.3), $1.5$)
  // Courbe f(x)=x^3 - 3/2 x^2 - 1
  bezier((-0.5, -1.5), (0, -1), (-0.3, -1.3), (-0.1, -1), stroke: blue + 1.2pt)
  bezier((0, -1), (1, -1.5), (0.3, -0.9), (0.7, -1.4), stroke: blue + 1.2pt)
  bezier((1, -1.5), (2.5, 2), (1.3, -1.5), (2, 0), stroke: blue + 1.2pt)
})

1. Déterminer graphiquement le nombre de solutions de l'équation $f(x) = 0$.

2. Déterminer graphiquement une valeur approchée à 0.5 près de chacune des solutions de l'équation $f(x) = 0$.

3. Donner une valeur approchée à 0.1 près par défaut de chacune de ces solutions.

==== Corrigé

$f(x) = x^3 - 3 sqrt(x) + 1$

*1)* Le nombre de solution de l'equation : $f(x) = 0$ est egal a deux. Car l'axe des abscisses coupe $(C_f)$ en deux points distincts.

*2)* $alpha tilde 0$ et $beta tilde 1,5$

*3)* $alpha tilde 0,2$ et $beta tilde 1,4$

=== Exercice 20

Dans le plan muni d'un repère $(O, arrow(i), arrow(j))$, on a représenté la fonction f définie sur $RR$ par

$f(x) = x^3 - 5x + 6x - 1$

1. Justifier la continuité de la fonction f sur $RR$.

2. Calculer $f(-1.5)$ et $f(-1)$. En déduire que l'équation $f(x) = 0$ admet au moins une solution dans l'intervalle $[-1.5, -1]$.

3. Calculer $f(0.5)$ et $f(1)$. En déduire que l'équation $f(x) = 0$ admet au moins une solution dans l'intervalle $[frac(1, 2), 1]$.

4. Calculer $f(1.5)$ et $f(3)$. En déduire que l'équation $f(x) = 0$ admet au moins une solution dans l'intervalle $[1.5, 3]$.

5. Calculer $f(-1.5)$ et $f(-1)$. En déduire que l'équation $f(x) = 0$ admet au moins une solution dans l'intervalle $[-1.5, -1]$.

6. Montrer que l'équation $f(x) = 0$ admet exactement quatre solutions distinctes.

7. Donner une valeur approchée à 0.1 près par défaut de chacune des solutions de l'équation $f(x) = 0$.

// Source: Manuel T1 p.38

==== Corrigé

$f(x) = frac(1,2) x^4 - x^3 - 6x^2 + 5x + 10$

*1)* Comme etant fonction polynome $f$ est continue sur $I R$

*2)* $f(-3) = 8,5$ et $f(-2) = -8$

$f$ _est continue sur_ $[-3, -2]$

et $f(-3) times f(-2) < 0$

D'ou l'equation $f(x) = 0$ admet une solution $alpha_1$ dans $[-3, -2]$

*3)* $f(-1,5) = -5,09$ et $f(-1) = 0,5$

$f$ _continue sur_ $[-1,5 ; -1]$

et $f(-1,5) times f(-1) < 0$

Donc l'equation $f(x) = 0$ admet une solution $alpha_2$ dans $[-1,5 ; -1]$

*4)* $f$ _est continue sur_ $[1, 2]$

$f(1) times f(2) = -34 < 0$

Donc l'equation $f(x) = 0$ admet une solution $alpha_3$ dans $[1, 2]$

// Source: Corrige T1 p.26
*5)* $f$ _est continue sur_ $[4, 4{,}5]$

$f(4) times f(4{,}5) = -50 < 0$

Donc $f(x) = 0$ admet une solution $alpha_4$ _dans_ $[4, 4{,}5]$

*6)* l'equation $f(x) = 0$ est du $4^("eme")$ degre donc elle admet au plus quatre solutions

Comme $alpha_1, alpha_2, alpha_3 "et" alpha_4$ sont des solutions distinctes de l'equation $f(x) = 0$, alors l'equation $f(x) = 0$ admet exactement quatre solutions.

*7)* $blacksquare f(-2,8) times f(-2,7) < 0$

$arrow.double -2,8 < alpha_1 < -2,7$

$blacksquare f(-1,1) times f(-1) = (-0,69) dot (0,5) < 0$

$arrow.double -1,1 < alpha_2 < -1$

$blacksquare f(1,7) times f(1,8) = (0,42) dot (-1,02) < 0$

$arrow.double 1,7 < alpha_3 < 1,8$

$blacksquare f(4) times f(4,1) = (-2) dot (2,007) < 0$

$arrow.double 4 < alpha_4 < 4,1$

== Avec l'ordinateur

Soit f la fonction définie sur l'intervalle $[1, 2]$ par $f(x) = x^5 - x^3 - x - 1$.

On considère l'équation (E) : $f(x) = 0$. Comme $f(1) dot f(2) < 0$, il existe au moins une solution $alpha$ dans $[1, 2]$ de l'équation (E).

Le but de la séquence, est de donner un encadrement de la racine $alpha$ en utilisant la dichotomie.

Après avoir tapé a, m, b, f(a), f(m) et f(b) respectivement dans les cellules A2, B2, C2, D2, E2 et F2, on donne la valeur 1 en a(A2) et 2 en c(C2).

- Dans la cellule B4, on écrit la formule : =(A4+C4)/2.

- Dans la cellule D4, on écrit la formule : =(A4)^5-(A4)^3-(A4)-1.

- Dans la cellule E4, on écrit la formule : =(B4)^5-(B4)^3-(B4)-1.

- Dans la cellule F4, on écrit la formule : =(C4)^5-(C4)^3-(C4)-1.

- Dans la cellule A5, on écrit la formule : =SI(D4*E4<=0;A4;B4) pour exprimer que si f(a).f(m) $lt.eq$ 0, la borne a ne changera pas de valeur, sinon elle prendra pour valeur celle de B4.

- Dans la cellule C5, on écrit la formule : =SI(D4*E4<=0;B4;C4) pour exprimer que si f(a).f(m) $lt.eq$ 0, la borne b va prendre pour valeur celle de B4, sinon elle ne changera pas de valeur.

- Enfin, sélectionner la plage A5 : F5 et la recopier vers le bas.

- Dans la cellule B25, on trouve une valeur approchée de $alpha$.

// Source: Manuel T1 p.39
== Math -- culture

Lorsque nous lisons, nous n'apercevons qu'un seul point du livre sur toute demi-droite issue de notre oeil.

La distance de notre oeil à ce point est une fonction, par exemple de l'angle avec l'horizontale. Cette fonction, contrairement à ce que notre intuition suggère, n'est pas continue. Une infime variation de l'angle peut engendrer un saut qui mesure, par exemple, la distance entre le bord du livre et tout objet opaque situé derrière le livre.
