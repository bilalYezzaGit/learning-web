// =============================================================================
// Transcription fidele : Parascolaire Analyse 3eme sec Section Math (Kounouz)
// Chapitre III — Limites et continuite (pages 42 a 69)
// =============================================================================

#import "@preview/cetz:0.3.4"

#set text(lang: "fr")
#set page(margin: 2cm)

// ─────────────────────────────────────────────────────────────────────────────
// RESUME DE COURS (pages 42–44)
// ─────────────────────────────────────────────────────────────────────────────

// Source: Parascolaire Analyse p.42

#align(center)[
  _Chapitre III_ \
  #text(size: 18pt, weight: "bold")[Limites et continuite]
]

#v(0.5cm)

#rect(stroke: 0.5pt + black, width: 100%, inset: 12pt)[

  #text(weight: "bold", size: 12pt)[#underline[Limites finies en un reel :]]

  soit f definie sur un intervalle ouvert I sauf peut etre en a de I ..

  1) #underline[Definition] : $lim_(x arrow a) f(x) = L$ signifie que :

  $forall beta > 0$, il existe un $alpha > 0$ tel que pour tout $x in I$

  $0 < |x - a| < alpha arrow.double |f(x) - L| < beta$ .

  2) #underline[Theoreme] : Si f admet une limite en a alors cette limite est unique.

  - #underline[Notation] : $lim_(x arrow a) f(x) = lim_a f = L$

  3) Limite a droite -- limite a gauche en un reel.

  #v(0.3cm)

  #table(
    columns: (1fr, 1fr),
    align: left,
    inset: 8pt,
    table.header[*Limite a droite en a*][*Limite a gauche en a*],
    [f definie sur $I = [a, b[$ ou $]a, b[$
    \ $lim_(x arrow a^+) f(x) = L$ signifie que
    \ $forall beta > 0$ il existe $alpha > 0$ tel que
    \ $forall x in I, 0 < x - a < alpha arrow.double |f(x) - L| < beta$],
    [f definie sur $I = ]c, a]$ ou $]c, a[$
    \ $lim_(x arrow a^-) f(x) = L$ signifie que
    \ $forall beta > 0$, il existe $alpha > 0$ tel que
    \ $forall x in I, 0 < a - x < alpha arrow.double |f(x) - L| < beta$],
  )

  #v(0.3cm)

  - *Theoreme* : $limits(#box(stroke: 0.5pt + black, inset: 4pt)[$lim_(x arrow a^+) f(x) = lim_(x arrow a^-) f(x) = L arrow.l.r.double lim_(x arrow a) f(x) = L$])$

  #v(0.3cm)

  - *Exemples* :
  $ f(x) = cases(
    x + 1 & "si" x gt.eq 1,
    frac(5 - x, x + 1) & "si" x < 1
  ) $

  Determiner $lim_(x arrow 1) f(x)$ ?

  \* $lim_(x arrow 1^+) f(x) = lim_(x arrow 1^+) x + 1 = 2$

  $lim_(x arrow 1^-) f(x) = lim_(x arrow 1^-) frac(5 - x, x + 1) = frac(4, 2) = 2$

  d'ou $lim_(x arrow 1^+) f(x) = lim_(x arrow 1^-) f(x) = 2$

  $arrow.double lim_(x arrow 1) f(x) = 2$

  #v(0.3cm)

  - *consequence* : Si $lim_(x arrow a^+) f eq.not lim_(x arrow a^-) f$ alors $lim_a f$ n'existe pas.

  4) Operations sur les limites finies :
]

// Source: Parascolaire Analyse p.43

#rect(stroke: 0.5pt + black, width: 100%, inset: 12pt)[

  #table(
    columns: (1fr, 1fr, 1fr, 1fr, 1fr),
    align: center,
    inset: 6pt,
    table.header[$lim_(x arrow a) f$][$lim_(x arrow a) g$][$lim_(x arrow a) f + g$][$lim_(x arrow a) f times g$][$lim_(x arrow a) alpha f$],
    [$L$], [$L'$], [$L + L'$], [$L times L'$], [$alpha dot L$],
  )

  #table(
    columns: (1fr,),
    align: center,
    inset: 6pt,
    [$lim_(x arrow a) frac(f, g) = frac(L, L')$ si $L' eq.not 0$],
  )

  #v(0.3cm)

  - Remarque : si on se retrouve avec $lim_(x arrow a) frac(f, g) = frac(0, 0)$ c'est une forme indeterminee

  il faut alors simplifier l'ecriture pour calculer cette limite.

  #v(0.3cm)

  5) #underline[Theoremes] :

  1) $f(x) gt.eq 0$ et $lim_(x arrow a) f(x) = L arrow.double L gt.eq 0$

  2) $f(x) lt.eq 0$ et $lim_(x arrow a) f(x) = L arrow.double L lt.eq 0$

  3) $f(x) gt.eq 0$ et $lim_(x arrow a) f(x) = L arrow.double lim_(x arrow a) sqrt(f(x)) = sqrt(L)$

  #v(0.5cm)

  #text(weight: "bold", size: 12pt)[#underline[Continuite en un point $x_0$ :]]

  - *Definition* : soit I un intervalle centre en $x_0$ et $I subset D_f$.

  f est continue en $x_0 arrow.l.r.double lim_(x arrow x_0) f(x) = f(x_0)$.

  #v(0.3cm)

  - *Continue a droite et a gauche* : ($x_0 in D_f$)

  \* f est continue a droite en $x_0 arrow.l.r.double lim_(x arrow x_0^+) f(x) = f(x_0)$.

  \* f est continue a gauche en $x_0 arrow.l.r.double lim_(x arrow x_0^-) f(x) = f(x_0)$.

  \* f est continue en $x_0 arrow.l.r.double$ f est continue a droite et a gauche en $x_0$.

  #v(0.3cm)

  #text(weight: "bold", size: 12pt)[#underline[Continuite sur un intervalle :]]

  - f est continue sur $]a, b[ arrow.l.r.double$ f est continue en tout point $x_0 in ]a, b[$.

  - f est continue sur $[a, b[ arrow.l.r.double$ f est continue sur $]a, b[$ et a droite en a.

  - f est continue sur $]a, b] arrow.l.r.double$ f est continue sur $]a, b[$ et a gauche en b.

  #v(0.3cm)

  #text(weight: "bold", size: 12pt)[#underline[Operations sur les fonctions continues :]]

  - Toute fonction polynome est continue sur IR.
  - Toute fonction rationnelle est continue sur son domaine de definition.
  - $x mapsto sqrt(x)$ est continue sur $[0, +infinity[$.
  - f est continue sur I et positif $arrow.double sqrt(f)$ est continue sur I.
  - f est continue sur I $arrow.double |f|$ est continue sur I.
  - Soient f et g deux fonctions continues sur I, $alpha in RR$

  Alors $f + g$ ; $f times g$ ; $alpha f$ sont continue sur I.
]

// Source: Parascolaire Analyse p.44

#rect(stroke: 0.5pt + black, width: 100%, inset: 12pt)[

  Si de plus $g(x) eq.not 0$ alors $frac(f, g)$ est continue sur I.

  #v(0.3cm)

  #text(weight: "bold", size: 12pt)[#underline[Theoreme et definition : prolongement par continuite :]]

  f definie sur un intervalle ouvert I sauf en a de I et $lim_(x arrow a) f(x) = L$

  Alors la fonction g definie sur I par :
  $ cases(
    g(x) = f(x) & "si" x eq.not a,
    g(a) = L
  ) $

  On dit que g est le *prolongement par continuite* en a de la fonction f.

  #v(0.3cm)

  #underline[Exemple] : Determiner g le prolongement par continuite de f.

  \* $f(x) = frac(x^2 - 1, x - 1)$ definie sur $RR - {1}$

  $lim_(x arrow 1) f(x) = lim_(x arrow 1) frac(x^2 - 1, x - 1) = lim_(x arrow 1) frac(cancel((x - 1))(x + 1), cancel((x - 1))) = lim_(x arrow 1) x + 1 = 2$

  On considere g definie sur IR par : $g(x) = f(x)$ si $x eq.not 1$ et $g(1) = 2$.
]

#v(0.5cm)

// Reflexes table

*Reflexes :*

#table(
  columns: (auto, 1fr, 1fr),
  align: left,
  inset: 8pt,
  table.header[][*Situations*][*Reflexes*],
  [1],
  [Comment etudier la continuite d'une fonction definie par intervalles],
  [On etudie la fonction sur chaque intervalle puis on fait une etude particuliere de la continuite aux valeurs aux bornes des intervalles (dans $D_f$)],
  [2],
  [Comment calculer une limite si on se retrouve avec la forme $frac(0, 0)$],
  [- Simplifier l'expression puis remplacer le x par sa valeur. \
   - Si f comporte des $sqrt("")$ il faut multiplier et diviser par l'expression conjuguee ou factoriser],
  [3],
  [Comment calculer une limite (dans le cas $eq.not frac(0, 0)$)],
  [- En remplacant le x par sa valeur dans l'expression. \
   - En utilise les operations sur les limites.],
)


// ─────────────────────────────────────────────────────────────────────────────
// ENONCES (pages 45–50)
// ─────────────────────────────────────────────────────────────────────────────

#pagebreak()

// Source: Parascolaire Analyse p.45

#align(center)[
  #text(size: 18pt, weight: "bold")[ENONCES]
]

#v(0.5cm)

=== Exercice 1

Determiner la limite eventuelle de $f(x)$ au point $a$.

1) $f(x) = 5x^8 - 3x^2 + 2x - 4$ #h(2cm) ; $a = 1$

2) $f(x) = frac(x^2 - 1, x^2 + 1)$ #h(2cm) ; $a = 2$

3) $f(x) = frac(|x^2 - 15|, |x| - 5)$ #h(2cm) ; $a = 4$

