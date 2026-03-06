// =============================================================================
// Transcription fidele : Parascolaire Analyse 3eme sec Section Math (Kounouz)
// Chapitre IV — Limites et comportement asymptotique (pages 70 a 104)
// =============================================================================

#import "@preview/cetz:0.3.4"

#set text(lang: "fr")
#set page(margin: 2cm)

// ─────────────────────────────────────────────────────────────────────────────
// RESUME DE COURS (pages 70–73)
// ─────────────────────────────────────────────────────────────────────────────

// Source: Parascolaire Analyse p.70

#align(center)[
  _Chapitre IV_ \
  #text(size: 18pt, weight: "bold")[Limites et comportement asymptotique]
]

#v(0.5cm)

#rect(stroke: 0.5pt + black, width: 100%, inset: 12pt)[

  #underline[*I) Limite infinie a l'infini :*]

  #v(0.3cm)
  *#sym.square.filled Definitions :*

  1) $lim_(x arrow +infinity) f(x) = +infinity$ signifie que $forall A > 0$, il existe $beta > 0$ tel que

  Si $x > beta$ alors $f(x) > A$.

  2) $lim_(x arrow +infinity) f(x) = -infinity$ signifie que $forall A > 0$, il existe $beta > 0$ tel que

  Si $x > beta$ alors $f(x) < -A$.

  3) $lim_(x arrow -infinity) f(x) = -infinity$ signifie que $forall A > 0$, il existe $beta > 0$ tel que

  Si $x < -beta$ alors $f(x) < -A$.

  4) $lim_(x arrow -infinity) f(x) = +infinity$ signifie que $forall A > 0$, il existe $beta > 0$ tel que

  Si $x < -beta$ alors $f(x) > A$.

  #v(0.3cm)
  *#sym.square.filled #underline[Theoremes] :*

  $lim_(x arrow +infinity) sqrt(x - a) = +infinity$ et $lim_(x arrow -infinity) sqrt(a - x) = +infinity$

  $lim_(x arrow +infinity) (x - a)^n = +infinity$ et $lim_(x arrow -infinity) (x - a)^n = cases(+infinity "si n est pair", -infinity "si n est impair")$

  #v(0.5cm)
  #underline[*II) Limites finies en $+infinity$ et $-infinity$ :*]

  *#sym.square.filled Definitions :*

  1) $lim_(x arrow +infinity) f(x) = L$ signifie que $forall A > 0$, il existe $beta > 0$ tel que $x > beta$

  alors $|f(x) - L| < A$.

  2) $lim_(x arrow -infinity) f(x) = L$ signifie que $forall A > 0$, il existe $beta > 0$ tel que $x < -beta$

  alors $|f(x) - L| < A$.

  #v(0.3cm)
  *#sym.square.filled #underline[Theoreme] :* Si $lim_infinity f = infinity$ alors $lim_infinity frac(1, f) = 0$

  #v(0.5cm)
  #underline[*III) Limites infinies en un reel :*]

  #underline[Definitions] :

  1) $lim_(x arrow a) f(x) = +infinity$ signifie que $forall A > 0$, il existe $beta > 0$ tel que

  $0 < |x - a| < beta$ alors $f(x) > A$.

  2) $lim_(x arrow a) f(x) = -infinity$ signifie que $forall A > 0$, il existe $beta > 0$ tel que
]

// Source: Parascolaire Analyse p.71

#rect(stroke: 0.5pt + black, width: 100%, inset: 12pt)[

  Si $0 < |x - a| < beta$ alors $f(x) < -A$.

  3) $lim_(x arrow a^+) f(x) = +infinity$ signifie que $forall A > 0$, $exists beta > 0$ tel que

  Si $0 < x - a < beta$ alors $f(x) > A$.

  4) $lim_(x arrow a^-) f(x) = +infinity$ signifie que $forall A > 0$, $exists beta > 0$ tel que

  Si $0 < a - x < beta$ alors $f(x) > A$.

  #v(0.5cm)
  #underline[*IV) Calculs de limites :*]

  $alpha$ un reel fini ou $+infinity$ ou $-infinity$ ; $ell$ et $ell'$ sont deux reels finies.

  #v(0.3cm)
  *#sym.triangle.r #underline[limite d'une somme de fonction.]*

  #table(
    columns: (1fr, 1fr, 1fr, 1fr, 1fr, 1fr),
    align: center,
    table.header[$lim_(x arrow alpha) f(x)$][$ell$][$ell$][$ell$][$+infinity$][$-infinity$][$+infinity$],
    [$lim_(x arrow alpha) g(x)$], [$ell'$], [$+infinity$], [$-infinity$], [$+infinity$], [$-infinity$], [$-infinity$],
    [$lim_(x arrow alpha) f(x)+g(x)$], [$ell + ell'$], [$+infinity$], [$-infinity$], [$+infinity$], [$-infinity$], [F.I],
  )

  F.I : Forme indeterminee. Ce sont les cas ou l'on ne peut pas conclure directement.

  #v(0.3cm)
  *#sym.triangle.r #underline[Limite d'un produit de fonctions :]*

  #table(
    columns: (1fr, 1fr, 1fr, 1fr),
    align: center,
    table.header[$lim_(x arrow alpha) f(x)$][$ell$][$ell eq.not 0$][$infinity$][$0$],
    [$lim_(x arrow alpha) g(x)$], [$ell'$], [$infinity$], [$infinity$], [$infinity$],
    [$lim_(x arrow alpha) f(x) times g(x)$], [$ell times ell'$], [$infinity$], [$infinity$], [F.I],
  )

  Ce tableau a ete simplifie pour rendre la memorisation plus facile ; il faut naturellement appliquer la regle de signe au resultat.

  #underline[Exemple] : $lim_(x arrow 2) f(x) = +infinity$ ; $lim_(x arrow 2) g(x) = -2$ alors $lim_(x arrow 2) f(x) times g(x) = -infinity$

  #v(0.3cm)
  *#sym.triangle.r #underline[Limite d'un quotient de fonction :]*

  #table(
    columns: (1fr, 1fr, 1fr, 1fr, 1fr, 1fr, 1fr),
    align: center,
    table.header[$lim_(x arrow alpha) f(x)$][$ell$][$ell eq.not 0$][$ell eq.not 0$][$0$][$infinity$][$infinity$][$ell$],
    [$lim_(x arrow alpha) g(x)$], [$ell' eq.not 0$], [$0^+$], [$0^-$], [$0$], [$infinity$], [$ell = 0^+$ ou $0^-$], [$infinity$],
    [$lim_(x arrow alpha) frac(f(x), g(x))$], [$frac(ell, ell')$], [$+infinity$ si $ell > 0$ \ $-infinity$ si $ell < 0$], [$+infinity$ si $ell < 0$ \ $-infinity$ si $ell > 0$], [F.I], [F.I], [$infinity$ avec regle de signe], [$0$],
  )
]

// Source: Parascolaire Analyse p.72

#rect(stroke: 0.5pt + black, width: 100%, inset: 12pt)[

  #underline[*Formes indeterminees :*]

  #table(
    columns: (1fr, 2fr),
    align: center,
    table.header[Formes indeterminees][Comment lever l'indetermination ? pistes],
    [$+infinity - infinity$ ou $frac(infinity, infinity)$], [Mettre en facteur l'expression "preponderante"],
    [$0 times infinity$], [Chercher une simplification ou se ramener a $frac(infinity, infinity)$],
    [$frac(0, 0)$], [Chercher une simplification],
    [Comportement des $sqrt("")$], [Multiplier et diviser par l'expression conjuguee ou factoriser.],
  )

  #v(0.3cm)
  $triangle.r$ $f(x) = a_n x^n + a_(n-1) x^(n-1) + ... + a_1 x + a_0$ avec $a_n eq.not 0$

  $lim_(x arrow +infinity \ "ou" \ x arrow -infinity) f(x) = lim_(x arrow +infinity \ "ou" \ x arrow -infinity) a_n x^n$

  #v(0.3cm)
  $triangle.r$ $g(x) = frac(a_n x^n + ... + a_1 x + a_0, b_m x^m + ... + b_1 x + b_0)$ avec $a_n eq.not 0$ et $b_m eq.not 0$

  $lim_(x arrow +infinity \ "ou" \ x arrow -infinity) g(x) = lim_(x arrow +infinity \ "ou" \ x arrow -infinity) frac(a_n x^n, b_m x^m)$.

  #v(0.3cm)
  $triangle.r$ $lim_(x arrow alpha) f(x) = ell$ et $f(x) > 0$ $arrow.double lim_(x arrow alpha) sqrt(f(x)) = sqrt(ell)$.

  #v(0.3cm)
  #underline[*Theoremes :*]

  1) $lim_(x arrow a) f(x) = +infinity arrow.double lim_(x arrow a) sqrt(f(x)) = +infinity$.

  2) $lim_(x arrow a) f(x) = L$ et $f(x) gt.eq 0$ $arrow.double lim_(x arrow a) sqrt(f(x)) = sqrt(L)$.

  #v(0.5cm)
  *#sym.square.filled #underline[Les Asymptotes :]*

  Soit f une fonction et C sa representation graphique dans un repere du plan.

  $triangle.r$ $lim_(x arrow b^+) f(x) = +infinity$ ou $lim_(x arrow b^-) f(x) = -infinity$ ou $lim_(x arrow b^-) f(x) = +infinity$ ou $lim_(x arrow b^+) f(x) = -infinity$.

  On dit alors que $Delta : x = b$ *est une asymptote verticale a C*.

  #v(0.3cm)
  $triangle.r$ $lim_(x arrow +infinity) f(x) = a$ ou $lim_(x arrow -infinity) f(x) = a$. On dit alors que

  $Delta' : y = a$ *est une asymptote horizontale a C* au voisinage de $+infinity$ ou $-infinity$.
]

// Source: Parascolaire Analyse p.73

#rect(stroke: 0.5pt + black, width: 100%, inset: 12pt)[

  $triangle.r$ $lim_(x arrow infinity) f(x) = infinity$ (on remplace $infinity$ par soit $+infinity$ ou $-infinity$).

  On cherche a ecrire f sous la forme : $f(x) = a x + b + g(x)$.

  Si $lim_(x arrow infinity) g(x) = 0$, on deduit alors que :

  $Delta : y = a x + b$ *est une asymptote au voisinage de* $infinity$.

  #v(0.5cm)
  *#sym.square.filled #underline[Position $zeta$ et $Delta$ :]*

  $triangle.r$ $Delta$ une droite, $Delta : y = a x + b$ :

  \* Si $f(x) - (a x + b) gt.eq 0$ ; alors $overline(zeta)$ est au dessus de $Delta$.

  \* Si $f(x) - (a x + b) lt.eq 0$ ; alors $overline(zeta)$ est au dessous de $Delta$.

  #v(0.3cm)
  $triangle.r$ Montrer que deux courbes $underline(zeta)$ et $underline(zeta')$ sont tangentes au point d'abscisse $x_0$ :

  On determine les equations des tangentes aux deux courbes au point commun d'abscisse $x_0$ et on constate qu'il s'agit de la meme droite.

  #v(0.5cm)
  #underline[*Remarque*] : En utilise souvent les theoremes et les operations sur les limites et rarement les definitives des limites.
]

// ─────────────────────────────────────────────────────────────────────────────
// ENONCES (pages 74–79)
// ─────────────────────────────────────────────────────────────────────────────

#pagebreak()

// Source: Parascolaire Analyse p.74

#align(center)[
  #text(size: 18pt, weight: "bold")[ENONCES]
]

#v(0.5cm)

*Exercice 1* \
Calculer les limites suivantes :

$lim_(x arrow 0^+) -2 + frac(1, x) + frac(1, x^2)$ ; $lim_(x arrow +infinity) -2 + frac(1, x) + frac(1, x^2)$ ; $lim_(x arrow +infinity) frac(1, x^2 + 1)$ ;

$lim_(x arrow 0) frac(x - 1, x^2)$ ; $lim_(x arrow 0^+) frac(x + 1, sqrt(x))$ ; $lim_(x arrow +infinity) sqrt(x^2 - 1 + frac(1, x))$

#v(0.5cm)

*Exercice 2* \
Dresser a chaque fois le tableau de signe du denominateur, puis calculer les limites suivantes :

$lim_(x arrow 0^+) frac(x - 1, x)$ ; $lim_(x arrow 2) frac(x - 1, x - 2)$ ; $lim_(x arrow -1) frac(x - 1, (x + 1)^2)$ ; $lim_(x arrow 1) frac(x^2 + 1, (x - 2)(x - 1))$ ;

$lim_(x arrow 0) frac(1 - 3x, -2x^2 + 3x)$ ; $lim_(x arrow 2^+) frac(sqrt(x + 7), 2 - x)$

#v(0.5cm)

*Exercice 3* \
On donne $f : RR arrow RR$ ; $x mapsto sqrt(x + 1) - sqrt(x)$.

a) Determiner $D_f$.

