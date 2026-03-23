// =============================================================================
// Transcription fidele : Parascolaire Analyse 3eme sec (Kounouz Editions)
// Chapitre V — Nombre derive
// Pages 105 a 133
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
  _Chapitre V_
  #v(0.3em)
  #text(size: 18pt, weight: "bold")[Nombre derive]
]

#v(1em)

// Source: Parascolaire Analyse p.105

#definition-block[
  == Nombre derive en un point

  Soit $f$ definie sur un intervalle $I$ contenant $x_0$.

  $f$ est derivable en $a$ et $f'(a)$ est appele le nombre derive de $f$ en $a$ ;

  $ arrow.l.r.double lim_(x -> a) frac(f(x) - f(a), x - a) = ell #h(0.5em) "et" #h(0.5em) ell in RR ; #h(0.5em) "on note :" f'(a) = ell $

  $ arrow.l.r.double lim_(x -> a) frac(f(a + h) - f(a), h) = ell #h(0.5em) "et" #h(0.5em) ell in RR. $
]

#v(1em)

// Source: Parascolaire Analyse p.105

#definition-block[
  == La vitesse

  Soit $d(t)$ la distance parcourue a l'instant $t$.

  La vitesse instantanee a l'instant $t_0$ du mobile est egale a

  $ lim_(h -> 0) frac(d(t_0 + h) - d(t_0), h) = d'(t_0) $
]

#v(1em)

// Source: Parascolaire Analyse p.105

#theorem-block[
  == Approximation affine d'une fonction

  *Theoreme :* Soit $f$ une fonction derivable en $a$.

  Une valeur approchee de $f(a + h) approx f(a) + f'(a) times h$

  On dit alors que :

  - $f(a) + f'(a) times h$ est une approximation affine de $f$ en $a$

  *Exemple :* Pour trouver une approximation affine de $sqrt(1 + h)$ pour $h$ voisin de $0$.

  \* On considere la fonction $f(x) = sqrt(x)$

  $ lim_(x -> 1) frac(f(x) - f(1), x - 1) = lim_(x -> 1) frac(sqrt(x) - 1, x - 1) = lim_(x -> 1) frac((sqrt(x) - 1)(sqrt(x) + 1), (x - 1)(sqrt(x) + 1)) $

  $ = lim_(x -> 1) frac(x - 1, (x - 1)(sqrt(x) + 1)) = lim_(x -> 1) frac(1, sqrt(x) + 1) = frac(1, 2) = f'(1) $

  donc l'approximation affine de $sqrt(1 + h)$ au voisin de $0$ est

  $ f'(1) h + f(1) = frac(1, 2) h + 1 $
]

#v(1em)

// Source: Parascolaire Analyse p.105

#definition-block[
  == Derivabilite a droite - derivabilite a gauche

  #table(
    columns: (1fr, 1fr),
    align: left,
    stroke: 0.5pt,
    [
      $f$ definie sur $]a - h, a]$

      $f$ est derivable a gauche en $a$

      $arrow.l.r.double lim_(x -> a^-) frac(f(x) - f(a), x - a) = ell ; #h(0.3em) ell in RR$

      et on note $ell = f'_g (a)$.
    ],
    [
      $f$ definie sur $[a, a + h[$

      $f$ est derivable a droite en $a$

      $arrow.l.r.double lim_(x -> a^+) frac(f(x) - f(a), x - a) = ell ; #h(0.3em) ell in RR$

      et on note $ell = f'_d (a)$.
    ],
  )

  $f$ definie sur $]a - h, a + h[$ ; $f$ est derivable en $a arrow.l.r.double f'_d (a) = f'_g (a)$
]

#v(1em)

// Source: Parascolaire Analyse p.106

#theorem-block[
  == Derivabilite et continuite

  *Theoreme :* Si $f$ est derivable en $a$ alors $f$ est continuee en $a$.

  *Remarque :* Si $f$ est continue en $a$, alors on ne peut rien conclure pour la derivabilite en $a$.
]

#v(1em)

// Source: Parascolaire Analyse p.106

#definition-block[
  == Interpretation geometrique du $lim_(x -> a) frac(f(x) - f(a), x - a)$

  === 1#super[er] cas : f est derivable en a

  $ lim_(x -> a) frac(f(x) - f(a), x - a) = ell = f'(a) $

  On dit que $zeta$ la courbe de $f$ admet une tangente

  $Delta : y = f'(a)(x - a) + f(a)$

  au point $A (a, f(a))$ de coefficient directeur $f'(a)$ et de vecteur directeur :

  $ arrow(U) vec(1, f'(a)) #h(0.5em) "dans une base" #h(0.5em) (arrow(i), arrow(j)). $
]

#v(0.5em)

// Source: Parascolaire Analyse p.106 — Figures tangente

#figure(
  cetz.canvas({
    import cetz.draw: *

    // Si f'(a) = 0
    set-style(stroke: (thickness: 0.8pt))
    line((-0.5, 0), (4.5, 0), mark: (end: ">"))
    line((0, -0.5), (0, 3), mark: (end: ">"))
    content((4.3, -0.3), $arrow(i)$)
    content((-0.3, 2.8), $arrow(j)$)
    content((-0.3, -0.3), $O$)

    // Courbe horizontale tangente
    bezier((0.5, 2), (2, 2.5), (3.5, 2), stroke: (thickness: 1pt))
    line((0.5, 2.2), (3.5, 2.2), stroke: (dash: "dashed"))
    content((2.5, 2.6), $A$)
    content((2, -0.3), text(size: 8pt)[$"Si" f'(a) = 0$])
    line((2, 0), (2, 2.2), stroke: (dash: "dotted"))
    content((2, -0.6), $a$)
    content((-0.5, 2.2), $f(a)$)
  }),
  caption: [Cas $f'(a) = 0$, $f'(a) > 0$, $f'(a) < 0$],
)

#v(1em)

// Source: Parascolaire Analyse p.106

#definition-block[
  === 2#super[eme] cas : f n'est pas derivable en a

  $ lim_(x -> a) frac(f(x) - f(a), x - a) = + infinity #h(0.5em) "ou" #h(0.5em) - infinity $

  On dit que $zeta$ la courbe de $f$ admet une tangente verticale.
]

#v(1em)

// Source: Parascolaire Analyse p.107

#definition-block[
  === Demi-tangentes verticales

  #table(
    columns: (1fr, 1fr),
    align: left,
    stroke: 0.5pt,
    [
      $lim_(x -> a^+) frac(f(x) - f(a), x - a) = + infinity$

      $zeta$ admet en $A$, une demi-tangente verticale dirigee vers les $y$ positifs.
    ],
    [
      $lim_(x -> a^-) frac(f(x) - f(a), x - a) = - infinity$

      $zeta$ admet en $A$, une demi tangente verticale dirigee vers les $y$ negatifs.
    ],
  )

  #table(
    columns: (1fr, 1fr),
    align: left,
    stroke: 0.5pt,
    [
      $lim_(x -> a^-) frac(f(x) - f(a), x - a) = - infinity$

      $zeta$ admet en $A$, une demi-tangente verticale dirigee vers les $y$ positifs.
    ],
    [
      $lim_(x -> a^-) frac(f(x) - f(a), x - a) = + infinity$

      $zeta$ admet en $A$, une demi tangente verticale dirigee vers les $y$ negatifs.
    ],
  )
]

#v(1em)

// Source: Parascolaire Analyse p.107

#definition-block[
  === Demi-tangentes non verticales

  $ lim_(x -> a^+) frac(f(x) - f(a), x - a) eq.not lim_(x -> a^-) frac(f(x) - f(a), x - a) $

  avec des limites finies.

  $ lim_(x -> a^+) frac(f(x) - f(a), x - a) = f'_d (a) $

  $arrow.l.r.double zeta_f$ admet une demi tangente au point $M (a, f(a))$ d'equation :

  $ y = f'_d (a)(x - a) + f(a) #h(0.5em) "et" #h(0.5em) x gt.eq a #h(0.5em) "de vecteur directeur" #h(0.5em) arrow(u)_d vec(1, f'_d (a)) $

  #table(
    columns: (1fr, 1fr, 1fr),
    align: center,
    stroke: 0.5pt,
    [$f'_d (a) > 0$], [$f'_d (a) < 0$], [$f'_d (a) = 0$],
  )

  $ lim_(x -> a^-) frac(f(x) - f(a), x - a) = f'_g (a) $

  $arrow.l.r.double zeta_f$ admet une demi tangente au point $M(a, f(a))$ d'equation :

  $ y = f'_g (a)(x - a) + f(a) #h(0.5em) "et" #h(0.5em) x lt.eq a #h(0.5em) "de vecteur directeur" #h(0.5em) arrow(u)_g vec(1, f'_g (a)) $
]

#v(1em)

// Source: Parascolaire Analyse p.108

#definition-block[
  == Point anguleux

  Si les deux demi-tangentes en $A$ ne sont pas portees par la meme droite,

  On dit que le point $A$ est un point anguleux.

  *Exemple :* le point $A (1, 2)$ et $f'_d (1) = 1$ et $f'_g (1) = -1$
]

#v(0.5em)

// Source: Parascolaire Analyse p.108 — Figure point anguleux
#figure(
  cetz.canvas({
    import cetz.draw: *

    set-style(stroke: (thickness: 0.8pt))
    line((-2, 0), (3, 0), mark: (end: ">"))
    line((0, -0.5), (0, 3), mark: (end: ">"))
    content((2.8, -0.3), $arrow(i)$)
    content((-0.3, 2.8), $arrow(j)$)
    content((-0.3, -0.3), $O$)

    // Point anguleux : deux demi-droites
    line((-1.5, 3.5), (1, 2), stroke: (thickness: 1pt))
    line((1, 2), (3, 3), stroke: (thickness: 1pt))
    line((1, 0), (1, 2), stroke: (dash: "dashed"))
    content((1.2, 2.3), $A$)
  }),
  caption: [Point anguleux],
)

#v(1em)

// Source: Parascolaire Analyse p.108

#remarque-block[
  == Remarque

  $triangle.r$ $f$ est derivable en $a$ et la tangente en $A (a, f(a))$, a pour equation :

  $ T : y = f'(a)(x - a) + f(a) $

  Soit $Delta : y = m x + p$ (avec $m$ et $p$ deux reels donnes)

  Pour determiner le point $A (x_0, y_0)$ de la courbe tel que $Delta$ soit tangente.

  Il suffit de resoudre le systeme suivant :

  $ cases(f'(x_0) = m, y_0 = f(x_0) = m x_0 + p) $
]

#v(1em)

// Source: Parascolaire Analyse p.109

#remarque-block[
  Pour determiner la position d'une tangente et d'une droite $Delta : y = m x + p$ :

  $ * #h(0.5em) T parallel Delta arrow.l.r.double f'(a) = m $

  $ * #h(0.5em) T perp Delta arrow.l.r.double f'(a) times m = -1 $
]

