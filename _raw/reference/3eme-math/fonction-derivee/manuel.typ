// =============================================================================
// Module 6 : Fonction dérivée
// Programme : 3ème Math (Tunisie)
// Source : Manuel scolaire CNP (T1, p.100–117) + Corrigé CMS (T1, p.72–91)
// =============================================================================

#import "@preview/cetz:0.3.4"

= Chapitre 6 : Fonction dérivée

#emph[« Ne lise pas mes principes qui n'est pas mathématicien »]

#align(right)[*De Vinci*]

// Source: Manuel T1 p.101
== Pour commencer

=== Activité 1

Résoudre dans $RR$, les inéquations ci-dessous.

$x^4 + 2x^2 + 1 > 0$ ;

$x^2 - 3x + 1 < 0$ ;

$frac(x^3 - 1, (x + 2)^2) > 0$ .

=== Activité 2

Soit f la fonction définie sur $RR$, par $f(x) = x^3 + 3x$.

1. Montrer que f est croissante sur $RR$.

2. La fonction f admet-elle un maximum sur $RR$ ?

3. La fonction f admet-elle un minimum sur $RR$ ?

=== Activité 3

Soit a et b deux réels distincts et f une fonction définie sur $[a, b]$.

Montrer que si f est monotone sur $[a, b]$ alors elle admet un maximum et un minimum sur $[a, b]$.

// Source: Manuel T1 p.102
== Cours

=== 1. Fonction dérivée

==== Activité 1

1. Le mouvement d'un mobile est décrit par le graphique ci-contre, où d(t) désigne la distance parcourue à l'instant t.

Montrer que le mobile se déplace à vitesse constante.

#cetz.canvas({
  import cetz.draw: *
  // Axes
  line((-0.5, 0), (5, 0), stroke: 0.5pt, mark: (end: ">"))
  line((0, -0.5), (0, 4), stroke: 0.5pt, mark: (end: ">"))
  content((5, -0.3), $t$)
  content((-0.3, 4), $d$)
  // Droite croissante (vitesse constante)
  line((0, 0), (4, 3), stroke: blue + 1.5pt)
  // Points
  circle((0, 0), radius: 2pt, fill: blue)
  circle((4, 3), radius: 2pt, fill: blue)
})

2. Le mouvement d'un mobile est décrit par le graphique ci-contre, où d(t) désigne la distance parcourue à l'instant t.

a. Quelle est la distance parcourue entre t = 0 et t = 2 ?

b. Quelle est la vitesse moyenne entre t = 0 et t = 2 ?

c. Déterminer la vitesse instantanée v(t), sur chacun des intervalles $[0 , 2[$ , $[2 , 3]$ et $[3 , 5]$ ?

==== Activité 2

Un mobile se déplace sur un axe (x'x) muni d'un repère $(O, I)$ (l'unité = 1 m).

L'abscisse x(t) du mobile est donnée en fonction du temps t (en seconde), par la loi horaire du mouvement $x(t) = t^2 - 2t - 3, 1 ; t in [0, 5]$.

1. Exprimer la vitesse instantanée v(t) du mobile, à l'instant t.

2. À quel instant $t_0$ la vitesse instantanée s'annule-t-elle ?

Quelle est alors la position du mobile ?

3. À quel instant $t_1$, le mobile passe-t-il par le point O ?

Quelle est alors sa vitesse instantanée ?

4. Représenter la fonction v : t $mapsto$ v(t), t $in [0, 5]$.

#block(fill: rgb("#f0f7ff"), inset: 12pt, radius: 4pt, width: 100%)[
  *Définition*

  Soit f une fonction définie et dérivable sur un intervalle ouvert I. On appelle fonction dérivée de f et on note f', la fonction qui à tout réel x appartenant à I, associe le nombre dérivé f'(x), de f en x.
]

Soit a et b deux réels, f une fonction définie sur $[a, b]$ et dérivable sur $]a, b[$.

Si f admet un nombre dérivé à droite en a (respectivement à gauche en b), en adoptant ce nombre dérivé pour f'(a) (respectivement f'(b)) on peut définir la fonction dérivée de f sur $[a, b]$ (respectivement $[a, b]$).

// Source: Manuel T1 p.103
=== 2. Opérations sur les fonctions dérivées

Soit f et g deux fonctions dérivables sur un intervalle I, $alpha$ et $beta$ deux réels.

- Les fonctions $f + g$, $alpha f + beta g$ sont dérivables sur I et on a :

$(f + g)' = f' + g'$ #h(1cm) ; #h(1cm) $(alpha f + beta g)' = alpha f' + beta g' + g f'$ #h(1cm) ; #h(1cm) $(alpha f + beta g)' = alpha f' + beta g'$.

- Pour tout entier naturel $k gt.eq 2$, la fonction P est dérivable sur I et on a $(P)' = k P^(k-1)$.

En particulier toute fonction polynôme est dérivable sur $RR$.

Soit f et g deux fonctions dérivables sur un intervalle I telles que f ne s'annule pas sur I.

- Les fonctions $frac(1, f)$ et $frac(g, f)$ sont dérivables sur I et on a

$ (frac(1, f))' = frac(-f', f^2) $

$ (frac(g, f))' = frac(g' f - g f', f^2) $

- Pour tout entier naturel $k gt.eq 1$, la fonction $frac(1, f^k)$ est dérivable sur I et on a

$ (frac(1, f^k))' = frac(-k f', f^(k+1)) $

==== Activité 3

Soit les fonctions f et g définies sur $]0, +infinity[$ par $f(x) = 2x^2 + 3$ et $g(x) = frac(x - 1, x)$.

Donner l'ensemble de définition de chacune des fonctions suivantes, ainsi que sa fonction dérivée.

$f + g$ ; $f g$ ; $frac(1, f)$ ; $f - 3g$ ; $f'$ ; $frac(1, f)$ ; $frac(1, g)$ ; $g$.

=== 3. Dérivée de la fonction $sqrt(f)$

Soit f une fonction dérivable et strictement positive sur un intervalle I. Alors la fonction $sqrt(f)$ est dérivable sur I et on a $(sqrt(f))' = frac(f', 2 sqrt(f))$.

==== Activité 4

Dans chacun des cas suivants, déterminer la fonction dérivée de la fonction f définie sur $]0, +infinity[$ :

1. $f(x) = sqrt(2x + 1)$

2. $f(x) = sqrt(x^3)$

3. $f(x) = sqrt(x^2 + x + 1)$

// Source: Manuel T1 p.104
=== 4. Dérivée de la fonction $x mapsto f(a x + beta)$

==== Activité 1

1. Vérifier que la fonction $f : x mapsto frac(3, 1)$ est dérivable en tout réel non nul et calculer f'(x).

2. On considère la fonction $g : x mapsto f(2x + 3)$.

Montrer que g est dérivable en tout réel x différent de $-frac(3, 2)$ et que $g'(x) = 2 f'(2x + 3)$, pour tout x différent de $-frac(3, 2)$.

#block(fill: rgb("#e8f5e9"), inset: 12pt, radius: 4pt, width: 100%)[
  *Théorème (admis)*

  Soit f une fonction dérivable sur un intervalle I et soit $alpha$ et $beta$ deux réels. Alors la fonction $g : x mapsto f(alpha x + beta)$ est dérivable en tout réel x tel que $alpha x + beta$ appartient à I. De plus la fonction g est définie par $g'(x) = alpha f'(alpha x + beta)$.
]

=== 5. Sens de variation

==== Activité 1

Soit f une fonction dérivable sur un intervalle I, a un élément de I et q la fonction définie par

$q(h) = frac(f(a+h) - f(a), h)$, pour tout $h eq.not 0$ tel que $a + h$ appartient à I.

1. Montrer que si f est croissante sur I alors q(h) $gt.eq$ 0. En déduire le signe de f'(a).

2. Que peut-on dire du signe de f' lorsque f est croissante sur I ?

3. Donner une condition suffisante sur les variations de f pour que f'(x) soit négatif, pour tout x de I.

==== Activité 2

Le plan est muni d'un repère.

On a représenté les fonctions f, g et h ainsi que leurs fonctions dérivées f', g' et h'.

Identifier pour chaque fonction la courbe de sa fonction dérivée.

#cetz.canvas({
  import cetz.draw: *
  // Axes
  line((-3.5, 0), (3.5, 0), stroke: 0.5pt, mark: (end: ">"))
  line((0, -2.5), (0, 3), stroke: 0.5pt, mark: (end: ">"))
  content((3.5, -0.3), $x$)
  content((-0.3, 3), $y$)
  // Courbe f : cubique avec max local et min local
  bezier((-3, 2.5), (-1, -1), (-2, 2), (-1.5, -0.5), stroke: blue + 1.5pt)
  bezier((-1, -1), (1, 1.5), (0, 0.5), (0.5, 1.2), stroke: blue + 1.5pt)
  bezier((1, 1.5), (3, -1.5), (1.5, 2), (2.5, -0.5), stroke: blue + 1.5pt)
  // Courbe g : parabole
  bezier((-2.5, 2.5), (0, -1.5), (-1.5, 0), (-0.5, -1.5), stroke: red + 1.5pt)
  bezier((0, -1.5), (2.5, 2.5), (0.5, -1.5), (1.5, 0), stroke: red + 1.5pt)
  // Courbe h : droite
  line((-2.5, -1.5), (2.5, 1.5), stroke: green + 1.5pt)
})

// Source: Manuel T1 p.105
==== Activité 3

Représenter une fonction f définie et dérivable sur $[-1, 3]$ telle que f' est négative sur $[-1, 0]$ et positive sur $[0, 3]$.

==== Activité 4

Une météorologue affirme que, dans sa ville, la température (en °C), une journée de printemps, peut être évaluée approximativement à l'aide de la fonction T définie par $T(x) = -frac(1, 100)(x - 10)^2(x + 2)$ où x est le nombre d'heures qui se sont écoulées depuis midi et $0 lt.eq x lt.eq 12$. On a représenté ci-contre, la fonction T.

#cetz.canvas({
  import cetz.draw: *
  // Axes
  line((-0.5, 0), (7, 0), stroke: 0.5pt, mark: (end: ">"))
  line((0, -1.5), (0, 3.5), stroke: 0.5pt, mark: (end: ">"))
  content((7, -0.3), $x$)
  content((-0.3, 3.5), $T$)
  // Courbe T : cubique avec max
  bezier((0, 2), (1.5, 3), (0.5, 2.8), (1, 3), stroke: blue + 1.5pt)
  bezier((1.5, 3), (4, 1), (2.5, 2.5), (3.5, 1.5), stroke: blue + 1.5pt)
  bezier((4, 1), (6, -1), (5, 0), (5.5, -0.7), stroke: blue + 1.5pt)
})

1. Calculer le taux de variation instantané T' de la température.

2. a. Déterminer l'intervalle de temps sur lequel T'(t) est positif.

#h(0.5cm) b. Lire graphiquement les variations de la température sur cet intervalle.

3. a. Déterminer l'intervalle de temps sur lequel T'(t) est négatif.

#h(0.5cm) b. Lire graphiquement les variations de la température sur cet intervalle.

==== Activité 5

On a représenté dans un repère $(O, vec(i), vec(j))$, une fonction f dérivable sur $[-2, 3]$.

1. Donner les valeurs de f(-1) et f(1).

2. a. Déterminer graphiquement les variations de f sur $[-2, -1]$.

#h(0.5cm) b. Déterminer graphiquement le signe de f'(x), pour x appartenant à $[-2, -1]$.

3. a. Déterminer graphiquement les variations de f sur $[-1, 1]$.

#h(0.5cm) b. Déterminer graphiquement le signe de f'(x), pour x appartenant à $[-1, 1]$.

4. a. Déterminer graphiquement les variations de f sur $[1, 3]$.

#h(0.5cm) b. Déterminer graphiquement le signe de f'(x), pour x appartenant à $[1, 3]$.

5. Établir le lien entre les variations de f et le signe de f'.

==== Activité 6

On a représenté la variation pendant 5 minutes de la vitesse d'une rame de métro.

#cetz.canvas({
  import cetz.draw: *
  // Axes
  line((-0.5, 0), (6, 0), stroke: 0.5pt, mark: (end: ">"))
  line((0, -0.5), (0, 3.5), stroke: 0.5pt, mark: (end: ">"))
  content((6, -0.3), $t$)
  content((-0.3, 3.5), $v$)
  // Courbe : accélération, palier, décélération
  bezier((0, 0), (1, 2.5), (0.3, 0.5), (0.7, 2), stroke: blue + 1.5pt)
  line((1, 2.5), (3.5, 2.5), stroke: blue + 1.5pt)
  bezier((3.5, 2.5), (5, 0), (4, 2), (4.5, 0.5), stroke: blue + 1.5pt)
})

1. La rame de métro a manqué un arrêt dans une station. Retrouver graphiquement, la période d'arrêt.

2. Décrire le mouvement de la rame.

// Source: Manuel T1 p.106
==== Activité 7

