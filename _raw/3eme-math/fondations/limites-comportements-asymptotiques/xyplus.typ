// =============================================================================
// Transcription fidele : XY Plus 3eme Math Tome 1 — Chapitre 4
// Limites et comportements asymptotiques
// Source : CAEU Med Ali, pages 41 a 58
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

#let theoreme-block(body) = block(
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

// =============================================================================
// RESUME DE COURS
// =============================================================================

#align(center, text(size: 18pt, weight: "bold")[Chapitre 4])
#align(center, text(size: 16pt, weight: "bold")[Limites et comportements asymptotiques])

#v(1em)

// Source: XY Plus T1 p.41

= 1. Limites infinies en un reel

#definition-block[
  *Definition*

  Soit $f$ une fonction definie sur un intervalle ouvert $I$, sauf en un reel $a$ de $I$.

  - On dit que la fonction $f$ a pour limite $+infinity$ en $a$ si $lim_(x arrow.r a^-) f = lim_(a^+) f = +infinity$.

    On note $lim_a f = +infinity$.

  - On dit que la fonction $f$ a pour limite $-infinity$ en $a$ si, $lim_(a^-) f = lim_(a^+) f = -infinity$.

    On note $lim_a f = -infinity$.
]

#theoreme-block[
  *Theoreme*

  Pour tout reel $a$ et pour tout entier naturel $n$ non nul, on a :

  - $lim_(x arrow.r a) frac(1, (x - a)^(2n)) = +infinity$

  - $lim_(x arrow.r a^-) frac(1, (x - a)^(2n - 1)) = -infinity$

  - $lim_(x arrow.r a^+) frac(1, (x - a)^(2n - 1)) = +infinity$
]

// Source: XY Plus T1 p.41-42

= 2. Operations sur les limites

Les resultats suivants concernent les limites en un reel, ou en l'infini, de la somme, du produit et du quotient et de la valeur absolue.

#v(0.5em)

*Somme :*

#table(
  columns: 3,
  [$lim f$], [$lim g$], [$lim(f + g)$],
  [$ell$], [$ell'$], [$ell + ell'$],
  [$ell$], [$+infinity$], [$+infinity$],
  [$-infinity$], [$ell'$], [$-infinity$],
  [$+infinity$], [$+infinity$], [$+infinity$],
  [$-infinity$], [$-infinity$], [$-infinity$],
)

#v(0.5em)

*Produit :*

#table(
  columns: 3,
  [$lim f$], [$lim g$], [$lim(f times g)$],
  [$ell$], [$ell'$], [$ell times ell'$],
  [$+infinity$], [$ell' > 0$], [$+infinity$],
  [$+infinity$], [$ell' < 0$], [$-infinity$],
  [$-infinity$], [$ell' > 0$], [$-infinity$],
  [$-infinity$], [$ell' < 0$], [$+infinity$],
  [$+infinity$], [$+infinity$], [$+infinity$],
  [$+infinity$], [$-infinity$], [$-infinity$],
  [$-infinity$], [$-infinity$], [$+infinity$],
)

// Source: XY Plus T1 p.42

#v(0.5em)

*Quotient :*

#table(
  columns: 3,
  [$lim f$], [$lim g$], [$lim(frac(f, g))$],
  [$ell$], [$ell' eq.not 0$], [$frac(ell, ell')$],
  [$+infinity$], [$ell' > 0$], [$+infinity$],
  [$+infinity$], [$ell' < 0$], [$-infinity$],
  [$-infinity$], [$ell' > 0$], [$-infinity$],
  [$-infinity$], [$ell' < 0$], [$+infinity$],
  [$ell$], [$+infinity$], [$0$],
  [$ell$], [$-infinity$], [$0$],
  [$ell eq.not 0$], [$0$], [$infinity$ (regle de signes)],
)

#v(0.5em)

*Valeur absolue :*

#table(
  columns: 2,
  [$lim f$], [$lim |f|$],
  [$ell$], [$|ell|$],
  [$+infinity$], [$+infinity$],
  [$-infinity$], [$+infinity$],
)

// Source: XY Plus T1 p.42

= 3. Limites d'une fonction polynome ou d'une fonction rationnelle

#theoreme-block[
  *Theoreme*

  - La limite d'une fonction polynome, quand la variable tend vers l'infini, est la meme que celle de son terme de plus haut degre.

  - La limite d'une fonction rationnelle quand la variable tend vers l'infini est la meme que celle du quotient des termes de plus haut degre.
]

= 7. Limites de $sqrt(f)$

#theoreme-block[
  *Theoreme*

  - Soit $f$ une fonction positive, $a$ un reel et $ell$ un reel.\
    Si $lim_(x arrow.r a) f = ell$ alors $lim_(x arrow.r a) sqrt(f) = sqrt(ell)$

  - Soit $f$ une fonction definie et positive sur un intervalle voisinage de $+infinity$ et $ell$ un reel.\
    Si $lim_(x arrow.r +infinity) f = ell$ alors $lim_(x arrow.r +infinity) sqrt(f) = sqrt(ell)$

  - Soit $f$ une fonction definie et positive sur un intervalle voisinage de $-infinity$ et $ell$ un reel.\
    Si $lim_(x arrow.r -infinity) f = ell$ alors $lim_(x arrow.r -infinity) sqrt(f) = sqrt(ell)$.
]

// Source: XY Plus T1 p.42-43

= 4. Asymptotes

Soit $f$ une fonction et $cal(C)$ sa courbe representative dans un repere orthogonal $(O, arrow(i), arrow(j))$. Rechercher les limites de $f$ definie sur un intervalle $I$ et representee par la courbe $cal(C)$ dans un repere orthogonal conduit a determiner la (ou les) asymptote(s) $Delta$ a $cal(C)$ dans les cas suivants :

== Asymptote verticale

#definition-block[
  *Asymptote verticale*

  $f$ est une fonction definie sur un intervalle ouvert $I$, sauf en un reel $a$ de $I$.

  Si ($lim_(a^+) f = +infinity$ ou $lim_(a^+) f = -infinity$ ou $lim_(a^-) f = +infinity$ ou $lim_(a^-) f = -infinity$)

  alors la droite $Delta : x = a$ est asymptote verticale a la courbe $cal(C)_f$.

  La courbe aura l'une des formes suivantes :
]

// Figures asymptotes verticales (4 cas principaux)
#cetz.canvas({
  import cetz.draw: *

  // Cas 1 : lim a+ = +inf
  group({
    // Axes
    line((-0.5, 0), (3, 0), mark: (end: ">"))
    line((0, -1.5), (0, 3), mark: (end: ">"))
    content((0.15, -0.2), $O$)
    content((-0.2, 2.8), $arrow(j)$)
    content((2.8, -0.2), $arrow(i)$)

    // Asymptote verticale x = a
    line((1.5, -1.5), (1.5, 3), stroke: (dash: "dashed"))
    content((1.5, 3.3), $x = a$)

    // Courbe approchant depuis la gauche vers +inf
    bezier((0.2, 0.5), (1.2, 2.8), (0.8, 0.8), (1.1, 2))
  })
})