#v(1em)

// Source: Parascolaire Analyse p.109

#definition-block[
  == Derivees de quelques fonctions usuelles

  #table(
    columns: (1fr, 1fr),
    align: (left, left),
    stroke: 0.5pt,
    [*Fonction $f$*], [*$f'(a)$*],
    [$f(x) = c$ constante], [$f'(a) = 0$],
    [$f(x) = alpha x + beta$], [$f'(a) = alpha$],
    [$f(x) = (x - alpha)^2 + beta$], [$f'(a) = 2(a - alpha)$],
    [$f(x) = frac(1, alpha x + beta)$], [$f'(a) = frac(-1, (alpha a + beta)^2)$],
    [$f(x) = sqrt(x + alpha)$], [$f'(a) = frac(1, 2 sqrt(a + alpha))$],
    [$f(x) = frac(alpha x + beta, delta x + lambda)$], [$f'(a) = frac(alpha lambda - beta delta, (delta a + lambda)^2)$],
    [$f(x) = x^n$], [$f'(a) = n times a^(n-1)$],
  )
]

#v(1em)

// Source: Parascolaire Analyse p.109

#theorem-block[
  == Operations sur les fonctions derivables en a

  *Theoreme :*

  Si $f$ et $g$ sont 2 fonctions derivables en $a$

  Alors $f + g$, $f times g$ et $alpha f + beta g$ sont derivables en $a$ et on a :

  - $(f + g)'(a) = f'(a) + g'(a)$

  - $(f times g)'(a) = f'(a) dot g(a) + f(a) dot g'(a)$

  - $(alpha f + beta g)'(a) = alpha f'(a) + beta g'(a)$

  - $(f^n)'(a) = n f^(n-1)(a) dot f'(a)$ #h(1em) avec $n in NN^* backslash {1}$

  - $(frac(1, f))'(a) = frac(-f'(a), f^2(a))$ #h(1em) si $f(a) eq.not 0$

  - $(frac(f, g))'(a) = frac(f'(a) dot g(a) - g'(a) f(a), g^2(a))$

  *Theoreme :*
  $ f "est derivable en" a \ f(a) > 0 } arrow.double (sqrt(f))'(a) = frac(f'(a), 2 sqrt(f(a))) $

  *Exemple :* $f(x) = sqrt(4x + 1)$. Determiner le nombre derive en $1$.

  On pose $u(x) = 4x + 1$ alors $f'(1) = frac(u'(1), 2 sqrt(u(1))) = frac(4, 2 sqrt(4 + 1)) = frac(4, 2 sqrt(5)) = frac(2, sqrt(5))$
]

#pagebreak()

// =============================================
// ENONCES
// =============================================

#align(center)[
  #text(size: 18pt, weight: "bold")[ENONCES]
]

#v(1em)

// Source: Parascolaire Analyse p.110

== Exercice 1

a) soit $f(x) = x^3 + 2x^2 - x + 1$. Montrer que $f$ est derivable en $0$, et determiner $f'(0)$.

b) soit $f(x) = sqrt(x + 3)$. Montrer que $f$ est derivable en $-2$ et determiner $f'(-2)$.

c) soit $f(x) = sqrt(x - 1)$. Montrer que $f$ n'est pas derivable en $1$.

d) soit $f(x) = |x + 1|$. Montrer que $f$ n'est pas derivable en $-1$.

e) soit $f(x) = x - sqrt(2x + 1)$. Montrer que $f$ est derivable en $4$ et determiner $f'(4)$.

#v(0.5em)

// Source: Parascolaire Analyse p.110

== Exercice 2

Soit $f(x) = 2x^3 - x + 3$. Montrer que $f$ est derivable en tout point $a$ de $RR$ et calculer $f'(a)$.

#v(0.5em)

// Source: Parascolaire Analyse p.110

== Exercice 3

Determiner pour chacune des fonctions suivantes, une equation de la tangente a la courbe representative $(C)$ au point $A$ d'abscisse $a$ :

1) $f(x) = 2x^3 - 4x + 3$ et $a = 1$.

2) $f(x) = frac(x - 1, x + 1)$ et $a = -2$.

#v(0.5em)

// Source: Parascolaire Analyse p.110

== Exercice 4

a) soit $f(x) = cases(x^2 + 1 #h(0.5em) &"si" x gt.eq -1, -2x #h(0.5em) &"si" x < -1)$

Calculer s'ils existent les nombres derivees a droite et a gauche au point $x_0 = -1$.

Que peut-on conclure ?

b) Meme question pour $f(x) = frac(1, |x| + 1)$ au point $x_0 = 0$.

#v(0.5em)

// Source: Parascolaire Analyse p.110

== Exercice 5

$f$ est definie par $f(x) = (1 - x) sqrt(1 - x^2)$ pour $x in [-1, 1]$ et $zeta$ la courbe representative de $f$ dans un repere orthonorme.

Etudier la derivabilite de $f$ en $1$ et en $-1$. En deduire les tangentes a $zeta$ aux points d'abscisses $1$ et $-1$.

#v(0.5em)

// Source: Parascolaire Analyse p.110

== Exercice 6

Soit $f$ defini sur $RR_+$ par $f(x) = x sqrt(x)$.

Etudier la derivabilite de $f$ en $0$. Que peut-on deduire pour $zeta_f$ ?

#v(0.5em)

// Source: Parascolaire Analyse p.110-111

== Exercice 7 (QCM)

Indiquer la reponse exacte par a, b ou c avec justification.

1) $f$ est une fonction telle que $f(2) = 3$ et $f'(2) = -1$

la tangente a $zeta_f$ au point d'abscisse $2$ a pour equation :

#h(1em) $fbox[a]$ $y = -x + 5$ #h(2em) $fbox[b]$ $y = -x + 3$ #h(2em) $fbox[c]$ $y = 3x - 3$

2) $f$ est la fonction definie sur $]-1, 1[$ par $f(x) = sqrt(1 - x^2)$ alors $f'(frac(1, 2))$ est egale a

#h(1em) $fbox[a]$ $frac(sqrt(3), 4)$ #h(2em) $fbox[b]$ $-frac(1, sqrt(3))$ #h(2em) $fbox[c]$ $frac(1, sqrt(3))$

// Source: Parascolaire Analyse p.111

3) $f$ est derivable en $a$ signifie que

#h(1em) $fbox[a]$ $lim_(x -> a) f(x) = f(a)$

#h(1em) $fbox[b]$ $lim_(h -> 0) frac(f(a + h) - f(a), h) = + infinity$

#h(1em) $fbox[c]$ $lim_(h -> 0) frac(f(a + h) - f(a), h) = ell$

4) \* Si $f$ est continue en $a$ alors $f$ est derivable en $a$

\*\* Si $f$ est derivable en $a$ alors $f$ est continue en $a$

\*\*\* Si $f$ n'est pas continue en $a$ alors $f$ n'est pas derivable en $a$

Parmi les affirmations (\*) (\*\*) et (\*\*\*)

#h(1em) $fbox[a]$ aucune n'est vraie #h(1em) $fbox[b]$ une seule est vraie #h(1em) $fbox[c]$ deux sont vraie

5) $(frac(u, v))'(a)$ est egale a :

#h(1em) $fbox[a]$ $frac(u(a) v'(a) - u'(a) v(a), v^2(a))$

#h(1em) $fbox[b]$ $frac(u'(a) v(a) + u(a) v'(a), v^2(a))$

#h(1em) $fbox[c]$ $frac(u'(a) v(a) - v(a)' u(a), v^2(a))$

#v(0.5em)

// Source: Parascolaire Analyse p.111

== Exercice 8

$f$ definie sur $[-1, 1[$ par $f(x) = sqrt(frac(x^2(1 + x), 1 - x))$

Etudier la derivabilite de $f$ en $0$ et en $-1$. Que peut-on deduire geometriquement ?

#v(0.5em)

// Source: Parascolaire Analyse p.111

== Exercice 9 (Vrai-Faux)

Dire si l'affirmation est vraie ou fausse. Justifier votre reponse.

1) $f$ la fonction definie par $f(x) = sqrt(2) x^2$ pour tout $a > 0$, $f'(a) = frac(a, sqrt(2))$.

2) $f$ la fonction definie sur $RR$ par $f(x) = sqrt(2) x$ alors

pour tout $a in RR$, $f'(a) = frac(a, 2 sqrt(2))$

3) $f$ est une fonction derivable en $1$ et $f'(1) = 2 = f(1)$

alors l'equation de la tangente en ce point est $y = 2x$.

4) $A(1, 3)$ est un point de la courbe de fonction $f$ et $f'(1) = 5$ alors l'equation de la tangente est $y = 5x - 2$.

// Source: Parascolaire Analyse p.112

5) $f(x) = x - 1$, si $f$ est derivable en $1$ alors $|f|$ est derivable en $1$.

6) $f(x) = 4 sqrt(x)$ est derivable en $2$.

7) $f$ definie sur $RR$ par $f(x) = x^3$. L'approximation affine de $(1 + h)^3$ par le proche de zero, associe a $f$ est $3(1 + h)$.

#v(0.5em)

// Source: Parascolaire Analyse p.112

== Exercice 10

$f(x) = a x^2 + b x + c$ avec $a$, $b$, $c$ des reels.

Soit $zeta$ la courbe de $f$. Determiner $a$, $b$, $c$ (tel que : $zeta$ passe par $A (1, 4)$ ; $B (-1, 6)$ et la tangente en $A$, ait pour coefficient directeur $3$.

#v(0.5em)

// Source: Parascolaire Analyse p.112

== Exercice 11

$f_m (x) = frac(m x + 1, (2 - m) x + 3)$ ; $m in RR backslash {3}$.

Determiner $m$ pour que $zeta_f$ admette au point d'abscisse $(-1)$ une tangente de coefficient directeur $-2$.

#v(0.5em)

// Source: Parascolaire Analyse p.112

== Exercice 12

$f(x) = |1 - x^2|$.

1) Montrer que au point $x_0 = -1$, la representation graphique de $f$ admet deux demi tangentes.

2) Representer graphiquement ces tangentes.

#v(0.5em)

// Source: Parascolaire Analyse p.112

== Exercice 13

1) Determiner une approximation affine de $sqrt(1 + h)$ pour $h$ voisin de zero.

2) En deduire une valeur approchee des nombres suivants :

$a = sqrt(1,001)$ et $b = sqrt(0,998)$

#v(0.5em)

// Source: Parascolaire Analyse p.112

== Exercice 14

$f$ est definie sur $RR$ par $f(x) = x^2$

1) Determiner l'approximation affine de $f(1 + h)$ pour $h$ proche de $0$.