4) $f(x) = frac(|x - 5| - 1, |x + 3| - 3)$ #h(2cm) ; $a = -3$

5) $f(x) = sqrt(5x - 5)$ #h(2cm) ; $a = 5$

6) $f(x) = sqrt(1 - 3x)$ #h(2cm) ; $a = 0,3$

7) $f(x) = frac(sqrt(5x - 4) - sqrt(x), sqrt(x) + 1)$ #h(2cm) ; $a = 1$

#v(0.5cm)

=== Exercice 2

Calculer les limites suivantes :

$lim_(x arrow 3) frac(2x^2 + x - 21, -x^2 + 9)$ ; $lim_(x arrow 0) frac(2x^2 - 8x^3, x^2)$ ; $lim_(x arrow 3) frac(x^3 - 27, x - 3)$ ; $lim_(x arrow 0) frac(sqrt(x), x + 3sqrt(x))$ #h(1cm) ; $lim_(x arrow 2) frac(sqrt(x + 7) - 3, x - 2)$

#v(0.5cm)

=== Exercice 3

Calculer les limites suivantes :

$lim_(x arrow 3) frac(2 - sqrt(x + 1), 2x - 6)$ ; $lim_(x arrow 2) frac(sqrt(x - 1) - 1, x - 2)$ ; $lim_(x arrow 1) frac(x^2 - 1, sqrt(x) - 1)$ ; $lim_(x arrow 4) frac(sqrt(x^2 - 7) - sqrt(2x + 1), x - 4)$

#v(0.5cm)

=== Exercice 4

Soit f la fonction definie sur IR par $f(x) = frac(-2x + 5, x^2 - 5x + 6)$.

a) Preciser le domaine de f.

b) Calculer : $lim_(x arrow 1) f(x)$ ; $lim_(x arrow 2^+) f(x)$ ; $lim_(x arrow 2^-) f(x)$ ; $lim_(x arrow 3^+) f(x)$ ; $lim_(x arrow 3^-) f(x)$.

#v(0.5cm)

=== Exercice 5

Soit f definie par $f(x) = x[x - E(x)] + 5$.

1) Ecrire $f(x)$ sur chacun des intervalles $[3, 4[$ et $[4, 5[$.

2) a) Trouver $lim_(x arrow 4^+) f(x)$; $lim_(x arrow 4^-) f(x)$. f admet-elle une limite en 4 ?

// Source: Parascolaire Analyse p.46

b) Refaire le meme raisonnement pour $lim_(x arrow n^+) f(x)$; $lim_(x arrow n^-) f(x)$; $n in ZZ^*$.

f admet-elle une limite en $x_0 = n$ ?

c) Montrer que $lim_(x arrow 0) f(x) = 5$.

#v(0.5cm)

=== Exercice 6

Soit la fonction f definie par : $f(x) = frac(x^4 - 4x^3 + x - 4, x^2 - 16)$.

1) Determiner le domaine de definition de f.

2) Calculer les limites suivantes : $lim_(x arrow 4) f(x)$ ; $lim_(x arrow 2) f(x)$.

#v(0.5cm)

=== Exercice 7

Soit la fonction f definie par :

$ f(x) = frac(x^(2n) - n^2 x^(n+1) + 2(n^2 - 1) x^n - n^2 x^(n-1) + 1, (x - 1)^2), quad "avec" n in NN. $

Calculer la limite de $f(x)$ quand x tend vers 1.

#v(0.5cm)

=== Exercice 8

Soit f definie par $f(x) = frac(x^4 - 2x^3 + a x + b, (x - 1)(x - 2))$ avec a et b, deux reels.

1) Determiner les valeurs de a et b, pour que $lim_(x arrow 1) f(x) = 3$ et $lim_(x arrow 2) f(x) = 7$.

2) Pour les valeurs de a et b, trouver :

#h(0.5cm) a) Montrer que pour tout $x in RR - {1, 2}$ ; $f(x) = x^2 + x + 1$

#h(0.5cm) b) Retrouver alors la limite de f en 1 et en 2.

#h(0.5cm) c) Peut on prolonger f par continuite ?

#v(0.5cm)

=== Exercice 9

Soit la fonction f definie par :

$ cases(
  f(x) = frac(x + 1, x - 1) & "si" x lt.eq 2,
  f(x) = -x + 1 & "si" x > 2
) $

1) Determiner le domaine de definition de f.

2) Etudier la continuite de f a droite et a gauche en 2.

3) f est-elle continue en 2 ?

4) Determiner le domaine de continuite de f.

#v(0.5cm)

=== Exercice 10

Soient $f(x) = sqrt(2x^2 - 3x + 1)$ et $g(x) = |2x - 1|$.

Montrer que f et g sont continues sur leurs domaines de definition.

#v(0.5cm)

=== Exercice 11

$ f(x) = cases(
  2x + frac(sqrt(9x^2), |x|) & "si" x eq.not 0,
  -1 & "si" x = 0
) $

Montrer que f n'est pas continue en 0

// Source: Parascolaire Analyse p.47

#v(0.5cm)

=== Exercice 12

Soit f definie par $f(x) = frac(a x^2 + (a^2 - 3)x - 3a, x - 1)$ si $x eq.not 1$ ; $f(1) = 4a$.

Determiner a pour que f soit continue en 1

#v(0.5cm)

=== Exercice 13

$f(x) = frac(-x^2 - 3x - 2, 1 - |x + 1|)$.

1) Determiner le domaine de definition de f.

2) f est-elle continue en $-1$ ?

#v(0.5cm)

=== Exercice 14

$ cases(
  f(x) = frac(sqrt(x + 1) - 1, x) & "si" x eq.not 0,
  f(0) = a quad ; quad a in RR
) $

1) Preciser $D_f$.

2) Pour quelle valeur de a la fonction f est continue en 0.

#v(0.5cm)

=== Exercice 15

$ cases(
  f(x) = x^2 - x + 1 & "si" x in ]- infinity\, -1[,
  f(x) = sqrt(5 - 4x) & "si" x in [-1\, 1],
  f(x) = a x^2 + 2b x - 4 & "si" x in ]1\, + infinity[
) $

1) Etudier la continuite en $(-1)$.

2) Trouver une relation entre a et b pour que f soit continue en 1

#v(0.5cm)

=== Exercice 16

1) Soit la fonction f definie par : $f(x) = frac(sqrt(1 + x) - sqrt(1 - x), x)$.

#h(0.5cm) a) Determiner le domaine de definition de la fonction f.

#h(0.5cm) b) Determiner les limites aux bornes.

2) Soit g definie par $g(x) = cases(
  frac(x sqrt(x) + x, sqrt(x)) & "si" x > 0,
  f(x) - 1 & "si" 0 > x gt.eq -1.,
  g(0) = 0
)$

#h(0.5cm) a) Etudier la continuite de g en 0.

#h(0.5cm) b) Determiner le domaine de continuite de g.

#v(0.5cm)

=== Exercice 17

Soit la fonction $f : RR arrow RR$ ; $x mapsto frac(x^2 - 3x + 2, |x - 1| - 1)$.

1) Determiner le domaine de definition de f.

2) a) Etudier la limite de f en 2.

#h(0.5cm) b) Calculer la $lim_(x arrow 1) f(x)$.

// Source: Parascolaire Analyse p.48

3) On considere la fonction g definie par :
$ cases(
  g(x) = f(x) & "si" x > 2,
  g(x) = frac(a x + E(x), x - 1) & "si" x < 2,
  g(2) = 1
) $

Determiner a pour que g soit continue en 2.

#v(0.5cm)

=== Exercice 18

$ f(x) = cases(
  sqrt(x^2 + 3) + 2x & "si" x lt.eq 1,
  frac(x^2 + 2x - m, -x + 2) & "si" x > 1
) $

1) Determiner le domaine de definition de f.

2) Determiner m pour que f soit continue en 1.

Pour quelle valeur de m f est continue sur $RR backslash {2}$

#v(0.5cm)

=== Exercice 19

$f : RR arrow RR ; x mapsto frac(x^2 + E(frac(x, 2)), x + 1)$.

a) f est elle continue en 1 ?

b) f est elle continue en 2 ?

#v(0.5cm)

=== Exercice 20

$ cases(
  f(x) = frac(|x^2 - 4| - 3x^2, |x| - 1) + x & "si" |x| eq.not 1 quad "avec a et b, deux reels.",
  f(x) = a x + b & "si" |x| = 1
) $

1) Ecrire f sans le symbole des valeurs absolues.

2) a) Determiner une condition necessaire et suffisante sur a et b pour que f soit continue en $x_0 = 1$.

#h(0.5cm) b) Determiner une condition necessaire et suffisante sur a et b pour que f soit continue en $x_0 = -1$.

#h(0.5cm) c) En deduire les valeurs de a et b pour que f soit continue en 1 et en $-1$.

3) On suppose que $a = 1$ et $b = -8$.

#h(0.5cm) Determiner les intervalles sur lesquels f est continue.

#v(0.5cm)

=== Exercice 21

On considere la fonction $f : RR arrow RR$ ;

$ x mapsto cases(
  frac((a + 2)x^2 + x + 2a, x + 2) & "si" x < -1,
  frac(1, 2) x^2 - frac(7, 2) x + b & "si" -1 lt.eq x lt.eq 3,
  sqrt(4x - 3) - x & "si" x > 3
) $

// Source: Parascolaire Analyse p.49

1) Determiner le domaine de definition de f.

2) Determiner les reels a et b pour que f soit continue en $x_0 = -1$ et en $x_0 = 3$.

3) Pour $a = 1$ et $b = 6$, determiner le domaine de continuite de f.

#v(0.5cm)

=== Exercice 22

Pour tout reel m, on considere la fonction $f_m$ definie par :