b) Montrer que pour tout $x in D_f$ ; $f(x) = frac(1, sqrt(x + 1) + sqrt(x))$

c) Deduire la limite de $f(x)$ en $+infinity$.

Montrer que $forall x in D_f ; 0 lt.eq f(x) lt.eq 1$.

#v(0.5cm)

*Exercice 4* \
Calculer les limites suivantes :

$lim_(x arrow -infinity) x^2 - x - 1$ ; $lim_(x arrow +infinity) x^2 - x - 1$ ; $lim_(x arrow +infinity) frac(x - 2, x + 1)$ ; $lim_(x arrow +infinity) frac(x^2 - 2, x + 1)$ ;

$lim_(x arrow -infinity) frac(x - 1, x^2 + 1)$ ; $lim_(x arrow -infinity) frac(x^3 - 2x^2 - x + 1, 3(x + 1)^3)$ ; $lim_(x arrow +infinity) frac(-x + 2x^2, -x + 4)$.

#v(0.5cm)

*Exercice 5* \
Calculer les limites en $+infinity$ puis en $-infinity$, des fonctions suivantes :

a) $f(x) = sqrt(9x^2 - 8x + 6) - x$. #h(2cm) b) $g(x) = sqrt(x^2 - 8x + 6) - x$.

c) $h(x) = sqrt(x^2 + 3) + x$. #h(2cm) d) $k(x) = frac(sqrt(x^2 - 1) + x, x)$.

#v(0.5cm)

*Exercice 6* \
Calculer les limites suivantes :

// Source: Parascolaire Analyse p.75

$lim_(x arrow 3) frac(2 - sqrt(x + 1), 2x - 6)$ ; $lim_(x arrow 2) frac(sqrt(x - 1) - 1, x - 2)$ ; $lim_(x arrow 1) frac(x^2 - 1, sqrt(x) - 1)$ ; $lim_(x arrow +infinity) 2x - 4sqrt(x)$.

#v(0.5cm)

*Exercice 7* \
Soit la fonction g definie par : $g(x) = x + 1 + sqrt(x^2 + x + 2)$

1) Determiner le domaine de definition de g.

2) Calculer les limites suivantes :

$lim_(x arrow -infinity) g(x)$ ; $lim_(x arrow +infinity) g(x)$ ; $lim_(x arrow +infinity) frac(g(x), x)$ ; $lim_(x arrow +infinity) [g(x) - 2x]$.

#v(0.5cm)

*Exercice 8* \
Soit la fonction h definie par : $h(x) = frac(x^2, sqrt(x^2 + 1) - sqrt(1 - 2x^2))$.

1) Determiner le domaine de definition de h.

2) Peut-on parler de la limite de h en $+infinity$ ?

3) Calculer la limite de h en 0.

#v(0.5cm)

*Exercice 9* \
Soit la fonction $f_m$ definie par : $f_m (x) = sqrt(x^2 + 4 + m x)$, ou $m in RR$.

Determiner suivant m, $lim_(x arrow -infinity) f(x)$.

#v(0.5cm)

*Exercice 10* \
Soit pour tout x de $RR$ ; $f(x) = (2x + 1)^2$ et $g(x) = sqrt(4x^2 + 1) - sqrt(2)$.

1) Determiner : $lim_(x arrow -frac(1, 2)) frac(f(x), g(x))$ ; $lim_(x arrow frac(1, 2)) frac(f(x), g(x))$ ; $lim_(x arrow +infinity) frac(f(x), g(x))$.

2) Determiner : $lim_(x arrow -infinity) (f(x) - g(x))$ et $lim_(x arrow frac(1, 2)) (f(x) - g(x))$.

#v(0.5cm)

*Exercice 11* \
On considere deux fonctions f et g definies sur $RR$ par :

$f(x) = |x|(1 - x^2)$ et $g(x) = -x^2 + x$. On pose $h(x) = frac(f(x), g(x))$.

1) Determiner le domaine de definition de h.

2) Determiner la limite de $h(x)$ quand x tend vers 0 respectivement vers $-infinity$.

3) Determiner $lim_(x arrow -infinity) [h(x) + x]$.

#v(0.5cm)

*Exercice 12* \
Soit f la fonction definie par $f(x) = frac(x sqrt(1 - x), x^2 + 2)$.

1) Preciser le domaine de definition de f.

2) Determiner la limite de $f(x)$ lorsque x tend vers 0 respectivement $-infinity$.

3) Soit la fonction g definie par $g(h) = f(1 + h)$.

// Source: Parascolaire Analyse p.76

a) Preciser le domaine de definition de g.

b) Determiner la limite de $f(1 + h)$ lorsque h tend vers 0.

#v(0.5cm)

*Exercice 13* \
Soit la fonction $f_m : x mapsto frac((m^2 - 1) x^2 + 2m^2 x - 2m, x - 1)$

Discuter suivant m, $lim_(x arrow -infinity) f_m (x)$ et $lim_(x arrow 1) f_m (x)$

#v(0.5cm)

*Exercice 14* \
1) soit $f(x) = frac(sqrt(x^2 - 7) - sqrt(2x + 1), x - 4)$ si $x eq.not 4$ et $f(4) = m ; m in RR$.

a) Calculer $lim_(x arrow +infinity) f(x)$ et la limite de f en 4

b) Etudier la continuite de f en 4

2) $g(x) = cases(frac(a x + 4, x^2 - 1) "si" x < 1, frac(b x^2 + c x + 3, x - 1) "si" x > 1)$

a) Determiner a, b, c pour que g admette une limite finie en 1.

b) Discuter suivant a, b et c $lim_(x arrow -infinity) g(x)$ ; $lim_(x arrow +infinity) g(x)$

#v(0.5cm)

*Exercice 15* \
1) Determiner $lim_(x arrow 1) frac(x^2 - 8x + 7, sqrt(x) - 1)$.

2) soit f definie par $f(x) = frac(sqrt(x^2 + x + 1), x + 1 + sqrt(x^2 + x + 1))$

a) Montrer que la fonction $f(x)$ est definie et positive et continue pour tout $x in RR$.

b) Etudier la limite de $f(x)$ quand x tend vers $+infinity$ respectivement vers $-infinity$.

2) On considere la fonction definie par $g(x) = x sqrt(frac(x, x - 2))$

a) Montrer que $lim_(|x| arrow +infinity) frac(g(x), x) = 1$

b) rechercher $lim_(|x| arrow +infinity) (g(x) - x)$

#v(0.5cm)

*Exercice 16* \
Soient a et b deux reels et f l'application de $RR$ vers $RR$ definies par :

$f(x) = a x + b - sqrt(x^2 + 1)$.

Determiner a et b pour que : $lim_(x arrow -infinity) frac(f(x), x) = 2$ et $lim_(x arrow -infinity) [f(x) - 2x] = 2$.

// Source: Parascolaire Analyse p.77

#v(0.5cm)

*Exercice 17* \
Etudier les limites suivantes :

$lim_(x arrow -infinity) x sqrt(frac(x + 1, x^3 - 1))$ ; $lim_(x arrow +infinity) sqrt(x) + sqrt(x) - sqrt(x)$ ; $lim_(x arrow +infinity) [frac(x - sqrt(x^2 + x + 1), 2x + sqrt(4x^2 + x))]$

$lim_(x arrow +infinity) frac(sqrt(x) - 2x, sqrt(x) - 1)$ ; $lim_(x arrow 1^+) frac(sqrt(x^2 - 1) + sqrt(x) - 1, sqrt(x) - 1)$

#v(0.5cm)

*Exercice 18* \
Soit $f(x) = frac(alpha x^2 + beta, |x^2 - delta|)$.

Calculer les nombres reels $alpha$, $beta$ et $delta$, sachant que :

$lim_(x arrow 0) f(x) = 2$ ; $lim_(x arrow 2) f(x) = -infinity$ et $lim_(x arrow -infinity) f(x) = 1$

#v(0.5cm)

*Exercice 19* \
Soit $f(x) = cases(frac(x^2 - 8x + 7, sqrt(x) - 1) "si" x > 1, x^2 - 13x "si" 0 lt.eq x lt.eq 1, x sqrt(frac(x - 1, x)) "si" x < 0)$

1) Determiner la limite de f quand x tend vers 1.

2) Calculer $lim_(x arrow 0) f(x)$ ; $lim_(x arrow +infinity) f(x)$ ; $lim_(x arrow -infinity) f(x)$.

#v(0.5cm)

*Exercice 20* \
Soit f definie sur $RR$, par : $cases(f(x) = sqrt(x^2 - 1) + 4 - x "si" x gt.eq 1, f(x) = frac((m + 1) x^3 - 3x + m^2, x - 1) "si" 0 lt.eq x < 1, f(x) = x^2 sqrt(-x) + 2x - 1 "si" x < 0)$

avec m un parametre reel donne.

1) Calculer $lim_(x arrow +infinity) f(x)$ et $lim_(x arrow -infinity) f(x)$.

2) b) Etudier suivant les valeurs de m, la limite a gauche de f en 1.

#h(0.5cm) c) pour quelle valeur de m, on a : $lim_(x arrow 1^+) f(x) = lim_(x arrow 1^-) f(x)$

#v(0.5cm)

*Exercice 21* \
Vrai - Faux

Repondre par vrai ou faux a chacune des affirmations suivantes avec justification.

1) une fonction rationnelle a toujours deux asymptotes

\* Pour questions 2) ; 3) et 4) on donne le tableau de variations d'une fonction f :

// Source: Parascolaire Analyse p.78

#table(
  columns: (1fr, 2fr, 1fr, 2fr),
  align: center,
  [x], [$-infinity$], [0], [$+infinity$],
  [f(x)], [2 #h(1cm) $arrow.br$ #h(1cm) -3], [], [-3 #h(1cm) $arrow.tr$ #h(1cm) 5],
)

2) l'equation $f(x) = 0$ admet deux solutions

3) f admet une asymptote oblique

4) f admet deux asymptotes horizontales

5) $Delta : y = 2x + 3$ est une asymptote oblique de la fonction $f(x) = 2x + 3 - frac(x, x + 1)$ au voisinage de $+infinity$.

#v(0.5cm)

*Exercice 22* \
Soit f definie par $f(x) = frac(2x - 1, |x - 3|)$ et $(cal(C))$ sa courbe representative

dans un repere orthonorme $(o, arrow(i), arrow(j))$

1) Determiner $D_f$ son domaine de definition

2) a) determiner les limites de f aux bornes de $D_f$

#h(0.5cm) b) En deduire les asymptotes de $(cal(C))$

#v(0.5cm)

*Exercice 23* \
Soit f la fonction definie par $f(x) = frac((x - 2)^2, x - 1)$ et $(cal(C))$ sa courbe representative dans un repere orthonorme $(o, arrow(i), arrow(j))$

1) Determiner $D_f$ le domaine de definition de f.

2) a) Determiner les limites de f aux bornes de $D_f$

#h(0.5cm) b) En deduire l'equation de l'asymptote verticale a $(cal(C))$

3) a) Determiner trois reels a, b et c tels que pour tout $x eq.not 1$

$f(x) = a x + b + frac(c, x - 1)$

#h(0.5cm) b) En deduire que la droite $Delta : y = x - 3$ est une asymptote a $(cal(C))$

#v(0.5cm)

*Exercice 24* \
Soit f definie par $f(x) = frac(x^2 + 2x - 1, x^2 + 2x + 4)$ et $(cal(C))$ designe sa courbe.

1) Determiner $D_f$ le domaine de definition de f.

2) Determiner les limites de f aux bornes de $D_f$

3) En deduire que $(cal(C))$ admet une asymptote dont on determinera l'equation.

#v(0.5cm)

*Exercice 25* \
Soit f la fonction definie par : $f(x) = sqrt(x^2 - 3x + 1)$

1) Determiner $D_f$ son domaine de definition.

// Source: Parascolaire Analyse p.79

2) Montrer que pour tout $x in D_f$, $f(x) = sqrt((x - frac(3, 2))^2 - frac(5, 4))$

3) a) Montrer que $Delta : y = x - frac(3, 2)$ est une asymptote a $cal(C)_f$ en $+infinity$.

#h(0.5cm) b) Etudier la position de $(cal(C)_f)$ par rapport a $Delta$