1. Tracer la courbe représentative d'une fonction f définie sur $RR$, telle que la tangente en chacun de ses points soit de pente nulle.

2. Que peut-on conjecturer sur f ?

#block(fill: rgb("#e8f5e9"), inset: 12pt, radius: 4pt, width: 100%)[
  *Théorème (admis)*

  Soit f une fonction dérivable sur un intervalle I.

  La fonction f est constante sur I, si et seulement si, pour tout x appartenant à I, $f'(x) = 0$.

  La fonction f est croissante sur I, si et seulement si, pour tout x appartenant à I, $f'(x) gt.eq 0$.

  La fonction f est décroissante sur I, si et seulement si, pour tout x appartenant à I, $f'(x) lt.eq 0$.
]

==== Activité 8

Soit m réel $gt.eq$ 0.

Soit f une fonction définie et dérivable sur un intervalle $]-alpha, alpha[$.

1. Montrer que si f est paire alors f' est impaire.

2. Montrer que si f est impaire alors f' est paire.

=== 6. Extrema

==== Activité 1

Le plan est muni d'un repère.

Les courbes ci-dessous représentent des fonctions f et g dérivables sur $RR$.

#cetz.canvas({
  import cetz.draw: *
  // Premier graphique - fonction f
  // Axes
  line((-3.5, 0), (3.5, 0), stroke: 0.5pt, mark: (end: ">"))
  line((0, -2), (0, 3), stroke: 0.5pt, mark: (end: ">"))
  content((3.5, -0.3), $x$)
  content((-0.3, 3), $y$)
  // Courbe f : avec max local et min local
  bezier((-3, -1), (-1.5, 2), (-2.5, 0), (-2, 1.5), stroke: blue + 1.5pt)
  bezier((-1.5, 2), (0, 0.5), (-1, 1.5), (-0.5, 0.7), stroke: blue + 1.5pt)
  bezier((0, 0.5), (1.5, -1.5), (0.5, 0), (1, -1), stroke: blue + 1.5pt)
  bezier((1.5, -1.5), (3, 1), (2, -1), (2.5, 0), stroke: blue + 1.5pt)
  content((2, 2), $C_f$)
})

#cetz.canvas({
  import cetz.draw: *
  // Deuxième graphique - fonction g
  // Axes
  line((-3.5, 0), (3.5, 0), stroke: 0.5pt, mark: (end: ">"))
  line((0, -2), (0, 3), stroke: 0.5pt, mark: (end: ">"))
  content((3.5, -0.3), $x$)
  content((-0.3, 3), $y$)
  // Courbe g : avec extrema
  bezier((-3, 2), (-1, -1.5), (-2, 1), (-1.5, -0.5), stroke: red + 1.5pt)
  bezier((-1, -1.5), (1, 2.5), (0, 0), (0.5, 2), stroke: red + 1.5pt)
  bezier((1, 2.5), (3, -1), (1.5, 2), (2.5, 0), stroke: red + 1.5pt)
  content((2, 2.5), $C_g$)
})

1. On considère la restriction $f_1$ de f à l'intervalle $[-2, 2]$.

#h(0.5cm) a. Identifier les réels en lesquels la fonction $f_1$ admet un maximum ou un minimum.

#h(0.5cm) b. Donner la valeur de la dérivée de f, en ces réels.

#h(0.5cm) c. Étudier le signe de f' à droite et à gauche de chacun de ces réels a.

#h(0.5cm) d. On désigne par M le maximum de $f_1$ sur $[-2, 2]$ ; M est-il un maximum de f sur $RR$ ?

2. Reprendre les mêmes questions, pour la fonction $g_0$, restriction de g à $[-1, 1]$.

// Source: Manuel T1 p.107
#block(fill: rgb("#f0f7ff"), inset: 12pt, radius: 4pt, width: 100%)[
  *Définition*

  Soit f une fonction définie sur un intervalle I et a un réel de I.

  On dit que f admet un maximum local en a, s'il existe un intervalle ouvert J contenant a et inclus dans I tel que $f(x) lt.eq f(a)$, $x in I$.

  On dit que f admet un minimum local en a, s'il existe un intervalle ouvert J contenant a et inclus dans I tel que $f(x) gt.eq f(a)$, $x in I$.

  Lorsque f admet un minimum ou un maximum local en a on dit que f admet un extremum local en a.
]

#block(fill: rgb("#e8f5e9"), inset: 12pt, radius: 4pt, width: 100%)[
  *Théorème (admis)*

  Soit f une fonction dérivable sur un intervalle I, et a un élément de I.

  Si f admet un extremum local en a, alors $f'(a) = 0$.
]

==== Activité 2

Le plan est muni d'un repère.

Les courbes ci-dessous représentent des fonctions f, g et h dérivables sur $RR$.

On a représenté pour chaque fonction la tangente à la courbe au point d'abscisse 0.

#cetz.canvas({
  import cetz.draw: *
  // Trois courbes avec tangente horizontale en 0
  // Courbe f
  line((-3, 0), (3, 0), stroke: 0.5pt, mark: (end: ">"))
  line((0, -2), (0, 3), stroke: 0.5pt, mark: (end: ">"))
  content((3, -0.3), $x$)
  content((-0.3, 3), $y$)
  // f : tangente horizontale en 0, pas d'extremum (point d'inflexion)
  bezier((-2.5, -2), (0, 0), (-1, -1), (-0.3, -0.1), stroke: blue + 1.5pt)
  bezier((0, 0), (2.5, 2), (0.3, 0.1), (1.5, 1.5), stroke: blue + 1.5pt)
  // Tangente horizontale
  line((-1.5, 0), (1.5, 0), stroke: (dash: "dashed", paint: gray))
  content((2, -1.5), $C_f$)
})

#cetz.canvas({
  import cetz.draw: *
  // Courbe g
  line((-3, 0), (3, 0), stroke: 0.5pt, mark: (end: ">"))
  line((0, -1.5), (0, 3), stroke: 0.5pt, mark: (end: ">"))
  content((3, -0.3), $x$)
  content((-0.3, 3), $y$)
  // g : tangente horizontale en 0, maximum local
  bezier((-2.5, -1), (-0.5, 2.5), (-1.5, 1.5), (-0.8, 2.5), stroke: red + 1.5pt)
  bezier((-0.5, 2.5), (0, 2.5), (-0.3, 2.5), (-0.1, 2.5), stroke: red + 1.5pt)
  bezier((0, 2.5), (2.5, -1), (0.3, 2.5), (1.5, 0.5), stroke: red + 1.5pt)
  // Tangente horizontale
  line((-1.5, 2.5), (1.5, 2.5), stroke: (dash: "dashed", paint: gray))
  content((2, 2), $C_g$)
})

#cetz.canvas({
  import cetz.draw: *
  // Courbe h
  line((-3, 0), (3, 0), stroke: 0.5pt, mark: (end: ">"))
  line((0, -2.5), (0, 2), stroke: 0.5pt, mark: (end: ">"))
  content((3, -0.3), $x$)
  content((-0.3, 2), $y$)
  // h : tangente horizontale en 0, minimum local
  bezier((-2.5, 2), (-0.5, -2), (-1.5, -0.5), (-0.8, -2), stroke: green + 1.5pt)
  bezier((-0.5, -2), (0, -2), (-0.3, -2), (-0.1, -2), stroke: green + 1.5pt)
  bezier((0, -2), (2.5, 2), (0.3, -2), (1.5, 0.5), stroke: green + 1.5pt)
  // Tangente horizontale
  line((-1.5, -2), (1.5, -2), stroke: (dash: "dashed", paint: gray))
  content((2, -1.5), $C_h$)
})

1. Que valent f'(0), g'(0) et h'(0) ?

2. Quelles sont les courbes qui présentent un extremum local en 0 ?

3. a. Déterminer le signe de h'(x) pour $x > 0$.

#h(0.5cm) b. Déterminer le signe de h'(x) pour $x < 0$.

Dans l'activité précédente les fonctions proposées ont toutes des dérivées qui s'annulent en zéro. Cependant, une des fonctions ne possèdent pas un extremum local en 0.

Dans ce qui suit on se propose de déterminer une condition suffisante pour qu'une fonction dérivable admette un extremum local.

==== Activité 3

Soit f une fonction dérivable sur un intervalle I et a un réel de I. Soit b un réel strictement positif tel que l'intervalle $[a - b, a + b[$ est inclus dans I. On désigne par g la restriction de f à l'intervalle $[a - b, a + b]$.

// Source: Manuel T1 p.108
1. On suppose que

$g'(a) = 0$,

$g'(x) > 0$, $a - b < x < a$,

$g'(x) < 0$, $a < x < a + b$.

a. Montrer que g admet un maximum en a.

b. Donner une condition suffisante pour que f admette un maximum local.

2. On suppose que

$g'(a) = 0$,

$g'(x) < 0$, $a - b < x < a$,

$g'(x) > 0$, $a < x < a + b$.

a. Montrer que g admet un minimum en a.

b. Donner une condition suffisante pour que f admette un minimum local.

#block(fill: rgb("#e8f5e9"), inset: 12pt, radius: 4pt, width: 100%)[
  *Théorème*

  Soit f une fonction dérivable sur un intervalle I, a un réel de I et $h > 0$ tel que $]a - h, a + h[ subset I$.

  Si f' s'annule en a et est un changement de signe alors f admet un extremum local en a.
]

=== 7. Tableau de variation

==== Activité 1

