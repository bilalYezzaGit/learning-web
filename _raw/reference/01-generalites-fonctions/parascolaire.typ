// =============================================================================
// Module 1 : Generalites sur les fonctions — PARASCOLAIRE ANALYSE (Kounouz)
// Programme : 3eme Math (Tunisie)
// Source : Parascolaire Analyse, Kounouz Editions, pages 5-25
// =============================================================================

#import "@preview/cetz:0.3.4"

= Parascolaire — Chapitre I : Generalites sur les fonctions

// Source: Parascolaire Analyse p.5
== Resume de cours

=== Definition d'une fonction

#block(stroke: 0.5pt, inset: 8pt, radius: 4pt, fill: rgb("#f0f7ff"))[
*Definition d'une fonction :*
- Une fonction est une relation qui a tout element d'un ensemble A de depart associe _au plus_ un element appele image dans l'ensemble d'arrivee B :
- Notation : $f : A -> B$\
  $x |-> f(x) = y$

d'une fonction f dans un repere $(o, arrow(i), arrow(j))$

On lit y egale f de x.

*Ensemble de definition.*
- On dit que f est definie sur un ensemble D.
  Si et seulement si pour tout $x$ de D, $f(x)$ existe.

*Representation graphique :*
La representation graphique est l'ensemble des points $M(x, f(x))$ dans un repere $(o, arrow(i), arrow(j))$
]

// Source: Parascolaire Analyse p.5
=== Restriction

#block(stroke: 0.5pt, inset: 8pt, radius: 4pt, fill: rgb("#f0f7ff"))[
*Definition :*
Soit f definie sur D, I une partie de D.
On appelle restriction de f a I, la fonction g definie sur I par $g(x) = f(x)$

Exemple : $f(x) = x^2$ sur $RR$\
$g(x) = x^2$ sur $RR_+$ alors g est la restriction de f sur $RR_+$
]

// Source: Parascolaire Analyse p.5
=== Parite

#block(stroke: 0.5pt, inset: 8pt, radius: 4pt, fill: rgb("#f0f7ff"))[
#table(
  columns: (auto, auto, auto, auto, auto),
  align: left,
  [*Proprietes*], [*Relation*], [*Intervalle d'etude*], [*Proprietes pour $zeta_f$*], [*Representation*],
  [Paire], [Pour tout $x in D$,\ $cases(-x in D, f(-x) = f(x))$], [$RR_+ sect D$], [Dans un repere orthogonal $(O y)$ axe de symetrie de $zeta_f$],
  [// TODO: figure — courbe symetrique par rapport a l'axe Oy, avec f(-x) et f(x) indiques],
  [Impaire], [Pour tout $x in D$\ on ait\ $cases(-x in D, f(-x) = -f(x))$], [$RR_+ sect D$], [Dans un repere O est un centre de symetrie de $zeta_f$],
  [// TODO: figure — courbe avec symetrie centrale par rapport a O, exemple f(x) = x^3],
)
]

// Source: Parascolaire Analyse p.6
=== Periodicite

#block(stroke: 0.5pt, inset: 8pt, radius: 4pt, fill: rgb("#f0f7ff"))[
#table(
  columns: (auto, auto, auto, auto, auto),
  align: left,
  [*Periodique*\ (de periode P\ $P > 0$)],
  [Pour tout $x in D$\ on ait\ $cases(x + p in D, f(x+p) = f(x))$],
  [$[x_0, x_0 + p] sect I$],
  [$zeta_f$ est obtenue en translatant la courbe f sur I par le vecteur $p k arrow(i)$ avec $k in ZZ$],
  [// TODO: figure — courbe periodique avec translation de periode P],
)
]

// Source: Parascolaire Analyse p.6
=== Sens de variation

#block(stroke: 0.5pt, inset: 8pt, radius: 4pt, fill: rgb("#f0f7ff"))[
f une fonction et I un intervalle continu dans le domaine de definition de f.

- f est *croissante* sur I\
  Si et seulement si pour tout $a, b in I$\
  Si $a <= b$ alors $f(a) <= f(b)$

- f est *decroissante* sur I\
  Si et seulement si pour tout $a, b in I$\
  Si $a <= b$ alors $f(a) >= f(b)$

- f est *constante* sur I signifie que\
  pour tout $a, b in I$ on a $f(a) = f(b)$

- f est *monotone* signifie que\
  f est Croissante ou decroissante.
]

// Source: Parascolaire Analyse p.6
=== Theoremes (racine carree et monotonie)

#block(stroke: 0.5pt, inset: 8pt, radius: 4pt, fill: rgb("#e8f5e9"))[
*Theoremes :*
- f est croissante et positive sur I $=> sqrt(f)$ est croissante sur I
- f est decroissante et positive sur I $=> sqrt(f)$ est decroissante sur I
]

// Source: Parascolaire Analyse p.6
=== Majorant - Minorant

#block(stroke: 0.5pt, inset: 8pt, radius: 4pt, fill: rgb("#f0f7ff"))[
*Majorant - Minorant*

f est une fonction definie sur I
- $M in RR$, On dit que f est *majoree* sur I par M\
  Si et seulement si pour tout $x in I$, $f(x) <= M$

- $m in RR$, on dit que f est *minoree* sur I par m\
  Si et seulement si pour tout $x in I$ ; $f(x) >= m$.

- f est *bornee* sur I si et seulement si il existe\
  $m, M in RR$ tel que $m <= f(x) <= M$
]

// Source: Parascolaire Analyse p.6-7
==== Exemple (minorant)

// TODO: figure — courbe avec droite horizontale y = m en dessous

// Source: Parascolaire Analyse p.7
#block(stroke: 0.5pt, inset: 8pt, radius: 4pt, fill: rgb("#fff7f0"))[
*Remarque :*
Si M est majorant de f alors tout reel M' tel que $M' >= M$ est un majorant de f.
Si m est un minorant de f alors tout reel tel que $m' < m$ est un minorant de f.
]

// Source: Parascolaire Analyse p.7
=== Maximum - Minimum

#block(stroke: 0.5pt, inset: 8pt, radius: 4pt, fill: rgb("#f0f7ff"))[
*Maximum - Minimum*

f definie sur un intervalle I de $RR$

- $x_0 in I$, on dit que f presente en $x_0$ un maximum egal a $f(x_0)$\
  si et seulement si, pour tout $x in I$, $f(x) <= f(x_0)$

- $x_0 in I$, on dit f presente en $x_0$ un minimum egal a $f(x_0)$\
  si et seulement si pour tout $x in I$, $f(x_0) <= f(x)$
]

