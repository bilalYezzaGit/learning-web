// =============================================================================
// Transcription fidele : Parascolaire Analyse 3eme sec (Kounouz Editions)
// Chapitre VI — Fonctions Derivees
// Pages 134 a 196
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

#let theorem-block(body) = block(
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

// =============================================
// RESUME DE COURS
// =============================================

#align(center)[
  _Chapitre VI_
  #v(0.3em)
  #text(size: 18pt, weight: "bold")[Fonctions Derivees]
]

#v(1em)

// Source: Parascolaire Analyse p.134

#definition-block[
  == Definitions

  Soit $f$ une fonction definie sur un intervalle $I$.

  On dit que $f$ est derivable sur un intervalle $I$.

  Si $f$ est derivable en tout point $a$ de $I$.

  La fonction qui a tout reel $a$ de $I$, on associe le nombre derive de $f$ en $a$, s'appelle fonction derivee de $f$ sur $I$ notee $f'$.
]

#v(1em)

// Source: Parascolaire Analyse p.134

#definition-block[
  == Derivees des fonctions usuelles

  Le tableau suivant donne les derivees des principales fonctions usuelles.

  #table(
    columns: (1fr, auto, 1fr, auto),
    align: (left, center, left, center),
    stroke: 0.5pt,
    [*Fonction*], [*Domaine de definition*], [*Fonction derivee*], [*Derivable sur*],
    [$x |-> k$ ($k$ reel)], [$RR$], [$x |-> 0$], [$RR$],
    [$x |-> x$], [$RR$], [$x |-> 1$], [$RR$],
    [$x |-> a x + b$], [$RR$], [$x |-> a$], [$RR$],
    [$x |-> x^n$ ($n in NN^*$)], [$RR$], [$x |-> n x^(n-1)$], [$RR$],
    [$x |-> frac(1, x)$], [$RR^*$], [$x |-> -frac(1, x^2)$], [$RR^*$],
    [$x |-> frac(1, x^n)$ ($n in NN^*$)], [$RR^*$], [$x |-> -frac(n, x^(n+1))$], [$RR^*$],
    [$x |-> sqrt(x)$], [$RR_+$], [$x |-> frac(1, 2 sqrt(x))$], [$RR_+^*$],
  )
]

#v(1em)

// Source: Parascolaire Analyse p.134-135

#definition-block[
  == Operations sur les fonctions derivables

  $f$ et $g$ sont deux fonctions derivables sur $I$, de fonctions derivees respectives $f'$ et $g'$ sur $I$.

  #table(
    columns: (1fr, 1fr),
    align: (center, center),
    stroke: 0.5pt,
    [*Fonction*], [*Derivee*],
    [$f + g$], [$f' + g'$],
    [$lambda f$ ($lambda in RR$)], [$lambda f'$],
    [$f times g$], [$f' times g + f times g'$],
    [$frac(1, f)$ ($f(x) eq.not 0$)], [$-frac(f', f^2)$],
    [$frac(f, g)$ ($g(x) eq.not 0$)], [$frac(f' times g - g' times f, g^2)$],
    [$f^n$ ($n in ZZ^*$)], [$n f^(n-1) times f'$],
    [$sqrt(f)$], [$frac(f', 2 sqrt(f))$],
    [$f(a x + b)$], [$a dot f'(a x + b)$],
  )
]

#v(1em)

// Source: Parascolaire Analyse p.135

#remarque-block[
  *Remarque :*
  - Toute fonction polynome est derivable sur $RR$.
  - Toute fonction rationnelle est derivable sur son domaine de definition.
]

#v(1em)

// Source: Parascolaire Analyse p.135

#definition-block[
  == Les derivees successives

  Si $f'$ est derivable sur $I$ alors on note $f''$ la fonction derivee de $f'$, on l'appelle la fonction derivee seconde.

  *Remarque :* $f', f'', f''', ..., f^((n))$ sont les derivees successifs d'une fonction derivable ($n$) fois sur $I$.

  - Toute fonction polynome est derivable ($n$) fois sur $RR$.
  - Toute fonction rationnelle est derivable ($n$) fois sur son domaine de definition.
]

#v(1em)

// Source: Parascolaire Analyse p.135

#theorem-block[
  == Sens de variation d'une fonction

  $I$ designe un intervalle, $f$ est une fonction definie sur $I$ et derivable.

  - Pour tout $x in I$ ; $f'(x) = 0 arrow.l.r.double f$ est constante sur $I$.
  - Pour tout $x in I$ ; $f'(x) > 0 arrow.l.r.double f$ est strictement croissante sur $I$.
  - Pour tout $x in I$ ; $f'(x) < 0 arrow.l.r.double f$ est strictement decroissante sur $I$.
]

#v(1em)

// Source: Parascolaire Analyse p.135-136

#definition-block[
  == Extremums

  === Definitions

  Soit $f$ definie sur $D$, $I = ]x_0 - h, x_0 + h[$ avec $I subset D$.

  a) $f$ admet un *minimum relatif* en $x_0$ si et seulement si :

  Pour tout $x in I$ ; $f(x) gt.eq f(x_0)$.

  b) $f$ admet un *minimum absolu* en $x_0$ si et seulement si :

  Pour tout $x in D$ ; $f(x) gt.eq f(x_0)$

  c) $f$ admet un *maximum relatif* en $x_0$ si et seulement si :

  Pour tout $x in I$ ; $f(x) lt.eq f(x_0)$.

  d) $f$ admet un *maximum absolu* en $x_0$ si et seulement si :

  Pour tout $x in D$ ; $f(x) lt.eq f(x_0)$.

  e) $f$ admet un *extremum en $x_0$* si et seulement si $f$ admet un maximum en $x_0$ ou un minimum en $x_0$.
]

#v(1em)

// Source: Parascolaire Analyse p.136

#theorem-block[
  === Extremums et derivation

  *Theoremes :*

  Soit $f$ derivable sur $D$ et $x_0 in D$.

  1) si $f$ admet un extremum en $x_0$ alors $f'(x_0) = 0$.

  2) si $f'$ s'annule en $x_0$ en changeant de signe au voisinage de $x_0$, alors $f$ admet un extremum relatif en $x_0$.
]

#v(1em)

// Source: Parascolaire Analyse p.136

#remarque-block[
  *Reflexes*

  #table(
    columns: (1fr, 1fr),
    align: (center, center),
    stroke: 0.5pt,
    [*Situation*], [*Reflexes*],
    [Derivee avec $sqrt(quad)$ racines], [Attention a l'ensemble de derivabilite],
    [Derivee avec des valeurs absolues], [On se ramene a une fonction definie par intervalles],
    [Determiner un extremum], [On se ramene a un tableau de variation],
  )
]

#pagebreak()

// =============================================
// ENONCES
// =============================================

#align(center)[
  #text(size: 18pt, weight: "bold")[ENONCES]
]

#v(1em)

#underline[*Fonctions derivees*]

// Source: Parascolaire Analyse p.138

=== Exercice 1

1) Montrer que les fonctions suivantes sont derivables sur $RR$ puis trouver leurs fonctions derivees :

$f_1 : x |-> (5x - 2)^4$ ; $f_2 : x |-> -frac(1, 4) x^4 + frac(1, 6) x^3 - 3x + 1$ ; $f_3 : x -> (2x + 4)(x^3 - 2)$

$f_4 : x |-> (1 - x)(3x - 3)(5x + 2)$ ; $f_5 : x |-> (3x + 4)^3 (3 - x)^5$.

=== Exercice 2

Montrer que les fonctions suivantes sont derivables sur leur domaine de definition puis trouver leurs fonctions derivees

$g_1 : x |-> frac(-5, 4x - 1) + frac(5x + 2, 2x + 3)$ ; $g_2 : x |-> (frac(3x + 5, 4x - 3))^2$ ; $g_3 : x -> frac((5x + 4)^2, (1 - x)^3)$

$g_4 : x |-> frac(-4x + 5, (-2x + 3)^2)$ ; $g_5 : x |-> frac(x^2 - x + 3, 3x^2 + x + 1)$ ;

=== Exercice 3

Calculer les derivees des fonctions suivantes

$h_1 : x |-> frac(sqrt(x), 3x - 2)$ pour $x > frac(2, 3)$ ; $h_2 : x |-> frac(3 sqrt(x) - 1, 1 - 2 sqrt(x))$ pour $0 < x < frac(1, 4)$

$h_3 : x |-> frac(1, 2 sqrt(x))$ pour $x in RR_+^*$

$h_4 : x |-> sqrt(3x^2 + 1)$ pour $x in RR$ et $h_5 : x |-> x dot sqrt(2x + 1)$ pour $x > -frac(1, 2)$

=== Exercice 4

Soit la fonction $f$ definie sur $RR$ par $f(x) = -x^2 + 2x - 4$

et $(xi)$ sa courbe representative dans un repere $(O, arrow(i), arrow(j))$.

1) Determiner une equation de la tangente $(T_a)$ a la courbe $(xi)$ au point $A$ d'abscisse $a$.

2) En deduire les coordonnees des deux points $A_1$ et $A_2$ de $(xi)$ ou les tangentes $(T_1)$ et $(T_2)$ passent par l'origine du repere.

Donner les equations de $(T_1)$ et $(T_2)$.

// Source: Parascolaire Analyse p.139

=== Exercice 5

Soit $f : RR -> RR$, $x |-> frac(x^2 - 1, |x + 1| + 1)$

$xi$ designe la courbe de $f$ dans un repere O.N. $(O, arrow(i), arrow(j))$

1) Montrer que $f$ est derivable au point $-1$

2) Montrer que $f$ est derivable sur $RR$ et determiner sa fonction derivee $f'$

3) Determiner le (ou les) points de $xi$ ou la tangente est :
   a) Parallele a la droite $Delta$ d'equation : $2x - 3y + 1 = 0$
   b) Perpendiculaire a la droite $Delta'$ d'equation : $4x - 5y + 1 = 0$.

// Source: Parascolaire Analyse p.139

=== Exercice 6

On considere la fonction $f$ definie par $f(x) = (x - 2)^2 (x + 3)$

Soit $xi_f$ la courbe representative de la fonction $f$ dans un repere orthonorme $(O, arrow(i), arrow(j))$ du plan.

Soit la droite $D$ d'equation $x + y + 3 = 0$

1) La droite $D$ est elle tangente a $xi_f$ ? si oui determiner le point de contact.

2) Existe-t-il des tangentes paralleles a $D$.

3) Determiner les tangentes a $(xi_f)$ issues de $A(2, 0)$.

// Source: Parascolaire Analyse p.139

=== Exercice 7

Soit la fonction $f : x |-> frac(1 - |sqrt(x) - 1|, sqrt(x) + 1)$

1) Donner le domaine de definition $D_f$ de la fonction $f$.

2) Etudier la continuite de $f$ sur $D_f$.

3) Etudier la derivabilite de $f$ en $0$ et en $1$, puis interpreter graphiquement le resultat.

4) a) Determiner $f'$ la fonction derivee de $f$.
   b) Donner une equation cartesienne de la tangente $Delta$ a la courbe representative $C$ de $f$ au point $A$ d'abscisse $4$.

// Source: Parascolaire Analyse p.139

=== Exercice 8

On donne la fonction definie sur $RR backslash {2}$ par :

$g(x) = 1 + frac(1, 2) x + frac(1, 4) x^n + ... + frac(1, 2^n) x^n$ ; $n in NN$

1) Ecrire sous une autre facon $g(x)$, puis calculer $g'(x)$.

2) Deduire la somme suivante $S = sum_(k=1)^(n) frac(k, 2^k)$

// Source: Parascolaire Analyse p.140

=== Exercice 9

On considere la fonction $f$ definie par : $f(x) = frac(x, sqrt(x))$

Soit $(xi)$ la courbe representative de $f$ dans un repere orthonorme $(O, arrow(i), arrow(j))$ du plan.

1) a) Demontrer que $f$ est continue et derivable sur $RR_+^*$.
   b) Quelle est la fonction derivee $f'$ de $f$ ? est-elle continue sur son domaine ?

2) Former l'equation de la tangente a $(xi)$ au point $M_0$ d'abscisse $x_0$.
   b) Former les equations des tangentes a $(xi)$ paralleles a la droite $D : x - 2y = 0$.
   c) Peut-on determiner des points de la courbe $(xi)$ ou la tangente est parallele a une direction donnee de coefficient directeur $m$. Discuter
   d) Est-il possible de mener par le point $A (0, frac(1, 2))$ des tangentes a $(xi)$

3) a) Soit $g$ une fonction derivable sur $RR^*$,
   Demontrer que $lim_(h -> 0) frac(g(x + h) - g(x - h), h) = 2 g'(x)$.
   b) Soit $x in RR_+^*$, en deduire $lim_(h -> 0) frac((x + h) sqrt(x - h) - (x - h) sqrt(x + h), h sqrt(x^2 - h^2))$.

// Source: Parascolaire Analyse p.140

=== Exercice 10

Pour tout reel $x$, on pose : $f(x) = 1 + x + x^2 + ... + x^50 = sum_(k=0)^(50) x^k$

On notera cette expression de $f$ : expression 1.

1) Quelle est la valeur de $f(1)$

2) a) Donner une autre expression de $f(x)$ pour $x eq.not 1$. On notera cette nouvelle expression : expression 2.
   b) En deduire la valeur de la somme : $S_2 = sum_(k=0)^(50) 2^k$

3) a) On note $f'$ la derivee de $f$. Calculer $f'(x)$ a partir de l'expression 1. Quelle est la valeur de $f'(1)$.
   b) Determiner $f'(x)$ a partir de l'expression 2 pour $x eq.not 1$.
   Quelle est la valeur de $S_3 = sum_(k=1)^(50) 2^(k-1)$

// Source: Parascolaire Analyse p.141

=== Exercice 11

Soit la fonction $f_m (x) = frac(x^2 + m(2 + x), 2 - x)$ avec un $m in RR$

et $(C_m)$ sa courbe representative.

1) Determiner, suivant $m$, $lim_(x -> 2) f_m (x)$.

2) Calculer $f'_m (x)$ la fonction derivee de $f_m (x)$ pour tout $x in RR backslash {2}$ ;

3) Soit $x_0 in RR - {2}$ et $M_0$ et $N_0$ les points de $C_m$ d'abscisses respectives $x_0$ et $4 - x_0$. Montrer que les tangentes en $M_0$ et $N_0$ sont paralleles.