On considère une fonction f définie et dérivable sur $[-2, +infinity[$.

On a synthétisé dans le tableau ci-contre, dit tableau de variation, les limites aux bornes et les variations de la fonction f.

#align(center)[
  #table(
    columns: (auto, auto, auto, auto, auto, auto),
    align: center,
    [$x$], [$-2$], [], [$0$], [], [$+infinity$],
    [signe de f'], [], [$+$], [$0$], [$-$], [],
  )
]

1. Donner les limites de f aux bornes de $[-2, +infinity[$.

2. Décrire les variations de f.

3. Donner le signe de f' et compléter le tableau.

4. Identifier les extrema locaux de f.

5. Déterminer le minimum de f sur $[-2, +infinity[$.

==== Activité 2

Le plan est muni d'un repère.

On a représenté ci-contre la courbe représentative d'une fonction f définie et dérivable sur $[-1.5, 4.5]$.

#cetz.canvas({
  import cetz.draw: *
  // Axes
  line((-2, 0), (5, 0), stroke: 0.5pt, mark: (end: ">"))
  line((0, -2), (0, 3.5), stroke: 0.5pt, mark: (end: ">"))
  content((5, -0.3), $x$)
  content((-0.3, 3.5), $y$)
  // Courbe avec max et min
  bezier((-1.5, 1), (0, 3), (-0.5, 2.5), (-0.2, 3), stroke: blue + 1.5pt)
  bezier((0, 3), (2, -1.5), (0.5, 2), (1.5, -1), stroke: blue + 1.5pt)
  bezier((2, -1.5), (4.5, 2), (3, -1), (4, 1.5), stroke: blue + 1.5pt)
})

1. a. Dresser le tableau de variation de la fonction f.

#h(0.5cm) b. En déduire le signe de la dérivée f' sur $]-1.5, 4.5[$.

2. On suppose que la fonction f'(x) est la fonction dérivée d'une fonction g définie et dérivable sur $]-1.5, 4.5[$.

#h(0.5cm) a. Donner le signe de la fonction f sur $]-1.5, 4.5[$.

#h(0.5cm) b. Dresser le tableau de variation de la fonction g.

// Source: Manuel T1 p.109
== 8. Problèmes

=== Activité 1

Soit f la fonction définie sur $RR$ par $f(x) = -x^4 + 6x^2 - 9x + 1$.

1. Calculer les limites de f en $+infinity$ et en $-infinity$.

2. Vérifier que f est dérivable sur $RR$ et calculer f'(x). Étudier le signe de f'.

3. a. Dresser le tableau de variation de f.

#h(0.5cm) b. Déterminer les extrema locaux de f.

#h(0.5cm) c. Montrer que l'équation $f(x) = 0$ admet exactement trois racines.

#h(0.5cm) d. Donner pour chacune des racines un encadrement à $10^(-1)$ près.

4. Discuter suivant les valeurs du réel m, le nombre des solutions de l'équation $f(x) = m$.

=== Activité 2

1. a. Montrer que $1 - x lt.eq frac(1, 1 + x)$, pour tout $x gt.eq 0$.

#h(0.5cm) b. En déduire que $1 - x lt.eq frac(1, sqrt(1 + x))$, pour tout $x gt.eq 0$.

2. Montrer que $sqrt(1 + x) lt.eq 1 + frac(x, 2)$, pour tout $x gt.eq 0$.

3. Soit f la fonction définie sur $]0, +infinity[$ par $f(x) = 1 + frac(x, 4) - frac(1, x^2) - frac(3, 7) x$.

#h(0.5cm) a. Déterminer la dérivée f' de f.

#h(0.5cm) b. Utiliser la question 1, pour déduire le signe de f'.

#h(0.5cm) c. En déduire que $1 + frac(x, 4) lt.eq sqrt(1 + x)$, pour tout $x gt.eq 0$.

4. Vérifier que $1 + frac(10, 19)$ est une valeur approchée de $sqrt(1 + 10^(-10))$ à $10^(-20)$ près.

=== Activité 3

Soit n un entier $gt.eq 1$.

1. Montrer que $x^n gt.eq k(x - 1)$, pour tout $x gt.eq 1$.

2. En déduire que $x^n gt.eq k(x - 1)$, pour tout $x gt.eq 0$.

=== Activité 4

Soit $a_1, a_2, ..., a_n$ des réels et f la fonction définie sur $RR$ par

$f(x) = (x - a_1)^2 + (x - a_2)^2 + ... + (x - a_n)^2$.

En quel réel x la fonction f atteint-elle son minimum ?

=== Activité 5

De tous les rectangles de périmètre 20 cm, quel est celui qui a la plus grande aire ?

// Source: Manuel T1 p.110
=== Activité 6

Soit C un cercle de rayon 1.

On se propose de construire un rectangle inscrit dans C de périmètre maximal.

On modélise la situation par la figure ci-contre :

#cetz.canvas({
  import cetz.draw: *
  // Cercle
  circle((2, 2), radius: 2, stroke: blue + 1pt)
  // Rectangle inscrit
  rect((0.6, 0.6), (3.4, 3.4), stroke: red + 1pt)
  // Axes
  line((0, 2), (4, 2), stroke: 0.3pt)
  line((2, 0), (2, 4), stroke: 0.3pt)
  content((2, -0.3), $O$)
})

1. Exprimer y en fonction de x et en déduire l'expression du périmètre p(x) du rectangle.

2. Étudier sur l'intervalle $[0, 2]$ les variations de la fonction p qui à x associe p(x).

3. En déduire les dimensions du rectangle de périmètre maximal inscrit dans le cercle. Faire une figure dans ce cas.

=== Activité 7

Une compagnie loue, à des groupes de 15 personnes ou plus, des bus d'excursion dont la capacité est de 60 personnes. Si un groupe compte exactement 15 personnes, chacune d'elles doit payer 90 dinars. Pour les groupes plus nombreux, le tarif par personne est réduit de n dinars lorsque n personnes s'ajoutent aux premières.

On se propose de déterminer l'effectif d'un groupe pour que la location d'un bus rapporte un revenu maximal.

Soit n le nombre de personnes s'ajoutant aux quinze premières d'un groupe. On désigne par R(n) le revenu de la compagnie en fonction de n.

1. Vérifier que $R(n) = (15 + n)(90 - n)$.

2. On désigne par f : $x mapsto (15 + x)(90 - x)$, la fonction qui modélise la situation.

#h(0.5cm) a. Étudier les variations de la fonction f sur l'intervalle $[0, 65]$.

#h(0.5cm) b. En déduire le réel $x_0$ de l'intervalle $[0, 65]$ en lequel la fonction f atteint son maximum local.

Que vaut $f(x_0)$ ?

#h(0.5cm) c. Donner un encadrement de $x_0$ entre deux entiers successifs m et m + 1.

Puis comparer f(m), f(m + 1) et $f(x_0)$.

#h(0.5cm) d. Conclure.

// Source: Manuel T1 p.111
== QCM - Vrai ou Faux

=== QCM

Cocher la réponse exacte.

1. La fonction f définie sur $RR$ par $f(x) = 5x^4 - 3x + 1$ a pour dérivée la fonction f' définie par

#h(1cm) $square$ $f'(x) = 5x^4 - 2$ #h(2cm) $square$ $f'(x) = 20x^3 - 3$ #h(2cm) $square$ $f'(x) = 20x^3$.

2. On a représenté dans un repère $(O, vec(i), vec(j))$, une fonction f définie et dérivable sur $RR$.

L'une des courbes ci-dessous laquelle est la représentation graphique de la fonction dérivée de f. Laquelle ?

#cetz.canvas({
  import cetz.draw: *
  // Trois courbes possibles pour f'
  // Courbe 1
  line((-2, 0), (2, 0), stroke: 0.5pt, mark: (end: ">"))
  line((0, -1.5), (0, 2), stroke: 0.5pt, mark: (end: ">"))
  bezier((-1.5, 1.5), (0, -1), (-0.5, 0), (-0.2, -0.8), stroke: blue + 1.5pt)
  bezier((0, -1), (1.5, 1.5), (0.2, -0.8), (0.5, 0), stroke: blue + 1.5pt)
})

3. On a représenté dans un repère $(O, vec(i), vec(j))$, la fonction dérivée f' d'une fonction dérivable f sur $[0, 10]$. Dans quel cas a-t-on $f(a) > f(b)$ ?

#h(1cm) $square$ 0 #h(2cm) $square$ -1 #h(2cm) $square$ 1

4. La fonction $x mapsto x^3 + 3x^2 + 1$, admet pour minimum

#h(1cm) $square$ décroissante sur $]-infinity, -1]$ #h(1cm) $square$ décroissante sur $]-1, +infinity[$ #h(1cm) $square$ croissante sur $]-infinity, -1]$.

5. La fonction $x mapsto frac(1, x)$ est

#h(1cm) $square$ décroissante sur $]-infinity, -1]$ #h(1cm) $square$ décroissante sur $]-1, +infinity[$ #h(1cm) $square$ croissante sur $]-infinity, -1]$.

=== Corrigé du QCM

*1)* $f'(x) = 20x^3 - 3$ #h(1cm) $arrow.long$ *b*

*2)* $(C_2)$ est la courbe representative de $f'$ #h(1cm) $arrow.long$ *b*

Tableau de variation de $f$ :

#table(
  columns: 6,
  align: center,
  $x$, $-10$, $-4$, $1$, [], $10$,
  $f'(x)$, [], $-$, [$0$], [$+$], [$0$], [$-$],
  $f(x)$, [], [↘], [], [↗], [], [↘],
)

Comparer la position de $C_2$ par rapport a la droite des abscisses et le signe de $f'$

*3)* $f'(x) < 0$ _pour_ $x in [a, b]$

$f$ est decroissante sur $[a, b]$ donc on a : $a < b arrow.double f(a) gt.eq f(b)$ #h(1cm) $arrow.long$ *b*

*4)* $f'(x) = 2x dot (2x^2 + 3)$

#table(
  columns: 4,
  align: center,
  $x$, $-infinity$, $0$, $+infinity$,
  $f'(x)$, [$-$], [$0$], [$+$],
)

Donc pour tout $x in RR$ on a : $f(x) gt.eq f(0) = 1$ #h(1cm) $arrow.long$ *b*

*5)* $f'(x) = frac(1, (x+1)^2) gt.eq 0$ #h(1cm) $arrow.long$ *c*

=== Vrai - Faux

Répondre par vrai ou faux en justifiant la réponse.

1. La fonction $x mapsto |x|$ est dérivable sur $RR$.

2. La fonction $x mapsto sqrt(2x^2 + 1)$ est dérivable sur $]-infinity, frac(1, 2)]$.

3. Si $f'(a) = 0$ alors f admet un minimum en a.

4. Si les fonctions dérivées de deux fonctions f et g sont égales sur un intervalle ouvert I alors f et g sont égales.

5. Soit f une fonction définie et dérivable sur $]0, +infinity[$ et a et b deux réels strictement positifs. Si f' est positive sur $]a, b[$ et $f(b) = 0$ alors f est négative sur $[a, b]$.

=== Corrigé Vrai – Faux

*1) Faux*

- Pour $x > 0$, $f(x) = x$ #h(0.5cm) d'ou #h(0.5cm) $lim_(x arrow 0^+) frac(f(x) - f(0), x - 0) = lim_(x arrow 0^+) frac(x, x) = 1 = f'_d (0)$

- Pour $x < 0$, $f(x) = -x$ #h(0.5cm) d'ou #h(0.5cm) $lim_(x arrow 0^-) frac(f(x) - f(0), x - 0) = lim_(x arrow 0^-) frac(-x, x) = -1 = f'_g (0)$

$f'_d (0) eq.not f'_g (0)$ #h(0.3cm) D'ou $f$ n'est pas derivable en 0.

*2) Faux*

$lim_(x arrow (frac(1,2))^-) frac(f(x) - f(frac(1,2)), x - frac(1,2)) = lim_(x arrow (frac(1,2))^-) frac(sqrt(-2x+1), x - frac(1,2)) = lim_(x arrow (frac(1,2))^-) frac(-2(x - frac(1,2)), (x - frac(1,2))sqrt(-2x+1)) = lim_(x arrow (frac(1,2))^-) frac(-2, sqrt(-2x+1)) = -infinity$

D'ou $f$ n'est pas derivable a gauche en $frac(1,2)$.

*3) Faux*

Contre exemple : $f(x) = x^3$ #h(0.5cm) _et_ $a = 0$

*4) Faux*

Contre exemple : $f(x) = x^2$ , $g(x) = x^2 + 2014$ #h(0.5cm) _et_ $I = I R$.

*5) Vrai*

En effet : si $f'(x) gt.eq 0$ _pour tout_ $x in [a, b]$ #h(0.5cm) d'ou $f$ est croissante sur $[a, b]$

Ainsi : $a lt.eq x lt.eq b arrow.double f(a) lt.eq f(x) lt.eq f(b)$. et $f(b) = 0$ alors on aura $f(x) lt.eq 0$

// Source: Manuel T1 p.112
== Mobiliser ses compétences

=== Situation 1

Le plan est muni d'un repère orthonormé $(O, vec(i), vec(j))$.

Soit le point $M(1, 1)$ et $alpha$ un réel différent de 0 et de 1.

On désigne par $D_alpha$ la droite passant par M et de coefficient directeur $alpha$.

1. Vérifier que $D_alpha$ a pour équation $y = alpha x + (1 - alpha)$.

2. On désigne par A et B les points d'intersection de $D_alpha$ respectivement avec l'axe des abscisses et l'axe des ordonnées.

#h(0.5cm) a. Déterminer les coordonnées des points A et B en fonction de $alpha$.

#h(0.5cm) b. Exprimer AB en fonction de $alpha$.

#h(0.5cm) c. Déterminer $alpha$ pour que la distance AB soit minimale.

=== Situation 2

1. Soit a un réel, on considère la fonction $f : x mapsto frac(1, x + a)$.

#h(0.5cm) a. Vérifier que f est dérivable en tout réel x différent de a.

#h(0.5cm) b. Calculer f'(x) pour tout réel x différent de a.

#h(0.5cm) c. On note $f^((n))$ la dérivée de f ; on note $f^((n))$ la dérivée de $f^((n-1))$ et pour tout entier $k gt.eq 2$, $f^((k))$ la dérivée de $f^((k-1))$.

Calculer $f^((k))(x)$, $k gt.eq 2$.

2. On considère la fonction $g : x mapsto frac(1 + x, 1 - frac(x, 2))$.

#h(0.5cm) a. Vérifier que g est dérivable en tout réel x différent de 1 et calculer sa dérivée.

#h(0.5cm) c. Calculer $g^((k))(x)$, $k gt.eq 2$.

=== Corrigé – Mobiliser ses compétences

==== Situation 1

1) $D_alpha$ a pour coefficient directeur $alpha$ #h(0.5cm) d'ou #h(0.5cm) $D_alpha : y = alpha dot x + b$

$M(1,1) in D_alpha$ #h(0.5cm) _donne_ #h(0.5cm) $alpha + b = 1$ #h(0.3cm) _d'ou_ $b = 1 - alpha$

Par suite $D_alpha$ a pour equation $y = alpha dot x + (1 - alpha)$

2) a) \* $A(x,y) in D_alpha sect (O, i)$ $arrow.l.r.double$ $cases(y = 0, y = alpha dot x + (1 - alpha))$ $arrow.l.r.double$ $cases(y = 0, x = frac(alpha - 1, alpha) = 1 - frac(1, alpha))$ #h(0.5cm) d'ou $A(1 - frac(1, alpha), 0)$

\* $B(x,y) in D_alpha sect (O, j)$ $arrow.l.r.double$ $cases(x = 0, y = alpha dot x + (1 - alpha))$ $arrow.l.r.double$ $cases(x = 0, y = 1 - alpha)$ #h(0.5cm) d'ou $B(0, 1 - alpha)$

b) $A B^2 = (1 - frac(1, alpha))^2 + (1 - alpha)^2 = 2 + alpha^2 - 2 alpha - frac(2, alpha) + frac(1, alpha^2)$

c) On pose : $h(x) = 2 + x^2 - 2x - frac(2, x) + frac(1, x^2)$ ; $x in I R^* backslash {1}$

$h'(x) = 2x - 2 + frac(2, x^2) - frac(2, x^3) = 2(x - 1) + frac(2, x^3)(x - 1)$

$h'(x) = frac(2(x-1), x^3)(x^3 + 1) = frac(2(x-1)(x+1)(x^2 - x + 1), x^3)$

