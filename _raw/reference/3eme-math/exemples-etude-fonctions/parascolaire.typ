// =============================================================================
// Transcription fidele : Parascolaire Analyse 3eme sec (Kounouz Editions)
// Chapitre V — Exemples d'etude de fonctions
// Pages 197 a 260
// =============================================================================

#import "@preview/cetz:0.3.4"
#import "@preview/cetz-plot:0.1.1": plot
#import "@preview/vartable:0.2.3": tabvar

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
  #text(size: 18pt, weight: "bold")[Exemples d'etude de fonctions]
]

#v(1em)

// Source: Parascolaire Analyse p.197

#definition-block[
  == Symetrie de la courbe

  #table(
    columns: (3fr, 1fr),
    align: left,
    stroke: 0.5pt,
    [Si $f$ est paire alors la droite d'equation $x = 0$ dans $(O, arrow(i), arrow(j))$ est un axe de symetrie pour $xi_f$.],
    [$RR_+ sect D$ ou $RR_- sect D$],

    [Si $f$ est impaire alors le point $O$ est un centre de symetrie de $xi_f$ dans $(O, arrow(i), arrow(j))$.],
    [$RR_+ sect D$ ou $RR_- sect D$],

    [$Delta : x = a$ est un axe de symetrie pour $xi_f$ \
    $arrow.l.r.double forall x in D$, on a : $cases(2a - x in D, f(2a - x) = f(x))$],
    [$RR_+ sect [a, +infinity[$ ou $RR_- sect ]-infinity, a]$],

    [Le point $I(a, b)$ est un centre de symetrie de $xi_f$ \
    $arrow.l.r.double forall x in D$, on a : $cases(2a - x in D, f(2a - x) = 2b - f(x))$],
    [$RR_+ sect [a, +infinity[$ ou $RR_- sect ]-infinity, a]$],
  )
]

#v(1em)

// Source: Parascolaire Analyse p.197

#definition-block[
  == Point d'inflexion

  - Si la courbe traverse la tangente en $A$, alors on dit que $A$ est un point d'inflexion.

  - $f$ est derivable deux fois sur $]x_0 - h, x_0 + h[ subset D$.

  Si $f''$ s'annule en $x_0$, en changeant de signe, alors le point $M_0 (x_0, f(x_0))$ est un point d'inflexion pour $xi$.
]

#v(1em)

// Source: Parascolaire Analyse p.197-198

#definition-block[
  == Position $xi$ et $T$ la tangente a $xi$ en $A(a, f(a))$

  $f$ deux fois derivable sur un intervalle ouvert $I$ contenant $a$.

  #table(
    columns: (1fr, 1fr),
    align: center,
    stroke: 0.5pt,
    table.header([*$f''(a) > 0$*], [*$f''(a) < 0$*]),
    [$f''(x)$ : $+$ puis $-$], [$f''(x)$ : $-$ puis $+$],
    [Position $xi$ et $T$ : $xi$ est au dessus de $T$], [Position $xi$ et $T$ : $xi$ est au dessous de $T$],
  )
]

#v(1em)

// Source: Parascolaire Analyse p.198

#definition-block[
  == Branches paraboliques

  Pour tracer $zeta$ il faut voir le comportement de la courbe au voisinage de l'infini, si $f$ est definie sur $RR$ ou $]-infinity, a]$ ou $[a, +infinity[$.

  - Si $lim_(x -> infinity) f(x) = infinity$ et de plus $lim_(x -> infinity) frac(f(x), x) = infinity$. Alors on dit que $zeta$ admet une branche parabolique de direction $(O, arrow(j))$ au voisinage de $infinity$.

  - Si $lim_(x -> infinity) f(x) = infinity$ et du plus $lim_(x -> infinity) frac(f(x), x) = 0$ alors on dit que $zeta$ admet une branche parabolique de direction $(O, arrow(i))$.
]

#v(1em)

// Source: Parascolaire Analyse p.198

#definition-block[
  == Changement de repere

  Dans le repere $(O, arrow(i), arrow(j))$, soit $M(x, y)$ et $Omega(a, b)$.

  Dans le repere $(Omega, arrow(i), arrow(j))$, soit $M(X, Y)$ et $overline(O M) = overline(O Omega) + overline(Omega M)$

  D'ou $cases(x = a + X, y = b + Y)$ est le systeme donnant les relations de changement de repere.

  Dans le repere $(O, arrow(i), arrow(j))$, $xi$ a pour equation : $y = f(x)$.

  Dans le repere $(Omega, arrow(i), arrow(j))$, $xi$ a pour equation : $Y = g(X)$.
]

#v(1em)

// Source: Parascolaire Analyse p.198

#definition-block[
  == Position $zeta$ et $Delta$

  - $Delta$ une droite, $Delta : y = a x + b$ :
    - Si $f(x) - (a x + b) >= 0$ ; alors $zeta_f$ est au dessus de $Delta$.
    - Si $f(x) - (a x + b) <= 0$ ; alors $zeta_f$ est au dessous de $Delta$.

  - Montrer que deux courbes $zeta$ et $zeta'$ sont tangentes au point d'abscisse $x_0$ : On determine les equations des tangentes aux deux courbes au point commun d'abscisse $x_0$ et on constate qu'il s'agit de la meme droite.
]


// =============================================
// ENONCES
// =============================================

#align(center)[
  #text(size: 18pt, weight: "bold")[ENONCES]
]

#v(1em)

== Fonctions polynomes de degre $<= 4$

// Source: Parascolaire Analyse p.199

=== Exercice 1

$f(x) = x^3 + 3|x| + 2.$

1) Etudier la continuite et la derivabilite de $f$ en $0$.

2) Dresser le tableau de variation de $f$.

3) Tracer la courbe $xi_f$.

#v(1em)

// Source: Parascolaire Analyse p.199

=== Exercice 2

Soit la fonction $f(x) = -2x^3 + 4x^2 - 2x + 1$.

1) a) Etudier la variation de $f$.

#h(1em) b) Determiner les coordonnees du point d'inflexion.

#h(1em) c) Tracer la courbe de $f$.

2) Montrer que pour tout $x in ]0, 1[$ ; $f(x) > 0$.

3) Determiner suivant les valeurs de $m$ ($m$ parametre reel), le nombre des racines de l'equation : $4x^2 + 1 = 2x^3 + 2x + m$.

#v(1em)

// Source: Parascolaire Analyse p.199

=== Exercice 3

Soit $f : RR arrow.r RR$ ; $x arrow.r.bar a x^3 + b x^2 + c x + 9$.

I) Determiner les reels $a$, $b$, $c$ pour que $f$ admette un extremum au point $(-1)$ egal a $14$ et que sa courbe representative $C$ passe par $A(2, -13)$.

II) Soit $f(x) = x^3 - 3x^2 - 9x + 9$.

1) a) Etudier la fonction $f$.

#h(1em) b) Montrer que $C$ admet un point d'inflexion $I$ et que $I$ est un centre de symetrie pour $C$.

#h(1em) c) Tracer $C$ dans un repere orthogonal.

2) Soit la droite $Delta_m : y = m x + 9$.

#h(1em) a) Etudier suivant les valeurs de $m$, le nombre de points d'intersection de $xi$ et $Delta_m$.

#h(1em) b) Lorsqu'il existe deux points d'intersection autres que $B(0, 9)$, on designe par $P_1$ et $P_2$ ces points. Determiner les coordonnees du point $J$ milieu de $[P_1, P_2]$. Determiner l'ensemble des points $J$ lorsque $m$ varie.

#v(1em)

// Source: Parascolaire Analyse p.199-200

=== Exercice 4

Soit $f_m$ la fonction definie par $f_m (x) = m x^3 - (m + 2)x^2 + (4 - m)x + m$, ou $m$ est un parametre reel.

Soit $(xi_m)$ la courbe de $f_m$ dans le plan rapporte a un repere orthonorme $(O, arrow(i), arrow(j))$.

A) 1) On prend $m = 0$, construire la courbe $(xi_0)$ dans $(O, arrow(i), arrow(j))$.

2) On prend $m = 1$.

#h(1em) a) Etudier la variation de $f_1$.

#h(1em) b) Montrer que $(xi_1)$ admet un point d'inflexion $I$ que l'on precisera.

#h(1em) c) Ecrire l'equation de la tangente $T$ en $I$ et etudier la position de $T$ et $(xi_1)$.

#h(1em) d) Construire $T$ et $(xi_1)$ dans le repere $(O, arrow(i), arrow(j))$.

#h(1em) e) Resoudre graphiquement $x^3 - x^2 - x + 1 <= 0$.

B) 1) On prend $m = 4$. Etudier $f_4$ et tracer sa courbe $xi_4$ (pas avec $xi_1$ et $xi_0$).

2) Soit $D_p : y = -p x + 4$ ou $p in RR$.

#h(1em) a) Determiner l'ensemble des valeurs de $p$ pour lesquelles, $D_p$ et $xi_4$ se coupent en trois points distincts note $K$, $M'$ et $M''$, avec $K$ d'abscisse $0$.

#h(1em) b) Soit $J = M' * M''$. Determiner l'ensemble des points $J$, lorsque $P$ varie dans $RR_-$.

C) 1) Determiner que toutes les $(xi_m)$ passent par $2$ points fixes $A$ et $B$ ($A$ d'abscisse positive).

2) Determiner les valeurs de $m$, pour que $f_m$ a au plus un extremum.

3) Verifier que toutes les $(xi_m)$ sont tangentes en $A$.

#v(1em)

// Source: Parascolaire Analyse p.200

=== Exercice 5

Soit $f_m : RR arrow.r RR ; x arrow.r.bar frac(1, 3)(2m - 1) x^3 - x^2 + m x ; m in RR$.

$xi_m$ la courbe de $f_m$ dans un R.O.N $(O, arrow(i), arrow(j))$.

A) 1) Montrer que toutes les courbes $xi_m$ passent par un point fixe que l'on determinera.

2) Etudier suivant $m$ le sens de variation de $f_m$.

B) Soit la fonction $f : RR arrow.r RR ; x arrow.r.bar a x^3 + b x^2 + c x + d$.

1) Determiner les reels $a$, $b$, $c$, $d$ pour que $f$ admette deux extremums : $-frac(4, 3)$ et $0$ respectivement en $-2$ et $0$.

2) On donne $a = -frac(1, 3)$ ; $b = -1$ ; $c = d = 0$. Verifier $f = f_0$ (pour $m = 0$).

#h(1em) a) Etudier la variation de $f$.

#h(1em) b) Montrer que la courbe $xi$ de $f$ admet un point d'inflexion $I$ que l'on determinera.

#h(1em) c) Montrer que $I$ est un centre de symetrie de $xi$.

#h(1em) d) Construire $xi$.

3) Soit $Delta_m$ la droite passant par l'origine du repere et de coefficient directeur $(-m)$ ; $m in RR$.

#h(1em) a) Discuter suivant $m$ le nombre de points communs de $xi$ et $Delta_m$.

#h(1em) b) Dans le cas ou $Delta_m$ coupe $xi$ en trois points $O$, $M'$, $M''$ tels que $M'$, $M''$ sont distincts de $O$. Poser $I_m = M' * M''$. Calculer les coordonnees de $I_m$.

#h(1em) c) Determiner l'ensemble $H$ des points $I_m$ lorsque $m$ varie. Construire $H$.

4) Soit $A$ le point de $xi$ d'abscisse $1$, $T$ la tangente a $xi$ en $A$, $T'$ la droite symetrique de $T$ par rapport a $I$. Montrer que $T'$ est tangente a $xi$ au point $B$ que l'on determinera.

5) Soit $g : RR arrow.r RR ; x arrow.r.bar |frac(1, 3) x^3 + x^2|$.

#h(1em) a) En deduire la representation graphique de la courbe $xi'$ de $g$ dans le meme repere.

#h(1em) b) Deduire les variations de $g$.

#h(1em) c) Discuter suivant $k$ l'existence des racines de : $g(x) = k$ ; $k in RR$.

#v(1em)

// Source: Parascolaire Analyse p.201

=== Exercice 6

Soit la fonction $f(x) = 4x^3 - 3x + 1$ ; $xi$ sa courbe dans le plan rapporte a un R.O.N $(O, arrow(i), arrow(j))$.

A) 1) Etudier la fonction $f$.

2) Montrer que $xi$ admet un point d'inflexion $I$ et que $I$ est un centre de symetrie de $xi$.

3) Tracer $xi$.

4) Soit l'equation $(E_m) : 8x^2 - 6x + m = 0$. Utiliser la courbe $xi$ pour determiner les valeurs de $m$ pour lesquelles l'equation $(E_m)$ admet dans $RR$, trois solutions distinctes deux a deux.

5) Utiliser la courbe $xi$ pour construire la courbe $H$ de la fonction :

$h(x) = -4|x|^3 + 3|x| + 1.$

B) Soit la fonction $f_a (x) = frac(4, a^2) x^3 - 3x + a$ ($a$ un reel $eq.not 0$).

1) Etudier suivant les valeurs de $a$, les variations de $f_a$.

2) Soit $(xi_a)$ la courbe de $f_a$, $M_a$ et $N_a$, les points de $xi_a$ correspondants aux extremums de $f_a$.

#h(1em) a) Determiner en fonction de $a$, les coordonnees de $M_a$ et $N_a$.

#h(1em) b) Quel est l'ensemble des points $M_a$ et des points $N_a$ lorsque $a$ decrit $RR^*$.

C) Soit la fonction $g_m (x) = f_1(x) - m f_2(x)$ et $zeta_m$ sa courbe.

1) Etudier suivant $m$ le sens de variation de $g_m$.

2) Montrer que toutes les $xi_m$ passent par $2$ points fixes $A$ et $B$ ; ($A$ d'abscisse positive).

#v(1em)

// Source: Parascolaire Analyse p.202

=== Exercice 7

$f$ definie sur $RR$ par $f(x) = x^4 - x^3 + x^2 - frac(3, 4) x + 1$.

$zeta$ la courbe de $f$ dans un R.O.N $(O, arrow(i), arrow(j))$.

1) Determiner la fonction derivee de $f$.

2) $g$ est la fonction definie par $g(x) = f'(x)$.

#h(1em) a) Calculer $g'(x)$.

#h(1em) b) Dresser le tableau de variation de $g$ et verifier que $g(frac(1, 2)) = 0$.

#h(1em) c) En deduire le signe de $g$.

3) a) Dresser le tableau de variation de $f$.

#h(1em) b) Donner des equations des tangentes $T$ et $T'$ a $zeta$ aux points d'abscisses $1$ et $(-1)$.

#h(1em) c) Tracer $T$, $T'$ et $zeta$.

#v(1em)

// Source: Parascolaire Analyse p.202-203

=== Exercice 8 — Le toboggan

On veut realiser un toboggan pour les enfants termine en pente douce. Il doit donc verifier les conditions suivantes :

(1) il doit avoir une tangente en $A$ parallele au sol

(2) il doit etre tangent au sol au point $B$.

dans tout le probleme, on considere le plan repere orthogonal $(O, arrow(i), arrow(j))$ (unite graphique comme l'indique le croquis suivant).

Les coordonnees du point $A$ sont donc $(0, 2)$, celles du point $B$ sont $(4, 0)$.

Le but du probleme est de trouver des fonctions dont les courbes representatives ont l'allure du toboggan et verifient les conditions de l'enonce.

1) une fonction polynome du premier degre peut-elle convenir ? Expliquer pourquoi.

2) a) $f$ est la fonction definie sur $[0, 4]$ par :

$f(x) = -frac(1, 4) x^2 + 2$ et $zeta_f$ est sa courbe representative dans $(O, arrow(i), arrow(j))$.

Etudier les variations de $f$ et dresser son tableau de variation.

b) $g$ est la fonction definie sur $[0, 4]$ par :

$g(x) = frac(1, 4) x^2 - 2x + 4$ ; $zeta_g$ est sa courbe representative dans $(O, arrow(i), arrow(j))$.

Etudier les variations de $g$ et dresser son tableau de variation.

c) Demontrer que $zeta_f$ et $zeta_g$ ont en commun le point $C$ de coordonnees $(2, 1)$.

d) Demontrer que $zeta_f$ et $zeta_g$ ont la meme tangente $T$ au point $C$.

e) Tracer $T$, puis $zeta_f$ et $zeta_g$ sur un meme graphique, ensuite tracer d'une couleur differente, les deux portions de courbes $zeta_f$ et $zeta_g$ representant le toboggan.

f) Verifier que la courbe obtenue satisfait aux conditions (1) et (2).

3) On decide de donner un toboggan, un profil correspondant a la courbe representative dans $zeta_f$ et $zeta_g$ d'une fonction polynome $P$ de degre $3$ :

$P(x) = a x^3 + b x^2 + c x + d$

#h(1em) a) Trouver la valeur de $d$ sachant que la courbe passe par $A$.

#h(1em) b) Sachant que la courbe doit verifier les conditions (1) et (2) et qu'elle passe par $B$, trouver les valeurs de $a$, $b$ et $c$.

c) $h$ est la fonction definie sur $[0, 4]$ par : $h(x) = frac(1, 16) x^3 - frac(3, 8) x^2 + 2$.

Etudier les variations de $h$ et donner son tableau de variation.

d) Sur un nouveau graphique, tracer la courbe $zeta_h$ representant $h$ dans $(O, arrow(i), arrow(j))$.


// Source: Parascolaire Analyse p.204

=== Exercice 9 — Vrai - Faux

Repondre par vrai ou faux. Justifier votre reponse.

1) On considere le tableau de variation suivant :

#figure(
  table(
    columns: (auto, auto, auto, auto, auto, auto),
    align: center,
    stroke: 0.5pt,
    [$x$], [$-infinity$], [$0$], [$1$], [$3$], [$+infinity$],
    [$f'(x)$], [$-$], [$0$], [$+$], [$0$], [$+$],
    [$f(x)$], [$2 arrow.b$], [$-1$], [$arrow.t +infinity$], [$+infinity arrow.b$], [$0 arrow.t +infinity$],
  )
)

On note $zeta_f$ sa courbe representative dans un repere :

a) La droite $x = 2$ est une asymptote a $zeta_f$.

b) La droite $x = 1$ est une asymptote a $zeta_f$.

c) La droite $y = 3$ coupe la $zeta_f$ exactement en $2$ points.

2) La fonction $f$ definie sur $[-1, 1]$ par $f(x) = sqrt(1 - x^2)$.

a) La fonction $f$ est derivable en $1$.

b) $f$ n'admet pas d'asymptote.

3) $f$ est la fonction definie sur $I = ]-2, 2[$ par $f(x) = sqrt(4 - x^2)$.

a) Pour tout $x in I$, $f'(x) = frac(1, 2 sqrt(4 - x^2))$.

b) $x = 2$ est une asymptote pour la courbe de $f$.

4) Toute fonction rationnelle admet une asymptote oblique.

#v(1em)

== Fonction rationnelle de type : $frac(a x + b, c x + 2)$ et $frac(a x^2 + b x + c, d x + c)$

// Source: Parascolaire Analyse p.204

=== Exercice 10

Soit la fonction $f$ definie par $f(x) = frac(x + 1, x - 1)$. Etudier les variations de $f$ et representer sa courbe representative $(H)$ dans un repere orthonorme $(O, arrow(i), arrow(j))$.

On note $I$ le centre de symetries de $(H)$. Determiner ses coordonnees.

2) Determiner le coefficient de la tangente a $(H)$ au point $A$ d'abscisse $2$. Quelle est l'autre tangente a $(H)$, ayant le meme coefficient directeur ? Soit $A'$ le point de contact de cette derniere. Etudier la position relative des Points $A$, $I$ et $A'$.