#v(0.5cm)

*Exercice 26* \
La fonction $f : x mapsto x + sqrt(x^2 - 1)$

1) Verifier que f est definie sur $D = ]-infinity, -1] union [1, +infinity[$

2) Montrer que pour tout $x in D$ : $f(x) dot f(-x) = -1$ #h(1cm) (1)

3) a) Etudier la limite de f en $+infinity$.

#h(0.5cm) b) En deduire de (1) celle en $-infinity$. Interpreter geometriquement.

4) Montrer que la droite $Delta$ d'equation $y = 2x$ est une asymptote a $cal(C)_f$ en $+infinity$.

#v(0.5cm)

*Exercice 27* \
On considere une fonction f definie sur $]0, +infinity[$ dont la courbe representative $(cal(C))$ est donnee ci dessous dans un repere orthogonal et la droite d'equation $y = x$

A) Exploitation du graphique :

1) On admet que l'axe des ordonnees et D sont asymptotes a la courbe $(cal(C))$

donner alors $lim_(x arrow 0) f$ et $lim_(x arrow +infinity) f$

2) Le point $K(frac(1, 3), frac(1, 3))$ et le point commun de $cal(C)$ et D.

D'apres le graphique, quelle est en fonction de x la position de $(cal(C))$ par rapport a D ?

3) D'apres le graphique, quel est le sens de variations de f.

B) justification des observations graphiques :

La fonction f est definie par $f(x) = x + frac(3, x) - frac(1, x^2)$ sur $RR_+^*$

1) a) Calculer $lim_(x arrow +infinity) f$, puis justifier que la droite $D : y = x$ est asymptote a $(cal(C))$

#h(0.5cm) b) En etudiant le signe de $f(x) - x$. retrouver les resultats de la question A)2)

#h(0.5cm) c) Determiner les coordonnees du point K d'intersection de $(cal(C))$ et D

2) a) Ecrire f sous forme d'un quotient.

#h(0.5cm) b) Calculer $lim_(x arrow 0) f$ et en deduire l'existence de la seconde asymptote.

// --- Figure exercice 27 (p.79) ---

#figure(
  cetz.canvas({
    import cetz.draw: *

    // Axes
    line((-2.5, 0), (6, 0), stroke: 0.5pt, mark: (end: ">"))
    line((0, -1.5), (0, 5.5), stroke: 0.5pt, mark: (end: ">"))
    content((6, -0.3), $x$)
    content((-0.3, 5.5), $y$)
    content((-0.3, -0.3), $O$)

    // Graduations
    for i in range(1, 6) {
      line((i, -0.1), (i, 0.1), stroke: 0.5pt)
      content((i, -0.3), str(i))
    }
    for i in range(-2, 0) {
      line((i, -0.1), (i, 0.1), stroke: 0.5pt)
      content((i, -0.3), str(i))
    }
    for i in range(1, 6) {
      line((-0.1, i), (0.1, i), stroke: 0.5pt)
      content((-0.4, i), str(i))
    }
    line((-0.1, -1), (0.1, -1), stroke: 0.5pt)
    content((-0.4, -1), $-1$)

    // Droite D: y = x
    line((-1.5, -1.5), (5.5, 5.5), stroke: (dash: "dashed") + 0.5pt)

    // Courbe C (allure: asymptote y-axis, passe par K(1/3,1/3), tend vers D en +inf)
    bezier(
      (0.15, -1.2),
      (0.25, 0.0),
      (0.18, -0.5),
      stroke: 1pt
    )
    bezier(
      (0.25, 0.0),
      (0.5, 0.8),
      (0.33, 0.33),
      stroke: 1pt
    )
    bezier(
      (0.5, 0.8),
      (2, 2.8),
      (1, 1.5),
      stroke: 1pt
    )
    bezier(
      (2, 2.8),
      (5, 5.3),
      (3.5, 4),
      stroke: 1pt
    )

    // Point K
    circle((0.333, 0.333), radius: 0.06, fill: black)
    content((0.6, 0.1), $K$)
  }),
  caption: [Courbe de f et droite D : y = x]
)

// ─────────────────────────────────────────────────────────────────────────────
// CORRIGES (pages 80–104)
// ─────────────────────────────────────────────────────────────────────────────

#pagebreak()

// Source: Parascolaire Analyse p.80

#align(center)[
  #text(size: 18pt, weight: "bold")[CORRIGES]
]

#v(0.5cm)

*Exercice 1* \

- $lim_(x arrow 0^+) frac(1, x) = +infinity$ et $lim_(x arrow 0^+) frac(1, x^2) = +infinity$ d'ou $lim_(x arrow 0^+) -2 + frac(1, x) + frac(1, x^2) = +infinity$

- $lim_(x arrow +infinity) frac(1, x) = 0$ et $lim_(x arrow +infinity) frac(1, x^2) = 0$ d'ou $lim_(x arrow +infinity) -2 + frac(1, x) + frac(1, x^2) = -2$.

- $lim_(x arrow +infinity) x^2 + 1 = +infinity$ d'ou $lim_(x arrow +infinity) frac(1, x^2 + 1) = 0$.

- $lim_(x arrow 0) x - 1 = -1$ et $lim_(x arrow 0) x^2 = 0^+$ d'ou $lim_(x arrow 0) frac(x - 1, x^2) = -infinity$

- $lim_(x arrow 0^+) x + 1 = 1$ et $lim_(x arrow 0^+) sqrt(x) = 0^+$ d'ou $lim_(x arrow 0^+) frac(x + 1, sqrt(x)) = +infinity$

- $lim_(x arrow +infinity) frac(1, x) = 0$ et $lim_(x arrow +infinity) x^2 - 1 = +infinity$ d'ou $lim_(x arrow +infinity) x^2 - 1 + frac(1, x) = +infinity$

Par suite $lim_(x arrow +infinity) sqrt(x^2 - 1 + frac(1, x)) = +infinity$.

#v(0.5cm)

*Exercice 2* \

- $lim_(x arrow 0) x - 1 = -1$ et $lim_(x arrow 0^+) x = 0^+$ d'ou $lim_(x arrow 0^+) frac(x - 1, x) = -infinity$

#table(
  columns: (1fr, 2fr, 1fr, 2fr),
  align: center,
  [x], [$-infinity$], [2], [$+infinity$],
  [x - 2], [], [$-$], [$0$], [$+$],
)

Donc il est necessaire d'etudier la limite a droite et a gauche en 2.

On a : $lim_(x arrow 2^-) x - 2 = 0^-$ et $lim_(x arrow 2^-) x - 1 = 1$ d'ou $lim_(x arrow 2^-) frac(x - 1, x - 2) = -infinity$

et $lim_(x arrow 2^+) x - 2 = 0^+$ et $lim_(x arrow 2^+) x - 1 = 1$ d'ou $lim_(x arrow 2^+) frac(x - 1, x - 2) = +infinity$

Conclusion : $lim_(x arrow 2^-) frac(x - 1, x - 2) eq.not lim_(x arrow 2^+) frac(x - 1, x - 2)$ donc la limite en 2 n'existe pas.

- $lim_(x arrow -1) x - 1 = -2$ et $lim_(x arrow -1) (x + 1)^2 = 0^+$ d'ou $lim_(x arrow -1) frac(x - 1, (x + 1)^2) = -infinity$

// Source: Parascolaire Analyse p.81

#table(
  columns: (1fr, 1fr, 1fr, 1fr, 1fr),
  align: center,
  [x], [$-infinity$], [1], [2], [$+infinity$],
  [$(x - 2)(x - 1)$], [$+$], [$0$], [$-$], [$0$], [$+$],
)

On a :

- $lim_(x arrow 1^-) (x - 2)(x - 1) = 0^+$ et $lim_(x arrow 1^-) x^2 + 1 = 2$ d'ou $lim_(x arrow 1^-) frac(x^2 + 1, (x - 2)(x - 1)) = +infinity$

- $lim_(x arrow 1^+) (x - 2)(x - 1) = 0^-$ et $lim_(x arrow 1^+) x^2 + 1 = 2$ d'ou $lim_(x arrow 1^+) frac(x^2 + 1, (x - 2)(x - 1)) = -infinity$

- $lim_(x arrow 1^-) frac(x^2 + 1, (x - 2)(x - 1)) eq.not lim_(x arrow 1^+) frac(x^2 + 1, (x - 2)(x - 1))$. Donc la limite en 1 n'existe pas.

#table(
  columns: (1fr, 2fr, 1fr, 1fr, 1fr),
  align: center,
  [x], [$-infinity$], [0], [$frac(3, 2)$], [$+infinity$],
  [$-2x^2 + 3x$], [$-$], [$0$], [$+$], [$0$], [$-$],
)

On a :

- $lim_(x arrow 0^+) -2x^2 + 3x = 0^+$ et $lim_(x arrow 0^+) 1 - 3x = 1$ d'ou $lim_(x arrow 0^+) frac(1 - 3x, -2x^2 + 3x) = +infinity$

- $lim_(x arrow 0^-) -2x^2 + 3x = 0^-$ et $lim_(x arrow 0^-) 1 - 3x = 1$ d'ou $lim_(x arrow 0^-) frac(1 - 3x, -2x^2 + 3x) = -infinity$

- $lim_(x arrow 0^+) frac(1 - 3x, -2x^2 + 3x) eq.not lim_(x arrow 0^-) frac(1 - 3x, -2x^2 + 3x)$. Donc la limite en 0 n'existe pas.

#table(
  columns: (1fr, 2fr, 1fr, 1fr),
  align: center,
  [x], [$-infinity$], [2], [$+infinity$],
  [$2 - x$], [$+$], [$0$], [$-$],
)

- $lim_(x arrow 2^-) 2 - x = 0^+$ et $lim_(x arrow 2^-) sqrt(x + 7) = 3$ d'ou $lim_(x arrow 2^-) frac(sqrt(x + 7), 2 - x) = +infinity$

- $lim_(x arrow 2^+) 2 - x = 0^-$ et $lim_(x arrow 2^+) sqrt(x + 7) = 3$ d'ou $lim_(x arrow 2^+) frac(sqrt(x + 7), 2 - x) = -infinity$

- $lim_(x arrow 2^-) frac(sqrt(x + 7), 2 - x) eq.not lim_(x arrow 2^+) frac(sqrt(x + 7), 2 - x)$. Donc la limite en 2 n'existe pas.

// Source: Parascolaire Analyse p.81 (suite)

#v(0.5cm)

*Exercice 3* \

a) $D_f = {x in RR "tel que" x + 1 gt.eq 0 "et" x gt.eq 0} = RR_+$

// Source: Parascolaire Analyse p.82

b) $f(x) = sqrt(x + 1) - sqrt(x) = frac((sqrt(x + 1) - sqrt(x))(sqrt(x + 1) + sqrt(x)), sqrt(x + 1) + sqrt(x))$

$= frac(x + 1 - x, sqrt(x + 1) + sqrt(x)) = frac(1, sqrt(x + 1) + sqrt(x))$ pour tout $x in RR_+$

pour tout $x in RR_+$

c) $lim_(x arrow +infinity) sqrt(x + 1) = lim_(x arrow +infinity) sqrt(x) = +infinity$ ; par suite $lim_(x arrow +infinity) sqrt(x + 1) + sqrt(x)$

$= +infinity$. Donc $lim_(x arrow +infinity) f(x) = 0$

On a : pour tout $x in D_f$ ; $x gt.eq 0$ donc $sqrt(x + 1) gt.eq 1$.

Donc $sqrt(x + 1) + sqrt(x) gt.eq 1$ et par suite $0 lt.eq frac(1, sqrt(x + 1) + sqrt(x)) lt.eq 1$.

Finalement : $0 lt.eq f(x) lt.eq 1$.

#v(0.5cm)

*Exercice 4* \

En $-infinity$ ou $+infinity$, la limite d'une fonction polynome est egale a la limite de son terme de plus haut degre donc :

$lim_(x arrow -infinity) (x^2 - x - 1) = lim_(x arrow -infinity) x^2 = +infinity$ ; $lim_(x arrow +infinity) (x^2 - x - 1) = lim_(x arrow +infinity) x^2 = +infinity$.

- En $-infinity$ ou $+infinity$, la limite d'une fonction rationnelle est egale a la limite de son terme de plus haut degre du numerateur divise par le terme de plus haut degre du denominateur.

\* $lim_(x arrow +infinity) frac(x - 2, x + 1) = lim_(x arrow +infinity) frac(x, x) = 1$.

\* $lim_(x arrow +infinity) frac(x^2 - 2, x + 1) = lim_(x arrow +infinity) frac(x^2, x) = lim_(x arrow +infinity) x = +infinity$.