4) Determiner $m$ sachant que la tangente a $xi_m$ au point d'abscisse $(-2)$, a pour coefficient directeur le reel $(-frac(1, 2))$.

5) Soit la fonction $g : RR -> RR ; x |-> cases(frac(x^2 + |2 + x|, 2 - x) "si" x lt.eq 0, a x + 1 - frac(x sqrt(x), 1 + x^2) "si" x > 0)$ avec $a in RR$

   a) Etudier suivant $a$, la continuite et la derivabilite en $0$ de $g$
   b) $g$ est-elle derivable en $-2$ ?
   c) Montrer que $g$ est derivable sur chacun des intervalles $]-infinity, -2[$, $]-2, 0[$ et $]0, +infinity[$ et determiner $g'(x)$.

// Source: Parascolaire Analyse p.141-142

=== Exercice 12

Soit la fonction $f$ definie par $f(x) = frac(x^2 + 4x + 3, x - 1)$.

1) a) Montrer que $f$ est derivable sur $RR - {1}$ et calculer $f'(x)$
   b) Ecrire une equation de la tangente $Delta$ a $(xi_f)$ au point d'abscisse $0$.
   c) Preciser les points de $zeta_f$ ou la tangente perpendiculaire a $(Delta)$
   d) Soit le point $A(1, alpha)$; $alpha in RR$. Determiner $alpha$ sachant qu'il n'y a aucune tangente a $(zeta_f)$ passant par $A$.

2) Soit la droite $(D) : y = sqrt(2)(x - 1) + 6$.
   a) Montrer que $(D)$ coupe $(xi_f)$ en deux points distincts $M'$ et $M''$ d'abscisses $x'$ et $x''$, Solutions d'une equation du second degre que l'on precisera (le calcul de $x'$ et $x''$ n'est pas demande).
   b) Verifier que $x' + x'' = 2$. En deduire que les tangentes a $C_f$ en $M'$ et $M''$ sont paralleles.

// Source: Parascolaire Analyse p.142

3) Soit la fonction $h(x) = frac(x^2 + 4|x| + 3, |x| - 1)$.
   a) Preciser $D_h$ et etudier la derivabilite de $h$ en $0$
   b) Montrer que $h$ est derivable sur $RR - {0, -1, 1}$ et preciser la fonction derivee $h'$.
   c) En quels points de $(zeta_h)$ la tangente est parallele a la droite $D_1 : x + y = 0$
   d) Preciser le signe de $h'(x)$ pour tout $x in RR - {0, -1, 1}$.

// Source: Parascolaire Analyse p.142

=== Exercice 13

Soit $f$ la fonction definie sur $RR$ par : $cases(f(x) = x^2 - x + 3 "si" x gt.eq 1, f(x) = frac(2|x| - 5, x - 2) "si" x < 1)$

$zeta$ designe la courbe de $f$ dans un repere orthonorme $(O, arrow(i), arrow(j))$.

1) a) Etudier la continuite et la derivabilite en $1$ et $0$.
   b) En deduire que $zeta$ admet une tangente $Delta$ au point $A$ d'abscisse $1$, donner une equation cartesienne de $Delta$.

2) a) Montrer que $f$ est derivable sur chacun des intervalles $]-infinity, 0[$ ; $]0, 1[$ ; $]1, +infinity[$ et calculer $f'(x)$ sur chaque intervalle.
   b) En deduire que $Delta$ est tangente a $zeta$ en un autre point $B$ qu'on precisera les coordonnees.

3) Soit $M$ un point de $zeta$ d'abscisse $alpha > 1$ et $N$ un point de $zeta$ d'abscisse $frac(1, alpha)$.
   a) Preciser les tangentes respectives $T_alpha$ et $T'_alpha$ a $zeta$ aux points $M$ et $N$
   b) Pour quelles valeurs de $alpha$, $T_alpha$ est parallele a la droite $(O A)$.
   Pour cette valeur de $alpha$ trouver les coordonnees du point $H$ de $T_alpha sect T'_alpha$.

4) Montrer que $f$ est deux fois derivable sur $[0, +infinity[$. Calculer $f''(x)$.

#underline[*Sens de variation - Extrema*]

// Source: Parascolaire Analyse p.142

=== Exercice 14

Soit $f$ la fonction definie par : $f(x) = frac(|x^2 - 2x|, x(x^2 - x - 2))$ si $x eq.not 2$ et $f(2) = frac(1, 3)$

1) Trouver le domaine de definition $D_f$ de la fonction $f$.

2) Etudier la continuite et la derivabilite de $f$ en $2$.

3) Dresser le tableau de variation de $f$.

// Source: Parascolaire Analyse p.143

=== Exercice 15

Soit $f$ une fonction definie et derivable sur $RR$. La courbe representative de $f$ est donnee ci-dessous.

#figure(
  cetz.canvas({
    import cetz.draw: *
    // Axes
    line((-3, 0), (4, 0), mark: (end: ">"), name: "xaxis")
    line((0, -1.5), (0, 2), mark: (end: ">"), name: "yaxis")
    content((4, -0.3), $x$)
    content((0.3, 2), $y$)
    content((-0.3, -0.3), $O$)
    // Graduations
    content((-2, -0.3), $-2$)
    content((-1, -0.3), $-1$)
    content((0.7, -0.3), $frac(1, 2)$)
    // Points remarquables et projections
    content((1, 1.1), $frac(2, 3)$)
    content((0.3, -0.8), $-frac(2, 3)$)
    // Courbe : minimum vers x=-2 a y=-2/3, monte vers x=1/2 a y=2/3, puis redescend
    bezier((-2.5, -0.9), (-2, -0.67), (-2.3, -0.8))
    bezier((-2, -0.67), (-0.5, 0.2), (-1.5, -0.2))
    bezier((-0.5, 0.2), (0.5, 0.67), (0, 0.5))
    bezier((0.5, 0.67), (1, 0.5), (0.7, 0.67))
    bezier((1, 0.5), (3.5, -0.5), (2, 0))
    // Lignes de projection en pointilles
    set-style(stroke: (dash: "dashed", paint: gray))
    line((-2, 0), (-2, -0.67))
    line((-2, -0.67), (0, -0.67))
    line((0.5, 0), (0.5, 0.67))
    line((0.5, 0.67), (0, 0.67))
  }),
)

Repondre par vraie ou faux a chacun des assertions suivantes, en justifiant votre reponse :

a) $f(1) = 0$ #h(2em) b) $f$ admet un extremum en $x = -2$.

c) $f$ est croissante sur $[1, +infinity[$. #h(2em) d) $f$ admet deux extremums

// Source: Parascolaire Analyse p.143

=== Exercice 16

Soit $f$ la fonction definie sur $RR$ par : $f(x) = frac(x^3 + 9x, x^2 + 1)$

1) Determiner qu'il existe un reel $a$ tel que pour tout $x$ reel, $f'(x) = (frac(x^2 - a, x^2 + 1))^2$.

2) a) Determiner une equation de la tangente a la courbe au point d'abscisse $0$.
   b) Soit $g$ la fonction definie sur $RR$ par $g(x) = f(x) - 9x$.
   Verifier que $f'' = g''$.
   c) Calculer $f''(x)$ ; sur $I = [-sqrt(3), sqrt(3)]$, etudier le signe de $f''$, en deduire le sens de variation de $g'$, puis le signe de $g'$.
   En deduire le sens de variation de $g$, puis le signe de $g$.
   Quelle est la position de la courbe par rapport a sa tangente en $0$.

// Source: Parascolaire Analyse p.143

=== Exercice 17

On donne la fonction $f$ definie sur $RR$ par : $f(x) = a x^2 + b x + c$
avec $a in RR^*$ et $(b, c) in RR^2$.

1) Determiner $b$ et $c$ en fonction de $a$ sachant que la courbe representative contient les points $A(1, 0)$ et $B(0, 1)$.

2) Pour les conditions trouvees, calculer les coordonnees de l'extremum de $f$.

3) a) Quel est l'ensemble des points associes a ces extremums ?
   b) Dresser le tableau de variation de la fonction qui forme cet ensemble.

=== Exercice 18

*Vrai - Faux*

Dire si l'affirmation est vraie ou fausse. Justifier votre reponse.

// Source: Parascolaire Analyse p.144

1) Pour $x eq.not 0$, $f(x) = frac(2, x) + x$ alors $f'(1) = -1$.

2) Pour tout $x > 1$, $f(x) = sqrt(4x + 1)$ alors $f'(x) = frac(1, 2 sqrt(4x + 1))$.

3) Pour tout $x > 0$, $f(x) = frac(1, 2 sqrt(x))$ alors $f'(x) = sqrt(x)$.

4) Si $f$ est derivable sur $I$ alors $f$ est croissante ou $f$ est decroissante.

5) Si $f$ est derivable sur un intervalle centre en $x_0$ et $f$ admet un extrema en $x_0$ alors $f'(x_0) = 0$.

6) Si $f$ est une fonction positive sur un intervalle $I$ alors $f$ est croissante sur $I$.

// Source: Parascolaire Analyse p.144

=== Exercice 19

Soit la fonction $f$ definie sur $RR$ par : $f(x) = frac(a x + b, x^2 + x + 3)$.

1) Calculer $f'(x)$.

2) Determiner les reels $a$ et $b$ pour que la fonction $f$ admet un extremum egal a $1$ en $x_0 = 0$.

3) pour $a = 1$ et $b = 3$, etudier les variations de la fonction $f$.

4) Verifier que $f'(-1) = frac(5, 9)$ et construire la tangente a $zeta_f$ au point $A(-1, f(-1))$.

5) Demontrer que pour $a = 1$ et $b in RR$, $f$ admet toujours deux extremums.

// Source: Parascolaire Analyse p.144

=== Exercice 20

1) soit $g$ une fonction definie par $g : RR -> RR$

$x |-> -frac(1, 2) x^2 + 2x sqrt(x) - 2x - 1$.

a) Etudier la derivabilite de $g$ sur son domaine.

b) Dresser le tableau de variation complet de $g$, on precisera ses extremums et leurs natures.

2) Soit la fonction $f$ definie par : $f : RR_+ -> RR$

$x |-> -frac(1, 6) x^3 + frac(4, 5) x^2 sqrt(x) - x^2 - x$

a) Etudier les variations de $f$.

b) $f$ admet-elle des extremums ?

3) Existe-t-il des tangentes a la courbe de $f$ parallele a la droite d'equation : $y = -x + 3$ ?

// Source: Parascolaire Analyse p.144

=== Exercice 21

Soit $(f_m)_(m in RR)$ la famille des fonctions definie par :

$f_m (x) = (2m - 3) x^3 + 3x^2 - 3m x + m$.

1) Pour quelles valeurs de $m$, $f_m (x)$ possede un seul extremum ?

2) Pour quelles valeurs de $m$, $f_m (x)$ est decroissante sur tout son domaine ?

// Source: Parascolaire Analyse p.145

3) a) Etudier les variations de $g(x) = -x^3 + 3|x^2 - x| + 1$
   b) Dresser le tableau de variation complet de $g$.
   c) Preciser les points anguleux de $zeta_g$ et donner les vecteurs directeurs des demi tangentes.

// Source: Parascolaire Analyse p.145

=== Exercice 22

Soit $f$ la fonction definie par $f(x) = a x^2 + b x + c$.

Determiner les reels $a$, $b$ et $c$ sachant que $f$ admet un extremum en $x_0 = frac(1, 2)$ et sa courbe $C$ passe par $A(1, 1)$ et admet en $A$ une tangente parallele a la droite $Delta : x - y + 1 = 0$.

2) soit $g$ la fonction definie par $g(x) = frac(x, x^2 - x + 1)$

a) Etudier les variations de $g$. En deduire que pour $x in RR$, on a : $-frac(1, 3) lt.eq g(x) lt.eq 1$.

b) En remarquant que $frac(n + 1, n) = 1 + frac(1, n)$. Montrer que pour tout $n in NN^*$.

On a : $g(frac(n + 1, n)) < g(frac(n + 2, n + 1))$.

// Source: Parascolaire Analyse p.145

=== Exercice 23

Soit $f_m : RR -> RR$ ; $x |-> frac(x^2 + m x - 3, x - 1)$ ou $m in RR$.

On designe par $C_m$ sa courbe representative dans le repere $(O, arrow(i), arrow(j))$.

1) Determiner $f'_m$.

2) Pour quelle valeur de $m$, $f$ admet-t-elle un extremum en $2$ ?

3) Quel est l'ensemble des valeurs de $m$, pour les quelles $f_m$ n'admet pas d'extremum ?

4) on prend $m = 3$.
   a) Determiner les variations de $f_3$.
   b) Soit $Delta : 3x - 4y + 13 = 0$, determiner les points de $zeta_3$ ou la tangente est parallele a $Delta$ ; en deduire que $Delta$ est tangente a $zeta_3$ en point que l'on precisera.

5) Soit $g : RR -> RR$ ; $x |-> frac(x |x - 3| - 3, x - 1)$
   a) Etudier la derivabilite de $g$ en $(-3)$.
   b) Determiner $g'$ est dresser le tableau de variation de $g$.

// Source: Parascolaire Analyse p.146

=== Exercice 24

1) Soit $f$ la fonction definie sur $RR$ par $f(x) = 4x - x^2$ et soit $zeta$ sa courbe representative dans un repere orthonorme $(O, arrow(i), arrow(j))$.
   a) Dresser le tableau de variation de la fonction $f$ et tracer $zeta$.
   b) Determiner les coordonnees du point $A$ dont l'abscisse est le maximum atteint par $f$.
   c) Soit $I(0, 1)$. Determiner les tangentes $T_1$ et $T_2$ passant par $I$ a $zeta$.

2) Un point $M$ variable sur l'arc d'extremites $O$ et $A$ de la courbe $zeta$ d'abscisse $x$ tel que : $x in ]0, 2[$, $N$ designe le symetrique de $M$ par rapport a $Delta : x = 2$ et $M N N' M'$ le rectangle dont les sommets $M'$ et $N'$ sont situes sur l'axe des abscisses.
   a) Exprimer en fonction de $x$ l'aire $s(x)$ du rectangle $A N N' M'$.
   b) Pour quelle valeur de $x$, $s(x)$ est maximale.

// Source: Parascolaire Analyse p.146

=== Exercice 25