$ f_m (x) = cases(
  (1 + 3m) x^2 + 3x & "si" x in ]- infinity\, frac(1, 2)[,
  frac(x^3 - 8, 2x^2 - 5x + 2) & "si" x in ]frac(1, 2)\, 2[,
  sqrt(4x^2 - 1) - m x - 1 & "si" x in [2\, + infinity[
) $

1) a) Determiner le domaine de definition D et $f_m$.

#h(0.5cm) b) Etudier les limites suivantes (discuter eventuellement suivant m)

#h(1cm) $lim_(x arrow frac(1, 2)) f_m (x)$ ; $lim_(x arrow 2^-) f_m (x)$

2) Peut on determiner m pour que $f_m$ soit continue en 2.

3) Preciser suivant m, l'ensemble de continuite de $f_m$.

#v(0.5cm)

=== Exercice 23

f definie sur IR par $f(x) = cases(
  frac(x^3, 1 - sqrt(x^3 + 1)) & "si" x > 0,
  (x + 2) E(x) & "si" x < 0,
  -2 & "si" x = 0
)$

1) Montrer que f est continue en $x_0 = 0$.

2) Etudier la continuite de f en $(-1)$.

#v(0.5cm)

=== Exercice 24

Soit $f_0 (x) = E(frac(1, x))$ ; $f_1 (x) = x E(frac(1, x))$ ; $f_2 (x) = x^2 E(frac(1, x))$.

1) Representer graphiquement les restrictions de $f_0$ ; $f_1$ et $f_2$.

#h(0.5cm) a l'intervalle : $]frac(1, 4), + infinity[$ .

2) Etudier la continuite des fonctions $f_0$ ; $f_1$ et $f_2$.

// Source: Parascolaire Analyse p.50

#v(0.5cm)

=== Exercice 25

Soit f la fonction definie sur $RR^*$ par $f(x) = frac(E(x), x)$.

1) Determiner la restriction de f sur chacun des intervalles :

$[n, n + 1[$ et $[n - 1, n[$ #h(0.5cm) pour $n in ZZ^*$.

2) Sur quel ensemble f est continue ?

#v(0.5cm)

=== Exercice 26

f est la fonction definie sur $D = [-1, 0[ union ]0, + infinity[$ par $f(x) = frac(sqrt(1 + x) - 1, x)$

a) Montrer que pour contre de D, $f(x) = frac(1, sqrt(1 + x) + 1)$

b) Etudier la limite de f en 0.

c) La fonction f est elle prolongeable par continuite en 0 ? Si oui definir ce prolongement.

#v(0.5cm)

=== Exercice 27

f la fonction definie sur $RR^*$ par $f(x) = 2x + frac(sqrt(9x^2), x)$

a) Etudier la continuite de f en 0

b) Peut-on prolonger f par continuite en 0.


// ─────────────────────────────────────────────────────────────────────────────
// CORRIGES / SOLUTIONS (pages 51–69)
// ─────────────────────────────────────────────────────────────────────────────

#pagebreak()

// Source: Parascolaire Analyse p.51

#align(center)[
  #text(size: 18pt, weight: "bold")[CORRIGES]
]

#v(0.5cm)

=== Exercice 1 -- Corrige

1) $lim_(x arrow 1) 5x^8 - 3x^2 + 2x - 4 = 5 - 3 + 2 - 4 = 0$

2) $lim_(x arrow 2) frac(x^2 - 1, x^2 + 1) = frac(4 - 1, 4 + 1) = frac(3, 5)$

3) $lim_(x arrow 4) frac(|x^2 - 15|, |x| - 5) = frac(|16 - 15|, 4 - 5) = -1$

4) $lim_(x arrow -3) frac(|x - 5| - 1, |x + 3| - 3) = frac(|-3 - 5| - 1, |-3 + 3| - 3) = frac(8 - 1, -3) = frac(-7, 3)$

5) $lim_(x arrow 5) sqrt(5x - 5) = sqrt(25 - 5) = sqrt(20) = 2sqrt(5)$

6) $lim_(x arrow 0,3) sqrt(1 - 3x) = sqrt(1 - 0,9) = sqrt(0,1) = sqrt(frac(1, 10))$

7) $lim_(x arrow 1) frac(sqrt(5x - 4) - sqrt(x), sqrt(x) + 1) = frac(sqrt(1) - sqrt(1), sqrt(1) + 1) = 0$

#v(0.5cm)

=== Exercice 2 -- Corrige

// Source: Parascolaire Analyse p.51

\* $lim_(x arrow 3) frac(2x^2 + x - 21, -x^2 + 9)$ ?

On constate que l'on a la forme $frac(0, 0)$.

3 est donc une racine commune du numerateur et du denominateur on a :

$lim_(x arrow 3) frac(2x^2 + x - 21, -x^2 + 9) = lim_(x arrow 3) frac(cancel((x - 3))(2x + 7), -cancel((x - 3))(x + 3)) = lim_(x arrow 3) frac(2x + 7, -(x + 3)) = -frac(13, 6)$

\* Le meme raisonnement pour les autres limites

$lim_(x arrow 0) frac(2x^2 - 8x^3, x^2) = lim_(x arrow 0) frac(cancel(x^2)(2 - 8x), cancel(x^2)) = lim_(x arrow 0) 2 - 8x = 2$

\* $lim_(x arrow 3) frac(x^3 - 27, x - 3) = lim_(x arrow 3) frac((x - 3)(x^2 + 3x + 9), x - 3) = lim_(x arrow 3) x^2 + 3x + 9 = 27$

\* $lim_(x arrow 0) frac(sqrt(x), x + 3sqrt(x)) = lim_(x arrow 0) frac(sqrt(x), sqrt(x)(sqrt(x) + 3)) = lim_(x arrow 0) frac(1, sqrt(x) + 3) = frac(1, 3)$

// Source: Parascolaire Analyse p.52

\* $lim_(x arrow 2) frac(sqrt(x + 7) - 3, x - 2) = lim_(x arrow 2) frac((sqrt(x + 7) - 3)(sqrt(x + 7) + 3), (x - 2)(sqrt(x + 7) + 3)) = lim_(x arrow 2) frac(sqrt(x + 7)^2 - 3^2, (x - 2)(sqrt(x + 7) + 3))$

$= lim_(x arrow 2) frac(x + 7 - 9, (x - 2)(sqrt(x + 7) + 3)) = lim_(x arrow 2) frac(x - 2, (x - 2)(sqrt(x + 7) + 3)) = lim_(x arrow 2) frac(1, sqrt(x + 7) + 3) = frac(1, 6)$

#v(0.5cm)

=== Exercice 3 -- Corrige

$lim_(x arrow 3) frac(2 - sqrt(x + 1), 2x - 6)$ lorsqu'on remplace par 3 on obtient la forme $frac(0, 0)$

d'ou $lim_(x arrow 3) frac((2 - sqrt(x + 1)), 2x - 6) = lim_(x arrow 3) frac((2 - sqrt(x + 1))(2 + sqrt(x + 1)), (2x - 6)(2 + sqrt(x + 1)))$

$= lim_(x arrow 3) frac(2^2 - sqrt(x + 1)^2, (2x - 6)(2 + sqrt(x + 1))) = lim_(x arrow 3) frac(4 - x - 1, 2(x - 3)(2 + sqrt(x + 1)))$

$= lim_(x arrow 3) frac(3 - x, 2(x - 3)(2 + sqrt(x + 1))) = lim_(x arrow 3) frac(-1, 2(2 + sqrt(x + 1))) = -frac(1, 8)$

\* $lim_(x arrow 2) frac(sqrt(x - 1) - 1, x - 2)$ c'est aussi la forme $frac(0, 0)$

$lim_(x arrow 2) frac(sqrt(x - 1) - 1, x - 2) = lim_(x arrow 2) frac((sqrt(x - 1) - 1)(sqrt(x - 1) + 1), (x - 2)(sqrt(x - 1) + 1))$

$= lim_(x arrow 2) frac(sqrt(x - 1)^2 - 1^2, (x - 2)(sqrt(x - 1) + 1))$

$= lim_(x arrow 2) frac(x - 2, (x - 2)(sqrt(x - 1) + 1)) = lim_(x arrow 2) frac(1, sqrt(x - 1) + 1) = frac(1, 2)$

\* $lim_(x arrow 1) frac(x^2 - 1, sqrt(x) - 1)$ c'est la forme $frac(0, 0)$

$lim_(x arrow 1) frac(x^2 - 1, sqrt(x) - 1) = lim_(x arrow 1) frac((x^2 - 1)(sqrt(x) + 1), (sqrt(x) - 1)(sqrt(x) + 1)) = lim_(x arrow 1) frac((x - 1)(x + 1)(sqrt(x) + 1), (x - 1)) = lim_(x arrow 1) (x + 1)(sqrt(x) + 1) = 4$

\* $lim_(x arrow 4) frac(sqrt(x^2 - 7) - sqrt(2x + 1), x - 4)$ c'est la forme $frac(0, 0)$

// Source: Parascolaire Analyse p.53

alors $lim_(x arrow 4) frac(sqrt(x^2 - 7) - sqrt(2x + 1), x - 4) = lim_(x arrow 4) frac(sqrt(x^2 - 7)^2 - sqrt(2x + 1)^2, (x - 4)(sqrt(x^2 - 7) + sqrt(2x + 1)))$

$= lim_(x arrow 4) frac(x^2 - 2x - 8, (x - 4)(sqrt(x^2 - 7) + sqrt(2x + 1))) = lim_(x arrow 4) frac((x - 4)(x + 2), (x - 4)(sqrt(x^2 - 7) + sqrt(2x + 1)))$

$= lim_(x arrow 4) frac(x + 2, sqrt(x^2 - 7) + sqrt(2x + 1)) = frac(6, 6) = 1$

#v(0.5cm)

=== Exercice 4 -- Corrige

a) $D_f = {x in RR ; "tel que" x^2 - 5x + 6 eq.not 0} = RR - {2, 3}$