\* $lim_(x arrow -infinity) frac(x - 1, x^2 + 1) = lim_(x arrow -infinity) frac(x, x^2) = lim_(x arrow -infinity) frac(1, x) = 0$.

\* $lim_(x arrow -infinity) frac(x^3 - 2x^2 - x + 1, 3(x + 1)^3) = lim_(x arrow -infinity) frac(x^3, 3x^3) = frac(1, 3)$.

\* $lim_(x arrow +infinity) frac(-x + 2x^2, -x + 4) = lim_(x arrow +infinity) frac(2x^2, -x) = lim_(x arrow +infinity) (-2x) = -infinity$.

#v(0.5cm)

*Exercice 5* \

a) $lim_(-infinity) 9x^2 - 8x + 6 = lim_(-infinity) 9x^2 = +infinity$ et $lim_(x arrow +infinity) sqrt(x) = +infinity$

donc d'apres le theoreme on a :

$lim_(-infinity) sqrt(9x^2 - 8x + 6) = +infinity$, comme $lim_(-infinity) -x = +infinity$ d'ou $lim_(-infinity) f(x) = +infinity$

Il n'y a pas d'indetermination dans ce cas il ne faut pas transformer l'expression.

// Source: Parascolaire Analyse p.83

Par contre en $+infinity$ il y a une indetermination du type $+infinity - infinity$ ;

factorisons $f(x) = sqrt(x^2 (9 - frac(8, x) + frac(6, x^2))) - x = |x| (sqrt(9 - frac(8, x) + frac(6, x^2))) - x$

lorsque x tend vers $+infinity$ ; x est positif donc $|x| = x$

D'ou $f(x) = x (sqrt(9 - frac(8, x) + frac(6, x^2)) - 1)$

On a $lim_(+infinity) (sqrt(9 - frac(8, x) + frac(6, x^2)) - 1) = 2$ donc $lim_(+infinity) f(x) = +infinity$.

b) comme l'exemple a) la limite de g(x) en $-infinity$ ne pose pas de probleme on a :

$lim_(x arrow -infinity) g(x) = +infinity$ car $lim_(x arrow -infinity) sqrt(x^2 - 8x + 6) = +infinity$ et $lim_(x arrow -infinity) -x = +infinity$

Pour la limite en $+infinity$, essayons de proceder comme dans l'exemple precedent.

En factorisant on obtient : $g(x) = x (sqrt(1 - frac(8, x) + frac(6, x^2)) - 1)$ le terme entre parenthese a pour limite 0 on a donc la forme indeterminee du type $infinity times 0$.

Cette methode ne permet pas de conclure dans ce cas essayons alors la

$2^("eme")$ Methode : multiplions et divisons g(x) par $sqrt(x^2 - 8x + 6) + x$. On a :

$g(x) = frac((sqrt(x^2 - 8x + 6) - x)(sqrt(x^2 - 8x + 6) + x), (sqrt(x^2 - 8x + 6) + x))$

$= frac(x^2 - 8x + 6 - x^2, sqrt(x^2 - 8x + 6) + x) = frac(-8x + 6, sqrt(x^2 - 8x + 6) + x)$.

l'indetermination n'est pas toujours levee : numerateur et denominateur tendent vers l'infini dans un tel cas on essais a nouveau la factorisation.

On a : $g(x) = frac(x(-8 + frac(6, x)), x(sqrt(1 - frac(8, x) + frac(6, x^2)) + 1)) = frac(-8 + frac(6, x), 1 + sqrt(1 - frac(8, x) + frac(6, x^2)))$

Le numerateur tend vers $-8$ ; le denominateur vers 2 d'ou $lim_(+infinity) g(x) = -4$.

// Source: Parascolaire Analyse p.84

c) $lim_(+infinity) x^2 + 3 = +infinity$ donc $lim_(+infinity) sqrt(x^2 + 3) = +infinity$ et $lim_(+infinity) x = +infinity$ d'ou $lim_(+infinity) h(x) = +infinity$.

Par contre en $-infinity$ il y a une indetermination de la forme $+infinity - infinity$

on a $h(x) = frac((sqrt(x^2 + 3) + x)(sqrt(x^2 + 3) - x), sqrt(x^2 + 3) - x) = frac(x^2 + 3 - x^2, sqrt(x^2 + 3) - x) = frac(3, sqrt(x^2 + 3) - x)$

or $lim_(-infinity) sqrt(x^2 + 3) = +infinity$ et $lim_(-infinity) -x = +infinity$ d'ou $lim_(-infinity) h(x) = 0$.

d) En $+infinity$, k(x) se presente sous forme indeterminee $frac(infinity, infinity)$.

$k(x) = frac(sqrt(x^2(1 - frac(1, x^2))) + x, x) = frac(|x| sqrt(1 - frac(1, x^2)) + x, x)$ or $x > 0$, soit $|x| = x$

donc $k(x) = frac(x(sqrt(1 - frac(1, x^2)) + 1), x)$ d'ou $lim_(+infinity) k(x) = lim_(+infinity) sqrt(1 - frac(1, x^2)) + 1 = 2$.

\* en $-infinity$, le numerateur se presente sous la forme indeterminee $+infinity - infinity$

$k(x) = frac(|x| sqrt(1 - frac(1, x^2)) + x, x)$ ($|x| = -x$ car $x < 0$)

d'ou $k(x) = frac(-x sqrt(1 - frac(1, x^2)) + x, x) = -sqrt(1 - frac(1, x^2)) + 1$ d'ou $lim_(x arrow -infinity) k(x) = 0$

#v(0.5cm)

*Exercice 6* \

a) $f(x) = frac(2 - sqrt(x + 1), 2x - 6)$, au voisinage de 3, $f(x)$ se presente sous la forme indeterminee $frac(0, 0)$.

On peut ecrire $f(x) = frac((2 - sqrt(x + 1))(2 + sqrt(x + 1)), 2(x - 3)(2 + sqrt(x + 1)))$

$f(x) = frac(-(x - 3), 2(x - 3)(2 + sqrt(x + 1))) = frac(-1, 2(2 + sqrt(x + 1)))$

Lorsque x tend vers 3, cette expression a pour limite $frac(-1, 8)$.

b) $g(x) = frac(sqrt(x - 1) - 1, x - 2)$ au voisinage de 2, g(x) se presente sous la forme

// Source: Parascolaire Analyse p.85

indeterminee $frac(0, 0)$. On peut ecrire :

$g(x) = frac((sqrt(x - 1) - 1)(sqrt(x - 1) + 1), (x - 2)(sqrt(x - 1) + 1)) = frac(x - 2, (x - 2)(sqrt(x - 1) + 1)) = frac(1, sqrt(x - 1) + 1)$

d'ou $lim_(x arrow 2) g(x) = lim_(x arrow 2) frac(1, sqrt(x - 1) + 1) = frac(1, 2)$.

c) Soit $f(x) = frac(x^2 - 1, sqrt(x) - 1)$ ;

$D_f = {x in RR ";" "tel que" x gt.eq 0 "et" sqrt(x) - 1 eq.not 0}$.

$= [0, 1[ union ]1, +infinity[$.

$lim_(x arrow 1) x^2 - 1 = 0$ et $lim_(x arrow 1) sqrt(x) - 1 = 0$

Donc $lim_(x arrow 1) f(x)$ est une forme indeterminee $frac(0, 0)$.

Pour tout $x in D_f$ ;

$f(x) = frac((x^2 - 1)(sqrt(x) + 1), x - 1) = frac((x - 1)(x + 1)(sqrt(x) + 1), x - 1) = (x + 1)(sqrt(x) + 1)$

Par suite $lim_(x arrow 1) f(x) = lim_(x arrow 1) (x + 1)(sqrt(x) + 1) = 4$

d) - $lim_(x arrow +infinity) 2x = +infinity$ et $lim_(x arrow +infinity) -4 sqrt(x) = -infinity$.

Donc $lim_(x arrow +infinity) 2x - 4 sqrt(x)$ est une forme indeterminee $+infinity - infinity$.

$lim_(x arrow +infinity) 2x - 4 sqrt(x) = lim_(x arrow +infinity) x(2 - frac(4 sqrt(x), x)) = lim_(x arrow +infinity) x(2 - 4 dot frac(1, sqrt(x))) = +infinity$

car $lim_(x arrow +infinity) frac(1, sqrt(x)) = 0$.

#v(0.5cm)

*Exercice 7* \

1) $D_g = {x in RR "tel que" x^2 + x + 2 gt.eq 0}$.

Or pour tout $x in RR ; x^2 + x + 2 > 0$ donc $D_g = RR$.

2) - $lim_(x arrow -infinity) x + 1 = -infinity$ et $lim_(x arrow -infinity) sqrt(x^2 + x + 2) = +infinity$ donc

$lim_(x arrow -infinity) g(x)$ est une forme indeterminee $+infinity - infinity$.

$g(x) = x + 1 + sqrt(x^2 + x + 2) = frac((x + 1)^2 - (x^2 + x + 2), x + 1 - sqrt(x^2 + x + 2)) = frac(x - 1, x + 1 - sqrt(x^2 + x + 2))$

// Source: Parascolaire Analyse p.86

$lim_(x arrow -infinity) g(x) = lim_(x arrow -infinity) frac(x(1 - frac(1, x)), x(1 + frac(1, x)) - |x| sqrt(1 + frac(1, x) + frac(2, x^2)))$. Or $x arrow -infinity$ donc $|x| = -x$

Donc $lim_(x arrow -infinity) g(x) = lim_(x arrow -infinity) frac(1 - frac(1, x), 1 + frac(1, x) + sqrt(1 + frac(1, x) + frac(2, x^2))) = frac(1, 2)$.

Car $lim_(x arrow -infinity) 1 - frac(1, x) = 1$ et $lim_(x arrow -infinity) 1 + frac(1, x) + sqrt(1 + frac(1, x) + frac(2, x^2)) = 2$.

- $lim_(x arrow +infinity) g(x) = lim_(x arrow +infinity) (x + 1 + sqrt(x^2 + x + 2)) = +infinity$ car $lim_(x arrow +infinity) x + 1 = +infinity$ et $lim_(x arrow +infinity) sqrt(x^2 + x + 2) = +infinity$.

- $lim_(x arrow +infinity) frac(g(x), x) = lim_(x arrow +infinity) frac(x + 1 + sqrt(x^2 + x + 2), x) = lim_(x arrow +infinity) (1 + frac(1, x) + frac(|x| sqrt(1 + frac(1, x) + frac(2, x^2)), x))$

$lim_(x arrow +infinity) frac(g(x), x) = lim_(x arrow +infinity) (1 + frac(1, x) + sqrt(1 + frac(1, x) + frac(2, x^2))) = 2$. car $lim_(x arrow +infinity) frac(1, x) = lim_(x arrow +infinity) frac(1, x^2) = 0$

- $lim_(x arrow +infinity) [g(x) - 2x] = lim_(x arrow +infinity) [-x + 1 + sqrt(x^2 + x + 2)] = lim_(x arrow +infinity) frac((1 - x)^2 - x^2 - x - 2, 1 - x - sqrt(x^2 + x + 2))$

$= lim_(x arrow +infinity) frac(-1 - 3x, 1 - x - sqrt(x^2 + x + 2)) = lim_(x arrow +infinity) frac(x(-frac(1, x) - 3), x(frac(1, x) - 1 - sqrt(1 + frac(1, x) + frac(2, x^2))))$ or $|x| = x$ car $x arrow +infinity$

Donc $lim_(x arrow +infinity) [g(x) - 2x] = lim_(x arrow +infinity) frac(-frac(1, x) - 3, frac(1, x) - 1 - sqrt(1 + frac(1, x) + frac(2, x^2))) = frac(3, 2)$

#v(0.5cm)

*Exercice 8* \

// Source: Parascolaire Analyse p.86 (suite)

1) $D_h = {x in RR "tels que" x^2 + 1 gt.eq 0 "et" 1 - 2x^2 gt.eq 0 "et" sqrt(x^2 + 1) - sqrt(1 - 2x^2) eq.not 0}$

\* pour tout $x in RR$ on a : $x^2 + 1 > 0$.

\* $1 - 2x^2 gt.eq 0 arrow.l.r.double -frac(sqrt(2), 2) lt.eq x lt.eq frac(sqrt(2), 2)$.

\* $sqrt(x^2 + 1) = sqrt(1 - 2x^2)$ equivaut a $1 + x^2 = 1 - 2x^2$ ou encore $3x^2 = 0$