#block(inset: (left: 2em))[
  $a^3 + b^3 = (a + b)(a^2 - a b + b^2)$
]

Pour tout $x in I R^* backslash {1}$ on a : $x^2 - x + 1 > 0$ #h(0.5cm) _car_ $Delta = -3 < 0$

Le signe de $h'(x)$ est celui de $frac((x-1)(x+1), x)$

#table(
  columns: 6,
  align: center,
  $x$, $-infinity$, $-1$, $0$, $1$, $+infinity$,
  $h'(x)$, [$-$], [$0$], [$+$], [||], [$-$], [||], [$+$],
)

*Conclusion : Comme $alpha eq.not 1$, la distance $A B$ n'a pas une valeur minimale*

*(Sur $]-infinity, 0[$ la distance est minimale pour $alpha = -1$)*

==== Situation 2

1) $f(x) = frac(1, x - a)$

a) $f$ est derivable sur $D_f = I R backslash {a}$ , comme etant fonction rationnelle.

b) $f'(x) = frac(-1, (x - a)^2)$

c) $f''(x) = frac(2, (x - a)^3)$ ; #h(1cm) $f^((3))(x) = frac(-6, (x - a)^4)$ ; #h(1cm) $f^((4))(x) = frac(24, (x - a)^5)$ ; ...

Montrons par recurrence _(voir chapitre 9)_ que pour tout entier $k gt.eq 2$, on a : $f^((k))(x) = frac((-1)^k dot k!, (x - a)^(k+1))$

\* verifions pour $k = 2$. #h(1cm) $f^((2))(x) = f''(x) = frac(2, (x-a)^3) = frac((-1)^2 dot 2!, (x-a)^(2+1))$ #h(1cm) (vrai)

\* soit $k gt.eq 2$

Supposons que $f^((k))(x) = frac((-1)^k dot k!, (x-a)^(k+1))$ #h(0.5cm) et montrons que $f^((k+1))(x) = frac((-1)^(k+1) dot (k+1)!, (x-a)^(k+2))$

$f^((k+1))(x) = (f^((k)))'(x) = frac(-(-1)^k dot k! (k+1)(x-a)^k, (x-a)^(2k+2)) = frac((-1)^(k+1) dot (k+1)!, (x-a)^(k+2))$

Conclusion : $f^((k))(x) = frac((-1)^k dot k!, (x-a)^(k+1))$ ; #h(0.5cm) pour tout entier $k gt.eq 2$.

2) $g(x) = frac(1+x, 1-x)$ ; #h(0.5cm) $D_g = I R backslash {1}$

a) pour $x eq.not 1$, on a : $-1 + frac(2, 1-x) = frac(-(1-x)+2, 1-x) = frac(-1+x+2, 1-x) = frac(1+x, 1-x)$ donc $g(x) = -1 + frac(2, 1-x)$

b) $g$ est une fonction rationnelle definie sur $I R backslash {1}$, donc elle est derivable sur $I R backslash {1}$.

et $g'(x) = frac((1+x)' dot (1-x) - (1-x)' dot (1+x), (1-x)^2) = frac(1 dot (1-x) - (-1) dot (1+x), (1-x)^2) = frac(1 - x + 1 + x, (1-x)^2) = frac(2, (1-x)^2)$

c) $g(x) = -1 + frac(2, x-1) = -1 - frac(2, x-1) = -1 - 2(frac(1, x-1))$

D'apres 1) c) et prend $a = 1$ on aura : $g'(x) = -2(frac((-1)^k dot k!, (x-1)^(k+1))) = frac(2(-1)^(k+1) dot k!, (x-1)^(k+1))$

// Source: Manuel T1 p.113
== Exercices et problèmes

=== Exercice 1

Dans chacun des cas ci-dessous, déterminer l'ensemble de définition, étudier la dérivabilité puis calculer la dérivée de chacune des fonctions f, f' :

1. $f(x) = x^3 + x + 1$

2. $f(x) = frac(1, x)$

3. $f(x) = 8x^4 + x^3$

4. $f(x) = (3x + 1)^4$

5. $f(x) = (2x^2 + 1)^3$

6. $f(x) = sqrt(2x + 3)$

==== Corrigé

*a)* $f(x) = x^2 + 2$

$f$ est definie et derivable sur tout $I R$. #h(1cm) (fonction polynome)

$f'(x) = 2x$

$f^3$ _est derivable sur_ $I R$ _et_ $(f^3)'(x) = 3 dot f'(x) dot (f(x))^2 = 6x(x^2 + 2)^2$

$f$ est derivable et ne s'annule pas sur $I R$ donc $frac(1, f)$ et $frac(1, f^2)$ sont derivables sur $I R$ et :

$(frac(1, f))'(x) = frac(-f'(x), f^2(x)) = frac(-2x, (x^2+2)^2)$ ; #h(1cm) $(frac(1, f^2))'(x) = frac(-2f'(x) dot f(x), f^4(x)) = frac(-2f'(x), f^3(x)) = frac(-4x, (x^2+2)^3)$

$f$ est derivable et strictement positive sur $I R$ donc $sqrt(f)$ est derivable sur $I R$ et :

$(sqrt(f))'(x) = (sqrt(f(x)))' = frac(f'(x), 2sqrt(f(x))) = frac(2x, 2sqrt(x^2+2)) = frac(x, sqrt(x^2+2))$

*b)* $f(x) = frac(x+1, x-3)$

$f'(x) = frac(1 times (-3) - 1 times 1, (x-3)^2) = frac(-4, (x-3)^2)$ ; #h(1cm) $(f^3)'(x) = 3 f'(x) f^2(x) = frac(-12, (x-3)^2) dot frac((x+1)^2, (x-3)^2) = frac(-12(x+1)^2, (x-3)^4)$

\* _pour_ $x eq.not 3$ on a : $f(x) = frac(x+1, x-3) = 0 arrow.double x = -1$ d'ou $frac(1, f)$ et $frac(1, f^2)$ sont definies et derivables sur $I R backslash {-1, 3}$ et :

$(frac(1, f))'(x) = frac(-f'(x), f^2(x)) = frac(frac(4, (x-3)^2), frac((x+1)^2, (x-3)^2)) = frac(4, (x+1)^2)$ ; #h(0.5cm) $(frac(1, f^2))'(x) = frac(-2f'(x) dot f(x), f^4(x)) = frac(-2f'(x), f^3(x)) = frac(8(x-3), (x+1)^3)$

\* $sqrt(f)$ est definie sur $]-infinity, -1] union ]3, +infinity[$ #h(3cm) _signe de_ $f(x)$ :

#table(
  columns: 5,
  align: center,
  $x$, $-infinity$, $-1$, $3$, $+infinity$,
  $x + 1$, [$-$], [$0$], [$+$], [], [$+$],
  $x - 3$, [$-$], [], [$-$], [$0$], [$+$],
  $f(x)$, [$+$], [$0$], [$-$], [||], [$+$],
)

et Derivable sur $]-infinity, -1[ union ]3, +infinity[$ et

$(sqrt(f))'(x) = sqrt(f(x))' = frac(f'(x), 2sqrt(f(x))) = frac(-2, (x-3)^2 sqrt(frac(x+1, x-3)))$

$lim_(x arrow (-1)^-) frac(sqrt(f(x)) - sqrt(f(-1)), x + 1) = lim_(x arrow (-1)^-) frac(sqrt(frac(x+1, x-3)), x+1) = lim_(x arrow (-1)^-) frac(frac(x+1, x-3), (x+1) sqrt(frac(x+1, x-3))) = lim_(x arrow (-1)^-) frac(1, (x-3) sqrt(frac(x+1, x-3))) = -infinity$

Par suite : $sqrt(f)$ n'est pas derivable a gauche en $-1$

*c)* $f(x) = 1 - x^2$

\* $f$ est une fonction polynome d'ou $f$ et $f^3$ sont definies et derivables sur $I R$.

$f'(x) = -2x$ #h(1cm) et #h(1cm) $(f^3)'(x) = 3 f'(x) dot f^2(x) = -6x(1-x^2)^2$.

\* $f(x) = 0 arrow.l.r.double x = -1$ _ou_ $x = 1$

$frac(1, f)$ et $frac(1, f^2)$ sont definies et derivables sur $I R backslash {-1, 1}$

$(frac(1, f))'(x) = frac(-f'(x), f^2(x)) = frac(2x, (1-x^2)^2)$ #h(1cm) et #h(1cm) $(frac(1, f^2))'(x) = frac(-2f'(x) dot f(x), f^4(x)) = frac(-2f'(x), f^3(x)) = frac(4x, (1-x^2)^3)$

\* $sqrt(f)$ est definie sur $[-1, 1]$

$f$ est derivable et strictement positive sur $]-1, 1[$ #h(0.5cm) d'ou $sqrt(f)$ est derivable

sur $]-1, 1[$ et $(sqrt(f(x)))' = frac(f'(x), 2sqrt(f(x))) = frac(-x, sqrt(1-x^2))$

#table(
  columns: 4,
  align: center,
  $x$, $-infinity$, $-1$, $1$, $+infinity$,
  $1 - x^2$, [$-$], [$0$], [$+$], [$0$], [$-$],
)

$lim_(x arrow (-1)^+) frac(sqrt(f(x)) - sqrt(f(-1)), x + 1) = lim_(x arrow (-1)^+) frac(sqrt(1-x^2), x+1) = lim_(x arrow (-1)^+) frac((1-x^2), (x+1) sqrt(1-x^2)) = lim_(x arrow (-1)^+) frac((1-x), sqrt(1-x^2)) = +infinity$

donc $sqrt(f)$ n'est pas derivable a droite en $-1$.

de meme $sqrt(f)$ n'est pas derivable a gauche en 1.

*d)* $f(x) = sqrt(x)$

\* $f$ est definie sur $[0, +infinity[$ et derivable sur $]0, +infinity[$ #h(0.5cm) et #h(0.5cm) $f'(x) = frac(1, 2sqrt(x))$

\* $lim_(x arrow 0^+) frac(f^3(x) - f^3(0), x - 0) = lim_(x arrow 0^+) frac(x sqrt(x), x) = lim_(x arrow 0^+) sqrt(x) = 0$

$f^3$ est derivable a droite en 0 par suite $f^3$ est derivable sur $[0, +infinity[$ et $(f^3)'(x) = 3 f'(x) dot f^2(x) = frac(3, 2) sqrt(x)$

\* $frac(1, f)$ et $frac(1, f^2)$ sont definies et derivables sur $]0, +infinity[$.

$(frac(1, f))'(x) = frac(-f'(x), f^2(x)) = frac(-1, 2x sqrt(x))$ #h(1cm) et #h(1cm) $(frac(1, f^2))'(x) = frac(-2f'(x) dot f(x), f^4(x)) = frac(-2f'(x), f^3(x)) = frac(-1, x^2)$

\* $f$ est derivable et strictement positive sur $]0, +infinity[$ d'ou $sqrt(f)$ est derivable sur $]0, +infinity[$ et on a :

$(sqrt(f(x)))' = frac(f'(x), 2sqrt(f(x))) = frac(frac(1, 2sqrt(x)), 2sqrt(sqrt(x))) = frac(1, 4sqrt(x) sqrt(sqrt(x)))$.

=== Exercice 2

Dans chacun des cas ci-dessous, déterminer l'ensemble de définition, étudier la dérivabilité puis calculer la dérivée de chacune des fonctions f, g, f + g :

(a) #h(0.5cm) $f(x) = x^2 - 2$ #h(1cm) et #h(1cm) $g(x) = frac(1, x^2 - 2)$

(b) #h(0.5cm) $f(x) = frac(x + 1, x - 1)$ #h(1cm) et #h(1cm) $g(x) = frac(x - 1, x + 1)$

==== Corrigé

*a)* $f(x) = x^3 - 2$ #h(1cm) et #h(1cm) $g(x) = frac(1, x^2 + 2)$

\* comme etant fonction polynome, $f$ est definie et derivable sur $I R$ et $f'(x) = 3x^2$

\* $g$ est definie et derivable sur $D_g = I R$, (fonction rationnelle et $x^2 + 2 eq.not 0$) et $g'(x) = frac(-2x, (x^2+2)^2)$

\* $f + g$ est definie et derivable sur $I R$ #h(0.5cm) (somme de deux fonctions derivables) et :

$(f + g)'(x) = f'(x) + g'(x) = 3x^2 - frac(2x, (x^2+2)^2)$

\* $f$ et $g$ sont deux fonctions derivables sur $R$, donc $(f dot g)$ est derivable sur $I R$ et :

$(f dot g)'(x) = f'(x) dot g(x) + g'(x) dot f(x) = frac(3x^2, x^2+2) + (x^3 - 2)[-frac(2x, (x^2+2)^2)]$

$arrow.double (f dot g)'(x) = frac(x^4 + 6x^2 + 4x, (x^2+2)^2)$

\* $f$ et $g$ sont deux fonctions derivables sur $I R$, de plus $g(x) eq.not 0$ _pour tout_ $x in I R$ donc $frac(f, g)$ est derivable sur $I R$ et :

$(frac(f, g))'(x) = frac(f'(x) dot g(x) - g'(x) dot f(x), g^2(x)) = ...$

Ou bien : $(frac(f, g))(x) = frac(f(x), g(x)) = (x^3 - 2) dot (x^2 + 2) = x^5 + 2x^3 - 2x^2 - 4$ #h(0.5cm) donne #h(0.5cm) $(frac(f, g))'(x) = 5x^4 + 6x^2 - 4x$

*b)* $f(x) = frac(1, x-1)$ #h(1cm) et #h(1cm) $g(x) = frac(1-2x, (x-1)^2)$