// Source: Parascolaire Analyse p.7
=== Operations sur les fonctions

*1) Produit d'une Fonction par un reel k :*\
$(k f)(x) = k dot f(x)$\
- Domaine de definition de $k.f$ est egale a $D_f$
- $k > 0 => f$ et $k.f$ ont meme sens de variation
- $k < 0 => f$ et $k.f$ ont des sens de variation contraires

*2) Fonction somme : $f + g$*\
$(f + g)(x) = f(x) + g(x)$\
$D_(f+g) = D_f sect D_g$\
- f et g est croissante sur I $=> f + g$ est croissante
- f et g est decroissante sur I $=> f + g$ est decroissante sur I

*3) Fonction produit : $f times g$*\
$(f dot g)(x) = f(x) dot g(x)$\
Domaine de definition de $f times g$ est egale a $D_f sect D_g$\
On peut rien deduire pour les variations.

// Source: Parascolaire Analyse p.7-8
=== Reflexes

#block(stroke: 0.5pt, inset: 8pt, radius: 4pt, fill: rgb("#fff7f0"))[
#table(
  columns: (1fr, 1fr),
  align: left,
  [*Situations*], [*Reflexes*],
  [Comment etudier la parite d'une fonction ?],
  [Il faut verifier\ - Si $D_f$ est symetrique par rapport a 0 puis on test alors $f(-x) = plus.minus f(x)$],
  [Comment interpreter graphiquement les equations et les inequations ?],
  [$zeta$ et $zeta'$ les courbes respectives de f et g\ $->$ Les solutions de l'equation $f(x) = g(x)$ sont les abscisses des points d'intersection de $zeta_f$ et $zeta_g$\ $->$ les solutions de l'inequation $f(x) <= g(x)$ sont les abscisses des points de $zeta_g$ situes au dessus de $zeta_f$],
  [Comment montrer qu'un nombre reel M est majorant de f ? (ou m un minorant de f ?)],
  [- Etudier le signe de $f(x) - M$ et prouver que $f(x) - M <= 0$\ (respectivement $f(x) - m >= 0$)\ - utiliser les operations sur les inegalites\ - utiliser le tableau de variation.],
  [$zeta_f$ la courbe de f comment representent les fonctions g, h, L ?\ $g(x) = f(x + k)$\ $h(x) = f(x) + k$\ $L(x) = k f(x)$],
  [- $zeta_g = t_(- k arrow(i))(zeta_f)$\ - $zeta_h = t_(k arrow(j))(zeta_f)$\ - $zeta_L$ c'est l'ensemble des points M'\ tel que $cases(x' = x, y' = k y)$ $(M(x, y) in zeta_f)$],
  [Comment etudier les variations d'une fonction ?],
  [- On utilise la definition $a < b$ on etudie le signe de $f(b) - f(a)$.\ - On cherche le signe du taux de variation $T = frac(f(a) - f(b), a - b)$\ - On utilise les operations sur les fonctions.],
)
]

// =============================================================================
// Source: Parascolaire Analyse p.9-13
== Enonces

// Source: Parascolaire Analyse p.9
=== Exercice 1
Etudier la parite des fonctions definies f par :

a) $f(x) = x^2 + 2$

b) $f(x) = frac(x^3 - x, |x| + 4)$

c) $f(x) = sqrt(x) - 1$

d) $f(x) = sqrt(|x|) - 1$

// Source: Parascolaire Analyse p.9
=== Exercice 2
1) Montrer que si f est impaire et $f(0)$ existe alors $f(0) = 0$

2) f et g deux fonctions de meme parite\
que peut-on dire de la parite de $f + g$ et de $f times g$

// Source: Parascolaire Analyse p.9
=== Exercice 3
Soit f une fonction definies sur $RR$.
Etudier la parite des fonctions g et h definies sur $RR$ par :

$g(x) = frac(f(x) + f(-x), 2)$ et $h(x) = frac(f(x) - f(-x), 2)$

// Source: Parascolaire Analyse p.9
=== Exercice 4
1) Le tableau de variation ci dessous represente une fonction paire definie sur $RR$. Completer ce tableau

#table(
  columns: (auto, auto, auto, auto, auto),
  align: center,
  [$x$], [$-infinity$], [$-3$], [$0$], [...? ...],
  [],[],[$5$],[],[],
  [$f(x)$],[],[],[],[...............?...........],
  [],[$-infinity$],[?],[],[],
)

2) Reprenez la question precedente en supposant que f est impaire

// Source: Parascolaire Analyse p.9
=== Exercice 5
Soit f definie sur $RR$ telle que pour tout couple $(a, b)$ de $RR^2$ :
$f(a + b) - f(a) = f(b)$

1) Montrer que $f(0) = 0$

2) Montrer que f est impaire

3) Montrer que si f est periodique de periode T alors $f(T) = 0$

// Source: Parascolaire Analyse p.9-10
=== Exercice 6
Considerons la fonction f definie sur $RR$ et $zeta_f$ sa courbe respective dans le repere $(o, arrow(i), arrow(j))$ ci dessous.

// TODO: figure — courbe passant par (-2, valeur basse), montant vers (0, ~0), montant vers (2, 2), redescendant

1) Examiner la parite de f.

2) Dresser le tableau de variation de f.

3) a) Dresser le tableau de variation de g la restriction de f a l'intervalle $[-2, 2]$

b) Donner un maximum atteint par g puis en deduire deux majorants de g

c) Donner un minimum atteint par g puis en deduire deux minorants de g

d) g est elle bornee.

// Source: Parascolaire Analyse p.10
=== Exercice 7
Soit la fonction f definie sur $RR$ par $f(x) = frac(x, 1 + x^2)$.

Montrer que f est minoree par $-frac(1, 2)$ et majoree par $frac(1, 2)$.

// Source: Parascolaire Analyse p.10
=== Exercice 8
Soit la fonction f definie sur $RR$ par $f(x) = frac(x^2, 1 + x + x^2)$.

Montrer que f est minoree par 0 et majoree par $frac(4, 3)$.

// Source: Parascolaire Analyse p.10
=== Exercice 9
1) Ecrire le polynome $3x^2 - 2x + 1$ sous la forme canonique.

2) Montrer que les Fonctions suivantes sont bornees sur leurs ensembles de definitions.

$f(x) = frac(1, 3x^2 - 2x + 1)$ et $g(x) = frac(|cos x|, 3x^2 - 2x + 1)$

// Source: Parascolaire Analyse p.10
=== Exercice 10
Soit f la fonction definie par $f(x) = sqrt(x + 1) - sqrt(x)$