d'ou $x = 0$. Donc $D_h = [-frac(sqrt(2), 2), frac(sqrt(2), 2)] - {0}$.

2) On ne peut pas parler de limite de h en $+infinity$ puisque h n'est pas definie en $+infinity$.

// Source: Parascolaire Analyse p.87

3) $lim_(x arrow 0) x^2 = 0$ et $lim_(x arrow 0) sqrt(x^2 + 1) - sqrt(1 - 2x^2) = 0$

donc $lim_(x arrow 0) h(x)$ est une forme indeterminee $frac(0, 0)$.

$lim_(x arrow 0) h(x) = lim_(x arrow 0) frac(x^2, sqrt(x^2 + 1) - sqrt(1 - 2x^2)) = lim_(x arrow 0) frac(x^2 (sqrt(x^2 + 1) + sqrt(1 - 2x^2)), x^2 + 1 - 1 + 2x^2)$

$= lim_(x arrow 0) frac(sqrt(x^2 + 1) + sqrt(1 - 2x^2), 3) = frac(2, 3)$ car $lim_(x arrow 0) sqrt(x^2 + 1) + sqrt(1 - 2x^2) = 2$.

#v(0.5cm)

*Exercice 9* \

$lim_(x arrow -infinity) f_m (x) = lim_(x arrow -infinity) (sqrt(x^2 + 4 + m x)) = lim_(x arrow -infinity) (|x| sqrt(1 + frac(4, x^2) + m x)$ or $|x| = -x$

$= lim_(x arrow -infinity) x(-sqrt(1 + frac(4, x^2)) + m)$ or $lim_(x arrow -infinity) -sqrt(1 + frac(4, x^2)) + m = m - 1$ et $lim_(x arrow -infinity) x = -infinity$.

$1^("er")$ cas : $m - 1 > 0$ ou encore $m > 1$

$lim_(x arrow -infinity) f_m (x) = (m - 1) times (-infinity) = -infinity$

$2^("eme")$ cas : $m - 1 < 0$ ou encore $m < 1$.

$lim_(x arrow -infinity) f_m (x) = (m - 1) times (-infinity) = +infinity$.

$3^("eme")$ cas : $m - 1 = 0$ equivaut a $m = 1$.

$lim_(x arrow -infinity) f_m (x)$ est une forme indeterminee $0 times infinity$.

$lim_(x arrow -infinity) f_1 (x) = lim_(x arrow -infinity) (sqrt(x^2 + 4) + x) = lim_(x arrow -infinity) frac((sqrt(x^2 + 4) + x)(sqrt(x^2 + 4) - x), sqrt(x^2 + 4) - x)$

$= lim_(x arrow -infinity) frac(4, sqrt(x^2 + 4) - x) = 0$ car ($lim_(x arrow -infinity) sqrt(x^2 + 4) = +infinity$ et $lim_(x arrow -infinity) (-x) = +infinity$)

alors $lim_(x arrow -infinity) (sqrt(x^2 + 4) - x) = +infinity$.)

// Source: Parascolaire Analyse p.88

#v(0.5cm)

*Exercice 10* \

1) \* $lim_(x arrow (-frac(1, 2))) frac(f(x), g(x)) = lim_(x arrow (-frac(1, 2))) frac((2x + 1)^2, sqrt(4x^2 + 1) - sqrt(2))$ est une forme indeterminee

de type $frac(0, 0)$ on utilise la methode de la multiplication par la quantite conjuguee :

$frac(f(x), g(x)) = frac((2x + 1)^2 (sqrt(4x^2 + 1) + sqrt(2)), (sqrt(4x^2 + 1) - sqrt(2))(sqrt(4x^2 + 1) + sqrt(2))) = frac((2x + 1)^2 (sqrt(4x^2 + 1) + sqrt(2)), 4x^2 - 1)$

par suite $lim_(x arrow (-frac(1, 2))) frac(f(x), g(x)) = lim_(x arrow (-frac(1, 2))) frac((2x + 1)^2 (sqrt(4x^2 + 1) + sqrt(2)), 4x^2 - 1) = lim_(x arrow (-frac(1, 2))) frac((2x + 1)(sqrt(4x^2 + 1) + sqrt(2)), (2x - 1)) = frac(0, -2) = 0$

- Lorsque $x arrow frac(1, 2)$ et en utilisant le calcul deja fait. Il y a lieu de

distinguer la limite $(frac(1, 2))^+$ de la limite $(frac(1, 2))^-$.

$lim_(x arrow (frac(1, 2))^+) frac(1, 2x - 1) = +infinity$ et $lim_(x arrow (frac(1, 2))^-) frac(1, 2x - 1) = -infinity$

comme d'autre part: $lim_(x arrow frac(1, 2)) (2x + 1)(sqrt(4x^2 + 1) + sqrt(2)) = 4 sqrt(2)$

on obtient : $lim_(x arrow frac(1, 2)^+) frac(f(x), g(x)) = +infinity$ et $lim_(x arrow frac(1, 2)^-) frac(f(x), g(x)) = -infinity$

Conclusion:

$lim_(x arrow frac(1, 2)^+) frac(f(x), g(x)) eq.not lim_(x arrow frac(1, 2)^-) frac(f(x), g(x))$ donc $frac(f(x), g(x))$ n'admet pas de limite en $frac(1, 2)$

\* $lim_(x arrow +infinity) frac(f(x), g(x))$ est de la forme indeterminee de type $frac(infinity, infinity)$.

on a : $frac(f(x), g(x)) = frac((2x)^2 (1 + frac(1, 2x))^2, |2x| sqrt(1 + frac(1, 4x^2)) - frac(sqrt(2), 2x))$ or si $x arrow +infinity ; |x| = x$. d'ou

// Source: Parascolaire Analyse p.89

$lim_(x arrow +infinity) frac(f(x), g(x)) = lim_(x arrow +infinity) frac((2x)^2 (1 + frac(1, 2x))^2, 2x(sqrt(1 + frac(1, 4x^2)) - frac(sqrt(2), 2x))) = lim_(x arrow +infinity) frac(2x(1 + frac(1, 2x))^2, (sqrt(1 + frac(1, 4x^2))) - frac(sqrt(2), 2x)) = +infinity$

car $lim_(x arrow +infinity) 2x(1 + frac(1, 2x))^2 = +infinity$ et $lim_(x arrow +infinity) sqrt(1 + frac(1, 4x^2)) - frac(sqrt(2), 2x) = 1$

2) \* $lim_(x arrow -infinity) [f(x) - g(x)] = lim_(x arrow -infinity) (2x + 1)^2 - sqrt(4x^2 + 1) + sqrt(2)$

$= lim_(x arrow -infinity) 4x^2 (1 + frac(1, x) + frac(1, 4x^2) - frac(2|x| sqrt(1 + frac(1, 4x^2)), 4x^2) + frac(sqrt(2), 4x^2)) = lim_(x arrow -infinity) 4x^2 = +infinity$.

\* $lim_(x arrow frac(1, 2)) [f(x) - g(x)] = lim_(x arrow frac(1, 2)) f(x) - lim_(x arrow frac(1, 2)) g(x) = 4$.

#v(0.5cm)

*Exercice 11* \

1) $h(x) = frac(|x|(1 - x^2), -x^2 + x)$

$D_h = {x in RR ";" "tel que" -x^2 + x eq.not 0} = RR backslash {0, 1}$.

2) $lim_(x arrow 0) h(x) = lim_(x arrow 0) frac(|x|(1 - x)(1 + x), x(1 - x))$

$lim_(x arrow 0^+) h(x) = lim_(x arrow 0^+) frac(x(1 - x)(1 + x), x(1 - x)) = lim_(x arrow 0^+) x + 1 = 1$

$lim_(x arrow 0^-) h(x) = lim_(x arrow 0^-) frac(-x(1 - x)(1 + x), x(1 - x)) = lim_(x arrow 0^-) -(1 + x) = -1$

d'ou $lim_(x arrow 0^+) h(x) eq.not lim_(x arrow 0^-) h(x)$ par suite la limite en 0 de h(x) n'existe pas.

\* Quand $x arrow -infinity$, on a : $|x| = -x$ d'ou :

$lim_(x arrow -infinity) h(x) = lim_(x arrow -infinity) frac(-x(1 - x)(1 + x), x(1 + x)) = lim_(x arrow -infinity) -(1 + x) = +infinity$

3) $lim_(x arrow -infinity) (h(x) + x) = lim_(x arrow -infinity) -(1 + x) + x = lim_(x arrow -infinity) -1 = -1$.

#v(0.5cm)

*Exercice 12* \

1) $D_f = {x in RR "tel que" 1 - x gt.eq 0} ; 1 - x gt.eq 0 arrow.l.r.double 1 gt.eq x$ d'ou $D_f = ]-infinity, 1]$.

// Source: Parascolaire Analyse p.90

2) $lim_(x arrow 0) f(x) = 0$ ; $lim_(x arrow -infinity) f(x) = lim_(x arrow -infinity) frac(x sqrt(1 - x), x^2 + 2) = lim_(x arrow -infinity) frac(x sqrt(x^2 (frac(1, x^2) - frac(1, x))), x^2 (1 + frac(2, x^2)))$

$= lim_(x arrow -infinity) frac(x |x| sqrt(frac(1, x^2) - frac(1, x)), x^2 (1 + frac(2, x^2))) = lim_(x arrow -infinity) frac(-sqrt(frac(1, x^2) - frac(1, x)), 1 + frac(2, x^2)) = 0$.

3) $g(h) = f(1 + h)$.

a) $h in D_g arrow.l.r.double 1 + h in D_f arrow.l.r.double 1 + h lt.eq 1 arrow.l.r.double h lt.eq 0$. d'ou $D_g = RR_-$

b) $lim_(x arrow 0) f(1 + h) = lim_(x arrow 0) frac((h + 1)(sqrt(1 - (h + 1))), (h + 1)^2 + 2) = lim_(x arrow 0) frac((h + 1) sqrt(-h), h^2 + 2h + 3) = 0$.

#v(0.5cm)

*Exercice 13* \

- $f_m (x) = frac((m^2 - 1) x^2 + 2m^2 x - 2m, x - 1)$ cherchons $lim_(x arrow -infinity) f_m (x)$

$1^("er")$ cas : $m^2 - 1 = 0 arrow.l.r.double m = 1$ ou $m = -1$.

\* $m = 1$ ;

$lim_(x arrow -infinity) f_1 (x) = lim_(x arrow -infinity) frac(2x, x) = lim_(x arrow -infinity) 2 = 2$.

\* $m = -1$ ;

$lim_(x arrow -infinity) frac(2x + 2, x - 1) = lim_(x arrow -infinity) frac(2x, x) = 2$.

$2^("eme")$ cas : $m^2 - 1 eq.not 0 arrow.l.r.double m eq.not 1$ et $m eq.not -1$.

$lim_(x arrow -infinity) f_m (x) = lim_(x arrow -infinity) frac((m^2 - 1) x^2, x) = lim_(x arrow -infinity) (m^2 - 1) x$.

// Source: Parascolaire Analyse p.91

#table(
  columns: (1fr, 2fr, 1fr, 1fr, 1fr),
  align: center,
  [m], [$-infinity$], [$-frac(1, 3)$], [1], [$+infinity$],
  [$3m^2 - 2m - 1$], [$+$], [$0$], [$-$], [$0$], [$+$],
)