\* $f$ est definie et derivable sur $I R backslash {1}$, (fonction rationnelle) et $f'(x) = frac(-1, (x-1)^2)$

\* $g$ est definie et derivable sur $I R backslash {1}$, (fonction rationnelle) et $g'(x) = frac(-2(x-1)^2 - 2(x-1)(1-2x), (x-1)^4) = frac(2x, (x-1)^3)$

\* $f + g$ est definie et derivable sur $I R backslash {1}$ #h(0.5cm) (somme de deux fonctions derivables) et :

$(f + g)'(x) = f'(x) + g'(x) = frac(x+1, (x-1)^3)$

\* $f$ et $g$ sont deux fonctions derivables sur $I R backslash {1}$, donc $f dot g$ est derivable sur $I R backslash {1}$ et :

$(f dot g)'(x) = f'(x) dot g(x) + g'(x) dot f(x) = ...$

Ou bien : $(f dot g)(x) = frac(1-2x, (x-1)^3)$ donc $(f dot g)'(x) = frac(-2(x-1)^3 - 3(x-1)^2(1-2x), (x-1)^6) = frac(4x-1, (x-1)^4)$

\* $g(x) = 0$ _pour_ $x = frac(1, 2)$

$frac(f, g)$ est derivable sur $I R backslash {1, frac(1, 2)}$ et : $(frac(f, g))'(x) = frac(f'(x) dot g(x) - g'(x) dot f(x), g^2(x)) = dots.c = frac(-1, (1-2x)^2)$

Ou bien $(frac(f, g))(x) = frac(f(x), g(x)) = frac(x-1, 1-2x)$ #h(0.5cm) donne #h(0.5cm) $(frac(f, g))'(x) = frac((1-2x) + 2(x-1), (1-2x)^2) = frac(-1, (1-2x)^2)$

*c)* $f(x) = sqrt(x) + 1$ #h(1cm) et #h(1cm) $g(x) = x sqrt(x)$

\* $g$ est definie sur $[0, +infinity[$ et derivable sur $]0, +infinity[$

$lim_(x arrow 0^+) frac(g(x) - g(0), x - 0) = lim_(x arrow 0^+) frac(x sqrt(x), x) = lim_(x arrow 0^+) sqrt(x) = 0$ . $g$ est derivable a droite en 0 et $g'_d (0) = 0$

$g'(x) = 1 dot sqrt(x) + x (frac(1, 2sqrt(x))) = sqrt(x) + frac(sqrt(x), 2) = frac(3, 2) sqrt(x)$ #h(1cm) ($g$ _est derivable sur_ $[0, +infinity[$.)

\* $f + g$ est definie et derivable sur $]0, +infinity[$ et $(f+g)'(x) = f'(x) + g'(x) = frac(1, 2sqrt(x)) + frac(3sqrt(x), 2) = frac(3x+1, 2sqrt(x))$

\* $(f dot g)(x) = x^2 + x sqrt(x)$

$f dot g$ est derivable sur $[0, +infinity[$ et $(f dot g)'(x) = 2x + frac(3, 2) sqrt(x)$

\* $frac(f, g)$ est definie, derivable sur $]0, +infinity[$ et :

$(frac(f, g))(x) = frac(f(x), g(x)) = frac(1, x) + frac(1, x sqrt(x)) arrow.double (frac(f, g))'(x) = frac(-1, x^2) + frac(-frac(3, 2) sqrt(x), x^3) = frac(-1, x^2) - frac(3, 2x^2 sqrt(x))$ ; $x in ]0, +infinity[$

=== Exercice 3

Dans chacun des cas ci-dessous, déterminer la fonction dérivée de la fonction f définie sur $]0, +infinity[$ :

$f(x) = x^2 - 5x + 4$ ;

$f(x) = -3x^2 + 1$ ;

$f(x) = frac(x, (2x - 7)^2)$ ;

$f(x) = 2sqrt(x + 1) + 10^2$ ;

$f(x) = frac(1, sqrt(15 + x))$ ;

$f(x) = frac(1, (x + 1)^2)$.

==== Corrigé

a) $f(x) = x^5 - 3x^3 + 2x - 1$ ; #h(0.5cm) $f'(x) = 5x^4 - 9x^2 + 2$

b) $f(x) = -x^6 + x^4 + sqrt(2) dot x$ ; #h(0.5cm) $f'(x) = -6x^5 + 4x^3 + sqrt(2)$

c) $f(x) = (-3x^2 + 1)^3$ ; #h(0.5cm) $f'(x) = 3 dot (-6x)(-3x^2 + 1)^2 = -18x(-3x^2 + 1)^2$

d) $f(x) = 2x^2(-x^3 + 1)^3$

$f'(x) = 4x(-x^3 + 1)^3 + 2x^2 dot (3) dot (-3x^2)(-x^3 + 1)^2$

$f'(x) = 4x(-x^3 + 1)^3 - 18x^4(-x^3 + 1)^2 = (-x^3 + 1)^2 dot (4x - 22x^4)$

e) $f(x) = frac(x^3 + x, x + 1)$ ; #h(0.5cm) $f'(x) = frac((3x^2 + 1)(x + 1) - (x^3 + x), (x+1)^2) = frac(2x^3 + 3x^2 + 1, (x+1)^2)$

f) $f(x) = frac(-5, (2x+2)^5)$ ; #h(0.5cm) $f'(x) = -5(frac(-5 dot (2) dot (2x+2)^4, (2x+2)^10)) = frac(50, (2x+2)^6)$

g) $f(x) = frac(1, x+3) - (3x + 2)^3$ ; #h(0.5cm) $f'(x) = frac(-1, (x+3)^2) - 9(3x+2)^2$

=== Exercice 4

Dans chacun des cas ci-dessous, déterminer la fonction dérivée de la fonction f définie sur $]0, +infinity[$ :

$f(x) = sqrt(2x + 1)$

1. $f(x) = 3x sqrt(2x + 1)$

2. $f(x) = frac(1, sqrt(x))$

3. $f(x) = 3x^2 + 5x$

4. $f(x) = 3x + sqrt(x)$

==== Corrigé

$x in ]0, +infinity[$

a) $f(x) = sqrt(2x + 3)$ ; #h(0.5cm) $f'(x) = frac(2, 2sqrt(2x+3)) = frac(1, sqrt(2x+3))$

b) $f(x) = sqrt(2x^2 + 3)$ ; #h(0.5cm) $f'(x) = frac(4x, 2sqrt(2x^2+3)) = frac(2x, sqrt(2x^2+3))$

c) $f(x) = 3x dot sqrt(2x+1)$ ; #h(0.5cm) $f'(x) = 3sqrt(2x+1) + 3x(frac(2, 2sqrt(2x+1))) = frac(3(3x+1), sqrt(2x+1))$

d) $f(x) = frac(-4, (sqrt(3x))^3) = frac(-4, 3sqrt(3) dot x sqrt(x))$

$f'(x) = frac(-4, 3sqrt(3)) [frac(-(x sqrt(x))', (x sqrt(x))^2)] = frac(4, 3sqrt(3)) dot frac(frac(3, 2) sqrt(x), x^3) = frac(2sqrt(x), sqrt(3) dot x^3) = frac(2, x^2 dot sqrt(3x))$

=== Exercice 5

Pour chacune des fonctions ci-dessous, déterminer son ensemble de définition, étudier ses limites et ses bornes de son ensemble de définition, calculer sa dérivée, puis dresser son tableau de variation et déterminer ses extrema éventuels.

1. $f(x) = x^2 - 6x + 11$

2. $f(x) = x^3 - 3x$

3. $f(x) = frac(2x, x^2 + 1)$

4. $f(x) = frac(x, sqrt(x^2 + 1))$

==== Corrigé

*1)* $f(x) = 4x - 3 + frac(1, x - 5)$ ; #h(0.5cm) $D_f = D_(f') = I R backslash {5}$

\* $lim_(x arrow -infinity) f(x) = -infinity$ #h(0.5cm) car $lim_(x arrow -infinity) (4x - 3) = -infinity$ et $lim_(x arrow -infinity) (frac(1, x-5)) = 0$

\* $lim_(x arrow +infinity) f(x) = +infinity$ #h(0.5cm) car $lim_(x arrow +infinity) (4x - 3) = +infinity$ et $lim_(x arrow +infinity) (frac(1, x-5)) = 0$

\* $lim_(x arrow 5^-) f(x) = lim_(x arrow 5^-) (4x - 3 + frac(1, x-5)) = -infinity$ #h(0.5cm) car $lim_(x arrow 5^-) (4x - 3) = 17$ et $lim_(x arrow 5^-) (frac(1, x-5)) = -infinity$

\* $lim_(x arrow 5^+) f(x) = lim_(x arrow 5^+) (4x - 3 + frac(1, x-5)) = +infinity$ #h(0.5cm) car $lim_(x arrow 5^+) (4x - 3) = 17$ et $lim_(x arrow 5^+) (frac(1, x-5)) = +infinity$

\* $f'(x) = 4 - frac(1, (x-5)^2) = frac(4(x-5)^2 - 1, (x-5)^2)$

$= frac([2(x-5)-1][2(x-5)+1], (x-5)^2) = frac((2x-11)(2x-9), (x-5)^2)$

#table(
  columns: 6,
  align: center,
  $x$, $-infinity$, $frac(9, 2)$, $5$, $frac(11, 2)$, $+infinity$,
  $f'(x)$, [$+$], [$0$], [$-$], [], [$-$], [$0$], [$+$],
)

\* $f$ admet 13 comme maximum local en $frac(9, 2)$

\* $f$ admet 21 comme minimum local en $frac(11, 2)$

*2)* $g(x) = frac(x^2 - 1, 4 - x^2)$ #h(1cm) \* $D_g = D_(g') = I R backslash {-2, 2}$ #h(1cm) \* $lim_(|x| arrow +infinity) g(x) = lim_(|x| arrow +infinity) frac(x^2, -x^2) = -1$

\* $lim_(x arrow (-2)^-) g(x) = lim_(x arrow (-2)^-) frac(x^2 - 1, 4 - x^2) = -infinity$ #h(0.5cm) car $lim_(x arrow (-2)^-) (4 - x^2) = 0^-$ et $lim_(x arrow (-2)^-) (x^2 - 1) = 3$

\* $lim_(x arrow (-2)^+) g(x) = lim_(x arrow (-2)^+) frac(x^2 - 1, 4 - x^2) = +infinity$ #h(0.5cm) car

$lim_(x arrow (-2)^+) (x^2 - 1) = 3$ et $lim_(x arrow (-2)^+) (4 - x^2) = 0^+$

#table(
  columns: 5,
  align: center,
  $x$, $-infinity$, $-2$, $2$, $+infinity$,
  $4 - x^2$, [$-$], [$0$], [$+$], [$0$], [$-$],
)

\* $lim_(x arrow 2^-) g(x) = +infinity$ #h(0.5cm) car $lim_(x arrow 2^-) (x^2-1) = 3$ et $lim_(x arrow 2^-) (4-x^2) = 0^+$

\* $lim_(x arrow 2^+) g(x) = -infinity$ #h(0.5cm) ($"de la forme"$ $frac(3, 0^-)$)

\* $g'(x) = frac(2x(4-x^2) + 2x(x^2-1), (4-x^2)^2) = frac(6x, (4-x^2)^2)$

#table(
  columns: 6,
  align: center,
  $x$, $-infinity$, [], $-2$, $0$, $2$, $+infinity$,
  $g'(x)$, [$-$], [], [], [$-$], [$0$], [$+$], [||], [$+$],
)

$g$ admet $(-frac(1, 4))$ comme minimum local en 0.

*3)* $h(x) = 2x^4 - x^2 + 5$

\* $D_h = D_(h') = I R$

\* $lim_(|x| arrow +infinity) h(x) = lim_(|x| arrow +infinity) (2x^4) = +infinity$

\* $h'(x) = 8x^3 - 2x = 2x dot (4x^2 - 1)$

#table(
  columns: 6,
  align: center,
  $x$, $-infinity$, $frac(-1, 2)$, $0$, $frac(1, 2)$, $+infinity$,
  $h'(x)$, [$-$], [$0$], [$+$], [$0$], [$-$], [$0$], [$+$],
)