b) $lim_(x arrow 1) -2x + 5 = 3$ et $lim_(x arrow 1) x^2 - 5x + 6 = 2$ d'ou $lim_(x arrow 1) f(x) = frac(3, 2) = f(1)$.

#v(0.3cm)

// sign table for x^2 - 5x + 6

#table(
  columns: (auto, 1fr, auto, 1fr, auto, 1fr, auto),
  align: center,
  inset: 4pt,
  [x], [$-infinity$], [], [2], [], [3], [$+infinity$],
  [$x^2 - 5x + 6$], [+], [], [0], [$-$], [0], [+],
)

- $lim_(x arrow 2^+) -2x + 5 = 1$ et $lim_(x arrow 2^+) x^2 - 5x + 6 = 0^-$ d'ou $lim_(x arrow 2^+) f(x) = -infinity$.
- $lim_(x arrow 2^-) -2x + 5 = 1$ et $lim_(x arrow 2^-) x^2 - 5x + 6 = 0^+$ d'ou $lim_(x arrow 2^-) f(x) = +infinity$
- $lim_(x arrow 3^-) -2x + 5 = -1$ et $lim_(x arrow 3^-) x^2 - 5x + 6 = 0^-$ d'ou $lim_(x arrow 3^-) f(x) = +infinity$
- $lim_(x arrow 3^+) -2x + 5 = -1$ et $lim_(x arrow 3^+) x^2 - 5x + 6 = 0^+$ d'ou $lim_(x arrow 3^+) f(x) = -infinity$.

#v(0.5cm)

=== Exercice 5 -- Corrige

// Source: Parascolaire Analyse p.53

1) si $x in [3, 4[$ ; $E(x) = 3$ donc $f(x) = x^2 - 3x + 5$.

Si $x in [4, 5[$ ; $E(x) = 4$ donc $f(x) = x^2 - 4x + 5$

2) a) $bullet$ $lim_(x arrow 4^-) f(x) = lim_(x arrow 4^-) (x^2 - 3x + 5) = 9$.

$bullet$ $lim_(x arrow 4^+) f(x) = lim_(x arrow 4^+) (x^2 - 4x + 5) = 5$.

$bullet$ $lim_(x arrow 4^-) f(x) eq.not lim_(x arrow 4^+) f(x)$. Donc f n'admet pas de limite en 4.

b) si $x in [n, n + 1[$ ; $E(x) = n$ donc $f(x) = x^2 - n x + 5$.

Si $x in [n - 1, n[$ ; $E(x) = (n - 1)$ donc $f(x) = x^2 - (n - 1) x + 5$.

$bullet$ $lim_(x arrow n^+) f(x) = lim_(x arrow n^+) (x^2 - n x + 5) = n^2 - n^2 + 5 = 5$.

$bullet$ $lim_(x arrow n^-) f(x) = lim_(x arrow n^-) (x^2 - (n - 1)x + 5) = n^2 - n^2 + n + 5 = n + 5$

// Source: Parascolaire Analyse p.54

$bullet$ $lim_(x arrow n^+) f(x) eq.not lim_(x arrow n^-) f(x)$ donc f n'admet pas de limite en n.

c) Si $x in [-1, 0[$ ; $E(x) = -1$ donc $f(x) = x^2 + x + 5$

Si $x in [0, 1[$ ; $E(x) = 0$ donc $f(x) = x^2 + 5$.

$bullet$ $lim_(x arrow 0^+) f(x) = lim_(x arrow 0^+) x^2 + 5 = 5$ et $lim_(x arrow 0^-) f(x) = lim_(x arrow 0^-) (x^2 + x + 5) = 5$.

Donc $lim_(x arrow 0) f(x) = 5$.

#v(0.5cm)

=== Exercice 6 -- Corrige

1) $D_f = {x in RR ; "tel que" x^2 - 16 eq.not 0} = RR - {-4, 4}$.

2) $bullet$ $lim_(x arrow 4) x^4 - 4x^3 + x - 4 = 0$ et $lim_(x arrow 4) x^2 - 16 = 0$ donc

$lim_(x arrow 4) f(x)$ est une forme indeterminee $frac(0, 0)$.

$f(x) = frac(x^4 - 4x^3 + x - 4, x^2 - 16) = frac(x^3(x - 4) + (x - 4), (x - 4)(x + 4)) = frac(x^3 + 1, x + 4)$ pour tout $x in D_f$.

$lim_(x arrow 4) f(x) = lim_(x arrow 4) frac(x^3 + 1, x + 4) = frac(65, 8)$.

$lim_(x arrow 2) f(x) = lim_(x arrow 2) frac(x^3 + 1, x + 4) = frac(9, 6) = frac(3, 2)$

#v(0.5cm)

=== Exercice 7 -- Corrige

// Source: Parascolaire Analyse p.54

Soit $A(x) = x^(2n) - n^2 x^(n+1) + 2(n^2 - 1) x^n - n^2 x^(n-1) + 1$

$= x^(2n) - 2x^n + 1 - n^2 (x^(n+1) - 2x^n + x^(n-1))$

$= (x^n - 1)^2 - n^2 x^(n-1) (x^2 - 2x + 1)$

$= (x^n - 1)^2 - n^2 x^(n-1) (x - 1)^2$.

Or $frac(x^n - 1, x - 1) = frac(1 - x^n, 1 - x) = 1 + x + ... + x^(n-1)$ (c'est la somme de n terme d'une suite geometrique de raison $x eq.not 1$ et de $1^("er")$ terme 1.)

Donc $x^n - 1 = (x - 1)(1 + x + x^2 + ... + x^(n-1))$

D'ou $A(x) = (x - 1)^2 (x^(n-1) + x^(n-2) + ... + x + 1)^2 - n^2 x^(n-1) (x - 1)^2$

$= (x - 1)^2 [(x^(n-1) + x^(n-2) + ... + x + 1)^2 - n^2 x^(n-1)]$.

Donc $lim_(x arrow 1) f(x) = lim_(x arrow 1) frac((x - 1)^2 [(x^(n-1) + x^(n-2) + ... + x + 1)^2 - n^2 x^(n-1)], (x - 1)^2)$

$= lim_(x arrow 1) [(x^(n-1) + x^(n-2) + ... + x + 1)^2 - n^2 x^(n-1)] = underbrace(1 + 1 + ... + 1, n "fois") - n^2 = n - n^2$.

#v(0.5cm)

=== Exercice 8 -- Corrige

// Source: Parascolaire Analyse p.55

1) \* $lim_(x arrow 1) x^4 - 2x^3 + a x + b = a + b - 1$ et $lim_(x arrow 1) (x - 1)(x - 2) = 0$

alors $lim_(x arrow 1) f(x)$ est finie que lorsque $a + b - 1 = 0$, soit $a = 1 - b$.

\* $lim_(x arrow 2) x^4 - 2x^3 + a x + b = 2a + b$ et $lim_(x arrow 2)(x - 1)(x - 2) = 0$

alors $lim_(x arrow 2) f(x)$ est finie que lorsque $2a + b = 0$

or $a = 1 - b$ d'ou $2 - 2b + b = 0$ ou encore $b = 2$ et $a = -1$.

2) a) $f(x) = frac(x^4 - 2x^3 + a x + b, (x - 1)(x - 2))$.

On remarque que : $1^4 - 2 dot 1^3 - 1 + 2 = 0$ et $2^4 - 2 dot 2^3 - 2 + 2 = 0$

Donc 1 et 2 sont des racines de $x^4 - 2x^3 - x + 2$.

$x^4 - 2x^3 - x + 2 = (x - 1)(x - 2)(c x^2 + d x + e)$

$= (x^2 - 3x + 2)(c x^2 + d x + e)$

$= c x^4 + (d - 3c) x^3 + (e + 2c - 3d) x^2 + (-3e + 2d) x + 2e$.

Par indentification, on obtient :
$ cases(
  c = 1,
  d - 3c = -2,
  e + 2c - 3d = 0,
  -3e + 2d = -1,
  2e = 2
) arrow.l.r.double cases(
  c = 1,
  e = 1,
  d = 1
) $

Par suite, $f(x) = frac((x - 1)(x - 2)(x^2 + x + 1), (x - 1)(x - 2)) = x^2 + x + 1$.

b) $lim_(x arrow 1) f = lim_(x arrow 1) x^2 + x + 1 = 3$

$lim_(x arrow 2) f = lim_(x arrow 2) x^2 + x + 1 = 7$

f est une fonction rationnelle donc continue sur $D_f = RR - {1, 2}$

comme $lim_(x arrow 1) f = 3$ , $lim_(x arrow 2) f = 7$

alors on peut prolonger f par continuite il suffit de choisir la fonction g

definie sur IR par : $cases(g(x) = f(x) & "si" x in RR backslash {1, 2}, g(1) = 3, g(2) = 7)$

#v(0.5cm)

=== Exercice 9 -- Corrige

// Source: Parascolaire Analyse p.56

1) $D_f = {x in ]-infinity, 2] backslash {x - 1 eq.not 0}} union ]2, +infinity[$

$x - 1 eq.not 0 arrow.l.r.double x eq.not 1$ ou $1 in ]-infinity, 2]$ d'ou $D_f = ]-infinity, 2] union ]2, +infinity[ backslash {1} = RR - {1}$.

2) $lim_(x arrow 2^+) f(x) = lim_(x arrow 2^+) - x + 1 = -1$.

$lim_(x arrow 2^-) f(x) = lim_(x arrow 2^-) frac(x + 1, x - 1) = 3$

$f(2) = frac(2 + 1, 2 - 1) = 3$ donc $lim_(x arrow 2^-) f(x) = f(2)$ d'ou f est continue a gauche en 2,

et $lim_(x arrow 2^+) f(x) = -1 eq.not f(2)$ d'ou f n'est pas continue a droite en 2.

3) f est continue a gauche mais pas a droite en 2 d'ou f n'est pas continue en 2.

