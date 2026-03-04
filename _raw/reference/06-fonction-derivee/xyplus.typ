// =============================================================================
// Transcription fidele : XY Plus 3eme Math Tome 1 — Chapitre 6
// Fonction Derivee
// Source : CAEU Med Ali, pages 74 a 95
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

#align(center, text(size: 18pt, weight: "bold")[Chapitre 6])
#align(center, text(size: 16pt, weight: "bold")[Fonction Derivee])

#v(1em)

// Source: XY Plus T1 p.74

= 1. Fonction derivee

#definition-block[
  *Definition*

  Soit $f$ une fonction definie et derivable sur un intervalle $I$.

  On appelle fonction derivee de $f$ et on note $f'$ la fonction qui a tout reel $x$, appartenant a $I$, associe le nombre derive $f'(x)$ de $f$ en $x$.
]

// Source: XY Plus T1 p.74

= 2. Operations sur les fonctions derivees

$arrow.r.double$ Soit $f$ et $g$ deux fonctions derivables sur un intervalle $I$, $alpha$ et $beta$ deux reels.

- Les fonctions $f + g$, $f g$, $alpha f + beta g$ sont derivables sur $I$ et on a :

  $(f + g)' = f' + g'$ #h(1em) ; #h(1em) $(f g)' = f' g + g' f$ #h(1em) ; #h(1em) $(alpha f + beta g)' = alpha f' + beta g'$.

- Pour tout entier naturel $k gt.eq 2$, la fonction $f^k$ est derivable sur $I$ et on a $(f^k)' = k f' f^(k-1)$.

  En particulier toute fonction polynome est derivable sur $RR$.

#v(0.5em)

$arrow.r.double$ Soient $f$ et $g$ deux fonctions derivables sur un intervalle $I$ telles que $g$ ne s'annule pas sur $I$.

- Les fonctions $frac(1, g)$ et $frac(f, g)$ sont derivables sur $I$ et on a :

  $lr((frac(1, g)))' = frac(-g', g^2)$ #h(1em) ; #h(1em) $lr((frac(f, g)))' = frac(f' g - g' f, g^2)$

- Pour tout entier naturel $k gt.eq 1$, la fonction $frac(1, g^k)$ est derivable sur $I$ et on a :

  $lr((frac(1, g^k)))' = frac(-k g', g^(k+1))$

// Source: XY Plus T1 p.74

= 3. Derivee de la fonction $sqrt(f)$

#theoreme-block[
  *Theoreme*

  Soit $f$ une fonction derivable et strictement positive sur un intervalle $I$.

  Alors la fonction $sqrt(f)$ est derivable sur $I$ et on a $(sqrt(f))' = frac(f', 2 sqrt(f))$.
]

// Source: XY Plus T1 p.74

= 4. Derivee de la fonction $x arrow.r.bar f(a x + b)$

#theoreme-block[
  *Theoreme*

  Soit $f$ une fonction derivable sur un intervalle $I$ et soient $a$ et $b$ deux reels.

  Alors la fonction $g : x arrow.r.bar f(a x + b)$ est derivable en tout reel $x$ tel que $a x + b$ appartient a $I$. De plus la fonction $g'$ est definie par $g'(x) = a f'(a x + b)$.
]

// Source: XY Plus T1 p.75

= 5. Sens de variation

#theoreme-block[
  *Theoreme*

  Soit $f$ une fonction derivable sur un intervalle $I$.

  - La fonction $f$ est constante sur $I$, si et seulement si, pour tout $x a in I$, $f'(x) = 0$

  - La fonction $f$ est croissante sur $I$, si et seulement si, pour tout $x in I$, $f'(x) gt.eq 0$.

  - La fonction $f$ est decroissante sur $I$, si et seulement si, pour tout $x in I$, $f'(x) lt.eq 0$
]

// Source: XY Plus T1 p.75

= 6. Extrema

== Extremum local : Definition

#definition-block[
  *Definition*

  Soit $f$ une fonction definie sur un intervalle $I$ et $x_0$ un reel de $I$.

  - On dit que $f$ admet un maximum local en $x_0$ s'il existe un intervalle ouvert $J$ contenant $x_0$ et inclus dans $I$ tel que pour tout $x in J$ ; $f(x) lt.eq f(x_0)$

  - On dit que $f$ admet un minimum local en $x_0$ s'il existe un intervalle $J$ contenant $x_0$ et inclus dans $I$ tel que pour tout $x in J$ ; $f(x) gt.eq f(x_0)$

  Lorsque $f$ admet un minimum ou un maximum local en $x_0$ on dit que $f$ admet un extremum local en $x_0$.
]

#v(0.5em)

*Exemple*

// Tableau de variation de l'exemple
#table(
  columns: 7,
  align: center,
  stroke: 0.5pt,
  [$x$], [$-infinity$], [$-1$], [$1$], [$2$], [$3$], [$4$],
  [$f'(x)$], [$+$], [$+$], [$0$], [$-$], [$0$], [$+$],
)

// Figure : courbe avec extrema locaux
#cetz.canvas({
  import cetz.draw: *

  // Axes
  line((-1.5, 0), (5, 0), mark: (end: ">"))
  line((0, -2), (0, 5), mark: (end: ">"))
  content((0.2, -0.3), $O$)

  // Graduations
  content((1, -0.3), $1$)
  content((2, -0.3), $2$)
  content((4, -0.3), $4$)
  content((-0.3, 4), $4$)
  content((-0.3, 3), $3$)
  content((-0.3, -1), $-1$)

  // Courbe passant par (1, 4) max local et (3, -1) min local
  bezier((-1, -1), (1, 4), (0, 3), (0.5, 4))
  bezier((1, 4), (3, -1), (1.5, 2), (2.5, -1))
  bezier((3, -1), (4.5, 3), (3.5, 0), (4, 2))

  // Points remarquables
  circle((1, 4), radius: 0.07, fill: black)
  circle((3, -1), radius: 0.07, fill: black)

  // Label courbe
  content((5, 3), $cal(C)$)

  // Annotation
  content((6, 1), text(size: 7pt)[les extrema sont representes\ par des sommets])
})

#v(0.5em)

$arrow.r$ sur $]-1, 2[$, pour tout $x in ]-1, 2[$ ; $f(x) lt.eq f(1)$ donc $f$ admet un maximum local en $1$ qui est egal a $f(1) = 4$

$arrow.r$ Sur $]2, 4[$ : pour tout $x in ]2, 4[$ ; $f(x) gt.eq f(3)$ donc $f$ admet un minimum local en $3$ qui est egal a $f(3) = -1$.

// Source: XY Plus T1 p.75-76

== Extremum absolu

#definition-block[
  *Definition*

  Soit $f$ une fonction definie sur un intervalle $I$, $x_0 in I$

  - On dit que $f$ admet un maximum absolu en $x_0$ ssi pour tout $x in I$, $f(x) lt.eq f(x_0)$

  - On dit que $f$ admet un minimum absolu en $x_0$ ssi pour tout $x in I$, $f(x) gt.eq f(x_0)$
]

// Source: XY Plus T1 p.76

$arrow.r.double$ *Exemple :*

// Exemple minimum absolu
#table(
  columns: 4,
  align: center,
  stroke: 0.5pt,
  [$x$], [$-infinity$], [$-2$], [$0$],
  [$f'(x)$], [$-$], [$0$], [$+$],
)

On a $f$ definie sur $]-infinity, 0]$ pour tout $x in ]-infinity, 0]$, $f(x) gt.eq f(-2)$ donc $f$ admet un minimum absolu en $-2$ qui est egal a $f(-2) = 1$

// Figure : minimum absolu
#cetz.canvas({
  import cetz.draw: *

  // Axes
  line((-3, 0), (1.5, 0), mark: (end: ">"))
  line((0, -0.5), (0, 5), mark: (end: ">"))
  content((0.2, -0.3), $O$)

  // Courbe decroissante de +inf, min en -2 (valeur 1), puis croissante vers 4
  bezier((-2.5, 4.5), (-1.5, 1), (-2, 1.5))
  bezier((-1.5, 1), (0, 4), (-0.5, 1.5))

  // Point minimum
  circle((-1.5, 1), radius: 0.07, fill: black)

  // Labels
  content((-1.5, -0.3), $-2$)
  content((-0.3, 1), $1$)
  content((-0.3, 4), $4$)

  // Label courbe
  content((1, 4), $cal(C)$)
})