\* $h$ admet $frac(39, 8)$ comme minimum local respectivement en $frac(-1, 2)$ et $frac(1, 2)$.

\* $h$ admet 5 comme maximum local en 0.

*4)* $S(x) = frac(4x-1, 2x+3)$ ; #h(0.5cm) $D_S = D_(S') = I R backslash {frac(-3, 2)}$

\* $lim_(|x| arrow +infinity) S(x) = lim_(|x| arrow +infinity) frac(4x, 2x) = 2$

\* $lim_(x arrow (frac(-3, 2))^-) S(x) = lim_(x arrow (frac(-3, 2))^-) frac(4x-1, 2x+3) = +infinity$ #h(0.5cm) (de la forme $-7 slash 0^-$)

\* $lim_(x arrow (frac(-3, 2))^+) S(x) = lim_(x arrow (frac(-3, 2))^+) frac(4x-1, 2x+3) = -infinity$ #h(0.5cm) (de la forme $-7 slash 0^+$)

\* $S'(x) = frac(14, (2x+3)^2) > 0$ _pour tout_ $x in I R backslash {frac(-3, 2)}$

#table(
  columns: 4,
  align: center,
  $x$, $-infinity$, $frac(-3, 2)$, $+infinity$,
  $S'(x)$, [], [$+$], [||], [$+$],
)

$h$ n'admet pas d'extremums.

=== Exercice 6

On considère la fonction f définie sur $RR$ par $f(x) = a x^2 + b$, où a est un réel.

On suppose que la fonction f admet deux extrema locaux en 1 et -1.

1. Calculer la valeur de a.

2. Dresser le tableau de variation de f et préciser la nature de chacun des extrema de f.

==== Corrigé

$f(x) = a x^3 + 3x$

1) $f'(x) = 3a x^2 + 3$

$cases(f'(1) = 0, f'(-1) = 0)$ $arrow.l.r.double$ $3a + 3 = 0$ $arrow.l.r.double$ $a = -1$ #h(1cm) _d'ou_ $f(x) = -x^3 + 3x$

2) $f$ est derivable sur $I R$ et $f'(x) = -3x^2 + 3 = -3(x^2 - 1) = -3(x-1)(x+1)$

$lim_(x arrow -infinity) f(x) = lim_(x arrow -infinity) (-x^3) = +infinity$

$lim_(x arrow +infinity) f(x) = lim_(x arrow +infinity) (-x^3) = -infinity$

#table(
  columns: 5,
  align: center,
  $x$, $-infinity$, $-1$, $1$, $+infinity$,
  $f'(x)$, [$-$], [$0$], [$+$], [$0$], [$-$],
)

\* $f$ admet $-2$ comme minimum local en $-1$.

\* $f$ admet 2 comme maximum local en 1.

=== Exercice 7

On considère la fonction f définie sur $RR$ par

$f(x) = x + frac(a, x) - 4b$ où a est un réel.

On suppose que la fonction f admet un extremum local en 1.

1. Calculer la valeur de a.

2. Dresser le tableau de variation de f et préciser la nature de chacun des extrema de f.

==== Corrigé

#rect[
  1) $f(x) = frac(a - x, x^2 - a)$ ;

  $f'(x) = frac(-(x^2 - a) - 2x(a - x), (x^2 - a)^2) = frac(x^2 - 2a x + a, (x^2 - a)^2)$

  $f'(1) = 0 arrow.double 1^2 - 2 times 1 times a + a = 0 arrow.double 1 - a = 0 arrow.double a = 1$

  Donc $f(x) = frac(1 - x, x^2 - 1) = frac(-(x-1), (x-1)(x+1)) = frac(-1, x+1)$ ce qui donne :

  $f'(x) = frac(1, (x+1)^2) > 0$

  Contradiction avec l'hypothese : "$f$ admet un extremum en 1"
]

*REMARQUE :*

Pour : $f(x) = frac(a - x, x^2 + a)$ on aura $f'(x) = frac(-(x^2 + a) - 2x(a - x), (x^2 + a)^2) = frac(x^2 - 2a - a, (x^2 - a)^2)$

$f'(1) = 0 arrow.double 1^2 - 2 times 1 times a - a = 0 arrow.double 1 - 3a = 0 arrow.double a = frac(1, 3)$ ce qui donne : $f(x) = frac(1 - 3x, 3x^2 + 1)$

et $f'(x) = frac(-3(3x^2 + 1) - 6x(1 - 3x), (3x^2 + 1)^2) = frac((x-1)(9x+3), (3x^2 + 1)^2)$

#table(
  columns: 5,
  align: center,
  $x$, $-infinity$, $-1 slash 3$, $1$, $+infinity$,
  $f'(x)$, [$+$], [$0$], [$-$], [$0$], [$+$],
)

Dans ce cas : $f$ admet un minimum global en 1

de plus elle admet un maximum global en $-1 slash 3$.

// Source: Manuel T1 p.114
=== Exercice 8

On considère la fonction f définie sur $RR$ par

$f(x) = cases(
  frac(x^2 + x, x) "," x eq.not 1 "," x gt.eq 1,
  a "," x = 1
)$

où a est réel.

On suppose que f est continue en 1.

1. Déterminer la valeur de a.

2. Étudier la dérivabilité de f en 1.

3. Dresser le tableau de variation de f et préciser la nature de chacun des extrema de f.

==== Corrigé

$f(x) = cases(frac(x^2 - a x, x^2 + 1) #h(0.5cm) "si" x > 1, frac(1 - a x^2, x - 2) #h(0.5cm) "si" x lt.eq 1)$ #h(1cm) avec $f$ continue en 1.

1) $f(1) = frac(1 - a, 1 - 2) = a - 1$ #h(0.5cm) et #h(0.5cm) $lim_(x arrow 1^+) f(x) = lim_(x arrow 1^+) frac(x^2 - a x, x^2 + 1) = frac(1 - a, 2)$

Or on a : $f$ est continue en 1 #h(0.5cm) d'ou #h(0.5cm) $lim_(x arrow 1^+) f(x) = f(1)$ $arrow.double$ $frac(1 - a, 2) = a - 1$ $arrow.double$ $a = 1$

2) $f(x) = cases(frac(x^2 - x, x^2 + 1) #h(0.5cm) "si" x > 1, frac(1 - x^2, x - 2) #h(0.5cm) "si" x lt.eq 1)$ ; $f(1) = 0$

\* $lim_(x arrow 1^-) frac(f(x) - f(1), x - 1) = lim_(x arrow 1^-) frac(1 - x^2, (x-1)(x-2)) = lim_(x arrow 1^-) frac(-(x+1), x-2) = 2$

d'ou $f$ est derivable a gauche en 1 _et_ $f'_g (1) = 2$

\* $lim_(x arrow 1^+) frac(f(x) - f(1), x - 1) = lim_(x arrow 1^+) frac(x^2 - x, (x-1)(x^2+1)) = lim_(x arrow 1^+) frac(x, x^2 + 1) = frac(1, 2)$

Par suite $f$ est derivable a droite en 1 _et_ $f'_d (1) = 1 slash 2$

Conclusion : $f'_d (1) eq.not f'_g (1)$ #h(0.5cm) d'ou $f$ n'est pas derivable en 1.

3) a) Soit : $f_1(x) = frac(x^2 - x, x^2 + 1)$ #h(0.5cm) et #h(0.5cm) $f_2(x) = frac(1 - x^2, x - 2)$

$f'_1 (x) = frac((2x-1)(x^2+1) - 2x(x^2-x), (x^2+1)^2) = frac(x^2 + 2x - 1, (x^2+1)^2)$ #h(0.5cm) et #h(0.5cm) $f'_2 (x) = frac(-2x(x-2) - (1-x^2), (x-2)^2) = frac(-x^2 + 4x - 1, (x-2)^2)$

$"Donc :" f'(x) = cases(frac(x^2 + 2x - 1, (x^2+1)^2) #h(0.5cm) "si" x > 1, frac(-x^2 + 4x - 1, (x-2)^2) #h(0.5cm) "si" x < 1)$

b) \* pour l'equation $x^2 + 2x - 1 = 0$ #h(0.5cm) on a : $Delta = 8$ ; $x' = -1 - sqrt(2)$ _et_ $x'' = -1 + sqrt(2)$

#table(
  columns: 4,
  align: center,
  $x$, $-infinity$, $-1 - sqrt(2)$, $-1 + sqrt(2)$, $+infinity$,
  $x^2 + 2x - 1$, [$+$], [$0$], [$-$], [$0$], [$+$],
)

#table(
  columns: 3,
  align: center,
  $x$, $1$, $+infinity$,
  $f'_1 (x)$, [], [$+$],
)

Ainsi

$lim_(x arrow +infinity) f(x) = lim_(x arrow +infinity) frac(x^2, x^2) = 1$

\*\* aussi pour l'equation : $-x^2 + 4x - 1 = 0$ #h(0.5cm) on a : $Delta = 12$ ; $x' = 2 - sqrt(3)$ _et_ $x'' = 2 + sqrt(3)$

d'ou le tableau de signe de trinome $(-x^2 + 4x - 1)$

#table(
  columns: 4,
  align: center,
  $x$, $-infinity$, $2 - sqrt(3)$, $2 + sqrt(3)$, $+infinity$,
  $-x^2 + 4x - 1$, [$-$], [$0$], [$+$], [$0$], [$-$],
)

d'ou sur l'intervalle $]-infinity, 1]$ on a :

#table(
  columns: 4,
  align: center,
  $x$, $-infinity$, $2 - sqrt(3)$, $1$,
  $f'_2 (x)$, [$-$], [$0$], [$+$],
)

$lim_(x arrow -infinity) f(x) = lim_(x arrow -infinity) frac(-x^2, x) = lim_(x arrow -infinity) (-x) = +infinity$

\* d'ou tableau de variation de $f$ est le suivant :

#table(
  columns: 5,
  align: center,
  $x$, $-infinity$, $2 - sqrt(3)$, $1$, $+infinity$,
  $f'(x)$, [$-$], [$0$], [$+$], [||], [$+$],
)

$f$ admet $(2sqrt(3) - 4)$ comme minimum absolu en $2 - sqrt(3)$

=== Exercice 9

On se propose de comparer les réels

$a_1 = 0.03 ; 0.01 ; 0.001 ; 0.003 ; x gt.eq 3$

$b_1 = 1.02 ; 5.03 ; 4.01 ; 5.03 ; 0.01$

$c_1 = 3.01 ; 0.2 ; 5.02 ; 5.01 ; 0.03$

Soit la fonction f définie sur $RR$ par $f(x)$ par $frac(x, 1 + 2x)$, $x gt.eq 3$

1. Quelle est son image par f des réels

$a_1 = 1.02 ; 5.03 ; 0.01 ; 5.03 ; 0.01 ; 3.21[7]$

2. Calculer la dérivée de f.

3. Dresser le tableau de variation de f.

4. Conclure.

==== Corrigé

$f(x) = frac(x^2 + 3, x - 2)$ ; #h(0.5cm) $D_f = I R backslash {2}$

1) $A = f(5,012013014015016)$ #h(0.5cm) et #h(0.5cm) $B = f(5,012013014015017)$

2) $f'(x) = frac(2x(x-2) - (x^2+3), (x-2)^2) = frac(x^2 - 4x - 3, (x-2)^2)$

3) \* $x^2 - 4x - 3 = 0$

$Delta = 28$ ; $x' = 2 - sqrt(7)$ #h(1cm) et #h(1cm) $x'' = 2 + sqrt(7)$

$lim_(x arrow -infinity) f(x) = lim_(x arrow -infinity) frac(x^2, x) = lim_(x arrow -infinity) x = -infinity$

$lim_(x arrow +infinity) f(x) = lim_(x arrow +infinity) frac(x^2, x) = lim_(x arrow +infinity) x = +infinity$

$lim_(x arrow 2^+) f(x) = lim_(x arrow 2^+) frac(x^2+3, x-2) = +infinity$

$lim_(x arrow 2^-) f(x) = lim_(x arrow 2^-) frac(x^2+3, x-2) = -infinity$

#table(
  columns: 6,
  align: center,
  $x$, $-infinity$, $2 - sqrt(7)$, $2$, $2 + sqrt(7)$, $+infinity$,
  $f'(x)$, [$+$], [$0$], [$-$], [||], [$-$], [$0$], [$+$],
)

4) $2 + sqrt(7) approx 4,6457 ...$

$a = 5,012013014015016$ #h(0.5cm) _et_ #h(0.5cm) $b = 5,0120130140150$