1) Determiner $D_f$ le domaine de definition de f

2) Montrer que $forall x in D_f$, $f(x) = frac(1, sqrt(x + 1) + sqrt(x))$

3) Montrer que $forall x in D_f$, f est minoree par 0 et majoree par 1.

// Source: Parascolaire Analyse p.10
=== Exercice 11
Etudier le sens de variations des fonctions f en utilisant les operations sur les fonctions.

1) $f(x) = -x + frac(1, x)$ sur $RR_+^* = I$

2) $f(x) = -5(x - frac(1, x))$ sur $]-infinity, 0[ = I$

3) $f(x) = (x^2 + 3)sqrt(x)$ sur $RR_+ = I$

// Source: Parascolaire Analyse p.10
=== Exercice 12
Montrer que f admet un extremum en $x_0$ sur l'intervalle I.

a) $f(x) = 2x^2 + 10x - 5$, $x_0 = -frac(5, 2)$ (minimum), $I = RR$

b) $f(x) = -2x^3 + 42x^2$, $x_0 = 14$ (maximum), $I = [14, 20]$

// Source: Parascolaire Analyse p.11
=== Exercice 13
Montrer en utilisant les variations que f admet un extremum sur l'intervalle I preciser le reel $x_0$ et la valeur $f(x_0)$ de cet extremum.

a) $f(x) = 3(x - 4)^2 + 8$, $I = RR$ (distinguer $x <= 4$ puis $x >= 4$)

b) $f(x) = frac(x, x - 2)$, $I = ]2, 4]$ utiliser le taux de variations

// Source: Parascolaire Analyse p.11
=== Exercice 14
On considere le tableau de variation suivant :

// TODO: figure — tableau de variation avec x allant de -infini a +infini,
// valeurs speciales en x = -2, 3/2, 3, 7/2, 4
// f(x) monte de -infini a 0 en x=-2, descend a -4 en x=3/2, monte a 3/2 en x=3,
// puis continue, avec valeur 0 en x=7/2, descend vers 0 en +infini

a) Quel est le minimum de f sur $]-infinity, 3[$ ? sur $[frac(7, 2), 4]$ ?

b) Quel est le maximum de f sur $]3, +infinity[$ ? sur $[-2, 1]$ ?

c) comparer $f(10)$ et $f(100)$ puis $f(-8)$ et $f(0)$

d) resoudre $f(x) <= 0$

// Source: Parascolaire Analyse p.11
=== Exercice 15
f definie sur $RR^*$, par $f(x) = frac(1 - 3x, x)$

a) Determiner les reels a et b tel que pour tout $x eq.not 0$, $f(x) = frac(a, x) + b$.

b) Determiner les variations de f.

c) dans un repere, tracer l'hyperbole $H : y = frac(1, x)$ et en deduire le trace de $zeta_f$

d) Determiner graphiquement le nombre de solution de l'equation
$frac(1 - 3x, x) = -2x^2$

// Source: Parascolaire Analyse p.11
=== Exercice 16
1) f definie sur $RR_+$ par $f(x) = sqrt(x)$. Construire $zeta_f$

2) Soit $g(x) = sqrt(x + 1)$
a) Determiner les variations de g.
b) Construire $zeta_f$ la courbe de g a partir de $zeta_f$.

3) Soit la fonction $h(x) = -sqrt(x + 1) + 4$. Preciser par quelle transformation geometrique obtient-on la courbe $zeta_h$ a partir de $zeta_g$

// Source: Parascolaire Analyse p.12
=== Exercice 17
Indiquer la bonne reponse a, b ou c. Justifier votre reponse.

1) La Fonction $f : x |-> 4 - x^2$ est decroissante sur\
a) $[0, +infinity[$ #h(2cm) b) $[-2, +infinity[$ #h(2cm) c) $]-infinity, 0]$

2) la fonction $f : x |-> sqrt(x) - 3$ est l'image de\
la fonction $g : x |-> sqrt(x)$ par la translation de vecteur.\
a) $-3 arrow(i)$ #h(2cm) b) $3 arrow(i)$ #h(2cm) c) $-3 arrow(j)$

3) La fonction $f : x |-> (x + 4)^2 - 3$ est l'image de\
la fonction $g : x |-> x^2$ par la translation de vecteur.\
a) $-4 arrow(i) - 3 arrow(j)$ #h(2cm) b) $4 arrow(i) - 3 arrow(j)$ #h(2cm) c) $-3 arrow(i) + 4 arrow(j)$

4) Voici le tableau de variation de la fonction f

#table(
  columns: (auto, auto, auto, auto, auto),
  align: center,
  [$x$], [$-3$], [$-1$], [$2$], [$4$],
  [],[$7$],[],[$5$],[],
  [$f(x)$],[],[],[], [],
  [],[],[$4$],[],[],
  [],[$2$],[],[],[],
)

Le maximum de f sur $[-3, 4]$ est\
a) 4 #h(2cm) b) 7 #h(2cm) c) 5

5) f est la fonction definie sur $RR$ par $f(x) = 1 + 2 sin x$. un majorant de f sur $RR$ est\
a) 1 #h(2cm) b) 2 #h(2cm) c) 4

6) soit la fonction $f(x) = x^3 + 1$ definie sur $RR_+$\
a) f est bornee #h(2cm) b) f est majoree #h(2cm) c) f est minoree

7) f est une fonction decroissante sur $RR$ : $f(1) = 7$ et $f(6) = -4$\
Alors pour tout $x in [1, 6]$ on a $f(x)$ appartient a l'intervalle :\
a) $[0, 7]$ #h(2cm) b) $[-4, 8]$ #h(2cm) c) $[-4, sqrt(47)]$

8) f la fonction definie sur $[3, 4]$ par : $f(x) = frac(x - 2, x)$ alors\
a) f est croissante sur I #h(1cm) b) f est decroissante sur I #h(1cm) c) f est constante sur I

9) f la fonction definie par $f(x) = x^3 - 3$ sur $RR$ alors f est decroissante sur l'intervalle\
a) $]-infinity, -1]$ #h(2cm) b) $[-1, 1]$ #h(2cm) c) $RR$.

10) voici le tableau de variation de la fonction f.

#table(
  columns: (auto, auto, auto, auto),
  align: center,
  [$x$], [$-7$], [$-4$], [$-3$],
  [$f(x)$], [], [], [],
)

On peut dire que :

a) $f(-7) <= f(-4)$ #h(1cm) b) $f(-6) >= f(-5)$ #h(1cm) c) $f(-6) <= f(-3)$