3) Quelles sont les valeurs du reel $m$ pour les quelles la droite $(D)$ d'equation : $y = -2x + m$, rencontre la courbe $(H)$ en deux points $M'$ et $M''$ (distincts ou confondus) ?

4) Lorsque $m$ satisfait a la condition trouvee, calculer, en fonction de $m$, les coordonnees du milieu $J$ de $[M' M'']$. Preciser l'ensemble decrit par $J$, quand $m$ varie.

#v(1em)

// Source: Parascolaire Analyse p.205

=== Exercice 11

Soit $f_m$, la fonction definie par $f_m (x) = frac(m x + 2 - m, 2x + m - 5)$ ; $m$ est un parametre reel et soit $zeta_m$ sa courbe representative dans un repere orthonorme $(O, arrow(i), arrow(j))$.

1) Determiner $m$ dans les cas suivants :

#h(1em) a) $Delta : y = 2$ est une asymptote horizontale a $zeta_m$.

#h(1em) b) $Delta : x = 1$ est une asymptote verticale a $zeta_m$.

2) Etudier suivant les valeurs $m$, les variations de $f_m$.

3) Montrer que pour tout reel $m$, pour lequel $f_m$ n'est pas constante, $zeta_m$ passe par deux points fixes $A$ et $B$.

4) Soit $I_m$ le point d'intersection des asymptotes de $zeta_m$. Quel est l'ensemble des points $I_m$ lorsque $m$ varie dans $RR - {-1, 4}$.

5) Tracer $zeta_1$.

6) En deduire la representation graphique de $g : RR - {2} arrow.r RR$ ;

$x arrow.r.bar g(x) = frac(|x + 1|, 2x + 4)$.

#v(1em)

// Source: Parascolaire Analyse p.205

=== Exercice 12

On considere la fonction $f : RR arrow.r RR$ ; $x arrow.r.bar frac(x^2 - x + 1, x - 2)$.

On designe par $C$, la representation graphique de $f$ dans un repere orthonorme $(O, arrow(i), arrow(j))$.

1) Montrer qu'il existe trois reels $a$, $b$ et $c$ tel que $f(x) = a x + b + frac(c, x - 2)$.

2) Etudier les variations de $f$.

3) a) Montrer que le point $I$ d'intersection des asymptotes est un centre de symetrie de $C$.

#h(1em) b) Construire $C$.

4) Discuter graphiquement l'equation : $x^2 - (m + 1)x + 2m + 1 = 0$, ou $m in RR$.

5) Dans le cas ou $D : y = m$ coupe $C$ en deux points $M'$ et $M''$, on pose : $I = M' * M''$.

#h(1em) a) Quel est l'ensemble $H$ des points $I$, lorsque $m$ vraie.

#h(1em) b) Construire l'ensemble $H$ dans le meme repere.

#h(1em) c) Determiner l'ensemble des reels $m$ pour que $O M' M''$ soit rectangle en $O$.

#v(1em)

// Source: Parascolaire Analyse p.206

=== Exercice 13

On considere $f_m : x arrow.r.bar 2x + 1 + frac(m - 3, 2x - 1)$ ou $m in RR - {3}$ et $(C_m)$.

La courbe de $f_m$ dans $R(O, arrow(i), arrow(j))$, un repere orthonorme du plan.

A) 1) a) Discuter suivant les valeurs de $m$, les limites suivantes :

$lim_(x -> (frac(1, 2))^-) f_m (x)$ ; $lim_(x -> (frac(1, 2))^+) f_m (x)$ et $lim_(|x| -> +infinity) f_m (x)$.

#h(1em) b) Dresser, suivant les valeurs de $m$, le tableau de variation de $f_m$ (sans preciser les valeurs des extremums eventuels).

1) Montrer que toutes les courbes $(C_m)$ possedent deux asymptotes communes et un centre de symetrie commun.

2) Determiner $m$ pour que $S(1, 4)$, soit un sommet de $(C_m)$.

B) Dans la suite on prend $m = 4$.

On note $f$ la fonction $f_4$ et $(zeta)$ sa courbe representative.

1) Dresser le tableau de variation de $f$ et construire $(zeta)$.

2) a) Soit $g : x arrow.r.bar 2x + 1 + frac(1, |2x - 1|)$.

Dresser le tableau de variation de $g$ sur son domaine.

#h(1em) b) Construire $(zeta')$ la courbe representative de $g$.

#h(1em) c) Determiner graphiquement le nombre de solutions dans $RR$ de l'equation : $|2x - 1| dot (m - 2x - 1) = 1$.

C) Le but de cette partie est de montrer la propriete suivante :

$P$ : "toute tangente a $(zeta)$ coupe ses deux asymptotes en deux points symetriques par rapport au point de contact de cette tangente avec $(zeta)$."

1) Montrer que l'equation de $(zeta)$ dans le repere $R' = (I, arrow(e_1), arrow(e_2))$ est :

$Y = frac(1, 2X)$ avec $I(frac(1, 2), 2)$ et $cases(arrow(e_1) = arrow(i) + 2 arrow(j), arrow(e_2) = arrow(j))$

2) Soit $M_0$ un point d'abscisse $X_0$ ; ecrire l'equation de la tangente a $(zeta)$ au point $M_0$ dans le repere $R'$.

3) Demontrer la propriete "$P$" enoncee.

#v(1em)

// Source: Parascolaire Analyse p.207

=== Exercice 14

Soit la fonction $f_m$ definie par $f_m (x) = frac(x^2 + m x + 4, x - 1)$ ou $m in RR$.

$C_m$ : sa courbe representative dans un repere orthonorme $(O, arrow(i), arrow(j))$.

A) 1) a) Calculer $f'_m (x)$ pour tout $x in RR without {1}$.

#h(1em) b) Determiner suivant $m$, $lim_(x -> 1) f(x)$.

2) Determiner les valeurs de $m$ pour lesquelles $f_m$ a deux extremums, indiquer alors un tableau de variation de $f_m$.

3) a) Montrer que toutes les courbes $zeta_m$ passent par un point fixe $A$.

#h(1em) b) Determiner $m$ pour que la tangente a $zeta_m$ en $A$, ait pour coefficient directeur, le reel $(-3)$.

B) On suppose dans la suite $m = -1$, $f = f_(-1)$ et $zeta = zeta_(-1)$.

1) Etudier les variations de $f$, verifier que $f(x) = x + frac(4, x - 1)$ ;

pour tout $x in RR without {1}$, preciser les asymptotes de $zeta$ et construire $zeta$.

2) Soit la droite $D_a$ d'equation : $y = a x + 1 - a$ ($a in RR$).

#h(1em) a) Determiner les valeurs de $a$ pour lesquelles $D_a$ coupe $zeta$ en $2$ points distincts $M'$ et $M''$.

#h(1em) b) Soient $x'$ et $x''$ les abscisses respectives de $M'$ et $M''$ lorsqu'ils existent, verifier que $x' + x'' = 2$. En deduire que les tangentes a $zeta$ en $M'$ et en $M''$ sont paralleles.

2) Soit la fonction $g$ definie par $g(x) = |x| + frac(4, x - 1)$ et $zeta'$ sa courbe representative.

#h(1em) a) Etudier les variations de $g$ sur $]-infinity, 0]$.

#h(1em) b) Etudier la derivabilite de $g$ en $0$. Interpreter graphiquement.

#h(1em) c) Preciser l'asymptote a $zeta'$ au voisinage de $-infinity$ et construire $C'$ dans le repere $(O, arrow(i), arrow(j))$.


#v(1em)

== Fonctions irrationnelle du type : $sqrt(a x + b)$, $sqrt(a^2 + b x + c)$

// Source: Parascolaire Analyse p.207

=== Exercice 15

Soit $alpha > 0$, soit $f$ la fonction definie sur $RR_+$ par $f(x) = x^2 (alpha - sqrt(x))$.

1) Determiner la fonction derivee $f'$ et son domaine de definition.

2) En deduire les variations de $f$ en fonction de $alpha$.

3) Determiner $alpha$ pour que $T$ la tangente a la courbe representative de $f$ au point d'abscisse $x = 1$ soit parallele a la droite $D$ d'equation $y = 3x + 2$.

#v(1em)

// Source: Parascolaire Analyse p.208

=== Exercice 16

$f$ et $g$ deux fonctions definies sur $RR$ par

$f(x) = sqrt(x^2 - x + 1)$ #h(2em) et #h(2em) $g(x) = -frac(1, 4) x^2 + x + frac(1, 4)$

$zeta_f$ et $zeta_g$ designe les courbes respectives de $f$ et $g$ dans un R.O.N $(O, arrow(i), arrow(j))$.

1) Montrer que $zeta_f$ et $zeta_g$ admettent une tangente comme $D$ au point d'abscisse $1$.

2) Etudier les positions relatives des courbes $zeta_f$ et $zeta_g$ et de la tangente $D$.

3) a) Etudier les variations de $f$.

#h(1em) b) Montrer $y = x - frac(1, 2)$ est une asymptote a $zeta_f$ en $+infinity$.

#h(1em) c) Soit la droite $Delta : y = -x + frac(1, 2)$. Montrer que $Delta$ est asymptote a $zeta_f$ en $-infinity$.

4) Tracer $zeta_f$ et $zeta_g$ et $D$.

#v(1em)

// Source: Parascolaire Analyse p.208

=== Exercice 17

Soit $f$ definie sur $RR$ par $f(x) = 2 sqrt(1 + x^2) - x$.

1) Demontrer que pour tout reel $x$ : $sqrt(1 + x^2) - x > 0$

$sqrt(1 + x^2) + x > 0$ et $2 sqrt(1 + x^2) - x > 0$.

2) $g$ est la fonction definie sur $RR$ par $g(x) = 2x - sqrt(1 + x^2)$.

#h(1em) a) Montrer que $g$ est strictement croissante sur $RR$.

#h(1em) b) Resoudre dans $RR$, l'equation $g(x) = 0$.

#h(1em) c) Determiner le signe de $g(x)$.

3) a) Calculer les limites de $f$ en $-infinity$ et en $+infinity$.

#h(1em) b) Montrer que pour tout reel $x$ on a : $f'(x) = frac(g(x), sqrt(1 + x^2))$.

#h(1em) c) Dresser le tableau de variation de $f$.

4) a) Etudier $lim f(x) - x$ lorsque $x$ tend vers $+infinity$. Que peut-on deduire pour $zeta_f$ ?

#h(1em) b) Montrer que la droite $Delta : y = -3x$ est une asymptote en $-infinity$ pour $zeta_f$.

#h(1em) c) Determiner la position de $zeta_f$ par rapport a $Delta$ puis par rapport a la droite d'equation $D : y = x$.

5) Tracer $D$, $Delta$ et $zeta_f$ dans un repere orthonorme d'unite $3$ cm.

#v(1em)

// Source: Parascolaire Analyse p.208-209

=== Exercice 18

Soit $f$ la fonction definie par $f(x) = sqrt(x^2 - 6x + 5)$.

Soit $zeta$ sa courbe representative dans un R.O.N $(O, arrow(i), arrow(j))$.

1) Etudier selon les valeurs de $x$ le signe de polynome $x^2 - 6x + 5$. En deduire le domaine de definition de $f$.

2) Demontrer que la droite $x = 3$ est un axe de symetrie de $zeta$.

3) Calculer $lim_(h -> 0^+) frac(f(5 + h) - f(5), h)$.

La fonction $f$ est elle derivable en $5$ ? Interpreter graphiquement le resultat trouve.

4) Etudier les variations de $f$ sur $[5, +infinity]$.

En deduire les variations de $f$ sur $]-infinity, 1]$.

5) Determiner $lim_(x -> +infinity) f$.

6) Demontrer que la droite $D_1 : y = x - 3$ est asymptote a $zeta$ en $+infinity$.

En deduire les equation de l'asymptote $D_2$ en $-infinity$.

7) Dresser le tableau complet de $f$.

8) Construire $zeta$.

#v(1em)

== Fonctions rationnelles de la forme : $frac(a x^2 + b x + c, d x^2 + e x + f)$

// Source: Parascolaire Analyse p.209

=== Exercice 19

Soient les fonctions $g$ et $h$ definies sur $RR$ par

$g(x) = a x^2 + b x + c$ #h(1em) et #h(1em) $h(x) = r x^2 + s x + t$ #h(1em) ($a$, $b$, $c$, $r$, $s$, $t$ des reels)

on note respectivement $zeta_g$ et $zeta_h$ les courbes de $g$ et $h$.

1) Determiner les reels $r$, $s$ et $t$ sachant que $g'(1) = -1$ et $g'(2) = 1$ et que la tangente a $zeta_g$ au point d'abscisse $1$ passe par le point $A(2, -20)$.

2) Determiner les reels $r$, $s$ et $t$ sachant que la tangente a $zeta_g$ au point d'abscisse $0$ passe par les points $B(0, -14)$ et $C(1, -16)$ et $h(1) = -15$.

3) On pose $f(x) = frac(g(x), h(x))$.

#h(1em) a) Determiner le domaine de definition de $f$.

#h(1em) b) Pour tout $x in D$, Determiner $f'(x)$.

#h(1em) c) En deduire les variations de $f$ sur $[-7, 7]$.

#v(1em)

// Source: Parascolaire Analyse p.209

=== Exercice 20

Soit la fonction $f(x) = frac(x^2 + 2x - 3, x^2 - 4)$.

1) Determiner $D_f$ le domaine de definition de $f$.

2) Determiner les variations de $f$.

3) Quelles sont les asymptotes de $zeta_f$.

4) Tracer $zeta_f$ la courbe de $f$ en precisant les coordonnees des points d'intersections avec les axes et le coefficient directeur des tangentes en ce point.

5) Discuter graphiquement, suivant les valeurs de $m$ le nombre de solution de l'equation : $(1 - m)x^2 + 2x - 3 + 4m = 0$.

#v(1em)

// Source: Parascolaire Analyse p.209-210

=== Exercice 21

$a$, $b$, $c$ etant des reels et $f$ la fonction definie sur $RR - {1}$ par

$f(x) = frac(a x^2 + b x + c, (x - 1)^2)$. #h(1em) $zeta$ Designe sa courbe dans un R.O.N $(O, arrow(i), arrow(j))$.

1) On dispose des renseignements suivants :

- La droite d'equation $y = 1$ est une asymptote horizontale a $zeta$ en $+infinity$.
- Le coefficient directeur de la tangente $T$ a $zeta$ en $0$ est egale a $-2$.
- La courbe $zeta$ passe par $O$. Determiner alors les reels $a$, $b$, $c$.

2) Etudier les limites de $f$ aux bornes de son domaine de definition.

3) a) Pour tout $x eq.not 1$, calculer $f'(x)$.

#h(1em) b) Dresser le tableau de variation de $f$.

4) Tracer la tangente $T$ et la courbe $zeta$.


// =============================================
// CORRIGES
// =============================================

#align(center)[
  #text(size: 18pt, weight: "bold")[CORRIGES]
]

#v(1em)

== Fonctions polynomes de degre $<= 4$

// Source: Parascolaire Analyse p.211

=== Exercice 1 — Corrige

$f(x) = x^3 + 3x + 2$ si $x >= 0$.

$f(x) = x^3 - 3x + 2$ si $x <= 0$.

1) $bullet$ $lim_(x -> 0^+) f(x) = lim_(x -> 0^+) x^3 - 3x + 2 = 2$

et $lim_(x -> 0^-) f(x) = lim_(x -> 0^-) x^3 - 3x + 2 = 2$

et $f(0) = 2$. Donc $lim_(x -> 0) f(x) = f(0)$

d'ou $f$ est continue en $0$.

$bullet$ $lim_(x -> 0^+) frac(f(x) - f(0), x) = lim_(x -> 0^+) frac((x^3 - 3x + 2) - 2, x) = lim_(x -> 0^+) frac(x^3 + 3x, x) = lim_(x -> 0^+) x^2 + 3 = 3 = f'_d (0)$

$lim_(x -> 0^-) frac(f(x) - f(0), x) = lim_(x -> 0^-) frac(x^3 - 3x, x) = lim_(x -> 0^-) x^2 - 3 = -3 = f'_g (0)$.

Donc $f'_g (0) eq.not f'_d (0)$ d'ou $f$ n'est pas derivable en $0$.

2) Sur $]-infinity, 0[$ respectivement sur $]0, +infinity[$ ;

$f$ est une polynome donc derivable sur $]-infinity, 0[ union ]0, +infinity[$.

Sur $]0, +infinity[$ ; $f'(x) = 3x^2 + 3 > 0$ et Sur $]-infinity, 0[$ ; $f'(x) = 3x^2 - 3 = 3(x^2 - 1)$.

#figure(
  table(
    columns: 6,
    align: center,
    stroke: 0.5pt,
    [$x$], [$-infinity$], [$-1$], [$0$], [$1$], [$+infinity$],
    [$(x^2 - 1)$], [$+$], [$0$], [$-$], [$0$], [$+$],
  )
)

ainsi

#figure(
  table(
    columns: 4,
    align: center,
    stroke: 0.5pt,
    [$x$], [$-infinity$], [$-1$], [$0$],
    [$f'(x)$], [$+$], [$0$], [$-$],
  )
)

en deduire le tableau de variation suivant :

#figure(
  table(
    columns: 5,
    align: center,
    stroke: 0.5pt,
    [$x$], [$-infinity$], [$-1$], [$0$], [$+infinity$],
    [$f'(x)$], [$+$], [$0$], [$-$ | ], [$+$],
    [$f(x)$], [$-infinity arrow.t$], [$4$], [$arrow.b 2$], [$arrow.t +infinity$],
  )
)

// Source: Parascolaire Analyse p.211

$lim_(x -> -infinity) f(x) = lim_(x -> -infinity) x^3 = -infinity$ et $lim_(x -> +infinity) f(x) = lim_(x -> +infinity) x^3 = +infinity$.

3) $lim_(x -> +infinity) frac(f(x), x) = lim_(x -> +infinity) x^2 = +infinity = lim_(x -> -infinity) frac(f(x), x)$ donc $xi_f$ admet deux branche parabolique de direction $(y y')$ au voisinage de $+infinity$ et $-infinity$.

#figure(
  table(
    columns: 8,
    align: center,
    stroke: 0.5pt,
    [$x$], [$-2$], [$-1.5$], [$-1$], [$-0.5$], [$0$], [$0.5$], [$1$],
    [$f(x)$], [$0$], [$3.125$], [$4$], [$3.375$], [$2$], [$3.625$], [$6$],
  )
)

#v(1em)

// Source: Parascolaire Analyse p.212

=== Exercice 2 — Corrige

1) a) $f$ est une polynome alors derivable sur $RR$ et $f'(x) = -6x^2 + 8x - 2$.

$ast$ $f'(x) = -6x^2 + 8x - 2 = 0 arrow.l.r.double x = 1$ ou $x = frac(c, a) = frac(1, 3)$.

#figure(
  table(
    columns: 4,
    align: center,
    stroke: 0.5pt,
    [$x$], [$-infinity$], [$frac(1, 3)$], [$1$], [$+infinity$],
    [$f'(x)$], [$-$], [$+$], [$-$],
    [$f(x)$], [$+infinity arrow.b$], [$frac(19, 27) arrow.t$], [$1 arrow.b$], [$-infinity$],
  )
)

$lim_(x -> -infinity) f(x) = lim_(x -> -infinity) -2x^3 = +infinity$ et $lim_(x -> +infinity) f(x) = lim_(x -> +infinity) -2x^3 = -infinity$.