#remarque-block[
  *Remarque :* Si $f$ n'est pas definie en $a$, pour que la droite d'equation $x = a$ soit asymptote verticale il faut que la limite de $f$ en $a$ soit infinie.
]

// Source: XY Plus T1 p.43

== Asymptote horizontale

#definition-block[
  *Asymptote horizontale*

  - $f$ est une fonction definie sur un intervalle voisinage de $+infinity$.\
    Si $lim_(+infinity) f = b$ alors la droite d'equation $y = b$ est asymptote horizontale a la courbe $cal(C)$ au voisinage de $+infinity$.

  - $f$ est une fonction definie sur un intervalle voisinage de $-infinity$.\
    Si $lim_(-infinity) f = b$ alors la droite d'equation $y = b$ est asymptote horizontale a la courbe $cal(C)$ au voisinage de $-infinity$.
]

// Source: XY Plus T1 p.44

== Asymptote oblique

#definition-block[
  *Asymptote oblique*

  - $f$ est definie sur un intervalle de type $[a, +infinity[$ (voisinage de $+infinity$).\
    Lorsque $lim_(x arrow.r +infinity) [f(x) - (alpha x + beta)] = 0$ on dit que la droite d'equation $y = alpha x + beta$ est une asymptote oblique a la courbe $cal(C)$ au voisinage de $+infinity$.

  - $f$ est definie sur un intervalle de type $]-infinity, a]$ (voisinage de $-infinity$).\
    Lorsque $lim_(x arrow.r -infinity) [f(x) - (alpha x + beta)] = 0$ on dit que la droite d'equation $y = alpha x + beta$ est une asymptote oblique a la courbe $cal(C)$ au voisinage de $-infinity$.
]

// Source: XY Plus T1 p.44

#remarque-block[
  *Remarque :*

  - *Courbes asymptotes*\
    $cal(C)_f$ est asymptote a $cal(C)_g$ au voisinage de $+infinity arrow.l.r.double lim_(x arrow.r +infinity) [f(x) - g(x)] = 0$, ce qui signifie que, lorsque $x$ devient de plus en plus grand, les courbes representatives de $f$ et $g$ sont de plus en plus proches.

  - $cal(C)_f$ est asymptote a $cal(C)_g$ au voisinage de $-infinity arrow.l.r.double lim_(x arrow.r -infinity) [f(x) - g(x)] = 0$, ce qui signifie que, lorsque $x$ devient de plus en plus petit (en valeur absolue de plus en plus grand), les courbes representatives de $f$ et $g$ sont de plus en plus proches.
]

// Source: XY Plus T1 p.45

#remarque-block[
  On remarque qu'il n'est pas indispensable qu'une asymptote soit une droite, et qu'il n'est pas interdit qu'une asymptote coupe la courbe a condition que ceci se passe a distance finie.
]

// =============================================================================
// EXERCICES (Enonces)
// =============================================================================

#pagebreak()

#align(center, text(size: 18pt, weight: "bold")[EXERCICES])

#v(1em)

// Source: XY Plus T1 p.46

== Exercice 1

1) $f(x) = frac(x, 2) - 3 sqrt(x)$. Calculer $lim_(x arrow.r +infinity) f(x)$

2) $g(x) = frac(x - 2 sqrt(x), 3x - 1)$. Calculer $lim_(x arrow.r +infinity) g(x)$

3) $h(x) = frac(sqrt(x + 3) - 2, x - 1)$
   - a) Determiner le domaine de definition de $h$
   - b) Calculer $lim_(x arrow.r +infinity) h(x)$ et $lim_(x arrow.r 1) h(x)$

4) $k(x) = sqrt(x^2 + 4) - x + 2$\
   Calculer $lim_(x arrow.r -infinity) k(x)$ et $lim_(x arrow.r +infinity) k(x)$

5) Soit $j(x) = sqrt(2x^2 - 5x + 3) + x$. Calculer $lim_(x arrow.r -infinity) j(x)$

6) $ell(x) = frac(x^2 + x, x^2 - x - 2)$. Calculer $lim_(x arrow.r -1) ell(x)$

// Source: XY Plus T1 p.46-47

== Exercice 2

Dans la figure ci-dessous $cal(C)_1$, $cal(C)_2$, $cal(C)_3$, $cal(C)_4$ et $cal(C)_5$ sont les representations graphiques de cinq fonctions $f_1$, $f_2$, $f_3$, $f_4$ et $f_5$ respectivement.

Par lecture graphique, donner pour chacune de ces fonctions : le domaine de definition, les limites aux bornes du domaine de definition et la nature et une equation de chacune des asymptotes.

// Source: XY Plus T1 p.47

== Exercice 3

Soit $f(x) = frac(x^2 + 3x + 4, x + 2)$

1) Determiner les reels $a$, $b$ et $c$ tels que pour tout $x in RR backslash {-2}$ : $f(x) = a x + b + frac(c, x + 2)$

2) En deduire l'existence d'une asymptote oblique pour la courbe $cal(C)$ au voisinage de $+infinity$ et au voisinage de $-infinity$.\
   Preciser la position de $cal(C)$ par rapport a cette asymptote.

3) La courbe $cal(C)$ admet-elle une autre asymptote ? Si oui la preciser.

// Source: XY Plus T1 p.47

== Exercice 4

La fonction $f$ est definie par $f(x) = sqrt(x^2 + 6x + 8)$