\* si $m^2 - 1 > 0 arrow.l.r.double m in ]-infinity, -1[ union ]1, +infinity[$ ; $lim_(x arrow -infinity) f_m (x) = -infinity$

\* Si $m^2 - 1 < 0 arrow.l.r.double m in ]-1, 1[$ ; $lim_(x arrow -infinity) f_m (x) = +infinity$.

- cherchons la $lim_(x arrow 1) f_m (x) = lim_(x arrow 1) frac((m^2 - 1) x^2 + 2m^2 x - 2m, x - 1)$

$lim_(x arrow 1) [(m^2 - 1) x^2 + 2m^2 x - 2m] = 3m^2 - 2m - 1$.

$1^("er")$ cas : $m in ]-infinity, -frac(1, 3)[ union ]1, +infinity[; 3m^2 - 2m - 1 > 0$

Il y a lieu distinguer la limite en $1^+$ de la limite en $1^-$

$lim_(x arrow 1^+) frac(1, x - 1) = frac(1, 0^+) = +infinity$

$lim_(x arrow 1^-) frac(1, x - 1) = frac(1, 0^-) = -infinity$

on obtient donc: $lim_(x arrow 1^+) f_m (x) = +infinity$ et $lim_(x arrow 1^-) f_m (x) = -infinity$

donc $lim_(x arrow 1) f_m (x)$, n'existe pas.

$2^("eme")$ cas : $m in ]-frac(1, 3), 1[$ ; $3m^2 - 2m - 1 < 0$,

on obtient donc $lim_(x arrow 1^+) f_m (x) = -infinity$ et $lim_(x arrow 1^-) f (x) = +infinity$

Donc la $lim_(x arrow 1) f_m (x)$, n'existe pas.

$3^("eme")$ cas :

\* $m = 1$

$lim_(x arrow 1) f_1 (x) = lim_(x arrow 1) frac(2x - 2, x - 1) = lim_(x arrow 1) frac(2(x - 1), x - 1) = 2$

\* $m = -frac(1, 3)$.

$lim_(x arrow 1) f_(-frac(1, 3)) (x) = lim_(x arrow 1) frac(-frac(8, 9) x^2 + frac(2, 9) x + frac(2, 3), x - 1) = lim_(x arrow 1) frac(-frac(8, 9) (x - 1)(x + frac(3, 4)), x - 1)$

$= lim_(x arrow 1) -frac(8, 9) (x + frac(3, 4)) = -frac(14, 9)$.

#v(0.5cm)

*Exercice 14* \

// Source: Parascolaire Analyse p.91 (suite) + p.92

1) \* $lim_(x arrow +infinity) f(x) = lim_(x arrow +infinity) frac(sqrt(x^2 - 7) - sqrt(2x + 1), x - 4)$

$= lim_(x arrow +infinity) frac((sqrt(x^2 - 7) - sqrt(2x + 1))(sqrt(x^2 - 7) + sqrt(2x + 1)), (x - 4)(sqrt(x^2 - 7) + sqrt(2x + 1)))$

// Source: Parascolaire Analyse p.92

$= lim_(x arrow +infinity) frac(x^2 - 7 - 2x - 1, (x - 4)(sqrt(x^2 - 7) + sqrt(2x + 1))) = lim_(x arrow +infinity) frac(x^2 - 2x - 8, (x - 4)(sqrt(x^2 - 7) + sqrt(2x + 1)))$

$= lim_(x arrow +infinity) frac((x - 4)(x + 2), (x - 4)(sqrt(x^2 - 7) + sqrt(2x + 1))) = lim_(x arrow +infinity) frac(x + 2, (sqrt(x^2 - 7) + sqrt(2x + 1)))$

$= lim_(x arrow +infinity) frac(x [frac(2, x) + 1], x(sqrt(1 - frac(7, x^2)) + sqrt(frac(2, x) + frac(1, x^2)))) = lim_(x arrow +infinity) frac(1 + frac(2, x), sqrt(1 - frac(7, x^2)) + sqrt(frac(2, x) + frac(1, x^2))) = 1$

\* $lim_(x arrow 4) f(x) = lim_(x arrow 4) frac(x + 2, (sqrt(x^2 - 7) + sqrt(2x + 1))) = frac(6, 3 + 3) = 1$

b) f est continue en $4 arrow.l.r.double lim_(x arrow 4) f(x) = f(4) = m arrow.l.r.double m = 1$

si $m = 1$ alors f est continue en 4.

si $m eq.not 1$ alors f n'est pas continue en 4.

2) a) g admet une limite finie en 1 si et seulement si :

$lim_(x arrow 1^+) g(x) = lim_(x arrow 1^-) g(x) = lim_(x arrow 1) g(x)$

$lim_(x arrow 1^+) g(x) = lim_(x arrow 1^+) frac(b x^2 + c x + 3, x - 1)$ finie lorsque $b + c + 3 = 0$

$lim_(x arrow 1^-) g(x) = lim_(x arrow 1^-) frac(a x + 4, x^2 - 1)$ finie lorsque $a + 4 = 0$.

D'ou $a = -4$ et $b + c = -3$

$lim_(x arrow 1^-) frac(-4x + 4, x^2 - 1) = lim_(x arrow 1^-) frac(-4(x - 1), x^2 - 1) = lim_(x arrow 1^-) frac(-4, x + 1) = -2$

$b + c = -3 arrow.l.r.double c = -3 - b$.

$lim_(x arrow 1^+) g(x) = lim_(x arrow 1^+) frac(b x^2 - (3 + b) + 3, x - 1) = lim_(x arrow 1^+) frac(b(x - 1)(x - frac(3, b)), x - 1)$

$lim_(x arrow 1^+) (b x - 3) = b - 3$.

$lim_(x arrow 1^+) g(x) = lim_(x arrow 1^-) g(x)$ signifie que $b - 3 = -2$

Signifie que $b = 1$ d'ou $c = -4$.

Conclusion : la fonction g admet une limite finie en 1 pour :

$a = -4 ; b = 1$ et $c = -4$.

b) \* $lim_(x arrow +infinity) g(x) = lim_(x arrow +infinity) frac(b x^2 + c x + 3, x - 1)$

// Source: Parascolaire Analyse p.93

$1^("er")$ cas : $b eq.not 0$

$lim_(x arrow +infinity) g(x) = lim_(x arrow +infinity) frac(b x^2, x) = lim_(x arrow +infinity) b x$

Si $b > 0$ donc $lim_(x arrow +infinity) g(x) = lim_(x arrow +infinity) b x = +infinity$.

Si $b < 0$ donc $lim_(x arrow +infinity) g(x) = lim_(x arrow +infinity) b x = -infinity$.

$2^("eme")$ cas : $b = 0$ donc $lim_(x arrow +infinity) g(x) = lim_(x arrow +infinity) frac(c x + 3, x - 1) = lim_(x arrow +infinity) frac(c x, x) = c$ ;

lorsque $c eq.not 0$. Si $c = 0$ ; $lim_(x arrow +infinity) g(x) = lim_(x arrow +infinity) frac(3, x) = 0$.

- $lim_(x arrow -infinity) g(x) = lim_(x arrow -infinity) frac(a x + 4, x^2 - 1) = lim_(x arrow -infinity) frac(a x, x^2) = lim_(x arrow -infinity) frac(a, x) = 0$. si $a eq.not 0$

et si $a = 0$ alors $lim_(-infinity) g = lim_(x arrow -infinity) frac(4, x) = 0$

conclusion : $forall a in RR$ $lim_(x arrow -infinity) g(x) = 0$

#v(0.5cm)

*Exercice 15* \

1) $lim_(x arrow 1) frac(x^2 - 8x + 7, sqrt(x) - 1) = lim_(x arrow 1) frac((x - 1)(x - 7)(sqrt(x) + 1), (sqrt(x) - 1)(sqrt(x) + 1))$

$= lim_(x arrow 1) frac((x - 1)(x - 7)(sqrt(x) + 1), x - 1) = lim_(x arrow 1) (x - 7)(sqrt(x) + 1) = -12$

2) $D_f = {x in RR "tel que" x^2 + x + 1 gt.eq 0 "et" x + 1 + sqrt(x^2 + x + 1) eq.not 0}$.

\* $x^2 + x + 1 = 0$

$Delta = 1 - 4 = -3 < 0$ donc $x^2 + x + 1 > 0$ pour tout x dans $RR$.

\* $sqrt(x^2 + x + 1) = -x - 1$

$arrow.l.r.double cases(-x - 1 gt.eq 0, x^2 + x + 1 = (x + 1)^2) arrow.l.r.double cases(-1 gt.eq x, x = 0)$ impossible.

donc $sqrt(x^2 + x + 1) eq.not -x - 1$ d'ou $D f = RR$.

\* $x mapsto x^2 + x + 1$ polynome donc continue $RR$.

comme $x^2 + x + 1 > 0$ d'ou $sqrt(x^2 + x + 1)$ est continue sur $RR$.

$x mapsto x + 1$ continue sur $RR$ d'ou U: $x mapsto x + 1 + sqrt(x^2 + x + 1)$

continue sur $RR$ comme $U(x) eq.not 0$ d'ou f(x) est continue sur $RR$.

// Source: Parascolaire Analyse p.93-94

\* $x + 1 + sqrt(x^2 + x + 1) > 0 arrow.l.r.double sqrt(x^2 + x + 1) > -x - 1$

#table(
  columns: (1fr, 2fr, 1fr, 1fr),
  align: center,
  [x], [$-infinity$], [$-1$], [$+infinity$],
  [$-x - 1$], [$+$], [$0$], [$-$],
)

Si $x in ]-infinity, -1]$ alors $x^2 + x + 1 > x^2 + 2x + 1$ donc $x < 0$ ainsi

$S_1 = RR_-^* sect ]-infinity, -1] = ]-infinity, -1]$

Si $x in [-1, +infinity[$ alors $sqrt(x^2 + x + 1) > -x - 1$

$in RR_+^*$ #h(1cm) $in RR_-$

d'ou $S_2 = [-1, +infinity[$ donc $S_(I R) = RR$.

d'ou $forall x in RR$, on a: $x + 1 + sqrt(x^2 + x + 1) > 0$.

donc $forall x in RR$, $f(x) > 0$

// Source: Parascolaire Analyse p.94

b) \* $lim_(x arrow +infinity) f(x) = lim_(x arrow +infinity) frac(sqrt(x^2 (1 + frac(1, x) + frac(1, x^2))), x + 1 + sqrt(x^2 (1 + frac(1, x) + frac(1, x^2))))$

$= lim_(x arrow +infinity) frac(|x| sqrt(1 + frac(1, x) + frac(1, x^2)), x + 1 + |x| dot sqrt(1 + frac(1, x) + frac(1, x^2)))$ ; si $x arrow +infinity$ alors $|x| = x$.

$= lim_(x arrow +infinity) frac(x sqrt(1 + frac(1, x) + frac(1, x^2)), x(1 + frac(1, x) + sqrt(1 + frac(1, x) + frac(1, x^2)))) = lim_(x arrow +infinity) frac(sqrt(1 + frac(1, x) + frac(1, x^2)), 1 + frac(1, x) + sqrt(1 + frac(1, x) + frac(1, x^2))) = frac(1, 2)$

car $lim_(x arrow +infinity) frac(1, x) = lim_(x arrow +infinity) frac(1, x^2) = 0$

$lim_(x arrow -infinity) f(x) = lim_(x arrow -infinity) frac(sqrt(x^2 + x + 1), x + 1 + sqrt(x^2 + x + 1))$

$= lim_(x arrow -infinity) frac(sqrt(x^2 + x + 1)(x + 1 - sqrt(x^2 + x + 1)), (x + 1)^2 - (x^2 + x + 1))$

$= lim_(x arrow -infinity) sqrt(x^2 + x + 1) (x + 1 - sqrt(x^2 + x + 1))$

// Source: Parascolaire Analyse p.95

$= lim_(x arrow -infinity) frac(|x| sqrt(1 + frac(1, x) + frac(1, x^2)) (x + 1 - sqrt(x^2 + x + 1)), x)$ ; si $x arrow -infinity ; |x| = -x$.

$= lim_(x arrow -infinity) -sqrt(1 + frac(1, x) + frac(1, x^2)) (x + 1 - sqrt(x^2 + x + 1)) = = (-2) dot (-infinity) = +infinity$

2) a) $lim_(|x| arrow +infinity) frac(g(x), x) = lim_(|x| arrow +infinity) sqrt(frac(x, x - 2)) = lim_(|x| arrow +infinity) frac(1, sqrt(1 - frac(2, x)))$

Si $x arrow +infinity$ alors $lim_(x arrow +infinity) frac(g(x), x) = 1$

Si $x arrow -infinity$ alors $lim_(x arrow -infinity) frac(g(x), x) = 1$ $arrow.double lim_(|x| arrow +infinity) frac(g(x), x) = 1$.

b) $lim_(|x| arrow +infinity) [g(x) - x] = lim_(|x| arrow +infinity) x [sqrt(frac(x, x - 2)) - 1]$

$lim_(x arrow +infinity) [g(x) - x] = lim_(x arrow +infinity) frac(x [sqrt(frac(x, x - 2)) - 1] [sqrt(frac(x, x - 2)) + 1], sqrt(frac(x, x - 2)) + 1)$

$= lim_(x arrow +infinity) frac(x (frac(x, x - 2) - 1), sqrt(frac(x, x - 2)) + 1) = lim_(x arrow +infinity) frac(2x, (x - 2) [sqrt(frac(x, x - 2)) + 1]) = lim_(x arrow +infinity) frac(2, (1 - frac(2, x)) (sqrt(frac(x, x - 2)) + 1)) = 1$

$lim_(x arrow -infinity) [g(x) - x] = lim_(x arrow -infinity) frac(2, (1 - frac(2, x))(sqrt(frac(x, x - 2)) + 1)) = 1$