Le minimum absolu represente par un creux.

#v(0.5em)

// Exemple maximum absolu
#table(
  columns: 4,
  align: center,
  stroke: 0.5pt,
  [$x$], [$-infinity$], [$1$], [$+infinity$],
  [$f'(x)$], [$+$], [$0$], [$-$],
)

On a pour tout $x in D_f = RR$, $f(x) lt.eq f(1)$ donc $f$ admet un maximum absolu en $1$ qui est egal a $f(1) = -1$

// Figure : maximum absolu
#cetz.canvas({
  import cetz.draw: *

  // Axes
  line((-3, 0), (3, 0), mark: (end: ">"))
  line((0, -3), (0, 1), mark: (end: ">"))
  content((0.2, -0.3), $O$)

  // Courbe croissante puis decroissante, max en (1, -1)
  bezier((-2.5, -3), (1, -1), (-0.5, -1.5))
  bezier((1, -1), (2.5, -3), (1.5, -1.2), (2, -2))

  // Point maximum
  circle((1, -1), radius: 0.07, fill: black)

  // Labels
  content((1, -0.3), $1$)
  content((-0.3, -1), $-1$)
  content((-2, -0.3), $-2$)

  // Label courbe
  content((2.5, -2), $cal(C)$)
})

Le maximum absolu represente par un sommet.

// Source: XY Plus T1 p.76

#theoreme-block[
  *Theoreme :*

  Soit $f$ une fonction derivable sur un intervalle et $x_0 in I$

  - Si $f$ admet un extremum local en $x_0$ alors $f'(x_0) = 0$

  - Si $f'$ s'annule en $x_0$ en changeant de signe alors $f$ admet un extremum local en $x_0$.
]

// Cas 1 : maximum local (f' passe de + a -)
#table(
  columns: 4,
  align: center,
  stroke: 0.5pt,
  [$x$], [$x_0 - alpha$], [$x_0$], [$x_0 + alpha$],
  [$f'(x)$], [$+$], [$0$], [$-$],
  [$f(x)$], [$nearrow$], [$f(x_0)$], [$searrow$],
)

// Cas 2 : minimum local (f' passe de - a +)
#table(
  columns: 4,
  align: center,
  stroke: 0.5pt,
  [$x$], [$x_0 - alpha$], [$x_0$], [$x_0 + alpha$],
  [$f'(x)$], [$-$], [$0$], [$+$],
  [$f(x)$], [$searrow$], [$f(x_0)$], [$nearrow$],
)

$(alpha > 0)$

// =============================================================================
// EXERCICES — ENONCES
// =============================================================================

#pagebreak()

#align(center, text(size: 18pt, weight: "bold")[EXERCICES])

#v(1em)

// Source: XY Plus T1 p.77
// La page 77 contient le titre EXERCICES et le debut coupe "Determiner les i..."
// Les exercices 1 a 5 ne sont pas visibles (pages manquantes ou coupees).

// Source: XY Plus T1 p.78

== Exercice 6

Soit $f$ une fonction dont la representation graphique est donnee par la figure ci-contre :

1) Interpreter graphiquement la derivabilite de $f$ aux points d'abscisses $0$, $-3$ et $4$

2) Dresser le tableau de variation de $f$

3) $f$ admet $-$ t $-$ elle un extremum en $4$ ?

4) Preciser alors les extremums de $f$

// Figure exercice 6 : courbe avec points anguleux en 0 et 4
#cetz.canvas({
  import cetz.draw: *

  // Axes
  line((-6, 0), (5.5, 0), mark: (end: ">"))
  line((0, -0.5), (0, 4), mark: (end: ">"))
  content((0.2, -0.3), $O$)

  // Graduations x
  for val in (-5, -3, -1, 2, 4) {
    line((val, -0.1), (val, 0.1))
  }
  content((-5, -0.4), $-5$)
  content((-3, -0.4), $-3$)
  content((-1, -0.4), $-1$)
  content((1, -0.4), $arrow(i)$)
  content((2, -0.4), $2$)
  content((4, -0.4), $4$)

  // Graduations y
  content((-0.3, 1), $1$)
  content((-0.3, 2), $2$)
  content((-0.3, 3), $3$)

  // Courbe
  // De -5 remonte vers (-3, 0.5) tangente horizontale
  bezier((-5.5, 0.5), (-3, 3), (-4.5, 1), (-3.5, 3))
  // De (-3, 3) descend vers (0, 0.5) point anguleux
  bezier((-3, 3), (0, 0.5), (-1.5, 0.5))
  // De (0, 0.5) monte vers (1, 3) tangente horizontale
  bezier((0, 0.5), (1, 3), (0.3, 2), (0.8, 3))
  // De (1, 3) descend vers (4, 0.5) point anguleux
  bezier((1, 3), (4, 0.5), (2, 2), (3.5, 0.5))
  // De (4, 0.5) remonte
  bezier((4, 0.5), (5.2, 1.5), (4.5, 0.4), (5, 1))
})

#v(1em)

// Source: XY Plus T1 p.78

== Exercice 7

On donne le tableau de variation de $f$ :

#table(
  columns: 8,
  align: center,
  stroke: 0.5pt,
  [$x$], [$-infinity$], [], [$-2$], [$-1$], [$0$], [$1$], [], [$2$], [], [$+infinity$],
  [$f'(x)$], [], [$+$], [$0$], [$-$], [$-3$], [$-$], [||], [$0$], [$+$], [],
)

// Tableau de variation de f (description textuelle)
// f croit de 1 a 3 sur ]-inf, -2[
// f decroit de 3 a +inf puis de +inf a 0 sur ]-2, 0[
// Asymptote verticale en x = -1
// f(0) = +inf, valeur en 0: 3 environ
// f decroit de +inf a -2 sur ]0, 2[
// puis f croit de -2 a -1 sur ]2, +inf[

1) Donner les ensembles de definition de $f$ et de $f'$.

2) Quelles sont les limites aux bornes de la fonction $f$ ? Donner les equations des asymptotes a la courbe representative de $f$.

3) Ecrire les equations des tangentes a la courbe representant $f$ que le tableau de variation permet de connaitre.

4) Quel est le nombre des racines de l'equation $f(x) = 0$ ? Donner pour chaque racine un encadrement par deux entiers consecutifs.

5) Tracer la courbe $cal(C)$ de $f$ dans un repere orthonorme $(O, arrow(i), arrow(j))$.

// Source: XY Plus T1 p.78

== Exercice 8

Le graphique donne ci-dessous est celui de $Gamma$ courbe representative d'une fonction definie sur $[0, 4]$ et de ses tangentes aux points d'abscisses $1$ et $frac(3, 2)$.

// Figure exercice 8 : courbe Gamma avec tangentes en A et B
#cetz.canvas({
  import cetz.draw: *

  // Axes
  line((-0.5, 0), (5, 0), mark: (end: ">"))
  line((0, -2), (0, 3), mark: (end: ">"))
  content((0.2, -0.3), $O$)

  // Graduations
  line((0.5, -0.1), (0.5, 0.1))
  line((1, -0.1), (1, 0.1))
  line((1.5, -0.1), (1.5, 0.1))
  line((3, -0.1), (3, 0.1))
  content((0.5, -0.4), $frac(1, 2)$)
  content((1, -0.4), $1$)
  content((1.5, -0.4), $frac(3, 2)$)
  content((3, -0.4), $3$)
  content((-0.3, 1), $arrow(j)$)
  content((1, -0.6), $arrow(i)$)
  content((-0.3, 2), $2$)
  content((-0.3, 1), $1$)

  // Courbe Gamma
  bezier((0, -1.5), (1, 1), (0.3, 0), (0.7, 0.8))
  bezier((1, 1), (1.5, 1.5), (1.2, 1.2))
  bezier((1.5, 1.5), (4, -0.5), (2.5, 1.2), (3.5, 0))

  // Points A et B
  circle((1, 1), radius: 0.07, fill: black)
  content((1.2, 1.3), $A$)
  circle((1.5, 1.5), radius: 0.07, fill: black)
  content((1.7, 1.8), $B$)

  // Tangente en A (pente = 1, passe par l'origine)
  line((0, 0), (2, 2), stroke: (dash: "dashed"))

  // Tangente en B (pente negative)
  line((0.8, 2.2), (2.8, 0.2), stroke: (dash: "dashed"))
})