4) $x mapsto frac(x + 1, x - 1)$ est une fonction rationnelle donc continue sur son domaine de definition $RR backslash {1}$ d'ou f est continue sur $]-infinity, 2[ backslash {1}$ ; $x mapsto -x + 1$ est une

fonction polynome donc continue sur IR d'ou f est continue sur $]2, +infinity[$

or f n'est pas continue en 2.

Conclusion : f est continue sur $RR backslash {1, 2}$.

#v(0.5cm)

=== Exercice 10 -- Corrige

$f(x) = sqrt(2x^2 - 3x + 1)$

$D_f = {x in RR \/ 2x^2 - 3x + 1 gt.eq 0}$.

\* $2x^2 - 3x + 1 = 0$. On remarque que $2 - 3 + 1 = 0$ d'ou $x' = 1$ et $x = frac(1, 2)$.

#table(
  columns: (auto, 1fr, auto, 1fr, auto, 1fr, auto),
  align: center,
  inset: 4pt,
  [x], [$-infinity$], [], [$frac(1, 2)$], [], [$1$], [$+infinity$],
  [$2x^2 - 3x + 1$], [], [+], [0], [$-$], [0], [+],
)

Ainsi $D_f = ]-infinity, frac(1, 2)] union [1, +infinity[$

$x mapsto 2x^2 - 3x + 1$ polynome continue et positive sur $]-infinity, frac(1, 2)] union [1, +infinity[$

par suite f est continue sur $D_f$.

\* $g(x) = |2x - 1|$. On a $D_g = RR$.

$x mapsto 2x - 1$ est une fonction polynome alors continue sur IR.

donc $x mapsto |2x - 1|$ est continue sur IR. D' ou g est continue sur $D_g = RR$.

#v(0.5cm)

=== Exercice 11 -- Corrige

// Source: Parascolaire Analyse p.57

$f(x) = 2x + frac(sqrt(9x^2), |x|) = 2x + frac(3|x|, |x|) = 2x + 3$ si $x eq.not 0$

$lim_(x arrow 0) f(x) = lim_(x arrow 0) 2x + 3 = 3 eq.not -1$ donc f n'est pas continue en 0.

#v(0.5cm)

=== Exercice 12 -- Corrige

f est continue en 1 si et seulement si $lim_(x arrow 1) f(x) = f(1)$

$lim_(x arrow 1) a x^2 + (a^2 - 3) x - 3a = a^2 - 2a - 3$ et $lim_(x arrow 1) x - 1 = 0$.

Alors la $lim_(x arrow 1) f(x)$ est finie si seulement si $a^2 - 2a - 3 = 0 arrow.l.r.double a = -1$ ou $a = 3$.

\*\* Si $a = -1$ alors $f(x) = frac(-x^2 - 2x + 3, x - 1)$.

Factorisons $-x^2 - 2x + 3$ : on remarque $-1 - 2 + 3 = 0$ donc $x' = 1$ et $x'' = -3$

D'ou $-x^2 - 2x + 3 = -(x - 1)(x + 3)$

Ainsi $f(x) = frac(-(x - 1)(x + 3), x - 1) = -x - 3$ si $x eq.not 1$

D'ou $lim_(x arrow 1) f(x) = lim_(x arrow 1) - x - 3 = -4 = f(1)$ car $f(1) = 4a = -4$.

donc f est continue en 1.

\*\* Si $a = 3$ alors $f(x) = frac(3x^2 + 6x - 9, x - 1) = frac(3(x - 1)(x + 3), x - 1) = 3x + 9$

$lim_(x arrow 1) f(x) = lim_(x arrow 1) 3x + 9 = 12$ or $f(1) = 4a = 12$ donc $lim_(x arrow 1) f(x) = f(1)$.

Conclusion : f est continue en 1 si et seulement si $a = 3$ ou $a = -1$

#v(0.5cm)

=== Exercice 13 -- Corrige

// Source: Parascolaire Analyse p.57

$f(x) = frac(-x^2 - 3x - 2, 1 - |x + 1|) = frac(x^2 + 3x + 2, |x + 1| - 1)$

1) $D_f = {x in RR \/ |x + 1| - 1 eq.not 0} = RR - {0, -2}$. Puisqu'on a

$|x + 1| - 1 = 0 arrow.l.r.double |x + 1| = 1 arrow.l.r.double x + 1 = 1$ ou $x + 1 = -1 arrow.l.r.double x = 0$ ou $x = -2$

2)

#table(
  columns: (auto, 1fr, auto, 1fr, auto),
  align: center,
  inset: 4pt,
  [x], [$-infinity$], [], [$-1$], [$+infinity$],
  [$x + 1$], [], [$-$], [0], [$+$],
  [$|x + 1|$], [], [$-x - 1$], [0], [$x + 1$],
)

// Source: Parascolaire Analyse p.58

$f(x) = frac(x^2 + 3x + 2, x)$ si $x in [-1, +infinity[$

$f(x) = frac(x^2 + 3x + 2, -x - 2)$ si $x in ]-infinity, -1]$.

$lim_(x arrow -1^+) f(x) = lim_(x arrow -1^+) frac(x^2 + 3x + 2, x) = 0$

$lim_(x arrow -1^-) f(x) = lim_(x arrow -1^-) frac(x^2 + 3x + 2, -x - 2) = 0$ or $f(-1) = 0$

donc $lim_(x arrow -1) f(x) = f(-1)$. Par suite f est continue en $-1$

#v(0.5cm)

=== Exercice 14 -- Corrige

1) $D_f = {x in RR^* \/ x + 1 gt.eq 0 "et" x eq.not 0} union {0} = [-1, +infinity[$

2) $lim_(x arrow 0) f(x) = lim_(x arrow 0) frac(sqrt(x + 1) - 1, x) = lim_(x arrow 0) frac((sqrt(x + 1) - 1)(sqrt(x + 1) + 1), x(sqrt(x + 1) + 1))$

$= lim_(x arrow 0) frac(x, x(sqrt(x + 1) + 1)) = lim_(x arrow 0) frac(1, sqrt(x + 1) + 1) = frac(1, 2)$.

f est continue en 0 si seulement si $lim_(x arrow 0) f(x) = f(0)$. Ou encore $frac(1, 2) = a$.

#v(0.5cm)

=== Exercice 15 -- Corrige

1) $lim_(x arrow -1^+) f(x) = lim_(x arrow -1^+) sqrt(5 - 4x) = sqrt(9) = 3$ et $lim_(x arrow -1^-) f(x) = lim_(x arrow -1^-) x^2 - x + 1 = 3$

or $f(-1) = sqrt(9) = 3$ ainsi $lim_(x arrow -1) f(x) = 3 = f(-1)$.

Par suite f est continue en $-1$.

2) $lim_(x arrow 1^-) f(x) = lim_(x arrow 1^-) sqrt(5 - 4x) = 1$ et $lim_(x arrow 1^+) f(x) = lim_(x arrow 1^+) a x^2 + 2b x - 4 = a + 2b - 4$

et $f(1) = 1$ d'ou f est continue en 1 si et seulement si :

$a + 2b - 4 = 1$ ou encore $a + 2b = 5$

#v(0.5cm)

=== Exercice 16 -- Corrige

// Source: Parascolaire Analyse p.58-59

1) $f(x) = frac(sqrt(1 + x) - sqrt(1 - x), x)$

a) $D_f = {x in RR \/ cases(1 + x gt.eq 0, 1 - x gt.eq 0, x eq.not 0)} arrow.l.r.double x in [-1, 1] backslash {0}$.

\* $cases(1 + x gt.eq 0, 1 - x gt.eq 0, x eq.not 0) arrow.l.r.double cases(x gt.eq -1, x lt.eq 1, x eq.not 0) arrow.l.r.double x in [-1, 1] backslash {0}$.

b) $lim_(x arrow 0) f(x) = lim_(x arrow 0) frac(sqrt(1 + x) - sqrt(1 - x), x)$

$= lim_(x arrow 0) frac((sqrt(1 + x) - sqrt(1 - x))(sqrt(1 + x) + sqrt(1 - x)), x(sqrt(1 + x) + sqrt(1 - x))) = lim_(x arrow 0) frac(2, sqrt(x + 1) + sqrt(1 - x)) = 1$.

$lim_(x arrow 1) f(x) = frac(sqrt(2), 1) = sqrt(2)$ et $lim_(x arrow -1) f(x) = frac(-sqrt(2), -1) = sqrt(2)$.

// Source: Parascolaire Analyse p.59

2) a) $lim_(x arrow 0^-) g(x) = lim_(x arrow 0^-) [f(x) - 1] = 1 - 1 = 0$.

$lim_(x arrow 0^+) g(x) = lim_(x arrow 0^+) frac(x sqrt(x) + x, sqrt(x)) = lim_(x arrow 0^+) frac((x sqrt(x) + x) sqrt(x), sqrt(x) dot sqrt(x))$

$= lim_(x arrow 0^+) frac(x^2 + x sqrt(x), x) = lim_(x arrow 0^+) frac(x(x + sqrt(x)), x) = lim_(x arrow 0^+) (x + sqrt(x)) = 0$

donc $lim_(x arrow 0^+) g(x) = lim_(x arrow 0^-) g(x) = g(0)$ d'ou g est continue en 0.

b) \* Si $x in RR_+^*$ ; $g(x) = frac(x sqrt(x) + x, sqrt(x))$

$cases(x mapsto sqrt(x) "continue sur" RR_+^*, x mapsto x "est continue sur" RR_+^*)$ alors $cases(x mapsto x sqrt(x) + x "est continue" \ "sur" RR_+^* "car c'est la somme de" \ "deux fonctions continues".)$