Le plan etant rapporte a un repere orthonorme $(O, arrow(i), arrow(j))$. On considere les points : $A(0, x + 3)$ ; $B(x - 1, 0)$ et $C(-x + 2, 0)$.

1) Determiner l'aire $f(x)$ du triangle $A B C$.

2) Etudier le sens de variation de la fonction $f$.

3) a) Ecrire les equations des tangentes aux points d'abscisse respectives : $-3$ et $frac(3, 2)$.
   b) Interpreter geometriquement les minimums de la fonction $f$.

// Source: Parascolaire Analyse p.146

=== Exercice 26

On considere une famille de carton ayant la forme d'un triangle equilateral de $60$ cm de cote. On decoupe les trois coins de cette famille, comme l'indique la figure ci-contre, et on forme une boite sans couvercle en relevant les rectangles lateraux.

// Figure: Triangle equilateral ABC avec coins decoupes de longueur x

1) Montrer que le volume de la boite est $V(x) = x(30 - x)^2$.

2) Determiner le volume maximal de la boite obtenue.

// Source: Parascolaire Analyse p.146-147

=== Exercice 27

Le est rapporte a un repere orthonorme $(O, arrow(i), arrow(j))$.

On considere le cercle $(Gamma)$ de centre $O$ et de rayon $1$. Soit $A$ le point de coordonnees $(1, 0)$ et $A'(-1, 0)$.

1) Pour tout point $H$ du segment $[A A']$, distinct de $A$ et $A'$, on mene la perpendiculaire a la droite $(A A')$. $(Delta)$ Coupe le cercle $(Gamma)$ en $M$ et $M'$.
   On pose $overline(O H) = x$, calculer, en fonction de $x$, l'aire du triangle $A M M'$.

2) Soit la fonction numerique definie sur $[-1, 1]$ par $f(x) = (1 - x) sqrt(1 - x^2)$.
   a) Etudier sa derivabilite en $-1$ et $1$. En deduire les tangentes aux points d'abscisse $-1$ et $1$.
   b) En utilisant la formule $(sqrt(U(x)))' = frac(U'(x), 2 sqrt(U(x)))$, pour $U(x) in RR_+^*$
   Dresser le tableau de variation de $f$.

3) Montrer que le triangle $A M M'$ d'aire maximale est equilateral.

// Source: Parascolaire Analyse p.147

=== Exercice 28

Soit $zeta = (O M N)$ un cone circonscrit a une sphere ($s$) de rayon $R$ et de centre $Omega$.

Soit $H$ le projete orthogonal de $Omega$ sur $(M N)$, le cercle de base de $(zeta)$ a pour rayon $M H = r$. Soit $V = frac(1, 3) pi r^2 x$ le volume de $zeta$ avec $x$ est sa hauteur.

1) Calculer $r^2$ en fonction de $x$ et de $R$.

2) a) Trouver la valeur minimale de la hauteur $x$ pour que le volume $V$ soit minimum.
   b) Pour cette valeur de $x$, calculer $V$.

// Source: Parascolaire Analyse p.147

=== Exercice 29

Un couloir entree deux batiments a la forme d'un prisme droit dont deux des faces sont deux immenses baies vitrees rectangulaires de $20$ m de long sur $5$ m de large. On section du prisme par un plan perpendiculaire a sa base est triangle isocele $A B C$ tel que $A B = A C = 5$ m, $B C$ represente l'ecartement a la base des deux baies vitrees on notera $x$ sa longueur.

Le but du probleme est determiner $x$ tel que le volume de ce couloir soit le plus grand possible.

1) a) Quelles sont les valeurs possibles de $x$ ?
   b) Calculer le volume $V(x)$ des prismes en fonction de $x$.

2) Soit $f$ la fonction definie sur $[0, 10]$ par $f(x) = x^2(100 - x^2)$.
   a) Etudier les variations de $f$.
   b) Pour quelle valeur de $x$, $f$ admet-elle un maximum ?

3) a) A partir des variations de $f$, determiner les variations de la fonction $V$ sur $[0, 10]$.
   b) En deduire la valeur $x_0$ de $B C$ qui rend maximal le volume de couloir.
   c) Donner l'arrondi au centieme de $x_0$.

// Source: Parascolaire Analyse p.148

=== Exercice 30

On veut faire circuler un fluide avec un frottement minimal dans un canal a section interieure rectangulaire. $A B C D$ represente cette section ; $x$ designe la hauteur en m et $ell$ la largeur en m de la section. L'aire de la section $A B C D$ est $2$ dm$""^2$. (m = metre)

// Figure: Rectangle ABCD avec hauteur x et largeur ell

a) Exprimer $ell$ en fonction de $x$.

b) On note $L(x)$ la longueur du contour interieur c'est-a-dire $A B + B C + C D$.
   Expliquer pourquoi, pour tout $x > 0$, $L(x) = 2x + frac(2, 100 x)$.

c) Etudier les variations de la fonction $L$.

d) Le frottement est minimal lorsque $L(x)$ est minimal.
   Deduire de l'etude precedente les valeurs de $x$ et de $ell$ pour lesquelles le frottement est minimal.

// Source: Parascolaire Analyse p.148

=== Exercice 31

Dans un repere, $P$ est la parabole d'equation : $y = x^2$.

On note $A$ le point de coordonnees $(0 ; 1)$ et $M$ le point de $P$ d'abscisse $x$.

Le but de l'exercice est de trouver les positions eventuelles de $M$ sur $P$ pour lesquelles la distance $A M$ est minimale.

// Figure: Parabole y=x^2 avec point A(0,1) et point M sur la courbe, projection H

1) Demontrer que $A M^2 = x^4 - x^2 + 1$.

2) $f$ est la fonction definie sur $RR$ par $f(x) = x^4 - x^2 + 1$.
   a) Calculer $f'(x)$.
   b) Dresser le tableau de variation de $f$.

3) a) En utilisant le fait que $A M$ est minimale si, et seulement si, $A M^2$ est minimal, determiner les positions de $M$ pour lesquelles $A M^2$ est minimal.
   b) Calculer cette distance minimale.

// Source: Parascolaire Analyse p.148

=== Exercice 32

Une entreprise fabrique des casseroles de contenance $1$ L. Elle cherche a utiliser le moins de metal possible. (On ne tiendra pas compte du manche.)

$x$ designe le rayon de cercle interieur et $h$ la hauteur de la casserole en centimetres.

// Figure: Casserole cylindrique avec rayon x et hauteur h

a) Exprimer $h$ en fonction de $x$.

b) $S(x)$ est l'aire laterale plus l'aire du disque interieur en cm$""^2$.
   Expliquer pourquoi pour tout $x > 0$, $S(x) = pi x^2 + frac(2000, x)$.

c) Etudier les variations de la fonction $S$.

d) En deduire que la quantite de metal utilisee sera minimale lorsque $h^3 = x^3$, c'est-a-dire lorsque $h = x$.

#pagebreak()

// =============================================
// CORRIGES (SOLUTIONS)
// =============================================

#align(center)[
  #text(size: 18pt, weight: "bold")[CORRIGES]
]

#v(1em)

#underline[*Fonctions derivees*]

// Source: Parascolaire Analyse p.149

=== Exercice 1 — Corrige

- $f_1(x) = (5x - 2)^4$ est une fonction polynome donc elle est derivable sur $RR$ et on a :

Pour tout $x in RR$ ; $f'_1(x) = 4 times 5 dot (5x - 2)^3 = 20(5x - 2)^3$.

- $f_2(x) = frac(1, 4) x^4 + frac(1, 6) x^3 - 3x + 1$ est une fonction polynome donc elle est derivable sur $RR$ et on a : Pour tout $x in RR$ ; $f'_2(x) = -x^3 + frac(1, 2) x^2 - 3$.

- $f_3(x) = (2x + 4)(x^3 - 2)$ est une fonction polynome donc elle est derivable $RR$ et on a : pour tout $x in RR$ ; $f'_3(x) = 2(x^3 - 2) + 3x^2(2x + 4) = 2x^3 - 4 + 6x^3 + 12x^2 = 8x^3 + 12x^2 - 4$.

- $f_4(x) = (1 - x)(3x - 3)(5x + 2)$ est une fonction polynome donc elle est derivable sur $RR$ et on a $f_4(x) = -3(1 - x)(1 - x)(5x + 2) = -3(1 - x)^2(5x + 2)$.

$f'_4(x) = -3 times 2 times (-1) dot (1 - x)(5x + 2) - 3 times 5(1 - x)^2 = 6(1 - x)(5x + 2) - 15(1 - x)^2$

$= (1 - x)[6(5x + 2) - 15(1 - x)] = 3(1 - x)(15x - 1)$.

- $f_5(x) = (3x + 4)^3 (3 - x)^5$ est une fonction polynome donc elle est derivable sur $RR$ et on a :

Pour tout $x in RR$ ; $f'_5(x) = 3 times 3(3x + 4)^2(3 - x)^5 + 5 times (-1)(3x + 4)^3(3 - x)^4$

$= (3x + 4)^2(3 - x)^4 [9(3 - x) - 5(3x + 4)] = (3x + 4)^2(3 - x)^4(-24x + 7)$.

// Source: Parascolaire Analyse p.149

=== Exercice 2 — Corrige

$g_1(x) = frac(-5, 4x - 1) + frac(5x + 2, 2x + 3)$ est une fonction rationnelle donc elle est derivable sur son ensemble de definition. Or la fonction $g_1$ est definie sur :

$RR - {frac(-3, 2), frac(1, 4)}$. Donc on a pour tout $x in RR - {frac(-3, 2), frac(1, 4)}$ :

$g'_1(x) = frac(20, (4x - 1)^2) + frac(5(2x + 3) - 2(5x + 2), (2x + 3)^2) = frac(20, (4x - 1)^2) + frac(11, (2x + 3)^2)$.

// Source: Parascolaire Analyse p.150

- $g_2(x) = (frac(3x + 5, 4x - 3))^3$ est une fonction rationnelle donc elle est derivable sur son ensemble de definition or $D g_2 = RR - {frac(3, 4)}$.

Donc pour tout $x in RR - {frac(3, 4)}$ on a :

$g'_2(x) = 3 times frac(3(4x - 3) - 4(3x + 5), (4x - 3)^2) (frac(3x + 5, 4x - 3))^2$

$= frac(-87, (4x - 3)^2) (frac(3x + 5, 4x - 3))^2 = frac(-87(3x + 5)^2, (4x - 3)^4)$.

- $g_3(x) = frac((5x + 4)^2, (1 - x)^3)$ est une fonction rationnelle donc elle est derivable sur son ensemble de definition or $D g_3 = RR - {1}$.

Donc pour tout $x in RR - {1}$ on a :

$g'_3(x) = frac(2 times 5(5x + 4)(1 - x)^3 - (-1) times 3(1 - x)^2(5x + 4)^2, (x - 1)^6)$

$= frac((5x + 4)(1 - x)^2 [10(1 - x) + 3(5x + 4)], (1 - x)^6)$

$= frac((5x + 4)(1 - x)^2(5x + 22), (1 - x)^6) = frac((5x + 4)(5x + 22), (1 - x)^4)$.

- $g_4(x) = frac(-4x + 5, (-2x + 3)^2)$ est une fonction rationnelle donc elle est derivable sur son ensemble de definition or $D g_4 = RR - {frac(3, 2)}$.

Donc pour tout $x in RR - {frac(3, 2)}$ on a :

$g'_4(x) = frac(-4(-2x + 3)^2 - 2 times (-2)(-2x + 3)(-4x + 5), (-2x + 3)^4)$

// Source: Parascolaire Analyse p.151

$= frac((-2x + 3)[-4(-2x + 3) + 4(-4x + 5)], (-2x + 3)^4) = frac(8(-2x + 3)(-x + 1), (-2x + 3)^4) = frac(8 - 8x, (-2x + 3)^3)$.

- $g_5(x) = frac(x^2 - x + 3, 3x^2 + x + 1)$ est une fonction rationnelle donc elle est derivable sur son domaine de definition or $D g_5 = RR$ ;

donc pour tout $x in RR$ ; on a :

$g'_5(x) = frac((2x - 1)(3x^2 + x + 1) - (x^2 - x + 3)(6x + 1), (3x^2 + x + 1)^2) = frac(4x^2 - 16x - 4, (3x^2 + x + 1)^2)$.

// Source: Parascolaire Analyse p.151

=== Exercice 3 — Corrige

Dans tout l'exercice, on admettra que les fonctions sont derivables sur les ensembles qui sont donnes par l'enonce.

- $h_1(x) = frac(sqrt(x), 3x - 2)$ ; on utilise la regle de derivation d'un quotient :

$h'_1(x) = frac(frac(1, 2 sqrt(x))(3x - 2) - 3 sqrt(x), (3x - 2)^2) = frac(3x - 2 - 3 sqrt(x) times 2 sqrt(x), 2 sqrt(x)(3x - 2)^2)$

$= frac(3x - 2 - 6x, 2 sqrt(x)(3x - 2)^2) = frac(-3x - 2, 2 sqrt(x)(3x - 2)^2)$.

- $h'_2(x) = frac(frac(3, 2 sqrt(x))(1 - 2 sqrt(x)) - (3 sqrt(x) - 1)(frac(-2, 2 sqrt(x))), (1 - 2 sqrt(x))^2)$

$= frac(3 - 6 sqrt(x) + 6 sqrt(x) - 2, 2 sqrt(x)(1 - 2 sqrt(x))^2) = frac(1, 2 sqrt(x)(1 - 2 sqrt(x))^2)$.

- $h'_3(x) = frac(1, 2) dot frac(-frac(1, 2 sqrt(x)), x) = -frac(1, 4) dot frac(1, x sqrt(x))$.

- $h_4(x) = sqrt(3x^2 + 1)$ et $h'_4(x) = frac((3x^2 + 1)', 2 sqrt(3x^2 + 1)) = frac(6x, 2 sqrt(3x^2 + 1)) = frac(3x, sqrt(3x^2 + 1))$

// Source: Parascolaire Analyse p.152

- $h_5(x) = x sqrt(2x + 1)$

$h'_5(x) = (x)' dot sqrt(2x + 1) + x(sqrt(2x + 1))' = sqrt(2x + 1) + x dot frac((2x + 1)', 2 sqrt(2x + 1))$

$= sqrt(2x + 1) + x dot frac(2, 2 sqrt(2x + 1)) = sqrt(2x + 1) + frac(x, sqrt(2x + 1))$.