// Source: XY Plus T1 p.79

1) Lire graphiquement $f(1)$, $f'(1)$ et $f'(frac(3, 2))$.

2) Donner une equation de la tangente au point d'abscisse $1$.

3) Parmi les trois courbes donnees ci-dessous laquelle est la representation graphique de $f'$.

// Trois courbes candidates pour f'
// Courbe 1 : courbe en cloche positive puis negative
// Courbe 2 : courbe decroissante passant par zero vers x = 3/2
// Courbe 3 : courbe croissante partant de zero

// Source: XY Plus T1 p.79

== Exercice 9

Soit $f : x arrow.r.bar frac(x^2 - 3x + 3, x - 1)$

1) Montrer que $f$ est derivable sur $RR backslash {1}$ et calculer $f'(x)$

2) a) Dresser le tableau de variations de $f$.

#h(1em) b) En deduire les solutions du systeme : $cases(f(x) < 1, f(x) > -3)$

3) Soit $g : x arrow.r.bar frac(x^2 - 3x + 3, |x - 1|)$

#h(1em) a) Dresser le tableau de variations de $g$

#h(1em) b) En deduire que pour tout $x, y in ]0, frac(pi, 2)]$ : si $x < y$ alors $g(cos x) > g(cos y)$.

// Source: XY Plus T1 p.79

== Exercice 10

Le plan est muni d'un repere orthonorme $(O, arrow(i), arrow(j))$.

Soit le point $A(1, 8)$ et $alpha$ un reel different de $0$ et de $8$.

Soit $D_alpha$ la droite passant par $A$ et de coefficient directeur $alpha$.

1) Verifier que $D_alpha$ a pour equation $y = alpha x + 8 - alpha$.

2) On designe par $M$ et $N$ les points d'intersection de $D_alpha$ respectivement avec l'axe des abscisses et l'axe des ordonnees.

#h(1em) a) Determiner les coordonnees des points $M$ et $N$ en fonction de $alpha$.

#h(1em) b) Montrer que $M N^2 = (alpha - 8)^2 (frac(1, alpha^2) + 1)$ en fonction de $alpha$.

#h(1em) c) Determiner $alpha$ pour que la distance $M N$ soit minimale.

// Source: XY Plus T1 p.80

== Exercice 11

1) Soit la fonction $g$ definie sur $RR$ par : $g(x) = x^3 + 3x - 2$.

#h(1em) 1-a- Dresser le tableau de variation de $g$.

#h(1em) b- Montrer que l'equation $g(x) = 0$ admet dans $RR$ une solution unique $alpha$ et que $0 comma 5 < alpha < 0 comma 6$.

#h(1em) c- En deduire le signe de $g(x)$ suivant les valeurs de $x$.

2- Soit la fonction $f$ definie sur $RR$ par : $f(x) = a x - frac(x + b, x^2 + 1)$ ; $a$ et $b$ sont deux reels.

On designe par $(C)$ la courbe representative de $f$ dans un repere orthonorme $(O, arrow(i), arrow(j))$.

#h(1em) a- Determiner $a$ et $b$ pour que $(C)$ passe par $A(0, 1)$ et admette en ce point une tangente horizontale.

#h(1em) b- Pour les valeurs de $a$ et $b$ trouvees, montrer que $f$ est derivable sur $RR$ et que $f'(x) = frac(x g(x), (x^2 + 1)^2)$.

#h(1em) c- Dresser le tableau de variations de $f$.

#h(1em) d- Verifier que $f(alpha) = frac(3(1 - alpha), alpha^2 + 1)$.

// Source: XY Plus T1 p.80

== Exercice 10 (bis)

*I-* Soit $g$ la fonction definie sur $RR backslash {-1, 1}$ par : $g(x) = frac(x^2 + a x + b, 1 - x^2)$

ou $a$ et $b$ des reels.

#table(
  columns: 7,
  align: center,
  stroke: 0.5pt,
  [$x$], [$-infinity$], [$-1$], [], [$0$], [], [$1$], [$+infinity$],
  [$g'(x)$], [$-$], [||], [], [$-$], [$0$], [$+$], [||], [$+$],
)

// Tableau de variation de g
// g decroit de -1 a +inf sur ]-inf, -1[
// g decroit de +inf a 1 sur ]-1, 0[, g(0) = 1
// g croit de 1 a +inf sur ]0, 1[
// g decroit de -inf a -1 sur ]1, +inf[

1- Calculer $g'(x)$ pour tout $x in RR backslash {-1, 1}$.

2- En utilisant le tableau de variations de $g$. Determiner les reels $a$ et $b$.

// Source: XY Plus T1 p.81

*II-* Soit $h$ la fonction definie sur $[0, +infinity[$ par : $h(x) = 1 - 4 x^2 sqrt(2x)$.

1- Etudier la derivabilite de $h$ a droite en $0$.

2- Montrer que $h$ est derivable sur $]0, +infinity[$ et que :

$h'(x) = -10 x sqrt(2x)$.

3- Dresser le tableau de variations de $h$.

4- Calculer $h(frac(1, 2))$ et en deduire le signe de $h(x)$.

// Source: XY Plus T1 p.81

*III-* Soit $f$ la fonction definie par :

$f(x) = cases(frac(x^2 + 1, 1 - x^2) #h(1em) "si" x in ]-infinity, 0] backslash {-1}, h^2 (x) #h(1em) "si" x in ]0, +infinity[)$

1- Montrer que $f$ est derivable en $0$ et calculer $f'(0)$.

2- Dresser le tableau de variations de $f$.


// =============================================================================
// CORRIGES
// =============================================================================

#pagebreak()

#align(center, text(size: 18pt, weight: "bold")[CORRIGES])

#v(1em)

// Source: XY Plus T1 p.82

== Corrige exercice 1

1) $f : x arrow.r.bar x^3 - 3x^2 + 6x$ est une fonction polynome donc derivable sur $RR$.

Pour tout $x in RR$ : $f'(x) = 3x^2 - 6x$.

2) $f : x arrow.r.bar (3x + 2)^2$.

On pose $u : x arrow.r.bar 3x + 2$ est une fonction polynome donc derivable sur $RR$ d'ou $f = u^2$ derivable sur $RR$.

Pour tout $x in RR$ : $f'(x) = 2 dot u'(x) dot u(x) = 2 times 3 times (3x + 2) = 6(3x + 2)$.

3) $f : x arrow.r.bar frac(x^2 - 2x + 2, x - 1)$ c'est une fonction rationnelle donc derivable sur son domaine de definition $D_f = RR backslash {1}$.

Pour tout $x in RR backslash {1}$, $f'(x) = frac((x^2 - 2x + 2)'(x - 1) - (x - 1)'(x^2 - 2x + 2), (x - 1)^2)$

$= frac((2x - 2)(x - 1) - (x^2 - 2x + 2), (x - 1)^2)$

$f'(x) = frac(x^2 - 2x, (x - 1)^2)$