b) $f$ est un polynome donc derivable deux fois sur $RR$ ;

$f''(x) = -12x + 8$.

$f''(x) = 0 arrow.l.r.double -12x + 8 = 0 arrow.l.r.double x = frac(8, 12) = frac(2, 3)$.

#figure(
  table(
    columns: 3,
    align: center,
    stroke: 0.5pt,
    [$x$], [$-infinity$], [$frac(2, 3)$], [$+infinity$],
    [$f''(x)$], [$+$], [$0$], [$-$],
  )
)

$f''$ s'annule en $frac(2, 3)$ et change de signe au voisinage de $frac(2, 3)$ donc $xi_f$ admet

un point d'inflexion $A(frac(2, 3), f(frac(2, 3)))$ avec $f(frac(2, 3)) = frac(23, 27)$ et $f'(frac(2, 3)) = frac(2, 3)$.

c) $ast$ $lim_(x -> +infinity) frac(f(x), x) = lim_(x -> +infinity) -2x^2 = -infinity = lim_(x -> -infinity) frac(f(x), x)$. Donc $xi_f$ admet $2$ branches paraboliques de direction $(y y')$ au voisinage de $+infinity$ et de $-infinity$.

// Source: Parascolaire Analyse p.213

2) Sur $]0, 1[$ ; $xi_f$ admet un minimum $frac(19, 27)$

donc $f(x) >= frac(19, 27) > 0$ d'ou $forall x in ]0, 1[$ ; $f(x) > 0$.

3) $4x^2 + 1 = 2x^3 + 2x + m arrow.l.r.double -2x^3 + 4x^2 - 2x + 1 = m$

ou encore $f(x) = m$. On considere $Delta : y = m$ ; les solutions de l'equation $(E_m)$ sont les abscisses des points d'intersection de la courbe $(xi)$ et de la droite $(Delta)$, or d'apres la representation de la courbe $xi$, $xi sect Delta = {1 "point"}$ donc $1$ solution.

$ast$ Si $m in ]-infinity, frac(19, 27)[ union ]1, +infinity[$ ; alors $Delta sect xi_f = {1 "point"}$ donc $1$ solution.

$ast$ Si $m = frac(19, 27)$ ou $m = 1$ alors $Delta sect xi_f = {2 "points"}$ donc $2$ solutions.

#v(1em)

// Source: Parascolaire Analyse p.213

=== Exercice 3 — Corrige

I) $ast$ $f$ est un polynome donc derivable sur $RR$ et $f'(x) = 3a x^2 + 2b x + c$.

$ast$ $f$ admet un extremum en $-1$ egal a $14 arrow.l.r.double f'(-1) = 0$ et $f(-1) = 14$ ;

$ast$ $A(2, -13) in xi_f arrow.l.r.double f(2) = -13$.

$cases(f(-1) = 14, f(2) = -13, f'(-1) = 0) arrow.l.r.double cases(-a + b - c + 5 = 14 #h(1em) (1), 4a + 2b + c = -11 #h(1em) (2), 3a - 2b + c = 0 #h(1em) (3))$

$cases((1) + (3) : 2a - b = 5, (2) + (1) : 3a + 3b = -6) arrow.l.r.double cases(b = 2a - 5, 3a + 3(2a - 5) = -6) arrow.l.r.double cases(b = -3, a = 1, c = -9)$

II) 1) a) $f$ est une fonction polynome derivable sur $RR$ et $f'(x) = 3x^2 - 6x - 9$ ;

On remarque que $f'$ s'annule en $-1$ et $3$.

// Source: Parascolaire Analyse p.214

#figure(
  table(
    columns: 4,
    align: center,
    stroke: 0.5pt,
    [$x$], [$-infinity$], [$-1$], [$3$], [$+infinity$],
    [$f'(x)$], [$+$], [$0$], [$0$], [$+$],
    [$f(x)$], [$-infinity arrow.t$], [$14 arrow.b$], [$-18 arrow.t$], [$+infinity$],
  )
)

$lim_(x -> +infinity) f(x) = lim_(x -> +infinity) x^3 = +infinity$ et $lim_(x -> -infinity) f(x) = lim_(x -> -infinity) x^3 = -infinity$.

b) $ast$ $f$ est derivable deux fois sur $RR$ comme fonction polynome :

$f''(x) = 6x - 6$.

#figure(
  table(
    columns: 3,
    align: center,
    stroke: 0.5pt,
    [$x$], [$-infinity$], [$1$], [$+infinity$],
    [$f''(x)$], [$-$], [$0$], [$+$],
  )
)

$f''$ s'annule en $1$, en changement de signe donc $xi$ admet un point d'inflexion $I(1, f(1))$ or $f(1) = -2$.

$ast$ $forall x in RR$ alors $2 - x in RR$.

$f(2 - x) = (2 - x)^3 - 3(2 - x)^2 - 9(2 - x) + 9 = -x^3 + 3x^2 + 9x - 13$

$= -(x^3 - 3x^2 - 9x + 9) - 4 = -4 - f(x)$.

donc $I$ est un centre de symetrie pour $xi$.

c) $ast$ $lim_(x -> +infinity) frac(f(x), x) = lim_(x -> +infinity) x^2 = +infinity$ ; donc $f$ admet deux branches paraboliques de directions $(y y')$ au voisinage de $+infinity$ et $-infinity$.

$I$ est un centre de symetrie et un point d'inflexion $f'(1) = -12$.

// Source: Parascolaire Analyse p.214

2) a) Le nombre de points d'intersection de $xi$ et $Delta_m$ est egal au nombre de solutions de l'equation : $f(x) = m x + 9$

$arrow.l.r.double x^3 - 3x^2 - 9x - m x = 0 arrow.l.r.double x(x^2 - 3x - 9 - m) = 0$;

$bullet$ Si $m = -9$ alors $x = 0$ ou $x = 3$ donc $2$ solutions.

$bullet$ Si $m eq.not -9$ ; alors $Delta = 9 - 4(-9 - m) = 4m + 45$.

#figure(
  table(
    columns: 4,
    align: center,
    stroke: 0.5pt,
    [$m$], [$-infinity$], [$-frac(45, 4)$], [$-9$], [$+infinity$],
    [$4m + 45$], [$-$], [$0$], [$+$], [$+$],
  )
)

// Source: Parascolaire Analyse p.215

b) $P_1(x', y')$ et $P_2(x'', y'')$ avec $x'$ et $x''$ sont les solutions distinctes de l'equation $x^2 - 3x - 9 - m = 0$.

Alors : $S = x' + x'' = 3$ et $x' x'' = -9 - m$. Comme $J = P_1 * P_2$ alors $x_J = frac(x' + x'', 2) = frac(3, 2)$

et $y_J = frac(y' + y'', 2) = frac((m x' + 9) + (m x'' + 9), 2) = frac(m(x' + x''), 2) + 9 = frac(3, 2) m + 9$.

$ast$ $E = {J(x_J, y_J) "tel que" m in ]-frac(45, 4), +infinity[ without {-9}}$.

$x_J = frac(3, 2)$ l'equation d'une droite ; $y = frac(3, 2) m + 9$.

Or $m in ]-frac(45, 4), +infinity[ without {-9}$.

Donc $frac(3, 2) m + 9 > frac(-63, 8)$ et $frac(3, 2) m + 9 eq.not -frac(9, 2)$.

Ainsi $E$ est la demi-droite $[F G)$ privee de $G$ et $F$ avec $F(frac(3, 2), frac(-63, 8))$ et $G(frac(3, 2), -frac(9, 2))$.


// Source: Parascolaire Analyse p.215

=== Exercice 4 — Corrige

1) $m = 0$ alors $f_0(x) = -2x^2 + 4x$ est une parabole de sommet $S(1, 2)$ et d'axe de symetrie $Delta : x = 1$.

a) $f_1(x) = x^3 - 3x^2 + 3x + 1$. $ast$ $f_1$ est un polynome derivable sur $RR$ et $f_1'(x) = 3x^2 - 6x + 3 = 3(x - 1)^2 >= 0$

#figure(
  table(
    columns: 3,
    align: center,
    stroke: 0.5pt,
    [$x$], [$-infinity$], [$1$], [$+infinity$],
    [$f_1'(x)$], [$+$], [$0$], [$+$],
    [$f_1(x)$], [$-infinity$], [], [$arrow.r +infinity$],
  )
)

$lim_(x -> +infinity) f(x) = lim_(x -> +infinity) x^3 = +infinity$ et $lim_(x -> -infinity) f(x) = lim_(x -> -infinity) x^3 = -infinity$.

b) $f_1'(x) = 3x^2 - 6x + 3$ polynome derivable sur $RR$.

$f_1''(x) = 6x - 6$

// Source: Parascolaire Analyse p.216

#figure(
  table(
    columns: 3,
    align: center,
    stroke: 0.5pt,
    [$x$], [$-infinity$], [$1$], [$+infinity$],
    [$f_1''(x)$], [$-$], [$0$], [$+$],
  )
)

$f_1''$ s'annule en $1$ en changement de signe donc $C_1$ admet un point d'inflexion $I(1, f(1))$ avec $f(1) = 2$.

c) $T : y = f'(1)(x - 1) + f(1)$

or $f(1) = 2$ et $f'(1) = 0$ ; d'ou $T : y = 2$.

Sur $]-infinity, 1[$ ; $f''(x) <= 0$ donc $xi$ est au dessous de $T$.

Sur $]1, +infinity[$ ; $f''(x) > 0$ donc $xi$ est au dessus de $T$.

pour $x = 1$ ; $xi$ et $T$ coincident en $I$.

e) $x^3 - x^2 - x + 1 <= 0 arrow.l.r.double x^3 - 3x^2 + 3x + 1 <= -2x^2 + 4x$ ou encore :

$f_1(x) <= f_0(x)$ alors les solutions sont les abscisses des points de $xi_1$ situees au dessous de $xi_0$ par suite $S_(RR) = ]-infinity, -2] union {1}$.

B) 1) $f_4(x) = 4x^3 - 6x^2 + 4$ ; polynome derivable sur $RR$.

$f_4'(x) = 12x^2 - 12x = 12(x^2 - x)$.

#figure(
  table(
    columns: 4,
    align: center,
    stroke: 0.5pt,
    [$x$], [$-infinity$], [$0$], [$1$], [$+infinity$],
    [$f_4'(x)$], [$+$], [$-$], [$+$],
    [$f_4(x)$], [$+infinity arrow.t$], [$4 arrow.b$], [$2 arrow.t$], [$-infinity$],
  )
)

$lim_(x -> +infinity) f(x) = lim_(x -> +infinity) 4x^3 = +infinity$ et $lim_(x -> -infinity) f(x) = lim_(x -> -infinity) 4x^3 = -infinity$.

$ast$ $lim_(x -> +infinity) frac(f(x), x) = lim_(x -> +infinity) 4x^2 = +infinity$ ;

donc $xi_f$ admet $2$ branches paraboliques de direction $(y y')$.

// Source: Parascolaire Analyse p.216-217

2) $D_p : y = -p x + 4$.

a) $M(x, y) in D_p sect xi_4 arrow.l.r.double y = f_4(x)$ et $y = -p x + 4$.

le nombre de points d'intersection est egal au nombre de solution de l'equation $f_4(x) = -p x + 4$ ou encore $4x^3 - 6x^2 + p x = 0 arrow.l.r.double x(4x^2 - 6x + p) = 0$

$arrow.l.r.double x = 0$ ou $4x^2 - 6x + p = 0$

$Delta' = 9 - 4p$.

Pour avoir $3$ points distincts d'intersection il faut avoir $3$ solutions :

c'est $cases(Delta' > 0 arrow.l.r.double frac(9, 4) > p, p eq.not 0)$ d'ou $p in ]-infinity, frac(9, 4)[ - {0}$.

b) $E = {J = M' * M'' ; p in ]-infinity, 0[}$

$x_J = frac(x' + x'', 2)$ et $y_J = frac(y' + y'', 2)$.

$x_J = frac(S, 2) = frac(3, 4)$ car $S = frac(6, 4) = frac(3, 2)$ et $y_J = frac((-p x' + 4) + (-p x'' + 4), 2)$

Ainsi $x_J = frac(3, 4)$ et $y_J = frac(-p(frac(3, 2)) + 8, 2) = -frac(3, 4) p + 4$ ;

$x_J = frac(3, 4)$ est l'equation d'une droite or $p in ]-infinity, 0[$.

$p < 0 arrow.l.r.double frac(3, 4) p + 4 < 4$ et $frac(3, 4) p + 4 eq.not 4$ ;

donc $E$ est la demi-droite $[L N) backslash {L}$ avec $L(frac(3, 4), 4)$ et $N(frac(3, 4), 0)$ donc l'ensemble $H$ est le demi droite $[K L)$ privee de $K$ et $L$.

C) 1) Soit $M(x, y) in xi_m arrow.l.r.double y = m x^3 - (m + 2)x^2 + (4 - m)x + m$

$arrow.l.r.double m(x^3 - x^2 - x + 1) - 2x^2 + 4x - y = 0$, vraie pour tout $m in RR$ ;

Si et seulement si $cases(x^3 - x^2 - x + 1 = 0, -2x^2 + 4x - y = 0)$

$ast$ $x^3 - x^2 - x + 1 = 0 arrow.l.r.double x^2(x - 1) - (x - 1) = 0 arrow.l.r.double (x - 1)(x^2 - 1) = 0$

// Source: Parascolaire Analyse p.218

$arrow.l.r.double (x - 1)^2(x + 1) = 0 arrow.l.r.double x = 1$ ou $x = -1$.

$ast$ Pour $x = 1$ on a : $y = -2x^2 + 4x = 2$.
$ast$ Pour $x = -1$ on a : $y = -6$.

Donc toute $xi_m$ passant par les points $A(1, 2)$ et $B(-1, -6)$.

2) $f_m$ est un polynome derivable sur $RR$ ; $f_m'(x) = 3m x^2 - 2(m + 2)x + 4 - m$.

$f_m$ admet au plus un extremum si et seulement si $m = 0$ ou $Delta' <= 0$

$arrow.l.r.double m = 0$ ou $Delta' = (m + 2)^2 - 3m(4 - m) <= 0$

$Delta' = 4m^2 - 8m + 4 = 4(m - 1)^2 >= 0$

$f_m$ admet au plus un extremum $arrow.l.r.double m = 0$ ou $m = 1$.

3) $T_A : y = f_m'(1)(x - 1) + f_m(1)$ or $f(1) = 2$

et $f'(1) = 3m - 2(m + 2) + 4 - m = 0$ donc la tangente en $A$ a un coefficient directeur independant de $m$ donc $T_A$ est la tangente commune a $C_m$ pour tout $m in RR$ d'ou toutes les courbes sont tangentes en $A$.

#v(1em)

// Source: Parascolaire Analyse p.218-221

=== Exercice 5 — Corrige

$f_m(x) = frac(1, 3)(2m - 1)x^3 - x^2 + m x$ ; $m in RR$.

A) 1) Soit $M(x, y) in xi_m$ signifie que $y = frac(1, 3)(2m - 1)x^3 - x^2 + m x$

$arrow.l.r.double frac(2, 3) m x^2 - frac(1, 3) x^3 - x^2 + m x - y = 0 arrow.l.r.double m(frac(2, 3) x^3 + x) - frac(1, 3) x^3 - x^2 - y = 0$.

Cette equation est verifiee pour tout $m in RR$, si et seulement si

$cases(frac(2, 3) x^3 + x = 0, -frac(1, 3) x^3 - x^2 - y = 0) arrow.l.r.double cases(x(frac(2, 3) x^2 + 1) = 0 #h(2em) (1), -frac(1, 3) x^3 - x^2 - y = 0 #h(2em) (2))$

// Source: Parascolaire Analyse p.219

l'equation (1) donne $x = 0$ ou $frac(2, 3) x^2 + 1 = 0$ impossible ; donc $x = 0$.

En remplacant dans (2), on trouve $y = 0$.

Donc toutes les courbes $xi_m$ passant par un point fixe $O(0, 0)$.

2) $f_m(x)$ est une fonction polynome donc elle est derivable sur $RR$, et on a : pour tout $x in RR$ ; $f'_m(x) = (2m - 1)x^2 - 2x + m$.

$bullet$ Si $2m - 1 eq.not 0 arrow.l.r.double m eq.not frac(1, 2)$.

$f_m'(x) = 0 arrow.l.r.double (2m - 1)x^2 - 2x + m = 0$

$Delta' = 1 - m(2m - 1) = -2m^2 + m + 1$.

$Delta' = 0 arrow.l.r.double m = 1$ ou $m = -frac(1, 2)$.

#figure(
  table(
    columns: 5,
    align: center,
    stroke: 0.5pt,
    [$m$], [$-infinity$], [$-frac(1, 2)$], [$frac(1, 2)$], [$1$], [$+infinity$],
    [$Delta'$], [$-$], [$0$], [$+$], [], [$0$], [$-$],
  )
)

$1^("er")$ cas : Si $m in ]-frac(1, 2), 1[ - {frac(1, 2)}$ alors $Delta' > 0$ et dans ce cas $f_m'(x)$ s'annule en deux points distincts $x'$ et $x''$.

$ast$ Si de plus $a = 2m - 1 > 0 arrow.l.r.double m in ]frac(1, 2), 1[$ :

$f_m$ admet un maximum en $x'$ et un minimum en $x''$.

$ast$ Si $a = 2m - 1 < 0 arrow.l.r.double m in ]-frac(1, 2), frac(1, 2)[$ :

$f_m$ admet un minimum en $x'$ et un maximum en $x''$.

$2^("eme")$ cas : Si $m in ]-infinity, -frac(1, 2)[ union ]1, +infinity[$ alors $Delta' < 0$ et dans ce cas :

$f_m'(x) eq.not 0$ pour tout $x in RR$ et le signe de $f_m'(x)$ est celui de $a = 2m - 1$.

$3^("eme")$ cas : Si $m in {-frac(1, 2), 1}$ alors $Delta' = 0$.

// Source: Parascolaire Analyse p.220

$ast$ $m = -frac(1, 2)$ alors $Delta' = 0$ et $f'_(frac(1, 2))(x)$ s'annule en un seul point : $x' = x'' = -frac(b', a) = frac(1, 2(-frac(1, 2)) - 1) = frac(-1, 2)$

et le signe de $f'_(frac(1, 2))(x)$ est celui de $a = 2(-frac(1, 2)) - 1 = -2 < 0$, d'ou :

$f'_(frac(1, 2))$ est decroissante sur $RR$.

$ast$ $m = 1$ ; alors $Delta' = 0$ et $f_1'(x)$ s'annule en un seul point :

$x' = x'' = -frac(b', a) = frac(1, 2 dot 1 - 1) = 1$ ; et le signe de $f_1'(x)$ est celui de $a = 2(1) - 1 = 1 > 0$ d'ou :

$f_1$ est croissante sur $RR$.

$bullet$ Si $2m - 1 = 0 arrow.l.r.double m = frac(1, 2)$. $ast$ $f'_(frac(1, 2))(x) = -2x + frac(1, 2)$ et $f'_(frac(1, 2))(x) = 0 arrow.l.r.double x = frac(1, 4)$.

// Source: Parascolaire Analyse p.221

B) 1) $f(x) = a x^3 + b x^2 + c x + d$ alors $f'(x) = 3a x^2 + 2b x + c$.

$ast$ $f$ admette deux extremums $-frac(4, 3)$ et $0$ respectivement en $-2$ et $0$