2) Calculer alors une valeur approchee de $(1,024)^2$.

3) a) Determiner une l'approximation affine de $f(3 + h)$ pour $h$ proche de $0$.

#h(1em) b) Calculer une valeur approchee de $a$ et $b$ tel que $a = (3,01)^2$ et $b = (3,002)^2$.

#v(0.5em)

// Source: Parascolaire Analyse p.112

== Exercice 15

$f$ est definie sur $RR^*$ par $f(x) = frac(1, x)$

1) Determiner l'approximation affine de $f(1 + h)$ pour $h$ voisin de $0$.

2) En deduire une valeur approchee des nombres

$a = frac(1, 1,002)$ ; $b = frac(1, 1,03)$ ; $c = frac(4, 1,001)$ ; $d = frac(1, 0,998)$ ; $e = frac(1, 0,979)$

#v(0.5em)

// Source: Parascolaire Analyse p.112

== Exercice 16

Soit $f(x) = x^3$ et $g(x) = x^2 + x - 5$ definies sur $RR$.

1) pour tout $x_0 in RR$ calculer $f'(x_0)$ et $g'(x_0)$.

// Source: Parascolaire Analyse p.113

2) Existe-t-il des points ou les tangentes aux $zeta_f$ et $zeta_g$ sont paralleles ?

Si oui, preciser leurs coordonnees.

#v(0.5em)

// Source: Parascolaire Analyse p.113

== Exercice 17

On a represente ci-contre une fonction par simple lecture graphique. Determiner :

1) $f(-1)$ ; $f'(-1)$ ; $f(1)$ ; $f'(1)$ ; $f'(3)$.

2) l'equation de la tangente a $C_f$ au point d'abscisse $(-1)$.

3) l'equation de la tangente a $C_f$ au point d'abscisse $3$.

#v(0.5em)

// Source: Parascolaire Analyse p.113

== Exercice 18

Soit $f(x) = [x - E(x)][E(x) + 1 - x]$.

1) Etudier la continuite et la derivabilite au point $x_0 = n, n in ZZ$.

2) Determiner le domaine de continuite.

3) Montrer que $f$ est derivable en tout point $x_0 in (RR backslash ZZ)$ ?

#v(0.5em)

// Source: Parascolaire Analyse p.113

== Exercice 19

Soit $f$ definie sur $RR$ par : $f(x) = cases(-3x^2 + x + 2 #h(0.5em) &"si" x < 1, sqrt(x^2 - 1) + x - 1 #h(0.5em) &"si" x gt.eq 1)$

1) Etudier la derivabilite de $f$ a droite et a gauche en $1$.

2) a) Ecrire une equation de la tangente $T$ a la courbe $zeta$ de $f$ au point $A$ d'abscisse nulle.

#h(1em) b) Determiner le point $M_0 in zeta_f$ d'abscisse $x_0 < 1$ en lequel la tangente $Delta$ est perpendiculaire a $T$.

3) a) soit $x_0 in ]1, + infinity[$. Calculer $f'(x_0)$.

#h(1em) b) Existe-t-il un point $M_0$ d'abscisse $x_0 > 0$ ou la tangente a $zeta_f$ est parallele a droite $D : y = (sqrt(6) + 1) x - 3$

#v(0.5em)

// Source: Parascolaire Analyse p.113

== Exercice 20

Soit $f : RR -> RR ; #h(0.3em) x |-> frac(|x|, x^2 + 1)$

1) a) Determiner le domaine de definition de $f$.

#h(1em) b) Etudier la continuite et la derivabilite en $0$.

2) Montrer que $f$ est derivable sur $RR^*$.

3) Determiner et construire le demi tangente a $zeta_f$ au point d'abscisse $0$.

4) Determiner et construire les tangentes a $zeta_f$ au point d'abscisse $1$ et $1$.

// Source: Parascolaire Analyse p.114

5) Existe-t-il des points de $zeta_f$ ou la tangente est parallele a $Delta$ d'equation : $y = 3x + 1$.

#v(0.5em)

// Source: Parascolaire Analyse p.114

== Exercice 21

Soit la fonction $f$ definie sur $RR$ par :

$ cases(f(x) = 3x^2 - 5x + m #h(0.5em) &"si" x lt.eq 2, f(x) = sqrt(x^2 + 2x - 8) + m x #h(0.5em) &"si" x > 2) $

$zeta$ designe la courbe de $f$ dans un repere orthonorme $(O, arrow(i), arrow(j))$.

1) Determiner $m$ pour que $f$ soit continue au point $x_0 = 2$.

Pour la suite de l'exercice, on prend $m = 2$.

2) a) Etudier la derivabilite de $f$ a gauche et a droite au point $2$.

#h(1em) b) En deduire que $zeta$ admet au point $A$ d'abscisse $2$, deux demi-tangentes que l'on construira.

3) soit $M_0$ un point de $zeta$ d'abscisse $x_0 in ] - infinity, 2[$

#h(1em) a) Ecrire une equation de la tangente $Delta$ a la courbe $zeta$ au point $M_0$.

#h(1em) b) En deduire les points de $zeta$ ayant une abscisse strictement inferieure a $2$ et ou la tangente passe par $B (0, -1)$.

#v(0.5em)

// Source: Parascolaire Analyse p.114

== Exercice 22

Soit $f$ definie par $f(x) = cases(x^3 + a x^2 + b #h(0.5em) &"si" x < 0, frac(x - 2, x + 1) #h(0.5em) &"si" 0 lt.eq x < 2, -sqrt(x) + x - 2 + sqrt(2) #h(0.5em) &"si" x gt.eq 2)$

1) Determiner $a$ et $b$ pour que $f$ soit continue sur $RR$.

2) Calculer $lim_(x -> + infinity) f(x)$ et $lim_(x -> - infinity) f(x)$.

On considere pour la suite $b = -2$ et $a = 1$.

3) a) Determiner le domaine de continuite de $f$.

#h(1em) b) Etudier la derivabilite de $f$ en $0$ et en $2$.

4) a) soit $x_0 in ] - infinity, 0[$, determiner $f'(x_0)$.

#h(1em) b) soit $x_1 in ]0, 2[$, determiner $f'(x_1)$.

5) a) Determiner une equation de la tangente a $zeta_f$ en $-2$ puis en $1$.

#h(1em) b) Existe-t-il un point $M_0$ de $zeta_f$ d'abscisse $x_0 < 2$ dont la tangente $zeta_f$ en $M_0$ soit parallele a $Delta : y = 5x + 1$.

#v(0.5em)

// Source: Parascolaire Analyse p.114-115

== Exercice 23

On considere les fonctions definies sur $RR$ par :

$forall x in RR backslash {1, 2}$ ; $f(x) = frac(x^4 - 2x^3 + a x + b, (x - 1)(x - 2))$ ; $(a, b) in RR^2$ avec $f(1) = 3$

et $f(2) = 7$

// Source: Parascolaire Analyse p.115

et $f_n (x) = frac(n x^(n+1) - (n + 1) x^n + 1, (x - 1)^2)$ ; $n in NN$.

1) a) Determiner $a$ et $b$ pour que $f$ soit continue en $1$ et au point $2$.

#h(1em) b) Montrer que pour tout $x in RR$ ; $f(x) = x^2 + x + 1$

2) Determiner $alpha$ et $beta$ de maniere que la fonction $h |-> frac(sqrt(f(x)) - alpha x - beta, x^2)$

admette une limite finie en $0$. Calculer alors cette limite.

3) a) Montrer par recurrence que : pour tout $n in NN^*$ ;

$f_n (x) = 1 + 2x + 3x^2 + ... + n x^(n-1)$.

#h(1em) b) en deduire que $lim_(x -> 1) f_n (x) = frac(n(n + 1), 2)$

4) Soit $phi : RR -> RR$ ; $x in phi(x) = cases(f(x) #h(0.5em) &"si" x gt.eq 1, f_n (x) #h(0.5em) &"si" x < 1)$

a) Determiner $n$ pour que $phi$ soit continue en $1$.

b) Etudier la derivabilite de $phi$ au point $1$.

#v(0.5em)

// Source: Parascolaire Analyse p.115

== Exercice 24

$f$ definie sur $[-5, 5]$ par $f(x) = frac(3, 5) sqrt(25 - x^2)$

$zeta$ est sa courbe representative dans un R.O.N $(O, arrow(i), arrow(j))$

1) Montrer que l'axe des ordonnees est un axe de symetrie de la courbe $zeta$.

2) Determiner les equations des demi-tangentes aux points d'abscisses $-5$ et $5$.

3) Determiner $f'(x)$ sur $[0, 5[$ en deduire $f'(0)$.

4) Determiner le sens de variations de $f$ sur $[0, 5[$ et dresser son tableau de variations.

5) Tracer la courbe de $f$.

6) En deduire le trace de la courbe $zeta_1$ d'equation $frac(x^2, 25) + frac(y^2, 9) = 1$. La courbe $zeta_1$ est appelee ellipse.

#pagebreak()

// =============================================
// CORRIGES (SOLUTIONS)
// =============================================

#align(center)[
  #text(size: 18pt, weight: "bold")[CORRIGES]
]

#v(1em)

// Source: Parascolaire Analyse p.116

== Exercice 1 -- Solution

*a)* $f(0) = 1$.

$ lim_(x -> 0) frac(f(x) - f(0), x) = lim_(x -> 0) frac(x^3 + 2x^2 - x + 1 - 1, x) = lim_(x -> 0) frac(x^3 + 2x^2 - x, x) $

$ = lim_(x -> 0) x^2 + 2x - 1 = -1 #h(0.5em) "donc" f "est derivable en" 0 "et" f'(0) = -1 $

*b)* $f(-2) = sqrt(-2 + 3) = 1$

$ lim_(x -> -2) frac(f(x) - f(-2), x - (-2)) = lim_(x -> -2) frac(sqrt(x + 3) - 1, x + 2) $

$ = lim_(x -> -2) frac((sqrt(x + 3) - 1)(sqrt(x + 3) + 1), (x + 2)(sqrt(x + 3) + 1)) = lim_(x -> -2) frac(x + 2, (x + 2)(sqrt(x + 3) + 1)) $

$ = lim_(x -> -2) frac(1, sqrt(x + 3) + 1) = frac(1, 2) #h(0.5em) "d'ou" f "est derivable en" -2 "et" f'(-2) = frac(1, 2) $

*c)* $f(1) = 0$.

$ lim_(x -> 1) frac(f(x) - f(1), x - 1) = lim_(x -> 1) frac(sqrt(x - 1), x - 1) = lim_(x -> 1) frac(sqrt(x - 1) dot sqrt(x - 1), (x - 1) sqrt(x - 1)) = lim_(x -> 1) frac(1, sqrt(x - 1)) = + infinity $