4) $f : x arrow.r.bar sqrt(2x - 1)$ ; $D_f = [frac(1, 2), +infinity[$.

On pose $u(x) = 2x - 1$ fonction polynome donc derivable sur $RR$ et pour tout $x in ]frac(1, 2), +infinity[$ $u(x) > 0$. D'ou $f = sqrt(u)$ est derivable sur $]frac(1, 2), +infinity[$.

Pour tout $x in ]frac(1, 2), +infinity[$ , $f'(x) = frac(u'(x), 2 sqrt(u(x))) = frac(2, 2 sqrt(2x - 1)) = frac(1, sqrt(2x - 1))$.

5) $f : x arrow.r.bar sqrt(x^2 - x - 6)$ , $D_f = ]-infinity, -2] union [3, +infinity[$.

On pose $bullet$ $u(x) = x^2 - x - 6$ c'est une fonction polynome donc derivable sur $RR$ :

$u'(x) = 2x - 1$.

$bullet$ pour tout $x in ]-infinity, -2[ union ]3, +infinity[$ on a $u(x) > 0$.

Donc $f = sqrt(u)$ est derivable sur $]-infinity, -2[ union ]3, +infinity[$.

Pour tout $x in ]-infinity, -2[ union ]3, +infinity[$ , $f'(x) = frac(u'(x), 2 sqrt(u(x))) = frac(2x - 1, 2 sqrt(x^2 - x - 6))$

// Source: XY Plus T1 p.83

6) $f : x arrow.r.bar (x^2 + x) sqrt(x + 1)$ , $D_f = [-1, +infinity[$.

On pose $bullet$ $u(x) = x^2 + x$ \ deux fonctions polynomes donc derivables sur $RR$,
#h(3em) $v(x) = x + 1$ \  pour tout reel $x$, $u'(x) = 2x + 1$ et $v'(x) = 1$

$bullet$ Pour tout $x in ]-1, +infinity[$ $v(x) > 0$ d'ou $sqrt(v)$ est derivable sur $]-1, +infinity[$

et $(sqrt(v))' = frac(v', 2 sqrt(v))$.

Donc $f = u dot sqrt(v)$ derivable sur $]-1, +infinity[$ et pour tout $x in ]-1, +infinity[$ :

$f'(x) = (u(x) dot sqrt(v(x)))' = u'(x) sqrt(v(x)) + u(x)(sqrt(v(x)))'= u'(x) dot sqrt(v(x)) + u(x) dot frac(1, 2 sqrt(v))$

$= (2x + 1) sqrt(x + 1) + (x^2 + x) dot frac(1, 2 sqrt(x + 1))$

$= frac(5x^2 + 7x + 2, 2 sqrt(x + 1))$

7) $f : x arrow.r.bar frac(x^2 - 1, sqrt(x^2 + x + 1))$ , $D_f = RR$ (car pour tout reel $x$, $x^2 + x + 1 > 0$)

On pose $bullet$ $u(x) = x^2 - 1$ \ deux fonctions polynomes donc derivables sur $RR$,
#h(3em) $v(x) = x^2 + x + 1$ \  pour tout reel $x$, $u'(x) = 2x$ et $v'(x) = 2x + 1$

$bullet$ Pour tout reel $x$, $v(x) > 0$ d'ou $sqrt(v)$ est derivable sur $RR$

Donc $f = frac(u, sqrt(v))$ est derivable sur $RR$.

$f'(x) = frac(u'(x) dot sqrt(v(x)) - (sqrt(v(x)))' dot u(x), (sqrt(v(x)))^2)$

$= frac(2x sqrt(x^2 + x + 1) - frac(2x + 1, 2 sqrt(x^2 + x + 1)) (x^2 - 1), x^2 + x + 1)$

$= frac(2x^3 + 3x^2 + 6x + 1, 2 sqrt(x^2 + x + 1)(x^2 + x + 1))$

#h(8em) $lr([(sqrt(v(x)))' = frac(v'(x), 2 sqrt(v(x))) = frac(2x + 1, 2 sqrt(x^2 + x + 1))])$

8) $f : x arrow.r.bar frac(1, (5 - 3x)^3)$ , $D_f = RR backslash {frac(5, 3)}$.

La fonction $x arrow.r.bar (5 - 3x)$ est affine donc derivable sur $RR$ d'ou $x arrow.r.bar (5 - 3x)^3$ est derivable sur $RR$ et pour tout $x in RR backslash {frac(5, 3)}$, $5 - 3x eq.not 0$ donc la fonction $f$ est derivable sur $D_f = RR backslash {frac(5, 3)}$.

$f'(x) = lr((frac(1, (5 - 3x)^3)))' = frac(-3(-3), (5 - 3x)^(3+1)) = frac(9, (5 - 3x)^4)$

#h(8em) $lr([(frac(1, g^k))' = frac(-k g', g^(k+1))])$

// Source: XY Plus T1 p.84

9) $f : x arrow.r.bar frac(1, (2x + 3)^2)$

$f$ est derivable sur $RR backslash {-frac(3, 2)}$ et $f'(x) = frac(-2(2), (2x + 3)^(2+1)) = frac(-4, (2x + 3)^3)$

10) $f : x arrow.r.bar frac(5 - 3x, x + 2)$ #h(1em) $D_f = RR backslash {-2}$

$f$ est rationnelle donc derivable sur son domaine de definition

$f(x) = frac(-3x + 5, x + 2)$ donc $f'(x) = frac(-3 times 2 - 5 times 1, (x + 2)^2) = frac(-11, (x + 2)^2)$

11) $f(x) = lr((frac(5 - 3x, x + 2)))^2$ , $D_f = RR backslash {-2}$

$f(x) = (u(x))^2$ avec $u(x) = frac(5 - 3x, x + 2)$. On a : $(u^2)' = 2 u' u$

$f'(x) = 2 times frac(-11, (x + 2)^2) times lr((frac(5 - 3x, x + 2)))$ d'ou $f'(x) = frac(-22(5 - 3x), (x + 2)^3)$.

12) $f(x) = (2x + 3)^2 (3x - 5)^3$ , $D_f = RR$.

$f$ est polynome donc derivable sur $RR$.

$f = u^2 v^3$ donc $f' = 2 u' u v^3 + u^2 (3 v' v^2) = u v^2 (2 u' v + 3 u v')$

$u'(x) = 2$ et $v'(x) = 3$.

$f'(x) = (2x + 3)(3x - 5)^2 [2 times 2(3x - 5) + 3(2x + 3) times 3]$

$f'(x) = (2x + 3)(3x - 5)^2 (30x + 7)$.

// Source: XY Plus T1 p.84

== Corrige exercice 2

$f : x arrow.r.bar a x^2 + b x + c$ #h(1em) $(a eq.not 0)$

1) $f$ est une fonction polynome donc derivable sur $RR$.

$f'(x) = 2a x + b$.

On suppose que $cases(f'(x') = 0, f'(x'') = 0) arrow.l.r.double cases(2a x' + b = 0, 2a x'' + b = 0) arrow.l.r.double x' = x'' = -frac(b, 2a)$

Or d'apres les hypotheses $x'$ et $x''$ sont deux racines distinctes de $f(x)$ donc $f'(x') eq.not 0$ et $f'(x'') eq.not 0$.

2) $frac(x', f'(x')) + frac(x'', f'(x'')) = frac(x', 2a x' + b) + frac(x'', 2a x'' + b) = frac(2a x' x'' + b x' + 2a x' x'' + b x'', (2a x' + b)(2a x'' + b))$

$= frac(4a x' x'' + b(x' + x''), 4a^2 x' x'' + 2a b(x' + x'') + b^2)$

// Source: XY Plus T1 p.85

$= frac(4a dot frac(c, a) + b(-frac(b, a)), 4a^2 dot frac(c, a) + 2a b(-frac(b, a)) + b^2)$ #h(2em) car $cases(x' x'' = p = frac(c, a), x' + x'' = S = -frac(b, a))$

$= frac(4c - frac(b^2, a), 4a c - b^2) = frac(frac(4a c - b^2, a), 4a c - b^2)$

$= frac(1, a)$

// Source: XY Plus T1 p.85

== Corrige exercice 3

1) $lim_(x arrow.r 1) frac(x^2 sqrt(x) - 1, x - 1) = ?$

on pose $f(x) = x^2 sqrt(x)$ , $D_f = RR_+$ , $f(1) = 1$