// Source: Parascolaire Analyse p.13
=== Exercice 18
1) Soit la fonction definie sur $[1, 2]$ par
$f(x) = x + sqrt(x + 8)$
Montrer que pour tout $x in [1, 2]$, $4 <= f(x) <= 6$

2) soit la fonction $g(x) = frac(12x^2 + 12, x^2 + 2)$ definie sur $RR$\
Montrer que g est majoree par 12 et minoree par 6

3) Montrer alors que pour tout $x in [1, 2]$
$x + sqrt(x + 8) < frac(12x^2 + 12, x^2 + 2)$

// Source: Parascolaire Analyse p.13
=== Exercice 19
Un producteur de fraises peut recolter 1200 kg de fraises et les vendre a 5 dinars le kg s'il attend, sa recolte augmente de 60kg par jours et le prix du kg baisse de 0,100 dinars par jour, le delai ne depassant pas 40 jours.

a) Montrer que le prix de vente P apres n jours est donne par :
$P(n) = 6(-n^2 + 30n + 1000)$

b) verifier que $P(n) = -6(n - 15)^2 + 7350$\
Etudier le sens de variation de P sur $[0, 40]$

c) quel est le nombre de jours au bout des quels on obtient le maximum de P.

// Source: Parascolaire Analyse p.13
=== Exercice 20
1) On considere la fonction u definie par $u(x) = x - frac(1, x)$

a) Determiner le domaine de definition de u et etudier sa parite.

b) Montrer que u est strictement croissante sur $]0, +infinity[$

c) Sur $]0, +infinity[$, resoudre $u(x) = 0$ et chercher le signe de $u(x)$.

d) determiner les variations de $u^2$.

2) On considere la fonction $f(x) = x^2 + frac(1, x^2)$

a) Determiner le domaine de definition de f et etudier sa parite.

b) Exprimer f en fonction de $u^2$.
En deduire les variations de f sur $]0, +infinity[$
On montrera en particulier que f admet un minimum egal a 2 sur cet intervalle.
Dresser le tableau de variation de f.


// =============================================================================
// Source: Parascolaire Analyse p.14-25
== Solutions detaillees

// Source: Parascolaire Analyse p.14
=== Exercice 1 — Corrige

*a)* $f(x) = x^2 + 2$, f est definie sur $RR$\
donc symetrique par rapport a 0 et $f(-x) = (-x)^2 + 2 = x^2 + 2 = f(x)$\
$=> f$ est paire

*b)* $f(x) = frac(x^3 - x, |x| + 4)$, $D_f = RR$, $x in RR$ alors $-x in RR$\
et $f(-x) = frac((-x)^3 - (-x), |-x| + 4) = frac(-x^3 + x, |x| + 4) = -frac(x^3 - x, |x| + 4) = -f(x)$ donc f est impaire.

*c)* $f(x) = sqrt(x) - 1$, $D_f = [1, +infinity[$\
$[1, +infinity[$ n'est pas symetrique par rapport a 0 donc f est ni paire ni impaire.

*d)* $f(x) = sqrt(|x|) - 1$\
$D_f = {x in RR \/ |x| - 1 >= 0}$\
$|x| >= 1 <=> x in ]-infinity, -1] union [1, +infinity[$ $D_f = ]-infinity, -1] union [1, +infinity[$\
$forall x in D_f$ alors $|x| >= 1 => |-x| >= 1$ car $|x| = |-x|$\
d'ou $D_f$ est symetrique par rapport a 0\
$* f(-x) = sqrt(|-x|) - 1 = sqrt(|x|) - 1 = f(x) => f$ est paire

// Source: Parascolaire Analyse p.14
=== Exercice 2 — Corrige

*1)* f est impaire et definie en 0 alors $f(-0) = -f(0)$\
soit $f(0) = -f(0)$ ou encore $f(0) = 0$

*2)* En supposant que f et g sont paires alors pour tout $x in RR$ on a :
- $f(-x) + g(-x) = f(x) + g(x)$ d'ou $(f + g)(-x) = (f + g)(x) => f + g$ est paire.
- $f(-x) times g(-x) = f(x) times g(x)$\
  $=> (f times g)(-x) = (f times g)(x) => f times g$ est paire.

*Conclusion :* Si f et g sont paires alors $f + g$ et $f times g$ sont paires.

b) supposons que f et g sont impairs alors pour tout $x in RR$ on a :
$f(-x) + g(-x) = -f(x) - g(x) => (f + g)(-x) = -(f + g)(x) => f + g$ est impaire.
$* f(-x) times g(-x) = (-f(x)) times (-g(x)) => (f times g)(-x) = (f times g)(x) => f times g$ est paire.

*Conclusion :* Si f et g sont impaires alors $f + g$ est impaire mais $f times g$ est paire. Finalement on deduit que :
Si f et g sont de meme parite alors $f + g$ est de meme parite mais $f times g$ est toujours paire.

// Source: Parascolaire Analyse p.15
=== Exercice 3 — Corrige

Pour tout $x in RR$
- $g(-x) = frac(f(-x) + f(x), 2) = g(x) => g$ est paire
- $h(-x) = frac(f(-x) - f(x), 2) = -h(x) => h$ est impaire.

// Source: Parascolaire Analyse p.15
=== Exercice 4 — Corrige

*1)* f est paire $=>$ la symetrie de la $zeta_f$ par rapport a l'axe des ordonnees conduit au tableau suivant :

#table(
  columns: (auto, auto, auto, auto, auto, auto),
  align: center,
  [$x$], [$-infinity$], [$-3$], [$0$], [$3$], [$+infinity$],
  [],[], [$5$],[], [$5$],[],
  [$f(x)$],[],[],[],[],[],
  [],[$-infinity$],[],[$?$],[],[$-infinity$],
)

On peut donner n'importe quelle valeur a $f(0)$, inferieur a 5.

*2)* f est impaire $=> f(0) = 0$ et symetrie de $zeta_f$ par rapport a l'origine du repere permet de completer le tableau

#table(
  columns: (auto, auto, auto, auto, auto, auto),
  align: center,
  [$x$], [$-infinity$], [$-3$], [$0$], [$3$], [$+infinity$],
  [],[], [$5$],[], [],[$+infinity$],
  [$f(x)$],[],[],[],[],[],
  [],[$-infinity$],[],[$0$],[],[$-5$],[],
)

// Source: Parascolaire Analyse p.15
=== Exercice 5 — Corrige