Car $lim_(x -> 1) sqrt(x - 1) = 0^+$ donc $f$ n'est pas derivable en $1$.

*d)* $f(-1) = 0$ ;

$ f(x) = cases(x + 1 #h(0.5em) &"si" x gt.eq -1, -(x + 1) #h(0.5em) &"si" x lt.eq -1) $

$ lim_(x -> (-1)^+) frac(f(x) - f(-1), x + 1) = lim_(x -> (-1)^+) frac(x + 1, x + 1) = 1. $

$ lim_(x -> (-1)^-) frac(f(x) - f(-1), x + 1) = lim_(x -> (-1)^-) frac(-(x + 1), x + 1) = -1. $

$ "donc" lim_(x -> (-1)^-) frac(f(x) - f(-1), x + 1) eq.not lim_(x -> (-1)^+) frac(f(x) - f(-1), x + 1) $

$lim_(x -> -1) frac(f(x) - f(-1), x + 1)$ n'existe pas ou encore $f$ n'est pas derivable en $-1$.

// Source: Parascolaire Analyse p.116-117

*e)* $f(x) = x - sqrt(2x + 1)$ alors $f(4) = 4 - sqrt(9) = 1$

$ lim_(x -> 4) frac(f(x) - f(4), x - 4) = lim_(x -> 4) frac(x - sqrt(2x + 1) - 1, x - 4) $

$ = lim_(x -> 4) frac((x - 1 - sqrt(2x + 1))[x - 1 + sqrt(2x + 1)], (x - 4)[x - 1 + sqrt(2x + 1)]) $

$ = lim_(x -> 4) frac((x - 1)^2 - 2x - 1, (x - 4)(x - 1 + sqrt(2x + 1))) = lim_(x -> 4) frac(x^2 - 4x, (x - 4)(x - 1 + sqrt(2x + 1))) $

$ = lim_(x -> 4) frac(x, x - 1 + sqrt(2x + 1)) = frac(4, 6) = frac(2, 3). #h(0.5em) "Donc" f "est derivable en" 4 "et" f'(4) = frac(2, 3). $

#v(1em)

// Source: Parascolaire Analyse p.117

== Exercice 2 -- Solution

$ lim_(x -> a) frac(f(x) - f(a), x - a) = lim_(x -> a) frac((2x^3 - x + 3) - (2a^3 - a + 3), x - a) $

$ = lim_(x -> a) frac(2(x^3 - a^3) - (x - a), x - a) = lim_(x -> a) frac(2(x - a)(x^2 + a x + a^2) - (x - a), x - a) $

$ = lim_(x -> a) 2(x^2 + a x + a^2) - 1 = 6a^2 - 1. $

donc $f$ est derivable en tout point $a$ de $RR$ et $f'(a) = 6a^2 - 1$.

#v(1em)

// Source: Parascolaire Analyse p.117

== Exercice 3 -- Solution

Il s'agit d'appliquer la formule $y = f'(a)(x - a) + f(a)$.

*1)* $f(1) = 2 - 4 + 3 = 1$.

$ lim_(x -> 1) frac(f(x) - f(1), x - 1) = lim_(x -> 1) frac(2x^3 - 4x + 3 - 1, x - 1) = lim_(x -> 1) frac(2x^3 - 4x + 2, x - 1) $

On factorise $2x^3 - 4x + 2$, on remarque que $1$ est une solution.

D'ou $2x^3 - 4x + 2 = (x - 1)(2x^2 + a x + b) = 2x^3 + (a - 2)x^2 + (b - a)x - b$.

Par identification, on obtient : $cases(a - 2 = 0, b - a = -4, -b = 2) arrow.l.r.double cases(a = 2, b = -2)$

D'ou $lim_(x -> 1) frac(f(x) - f(1), x - 1) = lim_(x -> 1) frac((x - 1)(2x^2 + 2x - 2), x - 1) = lim_(x -> 1) 2x^2 + 2x - 2 = 2$.

Donc $f$ est derivable en $1$ et $f'(1) = 2$. Ainsi l'equation de la tangente est

$y = f'(1)(x - 1) + f(1)$. S'ecrit $y = 2(x - 1) + 1$ ou encore $y = 2x - 1$.

// Source: Parascolaire Analyse p.118

*2)* $f(-2) = 3$ et $f'(-2) = lim_(x -> -2) frac(f(x) - f(-2), x + 2) = lim_(x -> -2) frac(frac(x - 1, x + 1) - 3, x + 2)$

$ = lim_(x -> -2) frac(-2x - 4, (x + 1)(x + 2)) = lim_(x -> -2) frac(-2(x + 2), (x + 1)(x + 2)) = lim_(x -> -2) frac(-2, x + 1) = 2. $

donc l'equation de la tangente en $(-2)$ est : $y = f'(-2)(x + 2) + f(-2)$

s'ecrit : $y = 2(x + 2) + 3$ ou encore $y = 2x + 7$.

#v(1em)

// Source: Parascolaire Analyse p.118

== Exercice 4 -- Solution

*a)* $f(-1) = (-1)^2 + 1 = 2$.

$ lim_(x -> (-1)^+) frac(f(x) - f(-1), x + 1) = lim_(x -> (-1)^+) frac(x^2 + 1 - 2, x + 1) = lim_(x -> (-1)^+) frac(x^2 - 1, x + 1) = lim_(x -> (-1)^+) x - 1 = -2 $

Donc $f$ est derivable a droite en $-1$ et $f'_d (-1) = -2$.

$ lim_(x -> (-1)^-) frac(f(x) - f(-1), x + 1) = lim_(x -> (-1)^-) frac(-2x - 2, x + 1) = -2 = f'_g (-1). $

donc $f'_g (-1) = f'_d (-1)$ d'ou $f$ est derivable en $-1$.

*b)* $f(x) = cases(frac(1, x + 1) #h(0.5em) &"si" x gt.eq 0, frac(1, -x + 1) #h(0.5em) &"si" x lt.eq 0)$ #h(2em) on a : $f(0) = 1$

$ lim_(x -> 0^+) frac(f(x) - f(0), x) = lim_(x -> 0^+) frac(frac(1, x + 1) - 1, x) = lim_(x -> 0^+) frac(-x, x(x + 1)) = lim_(x -> 0^+) frac(-1, x + 1) = -1 = f'_d (0). $

$ lim_(x -> 0^-) frac(f(x) - f(0), x) = lim_(x -> 0^-) frac(frac(1, -x + 1) - 1, x) = lim_(x -> 0^-) frac(x, x(x + 1)) = lim_(x -> 0^-) frac(1, x + 1) = 1 = f'_g (0). $

Alors $f'_d (0) eq.not f'_g (0)$ donc $f$ n'est pas derivable en $0$.

#v(1em)

// Source: Parascolaire Analyse p.118

== Exercice 5 -- Solution

$f(1) = 0$ et $f(-1) = 0$.

$ * lim_(x -> 1) frac(f(x) - f(1), x - 1) = lim_(x -> 1) frac((1 - x) sqrt(1 - x^2), x - 1) = lim_(x -> 1^-) -sqrt(1 - x^2) = 0 = f'(1). $

Donc $f$ est derivable en $1$ et $zeta_g$ admet une demi tangente horizontale au point d'abscisse $1$.

// Source: Parascolaire Analyse p.118-119

$ * lim_(x -> -1) frac(f(x) - f(-1), x + 1) = lim_(x -> -1) frac((1 - x) sqrt(1 - x^2), x + 1) $

$ = lim_(x -> -1) frac((1 - x)(1 - x^2), (x + 1) sqrt(1 - x^2)) = lim_(x -> -1) frac((1 - x)(1 - x)(1 + x), (x + 1) sqrt(1 - x^2)) = lim_(x -> -1) frac((1 - x)^2, sqrt(1 - x^2)) = + infinity $

car $lim_(x -> -1) (1 - x)^2 = 4$

Donc $f$ n'est pas derivable en $-1$ et $zeta_f$ admet une demi tangente verticale dirigee vers le haut au point d'abscisse $-1$.

#v(1em)

// Source: Parascolaire Analyse p.119

== Exercice 6 -- Solution

$ lim_(x -> 0^+) frac(f(x) - f(0), x) = lim_(x -> 0^+) frac(x sqrt(x), x) = lim_(x -> 0^+) sqrt(x) = 0 $

Donc $f$ est derivable en $0$.

Et $zeta_f$ admet une demi tangente horizontale a droite en $0$.

#v(1em)

// Source: Parascolaire Analyse p.119

== Exercice 7 -- Solution

*1)* La reponse est $fbox[a]$ : $y = f'(2)(x - 2) + f(2)$

$y = -(x - 2) + 3$ #h(1em) Ainsi la tangente $y = -x + 5$

*2)* La reponse est $fbox[b]$ : $f'(frac(1, 2)) = frac(-2 times frac(1, 2), 2 sqrt(1 - frac(1, 4))) = -frac(1, sqrt(3))$

*3)* La reponse est $fbox[c]$ : d'apres la definition.

*4)* La reponse est $fbox[c]$ : les deux vraies sont \*\* et \*\*\* c'est le theoreme du cours et sa negation.

*5)* La reponse est $fbox[c]$ : d'apres le theoreme des operations sur les fonctions.

#v(1em)

// Source: Parascolaire Analyse p.119-120

== Exercice 8 -- Solution

\* $f(0)$ et $f(-1) = 0$.

$ * lim_(x -> 0) frac(f(x) - f(0), x) = lim_(x -> 0) frac(sqrt(frac(x^2(1 + x), 1 - x)), x) = lim_(x -> 0) frac(|x| sqrt(frac(1 + x, 1 - x)), x) $

$ lim_(x -> 0^+) frac(f(x) - f(0), x) = lim_(x -> 0^+) frac(x sqrt(frac(1 + x, 1 - x)), x) = lim_(x -> 0^+) sqrt(frac(1 + x, 1 - x)) = 1 = f'_d (0). $

$ lim_(x -> 0^-) frac(f(x) - f(0), x) = lim_(x -> 0^-) frac((-x) sqrt(frac(1 + x, 1 - x)), x) = lim_(x -> 0^-) -sqrt(frac(1 + x, 1 - x)) = -1 = f'_g (0). $

Alors $f'_d (0) eq.not f'_g (0)$ donc $f$ n'est pas derivable en $0$ d'ou $zeta_f$ admet deux demi tangentes au point d'abscisse $0$. Ainsi on a un point anguleux.

// Source: Parascolaire Analyse p.120

$ lim_(x -> -1) frac(f(x) - f(-1), x - 1) = lim_(x -> -1) frac(sqrt(frac(x^2(1 + x), 1 - x)), x + 1) = lim_(x -> -1) frac(frac(x^2(1 + x), 1 - x), (x + 1) sqrt(frac(x^2(1 + x), 1 - x))) $