$cases(x mapsto x sqrt(x) + x "continue sur" RR_+^*, x mapsto sqrt(x) "est continue sur" RR_+^*)$ alors $cases(x mapsto frac(x sqrt(x) + x, sqrt(x)) "est continue sur" RR_+^* \ "car c'est le quotient de deux" \ "fonctions continues".)$

Donc g est continue sur $RR_+^*$

\* Si $x in [-1, 0[$ ; $g(x) = f(x) - 1$

\* la fonction qui a : $x mapsto 1 - x$ est continue et positive sur $[-1, 0[$;

donc la fonction qui a $x mapsto sqrt(1 - x)$ est continue sur $[-1, 0[$.

// Source: Parascolaire Analyse p.60

\* la fonction qui a : $x mapsto 1 + x$ est continue et positive sur $[-1, 0[$.

donc la fonction qui a $x mapsto sqrt(1 + x)$ est continue sur $[-1, 0[$.

donc $x mapsto sqrt(1 + x) - sqrt(1 - x)$ est continue sur $[-1, 0[$.

\* la fonction $x mapsto x$ est continue pour tout $x in [-1, 0[$.

donc $x mapsto frac(sqrt(1 + x) - sqrt(1 - x), x)$ est continue sur $[-1, 0[$.

car c'est le quotient de deux fonctions continues.

d'ou $x mapsto frac(sqrt(1 - x) - sqrt(1 + x), x) - 1$ est continue sur $[-1, 0[$.

donc g est continue sur $[-1, 0[$.

d'ou g est continue sur $]-1, 0[ union ]0, +infinity[$ et on a g continue en 0

d'ou g est continue sur $]-1, +infinity[$.

$lim_(x arrow (-1)^+) g(x) = lim_(x arrow (-1)^+) [f(x) - 1] = sqrt(2) - 1 = g(-1)$

*Conclusion* : g est continue sur $[-1, +infinity[$.

#v(0.5cm)

=== Exercice 17 -- Corrige

// Source: Parascolaire Analyse p.60

$f(x) = frac(x^2 - 3x + 2, |x - 1| - 1)$

1) $D_f = {x in RR "tel que" |x - 1| - 1 eq.not 0}$

$arrow.l.r.double |x - 1| - 1 = 0 arrow.double |x - 1| = 1 arrow.l.r.double x - 1 = 1$ ou $x - 1 = -1$.

$arrow.l.r.double x = 2$ ou $x = 0$ ; ainsi $D_f = RR backslash {0, 2}$.

2) a) $lim_(x arrow 2) f(x) = lim_(x arrow 2) frac(x^2 - 3x + 2, x - 2) = lim_(x arrow 2) frac((x - 2)(x - 1), (x - 2)) = lim_(x arrow 2) x - 1 = 1$.

b) $lim_(x arrow 1) f(x) = lim_(x arrow infinity) frac(x^2 - 3x + 2, x - 2) = frac(0, -1) = 0$

3) $lim_(x arrow 2^+) g(x) = lim_(x arrow 2^+) f(x) = 1$

$lim_(x arrow 2^-) g(x) = lim_(x arrow 2^-) frac(a x + E(x), x - 1) = frac(2a + 1, 1)$ et $g(2) = 1$

g continue en 2 si et seulement si $lim_(x arrow 2^-) g(x) = lim_(x arrow 2^+) g(x) = g(2)$

donc $2a + 1 = 1 arrow.l.r.double a = 0$.

#v(0.5cm)

=== Exercice 18 -- Corrige

// Source: Parascolaire Analyse p.61

1) $D_f = {x in ]-infinity, 1] \/ x^2 + 3 gt.eq 0} union {x in ]1, +infinity[ \/ -x + 2 eq.not 0}$

$= ]-infinity, 1] union ]1, 2[ union ]2, +infinity[ = RR backslash {2}$.

2) $lim_(x arrow 1^+) f(x) = lim_(x arrow 1^+) frac(x^2 + 2x - m, -x + 2) = 3 - m$

$lim_(x arrow 1^-) f(x) = lim_(x arrow 1^-) sqrt(x^2 + 3) + 2x = 4 = f(1)$.

f est continue en 1 si et seulement si $lim_(x arrow 1^+) f(x) = lim_(x arrow 1^-) f(x) = f(1)$.

$arrow.l.r.double 3 - m = 4 arrow.l.r.double -1 = m$.

3) $bullet$ Si $m eq.not -1$ alors f n'est pas continue en 1

donc f n'est pas continue sur $RR backslash {2}$.

$bullet$ Si $m = -1$ alors f est continue en 1 et de plus on a :

\* $x mapsto sqrt(x^2 + 3)$ continue sur IR car $x mapsto x^2 + 3$ positive et continue sur IR.

\* $x mapsto 2x$ continue sur IR car c'est un polynome donc f est continue sur $]-infinity, 1[$.

\* $x mapsto frac(x^2 + 2x - m, -x + 2)$ est rationnelle donc elle est continue sur $RR - {2}$

Donc f est continue sur $]1, +infinity[ backslash {2}$.

Conclusion : f est continue sur $RR backslash {2}$ si et seulement si $m = -1$

#v(0.5cm)

=== Exercice 19 -- Corrige

// Source: Parascolaire Analyse p.61-62

$f(1) = frac(1 + E(frac(1, 2)), 1 + 1) = frac(1, 2)$ or $E(frac(1, 2)) = 0$

$E(frac(x, 2)) = n arrow.l.r.double n lt.eq frac(x, 2) < n + 1 arrow.l.r.double 2n lt.eq x < 2n + 2$

Si $x in [2n, 2n + 2[$ alors $E(frac(x, 2)) = n$.

Si $x in [0, 2[$ alors $E(frac(x, 2)) = 0$ donc $f(x) = frac(x^2, x + 1)$

comme $1 in [0, 2[$ $lim_(x arrow 1) f(x) = lim_(x arrow 1) frac(x^2, x + 1) = frac(1, 2) = f(1)$ donc f est continue en 1.

2) $lim_(x arrow 2^-) f(x) = lim_(x arrow 2^-) frac(x^2, x + 1) = frac(4, 3)$ et $lim_(x arrow 2^+) f(x) = lim_(x arrow 2^+) frac(x^2 + 1, x + 1) = frac(5, 3)$.

Donc $lim_(x arrow 2^-) f(x) eq.not lim_(x arrow 2^+) f(x)$ d'ou f n'est pas continue en 2

#v(0.5cm)

=== Exercice 20 -- Corrige

// Source: Parascolaire Analyse p.62

1)

#table(
  columns: (auto, 1fr, auto, 1fr, auto, 1fr, auto, 1fr, auto),
  align: center,
  inset: 4pt,
  [x], [$-infinity$], [], [$-2$], [], [$0$], [], [$2$], [$+infinity$],
  [$|x^2 - 4|$], [], [$x^2 - 4$], [0], [$-x^2 + 4$], [], [$-x^2 + 4$], [0], [$x^2 - 4$],
  [$|x|$], [], [$-x$], [], [$-x$], [0], [$x$], [], [$x$],
)

Si $x in ]-infinity, -2]$ alors $f(x) = frac(2x^2 + 4, x + 1) + x = frac(3x^2 + x + 4, x + 1)$.

Si $x in [-2, 0] backslash {-1}$ alors $f(x) = frac(-4x^2 + 4, -x - 1) + x = frac(4(x^2 - 1), x + 1) + x = 5x - 4$.

Si $x in [0, 2] backslash {1}$ alors $f(x) = -3x - 4$.

Si $x in [2, +infinity[$ alors $f(x) = frac(-x^2 - x - 4, x - 1) = frac(x^2 + x + 4, 1 - x)$.

2) a) $lim_(x arrow 1^-) f(x) = lim_(x arrow 1) -3x - 4 = -7$ et $f(1) = a + b$.

f est continue en 1 $arrow.l.r.double lim_(x arrow 1) f(x) = f(1) arrow.l.r.double a + b = -7$.

b) $lim_(x arrow -1^-) f(x) = lim_(x arrow -1) 5x - 4 = -9$ or $f(-1) = -a + b$.

f est continue en $-1 arrow.l.r.double lim_(x arrow -1) f(x) = f(-1) arrow.l.r.double -a + b = -9$.

c) f est continue en 1 et en $-1$ si seulement si

$cases(a + b = -7, -a + b = -9)$ On additionne membre a membre, on obtient $2b = -16$

Ainsi $b = -8$ d'ou $a = 1$.

3) Pour $a = 1$ et $b = -8$, on sait que f est continue en 1 et en $-1$.

Sur $]-infinity, -2[$ ; $f(x) = frac(3x^2 + x + 4, x + 1)$ est la restriction d'une fonction rationnelle

// Source: Parascolaire Analyse p.63

donc continue sur $]-infinity, -2[$.

Sur $]-2, -1[ union ]-1, 0[$ ; $f(x) = 5x - 4$ est la restriction d'une fonction affine

donc continue sur $]-2, -1[ union ]-1, 0[$.

Sur $]0, 1[ union ]1, 2[$ ; $f(x) = -3x - 4$ affine donc continue sur $]0, 1[ union ]1, 2[$.

Sur $]2, +infinity[$ ; $f(x) = frac(x^2 + x + 4, 1 - x)$ est la restriction d'une fonction rationnelle

donc continue sur $]2, +infinity[$.

*Continuite en 2 :*

$lim_(x arrow 2^-) f(x) = lim_(x arrow 2^-) -3x - 4 = -10$ et $lim_(x arrow 2^+) f(x) = lim_(x arrow 2^+) frac(x^2 + x + 4, 1 - x) = -10$

et $f(2) = -10$ donc f est continue en 2.

*Continuite en $-2$ :*

$lim_(x arrow (-2)^-) f(x) = lim_(x arrow (-2)^-) frac(3x^2 + x + 4, x + 1) = -14$.

$lim_(x arrow (-2)^+) f(x) = lim_(x arrow (-2)^+) 5x - 4 = -14 = lim_(x arrow (-2)^-) f(x) = f(-2)$.

D'ou f est continue en $-2$.

*Conclusion* : f est continue sur IR.

#v(0.5cm)

=== Exercice 21 -- Corrige

// Source: Parascolaire Analyse p.63

1) $D_f = {x in ]-infinity, -1[ \/ x + 2 eq.not 0} union {x in [-1, 3]} union {x in ]3, +infinity[ \/ 4x - 3 gt.eq 0}$

$= (]-infinity, -1[ backslash {-2}) union [-1, 3] union ]3, +infinity[ = RR backslash {-2}$.

2) $lim_(x arrow -1^-) f(x) = lim_(x arrow -1^-) frac((a + 2)x^2 + x + 2a, x + 2) = frac(a + 2 - 1 + 2a, 1) = 3a + 1$

$lim_(x arrow -1^+) f(x) = lim_(x arrow (-1)^+) frac(1, 2) x^2 - frac(7, 2) x + b = 4 + b = f(-1)$.

f est continue en $-1 arrow.l.r.double lim_(x arrow -1) f(x) = f(-1) arrow.l.r.double 3a + 1 = 4 + b arrow.l.r.double 3a - b = 3$.

$lim_(x arrow 3^-) f(x) = lim_(x arrow 3^-) frac(1, 2) x^2 - frac(7, 2) x + b = -6 + b = f(3)$

$lim_(x arrow 3^+) f(x) = lim_(x arrow 3^+) sqrt(4x - 3) - x = 0$.

f est continue en 3 $arrow.l.r.double -6 + b = 0 arrow.l.r.double b = 6$.

Or $3a - b = 3$ donc $3a = 9$ ou encore $a = 3$.

// Source: Parascolaire Analyse p.64

4) $b = 6$ alors f est continue en 3 or $a = 1$ donc f n'est pas continue en $-1$.

Sur $]-infinity, -1[ backslash {-2}$ ; $f(x) = frac(3x^2 + x + 2, x + 2)$ est la restriction d'une fonction

rationnelle donc continue sur $]-infinity, -1[ backslash {-2}$.

Sur $]-1, 3[$ f est la restriction d'un polynome donc continue sur $]-1, 3[$.

Sur $]3, +infinity[$ on a : $x mapsto 4x - 3$ est continue et positive donc

$x mapsto sqrt(4x - 3)$ est continue sur $]3, +infinity[$ et $x mapsto -x$ continue sur $]3, +infinity[$

d' ou f est continue sur $]3, +infinity[$.

*Conclusion* : f est continue sur $RR backslash {-2, -1}$.

#v(0.5cm)

=== Exercice 22 -- Corrige

// Source: Parascolaire Analyse p.64-65

1) a) Si $x in ]-infinity, frac(1, 2)[$ ; $f(x) = (1 + 3m) x^2 + 3x$ pas de condition

donc $D_1 = ]-infinity, frac(1, 2)[$.

$D_2 = {x in ]frac(1, 2), 2[ "tel que" 2x^2 - 5x + 2 eq.not 0}$

\* $2x^2 - 5x + 2 = 0$.

$Delta = 25 - 16 = 9$ donc $x = frac(5 - 3, 4) = frac(1, 2)$ ou $x = frac(5 + 3, 4) = 2$

d'ou : $D_2 = ]frac(1, 2), 2[$.

\* $4x^2 - 1 gt.eq 0$

#table(
  columns: (auto, 1fr, auto, 1fr, auto, 1fr, auto),
  align: center,
  inset: 4pt,
  [x], [$-infinity$], [], [$-frac(1, 2)$], [], [$frac(1, 2)$], [$+infinity$],
  [$4x^2 - 1$], [], [+], [0], [$-$], [0], [+],
)