=== Exercice 4 — Corrige

// Source: Parascolaire Analyse p.152

1) La tangente $(T_a)$ a $(xi)$ au point $A$ d'abscisse $a$, a pour equation :

$y = f'(a)(x - a) + f(a)$ ; $f(a) = -a^2 + 2a - 4$.

$f$ est definie sur $RR$ (fonction polynome) et $f'(x) = -2x + 2$

$f'(a) = -2a + 2$.

L'equation de $(T_a)$ est : $y = -a^2 + 2a - 4 + (-2a + 2)(x - a)$

C'est-a-dire $y = (-2a + 2) x + a^2 - 4$.

2) $(T_a)$ passe par l'origine $O$ si et seulement si $a^2 - 4 = 0$ ;

c'est-a-dire $a = 2$ ou $a = -2$.

- Si $a = -2$ est l'abscisse de $A_1$ alors $A_1(-2; -12)$

et $(T_1)$ a pour equation : $y = 6x$.

- Si $a = 2$ est l'abscisse de $A_2$ alors $A_2(2; -4)$

et $(T_2)$ a pour equation : $y = -2x$.

// Source: Parascolaire Analyse p.152

=== Exercice 5 — Corrige

1)

#table(
  columns: (auto, auto, auto, auto),
  align: center,
  stroke: 0.5pt,
  [$x$], [$-infinity$], [$-1$], [$+infinity$],
  [$x + 1$], [$-$], [$0$], [$+$],
  [$|x + 1|$], [$-x - 1$], [$0$], [$x + 1$],
)

Donc $f(x) = cases(frac(1 - x^2, x) "si" x in ]-infinity, -1], frac(x^2 - 1, x + 2) "si" x in [-1, +infinity[)$

// Source: Parascolaire Analyse p.152-153

$* lim_(x -> (-1)^-) frac(f(x) - f(-1), x + 1) = lim_(x -> (-1)^-) frac(frac(1 - x^2, x), x + 1) = lim_(x -> (-1)^-) frac(x^2 - 1, -x(x + 1)) = lim_(x -> (-1)^-) frac(x - 1, -x) = -2 = f'_g(-1)$.

$* lim_(x -> (-1)^+) frac(f(x) - f(-1), x + 1) = lim_(x -> (-1)^+) frac(frac(x^2 - 1, x + 2), x + 1) = lim_(x -> (-1)^+) frac(x^2 - 1, (x + 2)(x + 1)) = lim_(x -> (-1)^+) frac(x - 1, x + 2) = -2 = f'_d(-1)$.

On a : $f'_g(-1) = f'_d(-1) = -2$ donc $f$ est derivable en $-1$.

// Source: Parascolaire Analyse p.153

2) On a : $f(x) = cases(frac(1 - x^2, x) "si" x in ]-infinity, -1], frac(x^2 - 1, x + 2) "si" x in [-1, +infinity[)$

$* x |-> frac(x^2 - 1, x + 2)$ est une fonction rationnelle donc elle est derivable

sur $RR^* - {2}$ en particulier sur $]-1, +infinity[$ donc $f$ est derivable sur $]-1, +infinity[$

$* x |-> frac(1 - x^2, x)$ est une fonction rationnelle donc elle est derivable sur $RR^*$ ;

en particulier sur $]-infinity, -1[$ donc $f$ est derivable sur $]-infinity, -1[$

et $f$ est derivable en $-1$. Donc $f$ est derivable sur $RR$ et on a :

$*$ pour tout $x in [-1, +infinity[$ ; $f'(x) = frac(2x(x + 2) - (x^2 - 1), (x + 2)^2) = frac(x^2 + 4x + 1, (x + 2)^2)$.

$*$ Pour tout $x in ]-infinity, -1]$ ; $f'(x) = frac(-2x dot x - (1 - x^2), x^2) = frac(-(x^2 + 1), x^2)$.

3) Soit $T : y = f'(x_0)(x - x_0) + f(x_0)$ equation de la tangente a $zeta$ en un point $M_0(x_0, y_0)$.

a) $Delta : 2x - 3y + 1 = 0$ ou encore $Delta : y = frac(2, 3) x + frac(1, 3)$.

$T || Delta$ si et seulement si $f'(x_0) = frac(2, 3)$ deux cas sont possibles.

$*$ Si $x_0 in ]-infinity, -1]$ alors on a : $frac(-(x_0^2 + 1), x_0^2) = frac(2, 3)$ equivaut a

$-3(x_0^2 + 1) = 2 x_0^2$ ou encore $x_0^2 = frac(-3, 5)$ impossible,

// Source: Parascolaire Analyse p.154

donc il n'existe pas $x_0 in ]-infinity, -1]$ tel que $f'(x_0) = frac(2, 3)$.

$*$ Si $x_0 in [-1, +infinity[$ alors on a : $frac(x_0^2 + 4x_0 + 1, (x_0 + 2)^2) = frac(2, 3)$ ou encore

$3(x_0^2 + 4x_0 + 1) = 2(x_0 + 2)^2$ equivaut a $x_0^2 + 4x_0 - 5 = 0$

par suite $x_0 = 1$ ou $x_0 = -5$ or $x_0 in [-1, +infinity[$ donc $x_0 = 1$.

Conclusion : la droite $Delta$ est parallele a la tangente $T$ a la courbe $xi$ au point $A$ d'abscisse $1$.

b) $Delta' : 4x - 5y + 1 = 0$ ou encore $Delta' : y = frac(4, 5) x + frac(1, 5)$

$T bot Delta'$ si et seulement si $frac(4, 5) times f'(x_0) = -1$ equivaut a $f'(x_0) = frac(-5, 4)$ ;

deux cas possibles.

$*$ Si $x_0 in ]-infinity, -1]$, alors on a : $frac(-(x_0^2 + 1), x_0^2) = frac(-5, 4)$

equivaut a $4(x_0^2 + 1) = 5 x_0^2$ ou encore $x_0^2 = 4$ equivaut a

$x_0 = 2$ ou $x_0 = -2$ or $x_0 in ]-infinity, -1]$ donc $x_0 = -2$.

$*$ Si $x_0 in ]-1, +infinity]$, alors on a : $frac(x_0^2 + 4x_0 + 1, (x_0 + 2)^2) = frac(-5, 4)$

equivaut a $4(x_0^2 + 4x_0 + 1) = -5(x_0 + 2)^2$

ou encore : $3x_0^2 + 12x_0 + 8 = 0$ comme de discriminant est $12$.

Soit : $x_0 = -6 - 2 sqrt(3) in.not [-1, +infinity[$ ou $x_0 = -6 - 2 sqrt(3) in.not [-1, +infinity[$.

Donc il n'existe pas $x_0 in [-1, +infinity[$ tel que $f'(x_0) = frac(-5, 4)$.

Conclusion : La droite $Delta'$ est perpendiculaire a la tangente $T$ a la courbe $zeta$ au point $B$ d'abscisse $-2$.

// Source: Parascolaire Analyse p.154-155

=== Exercice 6 — Corrige

$f(x) = (x - 2)^2(x + 3)$ est une fonction polynome donc elle est derivable sur $RR$ et on a : pour tout $x in RR$ :

$f'(x) = 2(x - 2)(x + 3) + (x - 2)^2 = (x - 2)(2x + 6 + x - 2) = (x - 2)(3x + 4)$.

1) Soit la droite $D$ d'equation $y = -x - 3$.

La droite $D$ est tangente a $xi_f$ en un point $I$. Si on a : $xi_f sect D = {I}$.

Etudions donc $xi_f sect D$

Soit $M(x, y) in xi_f sect D$ equivaut $cases(y = f(x), y = -x - 3)$ equivaut a $f(x) = -x - 3$

Ou encore $(x - 2)^2(x + 3) = -x - 3$ equivaut a $(x + 3)[(x - 2)^2 + 1] = 0$

equivaut a $x + 3 = 0$ ou $(x - 2)^2 + 1 = 0$.

$* x + 3 = 0 arrow.l.r.double x = -3$.

$* (x - 2)^2 + 1 = 0 arrow.l.r.double (x - 2)^2 = -1$ impossible.

Donc $zeta_f sect D = {I(-3, 0)}$.

D'ou la droite $D$ est tangente a la droite $zeta_f$ au point $I(-3, 0)$.

2) Soit $T : y = f'(x_0)(x - x_0) + f(x_0)$ est une equation de la tangente $M_0$ d'abscisse $x_0$.

$T || D$ si et seulement si $f'(x_0) = -1 arrow.l.r.double (x_0 - 2)(3x_0 + 4) = -1$

ou encore $3 x_0^2 - 2 x_0 - 7 = 0$ et le discriminant reduit ; $Delta' = 22 > 0$

donc l'equation admet deux solutions distinctes $x'_0$ et $x''_0$ ; par suite, il existe deux tangentes paralleles a $D$ aux points $M'_0$ et $M''_0$ d'abscisses respectifs $x'_0$ et $x''_0$.

3) Une tangente est issue d'un point, cela signifie que les coordonnees de ce point verifient l'equation de la tangente ; donc $T$ est issue de $A$ signifie que :

$A in T$ ou encore $0 = f'(x_0)(2 - x_0) + f(x_0)$ ;

equivaut a $-(x_0 - 2)^2(3x_0 + 4) + (x_0 - 2)^2(x_0 + 3) = 0$

ou encore $(x_0 - 2)^2[-(3x_0 + 4) + (x_0 + 3)] = 0$

$arrow.l.r.double (x_0 - 2)^2(-2x_0 - 1) = 0 arrow.l.r.double x_0 = 2$ ou $x_0 = -frac(1, 2)$.

Donc il existe deux tangentes a $xi_f$ issues de $A$ aux points $M_1$ et $M_2$ d'abscisses respectifs $x_0 = 2$ et $x_0 = -frac(1, 2)$.

// Source: Parascolaire Analyse p.155-157

=== Exercice 7 — Corrige

1) $D_f = {x in RR "tel que" x gt.eq 0 "et" sqrt(x) + 1 eq.not 0} = RR_+$

2) $x |-> sqrt(x)$ est continue sur $RR_+$

par suite $x |-> |sqrt(x) - 1|$ est continue sur $RR_+$

on a : $x |-> 1 - |sqrt(x) - 1|$ est continue sur $RR_+$

$x |-> sqrt(x) + 1$ est continue sur $RR_+$

donc $x |-> f(x)$ est continue sur $RR_+$.

// Source: Parascolaire Analyse p.156

3) $lim_(x -> 0^+) frac(f(x) - f(0), x - 0) = lim_(x -> 0^+) frac(frac(1 - |sqrt(x) - 1|, sqrt(x) + 1), x)$ ; $x$ en $0^+$ alors $0 < x < 1$ ; $sqrt(x) - 1 < 0$

donc $|sqrt(x) - 1| = 1 - sqrt(x)$ ; par suite $lim_(x -> 0^+) frac(f(x) - f(0), x - 0) = lim_(x -> 0^+) frac(frac(1 + sqrt(x) - 1, sqrt(x) + 1), x)$

$= lim_(x -> 0^+) frac(1, sqrt(x)(sqrt(x) + 1)) = +infinity$ car $lim_(x -> 0^+) sqrt(x)(sqrt(x) + 1) = 0^+$ donc $f$ n'est pas

derivable a droite en $0$. donc $zeta_f$ admet une demi-tangente verticale dirigee vers haut.

- Pour etudier la derivabilite de $f$ en $1$, il est necessaire de l'etudier a droite et a gauche en $1$.

Or lorsque $x |-> 1^-$ ; $sqrt(x) - 1 < 0$ donc $|sqrt(x) - 1| = 1 - sqrt(x)$

et lorsque $x |-> 1^+$ ; $sqrt(x) - 1 > 0$ donc $|sqrt(x) - 1| = sqrt(x) - 1$. Par suite $f(x) = cases(frac(sqrt(x), sqrt(x) + 1) "si" 0 lt.eq x lt.eq 1, frac(2 - sqrt(x), sqrt(x) + 1) "si" x gt.eq 1)$

// Source: Parascolaire Analyse p.156-157

$lim_(x -> 1^-) frac(f(x) - f(1), x - 1) = lim_(x -> 1^-) frac(frac(sqrt(x), sqrt(x) + 1) - frac(1, 2), x - 1) = lim_(x -> 1^-) frac(sqrt(x) - 1, 2(x - 1)(sqrt(x) + 1))$

$= lim_(x -> 1^-) frac((sqrt(x) - 1)(sqrt(x) + 1), 2(x - 1)(sqrt(x) + 1)^2) = lim_(x -> 1^-) frac(x - 1, 2(x - 1)(sqrt(x) + 1)^2) = lim_(x -> 1^-) frac(1, 2(sqrt(x) + 1)^2) = frac(1, 8) = f'_g(1)$.

$lim_(x -> 1^+) frac(f(x) - f(1), x - 1) = lim_(x -> 1^+) frac(frac(2 - sqrt(x), sqrt(x) + 1) - frac(1, 2), x - 1) = lim_(x -> 1^+) frac(-2 sqrt(x) + 4 - sqrt(x) - 1, 2(sqrt(x) + 1)(x - 1))$

$= lim_(x -> 1^+) frac(3(1 - sqrt(x)), 2(1 + sqrt(x))^2 (x - 1)) = lim_(x -> 1^+) frac(-3, 2(sqrt(x) + 1)^2) = frac(-3, 8) = f'_d(1)$.

$f'_d(1) eq.not f'_g(1)$ donc $f$ n'est pas derivable en $1$, ainsi $zeta_f$ admet $2$ demi-tangentes.

Donc le point d'abscisse $1$ est un point anguleux pour la courbe $zeta_f$.

// Source: Parascolaire Analyse p.157

4) a) $*$ Si $x in [0, 1]$ ; $f(x) = frac(sqrt(x), sqrt(x) + 1)$ est derivable sur $RR_+$ en particulier sur $[0, 1]$

et on a : pour tout $x in [0, 1]$, $f'(x) = frac(frac(1, 2 sqrt(x))(sqrt(x) + 1) - frac(1, 2 sqrt(x)) dot sqrt(x), (sqrt(x) + 1)^2)$

ou encore $f'(x) = frac(1, 2 sqrt(x)(sqrt(x) + 1)^2)$.