$ lim_(x -> -1) frac(x^2, (1 - x) sqrt(frac(x^2(1 + x), 1 - x))) = + infinity #h(0.5em) "donc" f "n'est pas derivable en" -1 "et" zeta_f "admet" $

une tangente verticale au point d'abscisse $(-1)$.

#v(1em)

// Source: Parascolaire Analyse p.120

== Exercice 9 -- Solution

*1)* faux : $f(x) = sqrt(2) x^2$ alors $f'(a) = sqrt(2) dot 2a = 2 sqrt(2) a$

Soit $f'(a) = 4 frac(a, sqrt(2)) eq.not frac(a, sqrt(2))$

*2)* faux : $f(x) = sqrt(2) x$ alors $f'(a) = sqrt(2) eq.not frac(a, 2 sqrt(2))$

*3)* vrai : la tangente a pour equation

$y = f'(1)(x - 1) + f(1)$ soit $y = 2(x - 1) + 2$ d'ou $y = 2x$

*4)* vrai : $A(1, 3) in zeta$ alors $f(1) = 3$ et on a $f'(1) = 5$

Ainsi $y = f'(1)(x - 1) + f(1)$

$y = f'(1)(x - 1) + f(1)$

$y = 5(x - 1) + 3$ soit $y = 5x - 2$

*5)* faux : $|f(x)| = |x - 1| = cases(x - 1 #h(0.5em) &"si" x gt.eq 1, -x + 1 #h(0.5em) &"si" x lt.eq 1)$

$f'_d (1) = 1 eq.not f'_g (1) = -1$

*6)* vrai : $f(x) = 4 sqrt(x)$ est derivable sur $]0, + infinity[$ en particulier en $2$.

*7)* faux : $f(x) = x^3$ alors $f'(x) = 3a^2$

$f'(1) = 3$ donc $f(1 + h) = f'(1) h + f(1) = 3h + 1 eq.not 3(1 + h)$

#v(1em)

// Source: Parascolaire Analyse p.120

== Exercice 10 -- Solution

\* $A(1, 4) in zeta arrow.double f(1) = 4 arrow.double a + b + c = 4$

\* $B(-1, 6) in zeta arrow.double f(-1) = 6 arrow.double a - b + c = 6$ #h(0.5em) soustrait membre a membre

On obtient $2b = -2$ donc $b = -1$.

$ * lim_(x -> 1) frac(f(x) - f(1), x - 1) = lim_(x -> 1) frac(a x^2 - x + c - (a - 1 + c), x - 1) = lim_(x -> 1) frac(a(x^2 - 1) - (x - 1), x - 1) $

$ = lim_(x -> 1) a(x + 1) - 1 = 2a - 1 = f'(1). $

// Source: Parascolaire Analyse p.121

La tangente en $A$ a pour coefficient directeur $f'(1) = 3$ d'autre part

$f'(1) = 2a - 1$ Donc $2a - 1 = 3$ ou encore $a = 2$.

Or $a + c = 4 - b$ soit $2 + c = 4 + 1$ ainsi $c = 3$.

#v(1em)

// Source: Parascolaire Analyse p.121

== Exercice 11 -- Solution

$f'(-1) = -2$ ; cherchons $f'(-1) = lim_(x -> -1) frac(f(x) - f(-1), x + 1)$

$ = lim_(x -> -1) frac(frac(m x + 1, (2 - m) x + 3) - frac(-m + 1, (2 - m)(-1) + 3), x + 1) = lim_(x -> -1) frac((m + 1)(m x + 1) + (m - 1)[(2 - m)x + 3], (m + 1)(x + 1)[(2 - m)x + 3]) $

$ = lim_(x -> -1) frac((4m - 2)(x + 1), (m + 1)(x + 1)[(2 - m)x + 3]) = frac(4m - 2, (m + 1)[m + 1]) = frac(4m - 2, (m + 1)^2) $

$f'(-1) = -2 arrow.l.r.double frac(4m - 2, (m + 1)^2) = -2 arrow.l.r.double -2m + 1 = (m + 1)^2$

$arrow.l.r.double m^2 + 4m = 0 arrow.l.r.double m(m + 4) = 0 arrow.l.r.double m = 0$ ou $m = -4$.

#v(1em)

// Source: Parascolaire Analyse p.121

== Exercice 12 -- Solution

*1)* Tableau de signe de $1 - x^2$ :

#table(
  columns: (auto, auto, auto, auto, auto, auto),
  align: center,
  stroke: 0.5pt,
  [$x$], [$-infinity$], [$-1$], [], [$1$], [$+ infinity$],
  [$1 - x^2$], [$-$], [$0$], [$+$], [$0$], [$-$],
)

D'ou $f(x) = cases(1 - x^2 #h(0.5em) &"si" x in [-1, 1], x^2 - 1 #h(0.5em) &"si" x in ]- infinity, -1] union [1, + infinity[)$

$ lim_(x -> (-1)^+) frac(f(x) - f(-1), x + 1) = lim_(x -> (-1)^+) frac(1 - x^2, x + 1) = lim_(x -> (-1)^+) 1 - x = 2 $

Donc $f$ est derivable a droite en $-1$ et $f'_d (-1) = 2$.

$ lim_(x -> -1^-) frac(f(x) - f(-1), x + 1) = lim_(x -> -1^-) frac(x^2 - 1, x + 1) = lim_(x -> -1^-) frac((x - 1)(x + 1), x + 1) = lim_(x -> -1^-) x - 1 = -2 $

Donc $f$ est derivable a gauche en $-1$ et $f'_g (-1) = -2 eq.not f'_d (-1)$

D'ou $zeta_f$ admet deux demi tangentes au point d'abscisse $(-1)$.

*2)* la tangente a droite :

$Delta_d : y = 2(x + 1).$

La tangente a gauche :

$Delta_g : y = -2(x + 1).$

#v(1em)

// Source: Parascolaire Analyse p.122

== Exercice 13 -- Solution

1) On considere $f$ definie sur $RR_+$, par $f(x) = sqrt(x)$ et $f'(a) = frac(1, 2 sqrt(a))$.

$f$ est derivable en $1$ et $f'(1) = frac(1, 2)$.

Une approximation affine de $f$ en $1$ est la fonction $f'(1) dot h + f(1) = frac(1, 2) h + 1$

D'ou $sqrt(1 + h) approx frac(1, 2) h + 1$

2) Pour determiner les deux valeurs approchees demandees on ecrit $a$ et $b$ sous la forme $sqrt(1 + h)$

\* $a = sqrt(1,001) = sqrt(1 + 0,001) approx frac(1, 2)(0,001) + 1 = 1,0005$

\* $b = sqrt(0,998) = sqrt(1 + (-0,002)) approx frac(1, 2)(-0,002) + 1 = 0,999.$

#v(1em)

// Source: Parascolaire Analyse p.122

== Exercice 14 -- Solution

$f(x) = x^2$ on sait que $f'(a) = 2a$ pour tout $a in RR$

*1)* $f$ est derivable en $1$ et $f'(1) = 2 times 1 = 2$

une approximation affine de $f$ en $1$ est $f'(1) dot h + f(1) = 2h + 1$

ainsi $f(1 + h) approx f'(1) h + f(1)$

d'ou $f(1 + h) approx 2h + 1$

*2)* On ecrit $(1,024)^2 = (1 + 0,024)^2$

ainsi $(1 + 0,024)^2 approx 2 times (0,024) + 1 = 1,048$.

*3)* a) $f'(3) = 2 times 3 = 6$

une approximation affine de $f$ en $3$ est $f(3) + f'(3) h$

ainsi $f(3 + h) approx f(3) + f'(3) h$

$f(3 + h) approx 9 + 6h$

b) il faut ecrire $a$ et $b$ sous forme $(3 + h)^2$

$a = (3,01)^2 = (3 + 0,1)^2 approx 9 + 6 times 0,1 = 9,6$

$b = (3,002)^2 = (3 + 0,002)^2 approx 9 + 6 times 0,002 = 9,012$

#v(1em)

// Source: Parascolaire Analyse p.122-123

== Exercice 15 -- Solution

*1)* On sait que $f(x) = frac(1, x)$ c'est une fonction usuelle $forall a in RR^*$, $f'(a) = -frac(1, a^2)$

$f$ est derivable en $1$ et $f'(1) = -1$

une approximation affine de $f$ en $1$ est $f(1) + f'(1) h = 1 - h$

ainsi $f(1 + h) = frac(1, 1 + h) approx 1 - h$

*2)* $a = frac(1, 1,002) = frac(1, 1 + 0,002) = 1 - 0,002 = 0,998$

$b = frac(1, 1,03) = frac(1, 1 + 0,03) = 1 - 0,03 = 0,97$

$c = frac(4, 1,001) = 4 times frac(1, 1 + 0,001) = 4(1 - 0,001) = 4 - 0,004 = 3,996$

$d = frac(1, 0,998) = frac(1, 1 + (-0,002)) = 1 - (-0,002) = 1,002$

$e = frac(1, 0,979) = frac(1, 1 + (-0,021)) = 1 + 0,021 = 1,021$

#v(1em)

// Source: Parascolaire Analyse p.123

== Exercice 16 -- Solution

*1)* $f(x) = x^3$ fonction usuelle donc $f$ est derivable sur $RR$ et $f'(x_0) = 3 x_0^2$

$g$ est la somme de fonction usuelle derivable sur $RR$ comme $(x_0^2)' = 2 x_0$ et $(5)' = 0$

Donc $g$ est derivable sur $RR$ Alors $g'(x_0) = 2 x_0 + 1$.

*2)* deux droites sont paralleles si et seulement si elles ont le meme coefficient directeur, il faut donc resoudre l'equation $f'(x_0) = g'(x_0)$.

Soit $2 x_0 + 1 = 3 x_0^2$ ou encore $3 x_0^2 - 2 x_0 - 1 = 0$.

Les solutions sont : $x_0 = 1$ ou $x_0 = -frac(1, 3)$.

Les points cherches ont pour coordonnees $(1, 1)$ et $(-frac(1, 3), -frac(1, 27))$.

#v(1em)

// Source: Parascolaire Analyse p.123

== Exercice 17 -- Solution

*1)* \* $f(-1) = 1$, $f(1) = 0$.

- La tangente au point d'abscisse $(-1)$ passe par les points $(-1, 1)$ et $(-2, 2)$

donc leur coefficient directeur vaut : $frac((2) - (1), (-2) - (-1)) = frac(1, -1) = -1$

Donc $f'(-1) = -1$.

- La tangente a $zeta_f$ au point d'abscisse $1$ respectivement en $3$, est

Parallele $Delta$ a l'axe $(x x')$ donc $f'(1) = 0$ et $f'(3) = 0$.

*2)* La tangente a $zeta_f$ au point d'abscisse $(-1)$ a pour equation :