d'ou $lim_(|x| arrow +infinity) [g(x) - x] = 1$.

#v(0.5cm)

*Exercice 16* \

// Source: Parascolaire Analyse p.95-96

$cases(lim_(x arrow -infinity) frac(f(x), x) = 2 "et" lim_(x arrow -infinity) [f(x) - 2x] = 2)$

- $lim_(x arrow -infinity) frac(f(x), x) = lim_(x arrow -infinity) a + frac(b, x) - frac(sqrt(x^2 + 1), x) = lim_(x arrow -infinity) (a + frac(b, x) - |x| frac(sqrt(1 + frac(1, x^2)), x))$ or $|x| = -x$ car $x arrow -infinity$

// Source: Parascolaire Analyse p.96

Donc $lim_(x arrow -infinity) frac(f(x), x) = lim_(x arrow -infinity) (a + sqrt(1 + frac(1, x^2)) + frac(b, x)) = a + 1$ car $lim_(x arrow -infinity) frac(b, x) = lim_(x arrow -infinity) frac(1, x^2) = 0$

Donc $lim_(x arrow -infinity) frac(f(x), x) = 2$ si et seulement si $a + 1 = 2$ equivaut a : $a = 1$

- $lim_(x arrow -infinity) (f(x) - 2x) = lim_(x arrow -infinity) (-x + b - sqrt(x^2 + 1)) = lim_(x arrow -infinity) [b - (sqrt(x^2 + 1) + x)]$

$= lim_(x arrow -infinity) [b - frac((sqrt(x^2 + 1) + x)(sqrt(x^2 + 1) - x), sqrt(x^2 + 1) - x)] = lim_(x arrow -infinity) [b - frac(1, sqrt(x^2 + 1) - x)]$

(car $lim_(x arrow -infinity) sqrt(x^2 + 1) - x = +infinity$ par suite $lim_(x arrow -infinity) frac(1, sqrt(x^2 + 1) - x) = 0$].

Or $lim_(x arrow -infinity) (f(x) - 2x) = 2$ donc $b = 2$.

#v(0.5cm)

*Exercice 17* \

// Source: Parascolaire Analyse p.96-97

- On a : $sqrt(x^2) = |x| = -x$ si $x arrow -infinity$.

Donc $lim_(x arrow -infinity) x sqrt(frac(x + 1, x^3 - 1)) = lim_(x arrow -infinity) -sqrt(x^2) dot sqrt(frac(x + 1, x^3 - 1)) = lim_(x arrow -infinity) -sqrt(frac(x^3 + x^2, x^3 - 1))$

or $lim_(x arrow -infinity) frac(x^3 + x^2, x^3 - 1) = lim_(x arrow -infinity) frac(x^3, x^3) = 1$ donc $lim_(x arrow -infinity) -sqrt(frac(x + 1, x^3 - 1)) = -1$.

- $lim_(x arrow +infinity) sqrt(x + sqrt(x)) - sqrt(x) = lim_(x arrow +infinity) frac((sqrt(x + sqrt(x)) - sqrt(x))(sqrt(x + sqrt(x)) + sqrt(x)), sqrt(x + sqrt(x)) + sqrt(x))$

$= lim_(x arrow +infinity) frac(sqrt(x), sqrt(x + sqrt(x)) + sqrt(x)) = lim_(x arrow +infinity) frac(sqrt(x), sqrt(x(1 + frac(sqrt(x), x))) + sqrt(x)) = lim_(x arrow +infinity) frac(1, sqrt(1 + frac(sqrt(x), x)) + 1) = frac(1, 2)$.

// Source: Parascolaire Analyse p.97

- $lim_(x arrow +infinity) [frac(x - sqrt(x^2 + x + 1), 2x + sqrt(4x^2 + x))]$

$= lim_(x arrow +infinity) frac(x(1 - sqrt(1 + frac(1, x) + frac(1, x^2))), x(2 + sqrt(4 + frac(1, x)))) = lim_(x arrow +infinity) frac(1 - sqrt(1 + frac(1, x) + frac(1, x^2)), 2 + sqrt(4 + frac(1, x))) = frac(0, 4) = 0$.

- $lim_(x arrow +infinity) (frac(sqrt(x) - 2x, sqrt(x) - 1)) = lim_(x arrow +infinity) frac(sqrt(x)(1 - 2 sqrt(x)), sqrt(x)(1 - frac(1, sqrt(x)))) = lim_(x arrow +infinity) frac(1 - 2 sqrt(x), 1 - frac(1, sqrt(x))) = -infinity$.

- $lim_(x arrow 1^+) frac(sqrt(x^2 - 1) + sqrt(x) - 1, sqrt(x) - 1) = lim_(x arrow 1^+) [frac(sqrt((x - 1)(x + 1)), sqrt(x) - 1) + frac(sqrt(x) - 1, sqrt(x) - 1)]$

$= lim_(x arrow 1^+) [frac(sqrt(x - 1) dot sqrt(x + 1), sqrt(x) - 1) + frac(sqrt(x) - 1, sqrt(x) - 1)] = lim_(x arrow 1^+) [sqrt(x + 1) + frac((sqrt(x) - 1)(sqrt(x) + 1), sqrt(x - 1)(sqrt(x) + 1))]$

$= sqrt(2) + lim_(x arrow 1^+) [frac(x - 1, sqrt(x - 1)) dot frac(1, sqrt(x) + 1)] = sqrt(2) + lim_(x arrow 1^+) [frac(sqrt(x - 1), sqrt(x) + 1)]$

$= sqrt(2)$ car ($lim_(x arrow 1^+) sqrt(x - 1) = 0$ et $lim_(x arrow 1^+) sqrt(x) + 1 = 2$ d'ou $lim_(x arrow 1^+) [frac(sqrt(x - 1), sqrt(x) + 1)] = 0$)

#v(0.5cm)

*Exercice 18* \

- $lim_(x arrow 0) f(x) = -2$ equivaut a $frac(beta, |-delta|) = -2$.

- $lim_(x arrow 2) f(x) = -infinity$ equivaut a $cases(4 alpha + beta < 0, |4 - delta| = 0)$

- $lim_(x arrow -infinity) f(x) = 1$ equivaut a $alpha = 1$ ; $delta = 4$ et $beta = -8$

Donc $f(x) = frac(x^2 - 8, |x^2 - 4|)$.

#v(0.5cm)

*Exercice 19* \

// Source: Parascolaire Analyse p.97-98

1) \* $lim_(x arrow 1^+) f(x) = lim_(x arrow 1^+) frac(x^2 - 8x + 7, sqrt(x) - 1) = lim_(x arrow +infinity^+) frac((x - 1)(x - 7), sqrt(x) - 1)$

$lim_(x arrow 1^+) frac((x - 1)(x - 7)(sqrt(x) + 1), (sqrt(x) - 1)(sqrt(x) + 1)) = lim_(x arrow 1^+) (x - 7)(sqrt(x) + 1) = -12$.

\* $lim_(x arrow 1^-) f(x) = lim_(x arrow 1^-) x^2 - 13x = -12 = lim_(x arrow 1^+) f(x)$ d'ou $lim_(x arrow 1) f(x) = -12$.

// Source: Parascolaire Analyse p.98

2) \* $lim_(x arrow 0^-) f(x) = lim_(x arrow 0^-) x sqrt(frac((-x)(x - 1), x)) = lim_(x arrow 0^-) -sqrt(-x) dot sqrt(1 - x) = 0$.

\* $lim_(x arrow 0^+) f(x) = lim_(x arrow 0^+) x^2 - 13x = 0$ lim f(x) d'ou $lim_(x arrow 0) f(x) = 0$.

\* $lim_(x arrow +infinity) f(x) = lim_(x arrow +infinity) frac(x^2 - 8x + 7, sqrt(x) - 1) = lim_(x arrow -infinity^+) (x - 7)(sqrt(x) + 1) = +infinity$

\* $lim_(x arrow -infinity) f(x) = lim_(x arrow -infinity) x sqrt(frac(x - 1, x))$ ; comme $lim_(x arrow -infinity) frac(x - 1, x) = 1$

d'ou $lim_(x arrow -infinity) sqrt(frac(x - 1, x)) = 1$ et $lim_(x arrow -infinity) x = -infinity$ d'ou $lim_(x arrow -infinity) f(x) = -infinity$

#v(0.5cm)

*Exercice 20* \

// Source: Parascolaire Analyse p.98

\* $lim_(x arrow +infinity) sqrt(x^2 - 1) + 4 - x = lim_(x arrow +infinity) frac((sqrt(x^2 - 1) + 4 - x)(sqrt(x^2 - 1) + 4 + x), sqrt(x^2 - 1) + 4 + x)$

$= lim_(x arrow +infinity) frac(x^2 - 1 - (4 - x)^2, sqrt(x^2 - 1) + 4 + x) = lim_(x arrow +infinity) frac(8x - 17, sqrt(x^2 (-1 - frac(1, x^2)) - 4 + x))$

$= lim_(x arrow +infinity) frac(x(8 - frac(17, x)), x(sqrt(x^2 - frac(1, x^2) - frac(4, x)) + 1)) = lim_(x arrow +infinity) frac(8 - frac(17, x), sqrt(x^2 - frac(1, x^2) - frac(4, x)) + 1) = frac(8, 2) = 4$.

D'ou $lim_(x arrow +infinity) f(x) = 4$.

$lim_(x arrow -infinity) f(x) = lim_(x arrow -infinity) x^2 sqrt(-x) + 2x - 1 = lim_(x arrow -infinity) x^2 (sqrt(-x) + frac(2, x) - frac(1, x^2))$

or $lim_(x arrow -infinity) sqrt(-x) = +infinity$ et $lim_(x arrow -infinity) frac(2, x) - frac(1, x^2) = 0$ d'ou $lim_(x arrow -infinity) f(x) = +infinity$.

2) a) $lim_(x arrow 1^-) (m + 1) x^3 - 3x + m^2 = m^2 + m - 2$ et $lim_(x arrow 1^-) x - 1 = 0^-$

On etudie alors le signe $m^2 + m - 2$.

#table(
  columns: (1fr, 2fr, 1fr, 1fr, 1fr),
  align: center,
  [m], [$-infinity$], [$-2$], [1], [$+infinity$],
  [$m^2 + m - 2$], [$+$], [$0$], [$-$], [$0$], [$+$],
)

$1^("er")$ cas : $m in ]-infinity, -2[ union ]1, +infinity[$ ; $lim_(x arrow 1^-) f(x) = -infinity$.

$2^("eme")$ cas : $m in ]-2, 1[$ alors $lim_(x arrow 1^-) f(x) = +infinity$.

$3^("eme")$ cas : $m = 1$ alors $lim_(x arrow 1^-) f(x) = lim_(x arrow 1^-) frac(2x^3 - 3x + 1, x - 1)$.

On remarque que 1 est une solution de $2x^3 - 3x + 1$

D'ou $2x^3 - 3x + 1 = (x - 1)(2x^2 + a x + b) = 2x^3 + (a - 2) x^2 + (b - a) x - b$

Par identification on retrouve $a = 2$ et $b = -1$.

$lim_(x arrow 1^-) f(x) = lim_(x arrow 1^-) frac((x - 1)(2x^2 + 2x - 1), x - 1) = 2x^2 + 2x - 1 = 3$.

// Source: Parascolaire Analyse p.99

$4^("eme")$ cas : $m = -2$ alors $lim_(x arrow 1^-) f(x) = lim_(x arrow 1^-) frac(-x^3 - 3x + 4, x - 1)$.

La meme methode que le $3^("eme")$ cas, on trouve :

$lim_(x arrow 1^-) f(x) = lim_(x arrow 1^-) -x^2 - x - 4 = -6$.

b) $lim_(x arrow 1^+) f(x) = lim_(x arrow 1^+) sqrt(x^2 - 1) + 4 - x = 3 = lim_(x arrow 1^-) f(x)$

alors $lim_(x arrow 1) f(x) = 3$ si et seulement si $m = 1$.

#v(0.5cm)

*Exercice 21* \

1) Faux : Contre exemple : $f(x) = frac(1, x^2 + 1)$ est definie sur $RR$ et n'a qu'une seule asymptote $y = 0$.

2) Vrai : sur $]-infinity, 0]$, f est decroissante et change de signe donc $f(x) = 0$ admet une solution sur $]-infinity, 0]$ et de meme sur $[0, +infinity[$

donc $f(x) = 0$ admet 2 solutions.

3) Faux : les limites a l'infinie sont finies.

4) Vrai : $lim_(-infinity) f(x) = 2$ et $lim_(+infinity) f(x) = 5$ par consequent $y = 2$ et $y = 5$ sont deux asymptotes horizontales.