$*$ Si $x in [1, +infinity[$ ; $f(x) = frac(2 - sqrt(x), sqrt(x) + 1)$ est derivable sur $RR_+$ en particulier

sur $[1, +infinity[$ et on a pour tout $x in RR_+$ :

$f'(x) = frac(frac(-1, 2 sqrt(x))(sqrt(x) + 1) - frac(1, 2 sqrt(x))(2 - sqrt(x)), (sqrt(x) + 1)^2) = frac(-3, 2 sqrt(x)(sqrt(x) + 1)^2)$.

b) Une equation de la tangente a la courbe $xi_f$ au point d'abscisse $x_0$ est : $y = f'(x_0)(x - x_0) + f(x_0)$. dans notre cas $x_0 = 4 > 1$

Donc $f'(4) = frac(-3, 2 sqrt(4)(sqrt(4) + 1)^2) = frac(-1, 12)$.

Donc $Delta : y = f'(4)(x - 4) + f(4) = -frac(1, 12)(x - 4) + 0$ d'ou $Delta : y = -frac(1, 12) x + frac(1, 3)$.

// Source: Parascolaire Analyse p.157-158

=== Exercice 8 — Corrige

$g(x) = 1 + frac(1, 2) x + frac(1, 4) x^2 + ... + frac(1, 2^n) x^n$ ; $n in NN$.

1) $g(x)$ est la somme de $(n + 1)$ premier terme d'une suite geometrique de raison $frac(1, 2) x eq.not 1$. (car $x eq.not 2$) et de premier terme $1$.

Donc $g(x) = frac(1 - (frac(1, 2) x)^(n+1), 1 - frac(1, 2) x)$ pour tout $x in RR - {2}$. or $x |-> frac(1 - (frac(1, 2) x)^(n+1), 1 - frac(1, 2) x)$ est une

// Source: Parascolaire Analyse p.158

fonction rationnelle donc elle est derivable sur son domaine de definition qui est egal a $RR - {2}$ ; et par suite pour tout $x in RR - {2}$

$g'(x) = frac((-frac(1, 2)) times (n + 1)(frac(1, 2) x)^n (1 - frac(1, 2) x) + (frac(1, 2))(1 - (frac(1, 2) x)^(n+1)), (1 - frac(1, 2) x)^2)$

$= frac((frac(1, 2) x)^n (-frac(n, 2) - frac(1, 2) + frac(n, 2) times frac(1, 2) x) + frac(1, 2) - frac(1, 2)(frac(1, 2) x)^(n+1), (1 - frac(1, 2) x)^2)$

$= frac(frac(n, 2)(frac(1, 2) x)^(n+1) - frac(n + 1, 2)(frac(1, 2))^n + frac(1, 2), (1 - frac(1, 2) x)^2)$.

2) $S = sum_(k=1)^(n) frac(k, 2^k) = frac(1, 2) + frac(2, 2^2) + frac(3, 2^3) + frac(4, 2^4) + ... + frac(n, 2^n)$ ;

$g(x) = 1 + frac(1, 2) x + frac(1, 2^2) x^2 + ... + frac(1, 2^n) x^n$ est une fonction polynome donc elle est derivable sur $RR$ et on a :

pour tout $x in RR$ ; $g'(x) = frac(1, 2) + frac(2, 2^2) x + frac(3, 2^3) x^2 + ... + frac(n, 2^n) x^(n-1)$.

Donc on remarque que $S = g'(1)$. Or $g'(1) = frac(frac(n, 2)(frac(1, 2))^(n+1) - frac(n + 1, 2)(frac(1, 2))^n + frac(1, 2), frac(1, 4))$

$g'(1) = 4(frac(n, 2)(frac(1, 2))^(n+1) - frac(n, 2)(frac(1, 2))^n - frac(1, 2)(frac(1, 2))^n + frac(1, 2)) = 2(frac(1, 2))^n (frac(n, 2) - n - 1) + 2$.

$g'(1) = 2(frac(1, 2))^n (-frac(n, 2) - 1) + 2$ d'ou $S = 2[1 - (frac(1, 2))^n (frac(n, 2) + 1)]$

// Source: Parascolaire Analyse p.159

=== Exercice 9 — Corrige

1) a) $x |-> sqrt(x) eq.not 0$ est continue et derivable sur $RR_+^*$ donc $x |-> frac(1, sqrt(x))$

est continue et derivable sur $RR_+^*$ par suite $x |-> frac(x, sqrt(x))$ est continue et derivable sur $RR_+^*$.

b) Pour tout $x in RR_+^*$ ; $f'(x) = frac(sqrt(x) - frac(x, 2 sqrt(x)), x) = frac(x, 2x sqrt(x)) = frac(1, 2 sqrt(x))$.

$x |-> 2 sqrt(x)$ est differente de $0$ et continue sur $RR_+^*$ donc $x |-> frac(1, 2 sqrt(x))$ est continue sur $RR_+^*$ donc la fonction $f'$ est continue sur son domaine.

2) a) $T : y = f'(x_0)(x - x_0) + f(x_0) = frac(1, 2 sqrt(x_0))(x - x_0) + frac(x_0, sqrt(x_0))$ :

est l'equation de la tangente a $xi_f$ au point $M_0$ d'abscisse $x_0$.

d'ou $T : y = frac(1, 2 sqrt(x_0)) x + frac(1, 2 sqrt(x_0))$ ou encore : $y = frac(1, 2 sqrt(x_0)) x + frac(1, 2) sqrt(x_0)$.

b) $D : y = frac(1, 2) x$.

La tangente a $(zeta)$ au point $M_0$ d'abscisse $x_0$ est parallele a $D$ si et

seulement si $f'(x_0) = frac(1, 2) arrow.l.r.double frac(1, 2 sqrt(x_0)) = frac(1, 2) arrow.l.r.double sqrt(x_0) = 1$ d'ou $x_0 = 1$ ;

Donc il existe une tangente $T_1$ a $(zeta)$ parallele a $D$ d'equation : $T_1 : y = frac(1, 2) x + frac(1, 2)$.

// Source: Parascolaire Analyse p.159-160

c) La tangente a $(zeta)$ au point $M_0$ d'abscisse $x_0$ est parallele a une direction donnee de coefficient directeur $m$ si et seulement si $f'(x_0) = m$

equivaut a $frac(1, 2 sqrt(x_0)) = m$.

$*$ Si $m lt.eq 0$ alors il n'existe pas de tangente a $(zeta)$ parallele a une droite de coefficient directeur $m$.

Donc on peut determiner des points $M_0$ d'abscisse $x_0 = frac(1, 4 m^2)$.

avec $m > 0$, de la courbe $(zeta)$ ou la tangente est parallele a une direction donnee de coefficient directeur $m$.

d) La tangente $T$ en $M_0$ d'abscisse $x_0$ a $(xi)$ passe par $A(0, frac(1, 2))$ ; cela

signifie que $frac(1, 2) = frac(1, 2 sqrt(x_0)) times 0 + frac(1, 2) sqrt(x_0) arrow.l.r.double sqrt(x_0) = 1 arrow.l.r.double x_0 = 1$.

Donc il existe une seule tangente passant par $A(0, frac(1, 2))$ d'equation :

$y = frac(1, 2) x + frac(1, 2)$.

// Source: Parascolaire Analyse p.160

3) a) $lim_(h -> 0) frac(g(x + h) - g(x - h), h) = lim_(h -> 0) frac(g(x + h) - g(x) + g(x) - g(x - h), h)$

$= lim_(h -> 0) frac(g(x + h) - g(x), h) + lim_(h -> 0) frac(g(x - h) - g(x), -h)$.

En posant $t = -h$ ; $lim_(h -> 0) frac(g(x - h) - g(x), -h) = lim_(h -> 0) frac(g(x + t) - g(x), t) = g'(x)$.

Or $g$ est derivable en tout point de $RR^*$ donc $lim_(h -> 0) frac(g(x + h) - g(x), h) = g'(x)$

Donc $lim_(h -> 0) frac(g(x + h) - g(x - h), h) = 2 g'(x)$.

b) On a $f(x) = frac(x, sqrt(x))$ est derivable sur $RR_+^* subset RR^*$ donc d'apres 3) a) on a :

$lim_(h -> 0) frac(f(x + h) - f(x - h), h) = 2 f'(x)$.

$lim_(h -> 0) frac(f(x + h) - f(x - h), h) = lim_(h -> 0) frac(frac(x + h, sqrt(x + h)) - frac(x - h, sqrt(x - h)), h)$

$= lim_(h -> 0) frac((x + h) sqrt(x - h) - (x - h) sqrt(x + h), h sqrt(x + h) dot sqrt(x - h))$

$= lim_(h -> 0) frac((x + h) sqrt(x - h) - (x - h) sqrt(x + h), h sqrt(x^2 - h^2))$

$= 2 f'(x) = frac(1, sqrt(x))$. Donc $lim_(h -> 0) frac((x + h) sqrt(x - h) - (x - h) sqrt(x + h), h sqrt(x^2 - h^2)) = frac(1, sqrt(x))$.

// Source: Parascolaire Analyse p.161

=== Exercice 10 — Corrige

1) $f(1) = 1 + 1 + 1^2 + ... + 1^50 = sum_(k=0)^(50) 1^k = sum_(k=0)^(50) 1 = 51$.

2) a) Pour donner une autre expression de $f$, il suffit de voir $f$ comme la somme de $51$ premiers termes d'une suite geometrique de premier terme de raison $x$ ; soit $f(x) = sum_(k=0)^(50) x^k = frac(1 - x^51, 1 - x) dot (x eq.not 1)$

b) Pour $x = 2$ on a : $f(2) = frac(1 - 2^51, 1 - 2)$. Soit $S_2 = sum_(k=0)^(50) 2^k = 2^51 - 1$.

3) a) La derivee d'une somme est egale a la somme des derivees, soit pour $f$ :

$f'(x) = 0 + 1 + 2x + 3x^2 + ... + 50 x^49$. On a donc $f'(1) = 1 + 2 + 3 + ... + 50$.

Ce qui correspond a la somme des $50$ premiers entiers, soit de $50$ premiers termes de la suite arithmetique de raison $1$ et de premier terme $1$ : $f'(1) = frac(n(n + 1), 2)$ ; $n = 50$ d'ou $f'(1) = 1275$.

b) Pour determiner $f'(x)$ a partir de l'expression 2, il suffit d'ecrire :

$f(x) = frac(1 - x^51, 1 - x)$ pour $x eq.not 1$ ; d'ou $f'(x) = frac(-51 x^50(1 - x) - (1 - x^51)(-1), (1 - x)^2)$

$= frac(-51 x^50(1 - x) + (1 - x^51), (1 - x)^2) = frac(50 x^51 - 51 x^50 + 1, (1 - x)^2)$.

En particulier pour la somme $S_3 = sum_(k=1)^(50) 2^(k-1)$

D'autre part, on a : $f'(2) = frac(50 times 2^51 - 51 times 2^50 + 1, (1 - 2)^2) = 50 times 2^51 - 51 times 2^50 + 1$

Et finalement : $1 + 2 dot 2 + 3 dot 2^2 + 4 dot 2^3 + ... + 50 dot 2^49 = f'(2) = 2^50 dot 49 + 1$.

// Source: Parascolaire Analyse p.161-162

=== Exercice 11 — Corrige

1) $D f_m(x) = RR - {2}$.

$lim_(x -> 2^+) (x^2 + m(2 + x)) = 4 + 4m$ et $lim_(x -> 2^+) 2 - x = 0^-$ ; trois cas sont possibles :

$1^"er"$ cas : $4 + 4m > 0 arrow.l.r.double m > -1$ donc $lim_(x -> 2^+) f_m(x) = -infinity$.

$2^"eme"$ cas : $4 + 4m < 0 arrow.l.r.double m < -1$ donc $lim_(x -> 2^+) f_m(x) = +infinity$.

$3^"eme"$ cas : $4 + 4m = 0 arrow.l.r.double m = -1$ donc $lim_(x -> 2^+) f_(- 1)(x) = lim_(x -> 2^+) frac(x^2 - x - 2, 2 - x)$

$lim_(x -> 2^+) frac((x - 2)(x + 1), 2 - x) = lim_(x -> 2^+) -x - 1 = -3$.

2) $f_m(x)$ est une fonction rationnelle donc elle est derivable sur son domaine, donc pour tout $x in RR - {2}$, on a :

$f'_m(x) = frac((2x + m)(2 - x) + x^2 + m(2 + x), (2 - x)^2) = frac(-x^2 + 4x + 4m, (2 - x)^2)$.

3) $f'_m(x_0) = frac(-x_0^2 + 4x_0 + 4m, (2 - x_0)^2)$.

$f'_m(4 - x_0) = frac(-(4 - x_0)^2 + 4(4 - x_0) + 4m, [2 - (4 - x_0)]^2) = frac(-x_0^2 + 8x_0 - 16 + 16 - 4x_0 + 4m, (-2 + x_0)^2)$

$= frac(-x_0^2 + 4x_0 + 4m, (2 - x_0)^2) = f'_m(x_0)$. donc les tangentes a $xi_m$ en $M_0$ et en $N_0$

D'abscisses respectifs $x_0$ et $4 - x_0$ sont paralleles.

4) La tangente a $zeta_m$ au point d'abscisse $(-2)$, a pour coefficient directeur le reel $-frac(1, 2)$ signifie que ; $f'(-2) = -frac(1, 2)$ equivaut a $frac(-4 - 8 + 4m, (2 + 2)^2) = -frac(1, 2)$

ou encore $4m - 12 = -8$ soit $m = 1$.

// Source: Parascolaire Analyse p.162

5)

#table(
  columns: (auto, auto, auto, auto),
  align: center,
  stroke: 0.5pt,
  [$x$], [$-infinity$], [$-2$], [$+infinity$],
  [$2 + x$], [$-$], [$0$], [$+$],
)

Donc $g(x) = cases(frac(x^2 - x - 2, 2 - x) "si" x lt.eq -2, frac(x^2 + x + 2, 2 - x) "si" -2 lt.eq x lt.eq 0, a x + 1 - frac(x sqrt(x), 1 + x^2) "si" x > 0)$

a) *Continuite de g en 0 :*

$lim_(x -> 0^+) g(x) = lim_(x -> 0^+) [a x + 1 - frac(x sqrt(x), 1 + x^2)] = 1$.

// Source: Parascolaire Analyse p.163