$a$ et $b$ _appartiennent_ a $[2 + sqrt(7), +infinity[$ ; $f$ est strictement croissante sur $[2 + sqrt(7), +infinity[$

Comme $a < b$ #h(1cm) alors $f(a) < f(b)$ #h(1cm) Par suite $A < B$.

=== Exercice 10

Dans une usine, une étude statistique a montré qu'un ouvrier produit, au cours d'une matinée, q(t) unités.

$q(t) = -t^3 + 9t^2 + 9$ unités, où t désigne le nombre d'heures de travail.

Le rendement moyen entre les instants $t_1$ et $t_2$ ($t_2 > t_1$) est le rapport $frac(q(t_2) - q(t_1), t_2 - t_1)$.

Le rendement instantané à l'instant t, est la limite lorsque h tend vers zéro du rendement moyen entre les instants t et t + h.

1. On désigne par r la fonction définie sur $[0, 4]$, qui à t associe le rendement instantané r(t) d'un ouvrier. Exprimer r en fonction de t.

2. À quel instant le rendement instantané s'annule-t-il ?

3. Étudier le signe de la fonction r.

En déduire les variations de la quantité produite.

==== Corrigé

$q(t) = -t^3 + 3t^2 + 9t$

1) $lim_(h arrow 0) frac(q(t_0 + h) - q(t_0), h) = q'(t_0) = -3t_0^2 + 6t_0 + 9$

$r(t) = q'(t) = -3t^2 + 6t + 9$

2) a) $r(t) = 0$ _et_ $t in [0, 4]$

$-3t^2 + 6t + 9 = 0 arrow.l.r.double t^2 - 2t - 3 = 0$ _or on a_ : $a - b + c = 0$ _d'ou_ $t' = -1$ _et_ $t'' = 3$

Par suite $r(t) = 0$ _pour_ $t = 3$

#table(
  columns: 4,
  align: center,
  $t$, [$0$], $3$, $4$,
  $r(t)$, [], [$+$], [$0$], [$-$],
)

b) $r(t) = -3t^2 + 6t + 9$

\* tableau de variation de $q$ :

#table(
  columns: 4,
  align: center,
  $t$, [$0$], $3$, $4$,
  $q'(t)$, [], [$+$], [$0$], [$-$],
  $q(t)$, [$0$], [↗], [$27$], [↘], [$20$],
)

=== Exercice 11

Démontrer l'inégalité suivante :

$frac(x, 1 + x) lt.eq sqrt(x)$ pour tout $x gt.eq 0$.

==== Corrigé

Pour tout $x gt.eq 0$, on pose : $f(x) = 1 + frac(x^3, 2) - sqrt(1 + x^3)$

\* $f$ est derivable sur $[0, +infinity[$ #h(0.5cm) et #h(0.5cm) $f'(x) = frac(3x^2, 2) - frac(3x^2, 2sqrt(1+x^3)) = frac(3x^2 dot [sqrt(1+x^3) - 1], 2sqrt(1+x^3))$

$f'(x) = frac(3x^2 dot [(1+x^3) - 1], 2sqrt(1+x^3) dot (sqrt(1+x^3) + 1)) = frac(3x^5, 2sqrt(1+x^3) dot (sqrt(1+x^3) + 1)) gt.eq 0$, _pour tout_ $x in [0, +infinity[$

\* $f$ est croissante sur $[0, +infinity[$

$x gt.eq 0 arrow.double f(x) gt.eq f(0) arrow.double 1 + frac(x^3, 2) - sqrt(1+x^3) gt.eq 0$

Ce qui donne $1 + frac(x^3, 2) gt.eq sqrt(1+x^3)$, #h(0.5cm) _pour tout_ $x in [0, +infinity[$

=== Exercice 12

Montrer que de tous les triangles rectangles d'hypoténuse c, le triangle isocèle est celui qui a la plus grande aire.

==== Corrigé

\* Soit $A B M$ un triangle rectangle en $M$ avec $A B = 4$

On pose $A M = x$ _et_ $B M = y$ ; $x in ]0, 4[, y in ]0, 4[$

$A M^2 + B M^2 = A B^2 arrow.double x^2 + y^2 = 16 arrow.double y = sqrt(16 - x^2)$

On note $p(x)$ le perimetre du triangle $A B M$

$p(x) = A B + A M + B M = 4 + x + sqrt(16 - x^2)$

\* la fonction $p$ est derivable sur $]0, 4[$ et

$p'(x) = 1 + frac(-2x, 2sqrt(16 - x^2)) = frac(sqrt(16 - x^2) - x, sqrt(16 - x^2)) = frac(16 - 2x^2, sqrt(16 - x^2) dot (sqrt(16 - x^2) + x))$

$16 - 2x^2 = 0 arrow.l.r.double x^2 = 8$ #h(0.5cm) D'ou $x = 2sqrt(2)$ _car_ $x in ]0, 4[$

#table(
  columns: 4,
  align: center,
  $x$, [$0$], $2sqrt(2)$, $4$,
  $p'(x)$, [], [$+$], [$0$], [$-$],
)

$p(x)$ est maximal pour $x = 2sqrt(2)$ et dans ce cas $y = 2sqrt(2)$ alors $A M = B M = 2sqrt(2)$ ce prouve que le triangle $A B M$ est rectangle et isocele en $M$

=== Exercice 13

Un fabricant envisage la production de boîtes de lait en carton obtenues selon le patron ci-dessous.

#cetz.canvas({
  import cetz.draw: *
  // Patron de boîte dépliée
  rect((0, 0), (4, 3), stroke: blue + 1pt)
  line((1, 0), (1, 3), stroke: (dash: "dashed", paint: gray))
  line((3, 0), (3, 3), stroke: (dash: "dashed", paint: gray))
  line((0, 1), (4, 1), stroke: (dash: "dashed", paint: gray))
  line((0, 2), (4, 2), stroke: (dash: "dashed", paint: gray))
  content((2, -0.5), $x$)
  content((-0.5, 1.5), $h$)
})

1. Calculer les dimensions de la boîte et son volume.

On suppose que $0 < x lt.eq 15$ et on désigne par V(x) le volume de la boîte correspondante.

2. Exprimer V(x) en fonction de x.

3. Étudier les variations de la fonction V qui à x associe V(x) sur $]0, 15]$.

4. En déduire la valeur de x pour laquelle le volume d'une boîte est maximal. Quel est ce volume ?

==== Corrigé

1) pour $x = 10$ _cm_, les dimensions de la boite, en _centimetres_, sont :

$x = 10, y = 30 - 2x = 10$ #h(0.5cm) et #h(0.5cm) $z = frac(300 - 2x, 2) = 140$

2) $V(x) = x dot y dot z = x dot (30 - 2x) dot (frac(300 - 2x, 2))$ ; #h(1cm) $boxed(V(x) = 2x dot (15 - x) dot (150 - x))$ $"cm"^3$

3) $V(x) = 2x^3 - 330x^2 + 4500x$

#h(1cm) _tableau de variation de_ $V$ :

$V'(x) = 6x^2 - 660x + 4500 = 6(x^2 - 110x + 750)$

$x^2 - 110x + 750 = 0$ ; $Delta = 9100$, $sqrt(Delta) = 10sqrt(91)$

$x' = 5(11 - sqrt(91))$ _et_ $x'' = 5(11 + sqrt(91))$

#table(
  columns: 4,
  align: center,
  $x$, [$0$], $5(11 - sqrt(91))$, $15$,
  $V'(x)$, [$+$], [$0$], [$-$],
)

4) le volume $V$ est maximal pour $x = 5(11 - sqrt(91))$

Dans ce cas $V = V[5(11 - sqrt(91))] = 500 times [191sqrt(91) - 836]$

=== Exercice 14

==== Corrigé

1) $S = 5000$ $m^2$ ; #h(1cm) $x y = 5000$ #h(0.5cm) _d'ou_ #h(0.5cm) $y = frac(5000, x)$

$L(x) = x + 2y = x + frac(10000, x)$

2) $L'(x) = 1 - frac(10000, x^2) = frac(x^2 - 10000, x^2)$

#table(
  columns: 4,
  align: center,
  $x$, [$0$], $100$, $+infinity$,
  $L'(x)$, [$-$], [$0$], [$+$],
)

3) $L(x)$ est minimale pour $x = 100$

Dans ce cas $L = 200$ $m$

// Source: Manuel T1 p.115
=== Exercice 15

Un fabricant de bicyclettes doit acheter 5000 pièces par mois d'un distributeur sachant que toutes les commandes contiennent le même nombre de pièces. Il veut déterminer la taille du dépôt commandé de sorte que le coût total soit minimal.

Il estime que pour une commande de x pièces, le coût total c(x) (en dinars) est donné par

$ c(x) = frac(x, 2) + frac(12000, x) $

On désigne par g : $x mapsto c(x)$, $x gt.eq 1200$ :

la fonction qui modélise la situation.

1. Étudier les variations de la fonction c sur l'intervalle $[1, 5000]$.

2. En déduire pour quelle valeur de x, la livraison est la plus économique.

3. Donner une condition suffisante sur les variations de f pour que f'(x) soit négatif, pour tout x de I.

4. Conclure.

==== Corrigé

$C(x) = 0,48 x + frac(124000, x) + 1200$

1) $C'(x) = 0,48 - frac(124000, x^2)$

$C'(x) = 0 arrow.l.r.double x^2 = frac(124000, 0,48) arrow.l.r.double x = 508,265$ , on pose $x_0 = 508,265$

#table(
  columns: 4,
  align: center,
  $x$, [$1$], $x_0$, $5000$,
  $C'(x)$, [$-$], [$0$], [$+$],
)

2) $C$ admet un minimum en $x_0 = 508,265$ atteint $C(x_0) = 1687,9340$

3) $x_0 = 508,265$ d'ou $508 lt.eq x_0 lt.eq 509$

\* $508 lt.eq x_0 arrow.double C(508) gt.eq C(x_0)$ #h(0.5cm) car $C$ est decroissante sur $[1, x_0]$

\* $509 gt.eq x_0 arrow.double C(509) gt.eq C(x_0)$ #h(0.5cm) car $C$ est croissante sur $[x_0, 5000]$

\* $C(508) approx 1687,9349$ #h(1cm) _et_ #h(1cm) $C(509) approx 1687,9344$

d'ou #h(0.5cm) $C(x_0) lt.eq C(508) lt.eq C(509)$

4) le cout total est minimal lorsque chaque commande contient 508 pneus.

=== Exercice 16

On considère la figure ci-dessous où $C D = 5$, $A C = 3$, la longueur $B M = x$ et M un point variable sur le segment $[A B]$.

#cetz.canvas({
  import cetz.draw: *
  // Triangle
  line((0, 0), (4, 0), stroke: blue + 1pt)
  line((4, 0), (4, 3), stroke: blue + 1pt)
  line((0, 0), (4, 3), stroke: blue + 1pt)
  content((-0.3, -0.3), $A$)
  content((4.3, -0.3), $B$)
  content((4.3, 3.3), $C$)
  // Point M sur AB
  circle((2, 0), radius: 2pt, fill: red)
  content((2, -0.4), $M$)
  // Point D
  content((1, 2.5), $D$)
  // Segments
  line((2, 0), (4, 3), stroke: red + 0.8pt)
})

On se propose de montrer que la somme des distances AM et BM est minimale lorsque les angles $alpha$ et $beta$ sont égaux.

On pose $x = C M$ et $f(x) = A M + B M$.

1. Exprimer f(x) en fonction de x.

2. Montrer que la fonction f' admet un minimum en un réel que l'on déterminera.

3. Montrer que $cos alpha = cos beta$ ou $alpha = beta$.

4. Conclure.

==== Corrigé

1) $f(x) = A M + B M$ ; #h(0.5cm) $x = C M$

$C M + D M = C D arrow.double x + D M = 5 arrow.double D M = 5 - x$

D'ou $A M = sqrt(A C^2 + C M^2) = sqrt(9 + x^2)$ et $B M = sqrt(B D^2 + D M^2) = sqrt(16 + (5-x)^2) = sqrt(x^2 - 10x + 41)$

Par suite $f(x) = sqrt(x^2 + 9) + sqrt(x^2 - 10x + 41)$

2) a) $f$ est derivable sur $[0, 5]$ et $f'(x) = frac(2x, 2sqrt(x^2+9)) + frac(2x - 10, 2sqrt(x^2 - 10x + 41)) = frac(x, sqrt(x^2+9)) + frac(x-5, sqrt(x^2-10x+41))$

$f'(x) = frac(x sqrt(x^2 - 10x + 41) + (x-5) sqrt(x^2 + 9), sqrt(x^2+9) dot sqrt(x^2-10x+41))$

#rect[
  Pour $x in [0, 5]$\
  on a :\
  $(x-5) lt.eq 0$ et $x gt.eq 0$\
  donc :\
  $(x-5)sqrt(x^2+9) eq.not$\
  $x sqrt(x^2-10x+41)$
]

$f'(x) = frac(x^2(x^2-10x+41)^2 + (x-5)^2(x^2+9)^2, sqrt(x^2+9) dot sqrt(x^2-10x+41) dot [x sqrt(x^2-10x+41) - (x-5) sqrt(x^2+9)])$

$f'(x) = frac(7x^2 + 90x - 225, sqrt(x^2+9) dot sqrt(x^2-10x+41) dot [x sqrt(x^2-10x+41) - (x-5) sqrt(x^2+9)])$