signifie que $cases(f'(-2) = 0, f'(0) = 0, f(-2) = -frac(4, 3), f(0) = 0) arrow.l.r.double cases(12a - 4b + c = 0, c = 0, -8a + 4b - 2c + d = -frac(4, 3), d = 0)$

$arrow.l.r.double cases(12a - 4b = 0 #h(1em) "(1)+(2) donne" 4a = -frac(4, 3) "d'ou" a = -frac(1, 3), -8a + 4b = -frac(4, 3) #h(1em) "Em remplacant, on trouve" b = -1.)$

D'ou $a = -frac(1, 3)$ ; $b = -1$ ; $c = 0$ ; $d = 0$.

2) Pour $a = -frac(1, 3)$ ; $b = -1$ et $c = d = 0$ on a : $f(x) = -frac(1, 3) x^3 - x^2$.

$f_0(x) = frac(1, 3)(2 times 0 - 1)x^3 - x^2 + 0 dot x = -frac(1, 3) x^3 - x^2 = f(x)$ d'ou $f = f_0$.

a) D'apres A) 2), on a : $O in ]-frac(1, 2), frac(1, 2)[$ donc :

#figure(
  table(
    columns: 4,
    align: center,
    stroke: 0.5pt,
    [$x$], [$-infinity$], [$-2$], [$0$], [$+infinity$],
    [$f'(x) = f_0'(x)$], [$-$], [$0$], [$0$], [$-$],
    [$f(x) = f_0(x)$], [$+infinity arrow.b$], [$-frac(4, 3) arrow.t$], [$0 arrow.b$], [$-infinity$],
  )
)

// Source: Parascolaire Analyse p.222

$ast$ $lim_(x -> -infinity) f(x) = lim_(x -> -infinity) -frac(1, 3) x^3 = +infinity$. $ast$ $lim_(x -> +infinity) f(x) = lim_(x -> +infinity) -frac(1, 3) x^3 = -infinity$.

$ast$ $f(0) = 0$ et $f(-2) = -frac(4, 3)$.

b) $f'(x) = -x^2 - 2x$ alors $f''(x) = -2x - 2$.

$f''(x) = 0 arrow.l.r.double -2x - 2 = 0 arrow.l.r.double x = -1$.

$f''$ s'annule et change de signe en $x = -1$ donc le point :

$I(-1, f(-1)) = (-1, -frac(2, 3))$ est un point d'inflexion.

c) Montrons que $I(-1, -frac(2, 3))$ est un centre de symetrie de $xi$.

$-2 - x in RR$ pour tout $x in RR$.

$f(-2 - x) = -frac(1, 3)(-2 - x)^3 - (-2 - x)^2 = frac(1, 3)(2 + x)^3 - (2 + x)^2$

$= frac(1, 3)(8 + 12x + 6x^2 + x^3) - (x^2 + 4x + 4)$

$= frac(1, 3) x^3 + 2x^2 + 4x + frac(8, 3) - x^2 - 4x - 4 = frac(1, 3) x^3 + x^2 - frac(4, 3)$.

D'autre part $2(-frac(2, 3)) - f(x) = -frac(4, 3) + frac(1, 3) x^3 + x^2$

d'ou $f(-2 - x) = 2(-frac(2, 3)) - f(x)$ donc $I(-1, -frac(2, 3))$ est un centre de symetrie de $xi$.

d) Etude des branches infinies :

$ast$ $lim_(x -> -infinity) frac(f(x), x) = lim_(x -> -infinity) (-frac(1, 3) x^2) = -infinity$

donc $xi$ admet une branche parabolique de direction $(O y)$ au voisinage de $-infinity$.

// Source: Parascolaire Analyse p.223

$ast$ $lim_(x -> +infinity) frac(f(x), x) = lim_(x -> +infinity) (-frac(1, 3) x^2) = -infinity$.

Donc $xi$ admet un branche parabolique de direction $(O y)$ au voisinage de $+infinity$.

$ast$ $f'(-1) = 1$ donc la courbe $xi$ admet une tangente de vecteur directeur $vec(1, 1)$ au point d'inflexion $I$.

$ast$ $f(x) = 0 arrow.l.r.double -frac(1, 3) x^3 - x^2 = 0$

$arrow.l.r.double x^2(frac(1, 3) x + 1) = 0 arrow.l.r.double x = 0$ ou $x = -3$.

3) $Delta_m : y = -m x + p$ et $O(0, 0) in Delta$ donc $p = 0$ d'ou $Delta_m : y = -m x$.

a) Soit $M(x, y) in xi sect Delta_m arrow.l.r.double cases(y = f(x), y = -m x)$ ; $f(x) = -m x$

$arrow.l.r.double -frac(1, 3) x^3 - x^2 = -m x arrow.l.r.double frac(1, 3) x^3 + x^2 - m x = 0 arrow.l.r.double x(frac(1, 3) x^2 + x - m) = 0$

$arrow.l.r.double x = 0$ ou $frac(1, 3) x^2 + x - m = 0$ ; $Delta = 1 + frac(4, 3) m = frac(3 + 4m, 3)$.

$1^("er")$ cas :

Si $3 + 4m > 0 arrow.l.r.double m > -frac(4, 3) arrow.l.r.double Delta > 0$ et donc l'equation :

$frac(1, 3) x^2 + x - m = 0$, admet deux racines distincts $x'$ et $x''$ alors dans ce cas $xi sect Delta_m = {O, M', M''}$ donc il y a $3$ points d'intersection $O(0, 0)$.

$2^("eme")$ cas :

Si $3 + 4m < 0 arrow.l.r.double m < -frac(4, 3) arrow.l.r.double Delta < 0$ et donc l'equation :

$frac(1, 3) x^2 + x - m = 0$ n'admet pas de racine et par suite $xi sect Delta_m = {O}$

// Source: Parascolaire Analyse p.224

donc il y a un seul point d'intersection $O(0, 0)$.

$3^("eme")$ cas :

Si $3 + 4m = 0 arrow.l.r.double m = -frac(4, 3) arrow.l.r.double Delta = 0$ et donc l'equation :

$frac(1, 3) x^2 + x - m = 0$, admet une racine double $x_0 = x' = x''$ et par suite :

$xi sect Delta_m = {O, M_0}$ donc il y a $2$ points d'intersection $O(0, 0)$ et $M_0$ d'abscisse $x_0$.

b) $Delta_m sect xi = {O, M', M''}$ dans ce cas $m in ]-frac(4, 3), +infinity[ - {0}$.

Soit $I_m = M' * M'' arrow.l.r.double cases(x_(I_m) = frac(x' + x'', 2), y_(I_m) = frac(y' + y'', 2))$

Or $x'$ et $x''$ sont solutions de l'equation : $frac(1, 3) x^2 + x - m = 0$ donc

$x' + x'' = S = -frac(b, a) = -3$ et $y' + y'' = -m x' - m x'' = -m(x' + x'') = -3m$

et par suite $cases(x_(I_m) = frac(-3, 2), y_(I_m) = frac(3, 2) m)$ d'ou $I_m (-frac(3, 2), frac(3, 2) m)$ avec $m in ]-frac(4, 3), +infinity[ - {0}$.

c) Soit $H = {I_m (-frac(3, 2), frac(3, 2) m) "avec" m in ]-frac(3, 4), +infinity[}$.

Soit $M(x, y) in H arrow.l.r.double cases(x = frac(-3, 2), y = frac(3, 2) m)$ avec $m in ]-frac(3, 4), +infinity[ - {0}$.

Pour $m = -frac(3, 4)$ ; $y = -frac(9, 8)$. Soit $K(-frac(3, 2), -frac(9, 8))$ et $L(-frac(3, 2), 0)$ donc l'ensemble $H$ est le demi droite $[K L)$ privee de $K$ et $L$.

// Source: Parascolaire Analyse p.225

4) $T : y = f'(1)(x - 1) - frac(4, 3)$ equation de la tangente a $xi$ au point $A$.

Soit $T' = S_I(T)$ ; avec $I(-1, -frac(2, 3))$. Comme la symetrie conserve le contact

Donc $T'$ est la tangente a $xi$ au point $B = S_I(A)$.

$arrow.l.r.double cases(x_I = frac(x_B + x_A, 2), y_I = frac(y_B + y_A, 2)) arrow.l.r.double cases(x_B = 2x_I - x_A, y_B = 2y_I - y_A) arrow.l.r.double cases(x_B = -2 - 1 = -3, y_B = -frac(4, 3) + frac(4, 3) = 0)$

Donc $B(-3, 0)$.

5) a) $g(x) = |frac(1, 3) x^3 + x^2| = |f(x)|$.

Si $f(x) >= 0$ alors $g(x) = f(x)$ et par suite $xi_g = xi_f$.

Si $f(x) <= 0$ alors $g(x) = -f(x)$ et par suite $xi_g = S_((O, arrow(i)))(xi_f)$.

b) D'apres la representation, on peut deduire le tableau de variation de $g$ :

#figure(
  table(
    columns: 5,
    align: center,
    stroke: 0.5pt,
    [$x$], [$-infinity$], [$-3$], [$-2$], [$0$], [$+infinity$],
    [$g(x)$], [$+infinity arrow.b$], [$0 arrow.t frac(4, 3)$], [$arrow.b$], [$0 arrow.t$], [$+infinity$],
  )
)

c) Soit $Delta : y = k$ avec $k in RR$.

Les racines de l'equation $(E_k) : g(x) = k$, sont les abscisses des points d'intersection de $xi'$ et $Delta$.

$1^("er")$ cas : $k in ]-infinity, 0[$ donc $xi' sect Delta = emptyset$ et par suite l'equation $(E_k)$ n'admet pas de solution.

$2^("eme")$ cas : $k = 0$ donc $xi' sect Delta = {2 "points"}$ et par suite l'equation $(E_k)$ admet deux solutions.

$3^("eme")$ cas : $k in ]0, frac(4, 3)[$ donc $xi' sect Delta = {4 "points"}$ et par suite l'equation $(E_k)$ admet quatre solutions.

$4^("eme")$ cas : $k = frac(4, 3)$ donc $xi' sect Delta = {3 "points"}$ et par suite l'equation $(E_k)$ admet trois solutions.

$5^("eme")$ cas : $k in ]frac(4, 3), +infinity[$ donc $xi' sect Delta = {2 "points"}$ et par suite l'equation $(E_k)$ admet deux solutions.


// Source: Parascolaire Analyse p.226

=== Exercice 6 — Corrige

A) 1) $f(x) = 4x^3 - 3x + 1$ ; $D_f = RR$.

$f$ est une fonction polynome donc elle derivable sur $RR$ et on a pour tout $x in RR$ ; $f'(x) = 12x^2 - 3$.

$f(x) = 0 arrow.l.r.double x^2 = frac(1, 4) arrow.l.r.double x = frac(1, 2)$ ou $x = -frac(1, 2)$.

#figure(
  table(
    columns: 4,
    align: center,
    stroke: 0.5pt,
    [$x$], [$-infinity$], [$-frac(1, 2)$], [$frac(1, 2)$], [$+infinity$],
    [$f'(x)$], [$+$], [$0$], [$0$], [$+$],
    [$f(x)$], [$-infinity arrow.t$], [$2 arrow.b$], [$0 arrow.t$], [$+infinity$],
  )
)

$lim_(x -> +infinity) f(x) = lim_(x -> +infinity) 4x^3 = +infinity$ ; $lim_(x -> -infinity) f(x) = lim_(x -> -infinity) 4x^3 = -infinity$.

2) On a : $f'(x) = 12x^2 - 3$ alors $f''(x) = 24x$.

$f''(x) = 0 arrow.l.r.double x = 0$ et on a :

#figure(
  table(
    columns: 3,
    align: center,
    stroke: 0.5pt,
    [$x$], [$-infinity$], [$0$], [$+infinity$],
    [$f''(x)$], [$-$], [$0$], [$+$],
  )
)

$ast$ $f''$ s'annule et change de signe en $0$ donc $I(0, f(0) = 1)$ est un point d'inflexion de $xi$.

$ast$ $2 times 0 - x = -x in RR$ pour tout $x in RR$.

$f(-x) = -4(-x)^3 - 3(-x) + 1 = -4x^3 + 3x + 1$.

$2 times 1 - f(x) = 2 - 4x^3 + 3x - 1 = -4x^3 + 3x + 1$

donc $f(2 times 0 - x) = 2 times 1 - f(x)$ et par suite $I(0, 1)$ est un centre de symetrie de $xi$.

// Source: Parascolaire Analyse p.227

3) $ast$ $lim_(x -> -infinity) frac(f(x), x) = lim_(x -> -infinity) 4x^2 = +infinity = lim_(x -> +infinity) frac(f(x), x)$.

Donc la courbe $xi$ admet une branche parabolique de direction $y'O y$ au voisinage de $plus.minus infinity$.

$ast$ $f(0) = 1$

$ast$ $f(x) = 0 arrow.l.r.double x = -1$.

4) $8x^3 - 6x + m = 0$

$arrow.l.r.double 4x^3 - 3x + frac(m, 2) = 0$

$4x^3 - 3x + 1 = 1 - frac(m, 2) arrow.l.r.double f(x) = 1 - frac(m, 2)$ $(E_m)$

Soit $Delta : y = 1 - frac(m, 2)$ ; les solutions de l'equation $(E_m)$ sont les abscisses des points d'intersection de la courbe $(xi)$ et de la droite $(Delta)$, or d'apres la representation de la courbe $xi$, $xi sect Delta = {3 "points"}$, si et seulement si :

$1 - frac(m, 2) in ]0, 2[ arrow.l.r.double -frac(m, 2) in ]-1, 1[ arrow.l.r.double m in ]-2, 2[$.

Donc l'equation $(E_m)$ admet $3$ solutions distinctes $2$ a $2$, si et seulement si : $m in ]-2, 2[$.

5) Pour tout $x in RR$ ; $-x in RR$, on a :

$h(-x) = -4|-x|^3 + 3|-x| + 1 = -4|x|^3 + 3|x| + 1 = h(x)$ donc $h$ est une fonction paire et par suite sa courbe $H$ admet l'axe $(O arrow(j))$ comme axe de symetrie, donc il suffit de l'etudier sur $RR_-$, or pour $x in RR_-$ ; $|x| = -x$ et par suite $h(x) = 4x^3 - 3x + 1 = f(x)$ donc $H = xi_1 union xi_2$ avec $xi_1$ est la restriction de la courbe $xi$ sur $RR_-$ et $xi_2 = S_((O arrow(j)))(xi_1)$.

// Source: Parascolaire Analyse p.227-228

B) 1) $f_a(x) = frac(4, a^2) x^3 - 3x + a$.

$forall x in RR$ $f_a'(x) = frac(12, a^2) x^2 - 3$ et $f_a'(x) = 0 arrow.l.r.double x^2 = frac(a^2, 4) arrow.l.r.double x = frac(a, 2)$ ou $x = -frac(a, 2)$.

Donc $ast$ Si $a > 0$ ; alors $frac(a, 2) > -frac(a, 2)$.

$ast$ Si $a < 0$ ; alors $frac(a, 2) < -frac(a, 2)$.

et par suite : $ast$ Si $a > 0$ :

#figure(
  table(
    columns: 4,
    align: center,
    stroke: 0.5pt,
    [$x$], [$-infinity$], [$-frac(a, 2)$], [$frac(a, 2)$], [$+infinity$],
    [$f_a'(x)$], [$+$], [$0$], [$0$], [$+$],
  )
)

$ast$ Si $a < 0$ :

#figure(
  table(
    columns: 4,
    align: center,
    stroke: 0.5pt,
    [$x$], [$-infinity$], [$frac(a, 2)$], [$-frac(a, 2)$], [$+infinity$],
    [$f_a'(x)$], [$+$], [$0$], [$0$], [$+$],
  )
)

2) a) D'apres les tableaux de variations de la fonction $f_a$ ; cette fonction admet des extremums en $x = -frac(a, 2)$ et $x = frac(a, 2)$ ; $f_a(-frac(a, 2)) = 2a$ ; $f_a(frac(a, 2)) = 0$.

Donc $M_a(frac(a, 2), 0)$ ; $N_a(-frac(a, 2), 2a)$.

b) $bullet$ Soit $D_a = {M_a(frac(a, 2), 0) ; "avec" a in RR^*}$.

$M(x, y) in D_a$ signifie que $cases(x = frac(a, 2) #h(1em) "avec" a in RR., y = 0)$

$y = 0$ represente l'axe des abscisses et $x = frac(a, 2) eq.not 0$ car $a in RR^*$.

Donc l'ensemble $D_a$ est l'axe des abscisses prive du point $O(0, 0)$.

$bullet$ Soit $D_a' = {N_a(-frac(a, 2), 2a) ; a in RR^*}$.

// Source: Parascolaire Analyse p.229

$M(x, y) in D_a' arrow.l.r.double cases(x = -frac(a, 2), y = 2a) arrow.l.r.double cases(a = -2x eq.not 0, y = -4x)$ car $a in RR^*$.

Donc l'ensemble $D_a'$ est la droite d'equation $y = -4x$ privee du point $O(0, 0)$.

C) 1) $f_1(x) = 4x^3 - 3x + 1$ ; $f_2(x) = x^3 - 3x + 2$.

$g_m(x) = f_1(x) - m f_2(x) = (4 - m)x^3 - 3(1 - m)x + 1 - 2m$.

$g'_m(x) = 3(4 - m)x^2 - 3(1 - m)$.

$1^("er")$ cas : $m = 4$ ; $g_4'(x) = 9 > 0$.

#figure(
  table(
    columns: 2,
    align: center,
    stroke: 0.5pt,
    [$x$], [$-infinity$], [$+infinity$],
    [$g_4'(x)$], [$+$],
    [$g_4(x)$], [$arrow.t$],
  )
)

$2^("eme")$ cas : $m eq.not 4$ ; $g_m'(x) = 0 arrow.l.r.double x^2 = frac(1 - m, 4 - m)$ ;

cherchons le signe de $frac(1 - m, 4 - m)$ :

#figure(
  table(
    columns: 4,
    align: center,
    stroke: 0.5pt,
    [$x$], [$-infinity$], [$1$], [$4$], [$+infinity$],
    [$frac(1 - m, 4 - m)$], [$+$], [$0$], [$+$],
  )
)

Si $m in ]1, 4[$ alors $x^2 = frac(1 - m, 4 - m) < 0$ impossible.

Donc le signe de $g_m'$ est celui de $4 - m > 0$ donc $g_m$ est strictement $arrow.t$.

Si $m in ]-infinity, 1[$ alors $x^2 = frac(1 - m, 4 - m) arrow.l.r.double x = sqrt(frac(1 - m, 4 - m))$ ou $x = -sqrt(frac(1 - m, 4 - m))$.

// Source: Parascolaire Analyse p.230

Si $m in ]4, +infinity[$ alors $x^2 = frac(1 - m, 4 - m) arrow.l.r.double x = -sqrt(frac(1 - m, 4 - m))$ ou $x = sqrt(frac(1 - m, 4 - m))$.

Si $m = 1$ alors $x^2 = 0 arrow.l.r.double x = 0$.

2) $M(x, y) in xi_m arrow.l.r.double y = (4 - m)x^3 - 3(1 - m)x + 1 - 2m$

$arrow.l.r.double m(-x^3 + 3x - 2) + 4x^3 - 3x + 1 - y = 0$.

Cette equation est vraie pour toute valeur de $m$ on a :

$cases(-x^3 + 3x - 2 = 0, 4x^3 - 3x + 1 - y = 0)$