*1)* On a : $f(a + b) - f(a) = f(b)$\
pour $a = b = 0$ l'egalite devient $f(0 + 0) - f(0) = f(0)$\
d'ou $cancel(f(0)) - cancel(f(0)) = f(0)$ ainsi $f(0) = 0$

*2)* pour tout $x in RR$, $-x in RR$\
On prend $b = -x$ et $a = x$\
L'egalite $f(a + b) - f(a) = f(b)$\
devient : $f(x - x) - f(x) = f(-x)$\
$f(0) - f(x) = f(-x)$ or $f(0) = 0$\
d'ou $f(-x) = -f(x)$ ainsi f est impaire

*3)* f est periodique de periode T $=> f(x + T) = f(x)$\
or $f(a + b) - f(a) = f(b)$ on prend : $a = x$, $b = T$\
d'ou $f(x + T) - f(x) = f(T)$ Or $f(x + T) = f(x)$ Ainsi l'egalite devient $0 = f(T)$

// Source: Parascolaire Analyse p.15-16
=== Exercice 6 — Corrige

*1)* $zeta_f$ admet l'origine 0 pour centre de symetrie, f est donc impaire.

*2)* La lecture de la courbe permet de distinguer trois intervalles ou f est monotone. Le tableau de variation suivant en resulte

#table(
  columns: (auto, auto, auto, auto, auto),
  align: center,
  [$x$], [$-infinity$], [$-1$], [$1$], [$+infinity$],
  [],[], [$2$],[], [$+infinity$],
  [$f(x)$],[],[],[],[],
  [],[$-infinity$],[],[$-2$],[],
)

*3)* a)

#table(
  columns: (auto, auto, auto, auto, auto),
  align: center,
  [$x$], [$-2$], [$-1$], [$1$], [$+infinity$],
  [],[], [$2$],[], [$0$],
  [$g(x)$],[],[],[],[],
  [],[$0$],[],[$-2$],[],
)

b) g presente un maximum egal a 2 atteint pour $x = -1$ alors tout nombre superieur a 2 est un majorant pour g (il ya une infinite) par exemple : 3 et 5

c) g presente un minimum egal a -2 atteint en $x = 1$ alors tout nombre inferieur a -2 est un minorant pour g (il ya une infinite) par exemple : -3 et -10

d) g admet un minorant -2 et un majorant 2 alors\
$-2 <= g(x) <= 2$ donc g est bornee.

// Source: Parascolaire Analyse p.16
=== Exercice 7 — Corrige

$* f(x) - (-frac(1, 2)) = f(x) + frac(1, 2) = frac(x, 1 + x^2) + frac(1, 2) = frac(2x + (1 + x^2), 2(1 + x^2)) = frac((x + 1)^2, 2(1 + x^2)) >= 0$

car $(x + 1)^2 >= 0$ et $(x^2 >= 0 => 1 + x^2 > 0)$ d'ou $f(x) >= -frac(1, 2)$.

$* f(x) - frac(1, 2) = frac(x, 1 + x^2) - frac(1, 2) = frac(2x - 1 - x^2, 2(1 + x^2)) = -frac(x^2 - 2x + 1, 2(1 + x^2)) = frac(-(x - 1)^2, 2(1 + x^2)) <= 0$

Car $(x - 1)^2 >= 0$ et $2(1 + x^2) > 0$

D'ou $f(x) - frac(1, 2) <= 0$ par suite $f(x) <= frac(1, 2)$.

Conclusion : f est majoree par $frac(1, 2)$ et minoree par $-frac(1, 2)$

// Source: Parascolaire Analyse p.16-17
=== Exercice 8 — Corrige

$* 1 + x + x^2$ est polynome du $2^(e m e)$ degre de discriminant\
$Delta = -3$ donc $1 + x + x^2 > 0$\
d'autre part $x^2 >= 0$\
d'ou $f(x) >= 0$.

$* f(x) - frac(4, 3) = frac(x^2, 1 + x + x^2) - frac(4, 3) = frac(3x^2 - 4(1 + x + x^2), 3(1 + x + x^2))$

$= frac(-x^2 - 4x - 4, 3(1 + x + x^2)) = -frac(x^2 + 4x + 4, 3(1 + x + x^2)) = -frac((x + 2)^2, 3(1 + x + x^2)) <= 0$

car $(x + 2)^2 >= 0$ et on a $1 + x + x^2 > 0$

d'ou $f(x) - frac(4, 3) <= 0$ soit $f(x) <= frac(4, 3)$

Conclusion : f est minoree par 0 et majoree par $frac(4, 3)$

// Source: Parascolaire Analyse p.17
=== Exercice 9 — Corrige

*1)* $3x^2 - 2x + 1 = 3(x^2 - frac(2, 3)x) + 1$

$= 3(x^2 - 2 dot frac(1, 3) x + frac(1, 9) - frac(1, 9)) + 1 = 3(x - frac(1, 3))^2 + frac(2, 3)$

*2)* Comme on a :
$3x^2 - 2x + 1 = 3(x - frac(1, 3))^2 + frac(2, 3) > 0$

car $(x - frac(1, 3))^2 >= 0$ d'ou $D_f = I R = D_g$

$*$ On sait que $(x - frac(1, 3))^2 >= 0$

Soit $3(x - frac(1, 3))^2 >= 0$ equivaut a $3(x - frac(1, 3))^2 + frac(2, 3) >= frac(2, 3)$

d'ou $3x^2 - 2x + 1 >= frac(2, 3)$

et en inversant : $0 < frac(1, 3x^2 - 2x + 1) <= frac(3, 2)$

soit $0 < f(x) <= frac(3, 2)$

f est donc bien bornee sur $D_f$.

$* g(x) = frac(|cos x|, 3x^2 - 2x + 1)$ ayant $-1 <= cos x <= 1$

On a donc $|cos x| <= 1$ et comme $0 < frac(1, 3x^2 - 2x + 1) <= frac(3, 2)$

donc $0 < frac(|cos x|, 3x^2 - 2x + 1) <= frac(3, 2)$ par suite g est bornee sur son $D_f = I R$.

// Source: Parascolaire Analyse p.17-18
=== Exercice 10 — Corrige

$* f(x) = sqrt(x + 1) - sqrt(x)$

*1)* f est definie lorsque $x + 1 >= 0$ et $x >= 0$\
ou encore $x >= -1$ et $x >= 0$\
on a donc $D_f = RR_+$

*2)* $f(x) = sqrt(x + 1) - sqrt(x)$ on multiplie et on divise par l'expression conjuguee