$f'(x) = 0 arrow.l.r.double 7x^2 + 90x - 225 = 0$

$Delta = 14400$ ; $sqrt(Delta) = 120$ ; $x' = frac(-105, 7)$ _et_ $x'' = frac(15, 7) in [0, 5]$

$f(frac(15, 7)) = frac(1, 7)(sqrt(666) + sqrt(1184))$

#table(
  columns: 4,
  align: center,
  $x$, [$0$], $frac(15, 7)$, $5$,
  $f'(x)$, [$-$], [$0$], [$+$],
)

$f$ admet $f(frac(15, 7))$ comme minimum en $frac(15, 7)$

b) pour $x = frac(15, 7)$, $C M = frac(15, 7)$ et $D M = frac(20, 7)$

\* le triangle $A M C$ est rectangle en $C$ #h(0.5cm) donc $tan(widehat(A M C)) = frac(A C, A M)$ $arrow.double$ $tan(alpha) = frac(3, frac(15, 7)) = frac(7, 5)$

\* le triangle $B M D$ est rectangle en $D$ #h(0.5cm) donc $tan(widehat(B M D)) = frac(B D, D M)$ $arrow.double$ $tan(beta) = frac(4, frac(20, 7)) = frac(7, 5)$

Par suite $tan(alpha) = tan(beta)$

c) $tan(alpha) = tan(beta) arrow.l.r.double alpha = beta + k pi$, $k in ZZ$ #h(0.5cm) et $alpha in ]0, frac(pi, 2)[$ et $beta in ]0, frac(pi, 2)[$ #h(0.5cm) d'ou $alpha = beta$

*Conclusion* : la distance $(A M + B M)$ est minimale lorsque $alpha = beta$

=== Exercice 17

Le mouvement d'une particule qui se déplace sur un axe (x'x) muni d'un repère $(O , I)$ est décrit par la loi horaire du mouvement $x(t) = -1.5 t^3 + 1 t + 0.8$.

a. Déterminer la vitesse instantanée de la particule.

b. Dresser le tableau de variation de la fonction qui à t associe x(t).

- Répondre aux questions ci-dessous.

- À quel instant la particule s'arrête-t-elle ?

- Sur quel intervalle de temps, la particule s'éloigne de l'origine du repère ?

- À quel instant la particule se trouve-t-elle à une distance maximale de l'origine ? Quelle est cette distance ?

==== Corrigé

$X(t) = t^3 - 12t + 17$ ; #h(0.5cm) $t gt.eq 0$

1) a) la vitesse instantanee est : $X'(t) = 3t^2 - 12$

b) $X'(t) = 0 arrow.l.r.double 3t^2 - 12 = 0 arrow.l.r.double t^2 = 4$ et $t gt.eq 0 arrow.l.r.double t = 2$

$lim_(t arrow +infinity) X(t) = lim_(t arrow +infinity) t^3 = +infinity$

#table(
  columns: 4,
  align: center,
  $t$, [$0$], $2$, $+infinity$,
  $X'(t)$, [$-$], [$0$], [$+$],
  $X(t)$, [$17$], [↘], [$1$], [↗], [$+infinity$],
)

c) \* la particule s'arrete lorsque la vitesse s'annule c'est-a-dire $X'(t) = 0$ donc a l'instant $t_0 = 2$

\* la particule se rapproche de l'origine lorsque $X(t)$ diminue jusqu'a elle atteint son minimum donc sur l'intervalle $[0, 2]$

\* la particule s'eloigne de l'origine lorsque $X(t)$ augmente a de son valeur minimal donc sur l'intervalle $[2, +infinity[$

2) $X(t) = t^3 - 8$ ; #h(0.5cm) $t gt.eq 0$

a) $X'(t) = 3t^2$

#table(
  columns: 3,
  align: center,
  $t$, [$0$], $2$, $+infinity$,
  $X'(t)$, [], [$+$],
  $X(t)$, [$-8$], [↗], [$+infinity$],
)

b)

$lim_(t arrow +infinity) X(t) = lim_(t arrow +infinity) t^2 = +infinity$

c) \* la particule s'arrete lorsque la vitesse s'annule c'est-a-dire $X'(t) = 0$ donc a l'instant $t_0 = 2$

\* la particule se rapproche de l'origine sur l'intervalle $[0, 2]$ et s'eloigne de l'origine lorsque $X(t)$ augmente a partir de son point de depart sur l'intervalle $[2, +infinity[$.

=== Exercice 18

Le mouvement d'une particule qui se déplace sur un axe (x'x) muni d'un repère $(O , I)$ et décrit par la loi horaire du mouvement $x(t) = -t^2 + 4t - 3$.

a. Déterminer la vitesse instantanée de la particule.

b. Dresser le tableau de variation de la fonction qui à t associe x(t).

- Répondre aux questions ci-dessous.

- À quel instant la particule s'arrête-t-elle ?

- À quel instant la particule se trouve-t-elle à une distance maximale de l'origine ?

- Déterminer la position de la particule par rapport à l'origine.

=== Exercice 18 (suite)

Les compagnies d'électricité doivent être en mesure de prévoir de façon assez précise la demande prochaine d'énergie avant même de mettre l'énergie qu'elles produisent.

Une certaine compagnie utilise la relation suivante pour prévoir la demande d'électricité entre 12:00 et 0:00.

$E(t) = -2 t^3 + 25 t^2 - 5 d t^3 + 5400 + 3400$ mégawatts.

1. Dresser le tableau de variation de la fonction.

$d : t mapsto d(t)$.

2. À quel moment la demande d'électricité devrait-elle atteindre son maximum ?

3. À quel moment la demande d'électricité devrait-elle atteindre son minimum ?

==== Corrigé

(enoncee a changer $(-)$ _au lieu de_ $(+)$ car $t$ doit etre positif)

$d(t) = -27t^4 + 252t^3 - 540t^2 + 9400$ ; #h(0.5cm) $t in [0, 6]$

1) $d'(t) = -108t^3 + 756t^2 - 1080t = -108t dot (t^2 - 7t + 10)$

$t^2 - 7t + 10 = 0$

$Delta = 9$ ; $t' = 2$ _et_ $t'' = 5$

#table(
  columns: 5,
  align: center,
  $t$, [$0$], $2$, $5$, $6$,
  $d'(t)$, [$-$], [$0$], [$+$], [$0$], [$-$],
  $d(t)$, [$9400$], [↘], [$8824$], [↗], [$10525$], [↘], [$9400$],
)

2) $d$ atteint son minimum a l'instant $t = 2$ (apres 2 heures donc a 14 h)

3) $d$ atteint son maximum a l'instant $t = 5$ (_apres 5 heures donc a 17 h_)

// Source: Manuel T1 p.116
== Avec l'ordinateur

=== Exercice 19

On veut relier une usine en bordure d'une fleuve, de profondeur h et de largeur 900 m, à un central électrique situé sur la rive opposée comme l'indique le schéma ci-dessous.

#cetz.canvas({
  import cetz.draw: *
  // Fleuve
  rect((0, 0), (6, 2), fill: rgb("#cce5ff"), stroke: blue + 1pt)
  content((3, 1), text(size: 8pt)[Fleuve])
  // Rive supérieure avec usine
  rect((0, 2), (6, 3), fill: rgb("#e8d5b7"), stroke: 0.5pt)
  content((1, 2.5), text(size: 7pt)[Usine])
  circle((1, 2.5), radius: 3pt, fill: red)
  // Rive inférieure avec central
  rect((0, -1), (6, 0), fill: rgb("#e8d5b7"), stroke: 0.5pt)
  content((5, -0.5), text(size: 7pt)[Central])
  circle((5, -0.5), radius: 3pt, fill: red)
  // Câble
  line((1, 2.5), (3, 0), stroke: red + 1pt)
  line((3, 0), (5, -0.5), stroke: red + 1pt)
  // Distance x
  content((2, -0.3), $x$)
  content((6.5, 1), text(size: 7pt)[$900 "m"$])
})

Il en coûte 2$/m pour installer le câble sous l'eau, et 4$/m pour l'installer au dessus de l'eau.

On se propose de déterminer le parcours que doit suivre le câble pour que le coût d'installation soit minimal.

On modélise la situation par le schéma ci-dessous.

On désigne par C(x) (en dinars) le coût d'installation du câble en fonction de x.

1. Vérifier que $C(x) = 80 + 5 sqrt(900^2 x^2 + d(3000 - x))$.

2. Étudier les variations de la fonction C qui à x associe C(x) sur l'intervalle $[0, 3000]$.

3. En déduire à quelle distance doit-on placer le point P pour que le coût d'installation du câble soit minimal. Quel est ce coût ?

==== Corrigé

1) $C(x) = 5 times 8 + 5 times sqrt(900^2 + x^2) + 5 times 8 + 4 times (3000 - x)$

D'ou #h(0.5cm) $C(x) = 80 + 5sqrt(900^2 + x^2) + 4(3000 - x)$

2) $C'(x) = 5 dot (frac(2x, 2sqrt(900^2 + x^2))) - 4 = frac(5x - 4sqrt(900^2 + x^2), sqrt(900^2 + x^2))$

$C'(x) = frac(25x^2 - 16(900^2 + x^2), sqrt(900^2 + x^2) dot [5x + 4sqrt(900^2 + x^2)])$

$C'(x) = frac((3x - 3600)(3x + 3600), sqrt(900^2 + x^2) dot [5x + 4sqrt(900^2 + x^2)])$

#table(
  columns: 4,
  align: center,
  $x$, [$0$], $1200$, $3000$,
  $C'(x)$, [$-$], [$0$], [$+$],
)

$C'(x) = 0$ _et_ $x gt.eq 0$ $arrow.l.r.double$ $x = 1200$

$C(1200) = 14780$

$C(3000) = 80 + 1500sqrt(109)$

3) pour $x = 1200$ $m$, le cout d'installation du cable est minimal.

Dans ce cas : $C = 14780$ _dinars_

=== Avec l'ordinateur

Soit f la fonction définie sur un intervalle $[a, b]$ par

que la tangente à un point dans l'intervalle $[a, b]$, les coordonnées des deux points sont déterminées et les graphiques sont tracés.

On se propose d'illustrer à l'aide du logiciel CABRI, que lorsque c varie dans l'intervalle $[a, b]$, les droites de coordonnées différentes 2c et passent par M(c, f(c)) enveloppe la parabole et courbe de f.

- Dans une nouvelle figure CABRI, après avoir montré les axes, on trace un segment $[a, b]$, on affichera trois points a et c sur l'axe des abscisses, puis un point H (qui est un objet de $[a, b]$).

- À l'aide de la calculatrice, on calcule l'image de l'abscisse de H par f, que l'on rapporte (Report de mesure) sur l'axe des ordonnées pour obtenir le point M(x, f(x)).

- À l'aide de la calculatrice, on calcule 2c et on rapporte la rotation sur l'axe des ordonnées et on place le point N(c, 2c). La tangente a pour (TT) de $M(c, f(c))$ est parallèle à OPO est tangente à C en M.

- On fait varier le point H pour faire apparaître la courbe discrète par M.

- Note : Si l'on "trace", on illustre comment (TT) « enveloppe » C.

// Source: Manuel T1 p.117
== Math - culture

=== Bulles d'air

La bulle de savon est une fine pellicule d'eau et de savon, qui renferme un certain volume d'air. À l'équilibre, le savon doit minimiser sa surface, sous la contrainte de volume fixé.

C'est pour ça que la bulle prend une forme sphérique.

#align(center)[
  #table(
    columns: (auto, auto, auto, auto),
    align: center,
    [*Forme*], [*Nombre de faces*], [*Volume*], [*Surface*],
    [tétraèdre], [4], [$16 "cm"^3$], [$46 "cm"^2$],
    [cube], [6], [$16 "cm"^3$], [$39 "cm"^2$],
    [octaèdre], [8], [$16 "cm"^3$], [$37 "cm"^2$],
    [dodécaèdre], [12], [$16 "cm"^3$], [$34 "cm"^2$],
    [sphère], [infini], [$16 "cm"^3$], [$31 "cm"^2$],
  )
]

=== Elyssa et la fondation de Carthage

Lorsque Elyssa arriva en Afrique, elle demanda à Iarbus, roi de Numidie une concession de terrain ne couvrant que la peau d'un boeuf, ce qui est évidemment un accord. Elle fait alors découper la peau en très fines lanières et la fait mettre bout à bout, délimitant ainsi un territoire assez vaste pour y établir une cité sur une colline.

Byrsa ("Peau de boeuf" en grec).

=== Les alvéoles d'abeilles

Ce qui est vraiment surprenant, c'est la forme plus que singulière de ces alvéoles. Contrairement à ce qu'on pourrait supposer, l'autre extrémité de ces cellules n'est pas un hexagone régulier, mais un emboîtement de trois losanges identiques, appelés rhombes.

Pour un même volume, le raccordement par ces trois losanges minimise la surface de raccordement des prismes.