$y = f'(-1)(x + 1) + f(-1)$ or $f(-1) = 1$ et $f'(-1) = -1$.

D'ou $y = -x$.

*3)* La tangente a $zeta_f$ au point d'abscisse $3$ a pour equation :

$y = f'(3)(x - 3) + f(3)$ or $f'(3) = 0$ et $f(3) = 1$. Soit $y = 1$.

#v(1em)

// Source: Parascolaire Analyse p.123-124

== Exercice 18 -- Solution

*1)* Si $x in [n, n + 1[$ alors $E(x) = n$ donc $f(x) = (x - n)(n + 1 - x)$

Si $x in [n - 1, n[$ alors $E(x) = n - 1$

Donc $f(x) = (x - n + 1)(n - 1 + 1 - x) = (x - n + 1)(n - x)$

$lim_(x -> n^+) f(x) = lim_(x -> n^+) (x - n)(n + 1 - x) = 0$

$lim_(x -> n^-) f(x) = lim_(x -> n^-) (x - n + 1)(n - x) = 0$

$f(n) = [n - E(n)][E(n) + 1 - n] = 0$ car $E(n) = n$

$lim_(x -> n^+) f(x) = lim_(x -> n^-) f(x) = f(n)$ #h(1em) donc $f$ est continue en tout point $n in ZZ$.

derivabilite en $x_0 = n$ :

$lim_(x -> n^+) frac(f(x) - f(n), x - n) = lim_(x -> n^+) frac((x - n)(n + 1 - x), x - n) = lim_(x -> n^+) n + 1 - x = 1 = f'_d (n)$

$lim_(x -> n^-) frac(f(x) - f(n), x - n) = lim_(x -> n^-) frac((x - n + 1)(n - x), x - n) = lim_(x -> n^-) -x + n - 1 = -1 = f'_g (n)$

Donc $f'_d (n) eq.not f'_g (n)$ d'ou $f$ n'est pas derivable en tout point $n in ZZ$.

*2)* $x |-> x$ polynome continue sur $RR$ :

$x |-> 1 - x$ polynome continue sur $RR$ et $x |-> E(x)$ continue sur $RR backslash ZZ$.

D'ou $f$ est continue sur $RR backslash ZZ$, et d'apres la 1#super[ere] question, $f$ est continue en tout point $n in ZZ$. On conclut que $f$ est continue sur $RR$.

*3)* La restriction de $f$ sur chaque intervalle de la forme $[n, n + 1[$ est un polynome de la forme $(x - n)(n + 1 - x)$ donc derivable sur $RR backslash ZZ$ et on a montre que $f$ n'est pas derivable en tout point $n in ZZ$.

ainsi $f$ est derivable sur $RR backslash ZZ$.

#v(1em)

// Source: Parascolaire Analyse p.124

== Exercice 19 -- Solution

*1)* $lim_(x -> 1^-) frac(f(x) - f(1), x - 1) = lim_(x -> 1^-) frac(-3x^2 + x + 2, x - 1) = lim_(x -> 1^-) frac(-3(x - 1)(x + frac(2, 3)), x - 1)$

$= lim_(x -> 1^-) -3x - 2 = -5$ donc $f$ est derivable a gauche en $1$.

$lim_(x -> 1^+) frac(f(x) - f(1), x - 1) = lim_(x -> 1^+) frac(sqrt(x^2 - 1) + x - 1, x - 1) = lim_(x -> 1^+) frac(sqrt(x^2 - 1), x - 1) + 1$

$= lim_(x -> 1^+) frac(x^2 - 1, (x - 1) sqrt(x^2 - 1)) + 1 = lim_(x -> 1^+) frac(x + 1, sqrt(x^2 - 1)) + 1 = + infinity.$

Donc $f$ n'est pas derivable a droite en $1$.

*2)* a) $T : y = f'(0)(x - 0) + f(0)$ ; $f(0) = 2$

et $lim_(x -> 0) frac(f(x) - f(0), x) = lim_(x -> 0) frac((-3x^2 + x + 2) - 2, x)$

$= lim_(x -> 0) frac(-3x^2 + x, x) = lim_(x -> 0) -3x + 1 = 1 = f'(0)$ D'ou $T : y = x + 2$.

// Source: Parascolaire Analyse p.124-125

b) $Delta : y = f'(x_0)(x - x_0) + f(x_0)$

$T : y = x + 2$.

$Delta perp T arrow.l.r.double arrow(u) vec(1, 1)$ vecteur directeur de $T$ est orthogonal a $arrow(u) vec(1, f'(x_0))$

Ou encore $f'(x_0) + 1 = 0$.

Soit $f'(x_0) = -1$ comme $f$ est la somme de $3$ fonctions usuelles

$f'(x_0) = -1 arrow.l.r.double -6 x_0 + 1 = -1 arrow.l.r.double -6 x_0 = -2 arrow.l.r.double x_0 = frac(1, 3)$

et $frac(1, 3) < 1$ d'ou $M_0(frac(1, 3), 2)$.

*3)* a) $f(x) = sqrt(x^2 - 1) + x - 1$ sur $[1, + infinity[$

$f$ est la somme de deux fonctions derivable sur $[1, + infinity[$

$(sqrt(x_0^2 - 1))' = frac(2 x_0, 2 sqrt(x_0^2 - 1)) = frac(x_0, sqrt(x_0^2 - 1))$ et $(x_0 - 1)' = 1$

Alors $f'(x_0) = frac(x_0, sqrt(x_0^2 - 1)) + 1$

b) Si $x_0 in ]0, 1[$ alors $f'(x_0) = -6 x_0 + 1$

$T parallel D arrow.l.r.double f'(x_0) = sqrt(6) + 1 arrow.l.r.double -6 x_0 = sqrt(6) arrow.l.r.double x_0 = -frac(1, sqrt(6))$

a rejeter car $-frac(1, sqrt(6)) in.not ]0, 1[$.

Donc il n'existe aucune tangente en $M_0$ parallele a $D$, D'abscisse $x_0 in ]0, 1[$.

si $x_0 in ]1, + infinity[$ alors $f'(x_0) = frac(x_0, sqrt(x_0^2 - 1)) + 1$

$T parallel D arrow.l.r.double sqrt(6) + 1 = f'(x_0) arrow.l.r.double sqrt(6) = frac(x_0, sqrt(x_0^2 - 1))$

$arrow.l.r.double frac(x_0^2, x_0^2 - 1) = 6 arrow.l.r.double x_0^2 = 6 x_0^2 - 6 arrow.l.r.double x_0^2 = frac(6, 5) arrow.l.r.double x_0 = sqrt(frac(6, 5))$ ou $x_0 = -sqrt(frac(6, 5))$

$-sqrt(frac(6, 5))$ a rejeter car $-sqrt(frac(6, 5)) in.not ]1, + infinity[$ or $+ sqrt(frac(6, 5)) in ]1, + infinity[$

// Source: Parascolaire Analyse p.126

Donc il existe une seule tangente a $zeta$ au point d'abscisse $sqrt(frac(6, 5))$ parallele a $D$.

#v(1em)

// Source: Parascolaire Analyse p.126

== Exercice 20 -- Solution

*1)* a) $D_f = RR$.

b) *Continuite en 0 :* $lim_(x -> 0) f(x) = lim_(x -> 0) frac(|x|, x^2 + 1) = frac(0, 1) = 0 = f(0)$

donc $lim_(x -> 0) f(x) = f(0)$ d'ou $f$ est continue en $0$.

*Derivabilite en 0 :*

$ lim_(x -> 0^+) frac(f(x) - f(0), x) = lim_(x -> 0^+) frac(frac(x, x^2 + 1), x) = lim_(x -> 0^+) frac(1, x^2 + 1) = 1 = f'_d (0) $

$ lim_(x -> 0^-) frac(f(x) - f(0), x) = lim_(x -> 0^-) frac(frac(-x, x^2 + 1), x) = lim_(x -> 0^-) -frac(1, x^2 + 1) = -1 = f'_g (0) $

alors $f'_d (0) eq.not f'_g (0)$ d'ou $f$ n'est pas derivable en $0$.

*2)* $f(x) = cases(frac(x, x^2 + 1) #h(0.5em) &"si" x gt.eq 0, frac(-x, x^2 + 1) #h(0.5em) &"si" x lt.eq 0)$

soit $x_0 in ]0, + infinity[$ ; $lim_(x -> x_0) frac(f(x) - f(x_0), x - x_0) = lim_(x -> x_0) frac(frac(x, x^2 + 1) - frac(x_0, x_0^2 + 1), x - x_0)$

$= lim_(x -> x_0) frac(x(x_0^2 + 1) - x_0(x^2 + 1), (x^2 + 1)(x_0^2 + 1)(x - x_0)) = lim_(x -> x_0) frac(x x_0(x_0 - x) + x - x_0, (x^2 + 1)(x_0^2 + 1)(x - x_0))$

$= lim_(x -> x_0) frac((x - x_0)(1 - x x_0), (x^2 + 1)(x_0^2 + 1)(x - x_0)) = lim_(x -> x_0) frac(1 - x x_0, (x^2 + 1)(x_0^2 + 1)) = frac(1 - x_0^2, (x_0^2 + 1)^2) = f'(x_0)$

donc $f$ est derivable sur $]0, + infinity[$

de meme sur $] - infinity, 0[$,

on obtient : $f'(x_0) = frac(x_0^2 - 1, (x_0^2 + 1)^2)$

d'ou $f$ est derivable sur $RR^*$.

// Source: Parascolaire Analyse p.127

*3)* le point $theta(0, 0)$ ; $f'_d (0) = 1$, et $f'_g (0) = -1$

donc $T_d : y = x$ et $T_g : y = -x$

*4)* $1 in ]0, + infinity[$ ; $f'(x_0) = frac(1 - x_0^2, (x_0^2 + 1)^2)$ donc $f'(1) = 0$

$(-1) in ] - infinity, 0[$ ; $f'(x_0) = frac(x_0^2 - 1, (x_0^2 + 1)^2)$ donc $f'(-1) = 0$

au point $(1, f(1))$ et $(-1, f(-1))$, on a deux tangentes horizontales.

$f(1) = frac(1, 2) = f(-1).$

*5)* le coefficient directeur d'une tangente est $f'(x_0)$ et celui de $Delta$ est $3$ par suite

$Delta parallel T arrow.l.r.double f'(x_0) = 3$.