$f(x) = frac((sqrt(x + 1) - sqrt(x))(sqrt(x + 1) + sqrt(x)), sqrt(x + 1) + sqrt(x)) = frac(sqrt(x + 1)^2 - sqrt(x)^2, sqrt(x + 1) + sqrt(x)) = frac(1, sqrt(x + 1) + sqrt(x))$

*3)* on a $x in D_f = RR_+$

$x >= 0 => x + 1 >= 1 => sqrt(x + 1) >= 1$ d'ou $sqrt(x + 1) + sqrt(x) >= 1$

donc $0 < frac(1, sqrt(x + 1) + sqrt(x)) <= 1$ par suite $0 < f(x) <= 1$

Finalement f est minoree par 0 et majoree par 1.

// Source: Parascolaire Analyse p.18
=== Exercice 11 — Corrige

*1)* $f(x) = -x + frac(1, x)$ sur $RR_+^* = I$

soit $U(x) = -x$ decroissante sur I et $V(x) = frac(1, x)$ decroissante sur I

Comme $f(x) = U(x) + V(x)$ alors f est decroissante sur I

*2)* $f(x) = -5(x - frac(1, x))$

soit $u(x) = x$ croissante sur I et $V(x) = frac(1, x)$ decroissante sur I alors $-V$ est croissante sur I donc la fonction $U - V$ est croissante sur I comme f est definie par $-5 (U - V)$ donc f est decroissante sur I

*3)* $f(x) = (x^2 + 3) sqrt(x)$, $I = RR_+$

Soit $U(x) = sqrt(x)$ croissante sur $RR_+$\
$V(x) = x^2 + 3$ croissante sur $RR_+$ et $U(x) >= 0$ et $V(x) > 0$\
Comme $f(x) = U(x) dot V(x)$ donc f est croissante sur $RR_+$

// Source: Parascolaire Analyse p.18
=== Exercice 12 — Corrige

*a)* Il s'agit de montrer que $f(x) >= f(-frac(5, 2))$ pour tout reel x.

$f(x) - f(-frac(5, 2)) = 2x^2 + 10x - 5 - (frac(25, 2) - 25 - 5)$

$= 2x^2 + 10x - 5 + frac(35, 2) = 2x^2 + 10x + frac(25, 2)$

$= 2(x^2 + 5x + frac(25, 4)) = 2(x + frac(5, 2))^2 >= 0$

Donc $f(x) >= f(-frac(5, 2))$ d'ou $f(-frac(5, 2))$ est un minimum de f sur $RR$.

// Source: Parascolaire Analyse p.18-19
*b)* $f(x) - f(14) = -2x^3 + 42x^2 - (-2 times 14^3 + 42 times 14^2)$

$= -2(x^3 - 14^3) + 42(x^2 - 14^2)$

$= -2(x - 14)(x^2 + 14x + 14^2) + 42(x - 14)(x + 14)$

$= (x - 14)(-2x^2 + 14x + 196)$

$-2x^2 + 14x + 196$ a pour discriminant $Delta = 1764 = 42^2$

$x' = frac(-14 - 42, -4) = 14$ et $x'' = frac(-14 + 42, -4) = -7$

Ainsi $-2x^2 + 14x + 196 = -2(x - 14)(x + 7)$.

D'ou $f(x) - f(14) = -2(x - 14)^2(x + 7)$.

Comme $(x - 14)^2 >= 0$ et $x + 7 > 0$ car $x >= 14$

D'ou $f(x) - f(14) <= 0$ ou encore $f(x) <= f(14)$

Ainsi $f(14)$ est un maximum de f sur $[14, 20]$.

// Source: Parascolaire Analyse p.19
=== Exercice 13 — Corrige

*a)* $f(x) = 3(x - 4)^2 + 8$

- sur $]-infinity, 4]$ on a $x <= 4 <=> x - 4 <= 0$\
  $a$ et $b in ]-infinity, 4]$ tel que $a <= b$\
  $=> (a - 4) <= (b - 4)$ comme $a - 4 <= 0$ et $b - 4 <= 0$\
  $=> (a - 4)^2 >= (b - 4)^2$\
  $=> f(a) >= f(b) => f$ est strictement decroissante sur $]-infinity, 4]$

- $a$ et $b in [4, +infinity[ => a >= 4$ et $b >= 4$\
  $a <= b => a - 4 <= b - 4 => (a - 4)^2 <= (b - 4)^2$\
  $=> f(a) <= f(b) => f$ est strictement croissante sur $[4, +infinity[$

*Tableau de variation :*

#table(
  columns: (auto, auto, auto, auto),
  align: center,
  [$x$], [$-infinity$], [$4$], [$+infinity$],
  [$f(x)$], [], [], [],
)

Pour tout reel x on a: $f(x) >= f(4)$ et $f(4) = 8$\
$=> 8$ est minimum de f sur $RR$.

*b)* $a, b in ]2, 4]$ tel que $a eq.not b$

$T = frac(f(b) - f(a), b - a) = frac(frac(b, b-2) - frac(a, a-2), b - a) = frac(b(a-2) - a(b-2), (b-a)(a-2)(b-2))$

$= frac(-2b + 2a, (b-a)(a-2)(b-2)) = frac(-2(b-a), (b-a)(a-2)(b-2)) = frac(-2, (a-2)(b-2))$

or $a > 2$ et $b > 2 => a - 2 > 0$ et $b - 2 > 0$

d'ou $T < 0 => f$ est strictement decroissante sur $]2, 4]$

$2 < x <= 4$ et f est strictement decroissante sur $]2, 4]$

donc $f(x) >= f(4)$ or $f(4) = 2 => f(x) >= 2$

par suite 2 est un minimum de f sur $]2, 4]$

// Source: Parascolaire Analyse p.20
=== Exercice 14 — Corrige

D'apres le tableau de variation de f on a :

*a)*
- Pour $x in ]-infinity, 3[$, $f(x) >= -4$\
  $=> -4$ est un minimum de f sur $]-infinity, 3[$

- Pour $x in [frac(7, 2), 4]$, $f(x) >= f(frac(7, 2))$ et $f(frac(7, 2)) = 0 => f(x) >= 0$\
  $=> 0$ est un minimum de f sur $[frac(7, 2), 4]$

*b)*
- Pour $x in ]3, +infinity[$, $f(x) <= f(4)$ et $f(4) = frac(3, 2) => f(x) <= frac(3, 2)$\
  $=> frac(3, 2)$ est un maximum de f sur $]3, +infinity[$

- Pour $x in [-2, -1]$, $f(x) <= f(-2)$ et $f(-2) = 0 => f(x) <= 0$\
  $=> 0$ est un maximum de f sur $[-2, -1]$.

*c)* 10 et $100 in [4, +infinity[$ et f est strictement decroissante sur $[4, +infinity[$\
$10 < 100 => f(10) > f(100)$

- $-8$ et $0 in ]-infinity, 1]$ et f est strictement decroissante sur $]-infinity, 1]$\
  $-8 < 0 => f(-8) > f(0)$