D'ou $D_3 = [2, +infinity[$ ; par suite $D_f = D_1 union D_2 union D_3 = RR backslash {frac(1, 2)}$.

\* $lim_(x arrow (frac(1, 2))^-) f(x) = (1 + 3m) frac(1, 4) + frac(3, 2) = frac(3, 4) m + frac(7, 4)$

// Source: Parascolaire Analyse p.65

$lim_(x arrow (frac(1, 2))^+) f_m (x) = +infinity$, car $lim_(x arrow frac(1, 2)^+) (x^2 - 8) = frac(1, 8) - 8 < 0$ et $lim_(x arrow frac(1, 2)^+) (2x^2 - 5x + 2) = 0^-$

#table(
  columns: (auto, 1fr, auto, 1fr, auto, 1fr, auto),
  align: center,
  inset: 4pt,
  [x], [$-infinity$], [], [$frac(1, 2)$], [], [$2$], [$+infinity$],
  [$2x^2 - 5x + 2$], [], [+], [0], [$-$], [0], [+],
)

donc $lim_(x arrow frac(1, 2)) f(x)$ n'existe pas.

\* $lim_(x arrow 2^-) f_m (x) = lim_(x arrow 2^-) frac((x - 2)(x^2 + 2x + 4), 2(x - 2)(x - frac(1, 2))) = lim_(x arrow 2^-) frac(x^2 + 2x + 4, 2x - 1) = frac(12, 3) = 4$.

2) $lim_(x arrow 2^+) f_m (x) = f(2) = sqrt(15) - 2m - 1$.

f est continue en 2 si et seulement si $lim_(x arrow 2^-) f_m (x) = lim_(x arrow 2^+) f_m (x) = f(2)$.

$sqrt(15) - 2m - 1 = 4 arrow.l.r.double 2m = sqrt(15) - 5 arrow.l.r.double m = frac(sqrt(15) - 5, 2)$

f est continue en 2 si et seulement si $m = frac(sqrt(15) - 5, 2)$.

3) \* si $x in ]-infinity, frac(1, 2)[$ ; $f(x) = (1 + 3m) x^2 + 3x$.

$x mapsto (1 + 3m) x^2 + 3x$ est continue sur $]-infinity, frac(1, 2)[$

car c'est la restriction d'une polynome.

\* si $x in ]frac(1, 2), 2[$ ; $f_m (x) = frac(x^3 - 8, 2x^2 - 5x + 2)$

$x mapsto frac(x^3 - 8, 2x^2 - 5x + 2)$ est la restriction d'une fonction rationnelle avec un

denominateur non nul sur $]frac(1, 2), 2[$ donc elle est continue sur $]frac(1, 2), 2[$.

// Source: Parascolaire Analyse p.65-66

si $x in ]2, +infinity[$ ; $f_m (x) = sqrt(4x^2 - 1) - m x - 1$

$x mapsto 4x^2 - 1 gt.eq 0$ et continue sur $]2, +infinity[$

donc la fonction $x mapsto sqrt(4x^2 - 1)$ est continue sur $]2, +infinity[$

$x mapsto -m x - 1$ est continue sur $]2, +infinity[$

donc $x mapsto sqrt(4x^2 - 1) - m x - 1$ est continue sur $]2, +infinity[$

\*Si $m = frac(sqrt(15) - 5, 2)$ alors $f_m$ continue en 2

et on a $f_m$ continue sur $]-infinity, frac(1, 2)[ union ]frac(1, 2), 2[ union ]2, +infinity[$.

par suite $D_(f_m) = RR backslash {frac(1, 2)}$ = Domaine de continuite de f

\* Si $m eq.not frac(sqrt(15) - 5, 2)$ alors $D_(f_m) = RR backslash {frac(1, 2), 2}$.

#v(0.5cm)

=== Exercice 23 -- Corrige

// Source: Parascolaire Analyse p.66

1) $lim_(x arrow 0^+) f(x) = lim_(x arrow 0^+) frac(x^3, 1 - sqrt(x^3 + 1))$

$= lim_(x arrow 0^+) frac(x^3 (1 + sqrt(x^3 + 1)), 1 - (x^3 + 1)) = lim_(x arrow 0^+) frac((1 + sqrt(x^3 + 1)), -1) = -2$.

\* Si $x in [-1, 0[$ alors $E(x) = -1$ donc $f(x) = -(x + 2)$

$lim_(x arrow 0^-) f(x) = lim_(x arrow 0^-) -(x + 2) = -2$.

\* $f(0) = -2$ donc $f(0) = lim_(x arrow 0) f(x) = -2$ ainsi f est continue en 0.

2) Si $x in [-1, 0[$ alors $E(x) = -1$ donc $f(x) = -(x + 2)$

Si $x in [-2, -1[$ alors $E(x) = -2$ donc $f(x) = -2(x + 2)$.

$lim_(x arrow -1) f(x) = lim_(x arrow -1) (x + 2) E(x)$.

\* $lim_(x arrow (-1)^-) f(x) = lim_(x arrow (-1)^-) -2(x + 2) = -2$ et $lim_(x arrow (-1)^+) f(x) = lim_(x arrow (-1)^+) -(x + 2) = -1$

donc $lim_(x arrow -1^-) f(x) eq.not lim_(x arrow -1^+) f(x)$ d'ou f est discontinue en $-1$.

#v(0.5cm)

=== Exercice 24 -- Corrige

// Source: Parascolaire Analyse p.66-68

1) $x in ]frac(1, 4), +infinity[$ $arrow.l.r.double$ $x > frac(1, 4)$ $arrow.l.r.double$ $frac(1, x) < 4$ et $frac(1, x) > 0$

$0 < frac(1, x) < 1 arrow.l.r.double frac(1, 2) < x lt.eq 1$ donc $E(frac(1, x)) = 0$

$1 lt.eq frac(1, x) < 2 arrow.l.r.double frac(1, 2) < x lt.eq 1$ donc -- non,

$1 lt.eq frac(1, x) < 2 arrow.l.r.double frac(1, 3) < x lt.eq frac(1, 2)$ donc $E(frac(1, x)) = 1$

$2 lt.eq frac(1, x) < 3 arrow.l.r.double frac(1, 3) < x lt.eq frac(1, 2)$ -- non,

$2 lt.eq frac(1, x) < 3 arrow.l.r.double frac(1, 4) < x lt.eq frac(1, 3)$ donc $E(frac(1, x)) = 2$

$3 lt.eq frac(1, x) < 4 arrow.l.r.double frac(1, 4) < x lt.eq frac(1, 3)$ donc $E(frac(1, x)) = 3$. D'ou :

$f_0 (x) = cases(
  0 & "si" x in ]1\, +infinity[,
  1 & "si" x in ]frac(1, 2)\, 1],
  2 & "si" x in ]frac(1, 3)\, frac(1, 2)],
  3 & "si" x in ]frac(1, 4)\, frac(1, 3)]
)$ $quad$ ; $quad$ $f_1 (x) = cases(
  0 & "si" x in ]1\, +infinity[,
  x & "si" x in ]frac(1, 2)\, 1],
  2x & "si" x in ]frac(1, 3)\, frac(1, 2)],
  3x & "si" x in ]frac(1, 4)\, frac(1, 3)]
)$ $quad$ ; $quad$ $f_2 (x) = cases(
  0 & "si" x in ]1\, +infinity[,
  x^2 & "si" x in ]frac(1, 2)\, 1],
  2x^2 & "si" x in ]frac(1, 3)\, frac(1, 2)],
  3x^2 & "si" x in ]frac(1, 4)\, frac(1, 3)]
)$