$lim_(x -> 0^-) g(x) = lim_(x -> 0^-) (frac(x^2 + x + 2, 2 - x)) = 1 = g(0) = lim_(x -> 0^+) g(x)$

Donc $g$ est continue en $0$ pour tout $a in RR$.

*Derivabilite de g en 0 :*

$lim_(x -> 0^+) frac(g(x) - g(0), x - 0) = lim_(x -> 0^+) frac(g(x) - 1, x) = lim_(x -> 0^+) frac(a x + 1 - frac(x sqrt(x), 1 + x^2) - 1, x)$

$= lim_(x -> 0^+) a - frac(sqrt(x), 1 + x^2) = a = g'_d(0)$.

$lim_(x -> 0^-) frac(g(x) - g(0), x - 0) = lim_(x -> 0^-) frac(g(x) - 1, x) = lim_(x -> 0^-) frac(frac(x^2 + x + 2, 2 - x) - 1, x)$

$lim_(x -> 0^-) frac(x + 2, 2 - x) = 1 = g'_g(0)$.

Donc $g$ est derivable en $0$ si et seulement si $g'_d(0) = g'_g(0)$ equivaut a $a = 1$.

$*$ Derivabilite de g en $-2$ :

$lim_(x -> (-2)^-) frac(g(x) - g(-2), x + 2) = lim_(x -> (-2)^-) frac(frac(x^2 - x - 2, 2 - x) - 1, x + 2) =$

$lim_(x -> (-2)^-) frac(x^2 - x - 2 - 2 + x, (x + 2)(2 - x)) = lim_(x -> (-2)^-) frac((x - 2)(x + 2), (x + 2)(2 - x)) = -1 = g'_g(-2)$.

$lim_(x -> (-2)^+) frac(g(x) - g(-2), x + 2) = lim_(x -> (-2)^+) frac(x^2 + x + 2 - 2 + x, (x + 2)(2 - x))$

$= lim_(x -> (-2)^+) frac(x(x + 2), (x + 2)(2 - x)) = -frac(1, 2) = g'_d(-2)$.

$g'_g(-2) eq.not g'_d(-2)$ donc $g$ n'est pas derivable en $-2$.

c) $*$ Si $x in ]-infinity, -2[$ ; $g(x) = frac(x^2 - x - 2, 2 - x)$ est la restriction d'une fonction rationnelle

donc elle est derivable sur $RR - {2}$ donc $g$ l'est sur $]-infinity, -2[$ ; et on a

$g'(x) = f'_(-1)(x) = frac(-x^2 + 4x - 4, (2 - x)^2)$.

// Source: Parascolaire Analyse p.164

$*$ Si $x in ]-2, 0[$ ; $g(x) = frac(x^2 + x + 2, 2 - x)$ est une fonction rationnelle qui est derivable sur $RR - {2}$ en particulier sur $]-2, 0[$ ; et on a :

$g'(x) = f'_(-1)(x) = frac(-x^2 + 4x + 4, (2 - x)^2)$.

$*$ Si $x in ]0, +infinity[$ ; $g(x) = a x + 1 - frac(x sqrt(x), 1 + x^2)$.

$x |-> a x + 1$ est derivable sur $RR$ en particulier sur $]0, +infinity[$.

$x |-> x sqrt(x)$ est derivable sur $RR_+$ en particulier sur $]0, +infinity[$.

$x |-> frac(1, 1 + x^2)$ est derivable sur $RR$ en particulier sur $RR_+^*$ ;

Donc $x |-> a x + 1 - frac(x sqrt(x), 1 + x^2)$ est derivable sur $RR_+^*$ ;

et on a : $g'(x) = a - frac((x sqrt(x))'(1 + x^2) - 2x(x sqrt(x)), (1 + x^2)^2)$

$= a - frac((sqrt(x) + frac(x, 2 sqrt(x)))(1 + x^2) - 2x^2 sqrt(x), (1 + x^2)^2) = a - frac(frac(3x, 2 sqrt(x))(1 + x^2) - 2x^2 sqrt(x), (1 + x^2)^2)$

$= a - frac(sqrt(x)(3 - x^2), 2(1 + x^2)^2)$.

// Source: Parascolaire Analyse p.164

=== Exercice 12 — Corrige

a) $f$ est une fonction rationnelle donc elle est derivable sur son domaine de definition, par suite elle est derivable sur $RR - {1}$ ; et on a pour tout $x in RR - {1}$ ;

$f'(x) = frac((2x + 4)(x - 1) - (x^2 + 4x + 3), (x - 1)^2) = frac(x^2 - 2x - 7, (x - 1)^2)$.

b) $Delta : y = f'(0)(x - 0) + f(0)$ or $f'(0) = -7$ et $f(0) = -3$ d'ou $Delta : y = -7x - 3$

est l'equation de la tangente a $zeta_f$ au point d'abscisse $0$.

// Source: Parascolaire Analyse p.165

c) Soit $T : y = f'(x_0)(x - x_0) + f(x_0)$ equation de la tangente a $zeta_f$ au point $M_0$ d'abscisse $x_0$.

La droite $(T)$ est perpendiculaire a $(Delta)$ si et seulement si :

$-7 times f'(x_0) + 1 = 0$ equivaut a $f'(x_0) = frac(1, 7)$ ou encore $frac(x_0^2 - 2x_0 - 7, (x_0 - 1)^2) = frac(1, 7)$

soit $7x_0^2 - 14x_0 - 49 = (x_0 - 1)^2$ equivaut a $3x_0^2 - 6x_0 - 25 = 0$ ;

or le determinant reduit est $84 > 0$

Donc les points de $zeta_f$ ou la tangente est perpendiculaire a $(Delta)$ sont les points $M'_0$ et $M''_0$ d'abscisse respectifs :

$x'_0 = frac(3 - 2 sqrt(21), 3)$ et $x''_0 = frac(3 + 2 sqrt(21), 3)$.

d) Soit l'equation $(T)$, l'equation de la tangente a $zeta_f$ en un point $M_0$ quelconque d'abscisse $x_0$.

$A(1, alpha) in (T)$ signifie $alpha = f'(x_0)(1 - x_0) + f(x_0)$ equivaut a

$alpha = frac(x_0^2 - 2x_0 - 7, (x_0 - 1)^2)(1 - x_0) + frac(x_0^2 + 4x_0 + 3, x_0 - 1)$ pour tout $x in RR - {1}$

$alpha = frac(-x_0^2 + 2x_0 + 7 + x_0^2 + 4x_0 + 3, x_0 - 1) = frac(6x_0 + 10, x_0 - 1)$.

Donc $A(1, alpha)$ n'appartient a aucune tangente a $zeta_f$ ;

si $alpha eq.not frac(6x_0 + 10, x_0 - 1)$ avec $x_0 eq.not 1$.

2) $(D) : y = sqrt(2)(x - 1) + 6$.

a) Soit $M(x, y) in D sect zeta_f$ signifie que $cases(y = sqrt(2)(x - 1) + 6, y = f(x))$

equivaut a $sqrt(2)(x - 1) + 6 = frac(x^2 + 4x + 3, x - 1)$ ; ou encore $sqrt(2)(x - 1)^2 + 6(x - 1) = x^2 + 4x + 3$

soit $(sqrt(2) - 1) x^2 + 2(1 - sqrt(2)) x + sqrt(2) - 9 = 0$.

$Delta' = (1 - sqrt(2))^2 - (sqrt(2) - 1)(sqrt(2) - 9) = 8 sqrt(2) - 8 > 0$.

// Source: Parascolaire Analyse p.166

Donc l'equation admet deux racines distinctes $x'$ et $x''$ et par suite la droite $(D)$ coupe $(zeta_f)$ en $2$ points distincts $M'$ et $M''$ d'abscisses respectifs $x'$ et $x''$.

b) $x'$ et $x''$ sont les solutions de l'equation

$(sqrt(2) - 1) x^2 + 2(1 - sqrt(2)) x + sqrt(2) - 9 = 0$

donc $S = x' + x'' = -frac(b, a) = frac(2(sqrt(2) - 1), sqrt(2) - 1) = 2$.

- Les tangentes a $xi_f$ en $M'$ et $M''$ sont paralleles si et seulement si :

$f'(x') = f'(x'')$

On a : $f'(x') = frac(x'^2 - 2x' - 7, (x' - 1)^2)$.

$f'(x'') = f'(2 - x') = frac((2 - x')^2 - 2(2 - x') - 7, (2 - x' - 1)^2)$ car $x' + x'' = 2$

$= frac(x'^2 - 4x' + 4 - 4 + 2x' - 7, (1 - x')^2) = frac(x'^2 - 2x' - 7, (x' - 1)^2) = f'(x')$.

Donc les tangentes a $zeta_f$ en $M'$ et $M''$ sont paralleles.

// Source: Parascolaire Analyse p.166-167

3) $h(x) = frac(x^2 + 4|x| + 3, |x| - 1)$.

a) $D_h = {x in RR "tel que" |x| - 1 eq.not 0}$ ;

$|x| - 1 = 0 arrow.l.r.double |x| = 1 arrow.l.r.double x = 1$ ou $x = -1$ donc $D_h = RR - {-1, 1}$.

- Derivabilite de $h$ en $0$.

Il est necessaire d'etudier la derivabilite de $h$ a droite et a gauche en $0$.

- Si $x |-> 0^+$ ; alors $|x| = x$ et par suite $h(x) = f(x)$ or d'apres 1) a) ;

$f$ est derivable sur $RR - {1}$, en particulier en $0$ donc $h'_d(0) = f'(0) = -7$.

- Si $x |-> 0^-$ alors $|x| = -x$ et par suite $lim_(x -> 0^-) frac(h(x) - h(0), x - 0) = lim_(x -> 0^-) frac(frac(x^2 - 4x + 3, -x - 1) + 3, x)$

$= lim_(x -> 0^-) frac(x^2 - 4x + 3 - 3x - 3, -x(x + 1)) = lim_(x -> 0^-) frac(x^2 - 7x, -x(x + 1)) = lim_(x -> 0^-) frac(x - 7, -(x + 1)) = 7 = h'_g(0)$

$h'_d(0) eq.not h'_g(0)$ donc $h$ n'est pas derivable en $0$.

b) $h(x) = cases(f(x) "si" x gt.eq 0, frac(x^2 - 4x + 3, -x - 1) "si" x lt.eq 0)$

$*$ Si $x > 0$, $h(x) = f(x)$ est derivable sur $RR - {1}$, en particulier sur : $]0, +infinity[ - {1}$.

$*$ Si $x < 0$, $x |-> frac(x^2 - 4x + 3, -x - 1)$ est une fonction rationnelle donc elle est derivable sur $RR - {1}$ en particulier sur $]-infinity, 0[ - {-1}$ d'ou $h$ est derivable sur $]-infinity, 0[ - {-1}$

$*$ D'apres 3) a), $h$ n'est pas derivable en $0$.

Donc $h$ est derivable sur $RR - {-1, 0, 1}$ ; et on a :

- Pour tout $x in ]0, +infinity[ - {1}$ ; $h'(x) = f'(x) = frac(x^2 - 2x - 7, (x - 1)^2)$.

// Source: Parascolaire Analyse p.167

- Pour tout $x in ]-infinity, 0[ - {-1}$ ;

$h'(x) = frac((2x - 4)(-x - 1) + x^2 - 4x + 3, (-x - 1)^2) = frac(-x^2 - 2x + 7, (x + 1)^2)$.

c) Soit $T : y = h'(x_0)(x - x_0) + h(x_0)$, l'equation de la tangente a $xi_h$ au point $M_0$ d'abscisse $x_0$ et soit $D_1$ la droite d'equation $y = -x$ ;

$D || T$ si et seulement si $h'(x_0) = -1$.

Si $x in ]0, +infinity[ backslash {1}$ ; $h'(x_0) = -1 arrow.l.r.double frac(x_0^2 - 2x_0 - 7, (x_0 - 1)^2) = -1$

$arrow.l.r.double x_0^2 - 2x_0 - 7 = -(x_0 - 1)^2 arrow.l.r.double x_0^2 - 2x_0 - 3 = 0$ donc $x_0 = -1$ ou $x_0 = 3$.

Donc les tangentes $T_1$ et $T_2$ a $zeta_h$ aux points $M_1$ et $M_2$ d'abscisses respectifs $x_1 = -1$ et $x_2 = 3$ sont parallele a la droite $D_1$.

d) $*$ Si $x in ]0, +infinity[ - {1}$ ; $h'(x) = frac(x^2 - 2x - 7, (x - 1)^2)$

// Source: Parascolaire Analyse p.168

sur cet intervalle, le signe de $h'(x)$ est celui du numerateur : $x^2 - 2x - 7$

or $x^2 - 2x - 7 = 0 arrow.l.r.double x' = 1 - 2 sqrt(2)$ et $x'' = 1 + 2 sqrt(2)$.

#table(
  columns: (auto, auto, auto, auto, auto),
  align: center,
  stroke: 0.5pt,
  [$x$], [$0$], [$1$], [$1 + 2 sqrt(2)$], [$+infinity$],
  [$h'(x)$], [$-$], [$||$], [$-$], [$+$],
)

$*$ Si $x in ]-infinity, 0[ - {-1}$, $h'(x) = frac(-x^2 - 2x + 7, (x + 1)^2)$ ; sur cet intervalle, le signe de $h'(x)$ est celui du numerateur or $-x^2 - 2x + 7 = 0$

$arrow.l.r.double x' = -2 sqrt(2) - 1$ et $x'' = -2 sqrt(2) - 1$.

#table(
  columns: (auto, auto, auto, auto, auto),
  align: center,
  stroke: 0.5pt,
  [$x$], [$-infinity$], [$-2 sqrt(2) - 1$], [$-1$], [$0$],
  [$h'(x)$], [$-$], [$+$], [$||$], [$+$],
)

Donc le signe de $h'(x)$ pour tout $x in RR - {0, -1, 1}$ est :

#table(
  columns: (auto, auto, auto, auto, auto, auto, auto),
  align: center,
  stroke: 0.5pt,
  [$x$], [$-infinity$], [$-2 sqrt(2) - 1$], [$-1$], [$0$], [$1$], [$1 + 2 sqrt(2)$], [$+infinity$],
  [$h'(x)$], [$-$], [$+$], [$||$], [$+$], [$||$], [$-$], [$+$],
)

// Source: Parascolaire Analyse p.168

=== Exercice 13 — Corrige

$cases(f(x) = x^2 - x + 3 "si" x gt.eq 1, f(x) = frac(2|x| - 5, x - 2) "si" x < 1)$

1) a) $*$ Continuite de $f$ en $x_0 = 1$.