$bullet$ $u : x arrow.r.bar sqrt(x)$ derivable sur $RR_+^*$ et pour tout $x in RR_+^*$, $u'(x) = frac(1, 2 sqrt(x))$.

$v : x arrow.r.bar x^2$ polynome donc derivable sur $RR$, $forall x in RR$ $v'(x) = 2x$.

$bullet$ Pour tout $x in RR_+^*$, $u(x) > 0$.

$arrow.r.double$ $f = v dot u$ est derivable sur $RR_+^* = RR_+^* sect RR$.

$f'(x) = v'(x) dot u(x) + u'(x) dot v(x) = 2x sqrt(x) + frac(x^2, 2 sqrt(x)) = frac(5x^2, 2 sqrt(x)) = frac(5x sqrt(x), 2)$

$lim_(x arrow.r 1) frac(x^2 sqrt(x) - 1, x - 1) = lim_(x arrow.r 1) frac(f(x) - f(1), x - 1) = f'(1) = frac(5, 2)$.

2) $lim_(x arrow.r 4) frac(x - sqrt(x) - 2, x - 4)$, on pose $f(x) = x - sqrt(x)$ , $D_f = RR_+$ , $f(4) = 2$.

$u : x arrow.r.bar sqrt(x)$ derivable sur $RR_+^*$ et $u'(x) = frac(1, 2 sqrt(x))$

$v : x arrow.r.bar x$ polynome donc derivable sur $RR$ et $v'(x) = 1$.

Donc $f = v - u$ est derivable sur $RR_+^*$ et $f'(x) = v'(x) - u'(x) = 1 - frac(1, 2 sqrt(x))$

$lim_(x arrow.r 4) frac(x - sqrt(x) - 2, x - 4) = lim_(x arrow.r 4) frac(f(x) - f(4), x - 4) = f'(4) = 1 - frac(1, 4) = frac(3, 4)$

// Source: XY Plus T1 p.85-86

3) Calcul de $lim_(x arrow.r 3) frac(sqrt(x^2 - 2x) - sqrt(3), x^2 - 5x + 6) = ?$

On pose $f(x) = sqrt(x^2 - 2x)$ , $D_f = ]-infinity, 0] union [2, +infinity[$.

$g(x) = x^2 - 5x + 6$ #h(1em) $D_g = RR$

$D_f sect D_g = ]-infinity, 0] union [2, +infinity[$

$3 in D_f sect D_g$ ; $f(3) = sqrt(3)$ et $g(3) = 0$.

$bullet$ Soit $u(x) = x^2 - 2x$ polynome donc derivable sur $RR$ et $u'(x) = 2x - 2$

// Source: XY Plus T1 p.86

pour tout $x in ]-infinity, 0[ union ]2, +infinity[$ on a : $u(x) > 0$.

D'ou $f = sqrt(u)$ derivable sur $]-infinity, 0[ union ]2, +infinity[$

et $f'(x) = frac(u'(x), 2 sqrt(u(x))) = frac(2x - 2, 2 sqrt(x^2 - 2x)) = frac(x - 1, sqrt(x^2 - 2x))$ ; $f'(3) = frac(2, sqrt(3))$.

$bullet$ $g(x) = x^2 - 5x + 6$ polynome donc derivable sur $RR$.

$g'(x) = 2x - 5$ et $g'(3) = 1$.

$lim_(x arrow.r 3) frac(sqrt(x^2 - 2x) - sqrt(3), x^2 - 5x + 6) = lim_(x arrow.r 3) frac(f(x) - f(3), x - 3) / frac(g(x) - g(3), x - 3) = frac(f'(3), g'(3))$ (car $g'(3) = 1 eq.not 0$)

$= frac(2, sqrt(3))$

// Source: XY Plus T1 p.86

4) Calcul de $lim_(x arrow.r 1) frac(sqrt(x^2 - x + 1) - 1, sqrt(x^2 + 3) - 2) = ?$

on pose $f(x) = sqrt(x^2 - x + 1)$ ; $g(x) = sqrt(x^2 + 3)$

$D_f = D_g = RR$ car $forall x in RR$, $x^2 - x + 1 > 0$ et $x^2 + 3 > 0$

$f(0) = 1$ et $g(0) = 1$

$bullet$ On pose $u(x) = x^2 - x + 1$ \ deux fonctions polynomes donc derivables sur $RR$
#h(3em) $v(x) = x^2 + 3$

pour tout $x in RR$, $cases(u'(x) = 2x - 1, v'(x) = 2x)$

$bullet$ Pour tout $x in RR$, $u(x) > 0$ et $v(x) > 0$.

Donc $f = sqrt(u)$ et $g = sqrt(v)$ derivable sur $RR$.

$f'(x) = frac(u'(x), 2 sqrt(u(x))) = frac(2x - 1, 2 sqrt(x^2 - x + 1))$ , $f'(1) = frac(1, 2)$

$g'(x) = frac(v'(x), 2 sqrt(v(x))) = frac(x, sqrt(x^2 + 3))$ , $g'(1) = frac(1, 2)$.

$lim_(x arrow.r 1) frac(sqrt(x^2 - x + 1) - 1, sqrt(x^2 + 3) - 2) = lim_(x arrow.r 1) frac(f(x) - 1, x - 1) / frac(g(x) - 1, x - 1) = frac(f'(1), g'(1)) = 1$

// Source: XY Plus T1 p.87

== Corrige exercice 4

$f : x arrow.r.bar frac(x^2 + a x - 10, x - 2)$ ; $a in RR$

1) Pour tout $x in RR backslash {2}$

$f'(x) = frac((x^2 + a x - 10)'(x - 2) - (x - 2)'(x^2 + a x - 10), (x - 2)^2) = frac((2x + a)(x - 2) - x^2 - a x + 10, (x - 2)^2)$

$= frac(x^2 - 4x + 10 - 2a, (x - 2)^2)$

2) $f$ admet deux extremums si et seulement si $f'(x)$ s'annule deux fois et change de signe. $f'(x) = 0 arrow.l.r.double x^2 - 4x + 10 - 2a = 0$ :

C'est une equation du second degre qui s'annule et change de signe deux fois si et seulement si $Delta' = b'^2 - a c > 0$ signifie :

$2^2 - (10 - 2a) > 0 arrow.l.r.double -6 + 2a > 0 arrow.l.r.double$ #box(stroke: 0.5pt, inset: 3pt)[$a > 3$]

3) $a = 5 arrow.r.double f(x) = frac(x^2 + 5x - 10, x - 2)$ et $f'(x) = frac(x^2 - 4x, (x - 2)^2)$

$f'(x) = 0 arrow.l.r.double x^2 - 4x = 0 arrow.l.r.double x = 0$ ou $x = 4$

#table(
  columns: 6,
  align: center,
  stroke: 0.5pt,
  [$x$], [$-infinity$], [$0$], [$2$], [$4$], [$+infinity$],
  [$f'(x)$], [$+$], [$0$], [$-$], [||], [$-$], [$0$], [$+$],
)

// Tableau de variation
// f croit de -inf a 5 sur ]-inf, 0[
// f decroit de 5 a +inf sur ]0, 2[ (asymptote verticale)
// f decroit de -inf a -7 sur ]2, 4[
// f croit de -7 a +inf sur ]4, +inf[

$lim_(x arrow.r -infinity) f(x) = lim_(x arrow.r -infinity) frac(x^2, x) = lim_(x arrow.r -infinity) x = -infinity$

$lim_(x arrow.r +infinity) f(x) = lim_(x arrow.r +infinity) frac(x^2, x) = lim_(x arrow.r +infinity) x = +infinity$

$lim_(x arrow.r 2) x^2 + 5x - 10 = 4$ et $lim_(x arrow.r 2) x - 2 = 0$

$lim_(x arrow.r 2^+) f(x) = +infinity$

$lim_(x arrow.r 2^-) f(x) = -infinity$ #h(2em) car : #table(columns: 3, align: center, stroke: 0.5pt, [$x$], [$-infinity$], [$2$], [$+infinity$], [$x - 2$], [$-$], [$0$], [$+$])