si $x_0 in ] - infinity, 0[$ ; $f'(x_0) = 3 arrow.l.r.double frac(x_0^2 - 1, (x_0^2 + 1)^2) = 3 arrow.l.r.double x_0^2 - 1 = 3(x_0^2 + 1)^2$

$arrow.l.r.double 3 x_0^4 + 6 x_0^2 + 3 - x_0^2 + 1 = 0 arrow.l.r.double 3 x_0^4 + 5 x_0^2 + 4 = 0.$

on pose : $t_0 = x_0^2$ l'equation devient $3 t_0^2 + 5 t_0 + 4 = 0$.

$Delta = 25 - 4 times (12) <$ donc pas de solution. dans ce cas :

Si $x_0 in ]0, + infinity[$ ; $f'(x_0) = 3 arrow.l.r.double frac(1 - x_0^2, (x_0^2 + 1)^2) = 3$

$arrow.l.r.double 3 x_0^4 + 6 x_0^2 + 1 = 1 - x_0^2 arrow.l.r.double 3 x_0^4 + 7 x_0^2 = 0$

$arrow.l.r.double x_0^2(3 x_0^2 + 7) = 0 arrow.l.r.double x_0 = 0 in.not ]0, + infinity[$

donc il n'existe aucune tangente a $zeta_f$ qui est parallele a $Delta$.

#v(1em)

// Source: Parascolaire Analyse p.127

== Exercice 21 -- Solution

$f$ est continue en $2$ si seulement si $lim_(x -> 2^+) f(x) = lim_(x -> 2^-) f(x) = f(2)$

$lim_(x -> 2^+) f(x) = lim_(x -> 2^+) sqrt(x^2 + 2x - 8) + m x = 2m = f(2)$

et $lim_(x -> 2^-) f(x) = lim_(x -> 2^-) 3x^2 - 5x + m = 2 + m$ alors $2 + m = 2m arrow.l.r.double m = 2$.

$f$ est continue en $2$ si et seulement si $m = 2$.

// Source: Parascolaire Analyse p.127-128

*2)* a) $lim_(x -> 2^+) frac(f(x) - f(2), x - 2) = lim_(x -> 2^+) frac(sqrt(x^2 + 2x - 8) + 2(x - 2), x - 2)$

$= lim_(x -> 2^+) frac(sqrt(x^2 + 2x - 8), x - 2) + 2 = lim_(x -> 2^+) frac(x^2 + 2x - 8, (x - 2) sqrt(x^2 + 2x - 8)) + 2$

$= lim_(x -> 2^+) frac((x - 2)(x + 4), (x - 2) sqrt(x^2 + 2x - 8)) + 2 = lim_(x -> 2^+) frac(x + 4, sqrt(x^2 + 2x - 8)) + 2 = + infinity$

donc $f$ n'est pas derivable a droite en $2$.

- 1#super[ere] methode : $lim_(x -> 2^-) frac(f(x) - f(2), x - 2) = lim_(x -> 2^-) frac(3x^2 - 5x + 2 - 4, x - 2) = lim_(x -> 2^-) frac(3x^2 - 5x - 2, x - 2)$.

Factorisons $3x^2 - 5x - 2$. On remarque que $2$ est une racine

alors $x' times x'' = frac(c, a) = -frac(2, 3)$ or $x' = 2$ alors $x'' = -frac(1, 3)$

Ainsi $lim_(x -> 2^-) frac(3(x - 2)(x + frac(1, 3)), x - 2) = lim_(x -> 2^-) 3x + 1 = 7$

donc $f$ est derivable a gauche en $2$.

2#super[eme] methode :

la restriction de $f$ sur $] - infinity, 2]$ est forme par $2$ fonctions usuelles derivable sur $] - infinity, 2]$ alors $f'(x_0) = 6 x_0 - 5$

donc $f'_g (2) = 12 - 5 = 7$

b) $lim_(x -> 2^+) frac(f(x) - f(2), x - 2) = + infinity$

et $lim_(x -> 2^-) frac(f(x) - f(2), x - 2) = 7$

alors $zeta_f$ admet une demi-tangente verticale dirigee vers le haut en $2$ et l'autre qui a pour vecteur directeur $arrow(u)_g vec(1, 7)$.

*3)* $x_0 in ] - infinity, 2[$.

on a : $6 x_0 - 5 = f'(x_0)$.

$Delta : y = f'(x_0)(x - x_0) + f(x_0) arrow.l.r.double Delta : y = (6 x_0 - 5)x - 6 x_0^2 + 5 x_0 + 3 x_0^2 - 5 x_0 + 2$

d'ou $Delta : y = (6 x_0 - 5)x - 3 x_0^2 + 2$.

b) $B(0, -1) in Delta arrow.l.r.double -1 = (6 x_0 - 5) dot 0 - 3 x_0^2 + 2 arrow.l.r.double -3 x_0^2 + 2 = -1$

$arrow.l.r.double x_0^2 = 1 arrow.l.r.double x_0 = 1$ ou $x = -1$, appartiennent a $] - infinity, 2]$

donc il y a deux points de $zeta$ passant par $B$, le point $E' (1, 0)$ et $E'' (-1, 10)$.

#v(1em)

// Source: Parascolaire Analyse p.129

== Exercice 22 -- Solution

*1)* La restriction de $f$ sur $] - infinity, 0[$ est un polynome donc continue sur : $] - infinity, 0[$ et sur $]0, 2[$ est rationnelle donc continue sur $]0, 2[$ et sur $]2, + infinity[$

$f$ est continue car c'est la somme des fonctions continues.

$lim_(x -> 0^-) f(x) = lim_(x -> 0^-) x^3 + a x^2 + b = b$

$lim_(x -> 0^+) f(x) = lim_(x -> 0^+) frac(x - 2, x + 1) = -2 = f(0)$

$f$ est une continue en $0$ si et seulement si $b = -2$.

$lim_(x -> 2^-) f(x) = lim_(x -> 2^-) frac(x - 2, x + 2) = 0$

$lim_(x -> 2^+) f(x) = lim_(x -> 2^+) -sqrt(x) + x - 2 + sqrt(2) = 0 = f(2)$ donc $f$ est continue en $2$.

Finalement $f$ est continue sur $RR$, si et seulement si $b = -2$ et $a in RR$.

*2)* $lim_(x -> + infinity) f(x) = lim_(x -> + infinity) -sqrt(x) + x - 2 + sqrt(2) = lim_(x -> + infinity) x(-frac(1, sqrt(x)) + 1 - frac(2, x) + frac(sqrt(2), x)) = + infinity$

$lim_(x -> - infinity) f(x) = lim_(x -> - infinity) x^3 + a x^2 + b = lim_(x -> - infinity) x^3 = - infinity$.

*3)* a) $b = -2$ et $a = 1$ et d'apres la 1#super[ere] question, on a alors $f$ est continue sur $RR$.

b) *La derivabilite en 0 :* $lim_(x -> 0^+) frac(f(x) - f(0), x) = lim_(x -> 0^+) frac(frac(x - 2, x + 1) + 2, x)$

$lim_(x -> 0^+) frac((x - 2) + 2(x + 1), x(x + 1)) = lim_(x -> 0^+) frac(3x, x(x + 1)) = lim_(x -> 0^+) frac(3, x + 1) = 3 = f'_d (0).$

et $lim_(x -> 0^-) frac(f(x) - f(0), x) = lim_(x -> 0^-) frac(x^3 + x^2 - 2 + 2, x) = lim_(x -> 0^-) frac(x^2(x + 1), x)$

$= lim_(x -> 0^-) x(x + 1) = 0 = f'_g (0).$

alors $f'_d (0) eq.not f'_g (0)$ d'ou $f$ n'est pas derivable en $0$.

*La derivabilite en 2 :*

// Source: Parascolaire Analyse p.129-130

$lim_(x -> 2^-) frac(f(x) - f(2), x) = lim_(x -> 2^-) frac(frac(x - 2, x + 1), x - 2) = lim_(x -> 2^-) frac(1, x + 1) = frac(1, 3) = f'_g (2).$

$lim_(x -> 2^+) frac(f(x) - f(2), x) = lim_(x -> 2^+) frac(x - 2 + sqrt(2) - sqrt(x), x - 2) = lim_(x -> 2^+) 1 + frac(sqrt(2) - sqrt(x), x - 2)$

$lim_(x -> 2^+) frac((sqrt(2) - sqrt(x))(sqrt(2) + sqrt(x)), (x - 2)(sqrt(2) + sqrt(x))) + 1 = 1 + lim_(x -> 2^+) -frac(1, sqrt(2) + sqrt(x))$

$= 1 - frac(1, 2 sqrt(2)) = f'_g (2)$ alors $f'_d (2) eq.not f'_g (2)$ donc $f$ n'est pas derivable en $2$.

*4)* a) $x_0 in ] - infinity, 0[$ ; $f$

d'apres les theoremes sur les fonctions usuelles et leur addition on conclut alors que la restriction de $f$ a $] - infinity, 0]$ est derivable et $f'(x_0) = 3 x_0^2 + 2 x_0$

b) La restriction de $f$ sur $]0, 2[$ est une fonction usuelle donc derivable sur $]0, 2[$

$f'(x_0) = frac(1 + 2, (x_0 + 1)^2) = frac(3, (x_0 + 1)^2)$

// Source: Parascolaire Analyse p.130

*5)* a) $-2 in ] - infinity, 0[$ ; $f(-2) = (-2)^3 + (-2)^2 - 2 = -6$ et $f'(-2) = 3(-2)^2 + 2(-2) = 8$

ainsi la tangente en $(-2)$ est : $y = f'(-2)(x + 2) + f(-2)$

ou encore $y = 8(x + 2) - 6$ soit $y = 8x + 10$.

\* $1 in ]0, 2[$ alors $f(1) = frac(1 - 2, 1 + 1) = -frac(1, 2)$ et $f'(1) = frac(3, (1 + 1)^2) = frac(3, 4)$

ainsi la tangente en $1$ est : $y = f'(1)(x - 1) + f(1)$

soit $y = frac(3, 4)(x - 1) - frac(1, 2)$ ou encore $y = frac(3, 4) x - frac(5, 4)$.

b) $T$ : La tangente de coefficient directeur $f'(x_0)$

$Delta : y = 5x + 1$ de coefficient directeur $5$

$T parallel Delta arrow.l.r.double f'(x_0) = 5$

si $x_0 in ] - infinity, 0[$ ; $f'(x_0) = 5 arrow.l.r.double 3 x_0^2 + 2 x_0 = 5$

$arrow.l.r.double 3 x_0^2 + 2 x_0 - 5 = 0 arrow.l.r.double x_0 = 1$ ou $x_0 = -frac(5, 3)$ or $1 in.not ] - infinity, 0[$

Il existe alors une tangente a $zeta_f$ au point d'abscisse $x_0 = -frac(5, 3)$

\* $1 in ]0, 2[$ alors $f'(x_0) = frac(3, (x_0 + 1)^2)$

$T parallel Delta arrow.l.r.double f'(x_0) = 5 arrow.l.r.double frac(3, (x_0 + 1)^2) = 5$

$arrow.l.r.double 5(x_0 + 1)^2 = 3$ -- on ne trouve pas de solution dans $]0, 2[$.

#v(1em)

// Source: Parascolaire Analyse p.130-131

== Exercice 23 -- Solution

*1)* a) $lim_(x -> 1) f(x) = lim_(x -> 1) frac(x^4 - 2x^3 + a x + b, (x - 1)(x - 2)) = (frac(1 - 2 + a + b, 0))$