$ast$ $-x^3 + 3x - 2 = 0$ ; on remarque que $1$ est une solution d'ou :

$-x^3 + 3x - 2 = (x - 1)(-x^2 + a x + b) = -x^3 + x^2(a + 1) + x(-a + b) - b$.

Ainsi $a + 1 = 0$ et $-a + b = 3$ et $-2 = -b$.

Par suite $a = -1$ et $b = 2$ ; on obtient : $-x^3 + 3x^2 + x + 2 = 0 arrow.l.r.double x = 1$ ou $-x^2 - x + 2 = 0$

On remarque que : $-1 - 1 + 2 = 0$ d'ou $x' = 1$ et $x'' = frac(c, a) = -2$.

Ainsi toutes les $xi_m$ passant par deux points fixes :

$A(1, g_m(1))$ et $B(-2, g_m(-2))$ avec $g_m(1) = 2$ et $g_m(-2) = -25$.

#v(1em)

// Source: Parascolaire Analyse p.230-231

=== Exercice 7 — Corrige

1) $f(x) = x^4 - x^3 + x^2 - frac(3, 4) x + 1$. $f$ une fonction polynome

donc derivable sur $RR$ et $f'(x) = 4x^3 - 3x^2 + 2x - frac(3, 4)$.

2) a) $g'(x) = 12x^2 - 6x + 2$

b) $g'(x) = 0 arrow.l.r.double 12x^2 - 6x + 2 = 0 arrow.l.r.double Delta' = 3^2 - 24 < 0$ donc $12x^2 - 6x + 2 > 0$.

#figure(
  table(
    columns: 3,
    align: center,
    stroke: 0.5pt,
    [$x$], [$-infinity$], [$frac(1, 2)$], [$+infinity$],
    [$g'(x)$], [], [$+$],
    [$g(x)$], [], [$arrow.t +infinity$],
  )
)

$lim_(x -> -infinity) g = lim_(x -> -infinity) 4x^3 = -infinity$ et $lim_(x -> +infinity) g = lim_(x -> +infinity) 4x^3 = +infinity$ et $g(frac(1, 2)) = 4 dot frac(1, 8) - 3 dot frac(1, 4) + 2 dot frac(1, 2) - frac(3, 4) = 0$

c) Si $x >= frac(1, 2)$ et on a $g$ est strictement croissante sur $RR$

alors $g(x) >= g(frac(1, 2))$ et $g(frac(1, 2)) = 0$ donc $g(x) >= 0$

Si $x <= frac(1, 2)$ et on sait que $g$ est strictement croissante sur $RR$

Alors $g(x) <= g(frac(1, 2))$ et $g(frac(1, 2)) = 0$ donc $g(x) <= 0$

3) a) on a : $f'(x) = g(x)$ d'ou :

#figure(
  table(
    columns: 3,
    align: center,
    stroke: 0.5pt,
    [$x$], [$-infinity$], [$frac(1, 2)$], [$+infinity$],
    [$f'(x)$], [$-$], [$0$], [$+$],
    [$f(x)$], [$+infinity arrow.b$], [$frac(13, 16) arrow.t$], [$+infinity$],
  )
)

$f(frac(1, 2)) = frac(1, 16) - frac(1, 8) + frac(1, 4) - frac(3, 8) + 1 = frac(13, 16) approx 0.81$ et $lim_(+infinity) f = lim_(x -> +infinity) x^4 = +infinity = lim_(-infinity) f$.

b) $ast$ $f'(1) = frac(9, 4)$ et $f(1) = frac(5, 4)$ donc la tangente en $1$ est :

$T : y = f'(1)(x - 1) + f(1)$ alors $T : y = frac(9, 4)(x - 1) + frac(5, 4)$ Soit $T : y = frac(9, 4) x - 1$

$ast$ $f'(-1) = -frac(39, 4)$ et $f(-1) = frac(19, 4)$ donc la tangente en $(-1)$ est :

$T' : y = f'(-1)(x + 1) + f(-1)$

$T' : y = -frac(39, 4) x - 5$.

c) $lim_(x -> -infinity) frac(f(x), x) = lim_(x -> -infinity) x^3 = +infinity = lim_(x -> +infinity) frac(f(x), x)$

Alors $zeta_f$ admet $2$ Blanches paraboliques de directeur $(y y')$ en $+infinity$ et $-infinity$.

#v(1em)

// Source: Parascolaire Analyse p.232-233

=== Exercice 8 — Corrige

1) une fonction polynome du $1^("er")$ degre ne convient pas car elle a pour representative graphique une droite ce n'est pas notre cas.

2) a) $f(x) = -frac(1, 4) x^2 + 2$ definie sur $[0, 4]$ et $f'(x) = -frac(1, 2) x arrow.l.r.double f'(x) = 0 arrow.l.r.double x = 0$

#figure(
  table(
    columns: 3,
    align: center,
    stroke: 0.5pt,
    [$x$], [$0$], [$4$],
    [$f'(x)$], [$0$], [$-$],
    [$f(x)$], [$2 arrow.b$], [$-2$],
  )
)

b) $g(x) = frac(1, 4) x^2 - 2x + 4$ definie sur $[0, 4]$ et $g'(x) = frac(1, 2) x - 2 arrow.l.r.double g'(x) = 0 arrow.l.r.double x = 4$

#figure(
  table(
    columns: 3,
    align: center,
    stroke: 0.5pt,
    [$x$], [$0$], [$4$],
    [$g'(x)$], [$-$], [$0$],
    [$g(x)$], [$4 arrow.b$], [$0$],
  )
)

c) $M in zeta_f sect zeta_g arrow.l.r.double y = f(x)$ et $y = g(x) arrow.l.r.double f(x) = g(x)$ et $y = f(x)$

$ast$ $f(x) = g(x) arrow.l.r.double -frac(1, 4) x^2 + 2 = frac(1, 4) x^2 - 2x + 4 arrow.l.r.double frac(1, 2) x^2 - 2x + 2 = 0 arrow.l.r.double x^2 - 4x + 4 = 0$

$arrow.l.r.double (x - 2)^2 = 0 arrow.l.r.double x = 2$ et $y = f(2) = 1$. Par suite $zeta_f sect zeta_g = {C(2, 1)}$

d) $cases(f'(2) = -1, f(2) = 1)$ et $cases(g'(2) = -1, g(2) = 1)$ donc $cases(f'(2) = g'(2), f(2) = g(2))$

par suite $zeta_f$ et $zeta_g$ ont la meme tangente $T$ en $C$.

f) la tangente en $A$ est horizontale donc parallele au sol la tangente en $B$ est horizontale donc tangente au sol ainsi (1) et (2) son verifie.

3) $P(x) = a x^3 + b x^2 + c x + d$

a) $A in zeta arrow.l.r.double P(0) = 2 arrow.l.r.double d = 2$

b) $B in zeta arrow.l.r.double P(4) = 0 arrow.l.r.double 64a + 16b + 4c + 2 = 0$

$arrow.l.r.double 32a + 8b + 2c + 1 = 0$

On a $P'(x) = 3a x^2 + 2b x + c$ D'apres (1) et (2) on obtient $P(0) = 0$ et $P'(4) = 0$

Ou encore $c = 0$ et $b = -6a$ Comme $32a + 8b + 2c + 1 = 0$

$32a - 48a + 1 = 0$ d'ou $a = frac(1, 16)$ et $b = frac(-3, 8)$

c) $h(x) = frac(1, 16) x^3 - frac(3, 8) x^2 + 2$ definie sur $[0, 4]$

$h'(x) = frac(3, 16) x^2 - frac(6, 8) x = frac(3, 16) x(x - 4)$ et $h'(x) = 0 arrow.l.r.double x = 0$ ou $x = 4$

#figure(
  table(
    columns: 3,
    align: center,
    stroke: 0.5pt,
    [$x$], [$0$], [$4$],
    [$h'(x)$], [$0$], [$-$], [$0$],
    [$h(x)$], [$2 arrow.b$], [$0$],
  )
)

$ast$ $h''(x) = frac(6, 16) x - frac(6, 8)$ ; $h''(x) = 0 arrow.l.r.double x = 2$

#figure(
  table(
    columns: 4,
    align: center,
    stroke: 0.5pt,
    [$x$], [$0$], [$2$], [$4$],
    [$h''(x)$], [$-$], [$0$], [$+$],
  )
)

$zeta_h$ admet au point d'inflexion $u$ point $(2, 1)$ et $h'(2) = frac(-3, 4)$


// Source: Parascolaire Analyse p.233

=== Exercice 9 — Corrige

1) a) faux : $lim_(-infinity) f = 2 arrow.r.double y = 2$ est asymptote a $zeta$ pas $x = 2$.

b) Vrai : $lim_(1) f = +infinity arrow.r.double x = 1$ asymptote a $zeta$.

c) faux : $y = 3$ coupe $zeta$ en $3$ points car sur $[0, 1[$ on a $f(x) >= -1$ donc $f(x) = 3$ admet $1$ solutions soit meme sur $]1, 3]$ et $[3, +infinity]$ on a $f(x) >= 0$ donc $2$ solutions.

2) a) faux : $lim_(x -> 1^-) frac(f(x) - f(1), x - 1) = lim_(x -> 1^-) frac(sqrt(1 - x^2), x - 1) = lim_(x -> 1^-) frac(1 - x^2, (x - 1) sqrt(1 - x^2)) = lim_(x -> 1^-) -frac(x + 1, sqrt(1 - x^2)) = -infinity$

puisque $lim_(1^-) x + 1 = 2$ et $lim_(1^-) sqrt(1 - x^2) = 0$ d'ou $f$ n'est pas derivable en $1$.

b) Vrai : $[-1, 1]$ donc definie en tout point de l'intervalle d'ou $zeta_f$ n'a pas d'asymptote.

4) faux : $f(x) = frac(1, x)$ admet $2$ asymptotes seulement $x = 0$ et $y = 0$ donc pas d'asymptote oblique.

#v(1em)

== Fonction rationnelle de type : $frac(a x + b, c x + 2)$ et $frac(a x^2 + b x + c, d x + c)$

// Source: Parascolaire Analyse p.234

=== Exercice 10 — Corrige

1) $f(x) = frac(x + 1, x - 1)$ ; $D_f = RR - {1}$.

$f$ est une fonction rationnelle donc elle est derivable sur $RR - {1}$ et on a pour tout $x in RR - {1}$ ; $f'(x) = frac(1 times (x - 1) - (x + 1), (x - 1)^2) = frac(-2, (x - 1)^2) < 0$.

#figure(
  table(
    columns: 3,
    align: center,
    stroke: 0.5pt,
    [$x$], [$-infinity$], [$1$], [$+infinity$],
    [$f'(x)$], [$-$], [], [$-$],
    [$f(x)$], [$1 arrow.b$], [$+infinity$ | $-infinity$], [$arrow.b 1$],
  )
)

$bullet$ $lim_(x -> -infinity) f(x) = lim_(x -> -infinity) frac(x, x) = 1$.

$lim_(x -> +infinity) f(x) = lim_(x -> +infinity) frac(x, x) = 1$.

$lim_(x -> 1^-) f(x) = -infinity$ car $lim_(x -> 1^-)(x + 1) = 2$ et $lim_(x -> 1^-)(x - 1) = 0^-$.

$lim_(x -> 1^+) f(x) = +infinity$.

Donc les droites d'equations $x = 1$ et $y = 1$, sont deux asymptotes a $(H)$.

$bullet$ Montrons que $I(1, 1)$ est un centre de symetrie. Pour tout $x in RR$, $2 - x in RR$.

$f(2 - x) = frac(2 - x + 1, 2 - x - 1) = frac(3 - x, 1 - x)$.

$2 - f(x) = 2 - frac(x + 1, x - 1) = frac(x - 3, x - 1) = frac(3 - x, 1 - x)$ ; d'ou $f(2 - x) = 2 - f(x)$

et par suite $I(1, 1)$ est bien un centre de symetrie pour $zeta$.

$ast$ $f(0) = -1$ et $f(x) = 0 arrow.l.r.double x = -1$ donc $f(-1) = 0$ et $f(2) = 3$.

2) Le coefficient de la tangente a $H$ en $A$ est $f'(2) = -2$.

$T'$ est tangente a $(H)$ ayant le meme coefficient directeur que $T$ ;

Signifie que $f'(x_0) = -2$ ou encore $frac(-2, (x_0 - 1)^2) = -2$

$arrow.l.r.double (x_0 - 1)^2 = 1 arrow.l.r.double x_0 - 1 = -1$ ou $x_0 - 1 = 1 arrow.l.r.double x_0 = 2$ ou $x_0 = 0$

or $x_0 = 2$ est l'abscisse du point $A$ donc l'autre point de contact est le

// Source: Parascolaire Analyse p.235

point $A'$ d'abscisse $0$.

$bullet$ $A(2, 3)$ ; $I(1, 1)$ ; $A'(0, -1)$.

$overline(A I) vec(-1, -2)$ ; $overline(A' I) vec(1, 2)$. En remarque que $overline(A' I) = -overline(A I)$. donc $A$, $I$ et $A'$ sont alignes.

3) $D : y = -2x + m$.

Soit $M(x, y) in H sect D arrow.l.r.double cases(y = frac(x + 1, x - 1), y = -2x + m #h(1em) "alors" frac(x + 1, x - 1) = -2x + m, x in RR - {1})$

$arrow.l.r.double x + 1 = (-2x + m)(x - 1) arrow.l.r.double x + 1 = -2x^2 + 2x + m x - m$

$arrow.l.r.double -2x^2 + x(1 + m) - m - 1 = 0$ $(E_m)$.

$Delta = (1 + m)^2 - 8(m + 1) = m^2 - 6m - 7$.

#figure(
  table(
    columns: 4,
    align: center,
    stroke: 0.5pt,
    [$m$], [$-infinity$], [$-1$], [$7$], [$+infinity$],
    [$m^2 - 6m - 7$], [$+$], [$0$], [$0$], [$+$],
  )
)

$ast$ Si $m in ]-1, 7[$ ; $Delta < 0$ donc l'equation $(E_m)$ n'admet pas des racines et par suite $H sect D = emptyset$.

$ast$ Si $m in ]-infinity, -1[ union ]7, +infinity[$ ; $Delta > 0$ donc l'equation $(E_m)$ admet deux racines distinctes $x'$ et $x''$ et par suite $H sect D = {M', M''}$ avec $M'(x', f(x'))$ et $M''(x'', f(x''))$.

$ast$ Si $m = -1$ ou $m = 7$ ; $Delta = 0$ donc l'equation $(E_m)$ admet une racine double $x = x' = x''$ et par suite : Done la droite $D$ rencontre $H$ en deux points $M'$ et $M''$ distincts ou confondus si et seulement si $m in ]-infinity, -1] union [7, +infinity[$.

// Source: Parascolaire Analyse p.235-236

4) $H sect D = {M', M''}$ pour $m in ]-infinity, -1] union [7, +infinity[$.

$J = M' * M''$ donc $cases(x_J = frac(x' + x'', 2), y_J = frac(y' + y'', 2))$

Or $x'$ et $x''$ sont les solutions de l'equation $(E_m)$ et par suite :

$x' + x'' = -frac(b, a) = frac(1 + m, 2)$ et $y' + y'' = -2(x' + x'') + 2m = -1 - m + 2m = m - 1$ ;

d'ou $cases(x_J = frac(1 + m, 4), y_J = frac(m - 1, 2))$ donc $J(frac(1 + m, 4), frac(m - 1, 2))$.

Soit $E = {J(frac(1 + m, 4), frac(m - 1, 2)) "avec" m in ]-infinity, -1] union [7, +infinity[}$.

Soit $M(x, y) in E$ signifie que $cases(x = frac(1 + m, 4) #h(1em) (1), y = frac(m - 1, 2) #h(1em) (2))$ ; (1) $arrow.l.r.double 2x = 5 - m arrow.l.r.double m = 5 - 2x$.

En remplacant dans (2), on obtient : $y = -x + frac(5, 2)$.

$ast$ pour $m = -1$ ; $x = 0$ et $y = -1$. Soit $A(0, -1)$.

$ast$ pour $m = 1$ ; $x = 2$ et $y = 3$. Soit $B(2, 3)$.

Donc $E$ est la droite $D_1 : y = -x + frac(5, 2)$, privee du segment $[A B]$.

#v(1em)

// Source: Parascolaire Analyse p.236-238

=== Exercice 11 — Corrige

I) a) $Delta : y = 2$ est une asymptote horizontale a $zeta_m$ signifie que $lim_(x -> +infinity) f(x) = 2$

or $lim_(x -> +infinity) f(x) = lim_(x -> +infinity) frac(m x, 2x) = frac(m, 2)$ donc $Delta : y = 2$ est une asymptote horizontale a $zeta_m$ si et seulement si $frac(m, 2) = 2 arrow.l.r.double m = 4$.

b) $Delta : x = 1$ est une asymptote verticale a $zeta_m$ signifie que $lim_(x -> 1) f(x) = +infinity$

or $lim_(x -> 1) f(x) = lim_(x -> 1) frac(m x + 2 - m, 2x + m - 5) = frac(2, m - 3)$.

pour avoir la limite $+infinity$, il faut donc $m - 3 = 0 arrow.l.r.double m = 3$.

2) $f$ est une fonction rationnelle donc elle est derivable sur $D_f = RR - {frac(5 - m, 2)}$.

Et on a pour tout $x in RR - {frac(5 - m, 2)}$ :

$f_m'(x) = frac(m(2x + m - 5) - 2(m x + 2 - m), (2x + m - 5)^2) = frac(m^2 - 3m - 4, (2x + m - 5)^2)$

$f_m'(x)$ a le meme signe que $m^2 - 3m - 4$.

$m^2 - 3m - 4 = 0$ ; $a - b + c = 0$ donc $m = -1$ ou $m = 4$.

#figure(
  table(
    columns: 4,
    align: center,
    stroke: 0.5pt,
    [$m$], [$-infinity$], [$-1$], [$4$], [$+infinity$],
    [$m^2 - 3m - 4$], [$+$], [$0$], [$0$], [$+$],
  )
)

$ast$ $1^("er")$ cas : si $m in ]-infinity, -1[ union ]4, +infinity[$ alors $f_m'(x) > 0$.

$ast$ $2^("eme")$ cas : Si $m in ]-1, 4[$ alors $f_m'(x) < 0$.

$ast$ $3^("eme")$ cas : Si $m in {-1, 4}$.

$bullet$ Si $m = -1$ ; $f_(-1)(x) = frac(-x + 3, 2(x - 3)) = -frac(1, 2)$ pour $x in RR - {3}$.

Donc $f_(-1)$ est constante avec $D f_(-1) = RR - {3}$.

$bullet$ Si $m = 4$ ; $f_4(x) = frac(4x - 2, 2x - 1) = 2$ pour $x in RR - {frac(1, 2)}$ donc $f_4$ est constante avec $D f_4 = RR - {frac(1, 2)}$.

3) Soit $M(x, y) in zeta_m$ signifie que $y = f_m(x) arrow.l.r.double y = frac(m x + 2 - m, 2x + m - 5)$

$arrow.l.r.double y(2x + m - 5) = m x + 2 - m arrow.l.r.double 2x y + m y - 5y - m x - 2 + m = 0$