// Source: XY Plus T1 p.87-88

== Corrige exercice 5

$f : x arrow.r.bar x^3 - 3x + 2$

1) $f$ est une fonction polynome donc derivable sur $RR$

pour tout $x in RR$ : $f'(x) = 3x^2 - 3$

$f'(x) = 0 arrow.l.r.double 3x^2 - 3 = 0$
$arrow.l.r.double x^2 = 1$
$arrow.l.r.double x = 1$ ou $x = -1$

// Source: XY Plus T1 p.88

#table(
  columns: 5,
  align: center,
  stroke: 0.5pt,
  [$x$], [$-infinity$], [$-2$], [$-1$], [$1$], [$+infinity$],
  [$f'(x)$], [], [$+$], [$0$], [$-$], [$0$], [$+$],
)

// Tableau de variation de f :
// f croit de -inf a 4 sur ]-inf, -1[
// f(-1) = (-1)^3 - 3(-1) + 2 = -1 + 3 + 2 = 4
// f decroit de 4 a 0 sur ]-1, 1[
// f(1) = 1 - 3 + 2 = 0
// f croit de 0 a +inf sur ]1, +inf[

2) $f(-2) = (-2)^3 - 3 times (-2) + 2 = -8 + 6 + 2 = 0$

donc d'apres le tableau de variations de $f$

#table(
  columns: 4,
  align: center,
  stroke: 0.5pt,
  [$x$], [$-infinity$], [$-2$], [$1$], [$+infinity$],
  [$f(x)$], [$-$], [$0$], [$+$], [$0$], [$+$],
)

3) $g : x arrow.r.bar frac(1, 4) x^4 - frac(3, 2) x^2 + 2x$ : c'est une fonction polynome donc derivable sur $RR$

pour tout $x in RR$ : $g'(x) = x^3 - 3x^2 + 2 = f(x)$

#table(
  columns: 4,
  align: center,
  stroke: 0.5pt,
  [$x$], [$-infinity$], [$-2$], [$1$], [$+infinity$],
  [$g'(x) = f(x)$], [$-$], [$0$], [$+$], [$0$], [$+$],
)

// Tableau de variation de g :
// g decroit de +inf a -6 sur ]-inf, -2[
// g(-2) = 1/4(16) - 3/2(4) + 2(-2) = 4 - 6 - 4 = -6
// g croit de -6 a +inf sur ]-2, +inf[

$lim_(|x| arrow.r +infinity) = lim_(|x| arrow.r +infinity) frac(1, 4) x^4 = +infinity$

$h(x) = g(-3x - 8)$. On pose $u : x arrow.r.bar -3x - 8$, fonction polynome donc derivable sur $RR$ et $g$ est derivable sur $RR$ donc $h$ est derivable sur $RR$

et on a : $h'(x) = -3 g'(-3x - 8)$ or $g'(x)$ s'annule en $-2$ et en $1$.

$-3x - 8 = -2 arrow.l.r.double -3x = 6 arrow.l.r.double x = -2$ d'ou $g'(-3x - 8) = 0$ et par suite $h'(-2) = 0$

$-3x - 8 = 1 arrow.l.r.double -3x = 9 arrow.l.r.double x = -3$ , d'ou pour $x = -3$, $g'(-3x - 8) = 0$ et par suite $h'(-3) = 0$.

On a : $-3x - 8 gt.eq -2 arrow.l.r.double x lt.eq -2$ donc pour tout $x in ]-infinity, -2]$ on a $-3x - 8 gt.eq -2$

et par suite $g'(-3x - 8) gt.eq 0$. Il en resulte que $h'(x) lt.eq 0$ pour tout $x in ]-infinity, -2]$.

// Source: XY Plus T1 p.89

// Tableau de variation de h
#table(
  columns: 4,
  align: center,
  stroke: 0.5pt,
  [$x$], [$-infinity$], [$-3$], [$-2$], [$+infinity$],
  [$h'(x)$], [$-$], [$0$], [$-$], [$0$], [$+$],
)

// h decroit de +inf, passe par -6 en x = -3, continue a decroitre, puis croit a partir de x = -2

== Corrige exercice 6

// Source: XY Plus T1 p.89

1) $bullet$ $cal(C)$ admet aux points d'abscisses $-3$ et $4$ deux tangentes horizontales donc $f$ derivable en $-3$ et en $4$ et $f'(-3) = f'(4) = 0$

$bullet$ $cal(C)$ admet deux demi -- tangentes secantes au point d'abscisse $0$ donc $f$ n'est pas derivable en zero (c'est un point anguleux).

$arrow.r$ $cal(C)$ admet une demi tangente a droite au point $O$ de vecteur directeur $arrow(u) vec(1, frac(1, 2))$ donc $f$ derivable a droite a zero et $f'_d (0) = frac(1, 2)$

$arrow.r$ $cal(C)$ admet une demi tangente a gauche en $O$ de vecteur $arrow(v) vec(-1, 2)$

donc $f$ derivable a gauche en zero et $f'_g (0) = -2$ car $arrow(v) vec(-1, -f'_g (0))$

2)

#table(
  columns: 7,
  align: center,
  stroke: 0.5pt,
  [$x$], [$-infinity$], [$-3$], [$0$], [$2$], [$4$], [$+infinity$],
  [$f'(x)$], [$+$], [$0$], [$-2 bar.v frac(1, 2)$], [$+$], [], [$-$], [$0$], [$-$],
)

// Tableau de variation de f :
// f croit de -inf a 3 sur ]-inf, -3[
// f decroit de 3 a 0 sur ]-3, 0[
// f croit de 0 a +inf et +inf a ... sur ]0, 2[
// f decroit sur ]2, 4[
// f decroit sur ]4, +inf[

3) $f'(x)$ s'annule en $4$ mais ne change pas de signe donc $f$ n'admet pas un extremum en $4$.

4) $f$ admet deux extremums :
- Un maximum local en $x = -3$ egal a $f(-3) = 3$
- Un minimum local en $x = 0$ egal a $f(0) = 0$.

// Source: XY Plus T1 p.90

== Corrige exercice 7

#table(
  columns: 8,
  align: center,
  stroke: 0.5pt,
  [$x$], [$-infinity$], [], [$-2$], [$-1$], [$0$], [$1$], [], [$2$], [], [$+infinity$],
  [$f'(x)$], [], [$+$], [$0$], [$-$], [$-3$], [$-$], [||], [$0$], [$+$], [],
)

// Tableau de variation de f :
// f croit de 1 a 3 sur ]-inf, -2[
// f decroit de 3, passe par +inf puis -inf, a 0 sur ]-2, -1[ et ]-1, 0[
// f decroit de +inf a -2 sur ]0, 2[
// f croit de -2 a -1 sur ]2, +inf[

1) $f$ est definie sur $RR backslash {-1}$. $f$ est derivable est derivable sur $RR backslash {-1}$.

2) $lim_(x arrow.r -infinity) f(x) = 1$ et $lim_(x arrow.r +infinity) f(x) = -1$.

La droite d'equation $y = 1$ est asymptote a la courbe $cal(C)$ au voisinage de $-infinity$.

La droite d'equation $y = -1$ est asymptote a la courbe $cal(C)$ au voisinage de $+infinity$.

$lim_(x arrow.r -1^-) f(x) = -infinity$ et $lim_(x arrow.r -1^+) f(x) = +infinity$ donc la droite $x = -1$ est asymptote a $cal(C)$

3) $bullet$ $f$ est derivable en $-2$ et $f'(-2) = 0$ donc au point $A(-2, 3)$ la courbe admet une tangente parallele a l'axe des abscisses d'equation $y = 3$.

$bullet$ $f$ est derivable en $1$ et $f'(1) = -3$ donc au point $B(1, 0)$ la courbe $cal(C)$ admet une tangente de coefficient directeur $-3$. $T_B : y = f'(1)(x - 1) + f(1)$ (et $f(1) = 0$) donc $T_B : y = -3x + 3$