- $lim_(x -> 1^+) f(x) = lim_(x -> 1^+) (x^2 - x + 3) = 3 = f(1)$.

- $lim_(x -> 1^-) f(x) = lim_(x -> 1^-) frac(2|x| - 5, x - 2) = frac(-3, -1) = 3$.

- $lim_(x -> 1^-) f(x) = lim_(x -> 1^+) f(x) = f(1)$ donc $f$ est continue en $x_0 = 1$.

$*$ *Derivabilite de f en $x_0 = 1$.*

- $lim_(x -> 1^+) frac(f(x) - f(1), x - 1) = lim_(x -> 1^+) frac(x^2 - x + 3 - 3, x - 1) = lim_(x -> 1^+) frac(x(x - 1), x - 1) = 1 = f'_d(1)$.

- $lim_(x -> 1^-) frac(f(x) - f(1), x - 1) = lim_(x -> 1^-) frac(frac(2|x| - 5, x - 2) - 3, x - 1) = lim_(x -> 1^-) frac(2x - 5 - 3x + 6, (x - 2)(x - 1))$

$= lim_(x -> 1^-) frac(-(x - 1), (x - 2)(x - 1)) = 1 = f'_g(1)$. et $f'_d(1) = f'_g(1) = 1$ donc $f$ est derivable en $1$.

// Source: Parascolaire Analyse p.169

$*$ Continuite de $f$ en $0$ : $0 in ]-infinity, 1[$ donc $lim_(x -> 0) f(x) = lim_(x -> 0) frac(2|x| - 5, x - 2) = frac(5, 2) = f(0)$ donc $f$ est continue en $0$

$*$ *Derivabilite de f en 0 :*

$lim_(x -> 0^+) frac(f(x) - f(0), x - 0) = lim_(x -> 0^+) frac(frac(2x - 5, x - 2) - frac(5, 2), x) = lim_(x -> 0^+) frac(4x - 10 - 5x + 10, 2x(x - 2))$

$= lim_(x -> 0^+) frac(-x, 2x(x - 2)) = frac(1, 4) = f'_d(0)$.

$lim_(x -> 0^-) frac(f(x) - f(0), x - 0) = lim_(x -> 0^-) frac(frac(-2x - 5, x - 2) - frac(5, 2), x) = lim_(x -> 0^-) frac(-4x - 10 - 5x + 10, 2x(x - 2))$

$= lim_(x -> 0^-) frac(-9x, 2x(x - 2)) = frac(9, 4) = f'_g(0)$.

$f'_d(0) eq.not f'_g(0)$ donc $f$ n'est pas derivable en $0$.

b) La courbe $xi$ admet une tangente $Delta$ au point d'abscisse $1$ car $f$ est derivable d'ou $Delta : y = f'(1)(x - 1) + f(1)$ or $f'(1) = 1$ et $f(1) = 3$.

Donc $Delta : y = x + 2$ est l'equation de la tangente a $xi_f$ au point $A$ d'abscisse $1$.

// Source: Parascolaire Analyse p.169-170

2) a) $f(x) = cases(x^2 - x + 3 "si" x in [1, +infinity[, frac(2x - 5, x - 2) "si" x in [0, 1[, frac(-2x - 5, x - 2) "si" x in ]-infinity, 0])$

$*$ Si $x in ]1, +infinity[$ ; $f(x) = x^2 - x + 3$ est la restriction d'une fonction polynome qui est derivable sur $RR$ donc $f$ l'est sur $]1, +infinity[$.

$*$ Si $x in ]0, 1[$ ; $f(x) = frac(2x - 5, x - 2)$ est la restriction d'une fonction rationnelle, qui est derivable sur $RR - {2}$, donc $f$ l'est sur $]0, 1[$.

$*$ Si $x in ]-infinity, 0[$ ; $f(x) = frac(-2x - 5, x - 2)$ est la restriction d'une fonction rationnelle, qui est derivable sur $RR - {2}$, donc $f$ l'est sur $]-infinity, 0[$.

- Calcul de la fonction derivee $f'(x)$.

$*$ Si $x in ]1, +infinity[$ ; $f'(x) = 2x - 1$.

$*$ Si $x in ]0, 1[$ ; $f'(x) = frac(2(x - 2) - (2x - 5), (x - 2)^2) = frac(1, (x - 2)^2)$.

ou on utilise $f'(x) = frac(2x(-2) - (-5) times 1, (x - 2)^2) = frac(1, (x - 2)^2)$

$*$ Si $x in ]-infinity, 0[$ ; $f'(x) = frac(-2(x - 2) - (-2x - 5), (x - 2)^2) = frac(9, (x - 2)^2)$.

b) $Delta : y = x + 2$ est tangente a $zeta$ en un autre point $B$ d'abscisse $x_0$

signifie que $f'(x_0) = 1$.

// Source: Parascolaire Analyse p.170

$*$ Si $x_0 in ]1, +infinity[$ ; $f'(x_0) = 1 arrow.l.r.double 2x_0 - 1 = 1 arrow.l.r.double x_0 = 1$ c'est l'abscisse du point $A$.

$*$ Si $x_0 in ]0, 1[$ ; $f'(x_0) = 1 arrow.l.r.double frac(1, (x_0 - 2)^2) = 1 arrow.l.r.double (x_0 - 2)^2 = 1$

$arrow.l.r.double x_0 - 2 = 1$ ou $x_0 - 2 = -1 arrow.l.r.double x_0 = 5 in.not ]0, 1[$ ou $x_0 = 1$ (abscisse de $A$)

$*$ Si $x_0 in ]-infinity, 0[$ ; $f'(x_0) = 1 arrow.l.r.double frac(9, (x_0 - 2)^2) = 1 arrow.l.r.double 9 = (x_0 - 2)^2$

$arrow.l.r.double x_0 - 2 = 3$ ou $x_0 - 2 = -3 arrow.l.r.double x_0 = 5 in.not ]-infinity, 0[$ ou $x_0 = -1 in ]-infinity, 0[$

Donc $Delta$ est tangente a $xi$ en un autre point $B(-1, 1)$.

3) a) Soit $T_alpha$ l'equation de la tangente a $xi$ au point $M$ d'abscisse $alpha > 1$.

$T_alpha : y = f'(alpha)(x - alpha) + f(alpha)$ ; $alpha > 1$ donc $f'(alpha) = 2 alpha - 1$

et $f(alpha) = alpha^2 - alpha + 3$ d'ou $T_alpha : y = (2 alpha - 1)(x - alpha) + alpha^2 - alpha + 3$.

Par suite $T_alpha : y = (2 alpha - 1) x - alpha^2 + 3$.

// Source: Parascolaire Analyse p.170-171

- Soit $T'_alpha$ l'equation de la tangente a $xi$ au point $N$ d'abscisse $frac(1, alpha)$,

Donc $T'_alpha : y = f'(frac(1, alpha))(x - frac(1, alpha)) + f(frac(1, alpha))$.

$alpha < 1$ donc $0 < frac(1, alpha) < 1$ par suite $f'(frac(1, alpha)) = frac(alpha^2, (1 - 2 alpha)^2)$

et $f(frac(1, alpha)) = frac(frac(2, alpha) - 5, frac(1, alpha) - 2) = frac(2 - 5 alpha, 1 - 2 alpha)$ d'ou $T'_alpha : y = frac(alpha^2, (1 - 2 alpha)^2)(x - frac(1, alpha)) + frac(2 - 5 alpha, 1 - 2 alpha)$.

par suite $T'_alpha : y = frac(alpha^2, (1 - 2 alpha)^2) x + frac(10 alpha^2 - 10 alpha + 2, (1 - 2 alpha)^2)$.

b) $A(1, 3)$. Soit $M(x, y) in (O A)$ signifie que $overline(O M)$ et $overline(O A)$ sont colineaires

signifie que $mat(delim: "|", x, 1; y, 3) = 0$ d'ou $(O A) : y = 3x$.

- $T_alpha$ est parallele a $(O A)$ si et seulement si $2 alpha - 1 = 3$ d'ou $alpha = 2$.

- Soit $T_alpha$ et $T'_alpha$ respectivement les droites $T_alpha$ et $T'_alpha$ avec $alpha = 2$ ;

donc $T_2 : y = 3x - 1$ ; $T'_2 : y = frac(4, 9) x + frac(22, 9)$.

Soit $H(x, y) in T_2 sect T'_2$ signifie que $cases(y = 3x - 1, y = frac(4, 9) x + frac(22, 9))$

equivaut a $3x - 1 = frac(4, 9) x + frac(22, 9)$ ou encore $27x - 9 = 4x + 22$ ;

d'ou $x = frac(31, 23)$ et par suite $y = 3 times frac(31, 23) - 1 = frac(70, 23)$ d'ou $H(frac(31, 23), frac(70, 23))$.

// Source: Parascolaire Analyse p.171-172

4) $*$ Si $x in ]0, 1[$ ; $f'(x) = frac(1, (x - 2)^2)$ est la restriction d'une fonction rationnelle qui est derivable sur $RR - {2}$, donc $f$ l'est sur $]0, 1[$ par suite $f$ est deux fois derivable sur $]0, 1[$.

$*$ Si $x in ]1, +infinity[$ ; $f'(x) = 2x - 1$ est la restriction d'une fonction polynome qui est derivable sur $RR$ donc $f$ l'est sur $]1, +infinity[$ et par suite $f$ est deux fois derivable sur $]1, +infinity[$ d'ou $f$ est deux fois derivable sur $]0, +infinity[ backslash {1}$.

$*$ derivabilite de la fonction $f'$ a droite en $0$.

Derivabilite de la fonction $f'$ en $1$ :

$lim_(x -> 1^+) frac(f'(x) - f'(1), x - 1) = lim_(x -> 1^+) frac(2x - 1 - 1, x - 1) = lim_(x -> 1^+) frac(2(x - 1), x - 1) = 2 = f''_d(1)$. $*$

$lim_(x -> 1^-) frac(f'(x) - f'(1), x - 1) = lim_(x -> 1^-) frac(frac(1, (x - 2)^2) - 1, x - 1)$

$= lim_(x -> 1^-) frac((3 - x)(x - 1), (x - 1)(x - 2)^2) = lim_(x -> 1^-) frac(3 - x, (x - 2)^2) = 2 = f''_g(1)$.

$f''_d(1) = f''_g(1)$ donc $f'$ est derivable en $1$ et par suite $f$ est deux fois derivable en $1$.

Conclusion : On a $f$ est deux fois derivable sur $]0, +infinity[ backslash {1}$ et $f$ est deux fois derivable a droite en $0$ et en $1$ ; donc $f$ est deux fois derivable sur $[0, +infinity[$ et on a :

- Pour tout $x in [0, 1]$ ; $f''(x) = [frac(1, (x - 2)^2)]' = frac(-2(x - 2), (x - 2)^4) = frac(-2, (x - 2)^3)$.

- Pour tout $x in [1, +infinity[$ ; $f''(x) = (2x - 1)' = 2$.

// Source: Parascolaire Analyse p.172

#underline[*Sens de variation -- Extrema*]

=== Exercice 14 — Corrige

1) $D_f = {x in RR "tel que" x(x^2 - x - 2) eq.not 0} union {2}$

$x(x^2 - x - 2) = 0 arrow.l.r.double x = 0$ ou $x^2 - x - 2 = 0$.

$x^2 - x - 2 = 0 arrow.l.r.double x = -1$ ou $x = 2$. D'ou $D_f = RR^* - {-1}$.

1) $*$ $x^2 - 2x = 0 arrow.l.r.double x(x - 2) = 0 arrow.l.r.double x = 0$ ou $x = 2$.

#table(
  columns: (auto, auto, auto, auto, auto),
  align: center,
  stroke: 0.5pt,
  [$x$], [$-infinity$], [$0$], [$2$], [$+infinity$],
  [$x^2 - 2x$], [$+$], [$0$], [$-$], [$0$], [$+$],
  [$|x^2 - 2x|$], [], [$x^2 - 2x$], [], [$-x^2 + 2x$], [], [$x^2 - 2x$],
)

*Continuite de f en 2 :*

$lim_(x -> 2^+) f(x) = lim_(x -> 2^+) frac(x^2 - 2x, x(x^2 - x - 2)) = lim_(x -> 2^+) frac(x(x - 2), x(x - 2)(x + 1)) = lim_(x -> 2^+) frac(1, x + 1) = frac(1, 3)$.

// Source: Parascolaire Analyse p.173

$lim_(x -> 2^-) f(x) = lim_(x -> 2^-) frac(-x^2 + 2x, x(x^2 - x - 2)) = lim_(x -> 2^-) frac(x(2 - x), x(x - 2)(x + 1)) = lim_(x -> 2^-) frac(-1, x + 1) = -frac(1, 3)$.

$lim_(x -> 2^+) f(x) eq.not lim_(x -> 2^-) f(x)$ donc $f$ n'est pas continue en $2$ par suite elle n'est pas derivable en $2$.

3) $*$ Si $x in ]-infinity, 0[ union ]2, +infinity[ backslash {-1}$.

$*$ on a : $f(x) = frac(1, x + 1)$ est une fonction rationnelle dont derivable sur :

$]-infinity, 0[ union ]2, +infinity[ backslash {-1}$ et on a : $f'(x) = frac(-1, (x + 1)^2) < 0$

$*$ Si $x in ]0, 2[$ ; on a $f(x) = -frac(1, x + 1)$ est une fonction rationnelle donc derivable sur $]0, 2[$ et on a pour tout $x in ]0, 2[$ ; $f'(x) = frac(1, (1 + x)^2) > 0$.

// Tableau de variation
#table(
  columns: (auto, auto, auto, auto, auto, auto, auto),
  align: center,
  stroke: 0.5pt,
  [$x$], [$-infinity$], [$-1$], [$0$], [$2$], [$+infinity$],
  [$f'(x)$], [$-$], [$||$], [$-$], [$||$], [$+$], [$||$], [$-$],
  [$f(x)$], [$0$], [], [$+infinity$], [], [$-infinity$], [], [$-1$], [], [$frac(1, 3)$], [], [$0$],
)

$lim_(x -> -infinity) f(x) = lim_(x -> -infinity) frac(1, x + 1) = 0$ ; $lim_(x -> (-1)^-) f(x) = lim_(x -> (-1)^-) frac(1, x + 1) = -infinity$.

$lim_(x -> (-1)^+) f(x) = lim_(x -> (-1)^+) frac(1, x + 1) = +infinity$.

$lim_(x -> 0^-) f(x) = lim_(x -> 0^-) frac(1, x + 1) = 1$ ; $lim_(x -> 0^+) f(x) = lim_(x -> 0^+) frac(-1, x + 1) = -1$

$lim_(x -> +infinity) f(x) = lim_(x -> +infinity) frac(1, x + 1) = 0$.

=== Exercice 15 — Corrige

a) Faux car $f(1) = frac(2, 3)$.