$arrow.l.r.double m(y + 1 - x) + 2x y - 5y - 2 = 0$. Cette equation est verifiee pour tout $m in RR - {-1, 4}$ si et seulement si $cases(y + 1 - x = 0 #h(1em) (1), 2x y - 5y - 2 = 0 #h(1em) (2))$

d'apres (1) on a : $y = x - 1$ et en remplacant dans (2), on obtient :

$2x(x - 1) - 5(x - 1) - 2 = 0 arrow.l.r.double 2x^2 - 7x + 3 = 0$ d'ou $x = frac(1, 2)$ ou $x = 3$.

$bullet$ pour $x = frac(1, 2)$ ; $y = -frac(1, 2)$ et pour $x = 3$ ; $y = 2$. Donc toutes les courbes $zeta_m$

passent par deux points fixes : $A(frac(1, 2), -frac(1, 2))$ et $B(3, 2)$.

3) les equations des asymptotes sont : $Delta : y = frac(m, 2)$ et $Delta' : x = frac(5 - m, 2)$.

// Source: Parascolaire Analyse p.238

Soit $I_m (x, y) Delta sect Delta' arrow.l.r.double cases(x = frac(5 - m, 2), y = frac(m, 2))$ donc $I_m (frac(5 - m, 2), frac(m, 2))$

on pose $E_m = {I_m (frac(5 - m, 2), frac(m, 2)) "avec" m in RR - {-1, 4}}$.

Soit $M(x, y) in E_m arrow.l.r.double cases(x = frac(5 - m, 2) #h(1em) (1), y = frac(m, 2) #h(1em) (2))$ ; (1) $arrow.l.r.double 2x = 5 - m arrow.l.r.double m = 5 - 2x$.

En remplacant dans (2), on obtient : $y = -x + frac(5, 2)$.

$ast$ pour $m = -1$ ; $x = 3$ et $y = -frac(1, 2)$. Soit $J(3, -frac(1, 2))$.

$ast$ pour $m = 4$ ; $x = frac(1, 2)$ et $y = 2$. Soit $K(frac(1, 2), 2)$.

Donc $I_m$ varie sur une droite $D : y = -x + frac(5, 2)$, privee des deux point $J$ et $K$.

5) $f_1(x) = frac(x + 1, 2x - 4)$ ; $m = 1 in ]-1, 4[$ donc d'apres 2), $f'_m(x) < 0$ et on a :

#figure(
  table(
    columns: 3,
    align: center,
    stroke: 0.5pt,
    [$x$], [$-infinity$], [$2$], [$+infinity$],
    [$f'_1(x)$], [$-$], [], [$-$],
    [$f_1(x)$], [$frac(1, 2) arrow.b$], [$+infinity$ | $-infinity$], [$arrow.b frac(1, 2)$],
  )
)

Les droites d'equations $x = 2$ et $y = frac(1, 2)$, sont deux asymptotes a $zeta_1$.

6) $g(x) = frac(|x + 1|, 2x - 4) = cases(frac(x + 1, 2x - 4) "si" x >= -1, -frac(x + 1, 2x - 4) "si" x <= -1)$

Donc $g(x) = cases(f(x) "si" x in ]-1, +infinity[, -f(x) "si" x in ]-infinity, -1[)$ et par suite :

$bullet$ $zeta_g = C_f$ si $x in ]-1, +infinity[$. $bullet$ $zeta_g = S_((O arrow(i)))(zeta_g)$ si $x in ]-infinity, -1[$.


// Source: Parascolaire Analyse p.239

=== Exercice 12 — Corrige

$f(x) = frac(x^2 - x + 1, x - 2)$ ; $D_f = RR - {2}$

1) $f(x) = a x + b + frac(c, x - 2) = frac((a x + b)(x - 2) + c, x - 2) = frac(a x^2 - 2a x + b x - 2b + c, x - 2)$

$= frac(a x^2 + (-2a + b)x - 2b + c, x - 2) = frac(x^2 - x + 1, x - 2)$ si et seulement si :

$cases(a = 1, -2a + b = -1, -2b + c = 1) arrow.l.r.double cases(a = 1, b = 1, c = 3)$ d'ou $f(x) = x + 1 + frac(3, x - 2)$.

2) $f(x)$ est une fonction rationnelle donc est derivable sur son domaine $RR - {2}$ et on a : pour tout $x in RR - {2}$ ; $f'(x) = 1 - frac(3, (x - 2)^2) = frac(x^2 - 4x + 1, (x - 2)^2)$

Le signe de $f'(x)$ et celui de $x^2 - 4x + 1$.

$x^2 - 4x + 1 = 0$ ; $Delta' = 4 - 1 = 3$ d'ou $x = 2 - sqrt(3)$ ou $x = 2 + sqrt(3)$.

#figure(
  table(
    columns: 5,
    align: center,
    stroke: 0.5pt,
    [$x$], [$-infinity$], [$2 - sqrt(3)$], [$2$], [$2 + sqrt(3)$], [$+infinity$],
    [$x^2 - 4x + 1$], [$+$], [$0$], [$-$], [$0$], [$+$],
  )
)

Donc

#figure(
  table(
    columns: 5,
    align: center,
    stroke: 0.5pt,
    [$x$], [$-infinity$], [$2 - sqrt(3)$], [$2$], [$2 + sqrt(3)$], [$+infinity$],
    [$f'(x)$], [$+$], [$0$], [$-$], [$0$], [$+$],
    [$f(x)$], [$-infinity arrow.t$], [$3 - 2 sqrt(3) arrow.b$], [$-infinity$ | $+infinity$], [$arrow.b 3 + 2 sqrt(3)$], [$arrow.t +infinity$],
  )
)

3) a) $ast$ $lim_(x -> -infinity) [f(x) - (x + 1)] = lim_(x -> -infinity) frac(3, x - 2) = 0$ de meme :

$lim_(x -> +infinity) [f(x) - (x + 1)] = lim_(x -> +infinity) frac(3, x - 2) = 0$ donc la droite $Delta$ d'equation :

$y = x + 1$ est une asymptote a $zeta$ au voisinage de $+infinity$ et $-infinity$.

$ast$ $lim_(x -> 2^-) f(x) = -infinity$ et $lim_(x -> 2^+) f(x) = +infinity$ donc la droite $D$ d'equation : $x = 2$

// Source: Parascolaire Analyse p.240

est une asymptote a $zeta$.

Soit $I(x, y) in Delta sect D arrow.l.r.double cases(y = x + 1, x = 2) arrow.l.r.double cases(x = 2, y = 3)$ donc $I(2, 3)$.

$ast$ Montrons que $I(2, 3)$ est un centre de symetrie de $zeta$.

$x eq.not -2 arrow.l.r.double -x eq.not -2 arrow.l.r.double 4 - x eq.not 2$

d'ou $4 - x in RR - {2}$.

$bullet$ $f(4 - x) = frac((4 - x)^2 - (4 - x) + 1, 4 - x - 2) = frac(16 - 8x + x^2 - 4 + x + 1, 2 - x) = frac(x^2 - 7x + 13, 2 - x)$.

$bullet$ $6 - f(x) = 6 - frac(x^2 - x + 1, x - 2) = frac(6x - 12 - x^2 + x - 1, x - 2) = frac(-x^2 + 7x - 13, x - 2) = frac(x^2 - 7x + 13, 2 - x)$

D'ou $f(4 - x) = 6 - f(x)$ donc $I(2, 3)$ est un centre de symetrie de $zeta$.

4) Soit $(E_m) : x^2 - (m + 1)x + 2m + 1 = 0 arrow.l.r.double x^2 - x + 1 + m(2 - x) = 0$

$arrow.l.r.double x^2 - x + 1 = m(x - 2)$ pour tout $x in RR - {2}$

$arrow.l.r.double frac(x^2 - x + 1, x - 2) = m$ ; soit $D : y = m$.

Donc les solutions de l'equation $(E_m)$ sont les abscisses des points d'intersection de la courbe $(zeta)$ avec la droite $Delta_m$.

$1^("er")$ cas : Si $m in ]-infinity, 2 - sqrt(3)[ union ]2 + sqrt(3), +infinity[$ donc $D sect zeta = {2 "points"}$ donc l'equation $(E_m)$ admet deux solutions distinctes.

$2^("eme")$ cas : Si $m in {2 - sqrt(3) ; 2 + sqrt(3)}$ ; $D sect zeta = {1 "point"}$ donc l'equation $(E_m)$ admet une seule solution.

$3^("eme")$ cas : Si $m in ]2 - sqrt(3) ; 2 + sqrt(3)[$ ; $D sect zeta = emptyset$ donc l'equation $(E_m)$ n'admet pas de solution.

// Source: Parascolaire Analyse p.241

5) soit $D : y = m$ ;

$D sect zeta = {M', M''}$ si et seulement si $m in ]-infinity, 2 - sqrt(3)[ union ]2 + sqrt(3), +infinity[$.

Soit $x'$ et $x''$ sont les abscisses respectives des points $M'$ et $M''$.

$x'$ et $x''$ sont les solutions de l'equation : $x^2 - (m + 1)x + 2m + 1 = 0$ ;

Donc $x' + x'' = -frac(b, a) = m + 1$ et $y' + y'' = -m x' - m x'' = -m(x' + x'')$

$I = M' * M''$ : $x_I = frac(x' + x'', 2) = frac(m + 1, 2)$ et $y_I = frac(y' + y'', 2) = frac(2m, 2) = m$

Donc $I(frac(m + 1, 2), m)$ avec $m in ]-infinity, 2 - sqrt(3)[ union ]2 + sqrt(3), +infinity[$.

a) $H = {I(frac(m + 1, 2), m) "avec" m in ]-infinity, 2 - sqrt(3)[ union ]2 + sqrt(3), +infinity[}$

Soit $M(x, y) in H$ signifie que $cases(x = frac(m + 1, 2), y = m) arrow.l.r.double cases(m = 2x - 1, y = 2x - 1)$

$ast$ pour $m = 2 - sqrt(3)$ ; $x = frac(3 - sqrt(3), 2)$ et $y = 2 - sqrt(3)$. Soit $K(frac(3 - sqrt(3), 2), 2 - sqrt(3))$.

$ast$ pour $m = 2 + sqrt(3)$ ; $x = frac(3 + sqrt(3), 2)$ et $y = 2 + sqrt(3)$. Soit $L(frac(3 + sqrt(3), 2), 2 + sqrt(3))$.

Donc l'ensemble $H$ est la droite $D_1 : y = 2x - 1$, privee du segment $[K L]$.

b) $O M' M''$ est rectangle en $O$, si et seulement si $overline(O M') dot overline(O M'') = 0$.

$overline(O M') vec(x', m)$ et $overline(O M'') vec(x'', m)$.

$overline(O M') dot overline(O M'') = 0. arrow.l.r.double x' x'' + m^2 = 0$ or $x' x'' = frac(c, a) = 2m + 1$

donc $overline(O M') dot overline(O M'') = 0. arrow.l.r.double 2m + 1 + m^2 = 0 arrow.l.r.double (m + 1)^2 = 0 arrow.l.r.double m = -1$.


// Source: Parascolaire Analyse p.242

=== Exercice 13 — Corrige

A) a) $ast$ $lim_(x -> (frac(1, 2))^-) f_m(x) = lim_(x -> (frac(1, 2))^-) 2x + 1 + frac(m - 3, 2x - 1)$.

$lim_(x -> (frac(1, 2))^-) 2x + 1 = 2$ et $lim_(x -> (frac(1, 2))^-) (2x - 1) = 0^-$ donc :

$bullet$ Si $m > 3$ alors $lim_(x -> (frac(1, 2))^-) f_m(x) = -infinity$ $bullet$ Si $m < 3$ alors $lim_(x -> (frac(1, 2))^-) f_m(x) = +infinity$

$ast$ $lim_(x -> (frac(1, 2))^+) f_m(x) = lim_(x -> (frac(1, 2))^+) 2x + 1 + frac(m - 3, 2x - 1)$ ; $lim_(x -> (frac(1, 2))^+) (2x - 1) = 0^+$ donc :

$bullet$ Si $m > 3$ alors $lim_(x -> (frac(1, 2))^+) f_m(x) = +infinity$. Si $m < 3$ alors $lim_(x -> (frac(1, 2))^+) f_m(x) = -infinity$.

$ast$ $lim_(x -> +infinity) f_m(x) = lim_(x -> +infinity) 2x + 1 + frac(m - 3, 2x - 1) = +infinity$ car $cases(lim_(x -> +infinity) 2x + 1 = +infinity, lim_(x -> +infinity) frac(m - 3, 2x - 1) = 0)$

$ast$ $lim_(x -> -infinity) f_m(x) = lim_(x -> -infinity) 2x + 1 + frac(m - 3, 2x - 1) = -infinity$

b) $f_m$ est une fonction rationnelle donc elle est derivable sur son domaine : $RR - {frac(1, 2)}$ et on a : pour tout $x in RR - {frac(1, 2)}$ ;

// Source: Parascolaire Analyse p.243

$f_m'(x) = -2 - frac(2(m - 3), (2x - 1)^2) = frac(2[(2x - 1)^2 - (m - 3)], (2x - 1)^2)$ et $f_m'(x) = 0 arrow.l.r.double (2x - 1)^2 = (m - 3) = 0 arrow.l.r.double (2x - 1)^2 = m - 3$.

$bullet$ Si $m < 3$ alors $(2x - 1)^2 = m - 3$ impossible.

D'ou $f_m'(x) eq.not 0$ pour tout $x in RR - {frac(1, 2)}$ Et par suite $f_m'(x) > 0$

#figure(
  table(
    columns: 3,
    align: center,
    stroke: 0.5pt,
    [$x$], [$-infinity$], [$frac(1, 2)$], [$+infinity$],
    [$f_m'(x)$], [$+$], [], [$+$],
  )
)

$bullet$ Si $m > 3$ alors $(2x - 1)^2 = m - 3 arrow.l.r.double 2x - 1 = sqrt(m - 3)$ ou $2x - 1 = -sqrt(m - 3)$

$arrow.l.r.double x = frac(sqrt(m - 3) + 1, 2)$ ou $x = frac(1 - sqrt(m - 3), 2)$

#figure(
  table(
    columns: 5,
    align: center,
    stroke: 0.5pt,
    [$x$], [$-infinity$], [$frac(1 - sqrt(m - 3), 2)$], [$frac(1, 2)$], [$frac(1 + sqrt(m - 3), 2)$], [$+infinity$],
    [$f_m'(x)$], [$+$], [$0$], [$-$], [$0$], [$+$],
  )
)

2) $bullet$ Montrons que la droite $Delta : y = 2x + 1$ est une asymptote oblique au voisinage de l'infinie.

$ast$ $lim_(x -> +infinity) [f_m(x) - (2x + 1)] = lim_(x -> +infinity) frac(m - 3, 2x - 1) = 0$. $ast$ $lim_(x -> -infinity) [f_m(x) - (2x + 1)] = lim_(x -> -infinity) frac(m - 3, 2x - 1) = 0$.

Donc $Delta : y = 2x + 1$ est une asymptote oblique commune a toutes les courbes $(zeta_m)$.

D'apres 1) a), on a : $lim_(x -> (frac(1, 2))^-) f_m(x) = cases(-infinity "si" m > 3, +infinity "si" m < 3)$ et $lim_(x -> (frac(1, 2))^+) f_m(x) = cases(+infinity "si" m > 3, -infinity "si" m < 3)$

alors $D : x = frac(1, 2)$ est une asymptote commune a toutes les courbes $(zeta_m)$.

// Source: Parascolaire Analyse p.244

$bullet$ Montrons que $W(frac(1, 2), 2)$ est un centre de symetrie pour $(zeta_m)$.

$ast$ $x in RR - {frac(1, 2)}$ signifie que $x eq.not frac(1, 2) arrow.l.r.double -x eq.not -frac(1, 2) arrow.l.r.double 1 - x eq.not frac(1, 2)$ d'ou $1 - x in RR - {frac(1, 2)}$

$ast$ $f_m(1 - x) = 2(1 - x) + 1 + frac(m - 3, 2(1 - x) - 1) = 3 - 2x + frac(m - 3, 1 - 2x)$.

$ast$ $4 - f_m(x) = 4 - 2x - 1 - frac(m - 3, 2x - 1) = 3 - 2x + frac(m - 3, -2x + 1) = f_m(1 - x)$

D'ou $W(frac(1, 2), 2)$ est un centre de symetrie pour $(zeta_m)$.

3) $S(1, 4)$ soit un sommet de $(zeta_m)$ signifie que $cases(f_m'(1) = 0, f_m(1) = 4)$

Or $f'_m(1) = 8 - 2m$ ; $f_m(1) = 3 + m - 3 = m$

$cases(f'_m(1) = 0, f_m(1) = 4) arrow.l.r.double cases(8 - 2m = 0, m = 4)$ c'est verifiee.

Donc $S(1, 4)$ est un sommet de $(zeta_m)$ si et seulement si $m = 4$.

B) 1) $m = 4$ donc $m > 3$.

#figure(
  table(
    columns: 5,
    align: center,
    stroke: 0.5pt,
    [$x$], [$-infinity$], [$0$], [$frac(1, 2)$], [$1$], [$+infinity$],
    [$f'_4(x)$], [$+$], [$0$], [$-$], [$0$], [$+$],
    [$f_4(x)$], [$-infinity arrow.t$], [$0 arrow.b$], [$-infinity$ | $+infinity$], [$arrow.b 4$], [$arrow.t +infinity$],
  )
)

$lim_(x -> +infinity) f_4(x) = lim_(x -> +infinity) 2x = +infinity$ ;

$lim_(x -> -infinity) f_4(x) = lim_(x -> -infinity) 2x = -infinity$.

On a : $Delta : y = 2x + 1$ est une asymptote oblique au voisinage de $+infinity$ ;

et $Delta' : x = frac(1, 2)$ est une asymptote verticale.

// Source: Parascolaire Analyse p.245

2) a) $g(x) = 2x + 1 + frac(1, |2x - 1|)$ alors $D_g = RR - {frac(1, 2)}$.

#figure(
  table(
    columns: 3,
    align: center,
    stroke: 0.5pt,
    [$x$], [$-infinity$], [$frac(1, 2)$], [$+infinity$],
    [$2x - 1$], [$-$], [], [$+$],
    [$|2x - 1|$], [$-2x + 1$], [], [$2x - 1$],
  )
)

D'ou $g(x) = cases(f_4(x) "si" x in ]frac(1, 2), +infinity[, 2x + 1 - frac(1, 2x - 1) "si" x in ]-infinity, frac(1, 2)[)$

$bullet$ Si $x in ]frac(1, 2), +infinity[$ ; on a : $g(x) = f_4(x)$ donc

#figure(
  table(
    columns: 3,
    align: center,
    stroke: 0.5pt,
    [$x$], [$frac(1, 2)$], [$1$], [$+infinity$],
    [$g'(x)$], [$-$], [$0$], [$+$],
    [$g(x)$], [$infinity arrow.b$], [$4 arrow.t$], [$+infinity$],
  )
)

$bullet$ Si $x in ]-infinity, frac(1, 2)[$ ; on a : $g(x) = 2x + 1 - frac(1, 2x - 1)$ alors $g'(x) = 2 + frac(2, (2x + 1)^2) > 0$.

#figure(
  table(
    columns: 2,
    align: center,
    stroke: 0.5pt,
    [$x$], [$-infinity$], [$frac(1, 2)$],
    [$g'(x)$], [$+$],
    [$g(x)$], [$-infinity arrow.t$], [$+infinity$],
  )
)

b) $bullet$ $Delta : y = 2x + 1$ est une asymptote oblique a $(zeta')$.

$bullet$ $D : x = frac(1, 2)$ est une asymptote verticale a $(zeta')$.

$bullet$ $g(0) = 0$.

c) $(E_m) : |2x - 1| dot (m - 2x - 1) = 1 arrow.l.r.double m - 2x - 1 = frac(1, |2x - 1|)$

$arrow.l.r.double frac(1, |2x - 1|) + 2x + 1 = m arrow.l.r.double g(x) = m$.

Soit $D_m : y = m$ ; donc les solutions de l'equation $(E_m)$ sont les abscisses des points d'intersection de $D_m$ et $(zeta')$ donc :

// Source: Parascolaire Analyse p.246

$1^("er")$ cas : $m in ]-infinity, 4[$ ; $D_m sect C' = {1 "point"}$, donc l'equation $(E_m)$ admet une seule solution.

$2^("eme")$ cas : $m = 4$ ; $D_m sect zeta' = {2 "points"}$, donc l'equation $(E_m)$ admet deux solutions.

$3^("eme")$ cas : $m in ]4, +infinity[$ ; $D_m sect zeta' = {3 "points"}$, donc l'equation $(E_m)$ admet trois solutions.

C) 1) $M(x, y)_R arrow.l.r.double overline(O M) = x arrow(i) + y arrow(j)$.