$bullet$ $f'(2) = 0$ donc la courbe $cal(C)$ au point $C(2, -2)$ une tangente parallele a l'axe des abscisses d'equation $y = -2$.

4) L'equation $f(x) = 0$ admet deux racines. L'une $alpha in [-2, -1[$ et l'autre $1 in ]-1, 2]$

// Source: XY Plus T1 p.90

5) D'apres les particularites de la fonction $f$ deduites de son tableau de variation, on peut tracer l'allure de la courbe de $f$ :

// Figure exercice 7 corrige : courbe avec asymptotes
#cetz.canvas({
  import cetz.draw: *

  // Axes
  line((-4, 0), (5, 0), mark: (end: ">"))
  line((0, -4), (0, 5), mark: (end: ">"))
  content((0.2, -0.3), $O$)

  // Asymptote verticale x = -1
  line((-1, -4), (-1, 5), stroke: (dash: "dashed"))
  content((-1.3, -3.5), $x = -1$)

  // Asymptote horizontale y = 1 (a gauche)
  line((-4, 1), (-1.2, 1), stroke: (dash: "dashed"))
  content((-3.5, 1.3), $y = 1$)

  // Asymptote horizontale y = -1 (a droite)
  line((-0.8, -1), (5, -1), stroke: (dash: "dashed"))
  content((4, -0.7), $y = -1$)

  // Branche gauche : de y=1 en -inf, monte a 3 en x=-2, puis descend vers -inf en x=-1-
  bezier((-3.5, 1.2), (-2, 3), (-3, 1.5))
  bezier((-2, 3), (-1.1, -3.5), (-1.5, 2), (-1.2, -2))

  // Branche droite : de +inf en x=-1+, passe par (0, ~3), descend a 0 en x=1, descend a -2 en x=2, remonte vers -1
  bezier((-0.9, 4), (0, 3), (-0.5, 3.5))
  bezier((0, 3), (1, 0), (0.5, 1.5))
  bezier((1, 0), (2, -2), (1.5, -1))
  bezier((2, -2), (4.5, -1.1), (3, -1.5))

  // Points remarquables
  circle((-2, 3), radius: 0.07, fill: black)
  circle((1, 0), radius: 0.07, fill: black)
  circle((2, -2), radius: 0.07, fill: black)
})

// Source: XY Plus T1 p.90-91

== Corrige exercice 8

1) $f(1) = 1$,

$(T)$ est la tangente a la courbe $Gamma$ au point d'abscisse $1$.

// Source: XY Plus T1 p.91

La tangente $(T)$ a pour coefficient directeur $f'(1) = frac(y_B - y_A, x_B - x_A) = 1$

$f'(frac(3, 2)) = 0$ car la courbe $Gamma$ admet une tangente horizontale au point d'abscisse $frac(3, 2)$.

2) $(T) : y = 1 dot x + p$ ou $p$ est l'ordonnee a l'origine. On lit sur la figure l'ordonnee du point d'intersection de $(T)$ avec l'axe des ordonnees.

D'ou $(T) : y = x$.

3) $f$ est croissante sur $[0, frac(3, 2)]$ donc $f'(x) gt.eq 0$ pour tout $x in [0, frac(3, 2)]$ d'ou la courbe de $f'$ est situee au dessus de l'axe des abscisses sur l'intervalle $[0, frac(3, 2)]$

Les courbes #text(fill: rgb("#666"))[1] et #text(fill: rgb("#666"))[3] ne conviennent pas.

$f$ est decroissante sur $[frac(3, 2), 4]$ donc $f'(x) lt.eq 0$ pour tout $x in [frac(3, 2), 4]$ d'ou la courbe de $f'$ est situee au dessous de l'axe des abscisses sur l'intervalle $[frac(3, 2), 4]$.

$f'(frac(3, 2)) = 0$ donc la courbe de $f'$ coupe l'axe des abscisses au point d'abscisse $frac(3, 2)$.

La courbe #text(fill: rgb("#666"))[2] convient.

Conclusion : la courbe #text(fill: rgb("#666"))[2] est la representation graphique de la fonction derivee de $f$.

// Source: XY Plus T1 p.91

== Corrige exercice 9

$f : x arrow.r.bar frac(x^2 - 3x + 3, x - 1)$

1) $f$ est une fonction rationnelle donc derivable sur $D_f = RR backslash {1}$ et

$f'(x) = frac((x^2 - 3x + 3)'(x - 1) - (x^2 - 3x + 3)(x - 1)', (x - 1)^2)$

$= frac((2x - 3)(x - 1) - x^2 + 3x - 3, (x - 1)^2)$

$= frac(x^2 - 2x, (x - 1)^2)$

2) a) $f'(x) = 0 arrow.l.r.double x^2 - 2x = 0 arrow.l.r.double x = 0$ ou $x = 2$

#table(
  columns: 6,
  align: center,
  stroke: 0.5pt,
  [$x$], [$-infinity$], [$0$], [$1$], [$2$], [$+infinity$],
  [$f'(x)$], [$+$], [$0$], [$-$], [||], [$-$], [$0$], [$+$],
)

// Tableau de variation de f :
// f croit de -inf a -3 sur ]-inf, 0[
// f(0) = -3
// f decroit de -3 a -inf sur ]0, 1[
// asymptote verticale en x = 1
// f decroit de +inf a 1 sur ]1, 2[
// f(2) = 1
// f croit de 1 a +inf sur ]2, +inf[

// Source: XY Plus T1 p.92

$lim_(x arrow.r -infinity) f(x) = lim_(x arrow.r -infinity) frac(x^2, x) = lim_(x arrow.r -infinity) x = -infinity$

$lim_(x arrow.r +infinity) f(x) = lim_(x arrow.r +infinity) frac(x^2, x) = lim_(x arrow.r +infinity) x = +infinity$

$lim_(x arrow.r 1) x - 1 = 0$ et $lim_(x arrow.r 1)(x^2 - 3x + 3) = 1$

$lim_(x arrow.r 1^+) f(x) = +infinity$

$lim_(x arrow.r 1^-) f(x) = -infinity$ #h(2em) car : #table(columns: 3, align: center, stroke: 0.5pt, [$x$], [$-infinity$], [$1$], [$+infinity$], [$x - 1$], [$-$], [$0$], [$+$])

b) D'apres le tableau de variations de $f$ on a :

$1$ est un minimum local a l'intervalle $]1, +infinity[$ de $f(x)$

$-3$ est un maximum local a l'intervalle $]-infinity, 1[$ de $f(x)$

donc pour tout $x in ]1, +infinity[$ ; $f(x) gt.eq 1$ et $x in ]-infinity, 1[$ ; $f(x) lt.eq -3$

L'ensemble de solutions de $f(x) < 1$ est $S_1 = ]-infinity, 1[$

L'ensemble de solutions de $f(x) > -3$ est $S_2 = ]1, +infinity[$

l'ensemble des solutions du systeme $cases(f(x) < 1, f(x) > -3)$ est $S = S_1 sect S_2 = emptyset$

3) a) $g : x arrow.r.bar frac(x^2 - 3x + 3, |x - 1|)$ donc $cases(g(x) = f(x) #h(1em) "si" x > 1, g(x) = -f(x) "si" x < 1)$

#table(
  columns: 6,
  align: center,
  stroke: 0.5pt,
  [$x$], [$-infinity$], [$0$], [$1$], [$2$], [$+infinity$],
  [$g(x)$], [], [], [$3$], [], [$+infinity$], [$+infinity$], [], [$1$], [],
)

// g decroit de +inf a 3 sur ]-inf, 0[, croit de 3 a +inf sur ]0, 1[
// g decroit de +inf a 1 sur ]1, 2[, croit de 1 a +inf sur ]2, +inf[

// Source: XY Plus T1 p.92

b) $x$ et $y$ de $]0, frac(pi, 2)]$. Si $x < y$ alors $cos x > cos y$