b) Vrai car $f'$ s'annule en $x = -2$ et change de signe.

c) Faux car $f'(x) < 0$ sur $]1, +infinity[$.

d) Vrai : un maximum en $2$ et un minimum en $-2$.

// Source: Parascolaire Analyse p.174

=== Exercice 16 — Corrige

1) $f(x) = frac(x^3 + 9x, x^2 + 1)$ est une fonction rationnelle donc elle est derivable sur son domaine $RR$ et on a :

$f'(x) = frac((3x^2 + 9)(x^2 + 1) - (x^3 + 9x)(2x), (x^2 + 1)^2) = frac(x^4 - 6x^2 + 9, (x^2 + 1)^2) = frac((x^2 - 3)^2, (x^2 + 1)^2)$

D'ou $a = 3$.

2) a) Equation de la tangente a la courbe au point d'abscisse $0$ :
$y = 9(x - 0) + 0$ soit $y = 9x$.

b) $g(x) = f(x) - 9x$ d'ou $g'(x) = f'(x) - 9$ et par suite $g''(x) = f''(x)$.

c) $*$ $f''(x) = (frac((x^2 - 3)^2, (x^2 + 1)^2))' = 2(frac(x^2 - 3, x^2 + 1))(frac(8x, (x^2 + 1)^2))$

$= 2(frac(x^2 - 3, x^2 + 1))(frac(8x, (x^2 + 1)^2))$.

sur $I = [-sqrt(3), sqrt(3)]$ ; $x^2 - 3 < 0$ donc le signe de $f''$ est celui de $(-x)$

$*$ on a $g''(x) = f''(x)$ donc le signe de $g''$ est celui de $f''$.

Donc si $x < 0$ ; $g'' > 0$ et par suite la fonction $g'$ est strictement croissante sur $[-sqrt(3), 0]$

Si $x > 0$ ; $g'' < 0$ et par suite la fonction $g'$ est strictement decroissante sur $[0, sqrt(3)]$

$*$ La fonction $g'$ a donc un maximum en $0$ :

$g'(0) = f'(0) - 9 = 9 - 9 = 0$ donc $g'$ est negative puisque son maximum est $0$.

Donc la fonction $g$ est decroissante sur $[-sqrt(3), sqrt(3)]$.

$*$ Comme $g(0) = f(0) - 0 = 0$, la fonction $g$ est positive pour $x < 0$ et negative pour $x > 0$.

// Tableau position courbe/tangente
#table(
  columns: (auto, auto, auto, auto),
  align: center,
  stroke: 0.5pt,
  [$x$], [$-sqrt(3)$], [$0$], [$sqrt(3)$],
  [$g(x) = f(x) - 9x$], [$+$], [$0$], [$-$],
  [Position de $zeta_f$ par rapport a la tangente], [$zeta_f$ est au dessus de la tangente], [coincident], [$zeta_f$ est au dessous de la tangente],
)

// Source: Parascolaire Analyse p.175

=== Exercice 17 — Corrige

1) $*$ $A(1, 0) in zeta_f$ signifie que $f(1) = 0$.
$*$ $B(0, 1) in zeta_f$ signifie que $f(0) = 1$.

$cases(f(1) = 0, f(0) = 1) arrow.l.r.double cases(a + b + c = 0, c = 1) arrow.l.r.double$ donc $b = -1 - a$.

2) $f(x) = a x^2 - (1 + a) x + 1$.

d'autre part $f'(x) = 2 a x - 1 - a$.

$f'(x)$ s'annule et change de signe en $x = frac(1 + a, 2a)$

Donc les coordonnees de l'extremum sont $x = frac(1 + a, 2a)$ et ; $y = frac(4a - (1 + a)^2, 4a)$.

3) a) soit $E = {M(x, y) "tel que" x = frac(1 + a, 2a) "et" y = frac(4a - (1 + a)^2, 4a) "avec" a in RR^*}$

l'ensemble des points associes a ces extremums :

$M(x, y) in E arrow.l.r.double cases(x = frac(1 + a, 2a), y = frac(4a - (1 + a)^2, 4a)) arrow.l.r.double cases(x = frac(1 + a, 2a), y = 1 - frac((1 + a)^2, 4a))$

$x = frac(1 + a, 2a) arrow.l.r.double 1 + a = 2 a x arrow.l.r.double a = frac(1, 2x - 1)$

donc $y = 1 - frac(4 a^2 x^2, 4a) = 1 - a x^2 = 1 - frac(x^2, 2x - 1)$.

donc l'ensemble $E = {M(x, y) "tel que" y = 1 - frac(x^2, 2x - 1)}$.

// Source: Parascolaire Analyse p.175-176

b) soit $g(x) = 1 - frac(x^2, 2x - 1)$.

$x |-> frac(-x^2, 2x - 1)$ est une fonction rationnelle donc elle est derivable sur son domaine $RR - {frac(1, 2)}$ et par suite $x |-> g(x)$ est derivable sur $RR - {frac(1, 2)}$

// Tableau de variation avec asymptotes
et on a : pour tout $x in RR - {frac(1, 2)}$ ; $g'(x) = frac(2(x - x^2), (1 - 2x)^2)$.

#table(
  columns: (auto, auto, auto, auto, auto, auto),
  align: center,
  stroke: 0.5pt,
  [$x$], [$-infinity$], [$0$], [$frac(1, 2)$], [$1$], [$+infinity$],
  [$g'(x)$], [$-$], [$0$], [$+$], [$||$], [$+$], [$0$], [$-$],
)

// Source: Parascolaire Analyse p.176

=== Exercice 18 — Corrige

1) Vrai : $f(x) = frac(2, x) + x$ et $f'(x) = -frac(2, x^2) + 1$ d'ou $f'(1) = -1$.

2) Faux : $f(x) = sqrt(4x + 1)$ alors $f'(x) = frac((4x + 1)', 2 sqrt(4x + 1)) = frac(4, 2 sqrt(4x + 1)) eq.not frac(1, 2 sqrt(4x + 1))$

3) Faux : $f(x) = frac(1, 2 sqrt(x))$ alors $f'(x) = frac(1, 2) frac(-(sqrt(x))', (sqrt(x))^2) = frac(1, 2) frac(-frac(1, 2 sqrt(x)), x)$

$f'(x) = frac(-1, 4x sqrt(x)) eq.not sqrt(x)$

4) Faux : contre exemple $f(x) = 5$ derivable sur $RR$ et $f$ est constante.

5) Vrai : d'apres le theoreme de cours.

6) Faux : contre exemple : $f(x) = frac(1, sqrt(x)) > 0$ et $f'(x) = -frac(1, 2x sqrt(x)) < 0$ alors $f$ est decroissante.

// Source: Parascolaire Analyse p.176-177

=== Exercice 19 — Corrige

$f(x) = frac(a x + b, x^2 + x + 3)$ ; $D_f = RR$.

1) $f$ est une fonction rationnelle donc elle est derivable sur $RR$ et on a :

$f'(x) = frac(a(x^2 + x + 3) - (2x + 1)(a x + b), (x^2 + x + 3)^2) = frac(a x^2 + a x + 3a - 2a x^2 - a x - 2b x - b, (x^2 + x + 3)^2)$

$= frac(-a x^2 - 2b x + 3a - b, (x^2 + x + 3)^2)$.

2) $f$ admet un extremum egal a $1$ en $x_0 = 0$ signifie que :

$cases(f'(0) = 0, f(0) = 1) arrow.l.r.double cases(frac(3a - b, 9) = 0, frac(b, 3) = 1) arrow.l.r.double cases(a = 1, b = 3)$

3) Pour $a = 1$ ; $b = 3$ on a : $f(x) = frac(x + 3, x^2 + x + 3)$

$f'(x) = frac(-x^2 - 6x, (x^2 + x + 3)^2)$ ; $f'(x) = 0 arrow.l.r.double -x^2 - 6x = 0 arrow.l.r.double x = 0$ ou $x = -6$.

#table(
  columns: (auto, auto, auto, auto, auto),
  align: center,
  stroke: 0.5pt,
  [$x$], [$-infinity$], [$-6$], [$0$], [$+infinity$],
  [$f'(x)$], [$-$], [$0$], [$+$], [$0$], [$-$],
  [$f(x)$], [$0$], [$arrow.b$], [$frac(1, 11)$], [$arrow.t$], [$1$], [$arrow.b$], [$0$],
)

$*$ $lim_(x -> +infinity) f(x) = lim_(x -> +infinity) frac(x, x^2) = lim_(x -> +infinity) frac(1, x) = 0$

$*$ $lim_(x -> -infinity) f(x) = lim_(x -> -infinity) frac(x, x^2) = lim_(x -> -infinity) frac(1, x) = 0$.

4) $f'(-1) = frac(5, 9)$ ; $A(-1, f(-1))$ or $f(-1) = frac(2, 3)$ donc $A(-1, frac(2, 3))$.

la tangente a $zeta_f$ en $A$ est : $y = frac(5, 9)(x + 1) + frac(2, 3)$ ou encore $y = frac(5, 9) x + frac(11, 9)$

5) $a = 1$ ; $b in RR$.

$f(x) = frac(x + b, x^2 + x + 3)$ et $f'(x) = frac(-x^2 - 2b x + 3 - b, (x^2 + x + 3)^2)$.

$f'(x) = 0 arrow.l.r.double -x^2 - 2b x + 3 - b = 0$ or $Delta' = b^2 + 3 - b = b^2 - b + 3$.

$delta = 1 - 12 = -11 < 0$ donc $b^2 - b + 3 > 0$ pour tout $b in RR$

Donc $f'(x)$ s'annule pour deux valeurs $x'$ et $x''$ et change de signe ; Donc $f$ admet toujours deux extremums.

// Source: Parascolaire Analyse p.177-178

=== Exercice 20 — Corrige

1) $g(x) = -frac(1, 2) x^2 + 2x sqrt(x) - 2x - 1$ ; $D_g = {x in RR, "tel que" x gt.eq 0} = RR_+$.

a) $x |-> sqrt(x)$ est derivable sur $RR_+^*$ et par suite $x |-> 2x sqrt(x)$ est derivable sur $RR_+^*$ ; $x |-> -frac(1, 2) x^2 - 2x - 1$ est une fonction polynome donc est derivable sur $RR$, en particulier sur $RR_+$ ;

d'ou $x |-> g(x)$ est derivable sur $RR_+^*$.

comme $lim_(x -> 0^+) frac(g(x) - g(0), x) = lim_(x -> 0^+) -frac(1, 2) x + 2 sqrt(x) - 2 = -2 = g'(0)$

par suite $g$ est derivable sur $RR_+$.

b) Pour tout $x in RR$ ; $g'(x) = -x + 2 sqrt(x) + 2x frac(1, 2 sqrt(x)) - 2$

$g'(x) = -x + 2 sqrt(x) + frac(x, sqrt(x)) - 2 = -x + 3 sqrt(x) - 2$.

$g'(x) = 0 arrow.l.r.double -x + 3 sqrt(x) - 2 = 0$. on pose $sqrt(x) = t$ donc $x = t^2$

donc l'equation devient : $-t^2 + 3t - 2 = 0$ ;

$a + b + c = 0$ donc $t = 1$ ou $t = 2$.

Factorisons : $-x + 3 sqrt(x) - 2$ ;

il suffit de factoriser $-t^2 + 3t - 2 = -(t - 1)(t - 2)$

d'ou $-x + 3 sqrt(x) - 2 = -(sqrt(x) - 1)(sqrt(x) - 2)$.

$*$ $sqrt(x) - 1 gt.eq 0 arrow.l.r.double sqrt(x) gt.eq 1 arrow.l.r.double x gt.eq 1$.

$*$ $sqrt(x) - 2 gt.eq 0 arrow.l.r.double sqrt(x) gt.eq 2 arrow.l.r.double x gt.eq 4$.

#table(
  columns: (auto, auto, auto, auto, auto),
  align: center,
  stroke: 0.5pt,
  [$x$], [$0$], [$1$], [$4$], [$+infinity$],
  [$sqrt(x) - 1$], [$-$], [$0$], [$+$],
  [$sqrt(x) - 2$], [$-$], [], [$-$], [$0$], [$+$],
  [$-(sqrt(x) - 1)(sqrt(x) - 2)$], [$-$], [], [$+$], [$0$], [$-$],
)

Donc

#table(
  columns: (auto, auto, auto, auto, auto),
  align: center,
  stroke: 0.5pt,
  [$x$], [$0$], [$1$], [$4$], [$+infinity$],
  [$g'(x)$], [$-$], [$0$], [$+$], [$0$], [$-$],
  [$g(x)$], [$-1$], [$arrow.b$], [$-frac(3, 2)$], [$arrow.t$], [$-1$], [$arrow.b$], [$-infinity$],
)

$lim_(x -> +infinity) g(x) = lim_(x -> +infinity) x^2(-frac(1, 2) + frac(2, sqrt(x)) frac(sqrt(x), x) - frac(2, x) - frac(1, x^2)) = lim_(x -> +infinity) x^2(-frac(1, 2) + frac(2, sqrt(x)) - frac(2, x) - frac(1, x^2)) = -infinity$

La fonction $g'(x)$ s'annule et change de signe en $x_0 = 1$ et $x_0 = 4$ ;

Donc la fonction $g$ admet des extremums en ces points, et d'apres le Tableau de variation de $g$, on a un minimum local en $x_0 = 1$ et un Maximum absolu $(-1)$ en $x_0 = 4$

// Source: Parascolaire Analyse p.178

2) a) $f(x) = -frac(1, 6) x^3 + frac(4, 5) x^2 sqrt(x) - x^2 - x$ ; $D_f = RR_+$