$M(X, Y)_(R') arrow.l.r.double overline(I M) = X arrow(e_1) + Y arrow(e_2)$.

$overline(O M) = overline(O I) + overline(I M) = frac(1, 2) arrow(i) + 2 arrow(j) + X(arrow(i) + 2 arrow(j)) + Y arrow(j)$.

$overline(O M) = (frac(1, 2) + X) arrow(i) + (2 + 2X + Y) arrow(j)$ or $overline(O M) = x arrow(i) + y arrow(j)$ d'ou $cases(x = frac(1, 2) + X, y = 2 + 2X + Y)$

$zeta : y = 2x + 1 + frac(1, 2x - 1)$ d'ou $2 + 2X + Y = 2(frac(1, 2) + X) + 1 + frac(1, 2(frac(1, 2) + X) - 1)$

ou encore : $2 + 2X + Y = 1 + 1 + 2X + frac(1, 1 + 2X - 1)$ et par suite $zeta : Y = frac(1, 2X)$ dans le repere $R'$.

2) $T : Y = f'(X_0)(X - X_0) + f(X_0)$ est l'equation de la tangente a $zeta$ au point $M_0$ d'abscisse $X_0$ dans le repere $R'$ or $f'(X_0) = -frac(1, 2X_0^2)$ ; $f(X_0) = frac(1, 2X_0)$.

D'ou $T : Y = -frac(1, 2X_0^2)(X - X_0) + frac(1, 2X_0)$

$T : Y = -frac(1, 2X_0^2) X + frac(1, 2X_0) + frac(1, 2X_0)$ d'ou $T : Y = -frac(1, 2X_0^2) X + frac(1, X_0)$.

3) Dans le repere $R'$, l'equation de la courbe $zeta$ est : $Y = frac(1, 2X)$.

Donc les asymptotes sont $D_1 : Y = 0$ et $D_2 : X = 0$.

Car $lim_(X -> +infinity) f(X) = 0$ ; $lim_(X -> 0^+) f(X) = +infinity$ et $lim_(X -> 0^-) f(X) = -infinity$

On a :

$bullet$ $M(X, Y) in D_1 sect T = {A(2X_0, 0)}$

$bullet$ $D_2 sect T = {B(0, frac(1, X_0))}$. Montrons que $S_(M_0)(A) = B$.

$cases(frac(X_A + X_B, 2) = frac(2X_0 + 0, 2) = X_0, frac(Y_A + Y_B, 2) = frac(0 + frac(1, X_0), 2) = frac(1, 2X_0))$

or $M_0(X_0 ; f(X_0) = frac(1, 2X_0))$ donc $A * B = M_0$ d'ou $S_(M_0)(A) = B$

et par suite la propriete "$P$" est bien verifiee.


// Source: Parascolaire Analyse p.247

=== Exercice 14 — Corrige

A) 1) $f_m(x) = frac(x^2 + m x + 4, x - 1)$ ; $D f_m = RR - {1}$.

a) $f_m$ est une fonction rationnelle donc elle est derivable sur son domaine $RR - {1}$ et on a pour tout $x in RR - {1}$.

$f_m'(x) = frac((2x + m)(x - 1) - (x^2 + m x + 4), (x - 1)^2) = frac(x^2 - 2x - m - 4, (x - 1)^2)$.

// Source: Parascolaire Analyse p.248

b) $lim_(x -> 1) f_m(x) = lim_(x -> 1) frac(x^2 + m x + 4, x - 1)$.

#figure(
  table(
    columns: (auto, auto, auto),
    align: center,
    stroke: 0.5pt,
    [$m$], [$-infinity$], [$-5$], [$+infinity$],
    [$5 + m$], [$-$], [$0$], [$+$],
  )
  ,
  table(
    columns: (auto, auto, auto),
    align: center,
    stroke: 0.5pt,
    [$x$], [$-infinity$], [$1$], [$+infinity$],
    [$x - 1$], [$-$], [$0$], [$+$],
  )
)

$lim_(x -> 1)(x^2 + m x + 4) = 5 + m$ et $lim_(x -> 1)(x - 1) = 0$.

Donc il est necessaire d'etudier la limite a droite et a gauche en $1$ ;

Et on a $lim_(x -> 1^-)(x - 1) = 0^-$ et $lim_(x -> 1^+)(x - 1) = 0^+$.

$1^("er")$ cas : $m eq.not -5$.

D'ou $lim_(x -> 1^-) f_m(x) = cases(-infinity "si" m in ]-5, +infinity[, +infinity "si" m in ]-infinity, -5[)$ et $lim_(x -> 1^+) f_m(x) = cases(+infinity "si" m in ]-5, +infinity[, -infinity "si" m in ]-infinity, -5[)$

$2^("eme")$ cas : $m = -5$ ; $lim_(x -> 1) frac(x^2 - 5x + 4, x - 1) = lim_(x -> 1) frac((x - 1)(x - 4), (x - 1)) = -3$.

2) $f'_m(x) = 0 arrow.l.r.double x^2 - 2x - m - 4 = 0$ ; $Delta' = m + 5$.

$f_m$ admet deux extremums si et seulement si $m + 5 > 0 arrow.l.r.double m > -5$ et dans ce cas

$f'_m(x) = 0 arrow.l.r.double x' = 1 - sqrt(m + 5)$ ou $x'' = 1 + sqrt(m + 5)$

#figure(
  table(
    columns: 5,
    align: center,
    stroke: 0.5pt,
    [$x$], [$-infinity$], [$x'$], [$1$], [$x''$], [$+infinity$],
    [$f'_m(x)$], [$+$], [$0$], [$-$], [$0$], [$+$],
    [$f_m(x)$], [$arrow.t f(x')$], [$arrow.b$], [$+infinity$ | $-infinity$], [$arrow.b f(x'')$], [$arrow.t$],
  )
)

3) a) $M(x, y) in zeta_m arrow.l.r.double y = f_m(x)$

$arrow.l.r.double x^2 + m x + 4 = y(x - 1)$ pour tout $x in RR - {1}$

$arrow.l.r.double m x + x^2 + 4 - y x + y = 0$ ; cette equation est verifiee pour tout

$m in RR$ si et seulement si $cases(x = 0, x^2 + 4 - y x + y = 0) arrow.l.r.double cases(x = 0, y = 4)$

Donc toutes les courbes $C_m$ passent par un point fixe $A(0, 4)$.

b) Soit $T : y = f'_m(0)(x - 0) - 4$.

$T : y = f'_m(0) x - 4$ est l'equation de la tangente a $C_m$ en $T$.

$T$ ait pour coefficient directeur $(-3)$, si et seulement si :

$f'_m(0) = -3 arrow.l.r.double -m - 4 = -3 arrow.l.r.double m = -1$.

B) On suppose dans la suite $m = -1$, $f = f_(-1)$ et $zeta = zeta_(-1)$.

// Source: Parascolaire Analyse p.249

1) $f(x) = frac(x^2 - x + 4, x - 1)$ ; $D f = RR - {1}$. et $f'(x) = frac(x^2 - 2x - 3, (x - 1)^2)$

#figure(
  table(
    columns: 4,
    align: center,
    stroke: 0.5pt,
    [$x$], [$-infinity$], [$-1$], [$1$], [$3$], [$+infinity$],
    [$f'(x)$], [$+$], [$0$], [$-$], [$0$], [$+$],
    [$f(x)$], [$-infinity arrow.t$], [$-3 arrow.b$], [$-infinity$ | $+infinity$], [$arrow.b 5$], [$arrow.t +infinity$],
  )
)

$ast$ $x + frac(4, x - 1) = frac(x(x - 1) + 4, x - 1) = frac(x^2 - x + 4, x - 1) = f(x)$.

$bullet$ $lim_(x -> +infinity) [f(x) - x] = lim_(x -> +infinity) frac(4, x - 1) = 0$

de meme $lim_(x -> -infinity) [f(x) - x] = 0$

donc $y = x$ est une asymptote a $C$ au voisinage de $+infinity$ et $-infinity$.

$bullet$ $lim_(x -> 1^+) f(x) = +infinity$ et $lim_(x -> 1^-) f(x) = -infinity$ donc $x = 1$ est une asymptote a $C$.

2) a) $M in D_a sect C arrow.l.r.double cases(y = a x + 1 - a, y = f(x))$ alors $f(x) = a x + 1 - a$ ;

ou encore $x^2 - x + 4 = (a x + 1 - a)(x - 1) arrow.l.r.double (a - 1)x^2 + 2(1 - a)x + a - 5 = 0$.

$D_a$ coupe $C$ en deux points distincts, si et seulement si :

$Delta' > 0$ ou encore $4a - 4 > 0 arrow.l.r.double a > 1$.

b) $x' + x'' = S = frac(2a - 2, a - 1) = 2$ et $x' x'' = frac(a - 5, a - 1)$.

Soit $T' : y = f'(x')(x - x') + f(x')$ et $T'' : y = f'(x'')(x - x'') + f(x'')$.

$T' slash slash T''$ ; si et seulement si $f'(x') = f'(x'')$. or $x' = 2 - x''$

$f'(x') = frac(x'^2 - 2x' - 3, (x' - 1)^2) = frac((2 - x'')^2 - 2(2 - x'') - 3, (2 - x'' - 1)^2)$

// Source: Parascolaire Analyse p.250

$= frac(4 + x''^2 - 4x'' - 4 + 2x'' - 3, (1 - x'')^2) = frac(x''^2 - 2x'' - 3, (x'' - 1)^2) = f'(x'')$ d'ou $T_M' slash slash T_(M'')$.

3) a) $g(x) = -x + frac(4, x - 1)$ si $x in ]-infinity, 0]$. et $g'(x) = -1 - frac(4, (x - 1)^2) < 0$.

#figure(
  table(
    columns: 2,
    align: center,
    stroke: 0.5pt,
    [$x$], [$-infinity$], [$0$],
    [$g(x)$], [$-$],
    [$g'(x)$], [$+infinity arrow.b$], [$-4$],
  )
)

b) $lim_(x -> 0^-) frac(g(x) - g(0), x) = lim_(x -> 0^-) frac(-x + frac(4, x - 1) + 4, x) = lim_(x -> 0^-) frac(-x^2 + x + 4x - 4 + 4, x(x - 1))$

$= lim_(x -> 0^-) frac(-x^2 + 5x, x(x - 1)) = lim_(x -> 0^-) frac(x(-x + 5), x(x - 1)) = -5 = g'_g(0)$.

$lim_(x -> 0^+) frac(g(x) - g(0), x) = lim_(x -> 0^+) frac(x + frac(4, x - 1) + 4, x) = lim_(x -> 0^+) frac(x^2 - x + 4x - 4 + 4, x(x - 1))$

$lim_(x -> 0^+) frac(x^2 + 3x, x(x - 3)) = lim_(x -> 0^+) frac(x + 3, x - 3) = -1 = g_d'(0)$ alors $g_d'(0) eq.not g_g'(0)$.

Donc $g$ n'est pas derivable en $0$ d'ou $C'$ admet en $0$, un point Anguleux.

c) $lim_(x -> -infinity) [g(x) - (-x)] = lim_(x -> -infinity) frac(4, x - 1) = 0$ donc $y = -x$ est une asymptote a $C'$ au voisinage de $(-infinity)$.

Si $x >= 0 arrow.r.double g(x) = f(x)$ donc si $x in RR_+$ ; $C' = C$.


// Source: Parascolaire Analyse p.250

== Fonction irrationnelle du type : $sqrt(a x + b)$, $sqrt(a^2 + b x + c)$

=== Exercice 15 — Corrige

1) $f$ est le produit de deux fonctions derivables l'une sur $RR$ ($x arrow.r.bar x^2$) et l'autre ($x arrow.r.bar sqrt(x)$) est derivable sur $]0, +infinity[$ donc $f$ est derivable sur $]0, +infinity[$

et $f'(x) = 2x(alpha - sqrt(x)) - frac(x^2, 2 sqrt(x)) = 2x(alpha - sqrt(x)) - frac(x sqrt(x), 2)$

d'ou $f'(x) = frac(x, 2)(4 alpha - 5 sqrt(x))$

2) Le signe de $f'$ est celui de $4 alpha - 5 sqrt(x)$ car $x > 0$

// Source: Parascolaire Analyse p.251

$4 alpha - 5 sqrt(x) = 0 arrow.l.r.double 5 sqrt(x) = 4 alpha arrow.l.r.double x = frac(16 alpha^2, 25)$

Si $x > frac(16 alpha^2, 25)$ alors $sqrt(x) > frac(4 alpha, 5) arrow.r.double 4 alpha - 5 sqrt(x) < 0$

Si $x < frac(16 alpha^2, 25)$ alors $sqrt(x) < frac(4 alpha, 5) arrow.r.double 4 alpha - 5 sqrt(x) > 0$

on obtient :

#figure(
  table(
    columns: 3,
    align: center,
    stroke: 0.5pt,
    [$x$], [$0$], [$frac(16 alpha^2, 25)$], [$+infinity$],
    [$f'(x)$], [$+$], [$0$], [$-$],
  )
)

3) Le coefficient directeur de $T$ est $f'(1) = frac(4 alpha - 5, 2)$

Le coefficient directeur de $D$ est $3$.

$T$ et $D$ sont paralleles si et seulement si $f'(1) = 3$

soit $frac(4 alpha - 5, 2) = 3$ ou encore $alpha = frac(11, 4)$

#v(1em)

// Source: Parascolaire Analyse p.251

=== Exercice 16 — Corrige

1) pour tout $x in RR$, $f'(x) = frac(2x - 1, 2 sqrt(x^2 - x + 1))$ et $f'(1) = frac(1, 2)$

comme $f(1) = 1$ l'equation de la tangente en $1$ a $zeta_f$ est

$T : y = f'(1)(x - 1) + f(1)$

$T : y = frac(1, 2) x + frac(1, 2)$

$ast$ pour tout $x in RR$, $g'(x) = -frac(1, 2) x + 1$

alors $g'(1) = -frac(1, 2) + 1 = frac(1, 2)$ comme $g(1) = 1$

donc l'equation de la tangente a $zeta_f$ en $1$ est

$T' : y = g'(1)(x - 1) + g(1)$ alors $T' : y = frac(1, 2) x + frac(1, 2)$

Par suite $T = T'$ donc $zeta_f$ et $zeta_g$ sont une tangente comme $D$ d'equation

// Source: Parascolaire Analyse p.252

$y = frac(1, 2) x + frac(1, 2)$ au point d'abscisse $1$.

2) $bullet$ Etude de la position de $zeta_g$ et $T$ :

$g(x) - y = -frac(1, 4) x^2 + x + frac(1, 4) - frac(1, 2) x - frac(1, 2) = -frac(1, 4) x^2 + frac(1, 2) x - frac(1, 4) = -(frac(1, 2) x - frac(1, 2))^2 <= 0$

$arrow.r.double zeta_g$ est au dessous de $D$.

$bullet$ Etude de $zeta_f$ et $D$ :

$f''(x) = frac(1, 2) [frac(2 sqrt(x^2 - x + 1) - (2x - 1) dot frac(2x - 1, 2 sqrt(x^2 - x + 1)), x^2 - x + 1)] = frac(3, 4(x^2 - x + 1) sqrt(x^2 - x + 1)) > 0$

car $x^2 - x + 1 > 0$ puisque $Delta = -3 < 0$ donc $zeta_f$ est au dessus de $D$.

3) $f'(x) = frac(2x - 1, 2 sqrt(x^2 - x + 1))$ et $f'(x) = 0 arrow.l.r.double 2x - 1 = 0 arrow.l.r.double x = frac(1, 2)$

le signe $f'$ est celui de $2x - 1$

#figure(
  table(
    columns: 3,
    align: center,
    stroke: 0.5pt,
    [$x$], [$-infinity$], [$frac(1, 2)$], [$+infinity$],
    [$f'(x)$], [$-$], [$0$], [$+$],
    [$f(x)$], [$+infinity arrow.b$], [$frac(3, 4) arrow.t$], [$+infinity$],
  )
)

$lim_(|x| -> +infinity) x^2 - x + 1 = lim_(|x| -> +infinity) x^2 = +infinity$.

b) $lim_(x -> +infinity) (f(x) - (x - frac(1, 2))) = lim_(x -> +infinity) sqrt(x^2 - x + 1) - x + frac(1, 2)$

$= lim_(x -> +infinity) frac((sqrt(x^2 - x + 1) - x + frac(1, 2))(sqrt(x^2 - x + 1) + x - frac(1, 2)), sqrt(x^2 - x + 1) + x - frac(1, 2))$

$= lim_(x -> +infinity) frac(x^2 - x + 1 - x^2 + x - frac(1, 4), sqrt(x^2 - x + 1) + x - frac(1, 2)) = lim_(x -> +infinity) frac(frac(3, 4), sqrt(x^2 - x + 1) + x - frac(1, 2)) = 0$

// Source: Parascolaire Analyse p.253

car $lim_(x -> +infinity) sqrt(x^2 - x + 1) = +infinity$ et $lim_(x -> +infinity) x - frac(1, 2) = +infinity$

donc $y = x - frac(1, 2)$ est une asymptote en $+infinity$ pour $zeta_f$

c) $lim_(x -> -infinity) f(x) + x - frac(1, 2) = lim_(x -> -infinity) frac(sqrt(x^2 - x + 1)^2 - (x - frac(1, 2))^2, sqrt(x^2 - x + 1) - x + frac(1, 2))$

$= lim_(x -> -infinity) frac(frac(3, 4), sqrt(x^2 - x + 1) - x + frac(1, 2)) = 0$

car $lim_(x -> -infinity) sqrt(x^2 - x + 1) = +infinity$ et $lim_(x -> -infinity) -x + frac(1, 2) = +infinity$

donc $y = -x + frac(1, 2)$ est l'asymptote a $zeta_f$ en $-infinity$.

4) $zeta_f$ est une parabole de sommet $S(2, frac(5, 4))$ d'axe de symetrie $(S, arrow(j))$

#v(1em)

// Source: Parascolaire Analyse p.253-254

=== Exercice 17 — Corrige

1) pour tout $x in RR$, $1 + x^2 > x^2$

d'ou $sqrt(1 + x^2) > |x|$ ainsi $sqrt(1 + x^2) > x$ et $sqrt(1 + x^2) > -x$

par suite : $sqrt(1 + x^2) - x > 0$ et $sqrt(1 + x^2) + x > 0$

$ast$ $sqrt(1 + x^2) - x > 0$