*d)* sur $]-infinity, 2[$, f est strictement decroissante $=> f(x) > f(-2) => f(x) > 0$

sur $[-2, 1]$, f est decroissante et $f(frac(3, 2)) = 0 => f(x) <= f(-2) => f(x) <= 0$

sur $[1, 3[$ f est croissante et $f(frac(3, 2)) = 0$

- $f(x) <= f(frac(3, 2)) => f(x) <= 0$ pour $x in [1, frac(3, 2)]$
- $f(x) > 0$ sur $]frac(3, 2), 3[$, de meme sur $]3, 4]$ puis sur $[4, +infinity[$

On obtient le tableau suivant :

#table(
  columns: (auto, auto, auto, auto, auto, auto, auto),
  align: center,
  [$x$], [$-infinity$], [$-2$], [$frac(3, 2)$], [$3$], [$frac(7, 2)$], [$+infinity$],
  [$f(x)$], [$+$], [$0$], [$-$], [$0$], [$+$], [],
  [], [], [], [], [$||$], [], [],
  [], [], [], [], [$-$], [$0$], [$+$],
)

$f(x) <= 0 <=> x in [-2, frac(3, 2)] union [3, frac(7, 2)]$ donc $S_(I R) = [-2, frac(3, 2)] union [3, frac(7, 2)]$

// Source: Parascolaire Analyse p.21
=== Exercice 15 — Corrige

*a)* $1^(e r e)$ methode :

$f(x) = frac(1 - 3x, x) = frac(1, x) - frac(3x, x) = frac(1, x) - 3$ donc $a = 1$ et $b = -3$

$2^(e m e)$ methode :

$f(x) = frac(a, x) + b = frac(a + b x, x) = frac(1 - 3x, x)$

par identification on obtient : $a = 1$ et $b = -3$

*b)* $f(x) = frac(1, x) - 3$

sur $RR^*$ on sait que $frac(1, x)$ est strictement decroissante

donc $f(x) = frac(1, x) - 3$ est strictement decroissante sur $RR^*$

*c)* $H : y = frac(1, x)$ est une hyperbole d'asymptotes $x = 0$ et $y = 0$.

- $f(x) = frac(1, x) - 3 => t_(- 3 arrow(j))(H) = zeta_f$

// TODO: figure complexe — graphique avec l'hyperbole H: y = 1/x, puis Cf = translation de H par -3j, asymptotes x=0 et y=-3, et la parabole C: y = -2x^2

d) On trace la courbe $zeta : y = -2x^2$\
les courbes $zeta$ et $zeta_f$ se coupent en 3 points\
A, B et C donc l'equation\
$frac(1 - 3x, x) = -2x^2$ admet 3 solutions

// Source: Parascolaire Analyse p.21-22
=== Exercice 16 — Corrige

*1)* $f(x) = sqrt(x)$

#table(
  columns: (auto, auto, auto, auto, auto),
  align: center,
  [$x$], [$0$], [$1$], [$2$], [$3$],
  [$f(x)$], [$0$], [$1$], [$sqrt(2)$], [$sqrt(3)$],
)

*2)* a) $g(x) = sqrt(x + 1)$ definie sur $[-1, +infinity[$

Soit $u(x) = x + 1$ croissante sur $[-1, +infinity[$ et $U(x) > 0$

$=> g$ est croissante sur $]-1, +infinity[$

b) $g(x) = sqrt(x + 1) = f(x + 1)$

$=> t_(- arrow(i))(zeta_f) = zeta_g$.

// TODO: figure — courbes Cf (sqrt(x)) et Cg (sqrt(x+1)) dans le meme repere, Cg est Cf translatee de -1 vers la gauche

*3)* $h(x) = -sqrt(x + 1) + 4 = -g(x) + 4$

$zeta_h$ se deduit de la courbe de g par :
- On construit $zeta_1$ symetrique $zeta_g$ par rapport a $(x x')$ puis en deduit $zeta_h$ de $zeta_1$ par la translation du vecteur $4 arrow(j)$

// Source: Parascolaire Analyse p.22
=== Exercice 17 — Corrige

*1)* la reponse est *a* : $u(x) = x^2$ est croissante sur $RR_+$\
$=> -u$ est decroissante sur $RR_+$\
$=> f$ est decroissante sur $RR_+$

*2)* La reponse est *c* :\
$f(x) = sqrt(x) - 3 = g(x) - 3 => zeta_f = t_(- 3 arrow(j))(zeta_g)$

*3)* La reponse est *a* : $f(x) = g(x + 4) - 3$ donc $zeta_f$ est l'image de $zeta_g$ par la translation du vecteur $-4 arrow(i) - 3 arrow(j)$.

*4)* La reponse est *b* : 7 est le maximum de f sur $[-3, 4]$

*5)* La reponse est *c* : on a $-1 <= sin x <= 1 => -1 <= 1 + 2 sin x <= 3 < 4$\
$=> 4$ est un majorant de f sur $RR$.

*6)* La reponse est *c* :\
$x in RR_+ <=> x >= 0 <=> x^3 >= 0 => x^3 + 1 >= 1 => f(x) >= 1 => f$ est minoree par 1

*7)* La reponse est *b* : f est decroissante sur $[1, 6]$ alors $f(6) <= f(x) <= f(1)$\
$=> -4 <= f(x) <= 7 < 8 => f(x) in [-4, 8]$

*8)* La reponse est *a* : $f(x) = frac(x - 2, x) = 1 - frac(2, x)$;\

Soit $u(x) = frac(1, x)$ est decroissante sur I\
$=> -2u$ est croissante sur I $=> f$ est croissante sur I

*9)* La reponse est *c* :\
$f(x) = x^3 - 3$ or $x |-> x^3$ est croissante sur $RR => f$ est croissante sur $RR$

// Source: Parascolaire Analyse p.23
*10)* La reponse est *b* : f est decroissante sur $[-7, -4]$\
$-6$ et $-5 in [-7, -4]$ et $-6 < -5$ donc $f(-6) >= f(-5)$

// Source: Parascolaire Analyse p.23
=== Exercice 18 — Corrige