Soit $cal(C)$ sa courbe representative dans un repere du plan.

1) a) Donner le domaine de definition de $f$.
   - b) Calculer les limites de $f$ en $+infinity$ et en $-infinity$.

2) Determiner alors $lim_(x arrow.r -infinity) (f(x) + (x + 3))$ et $lim_(x arrow.r +infinity) (f(x) - (x + 3))$.

   En deduire que la courbe $cal(C)$ admet deux asymptotes obliques au voisinages de $+infinity$ et $-infinity$.

3) a) Montrer que pour tout reel $x$ : $x^2 + 6x + 8 < (x + 3)^2$
   - b) En deduire la position de $cal(C)$ par rapport a ses asymptotes.

// Source: XY Plus T1 p.47

== Exercice 5

Soit $f$ la fonction definie sur $RR$ par $f(x) = sqrt(4x^2 - 4x + 3)$

1) Calculer les limites de $f$ en $+infinity$ et en $-infinity$.

2) Ecrire $4x^2 - 4x + 3$ sous forme canonique.

3) Etudier la limite en $-infinity$ puis en $+infinity$ de la fonction $h$ donnee par\
   $h(x) = f(x) - sqrt((2x - 1)^2)$\
   En deduire que la courbe $cal(C)$ admet deux asymptotes obliques au voisinages de $+infinity$ et $-infinity$.

4) Montrer que la courbe $cal(C)$ est au dessus de chacune de ces asymptotes.

// Source: XY Plus T1 p.48

== Exercice 6

Soit $f$ la fonction definie par $f(x) = -x + sqrt(x^2 - 4)$.

On designe par $cal(C)$ sa courbe representative dans un repere orthonorme $(O, arrow(i), arrow(j))$

1) Calculer $lim_(x arrow.r -infinity) f(x)$.

2) a) Montrer que pour tout $x in [2, +infinity[$, $f(x) = frac(-4, sqrt(x^2 - 4) + x)$

   b) En deduire $lim_(x arrow.r +infinity) f(x)$. Interpreter le resultat graphiquement.

3) Montrer que la droite $Delta : y = -2x$ est asymptote a $cal(C)$.

// Source: XY Plus T1 p.48

== Exercice 7

Soit la fonction $f$ definie par :
$ f(x) = cases(
  frac(2x, x^2 + 1) quad &"si" x lt.eq 1,
  x - frac(x^2 - 1, sqrt(x^2 - x)) quad &"si" x > 1
) $

1-a) Determiner le domaine de definition de $f$.

b) Etudier la continuite de $f$ sur son domaine de definition.

2-a) Montrer que $f$ est majoree par 1 et minoree par $(-1)$ sur $]-infinity ; 1]$.

b) Montrer que $f(]-infinity ; 1]) = [-1, 1]$.

3) Montrer que l'equation $f(x) = 0$ admet une solution $alpha$ dans l'intervalle $[frac(3, 2), 2]$

4) Calculer : $lim_(x arrow.r -infinity) f(x)$ ; $lim_(x arrow.r +infinity) [f(x) - x]$ et $lim_(x arrow.r +infinity) f(x)$

// Source: XY Plus T1 p.48

== Exercice 8

Soit $f$ la fonction definie sur $RR$ par :
$ f(x) = cases(
  frac(x^2 - x + 1, x^2 + 1) quad &"si" x in ]-infinity, 0],
  x sqrt(x^2 + x + 1) quad &"si" x in ]0, +infinity[
) $

On designe par $(C)$ sa courbe representative dans le plan muni d'un repere orthonorme $(O, arrow(i), arrow(j))$.

1) Montrer que $f$ est continue en 0.

2) Montrer que $f$ est continue sur $RR$.

3) Calculer $lim_(x arrow.r -infinity) f(x)$. Interpreter graphiquement le resultat obtenu.

4) a) Calculer $lim_(x arrow.r +infinity) f(x)$.

   b) En deduire que la droite $Delta : y = 2x + frac(1, 2)$ est une asymptote oblique a $(C)$ au voisinage de $+infinity$.

// Source: XY Plus T1 p.49

== Exercice 9