$sqrt(1 + x^2) + sqrt(1 + x^2) - x > sqrt(1 + x^2) arrow.r.double 2 sqrt(1 + x^2) - x > sqrt(1 + x^2) > 0$

2) a) $g(x) = 2x - sqrt(1 + x^2)$

$forall x in RR$, $g'(x) = 2 - frac(2x, 2 sqrt(1 + x^2)) = 2 - frac(x, sqrt(1 + x^2)) = frac(2 sqrt(1 + x^2) - x, sqrt(1 + x^2)) >= 0$

car d'apres la $1^("ere")$ question on a $2 sqrt(1 + x^2) - x >= 0$ par consequent $g$ est strictement croissante sur $RR$.

b) $g(x) = 0 arrow.l.r.double 2x - sqrt(1 + x^2) = 0 arrow.l.r.double sqrt(1 + x^2) = 2x$

$arrow.l.r.double cases(1 + x^2 = 4x^2, 2x >= 0) arrow.l.r.double cases(3x^2 = 1, x >= 0) arrow.l.r.double x = sqrt(frac(1, 3))$ d'ou $S_(RR) = {sqrt(frac(1, 3))}$

// Source: Parascolaire Analyse p.254

c) $ast$ si $x <= sqrt(frac(1, 3))$ et $g$ est strictement croissante sur $RR$

alors $g(x) <= g(sqrt(frac(1, 3)))$ et $g(sqrt(frac(1, 3))) = 0$ donc $g(x) <= 0$.

$ast$ Si $x >= sqrt(frac(1, 3))$ et $g$ est strictement croissante dur $RR$

alors $g(x) >= g(sqrt(frac(1, 3)))$ et $g(sqrt(frac(1, 3))) = 0$ donc $g(x) >= 0$.

d'ou :

#figure(
  table(
    columns: 3,
    align: center,
    stroke: 0.5pt,
    [$x$], [$-infinity$], [$sqrt(frac(1, 3))$], [$+infinity$],
    [$g(x)$], [$-$], [$0$], [$+$],
  )
)

3) a) $ast$ $lim_(x -> -infinity) f = lim_(x -> -infinity) 2 sqrt(1 + x^2) - x = +infinity$

car $lim_(x -> -infinity) 1 + x^2 = +infinity$ et $lim_(x -> -infinity) -x = +infinity$

$ast$ $lim_(x -> +infinity) f = lim_(x -> +infinity) 2 sqrt(1 + x^2) - x = (+infinity - infinity) "F.I"$

$= lim_(x -> +infinity) 2 sqrt(x^2(1 + frac(1, x^2))) - x = lim_(x -> +infinity) x(2 sqrt(1 + frac(1, x^2)) - 1) = +infinity times 1 = +infinity$

b) $f'(x) = 2 dot frac(2x, 2 sqrt(1 + x^2)) - 1 = frac(2x, sqrt(1 + x^2)) - 1 = frac(2x - sqrt(1 + x^2), sqrt(1 + x^2)) = frac(g(x), sqrt(1 + x^2))$

c) Le signe de $f'$ est de $g$ :

#figure(
  table(
    columns: 3,
    align: center,
    stroke: 0.5pt,
    [$x$], [$-infinity$], [$sqrt(frac(1, 3))$], [$+infinity$],
    [$f'(x)$], [$-$], [$0$], [$+$],
    [$f(x)$], [$+infinity arrow.b$], [$sqrt(3) arrow.t$], [$+infinity$],
  )
)

$f(sqrt(frac(1, 3))) = 2 sqrt(1 + frac(1, 3)) - sqrt(frac(1, 3)) = frac(4, sqrt(3)) - frac(1, sqrt(3)) = frac(3, sqrt(3)) = sqrt(3)$

// Source: Parascolaire Analyse p.255

4) a) $lim_(x -> +infinity) f(x) - x = lim_(x -> +infinity) 2 sqrt(1 + x^2) - x - x = lim_(x -> +infinity) 2 sqrt(1 + x^2) - 2x$

$= lim_(x -> +infinity) 2 frac((sqrt(1 + x^2) - x)(sqrt(1 + x^2) + x), sqrt(1 + x^2) + x) = lim_(x -> +infinity) 2 frac(1 + x^2 - x^2, sqrt(1 + x^2) + x)$

$= lim_(x -> +infinity) frac(2, sqrt(1 + x^2) + x) = 0$ car $lim_(x -> +infinity) sqrt(1 + x^2) = +infinity$ et $lim_(x -> +infinity) x = +infinity$

donc $y = x$ est une asymptote en $+infinity$ par $zeta_f$.

b) $lim_(x -> -infinity) f(x) + 3x = lim_(x -> -infinity) 2 sqrt(1 + x^2) - x + 3x$

$= lim_(x -> -infinity) 2 sqrt(1 + x^2) + 2x = lim_(x -> -infinity) 2(sqrt(1 + x^2) + x)$

$= lim_(x -> -infinity) 2 frac((sqrt(1 + x^2) + x)(sqrt(1 + x^2) - x), sqrt(1 + x^2) - x) = lim_(x -> -infinity) 2 frac(1 + x^2 - x^2, sqrt(1 + x^2) - x)$

$= lim_(x -> -infinity) frac(2, sqrt(1 + x^2) - x) = 0$ car $lim_(x -> -infinity) sqrt(1 + x^2) = +infinity$ et $lim_(x -> -infinity) -x = +infinity$

donc $Delta : y = -3x$ est une asymptote en $-infinity$ pour $zeta_f$.

c) $ast$ *Position $zeta_f$ et $Delta$* :

$f(x) + 3x = 2(sqrt(1 + x^2) + x) > 0$

d'apres la $1^("ere")$ question $sqrt(1 + x^2) + x > 0$

donc $zeta_f$ est au dessus de $Delta$.

$ast$ *Position $zeta_f$ et $D : y = x$* :

$f(x) - x = 2(sqrt(1 + x^2) - x) > 0$ d'apres la $1^("ere")$ question :

donc $zeta_f$ est au dessus de $D$.


// Source: Parascolaire Analyse p.255

=== Exercice 18 — Corrige

1) $ast$ $x^2 - 6x + 5 = 0$

$a + b + c = 1 - 6 + 5 = 0$

donc $x = 1$ et $x = 5$ sont ces racines.

#figure(
  table(
    columns: 4,
    align: center,
    stroke: 0.5pt,
    [$x$], [$-infinity$], [$1$], [$5$], [$+infinity$],
    [$x^2 - 6x + 5$], [$+$], [$0$], [$0$], [$+$],
  )
)

$ast$ $f$ est definie si et seulement si $x^2 - 6x + 5 >= 0$

$D_f = ]-infinity, 1] union [5, +infinity[$

// Source: Parascolaire Analyse p.256

2) $bullet$ $x in D_f arrow.l.r.double x <= 1$ ou $x >= 5$

$arrow.l.r.double -x >= -1$ ou $-x <= -5 arrow.l.r.double 6 - x >= 5$ ou $6 - x <= 1 arrow.l.r.double 6 - x in D_f$

$bullet$ Montrons que $f(6 - x) = f(x)$

$f(6 - x) = sqrt((6 - x)^2 - 6(6 - x) + 5)$

$= sqrt(6^2 - 12x + x^2 - 6^2 + 6x + 5)$

$= sqrt(x^2 - 6x + 5) = f(x)$

donc la droite $Delta : x = 3$ est un axe de symetrie par $zeta$.

3) $lim_(h -> 0^+) frac(f(5 + h) - f(5), h) = lim_(h -> 0^+) frac(sqrt((5 + h)^2 - 6(5 + h) + 5) - 0, h)$

$= lim_(h -> 0^+) frac(sqrt(h^2 + 4h), h)$ or $h >= 0$

$= lim_(h -> 0^+) frac(sqrt(h) sqrt(h + 4), h) = lim_(h -> 0^+) frac(sqrt(h + 4), sqrt(h)) = +infinity$ car $lim_(h -> 0^+) sqrt(h + 4) = 2$ et $lim_(h -> 0^+) sqrt(h) = 0^+$

donc $f$ n'est pas derivable en $5$ par suite $zeta$ admet une demi tangente verticale au point d'abscisse $5$ dirigee vers le haut.

4) Comme $x^2 - 6x + 5 > 0$ sur $]5, +infinity[$ alors $f$ est derivable sur $]5, +infinity[$

et $f'(x) = frac(2x - 6, 2 sqrt(x^2 - 6x + 5)) = frac(x - 3, sqrt(x^2 - 6x + 5)) > 0$ puisque $x > 5 arrow.r.double x - 3 > 2$

d'ou $f$ est strictement croissante sur $]5, +infinity[$

$x = 3$ est un axe de symetrie pour $zeta$ alors $f$ est strictement decroissante sur $]-infinity, 1]$.

5) $lim_(x -> +infinity) f = lim_(x -> +infinity) sqrt(x^2 - 6x + 5) = +infinity$

car $lim_(x -> +infinity) x^2 - 6x + 5 = lim_(x -> +infinity) x^2 = +infinity$

6) $lim_(x -> +infinity) (f(x) - (x - 3)) = lim_(x -> +infinity) sqrt(x^2 - 6x + 5) - (x - 3)$

$= lim_(x -> +infinity) frac([sqrt(x^2 - 6x + 5) - (x - 3)][sqrt(x^2 - 6x + 5) + (x - 3)], sqrt(x^2 - 6x + 5) + (x - 3))$

$= lim_(x -> +infinity) frac(x^2 - 6x + 5 - (x - 3)^2, sqrt(x^2 - 6x + 5) + x - 3) = lim_(x -> +infinity) frac(-4, f(x) + x - 3) = 0$

$= 0$ puisque $lim_(x -> +infinity) f(x) + x - 3 = +infinity$

d'ou la droite $D_1 : y = x - 3$ est une asymptote a $zeta$ en $+infinity$.

$ast$ d'apres la proprietes de la symetrie de la courbe symetrique de $D_1$ sera l'asymptote a $zeta$ en $-infinity$.

$A(3, 0) in D_1$ on aussi l'axe de symetrie donc $A in D_2$

$B(4, 1) in D_1$ son symetrie $B'(2, 1) in D_2$

// Source: Parascolaire Analyse p.257

ainsi $D_2 : y = -x + 3$

7)

#figure(
  table(
    columns: 5,
    align: center,
    stroke: 0.5pt,
    [$x$], [$-infinity$], [$1$], [$/\/\/\/$], [$5$], [$+infinity$],
    [$f'(x)$], [$-$], [], [$/\/\/\/$], [], [$+$],
    [$f(x)$], [$+infinity arrow.b$], [$0$], [$/\/\/\/$], [$0 arrow.t$], [$+infinity$],
  )
)

#v(1em)

== Fonctions rationnelles de la forme : $frac(a x^2 + b x + c, d x^2 + e x + f)$

// Source: Parascolaire Analyse p.257

=== Exercice 19 — Corrige

1) $g(x) = a x^2 + b x + c$

Pour tout $x in RR$, $g'(x) = 2a x + b$

$g'(1) = -1 arrow.l.r.double 2a + b = -1 arrow.l.r.double b = -1 - 2a$

$g'(2) = 1 arrow.l.r.double 4a + b = 1$ on remplace $b$ par sa valeur on obtient

$4a - 1 - 2a = 1 arrow.l.r.double 2a = 2 arrow.l.r.double a = 1$ par suite $b = -3$.

$ast$ l'equation de la tangente $T$ en $1$ est

$y = g'(1)(x - 1) + g(1)$ or $g'(1) = -1$ et $g(1) = a + b + c = c - 2$

$y = -x + 1 + c - 2$ d'ou $T : y = -x - 1 + c$

$A(2, -20) in T arrow.l.r.double -20 = -2 - 1 + c arrow.l.r.double c = -17$

On a donc $g(x) = x^2 - 3x - 17$

2) $h(x) = r x^2 + s x + t$ alors $h'(x) = 2r x + s$

$ast$ La tangente en $0$ a pour equation $T : y = h'(0) x + h(0)$

or $h(0) = t$ et $h'(0) = s$ alors $T : y = s x + t$

// Source: Parascolaire Analyse p.258

$B(0, -14) in T arrow.l.r.double -14 = t$

$C(1, -16) in T arrow.l.r.double -16 = s + t arrow.r.double s = -2$

$ast$ $h(1) = -15 arrow.l.r.double r + s + t = -15 arrow.l.r.double r - 14 - 2 = -15$ donc $r = 1$

on a donc $h(x) = x^2 - 2x - 14$

3) a) $f$ est definie si et seulement si $h(x) eq.not 0$

$x^2 - 2x - 14 = 0$

$Delta' = 1 + 14 = 15$

$x' = 1 - sqrt(15)$ et $x'' = 1 + sqrt(15)$

$D f = RR - {1 + sqrt(15), 1 - sqrt(15)}$

b) $f$ rationnelle donc derivable sur $D f$ et

$f'(x) = frac((2x - 3)(x^2 - 2x - 14) - (2x - 2)(x^2 - 3x - 17), (x^2 - 2x - 14)^2) = frac(x^2 + 6x + 8, (x^2 - 2x - 14)^2)$

c) Le signe de $f'(x)$ est celui de $x^2 + 6x + 8$

$f'(x) = 0 arrow.l.r.double x^2 + 6x + 8 = 0$

$Delta' = 9 - 8 = 1$ alors $x' = -3 - 1 = -4$ et $x'' = -3 + 1 = -2$

#figure(
  table(
    columns: 6,
    align: center,
    stroke: 0.5pt,
    [$x$], [$-7$], [$-4$], [$1 - sqrt(15)$], [$-2$], [$1 + sqrt(15)$], [$7$],
    [$f'(x)$], [$+$], [$0$], [$-$], [$0$], [$+$], [$+$],
  )
)

#v(1em)

// Source: Parascolaire Analyse p.258-259

=== Exercice 20 — Corrige

1) $f$ est definie si et seulement si $x^2 - 4 eq.not 0$

$x^2 - 4 = 0 arrow.l.r.double x = 2$ ou $x = -2$ d'ou $D f = RR - {2, -2}$

2) $f$ est une fonction rationnelle donc derivable sur $D f$ et

$f'(x) = frac((2x + 2)(x^2 - 4) - (2x)(x^2 + 2x - 3), (x^2 - 4)^2) = -2 frac(x^2 + x + 4, (x^2 - 4)^2) < 0$

car $(x^2 - 4)^2 > 0$ et $x^2 + x + 4 > 0$ puisque $Delta = -17 > 0$

par suite $f$ est strictement decroissante sur $D f$.

3) $ast$ $lim_(|x| -> +infinity) f(x) = lim_(|x| -> +infinity) frac(x^2, x^2) = 1$

$arrow.r.double y = 1$ est une asymptote en $+infinity$ et en $-infinity$ pour $zeta$.

$ast$ $lim_(x -> 2^+) f(x) = +infinity$ car $lim_(x -> 2) x^2 + 2x - 3 = 5$ et $lim_(x -> 2^+) x^2 - 4 = 0^+$

de meme $lim_(x -> 2^-) f(x) = -infinity$

$lim_(x -> -2) x^2 + 2x - 3 = -3$

$lim_(x -> (-2)^+) x^2 - 4 = 0^-$ $arrow.r.double lim_(x -> (-2)^+) f(x) = +infinity$

// Source: Parascolaire Analyse p.259

$lim_(x -> -2) x^2 + 2x - 3 = -3$

$lim_(x -> (-2)^-) x^2 - 4 = 0^+$ $arrow.r.double lim_(x -> (-2)^-) f(x) = -infinity$

donc $x = 2$ et $x = -2$ sont deux asymptotes de $zeta$.

4) $ast$

$M in zeta_f sect (O, arrow(i)) arrow.l.r.double cases(y = 0, y = f(x)) arrow.l.r.double cases(f(x) = 0, y = 0)$

$f(x) = 0 arrow.l.r.double x = 1$ ou $x = -3$

$zeta_f sect (O, arrow(i)) = {(1, 0), (-3, 0)}$.

$ast$ $f'(1) = -frac(4, 3)$ et $f'(-3) = -frac(4, 5)$

$ast$

$zeta_f sect (O, arrow(j)) = {(0, frac(3, 4))}$

$ast$ $f'(0) = -frac(1, 2)$.

5) $(1 - m)x^2 + 2x - 3 + 4m = 0$ equivaut a $m(x^2 - 4) = x^2 + 2x - 3$

comme $2$ et $-2$ ne sont pas solution de l'equation alors elle est equivalente a

$frac(x^2 + 2x - 3, x^2 - 4) = m$ Soit $f(x) = m$

l'equation admet autant de solutions qu'il y a de points d'intersection de $zeta_f$ et la droite d'equation $y = m$.

$bullet$ Si $m = 1$ alors l'equation admet $1$ seule solution.
$bullet$ Si $m eq.not 1$ alors l'equation admet $2$ solutions.

#v(1em)

// Source: Parascolaire Analyse p.259

=== Exercice 21 — Corrige

1) $lim_(x -> +infinity) f(x) = lim_(x -> +infinity) frac(a x^2, x^2) = a$

$arrow.r.double y = a$ est l'asymptote en $+infinity$ comme $y = 1$ donc $a = 1$.

$ast$ $0 in zeta arrow.l.r.double f(0) = 0 arrow.l.r.double c = 0$

$ast$ $f'(x) = frac((a x + b)(x - 1)^2 - 2(x - 1)(a x^2 + b x + c), (x - 1)^4)$

$f'(0) = b + 2c$ or $f'(0) = -2$ par suite $b + 2c = -2$ or $c = 0$ donc $b = -2$

on a donc $f(x) = frac(x^2 - 2x, (x - 1)^2)$

// Source: Parascolaire Analyse p.260

2) $f$ est definie si et seulement si $(x - 1) eq.not 0$. Soit $x eq.not 1$ donc $D f = RR - {1}$.

$ast$ $lim_(+infinity) f = 1$. $ast$ $lim_(-infinity) f(x) = lim_(x -> -infinity) frac(x^2, x^2) = 1$.

$ast$ $lim_(x -> 1) f(x) = lim_(x -> 1) frac(x^2 - 2x, (x - 1)^2) = -infinity$ car $lim_(x -> 1) x^2 - 2x = -1$ et $lim_(x -> 1)(x - 1)^2 = 0^+$.

3) a) Pour $x eq.not 1$, $f'(x) = frac((2x - 2)(x - 1)^2 - 2(x - 1)(x^2 - 2x), (x - 1)^4)$

$f'(x) = frac(2(x - 1)^2 - 2(x^2 - 2x), (x - 1)^3) = frac(2, (x - 1)^3)$

b) $f'(x) = frac(2, (x - 1)^3) = frac(2, (x - 1)^2(x - 1))$

alors le signe de $f'(x)$ est celui de $(x - 1)$ car $(x - 1)^2 > 0$.

#figure(
  table(
    columns: 3,
    align: center,
    stroke: 0.5pt,
    [$x$], [$-infinity$], [$1$], [$+infinity$],
    [$f'(x)$], [$-$], [], [$+$],
    [$f(x)$], [$1 arrow.b$], [$-infinity$ | $-infinity$], [$arrow.t 1$],
  )
)

4) $T : y = f'(0) x + f(0)$

$T : y = -2x$

$ast$ $lim_(+infinity) f = lim_(-infinity) f = 1 arrow.r.double y = 1$ est une asymptote en $+infinity$ et en $-infinity$ de $zeta$.

$ast$ $lim_(1) f = +infinity arrow.r.double x = 1$ asymptote de $zeta$