*1)* On a : $1 <= x <= 2$\
$=> 9 <= x + 8 <= 10$\
$=> sqrt(9) <= sqrt(x + 8) <= sqrt(10)$\
$=> 3 <= sqrt(x + 8) <= sqrt(10)$ et $1 <= x <= 2$

donc $4 <= x + sqrt(x + 8) <= sqrt(10) + 2$ or $sqrt(10) < sqrt(16) = 4$\
$=> sqrt(10) + 2 < 6$ finalement $4 <= f(x) <= sqrt(10) + 2 <= 6$

*2)* $g(x) = frac(12x^2 + 12, x^2 + 2)$

$* g(x) - 12 = frac(12x^2 + 12 - 12(x^2 + 2), x^2 + 2) = frac(-12, x^2 + 2) < 0$

car $(x^2 >= 0 => x^2 + 2 > 0)$\
$=> g(x) - 12 <= 0 => g(x) <= 12$

$* g(x) - 6 = frac(12x^2 + 12 - 6(x^2 + 2), x^2 + 2) = frac(6x^2, x^2 + 2)$ car $6x^2 > 0$ et $x^2 + 2 > 0$\
$=> g(x) - 6 >= 0 => g(x) >= 6$

ainsi g est majoree par 12 et minoree par 6.

*3)* sur $[1, 2]$ on a $4 <= f(x) <= 6$\
sur $RR$ on a $6 <= g(x) <= 12$\
donc $forall x in [1, 2]$ on a : $f(x) <= 6$ et $6 <= g(x)$

par suite $g(x) >= 6 >= f(x) => x + sqrt(x + 8) <= frac(12x^2 + 12, x^2 + 2)$

// Source: Parascolaire Analyse p.23
=== Exercice 19 — Corrige

*a)* Apres n jours le poids de la recolte est $1200 + 60n$ et le prix du kg est $(5 - 0.1 n)$\
D'ou $P(n) = (1200 + 60n)(5 - 0.1n) = 6000 - 120n + 300n - 6n^2$\
$= 6(-n^2 + 30n + 1000)$

*b)* $-6(n - 15)^2 + 7350 = -6(n^2 - 30n + 225) + 7350$\
$= -6n^2 + 180n - 1350 + 7350 = -6n^2 + 180n + 6000$\
$= 6(-n^2 + 30n + 1000) = P(n)$

$P(n) = -6(n - 15)^2 + 7350$\
$u(n) = (n - 15)^2$ croissante sur $[15, 40]$ et decroissante sur $[0, 15]$\
$=> -6u$ est decroissante sur $[15, 40]$ et croissante sur $[0, 15]$\
$=> P$ est decroissante sur $[15, 40]$ et croissante sur $[0, 15]$

// TODO: tableau de variation de P avec n de 0 a 15 (croissant) puis 15 a 40 (decroissant)

*c)* le maximum de P est atteint pour $n = 15$\
Donc au bout du $15^(e m e)$ jours le profit maximum est obtenu.

// Source: Parascolaire Analyse p.24-25
=== Exercice 20 — Corrige

*1)* a) $u(x) = x - frac(1, x)$ d'ou $D_u = RR^*$.

$forall x in RR^*$ on a $-x in RR^*$ et $u(-x) = -x - frac(1, -x) = -x + frac(1, x) = -u(x)$

Donc u est impaire.

b) sur $]0, +infinity[$, $u(x) = x - frac(1, x)$

u est la somme de deux fonction $x |-> x$ et $x |-> -frac(1, x)$ qui sont strictement croissantes sur $]0, +infinity[$

d'ou u est strictement croissante sur $]0, +infinity[$

c) $* u(x) = 0$ et comme $x eq.not 0$

alors l'equation est equivalente a $frac(x^2 - 1, x) = 0$ soit $x^2 - 1 = 0$\
$<=> x = 1$ ou $x = -1$ or $x in ]0, +infinity[$\
$<=> x = 1$ d'ou $S{1}$

$* u(x) = x - frac(1, x) = frac(x^2 - 1, x) = frac((x-1)(x+1), x)$\
comme $x > 0$ alors $x + 1 > 0$\
d'ou le signe de $u(x)$ est celui de $(x - 1)$

#table(
  columns: (auto, auto, auto, auto),
  align: center,
  [$x$], [$0$], [$1$], [$+infinity$],
  [$x - 1$], [], [$0$], [],
  [], [$-$], [], [$+$],
  [$u(x)$], [], [$0$], [],
  [], [$-$], [], [$+$],
)

d) $*$ sur $[1, +infinity[$ on a u est strictement croissante signifie que pour tout $a, b$ de $[1, +infinity[ in ]1, +infinity[$.

$a > b => u(a) > u(b)$ or u est positive sur $[1, +infinity[$\
$=> u^2(a) >= u^2(b)$\
$=> u^2$ est strictement croissante sur $[1, +infinity[$

$*$ sur $]0, 1]$ on a u strictement croissante signifie que pour tout $a, b$ de $]0, 1]$,\
$a > b => u(a) > u(b)$ or u est negative sur $]0, 1]$\
D'ou $u^2(a) < u^2(b)$\
Ainsi $u^2$ est strictement decroissante sur $]0, 1]$.

#table(
  columns: (auto, auto, auto, auto),
  align: center,
  [$x$], [$0$], [$1$], [$+infinity$],
  [$u^2(x)$], [], [], [],
)

// Le tableau montre u^2 decroissant sur ]0,1] puis croissant sur [1,+infini[

*2)* $f(x) = x^2 + frac(1, x^2)$

a) $* D_f = RR^*$\
$* forall x in RR^*$ on a $-x in RR^*$\
$f(-x) = (-x)^2 + frac(1, (-x)^2) = x^2 + frac(1, x^2) = f(x)$ alors f est paire.

b) $u(x) = x - frac(1, x)$ alors $u^2(x) = (x - frac(1, x))^2$

$= x^2 - 2 dot frac(1, x) dot x + frac(1, x^2)$

$= x^2 + frac(1, x^2) - 2$

ainsi $u^2(x) = x^2 + frac(1, x^2) - 2$

$u^2(u) = f(x) - 2$

d'ou $f(x) = u^2(x) + 2$

par suite f est $u^2$ ont les meme variations\
d'ou le tableau de variation de f

#table(
  columns: (auto, auto, auto, auto),
  align: center,
  [$x$], [$0$], [$1$], [$+infinity$],
  [$f(x)$], [], [], [],
)

// f decroissant sur ]0,1] (vers 2) puis croissant sur [1,+infini[

$f(1) = 2$ pour tout $x in ]0, +infinity[$ on a $f(x) >= 2$\
$=> 2$ est un minimum pour f.