5) Faux : $Delta$ n'est pas une asymptote oblique.

car $lim_(x arrow +infinity) f(x) - (2x + 3) = lim_(x arrow +infinity) -frac(x, x + 1) = 1 eq.not 0$

#v(0.5cm)

*Exercice 22* \

// Source: Parascolaire Analyse p.99-100

1) $x - 3 eq.not 0 arrow.l.r.double x eq.not 3$ d'ou $D f = RR - {3}$.

2) Ecrivons f sans valeurs absolue.

$f(x) = cases(frac(2x - 1, x - 3) "si" x > 3, frac(2x - 1, -x + 3) "si" x < 3)$

// Source: Parascolaire Analyse p.100

a) \* $lim_(+infinity) f = lim_(+infinity) frac(2x - 1, x - 3) = lim_(+infinity) frac(2x, x) = 2$

\* $lim_(-infinity) f = lim_(-infinity) frac(2x - 1, -x + 3) = lim_(-infinity) frac(2x, -x) = -2$

\* $lim_(3^+) f = lim_(x arrow 3^+) frac(2x - 1, x - 3) = +infinity$ car $cases(lim_(x arrow 3^+) 2x - 1 = 5, lim_(x arrow 3^+) x - 3 = 0^+)$

\* $lim_(x arrow 3^-) frac(2x - 1, x - 3) = 0^+$ $arrow.double lim_(3^-) f = -infinity$

\* $lim_(x arrow 3^-) 2x - 1 = 5$

$lim_(x arrow 3^-) x - 3 = 0^-$ $arrow.double lim_(3^-) f = -infinity$

b) $lim_(+infinity) f(x) = 2$ alors $y = 2$ est une asymptote en $+infinity$ a $zeta$.

$lim_(-infinity) f(x) = -2$ alors $y = -2$ est asymptote en $-infinity$ a (C).

$lim_(3^+) f = +infinity$ et $lim_(3^-) f = -infinity$ $arrow.double x = 3$ est une asymptote a $(zeta)$

#v(0.5cm)

*Exercice 23* \

1) f est definie pour $x eq.not 1$ alors $D f = RR - {1}$

2) \* $lim_(+infinity) f = lim_(x arrow +infinity) frac((x - 2)^2, x - 1) = lim_(x arrow +infinity) frac(x^2 - 4x + 4, x - 1) = lim_(x arrow +infinity) frac(x^2, x) = lim_(x arrow +infinity) x = +infinity$

\* $lim_(-infinity) f = lim_(x arrow -infinity) x = -infinity$

\* $lim_(1^+) f = lim_(x arrow 1^+) frac(x^2 - 4x + 4, x - 1) = +infinity$ car $cases(lim_(1^+) x^2 - 4x + 4 = 1, lim_(1^+) x - 1 = 0^+)$

\* $lim_(1^-) f = lim_(x arrow 1^-) frac(x^2 - 4x + 4, x - 1) = -infinity$ car $cases(lim_(1^-) x^2 - 4x + 4 = 1, lim_(1^-) x - 1 = 0^-)$

b) $lim_(1^+) f = +infinity$ et $lim_(1^-) f = -infinity$ alors $x = 1$ est asymptote verticale pour $(zeta)$

3) a) $f(x) = a x + b + frac(c, x - 1)$ en reduisons au meme denominateur on obtient

$f(x) = frac((a x + b)(x - 1) + c, x - 1) = frac(a x^2 + (b - a) x - b + c, x - 1)$ or $f(x) = frac(x^2 - 4x + 4, x - 1)$

// Source: Parascolaire Analyse p.101

par identification on obtient $cases(a = 1, b - a = -4, -b + c = 4)$

ainsi $a = 1$, $b = -3$ et $c = 1$

b) On a $f(x) = x - 3 + frac(1, x - 1)$ et $lim_(x arrow plus.minus infinity) [f(x) - (x - 3)] = lim_(x arrow plus.minus infinity) frac(1, x - 1) = 0$

donc $Delta : y = x - 3$ est une asymptote a $(xi)$ en $+infinity$ et en $-infinity$.

#v(0.5cm)

*Exercice 24* \

$f(x) = frac(x^2 + 2x - 1, x^2 + 2x + 4)$

1) f est definie lorsque $x^2 + 2x + 4 eq.not 0$

$Delta = -12 < 0$ alors $x^2 + 2x + 4 > 0$ ainsi $D f = RR$

2) $lim_(+infinity) f = lim_(x arrow +infinity) frac(x^2 + 2x - 1, x^2 + 2x + x) = lim_(x arrow +infinity) frac(x^2, x^2) = 1$

$lim_(-infinity) f = lim_(x arrow -infinity) frac(x^2, x^2) = 1$

3) $lim_(+infinity) f = lim_(-infinity) f = 1$ on deduit alors que la droite d'equation $y = 1$ est

asymptote a (C) en $+infinity$ et en $-infinity$

#v(0.5cm)

*Exercice 25* \

// Source: Parascolaire Analyse p.101

1) f est definie lorsque $x^2 - 3x + 1 gt.eq 0$

$Delta = 5 > 0$ alors $x' = frac(3 - sqrt(5), 2)$ et $x'' = frac(3 + sqrt(5), 2)$

#table(
  columns: (1fr, 2fr, 1fr, 1fr, 1fr, 1fr),
  align: center,
  [x], [$-infinity$], [$x'$], [], [$x''$], [$+infinity$],
  [$x^2 - 3x + 1$], [$+$], [$0$], [$-$], [$0$], [$+$],
)

$D f = ]-infinity, frac(3 - sqrt(5), 2)] union [frac(3 + sqrt(5), 2), +infinity[$

2) $sqrt((x - frac(3, 2))^2 - frac(5, 4)) = sqrt(x^2 - 3x + frac(9, 4) - frac(5, 4)) = sqrt(x^2 - 3x + 1) = f(x)$

// Source: Parascolaire Analyse p.102

3) a) $lim_(+infinity) [f(x) - (x - frac(3, 2))] = lim_(+infinity) [sqrt((x - frac(3, 2))^2 - frac(5, 4)) - (x - frac(3, 2))]$

$= lim_(+infinity) frac([sqrt((x - frac(3, 2))^2 - frac(5, 4)) - (x - frac(3, 2))][sqrt((x - frac(3, 2))^2 - frac(5, 4)) + (x + frac(1, 3))], sqrt((x - frac(3, 2))^2 - frac(5, 4)) + (x - frac(3, 2)))$

$= lim_(+infinity) frac(sqrt((x - frac(3, 2))^2 - frac(5, 4)) - (x - frac(3, 2))^2, sqrt(x^2 - 3x + 1) + (x - frac(3, 2))) = lim_(+infinity) frac(-frac(5, 4), sqrt(x^2 - 3x + 1) + (x - frac(3, 2))) = 0$

car $lim_(+infinity) x^2 - 3x + 1 = lim_(+infinity) x^2 = +infinity$ et $lim_(+infinity) x - frac(3, 2) = +infinity$ par consequent

$y = x - frac(3, 2)$ est une asymptote a $(zeta)$ en $+infinity$.

b) $f(x) - (x - frac(3, 2)) = frac(-frac(5, 4), sqrt(x^2 - 3x + 1) + x - frac(3, 2))$

- Si $x in [x'', +infinity[$ alors $x gt.eq frac(3, 2) + frac(sqrt(5), 2) arrow.double x - frac(3, 2) gt.eq frac(sqrt(5), 2) > 0$

et $sqrt(x^2 - 3x + 1) > 0$ d'ou $f(x) - (x - frac(3, 2)) < 0$

donc $zeta_f$ est au dessous de $Delta$.

- Si $x in ]-infinity, x']$ alors $x lt.eq frac(3 - sqrt(5), 2) - frac(3, 2) - frac(sqrt(5), 2) arrow.double x - frac(3, 2) < 0 arrow.double -(x - frac(3, 2)) > 0$

d'ou $f(x) - (x - frac(3, 2)) = sqrt(x^2 - 3 + 1) - (x - frac(3, 2)) > 0$ donc $zeta_f$ est au dessus de $Delta$

#v(0.5cm)

*Exercice 26* \

// Source: Parascolaire Analyse p.102-103

$f(x) = x + sqrt(x^2 - 1)$

1) f est definie lorsque $x^2 - 1 gt.eq 0 arrow.l.r.double x in ]-infinity, -1] union [1, +infinity[$ donc f est definie sur D.

2) $f(x) dot f(-x) = (x + sqrt(x^2 - 1))(-x + sqrt((-x)^2 - 1)) = (sqrt(x^2 - 1) + x)(sqrt(x^2 - 1) - x)$

$= sqrt(x^2 - 1) - x^2 = x^2 - 1 - x^2 = -1$.

// Source: Parascolaire Analyse p.103

3) a) $lim_(+infinity) f(x) = lim_(x arrow +infinity) x + lim_(x arrow +infinity) sqrt(x^2 - 1)$ car $lim_(x arrow +infinity) x = +infinity$ et $lim_(x arrow +infinity) x^2 - 1 = +infinity$

$= +infinity$

b) On a : $f(x) dot f(-x) = -1$ alors $f(-x) = frac(-1, f(x))$

$lim_(x arrow -infinity) f(x) = lim_(x arrow +infinity) f(-x) = lim_(x arrow +infinity) frac(-1, f(x)) = 0$

car $lim_(x arrow +infinity) f(x) = +infinity$

ainsi $lim_(x arrow -infinity) f(x) = 0$

par consequent $y = 0$ est une asymptote en $-infinity$ par $cal(C)_f$

4) $lim_(x arrow +infinity) f(x) - (2x) = lim_(x arrow +infinity) x + sqrt(x^2 - 1) - 2x$

$= lim_(x arrow +infinity) -x + sqrt(x^2 - 1)$ or $f(-x) = -x + sqrt(x^2 - 1)$

$= lim_(x arrow +infinity) f(-x) = lim_(x arrow -infinity) f(x) = 0$

donc $Delta : y = 2x$ est une asymptote oblique en $+infinity$ pour $cal(C)_f$.

#v(0.5cm)

*Exercice 27* \

// Source: Parascolaire Analyse p.103

A)1) $lim_(x arrow 0 \ x > 0) f(x) = -infinity$ et $lim_(x arrow +infinity) f = +infinity$

2) par lecture graphique, nous avons pour $x in ]0, frac(1, 3)[$ , D est au dessus de $(cal(C))$

et pour $x in ]frac(1, 3), +infinity[$ D, est au dessous de $(cal(C))$

3) D'apres le graphique, nous deduisons que f est une fonction strictement croissante sur $]0, +infinity[$

B) 1) a) $lim_(x arrow +infinity) frac(3, x) = 0$ et $lim_(x arrow +infinity) frac(1, x^2) = 0$ donc $lim_(x arrow +infinity) f(x) = +infinity$

De plus : $lim_(x arrow +infinity) (f(x) - x) = lim_(x arrow +infinity) (frac(3, x) - frac(1, x^2)) = 0$

Donc la droite $D : y = x$ est une asymptote a $cal(C)$ en $+infinity$

b) $f(x) - x = frac(3, x) - frac(1, x^2) = frac(3x - 1, x^2)$ il s'ensuit que $f(x) - x > 0$ pour $x > frac(1, 3)$

et que $f(x) - x < 0$ pour $0 < x < frac(1, 3)$

par suite : D est au dessus de $cal(C)$ si $x in ]0, frac(1, 3)[$

// Source: Parascolaire Analyse p.104

D est au dessous de $cal(C)$ si $x in ]frac(1, 3), +infinity[$

c) $K in cal(C) sect D arrow.l.r.double cases(f(x) = y, x = y) arrow.l.r.double cases(y = x, f(x) = x)$

$arrow.l.r.double cases(y = x, frac(3x - 1, x^2) = 0) arrow.l.r.double cases(y = frac(1, 3), x = frac(1, 3))$ donc $K (frac(1, 3), frac(1, 3))$

2) a) $f(x) = x + frac(3, x) - frac(1, x^2) = frac(x^3 + 3x - 1, x^2)$

b) Nous avons $lim_(x arrow 0) x^3 + 3x - 1 = -1$ et $lim_(x arrow 0) x^2 = 0^+$

donc $lim_(x arrow 0) f(x) = lim_(x arrow 0) frac(x^3 + 3x - 1, x^2) = -infinity$

par suite la droite d'equation $x = 0$ est asymptote verticale a $(cal(C))$.