// Graphs for f_0, f_1, f_2 (schematic step functions / piecewise)

#grid(
  columns: (1fr, 1fr, 1fr),
  gutter: 0.5cm,
  [
    #align(center)[Courbe $C_0$]
    #cetz.canvas(length: 2cm, {
      import cetz.draw: *
      // axes
      line((-0.3, 0), (2.5, 0), mark: (end: ">"))
      line((0, -0.3), (0, 2.5), mark: (end: ">"))
      content((2.5, -0.2), $x$)
      content((-0.2, 2.5), $y$)
      content((-0.15, -0.15), $O$)
      // step function
      line((0.5, 1.5), (0.75, 1.5)) // 3 on [1/4, 1/3]
      circle((0.75, 1.5), radius: 0.04, fill: white)
      line((0.75, 1), (1, 1)) // 2 on [1/3, 1/2]
      circle((1, 1), radius: 0.04, fill: white)
      line((1, 0.5), (2, 0.5)) // 1 on [1/2, 1]
      circle((2, 0.5), radius: 0.04, fill: white)
      line((2, 0), (2.5, 0)) // 0 on ]1, +inf[
    })
  ],
  [
    #align(center)[Courbe $C_1$]
    #cetz.canvas(length: 2cm, {
      import cetz.draw: *
      line((-0.3, 0), (2.5, 0), mark: (end: ">"))
      line((0, -0.3), (0, 2.5), mark: (end: ">"))
      content((2.5, -0.2), $x$)
      content((-0.2, 2.5), $y$)
      content((-0.15, -0.15), $O$)
      // piecewise linear
      line((1, 0.5), (2, 1)) // x on [1/2, 1]
      line((0.75, 0.75), (1, 1)) // 2x on [1/3, 1/2]
      line((0.5, 0.75), (0.75, 1)) // 3x on [1/4, 1/3]
      line((2, 0), (2.5, 0)) // 0 on ]1, +inf[
    })
  ],
  [
    #align(center)[Courbe $C_2$]
    #cetz.canvas(length: 2cm, {
      import cetz.draw: *
      line((-0.3, 0), (2.5, 0), mark: (end: ">"))
      line((0, -0.3), (0, 2.5), mark: (end: ">"))
      content((2.5, -0.2), $x$)
      content((-0.15, -0.15), $O$)
      // piecewise parabolic (approximate with lines)
      line((1, 0.25), (2, 1)) // x^2 on [1/2, 1]
      line((0.75, 0.375), (1, 0.5)) // 2x^2 on [1/3, 1/2]
      line((0.5, 0.25), (0.75, 0.375)) // 3x^2 on [1/4, 1/3]
      line((2, 0), (2.5, 0)) // 0 on ]1, +inf[
    })
  ],
)

// Source: Parascolaire Analyse p.67

2) \* La restriction de $f_0$ sur $]1, +infinity[$ respectivement sur $]frac(1, 2), 1[$ ; $]frac(1, 3), frac(1, 2)[$

et $]frac(1, 4), frac(1, 3)[$ est une constante donc continue sur chaque intervalle :

$lim_(x arrow 1^+) f_0 (x) = 0$ et $lim_(x arrow 1^-) f_0 (x) = 1$ donc f n'est pas continue en 1

$lim_(x arrow (frac(1, 2))^+) f_0 (x) = 2 eq.not$ $lim_(x arrow (frac(1, 2))^-) f_0 (x) = 1$ et

$lim_(x arrow (frac(1, 3))^+) f_0 (x) = 2 eq.not 3 = lim_(x arrow (frac(1, 3))^-) f_0 (x)$.

*Conclusion* : $f_0$ est continue sur $]frac(1, 4), +infinity[ backslash {frac(1, 2), 1, frac(1, 3)}$.

// Source: Parascolaire Analyse p.68

\* La restriction de $f_1$ sur $]1, +infinity[$ respectivement sur : $]frac(1, 3), frac(1, 2)[$ ; $]frac(1, 2), 1[$ ;

$]frac(1, 4), frac(1, 3)[$ est une fonction lineaire donc continue sur chaque intervalle.

$lim_(x arrow 1^+) f_1 (x) = 0 eq.not lim_(x arrow 1^-) f_1 (x) = 1$.

$lim_(x arrow (frac(1, 2))^+) f_1 (x) = frac(1, 2) eq.not lim_(x arrow (frac(1, 2))^-) f_1 (x) = 1$.

$lim_(x arrow (frac(1, 3))^+) f_1 (x) = frac(2, 3) eq.not lim_(x arrow (frac(1, 3))^-) f_1 (x) = 1$.

\* La restriction de $f_2$ sur $]1, +infinity[$ respectivement sur $]frac(1, 2), 1[$ ; $]frac(1, 3), frac(1, 2)[$

et $]frac(1, 4), frac(1, 3)[$ est une fonction polynome donc continue sur chaque intervalle.

$lim_(x arrow 1^+) f_2 (x) = 0 eq.not lim_(x arrow 1^-) f_2 (x) = 1$

$lim_(x arrow (frac(1, 2))^+) f_2 (x) = frac(1, 4) eq.not lim_(x arrow (frac(1, 2))^-) f_2 (x) = frac(1, 2)$ et $lim_(x arrow (frac(1, 3))^+) f_2 (x) = frac(2, 9) eq.not lim_(x arrow (frac(1, 3))^-) f_2 (x) = frac(1, 3)$.

Donc $f_0, f_1$ et $f_2$ sont continues sur $]frac(1, 4), +infinity[ - {frac(1, 2), frac(1, 3), 1}$.

#v(0.5cm)

=== Exercice 25 -- Corrige

// Source: Parascolaire Analyse p.68

1) $n lt.eq x lt.eq n + 1 arrow.double E(x) = n arrow.double f(x) = frac(n, x)$.

$n - 1 lt.eq x < n arrow.double E(x) = n - 1 arrow.double f(x) = frac(n - 1, x)$.

2) $x mapsto E(x)$ continue sur $RR backslash ZZ$ et $x mapsto frac(1, x)$ continue sur $RR^*$

Alors f est continue sur $RR backslash ZZ$

\*Continuite de f en n avec $n in ZZ^*$

$lim_(x arrow n^+) f(x) = lim_(x arrow n^+) frac(n, x) = 1$ et $lim_(x arrow n^-) f(x) = frac(n - 1, n)$ et $f(n) = 1$.

Donc f n'est pas continue en tout point $n in ZZ^*$

*Conclusion* : f est continue sur $RR backslash ZZ$.

#v(0.5cm)

=== Exercice 26 -- Corrige

// Source: Parascolaire Analyse p.69

a) $f(x) = frac(sqrt(1 + x) - 1, x) = frac((sqrt(1 + x) - 1)(sqrt(1 + x) + 1), x(sqrt(1 + x) + 1))$

$= frac(sqrt(1 + x)^2 - 1^2, x(sqrt(1 + x) + 1)) = frac(cancel(x) + 1 - 1, cancel(x)(sqrt(1 + x) + 1)) = frac(1, sqrt(1 + x) + 1)$

b) $lim_(x arrow 0) f(x) = lim_(x arrow 0) frac(1, sqrt(1 + x) + 1) = frac(1, 2)$

c) $lim_(x arrow 0) f(x) = frac(1, 2)$ alors f est prolongeable par continuite en 0 il suffit de choisir

g definie sur $[-1, +infinity[$ par : $g(x) = f(x)$ si $x eq.not 0$ et $g(0) = frac(1, 2)$.

#v(0.5cm)

=== Exercice 27 -- Corrige

// Source: Parascolaire Analyse p.69

a) On a : $sqrt(9x^2) = 3|x|$

$f(x) = 2x + frac(sqrt(9x^2), x) = 2x + frac(3|x|, x)$

$lim_(x arrow 0^+) f(x) = lim_(x arrow 0^+) 2x + frac(3x, x)$ (car $x gt.eq 0 arrow.double |x| = x$)

$= lim_(x arrow 0^+) 2x + 3 = 3$

$lim_(x arrow 0^-) f(x) = lim_(x arrow 0^-) 2x + frac(-3x, x)$ #h(0.5cm) (car $x lt.eq 0 arrow.double |x| = -x$)

$= lim_(x arrow 0^-) 2x - 3 = -3$ donc $lim_(x arrow 0^+) f eq.not lim_(x arrow 0^-)f$

d'ou f n'a pas de limite en 0 par suite f n'est pas continue en 0.

b) On ne peut pas prolonger f par continuite car $lim_(x arrow 0) f$ n'existe pas.