est fini lorsque $a + b - 1 = 0$.

$lim_(x -> 2) f(x) = lim_(x -> 2) frac(x^4 - 2x^3 + a x + b, (x - 1)(x - 2)) = (frac(2a + b, 0))$

est fini que lorsque : $2a + b = 0 arrow.l.r.double b = -2a$

or $a + b = 1$ donc $-a = 1 arrow.l.r.double a = -1$ et $b = 2$.

b) $f(x) = frac(x^4 - 2x^3 - x + 2, (x - 1)(x - 2))$. On remarque que $1$ et $2$ sont des racines de polynome

$x^4 - 2x^3 - x + 2$ d'ou

$x^4 - 2x^3 - x + 2 = (x - 1)(x - 2)(a x^2 + b x + c)$

$= (x^2 - 3x + 2)(a x^2 + b x + c)$

$= (a x^4 + (b - 3a) x^3 + x^2(2a + c - 3b) + x(2b - 3c) + 2c)$

Par identification, on obtient : $cases(a = 1, b - 3a = -2, 2a + c - 3b = 0, -3c + 2b = -1, 2c = 2) arrow.l.r.double cases(a = 1, b = 1, c = 1)$

par suite $f(x) = frac((x - 1)(x - 2)(x^2 + x + 1), (x - 1)(x - 2)) = x^2 + x + 1$.

// Source: Parascolaire Analyse p.131

*2)* $lim_(x -> 0) h(x) = lim_(x -> 0) frac(sqrt(x^2 + x + 1) - alpha x - beta, x^2) = (frac(1 - beta, 0^+))$

est finie que lorsque $beta = 1$.

$lim_(x -> 0) h(x) = lim_(x -> 0) frac(sqrt(x^2 + x + 1) - alpha x - 1, x^2) = lim_(x -> 0) frac(x^2 + x + 1 - (alpha x + 1)^2, x^2 [sqrt(x^2 + x + 1) + alpha x + 1])$

$= lim_(x -> 0) frac((1 - alpha^2)x^2 + (1 - 2 alpha) x, x^2 [sqrt(x^2 + x + 1) + alpha x + 1])$

$= lim_(x -> 0) frac(1 - alpha^2, sqrt(x^2 + x + 1) + alpha x + 1) + frac(1 - 2 alpha, x(sqrt(x^2 + x + 1) + alpha x + 1))$

est finie que pour $1 - 2 alpha = 0 arrow.l.r.double alpha = frac(1, 2)$

$"ainsi" lim_(x -> 0) h(x) = lim_(x -> 0) frac(frac(3, 4), sqrt(x^2 + x + 1) + frac(1, 2) x + 1) = frac(3, 8).$

*3)* a) \* $f_1(x) = frac(x^2 - 2x + 1, (x^2 - 1)) = 1$. donc la propriete est vraie pour l'ordre $1$.

\* Supposons que la propriete est vraie pour l'ordre $p$.

Soit $f_p (x) = frac(p x^(p+1) - (p + 1) x^p + 1, (x - 1)^2) = 1 + 2x + ... + p x^(p-1).$

// Source: Parascolaire Analyse p.132

\* Montrons que c'est vraie pour l'ordre $(p + 1)$

$[1 + 2x + ... + p x^(p-1)] + (p + 1)x^p = frac(p x^(p+1) - (p + 1) x^p + 1, (x - 1)^2) + (p + 1)x^p$

$= frac(p x^(p+1) - (p + 1)x^p + 1 + (p + 1)x^p (x^2 - 2x + 1), (x - 1)^2)$

$= frac(p x^(p+1) - (p + 1)x^p + 1 + (p + 1) x^(p+2) - 2(p+1) x^(p+1) + (p + 1)x^p, (x - 1)^2)$

$= frac((p + 1) x^(p+2) - (p + 2) x^(p+1) + 1, (x - 1)^2) = f_(p+1)(x)$ donc vraie pour l'ordre $p + 1$.

d'apres le principe de la recurrence, on a :

pour tout $n in NN^*$ ; $f_n (x) = 1 + 2x + 3x^2 + ... + n x^(n-1)$.

b) $lim_(x -> 1) f_1 (x) = lim_(x -> 1) 1 + 2x + 3x + ... + n x^(n-1) = 1 + 2 + 3 + ... + n$.

c'est la somme de $n$ termes consecutifs d'une suite arithmetique de raison. $r = 1$ et de 1#super[er] terme $1$, ainsi $1 + 2 + 3 + ... + n = frac(n(n + 1), 2)$

d'ou $lim_(x -> 1) f_n (x) = frac(n(n + 1), 2)$.

*4)* a) $phi$ est continue en $1$ si et seulement si $lim_(x -> 1^+) phi(x) = lim_(x -> 1^-) phi(x) = phi(1)$

$lim_(x -> 1^+) phi(x) = lim_(x -> 1^+) f(x) = f(1) = 3 = phi(1)$ et $lim_(x -> 1^-) phi(x) = lim_(x -> 1^-) f_n (x) = frac(n(n + 1), 2)$

alors $lim_(x -> 1^+) phi(x) = lim_(x -> 1^-) phi(x) = phi(1) arrow.l.r.double frac(n(n + 1), 2) = 3$

$arrow.l.r.double n^2 + n = 6 arrow.l.r.double n^2 + n - 6 = 0$

$Delta = 25$ par suite $n = 2$ ou $n = -3$ a rejeter, donc $n = 2$.

b) Si $n = 2$ ; $phi$ n'est pas continue en $1 arrow.double phi$ n'est pas derivable en $1$.

Si $n = 2$ ; $lim_(x -> 1^+) frac(phi(x) - phi(1), x - 1) = lim_(x -> 1^+) frac(x^2 + x + 1 - 3, x - 1)$

$lim_(x -> 1^+) frac((x - 1)(x + 2), x - 1) = lim_(x -> 1^+) x + 2 = 3 = phi'_d (1).$

\* $lim_(x -> 1^-) frac(phi(x) - phi(1), x - 1) = lim_(x -> 1^-) frac((1 + 2x) - 3, x - 1) = lim_(x -> 1^-) 2 = 2 = phi'_g (1).$

donc $phi'_d (1) eq.not phi'_g (1)$ d'ou $phi$ n'est pas derivable en $1$.

#v(1em)

// Source: Parascolaire Analyse p.132-133

== Exercice 24 -- Solution

*1)* $forall x in [-5, 5]$ on a $-x in [-5, 5]$

et $f(-x) = frac(3, 5) sqrt(25 - (-x)^2) = sqrt(25 - x^2) = f(x)$

alors $f$ est paire par suite l'axe des ordonnees est un axe de symetrie pour $cal(C)$.

*2)* $lim_(x -> 5^-) frac(f(x) - f(-5), x - 5) = lim_(x -> 5^-) frac(frac(3, 5) sqrt(25 - x^2), x - 5) = lim_(x -> 5^-) frac(3, 5) dot frac(25 - x^2, (x - 5) sqrt(25 - x^2))$

$= lim_(x -> 5^-) frac(3, 5) dot frac((5 - x)(5 + x), (x - 5) sqrt(25 - x^2)) = lim_(x -> 5^-) frac(-3, 5) dot frac((5 + x), sqrt(25 - x^2)) = - infinity$

car $cases(lim_(x -> 5) 5 + x = 10, lim_(x -> 5^-) sqrt(25 - x^2) = 0^+)$

donc $cal(C)$ admet une demi-tangente verticale dirigee vers le haut son equation est $x = 5$ et $y gt.eq 0$.

de meme en $(-5)$ puisque l'axe des ordonnees et un axe de symetrie donc l'equation est $x = -5$ et $y gt.eq 0$ ?

// Source: Parascolaire Analyse p.133

*3)* On sait que $(sqrt(u))'(a) = frac(u'(a), 2 sqrt(u(a)))$ alors $f'(a) = frac(3, 5) dot frac((25 - x^2)', 2 sqrt(25 - x^2)) = frac(3, 5) dot frac(-2x, 2 sqrt(25 - x^2))$

$f'(a) = frac(3, 5) dot frac(-x, sqrt(25 - x^2)) arrow.double f'(0) = 0$

*4)* soient $a$, $b$ de $[0, 5[$ tel que $a > b$

$arrow.double a^2 > b^2 arrow.double -a^2 < -b^2 arrow.double 25 - a^2 < 25 - b^2 arrow.double f(a) < f(b)$

$arrow.double f$ est strictement decroissantes sur $[0, 5[$

*5)*

#figure(
  cetz.canvas({
    import cetz.draw: *

    // Axes
    set-style(stroke: (thickness: 0.8pt))
    line((-6, 0), (6, 0), mark: (end: ">"))
    line((0, -5.5), (0, 5.5), mark: (end: ">"))

    // Ellipse (demi-axes a=5, b=3)
    let n = 100
    let pts = ()
    for i in range(n + 1) {
      let t = -5 + 10 * i / n
      let y = 3 / 5 * calc.sqrt(calc.max(25 - t * t, 0))
      pts.push((t, y))
    }

    // Partie superieure (f)
    for i in range(n) {
      line(pts.at(i), pts.at(i + 1), stroke: (thickness: 1.2pt))
    }

    // Graduations
    content((5, -0.4), $5$)
    content((-5, -0.4), $-5$)
    content((0.3, 3.3), $3$)
    content((-0.3, -0.3), $O$)

    // Points
    circle((5, 0), radius: 0.08, fill: black)
    circle((-5, 0), radius: 0.08, fill: black)
    circle((0, 3), radius: 0.08, fill: black)
  }),
  caption: [Courbe de $f(x) = frac(3, 5) sqrt(25 - x^2)$],
)

*6)* $M in zeta_1 arrow.l.r.double frac(x^2, 25) + frac(y^2, 9) = 1$

$arrow.l.r.double frac(y^2, 9) = 1 - frac(x^2, 25)$ ou encore $y^2 = 9(frac(25 - x^2, 25))$

$arrow.l.r.double y = frac(3, 5) sqrt(25 - x^2)$ ou $y = -frac(3, 5) sqrt(25 - x^2)$

$arrow.l.r.double y = f(x)$ ou $y = -f(x)$

$arrow.l.r.double M in zeta_f$ ou $M in zeta_(-f)$

$M arrow.l.r.double in zeta_f union zeta_(-f)$

d'ou $zeta_1 = zeta_f union zeta_(-f)$