*I/* Soit la fonction $f$ definie sur $[0, +infinity[$ par $f(x) = sqrt(3 + x) - sqrt(x)$

1) Calculer $lim_(x arrow.r +infinity) f(x)$ et interpreter le resultat graphiquement.

2) Montrer que $f$ est bornee sur $[0, +infinity[$.

3) Montrer que l'equation $f(x) = 0,5$ admet une solution $alpha$ appartenant a $[6, 8]$.

*II/* Soit la fonction $g$ definie par $g(x) = frac(-2x^3 - x^2 + 2x, x^2 + x)$

1) Determiner le domaine de definition $D_g$ de la fonction $g$.

2) Calculer $lim_(x arrow.r 1) g(x)$, $lim_(x arrow.r 0) g(x)$ et $lim_(x arrow.r -1) g(x)$. Conclure.

4) a) Montrer que pour tout $x in D_g$, on a : $g(x) = -2x + 1 + frac(1, x + 1)$

   b) Montrer que la droite $Delta : y = -2x + 1$ est une asymptote a la courbe $(zeta)$ de $g$.

*III/* Soit la fonction $h$ definie sur $RR$ par :
$ h(x) = cases(
  sqrt(3 + x) - sqrt(x) quad &"si" x > 1,
  -2x + 1 quad &"si" x < 1,
  h(1) = -1
) $

1) Etudier la continuite de $h$ sur $RR$.

2) Soit $F$ la fonction definie par $F(x) = |x - 1| h(x)$

   a) Calculer $lim_(x arrow.r 1^+) F(x)$ et $lim_(x arrow.r 1^-) F(x)$, conclure.

   b) Calculer $lim_(x arrow.r 1^+) frac(F(x), x - 1)$ et $lim_(x arrow.r 1^-) frac(F(x), x - 1)$, conclure.

   c) Determiner graphiquement $h(]-infinity, -2])$.

// =============================================================================
// CORRIGES
// =============================================================================

#pagebreak()

#align(center, text(size: 18pt, weight: "bold")[CORRIGES])

#v(1em)

// Source: XY Plus T1 p.50

== Corrige Exercice 1

1) $f(x) = frac(x, 2) - 3 sqrt(x)$ , $D_f = [0, +infinity[$

   $lim_(x arrow.r +infinity) f(x) = lim_(x arrow.r +infinity) sqrt(x) (frac(sqrt(x), 2) - 3) = +infinity$ #h(1em) (car $lim_(x arrow.r +infinity) sqrt(x) = +infinity$ et $frac(sqrt(x), 2) - 3 = +infinity$)

2) $g(x) = frac(x - 2 sqrt(x), 3x - 1)$ , $D_g = [0, +infinity[ backslash {frac(1, 3)}$

   Pour tout $x in ]frac(1, 3), +infinity[$ , $g(x) = frac(x - 2 sqrt(x), 3x - 1) = frac(x(1 - frac(2, sqrt(x))), x(3 - frac(1, x))) = frac(1 - frac(2, sqrt(x)), 3 - frac(1, x))$

   On a $lim_(x arrow.r +infinity) frac(2, sqrt(x)) = 0 arrow.double lim_(x arrow.r +infinity) 1 - frac(2, sqrt(x)) = 1$ et $lim_(x arrow.r +infinity) frac(1, x) = 0 arrow.double lim_(x arrow.r +infinity) 3 - frac(1, x) = 3$

   On obtient donc $lim_(x arrow.r +infinity) g(x) = frac(1, 3)$.

// Source: XY Plus T1 p.50

3) $h(x) = frac(sqrt(x + 3) - 2, x - 1)$, $D_h = [-3, +infinity[ backslash {1}$

   Pour tout $x in D_h$, $h(x) = frac(sqrt(x + 3) - 2, x - 1) = frac((sqrt(x + 3) - 2)(sqrt(x + 3) + 2), (x - 1)(sqrt(x + 3) + 2))$

   $= frac(x + 3 - 4, (x - 1)(sqrt(x + 3) + 2)) = frac(x - 1, (x - 1)(sqrt(x + 3) + 2))$

   $h(x) = frac(1, sqrt(x + 3) + 2)$

   - $lim_(x arrow.r +infinity) h(x) = lim_(x arrow.r +infinity) frac(1, sqrt(x + 3) + 2) = 0$ (car $lim_(x arrow.r +infinity) sqrt(x+3) = +infinity$)

   - $lim_(x arrow.r 1) h(x) = lim_(x arrow.r 1) frac(1, sqrt(x + 3) + 2) = frac(1, 4)$.

// Source: XY Plus T1 p.50-51

4) $k(x) = sqrt(x^2 + 4) - x + 2$ , $D_k = RR$

   $lim_(x arrow.r -infinity) x^2 + 4 = lim_(x arrow.r -infinity) x^2 = +infinity arrow.double lim_(x arrow.r -infinity) sqrt(x^2 + 4) = +infinity$\
   $lim_(x arrow.r -infinity) -x + 2 = lim_(x arrow.r -infinity) -x = +infinity$\
   $arrow.double lim_(x arrow.r -infinity) k(x) = +infinity$

   Pour tout $x > 0$ on a $sqrt(x^2 + 4) > sqrt(x^2) = x > 0$

   $k(x) = sqrt(x^2 + 4) - x + 2 = 2 + (sqrt(x^2 + 4) - x) = 2 + frac((sqrt(x^2 + 4) - x)(sqrt(x^2 + 4) + x), sqrt(x^2 + 4) + x)$

   $= 2 + frac(x^2 + 4 - x^2, sqrt(x^2 + 4) + x) = 2 + frac(4, sqrt(x^2 + 4) + x)$

   Ainsi, pour tout $x > 0$ on a $k(x) = 2 + frac(4, sqrt(x^2 + 4) + x)$.

   $lim_(x arrow.r +infinity) k(x) = lim_(x arrow.r +infinity) (2 + frac(4, sqrt(x^2 + 4) + x)) = 2$

// Source: XY Plus T1 p.51

5) $j(x) = sqrt(2x^2 - 5x + 3) + x$ , $D_j = ]-infinity, 1] union [frac(3, 2), +infinity[$

   Pour tout $x in ]-infinity, 0[$

   $j(x) = sqrt(2x^2 - 5x + 3) + x = sqrt(x^2(2 - frac(5, x) + frac(3, x^2))) + x = sqrt(x^2) sqrt(2 - frac(5, x) + frac(3, x^2)) + x$

   $= |x| sqrt(2 - frac(5, x) + frac(3, x^2)) + x = -x sqrt(2 - frac(5, x) + frac(3, x^2)) + x$ #h(1em) (car $|x| = -x$ lorsque $x < 0$)

   $= -x (sqrt(2 - frac(5, x) + frac(3, x^2)) - 1)$

   $lim_(x arrow.r -infinity) j(x) = lim_(x arrow.r -infinity) -x (sqrt(2 - frac(5, x) + frac(3, x^2)) - 1) = +infinity$

// Source: XY Plus T1 p.51

6) $ell(x) = frac(x^2 + x, x^2 - x - 2)$

   Pour tout $x in RR backslash {-1, 2}$, $ell(x) = frac(x(x + 1), (x + 1)(x - 2)) = frac(x, x - 2)$

   donc $lim_(x arrow.r -1) ell(x) = frac(-1, -3) = frac(1, 3)$.

// Source: XY Plus T1 p.51-52

== Corrige Exercice 2

1) - La courbe $cal(C)_1$ ne coupe pas la droite $Delta : x = 3$\
     donc $f_1$ n'est pas definie en 3.\
     $D_(f_1) = RR backslash {3}$.

   - $lim_(x arrow.r -infinity) f_1(x) = +infinity$ et $lim_(x arrow.r +infinity) f_1(x) = 4$ (lecture graphique, il manque un detail)
   - $lim_(x arrow.r 3^-) f_1(x) = -infinity$ et $lim_(x arrow.r 3^+) f_1(x) = +infinity$
   - Asymptote horizontale : $Delta : y = 4$ en $+infinity$
   - Asymptote verticale : $Delta : x = 3$

2) - La courbe $cal(C)_2$ ne coupe pas la droite $Delta : x = -1$\
     donc $f_2$ n'est pas definie en $-1$.\
     De plus $f_2$ n'est pas definie sur $]-infinity, -1[$.\
     Donc $D_(f_2) = ]-1, +infinity[$.

   - $lim_(x arrow.r (-1)^+) f_2(x) = -infinity$ et $lim_(x arrow.r +infinity) f_2(x) = +infinity$
   - Asymptote verticale : $Delta : x = -1$

// Source: XY Plus T1 p.52

3) - $f_3$ n'est pas definie en 1 et en 0. $D_(f_3) = RR backslash {0, 1}$.

   - $lim_(x arrow.r -infinity) f_3(x) = 0$ et $lim_(x arrow.r +infinity) f_3(x) = 0$
   - $lim_(x arrow.r 0^+) f_3(x) = lim_(x arrow.r 0^-) f_3(x) = -infinity arrow.double lim_(x arrow.r 0) f_3(x) = -infinity$
   - $lim_(x arrow.r 1^+) f_3(x) = 1$ et $lim_(x arrow.r 1^-) f_3(x) = -1$
   - Asymptote horizontale : la droite des abscisses "$y = 0$"
   - Asymptote verticale : la droite des ordonnees "$x = 0$"

   *Attention :* le reel 1 n'appartient pas a $D_f$ mais la droite d'equation $x = 1$ *n'est pas asymptote* puisque $lim_(x arrow.r 1^+) f(x)$ est finie ainsi que $lim_(x arrow.r 1^-) f(x)$.

4) - Le trace de $f_4$ est continu sur $RR$ donc $D_(f_4) = RR$.
   - $lim_(x arrow.r -infinity) f_4(x) = -infinity$ et $lim_(x arrow.r +infinity) f_4(x) = 0$
   - Asymptote horizontale : la droite des abscisses "$y = 0$" en $+infinity$

5) - Le trace de $f_5$ presente une rupture au niveau de $x = 0$ donc $D_(f_5) = RR^*$.
   - $lim_(x arrow.r -infinity) f_5(x) = -infinity$ et $lim_(x arrow.r +infinity) f_4(x) = +infinity$
   - $lim_(x arrow.r 0^+) f(x) = +infinity$ et $lim_(x arrow.r 0^-) f(x) = -infinity$
   - Asymptote verticale : la droite des ordonnees "$x = 0$".

// Source: XY Plus T1 p.52-53

== Corrige Exercice 3

1) Pour tout $x in RR backslash {-2}$ : $f(x) = a x + b + frac(c, x + 2) arrow.l.r.double$

   $frac(x^2 + 3x + 4, x + 2) = frac(a x(x + 2) + b(x + 2) + c, x + 2) arrow.l.r.double$

   $frac(x^2 + 3x + 4, x + 2) = frac(a x^2 + (2a + b)x + 2b + c, x + 2) arrow.l.r.double$

   par identification : $cases(a = 1, 2a + b = 3, 2b + c = 4) arrow.l.r.double cases(a = 1, b = 3 - 2 = 1, c = 4 - 2 = 2)$

   Pour tout $x in RR backslash {-2}$ : $f(x) = x + 1 + frac(2, x + 2)$

2) Pour tout $x in RR backslash {-2}$, $f(x) = x + 1 + frac(2, x + 2)$

   $lim_(x arrow.r +infinity) [f(x) - (x + 1)] = lim_(x arrow.r +infinity) frac(2, x + 2) = lim_(x arrow.r +infinity) frac(2, x) = 0$

   $lim_(x arrow.r -infinity) [f(x) - (x + 1)] = lim_(x arrow.r -infinity) frac(2, x + 2) = lim_(x arrow.r -infinity) frac(2, x) = 0$

   Donc la droite $D : y = x + 1$ est asymptote a la courbe $cal(C)$ au voisinage de $+infinity$ et $-infinity$.

   *Position de $cal(C)$ par rapport a D :*

   Il faut etudier le signe de $f(x) - (x + 1) = frac(2, x + 2)$

   #table(
     columns: 4,
     [$x$], [$-infinity$], [$-2$], [$+infinity$],
     [$frac(2, x + 2)$], [$-$], [], [$+$],
     [Position de $cal(C)$ par rapport a D], [$cal(C)$ est au dessous de D], [], [$cal(C)$ est au dessus de D],
   )

// Source: XY Plus T1 p.53

3) $f(x) = frac(f_1(x), f_2(x))$ ou $f_1$ et $f_2$ deux fonctions polynomes donc continues en 2 et par suite $lim_(x arrow.r (-2)) f_1(x) = f_1(-2) = 2$ et $lim_(x arrow.r (-2)) f_2(x) = f_2(-2) = 0$

   $lim_(x arrow.r (-2)^+) (x^2 + 4x + 3) = 2$\
   $lim_(x arrow.r (-2)^+) (x + 2) = 0^+$\
   $} arrow.double lim_(x arrow.r (-2)^+) f(x) = +infinity$

   $lim_(x arrow.r (-2)^-) (x^2 + 4x + 3) = 2$\
   $lim_(x arrow.r (-2)^-) (x + 2) = 0^-$\
   $} arrow.double lim_(x arrow.r (-2)^-) f(x) = -infinity$

   $cal(C)$ admet une asymptote verticale d'equation $x = -2$

// Source: XY Plus T1 p.53-54

== Corrige Exercice 4

1) a) $D_f = ]-infinity, -4] union [-2, +infinity[$

   #table(
     columns: 5,
     [$x$], [$-infinity$], [$-4$], [$-2$], [$+infinity$],
     [$x^2 + 6x + 8$], [$+$], [$0$], [$0$], [$+$],
   )

   b) $lim_(x arrow.r +infinity)(x^2 + 6x + 8) = lim_(x arrow.r +infinity) x^2 = +infinity arrow.double lim_(x arrow.r +infinity) sqrt(x^2 + 6x + 8) = +infinity arrow.double lim_(x arrow.r +infinity) f(x) = +infinity$

   $lim_(x arrow.r -infinity)(x^2 + 6x + 8) = lim_(x arrow.r -infinity) x^2 = +infinity arrow.double lim_(x arrow.r -infinity) sqrt(x^2 + 6x + 8) = +infinity arrow.double lim_(x arrow.r -infinity) f(x) = +infinity$

2) - Calcul de $lim_(x arrow.r -infinity) (f(x) + (x + 3))$ :

   On a : pour tout $x in ]-infinity, -4]$, $sqrt(x^2 + 6x + 8) + (x + 3) eq.not 0$.

   $lim_(x arrow.r -infinity)(f(x) + (x + 3)) = lim_(x arrow.r -infinity)(sqrt(x^2 + 6x + 8) + (x + 3))$

   $= lim_(x arrow.r -infinity) frac((sqrt(x^2 + 6x + 8) + (x + 3))(sqrt(x^2 + 6x + 8) - (x + 3)), sqrt(x^2 + 6x + 8) - (x + 3))$

   $= lim_(x arrow.r -infinity) frac(x^2 + 6x + 8 - x^2 - 6x - 9, sqrt(x^2 + 6x + 8) - (x + 3)) = lim_(x arrow.r -infinity) frac(-1, sqrt(x^2 + 6x + 8) - (x + 3))$

   or $lim_(x arrow.r -infinity) sqrt(x^2 + 6x + 8) = +infinity$ et $lim_(x arrow.r -infinity) -(x + 3) = lim_(x arrow.r -infinity)(-x) = +infinity$ d'ou

   $lim_(x arrow.r -infinity) sqrt(x^2 + 6x + 8) - (x + 3) = +infinity$ donc $lim_(x arrow.r -infinity) frac(-1, sqrt(x^2 + 6x + 8) - (x + 3)) = 0$

   $lim_(x arrow.r -infinity)(f(x) + (x + 3)) = 0$ donc la droite $D : y = -x - 3$ est asymptote a $cal(C)$ au voisinage de $-infinity$.

// Source: XY Plus T1 p.54

   - Calcul de $lim_(x arrow.r +infinity) (f(x) - (x + 3))$ :

   Pour tout $x in [-2, +infinity[$, $sqrt(x^2 + 6x + 8) + (x + 3) eq.not 0$.

   $lim_(x arrow.r +infinity)(f(x) - (x + 3)) = lim_(x arrow.r +infinity)(sqrt(x^2 + 6x + 8) - (x + 3))$

   $= lim_(x arrow.r +infinity) frac((sqrt(x^2 + 6x + 8) - (x + 3))(sqrt(x^2 + 6x + 8) + (x + 3)), sqrt(x^2 + 6x + 8) + (x + 3))$

   $= lim_(x arrow.r +infinity) frac(x^2 + 6x + 8 - x^2 - 6x - 9, sqrt(x^2 + 6x + 8) + (x + 3)) = lim_(x arrow.r +infinity) frac(-1, sqrt(x^2 + 6x + 8) + (x + 3))$

   or $lim_(x arrow.r +infinity) sqrt(x^2 + 6x + 8) = +infinity$ et $lim_(x arrow.r +infinity)(x + 3) = +infinity$ d'ou

   $lim_(x arrow.r +infinity) sqrt(x^2 + 6x + 8) + (x + 3) = +infinity$ donc $lim_(x arrow.r +infinity) frac(-1, sqrt(x^2 + 6x + 8) + (x + 3)) = 0$

   $lim_(x arrow.r +infinity)(f(x) - (x + 3)) = 0$ donc la droite $D' : y = x + 3$ est asymptote a $cal(C)$ au voisinage de $+infinity$.

3) a) $x^2 + 6x + 8 = (x + 3)^2 - 9 + 8 = (x + 3)^2 - 1 < (x + 3)^2$

   Pour tout reel $x$, $x^2 + 6x + 8 < (x + 3)^2$.

   b) Pour tout reel $x$, $x^2 + 6x + 8 < (x + 3)^2 arrow.double sqrt(x^2 + 6x + 8) < sqrt((x + 3)^2)$

   $arrow.double sqrt(x^2 + 6x + 8) < |x + 3|$

   Donc pour tout reel $x$, $f(x) < |x + 3|$

   Si $x in [-2, +infinity[$ , $f(x) < x + 3$ alors $cal(C)$ est au dessous de l'asymptote $D'$.

   Si $x in ]-infinity, -4]$ , $f(x) < -x - 3$ alors $cal(C)$ est au dessous de l'asymptote $D$.

// Source: XY Plus T1 p.55

== Corrige Exercice 5

1) a) $D_f = RR$ car $4x^2 - 4x + 3 > 0$ ($Delta' = 4 - 12 = -8 < 0$ et $a = 4 > 0$).

   b) $lim_(x arrow.r +infinity)(4x^2 - 4x + 3) = lim_(x arrow.r +infinity) 4x^2 = +infinity arrow.double lim_(x arrow.r +infinity) sqrt(4x^2 - 4x + 3) = +infinity arrow.double lim_(x arrow.r +infinity) f(x) = +infinity$

   $lim_(x arrow.r -infinity)(4x^2 - 4x + 3) = lim_(x arrow.r -infinity) x^2 = +infinity arrow.double lim_(x arrow.r -infinity) sqrt(4x^2 - 4x + 3) = +infinity arrow.double lim_(x arrow.r -infinity) f(x) = +infinity$

2) $4x^2 - 4x + 3 = (2x - 1)^2 - 1 + 3 = (2x - 1)^2 + 2$.

3) $h(x) = f(x) - sqrt((2x - 1)^2)$

   $lim_(x arrow.r -infinity) sqrt(4x^2 - 4x + 3) - sqrt((2x - 1)^2)$

   $= lim_(x arrow.r -infinity) sqrt((2x - 1)^2 + 2) - sqrt((2x - 1)^2)$

   $= lim_(x arrow.r -infinity) frac(2, sqrt((2x - 1)^2 + 2) + sqrt((2x - 1)^2))$

   or $lim_(x arrow.r -infinity)(2x - 1)^2 = +infinity arrow.double lim_(x arrow.r -infinity) sqrt((2x - 1)^2) = +infinity$ et $lim_(x arrow.r -infinity) sqrt((2x - 1)^2 + 2) = +infinity$

   d'ou $lim_(x arrow.r -infinity) sqrt((2x - 1)^2 + 2) + sqrt((2x - 1)^2) = +infinity$.

   Il en resulte que $lim_(x arrow.r -infinity) frac(2, sqrt((2x - 1)^2 + 2) + sqrt((2x - 1)^2)) = 0$

   $lim_(x arrow.r +infinity) sqrt(4x^2 - 4x + 3) - sqrt((2x - 1)^2) = lim_(x arrow.r +infinity) frac(2, sqrt((2x - 1)^2 + 2) + sqrt((2x - 1)^2))$

   or $lim_(x arrow.r +infinity)(2x - 1)^2 = +infinity arrow.double lim_(x arrow.r +infinity) sqrt((2x - 1)^2) = +infinity$ et $lim_(x arrow.r +infinity) sqrt((2x - 1)^2 + 2) = +infinity$

   d'ou $lim_(x arrow.r +infinity) sqrt((2x - 1)^2 + 2) + sqrt((2x - 1)^2) = +infinity$.

   Il en resulte que $lim_(x arrow.r +infinity) frac(2, sqrt((2x - 1)^2 + 2) + sqrt((2x - 1)^2)) = 0$

   $lim_(x arrow.r +infinity) h(x) = 0$ et $lim_(x arrow.r -infinity) h(x) = 0$

   - $lim_(x arrow.r +infinity) f(x) - sqrt((2x - 1)^2) = 0 arrow.double lim_(x arrow.r +infinity) f(x) - |2x - 1| = 0 arrow.double lim_(x arrow.r +infinity) f(x) - (2x - 1) = 0$\
     Donc la droite $D_1 : y = 2x - 1$ est asymptote a $cal(C)$ au voisinage de $+infinity$.

   - $lim_(x arrow.r -infinity) f(x) - sqrt((2x - 1)^2) = 0 arrow.double lim_(x arrow.r -infinity) f(x) - |2x - 1| = 0 arrow.double lim_(x arrow.r -infinity) f(x) - (-2x + 1) = 0$\
     Donc la droite $D_2 : y = -2x + 1$ est asymptote a $cal(C)$ au voisinage de $-infinity$.

4) Pour tout reel $x$, $f(x) - sqrt((2x - 1)^2) = frac(2, sqrt((2x - 1)^2 + 2) + sqrt((2x - 1)^2)) > 0$

   D'ou pour tout reel $x$, $f(x) > sqrt((2x - 1)^2)$ donc $f(x) > |2x - 1|$

   - Si $x in [frac(1, 2), +infinity[$ , $f(x) > 2x - 1$ et si $x in ]-infinity, frac(1, 2)]$ on a $f(x) > underline(2x - 1)_(> 0)$

   Donc pour tout reel $x$ , $f(x) > 2x - 1$ d'ou $cal(C)$ est au dessus de $D_1$.

   - $x in ]-infinity, frac(1, 2)]$ , $|2x - 1| = -2x + 1$ d'ou $f(x) > -2x + 1$ et d'autre part si $x in [frac(1, 2), +infinity[$ alors $f(x) > underline(-2x + 1)_(< 0)$ d'ou pour tout reel $x$ $f(x) > -2x + 1$ donc

   $cal(C)$ est au dessus de $D_2$.

   Conclusion : La courbe $cal(C)$ est au dessus de ses asymptotes.

// Source: XY Plus T1 p.56

== Corrige Exercice 6

$f(x) = -x + sqrt(x^2 - 4)$ , $D_f = ]-infinity, -2] union [2, +infinity[$

1) $lim_(x arrow.r -infinity)(x^2 - 4) = lim_(x arrow.r -infinity) x^2 = +infinity arrow.double lim_(x arrow.r -infinity) sqrt(x^2 - 4) = +infinity$ et $lim_(x arrow.r -infinity) -x = +infinity$ donc\
   $lim_(x arrow.r -infinity) f(x) = +infinity$.

2) a) Pour tout $x in [2, +infinity[$, $sqrt(x^2 - 4) + x eq.not 0$

   $f(x) = sqrt(x^2 - 4) - x = frac((sqrt(x^2 - 4) - x)(sqrt(x^2 - 4) + x), sqrt(x^2 - 4) + x) = frac(-4, sqrt(x^2 - 4) + x)$

   b) $lim_(x arrow.r +infinity) f(x) = lim_(x arrow.r +infinity) frac(-4, sqrt(x^2 - 4) + x)$

   $lim_(x arrow.r +infinity)(x^2 - 4) = lim_(x arrow.r +infinity) x^2 = +infinity arrow.double lim_(x arrow.r +infinity) sqrt(x^2 - 4) = +infinity$ et $lim_(x arrow.r +infinity) x = +infinity$

   $arrow.double lim_(x arrow.r +infinity) sqrt(x^2 - 4) + x = +infinity arrow.double lim_(x arrow.r +infinity) frac(-4, sqrt(x^2 - 4) + x) = 0$ d'ou $lim_(x arrow.r +infinity) f(x) = 0$

   Interpretation graphique :
   La droite des abscisses "$y = 0$" est asymptote a la courbe de $f$ au voisinage de $+infinity$.

3) $lim_(x arrow.r -infinity) [f(x) + 2x] = lim_(x arrow.r -infinity) [sqrt(x^2 - 4) + x]$

   $= lim_(x arrow.r -infinity) frac([sqrt(x^2 - 4) + x][sqrt(x^2 - 4) - x], sqrt(x^2 - 4) - x)$

   $= lim_(x arrow.r -infinity) frac(-4, sqrt(x^2 - 4) - x) = 0$ car $lim_(x arrow.r -infinity)(sqrt(x^2 - 4) - x) = +infinity$

   D'ou la droite $D : y = -2x$ est asymptote oblique a la courbe $cal(C)$ au voisinage de $-infinity$.

// Source: XY Plus T1 p.56-57

== Corrige Exercice 7

1) a) Pour tout $x lt.eq 1$ on a $x^2 + 1 eq.not 0$ et pour tout $x > 1$ on a $x^2 - x > 0$ donc $D_f = RR$

   b) $x arrow.bar frac(2x, x^2 + 1)$ est continue sur $RR$ donc sur $]-infinity, 1]$

   $x arrow.bar x^2 - x$ est continue et strictement positive sur $]1, +infinity[$ donc $x arrow.bar sqrt(x^2 - x)$ est continue et ne s'annule pas sur $]1, +infinity[$ , or

   $lim_(x arrow.r 1^+) f(x) = lim_(x arrow.r 1^+) (x - frac((x + 1) sqrt(x^2 - x), x)) = 1 = f(1)$ donc $f$ est continue a droite en 1

   d'ou $f$ est continue sur $RR$.

2) a) $f(x) - 1 = -frac((x - 1)^2, x^2 + 1) lt.eq 0$ donc $f(x) lt.eq 1$ et $f(x) + 1 = frac((x + 1)^2, x^2 + 1) gt.eq 0$ donc $f(x) gt.eq -1$

   Donc $f$ est majoree par 1 et minoree par $-1$ sur $]-infinity, 1]$

   b) $f$ est continue sur $]-infinity, 1]$ et pour tout $x$ de $]-infinity, 1]$ on a $-1 lt.eq f(x) lt.eq 1$

   Comme $f(-1) = -1$ et $f(1) = 1$ donc $f(]-infinity, 1]) = [-1, 1]$.

// Source: XY Plus T1 p.57

3) $f$ est continue sur $[frac(3, 2), 2]$ , $f(frac(3, 2)) approx 0.056$ et $f(2) approx -0.121$

   $f(frac(3, 2)) times f(2) < 0$ donc l'equation $f(x) = 0$ admet au moins une solution $alpha$ dans l'intervalle $[frac(3, 2), 2]$.

4) $lim_(x arrow.r -infinity) f(x) = lim_(x arrow.r -infinity) frac(2x, x^2) = lim_(x arrow.r -infinity) frac(2, x) = 0$

   $lim_(x arrow.r +infinity) (f(x) - x) = lim_(x arrow.r +infinity) frac(frac(1, x) - x, sqrt(1 - frac(1, x))) = -infinity$

   $lim_(x arrow.r +infinity) f(x) = lim_(x arrow.r +infinity) frac(-1 + frac(2, x) - frac(1, x^3), sqrt(frac(1, x)) (sqrt(1 - frac(1, x)) + 1 - frac(1, x^2))) = -frac(1, 2)$

// Source: XY Plus T1 p.57-58

== Corrige Exercice 8

1) $lim_(x arrow.r 0^-) f(x) = lim_(x arrow.r 0^-) frac(x^2 - x + 1, x^2 + 1) = 1 = f(0)$ et $lim_(x arrow.r 0^+) f(x) = lim_(x arrow.r 0^+) x + sqrt(x^2 + x + 1) = 1 = f(0)$

   donc $f$ est continue en 0.

2) $x arrow.bar frac(x^2 - x + 1, x^2 + 1)$ est continue sur $]-infinity, 0]$ et $x arrow.bar x + sqrt(x^2 + x + 1)$ est continue et positive sur $]0, +infinity[$ donc $x arrow.bar x + sqrt(x^2 + x + 1)$ est continue sur $]0, +infinity[$ or $f$ est continue en 0 donc $f$ est continue sur $RR$.

3) $lim_(x arrow.r -infinity) f(x) = lim_(x arrow.r -infinity) frac(x^2, x^2) = 1$

4) a) $lim_(x arrow.r +infinity) f(x) = +infinity$

   b) $lim_(x arrow.r +infinity) (f(x) - (2x + frac(1, 2))) = lim_(x arrow.r +infinity) (frac(x + 1, sqrt(x^2 + x + 1 + x)) - frac(1, 2))$

   $= lim_(x arrow.r +infinity) (frac(1 + frac(1, x), sqrt(1 + frac(1, x) + frac(1, x^2)) + 1) - frac(1, 2)) = 0$

   donc $Delta : y = 2x + frac(1, 2)$ est une asymptote a la courbe de $f$ au voisinage de $+infinity$.

// Source: XY Plus T1 p.58

== Corrige Exercice 9

*I/*

1) $lim_(x arrow.r +infinity) f(x) = lim_(x arrow.r +infinity) frac(3, sqrt(x + 3) + sqrt(x)) = 0$ donc la droite $y = 0$ est une asymptote a la courbe de $f$ au voisinage de $+infinity$.

2) Pour $x gt.eq 0$ on a $sqrt(3 + x) + sqrt(x) gt.eq sqrt(3)$ donc $0 lt.eq f(x) lt.eq sqrt(3)$

3) $f$ est continue sur $[6, 8]$ , $f(6) approx 0,55$ et $f(8) approx 0,48$. $f(8) < 0,5 < f(6)$ donc l'equation $f(x) = 0,5$ admet au moins une solution dans $[6, 8]$.

*II/*

1) $D_g = RR backslash {-1, 0}$

2) $lim_(x arrow.r 1) g(x) = -frac(1, 2)$ ; $lim_(x arrow.r 0) g(x) = lim_(x arrow.r 0) frac(-2x^2 - x + 2, x + 1) = 2$

   $lim_(x arrow.r (-1)^-) g(x) = -infinity$ ; $lim_(x arrow.r (-1)^+) g(x) = +infinity$ donc la droite d'equation $x = -1$ est une asymptote verticale a la courbe de $f$.

*III/*

1) $x arrow.bar sqrt(x + 3) - sqrt(x)$ est continue sur $]1, +infinity[$ ; $x arrow.bar -2x + 1$ est continue sur $]-infinity, 1[$

   $lim_(x arrow.r 1^-) h(x) = lim_(x arrow.r 1^-) (-2x + 1) = -1 = h(1)$ et $lim_(x arrow.r 1^+) h(x) = lim_(x arrow.r 1^+) sqrt(x + 3) - sqrt(x) = 1 eq.not h(1)$

   donc $h$ est continue sur chacun des intervalles $]-infinity, 1[$ et $]1, +infinity[$.

2) a) $lim_(x arrow.r 1^+) F(x) = lim_(x arrow.r 1^-) F(x) = 0$ donc $lim_(x arrow.r 1) F(x) = 0$

   b) $lim_(x arrow.r 1^+) frac(F(x), x - 1) = lim_(x arrow.r 1^+) h(x) = 1$ et $lim_(x arrow.r 1^-) frac(F(x), x - 1) = lim_(x arrow.r 1^-) -h(x) = 1$ donc $lim_(x arrow.r 1) frac(F(x), x - 1) = 1$

   c) $h(]-infinity, -2]) = [5, +infinity[$