or $cos x$ et $cos y$ appartiennent a $[0, 1[$ et $g$ est croissante sur $[0, 1[$ donc

$cos x > cos y arrow.r.double g(cos x) > g(cos y)$

// Source: XY Plus T1 p.92

== Corrige exercice 10

1) $D_alpha$ et de coefficient directeur $alpha$ donc $y = alpha x + beta$.

$A(1, 8) in D_alpha$ donc $8 = alpha + beta$ ce qui donne $beta = alpha - 8$.

Par consequent : $D_alpha : y = alpha x + alpha - 8$.

// Source: XY Plus T1 p.93

2) a) $M(x, y) in D_alpha sect (x x')$ $arrow.l.r.double cases(y = alpha x + alpha - 8, y = 0) arrow.l.r.double cases(alpha x + alpha - 8 = 0, y = 0) arrow.l.r.double cases(x = frac(8 - alpha, alpha), y = 0)$

D'ou $M(frac(8 - alpha, alpha), 0)$

$N(x, y) in D_alpha sect (y y')$ $arrow.l.r.double cases(y = alpha x + alpha - 8, x = 0) arrow.l.r.double cases(y = alpha - 8, x = 0)$

$N(0, alpha - 8)$

b) $M N^2 = (0 - frac(8 - alpha, alpha))^2 + (alpha - 8 - 0)^2 = lr((frac(alpha - 8, alpha)))^2 + (alpha - 8)^2 = (alpha - 8)^2 (frac(1, alpha^2) + 1)$

c) On pose $f(alpha) = (alpha - 8)^2 (frac(1, alpha^2) + 1)$

Pour tout $alpha$ de $RR^*$, $f'(alpha) = 2(alpha - 8)(frac(1, alpha^2) + 1) + (alpha - 8)^2 (frac(-2, alpha^3))$

$f'(alpha) = (alpha - 8)(frac(2, alpha^2) + 2 - frac(2, alpha^3)(alpha - 8))$

On a $alpha eq.not 8$ donc $f'(alpha) = 0$ $arrow.l.r.double frac(2, alpha^2) + 2 - frac(2, alpha^3)(alpha - 8) = 0$

$arrow.l.r.double 2 alpha + 2 alpha^3 - 2 alpha + 16 = 0$

$arrow.l.r.double alpha^3 + 8 = 0$

$arrow.l.r.double alpha^3 = -8$

$arrow.l.r.double alpha = -2$

#table(
  columns: 5,
  align: center,
  stroke: 0.5pt,
  [$alpha$], [$-infinity$], [$-2$], [$0$], [$8$], [$+infinity$],
  [$f'(alpha)$], [$-$], [$0$], [$+$], [], [$-$], [], [$+$],
)

Lorsque $alpha = -2$ la distance $M N$ est minimale

// Source: XY Plus T1 p.93

== Corrige exercice 11

1) $g(x) = x^3 + 3x - 2$ #h(1em) $g'(x) = 3x^2 + 3 > 0$

#table(
  columns: 3,
  align: center,
  stroke: 0.5pt,
  [$x$], [$-infinity$], [$alpha$], [$+infinity$],
  [$g'(x)$], [], [$+$], [],
)

// g strictement croissante de -inf a +inf
// g passe par 0 en alpha

b- $g$ est continue et strictement croissante sur $RR$ $g(RR) = RR$ donc l'equation $g(x) = 0$ admet une seule solution $alpha$ dans $RR$.

$g(0.5) = -5$ et $g(0.6) = 1$ (approx.) donc $g(0.5) times g(0.6) < 0$ d'ou $0.5 < alpha < 0.6$

// Source: XY Plus T1 p.93-94

#table(
  columns: 3,
  align: center,
  stroke: 0.5pt,
  [$x$], [$-infinity$], [$alpha$], [$+infinity$],
  [$g(x)$], [$-$], [$0$], [$+$],
)

2- a- $A(0, 1) in xi$ $f$ donc $f(0) = 1$ d'ou $b = -1$

$f'(x) = a - frac(x^2 + 1 - 2x(x + b), (x^2 + 1)^2)$ #h(1em) $f'(0) = 0$ donc $a - 1 = 0$ donc $a = 1$

// Source: XY Plus T1 p.94

b- $f(x) = x - frac(x - 1, x^2 + 1)$ $f$ est derivable sur $RR$ et

$f'(x) = 1 - frac(x^2 + 1 - 2x(x + b), (x^2 + 1)^2)$

$= frac((x^2 + 1)^2 + x^2 - 1, (x^2 + 1)^2) = frac(x g(x), (x^2 + 1)^2)$

c-

#table(
  columns: 5,
  align: center,
  stroke: 0.5pt,
  [$x$], [$-infinity$], [$0$], [$alpha$], [$+infinity$],
  [$f'(x)$], [$+$], [$0$], [$-$], [$0$], [$+$],
)

// f croit de -inf a 1 sur ]-inf, 0[
// f decroit de 1 a f(alpha) sur ]0, alpha[
// f croit de f(alpha) a +inf sur ]alpha, +inf[

d) $g(alpha) = 0$ donc $alpha^3 = 2 - 3 alpha$ et $f(alpha) = alpha - frac(alpha - 1, alpha^2 + 1) = frac(alpha^3 + 1, alpha^2 + 1) = frac(3(1 - alpha), alpha^2 + 1)$

// Source: XY Plus T1 p.94

== Corrige exercice 12

*I)* 1) $g'(x) = frac((2x + a)(1 - x^2) - 2x(x^2 + a x + b), (1 - x^2)^2)$

2) $g'(0) = 0$ donc $a = 0$

$g(0) = 1$ donc $b = 1$

*II)* 1) $lim_(x arrow.r 0^+) frac(h(x) - h(0), x - 0) = lim_(x arrow.r 0^+) -4x^2 sqrt(2x) = 0$ donc $f$ est derivable a droite en $0$

et $h'_g (0) = 0$.

2) $x arrow.r.bar sqrt(2x)$ est derivable sur $]0, +infinity[$ donc $h$ est derivable sur $]0, +infinity[$

$h'(x) = -8x sqrt(2x) - 4x^2 frac(2, 2 sqrt(2x)) = -8x sqrt(2x) - frac(4x^2, sqrt(2x)) = -8x sqrt(2x) - 2x sqrt(2x) = -10x sqrt(2x)$

// Source: XY Plus T1 p.95

3) #table(
  columns: 3,
  align: center,
  stroke: 0.5pt,
  [$x$], [$-infinity$], [], [$+infinity$],
  [$h'(x)$], [$0$], [$-$], [],
)

// h(0) = 1 et h decroissante vers -inf

4) $h'(frac(1, 2)) = 0$

#table(
  columns: 3,
  align: center,
  stroke: 0.5pt,
  [$x$], [], [$frac(1, 2)$], [$+infinity$],
  [$h(x)$], [$+$], [$0$], [$-$],
)

*III)*

1) $lim_(x arrow.r 0^-) frac(f(x) - f(0), x - 0) = lim_(x arrow.r 0^-) frac(frac(x^2 + 1, 1 - x^2) - 1, x) = lim_(x arrow.r 0^-) frac(2x, 1 - x^2) = 0 = f'_g (0)$

$lim_(x arrow.r 0^+) frac(f(x) - f(0), x - 0) = lim_(x arrow.r 0^+) frac(h^2(x) - 1, x) = lim_(x arrow.r 0^+) frac(h(x) - 1, x) (h(x) + 1) = h'_d (0) times 2 = 0 = f'_d (0)$

Donc $f$ est derivable en $0$ et $f'(0) = 0$.

2) pour tout $x in ]0, +infinity[$ $f'(x) = alpha h(x) h'(x)$

// Note: alpha est un coefficient non precise dans l'image

#table(
  columns: 5,
  align: center,
  stroke: 0.5pt,
  [$x$], [$-infinity$], [$-1$], [$0$], [$frac(1, 2)$], [$+infinity$],
  [$f'(x)$], [$+$], [], [], [$-$], [], [$0$], [$+$],
)

// f croit de -inf a +inf sur ]-inf, -1[
// f decroit de +inf a ? sur ]-1, 0[
// f continue sur ]0, 1/2[
// f croit de ? a +inf sur ]1/2, +inf[
