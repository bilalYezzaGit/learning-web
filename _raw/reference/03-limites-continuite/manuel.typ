// =============================================================================
// Module 3 : Limites et continuité
// Programme : 3ème Math (Tunisie)
// Source : Manuel scolaire CNP (T1, p.40–55) + Corrigé CMS (T1, p.27–40)
// =============================================================================

= Chapitre 3 : Limites et continuité

#emph[« Tout le monde veut vivre au sommet de la montagne, sans soupçonner que le vrai bonheur est dans la manière de gravir la pente. »]

#align(right)[*Marquez*]

// Source: Manuel T1 p.41
== Pour commencer

=== Activité 1

Déterminer l'ensemble de définition et représenter la fonction f : $x mapsto frac(|x|, x)$ .

=== Activité 2

Déterminer l'ensemble de définition et représenter la fonction g telle que

$ g(x) = cases(
  frac(1, x) & "si" x < 1,
  2x - 1 & "si" x gt.eq 1
) $

=== Activité 3

1. Résoudre dans $RR$ les inéquations suivantes :

#h(0.5cm) a. $0 < |y + 2| < frac(1, 2)$ .

#h(0.5cm) b. $0 < |x - 1| < 0.2$ .

2. Le plan est muni d'un repère orthonormé $(O, arrow(i), arrow(j))$.

Représenter l'ensemble des points $M(x, y)$ tels que

$ cases(
  0 < |x - 1| < 0.2,
  0 < |y + 2| < frac(1, 2)
) $

// Source: Manuel T1 p.42
== Cours

=== 1. Limite finie en un réel

==== Activité 1

On considère la fonction f définie, pour tout réel x distinct de 1, par $f(x) = frac((x - 1)^2, |x - 1|) + 2$ .

La fonction f n'étant pas définie en 1, nous nous intéressons dans cette activité aux réels f(x), lorsque x est proche de 1.

1. Recopier et compléter le tableau suivant.

#table(
  columns: 8,
  [x], [0], [0.9], [0.99], [0.999], [1.001], [1.01], [1.1],
  [f(x)], [], [], [], [], [], [], []
)

Que peut-on conjecturer sur f(x) lorsque x se rapproche de 1 ?

2. a. Donner l'expression de f(x), sans valeur absolue.

#h(0.5cm) b. Représenter f dans un repère orthonormé.

3. Déterminer graphiquement une condition suffisante sur x pour que f(x) appartienne à $]1.9 , 2.1[$.

#block(fill: rgb("#f0f7ff"), inset: 12pt, radius: 4pt, width: 100%)[
  *Définition*

  Soit f une fonction définie sur un intervalle ouvert I, sauf peut-être en un réel a de I.

  On dit que f(x) tend vers le réel L lorsque x tend vers a, si pour tout $beta > 0$, il existe $alpha > 0$ tel que si $x in I$ et $0 < |x - a| < alpha$, alors $|f(x) - L| < beta$.
]

#block(fill: rgb("#e8f5e9"), inset: 12pt, radius: 4pt, width: 100%)[
  *Théorème (admis)*

  Soit f une fonction définie sur un intervalle I, sauf peut-être en un réel a de I.

  Si f admet une limite en a alors cette limite est unique.
]

*Notation et vocabulaire*

Si f(x) tend vers L lorsque x tend vers a, on écrit $lim_(x arrow a) f(x) = L$, ou $lim f = L$, et on dit que f admet pour limite L en a.

=== 2. Limite en un réel a d'une fonction continue en a.

==== Activité 1

Soit f une fonction définie sur un intervalle ouvert I et a un réel de I.

On suppose que f est continue en a.

a. Écrire la définition de la continuité de f en a.

b. En déduire que f admet une limite en a, que l'on déterminera.

2. On suppose que f admet pour limite en a le réel $ell$.

Montrer que f est continue en a.

// Source: Manuel T1 p.43
On a donc obtenu le théorème ci-dessous.

#block(fill: rgb("#e8f5e9"), inset: 12pt, radius: 4pt, width: 100%)[
  *Théorème*

  Soit f une fonction définie sur un intervalle ouvert I et a un réel de I.

  f est continue en a, si et seulement si, $lim_(x arrow a) f(x) = f(a)$.
]

Dans chacun des cas suivants, déterminer la limite de la fonction f en a.

1. $f(x) = 2x^2 - 4x + 1$ #h(1cm) ; #h(0.5cm) $a = 2$.

2. $f(x) = frac(x^2 + 5x, x^2 - 1)$ #h(1cm) ; #h(0.5cm) $a = -2$.

3. $f(x) = sqrt(x^2 - 2x + 3)$ #h(1cm) ; #h(0.5cm) $a = 1$.

=== 3. Calcul de limites

==== Activité 1

Soit g la fonction définie sur $RR$ par $g(x) = |x|$.

1. Écrire la définition de la continuité de g en 0.

2. Soit f la fonction définie pour tout réel non nul x, par $f(x) = frac(x^2, |x|)$.

#h(0.5cm) a. Montrer que f(x) = g(x) pour tout $x eq.not 0$.

#h(0.5cm) b. En déduire que f admet une limite en 0, que l'on déterminera.

==== Activité 2

Soit g une fonction définie sur un intervalle ouvert I et continue en un réel a de I.

1. Écrire la définition de la continuité de g en a.

2. Soit f une fonction définie sur I, sauf peut-être en a et telle que $f(x) = g(x)$ pour tout $x eq.not a$.

Montrer que f admet une limite en a, que l'on déterminera.

On a donc obtenu le théorème ci-dessous.

#block(fill: rgb("#e8f5e9"), inset: 12pt, radius: 4pt, width: 100%)[
  *Théorème*

  Soit f une fonction définie sur un intervalle ouvert I, sauf peut-être en un réel a de I et soit g une fonction définie sur l'intervalle I.

  Si g est continue en a et si $g(x) = f(x)$ pour tout $x eq.not a$, alors $lim_(x arrow a) f(x) = g(a)$.
]

==== Activité 3

1. On considère les fonctions $f : x mapsto frac(x^3 + 1, x + 1)$ et $g : x mapsto x^2 - x + 1$ .

#h(0.5cm) a. Déterminer l'ensemble de définition de f ainsi que celui de g.

#h(0.5cm) b. Montrer que $f(x) = g(x)$, pour tout $x eq.not -1$.

#h(0.5cm) c. En déduire $lim_(x arrow -1) f(x)$ .

// Source: Manuel T1 p.44
2. a. Montrer que pour tout réel $x eq.not 2$, $frac(x^3 - 8, x^2 - 4) = frac(x^2 + 2x + 4, x + 2)$ .

#h(0.5cm) b. En déduire que la fonction $h : x mapsto frac(x^3 - 8, x^2 - 4)$ admet une limite en 2. Déterminer cette limite.

3. a. Montrer que pour tout réel $x eq.not 0$, $frac(sqrt(x + 1) - 1, x) = frac(1, sqrt(x + 1) + 1)$ .

#h(0.5cm) b. En déduire que la fonction $k : x mapsto frac(sqrt(x + 1) - 1, x)$ admet une limite en 0. Déterminer cette limite.

4. Calculer la limite de f en a.

$ f(x) = frac(x^4 - 16, -x^2 + 4) #h(1cm) ; #h(0.5cm) a = 2. $

$ f(x) = frac(sqrt(2x + 1) - sqrt(3), x - 1) #h(1cm) ; #h(0.5cm) a = 1. $

$ f(x) = frac(|x^2 - 2x + 1|, x - 1) #h(1cm) ; #h(0.5cm) a = 1. $

=== 4. Prolongement par continuité

==== Activité 1

On considère la fonction f définie pour tout réel $x eq.not 0$, par $f(x) = frac(x^3 - x, x)$ et la fonction g

définie par $g(x) = cases(
  f(x) & "si" x eq.not 0,
  -1 & "si" x = 0
)$ .

1. Vérifier que $g(x) = x^2 - 1$, pour tout réel x.

2. En déduire que g est continue en 0.

3. Déterminer la limite de f en 0.

==== Activité 2

Soit f une fonction définie sur un intervalle ouvert I, sauf en un réel a de I.

On suppose que $lim_(x arrow a) f = L$.

On considère la fonction F définie par $F(x) = cases(
  f(x) & "si" x eq.not a,
  L & "si" x = a
)$

Montrer que F est continue en a.

// Source: Manuel T1 p.45
On a donc obtenu le théorème ci-dessous.

#block(fill: rgb("#e8f5e9"), inset: 12pt, radius: 4pt, width: 100%)[
  *Théorème et définition*

  Soit f une fonction définie sur un intervalle ouvert I, sauf en un réel a de I et admettant une limite L en a.

  Alors la fonction F définie par $F(x) = cases(
    f(x) & "si" x eq.not a,
    L & "si" x = a
  )$ est continue en a.
]

*Vocabulaire*

On dit que la fonction F est le prolongement par continuité en a de la fonction f.

On dit aussi que f est prolongeable par continuité en a.

=== 5. Opérations sur les limites finies

==== Activité 1

Soit f et g deux fonctions définies sur un intervalle ouvert I, sauf peut-être en un réel a de I, telles que f et g admettent pour limites respectives L et L' en a.

On désigne par F et G les fonctions définies respectivement par

$ F(x) = cases(
  f(x) & "si" x eq.not a,
  L & "si" x = a
) #h(1cm) "et" #h(1cm) G(x) = cases(
  g(x) & "si" x eq.not a,
  L' & "si" x = a
) $

1. Justifier que F et G sont continues en a.

2. En déduire que $lim_(x arrow a)(f + g) = L + L'$.

En utilisant un procédé analogue, on peut démontrer les résultats qui figurent dans le théorème ci-dessous.

#block(fill: rgb("#e8f5e9"), inset: 12pt, radius: 4pt, width: 100%)[
  *Théorème*

  Soit f et g deux fonctions définies sur un intervalle ouvert I, sauf peut-être en un réel a de I et telles que f et g admettent pour limites respectives L et L' en a. Alors :

  $lim_(x arrow a)(f + g) = L + L'$ ; #h(0.5cm) $lim_(x arrow a)(f dot g) = L dot L'$ ; #h(0.5cm) $lim_(x arrow a) |f| = |L|$.

  Si $L eq.not 0$ alors $lim_(x arrow a) frac(1, f) = frac(1, L)$. #h(1cm) Si $L' eq.not 0$ alors $lim_(x arrow a) frac(f, g) = frac(L, L')$.
]

==== Activité 2

Dans chacun des cas suivants, déterminer la limite de la fonction f en a.

1. $f(x) = frac(x^2 - 2sqrt(2), x - sqrt(2)) + x$ #h(1cm) ; #h(0.5cm) $a = sqrt(2)$ .

2. $f(x) = frac(2x^4 + 5x - 3, 5 - |x|) dot frac(1, x + 3)$ #h(1cm) ; #h(0.5cm) $a = -3$ .

// Source: Manuel T1 p.46
=== 6. Limite et ordre

==== Activité 1

Soit f une fonction définie sur un intervalle ouvert I, sauf peut-être en un réel a de I et admettant une limite L en a.

1. Quelle est la limite de $|f|$ en a ?

2. On suppose que $f(x) gt.eq 0$ (positif), pour tout réel x distinct de a et appartenant à I.

Déduire l'unicité de la limite que L $gt.eq 0$.

3. On suppose que $f(x)$ est négatif, pour tout réel x distinct de a et appartenant à I.

Montrer que $L lt.eq 0$.

On a obtenu le théorème ci-dessous.

#block(fill: rgb("#e8f5e9"), inset: 12pt, radius: 4pt, width: 100%)[
  *Théorème*

  Soit f une fonction définie sur un intervalle ouvert I, sauf peut-être en un réel a de I et admettant pour limite L en a.

  Si $f(x)$ est positif pour tout réel x distinct de a, alors $L gt.eq 0$.

  Si $f(x)$ est négatif pour tout réel x distinct de a, alors $L lt.eq 0$.
]

#block(fill: rgb("#e8f5e9"), inset: 12pt, radius: 4pt, width: 100%)[
  *Théorème*

  Soit f une fonction définie sur un intervalle ouvert I, sauf peut-être en un réel a de I et admettant pour limite L en a.

  Si $f(x)$ est positif pour tout réel x distinct de a, alors $lim_(x arrow a) sqrt(f) = sqrt(L)$ .
]

==== Activité 2

Déterminer la limite de la fonction f en a.

$f(x) = sqrt(frac(x^3 + 2x^2, x + 2))$ #h(1cm) ; #h(0.5cm) $a = -2$ .

=== 7. Limite à droite. Limite à gauche

==== Activité 1

Dans le plan muni d'un repère $(O, arrow(i), arrow(j))$, $cal(C)$ est la courbe représentative de la fonction h définie sur $[-0.1 , 0.1] backslash {0}$ par

$ h(x) = cases(
  x + 0.09 & "si" -0.1 lt.eq x < 0,
  x + 0.1 & "si" 0 < x lt.eq 0.1
) $

La fonction h n'est pas définie en 0.

// Source: Manuel T1 p.47
Dans cette activité nous nous intéressons aux réels h(x) tels que x sont proches de 0.

1. En observant le graphique ci-contre, donner une condition suffisante sur x pour que h(x) appartienne à $[0.095 , 0.105]$.

2. En observant le graphique ci-contre, donner une condition suffisante sur x pour que h(x) appartienne à $[0.085 , 0.095]$.

#block(fill: rgb("#f0f7ff"), inset: 12pt, radius: 4pt, width: 100%)[
  *Définition*

  Soit f une fonction définie sur un intervalle ouvert I, sauf peut-être en un réel a de I.

  On dit que la fonction f admet pour limite L à droite en a, si pour tout $beta > 0$, il existe $alpha > 0$ tel que si $x in I$ et $0 < x - a < alpha$, alors $|f(x) - L| < beta$.

  On écrit $lim_(x arrow a^+) f(x) = L$ #h(0.5cm) ou #h(0.5cm) $lim_( arrow a^+) f = L$ #h(0.5cm) ou #h(0.5cm) $lim_(x arrow a \ x > a) f(x) = L$ .

  On dit que la fonction f admet pour limite le réel L à gauche en a, si pour tout $beta > 0$, il existe $alpha > 0$ tel que si $0 < a - x < alpha$ alors $|f(x) - L| < beta$.

  On écrit $lim_(x arrow a^-) f(x) = L$ #h(0.5cm) ou #h(0.5cm) $lim_( arrow a^-) f = L$ #h(0.5cm) ou #h(0.5cm) $lim_(x arrow a \ x < a) f(x) = L$ .
]

Le théorème qui suit résulte des définitions.

#block(fill: rgb("#e8f5e9"), inset: 12pt, radius: 4pt, width: 100%)[
  *Théorème (admis)*

  Soit f une fonction définie sur un intervalle ouvert I, sauf peut-être en un réel a de I.

  $lim_(x arrow a) f(x) = L$, si et seulement si, $lim_(x arrow a^+) f(x) = lim_(x arrow a^-) f(x) = L$ .
]

=== 8. Limite à droite (ou à gauche) en a et continuité à droite (ou à gauche) en a.

==== Activité 1

1. Montrer que si f est continue à droite en a, alors elle admet une limite à droite en a.

Que vaut cette limite ?

// Source: Manuel T1 p.48
2. Montrer que si f est continue à gauche en a, alors elle admet une limite à gauche en a.

Que vaut cette limite ?

#block(fill: rgb("#e8f5e9"), inset: 12pt, radius: 4pt, width: 100%)[
  *Théorème*

  Soit f une fonction définie sur un intervalle I et a un réel de I.

  La fonction f est continue à droite en a, si et seulement si, $lim_(x arrow a^+) f(x) = f(a)$.

  La fonction f est continue à gauche en a, si et seulement si, $lim_(x arrow a^-) f(x) = f(a)$.
]

==== Activité 2

Calculer les limites ci-dessous.

$lim_(x arrow 2^-) sqrt(x - 2)$ #h(1cm) ; #h(0.5cm) $lim_(x arrow 0^+) 2x + 5$ #h(1cm) ; #h(0.5cm) $lim_(x arrow 1^-) frac(x^(n-1), x - 1)$ .

==== Activité 3

On considère la fonction f définie sur $RR backslash {-1}$ par

$ f(x) = cases(
  x + 1 & "si" x < -1,
  1 & "si" x > -1
) $

1. Représenter f dans un repère $(O, arrow(i), arrow(j))$.

2. a. Calculer la limite à gauche en $-1$ de la fonction $x mapsto x + 1$.

#h(0.5cm) b. En déduire la limite de f à gauche en $-1$.

3. Calculer la limite de f à droite en $-1$.

#block(fill: rgb("#e8f5e9"), inset: 12pt, radius: 4pt, width: 100%)[
  *Théorème*

  Soit f une fonction définie sur un intervalle $[a, b]$ sauf peut-être en a et g une fonction définie sur un intervalle contenant $[a, b]$.

  Si g est continue à droite en a et si $g(x) = f(x)$ pour tout $x$ de $]a, b]$, alors $lim_(x arrow a^+) f(x) = g(a)$.

  Soit f une fonction définie sur un intervalle $[a, b]$ sauf peut-être en b et g une fonction définie sur un intervalle contenant $[a, b]$.

  Si g est continue à gauche en b et si $g(x) = f(x)$ pour tout $x$ de $[a, b[$, alors $lim_(x arrow b^-) f(x) = g(b)$.
]

==== Activité 4

On considère la fonction $f : x mapsto frac(x^2 - 9, sqrt((x - 3)^2))$ .

1. Donner l'ensemble de définition de f.

2. Donner l'expression de f(x) suivant les valeurs de x.

3. a. Calculer la limite de f à droite en 3.

#h(0.5cm) b. Calculer la limite de f à gauche en 3.

#h(0.5cm) c. La fonction f admet-elle une limite en 3 ?

// Source: Manuel T1 p.49
==== Activité 5

On considère la fonction $f : x mapsto frac(sqrt((x + 1)^2), x + 1)$ .

1. Donner l'ensemble de définition de f.

2. Donner l'expression de f(x) suivant les valeurs de x.

3. a. Calculer la limite de f à droite en $-1$.

#h(0.5cm) b. Calculer la limite de f à gauche en $-1$.

#h(0.5cm) c. La fonction f admet-elle une limite en $-1$ ?

==== Activité 6

Le plan est muni d'un repère orthonormé $(O, arrow(i), arrow(j))$.

Dans la figure, OABCD est un polygone.

Pour tout réel x appartenant à $[0, 6]$, on désigne par M le point du segment $[OD]$ d'abscisse x.

La droite passant par M et parallèle à l'axe des ordonnées coupe la ligne brisée OABC en un point N.

On désigne alors par R(x) la région du plan délimitée par l'axe des abscisses, la droite (MN) et la ligne brisée OABC.

1. a. Représenter R(x) pour x appartenant à $[0, 3]$.

#h(0.5cm) b. Représenter R(x) pour x appartenant à $[3, 6]$.

2. On note p(x) et a(x) le périmètre et l'aire de R(x).

#h(0.5cm) a. Calculer a(3) et p(3).

#h(0.5cm) b. Montrer que

$ a(x) = cases(
  frac(2, 3) x^2 & "si" 0 < x lt.eq 3,
  6x - 12 & "si" 3 < x lt.eq 6
) #h(1cm) "et" #h(1cm) p(x) = cases(
  frac(4x, 3) & "si" 0 < x lt.eq 3,
  2x + 10 & "si" 3 < x lt.eq 6
) $

#h(0.5cm) c. Représenter les fonctions a et p.

#h(0.5cm) d. Étudier la continuité des fonctions a et p en 3.

// Source: Manuel T1 p.50
== QCM -- Vrai -- Faux

=== QCM

Cocher la réponse exacte.

1. Si f et g sont continues sur $RR$ et $f(2) = g(2) = -2$, alors $lim_(x arrow 2) (f g)(x) =$

#h(1cm) $square$ 4 #h(2cm) $square$ $-2$ #h(2cm) $square$ 0.

2. Si f et g sont continues sur $RR$ et $f(2) = g(2) = -1$ alors $lim_(x arrow 2) frac(f, g) (x) =$

#h(1cm) $square$ 1 #h(2cm) $square$ $-1$ #h(2cm) $square$ $-2$.

3. Si f est continue sur $RR$ et $f(2) = 0$, alors $lim_(x arrow 2) f(x)(x^(100) + 4) =$

#h(1cm) $square$ 4 #h(2cm) $square$ $2^(100) + 4$ #h(2cm) $square$ 0.

4. $lim_(x arrow 0) (frac(x^(2006) + 1, (x + 1)^(2005))) =$

#h(1cm) $square$ 0 #h(2cm) $square$ 2006 #h(2cm) $square$ 1.

5. Dans le plan muni d'un repère $(O, arrow(i), arrow(j))$, $cal(C)_f$ est la courbe représentative de la fonction f.

Graphiquement on a $lim_(x arrow -1^+) f(x) =$

#h(1cm) $square$ 1 #h(2cm) $square$ 2 #h(2cm) $square$ 1.5.

#cetz.canvas({
  import cetz.draw: *
  // Axes
  line((-2, 0), (2, 0), stroke: 0.5pt, mark: (end: ">"))
  line((0, -0.5), (0, 2.5), stroke: 0.5pt, mark: (end: ">"))
  content((2, -0.3), $arrow(i)$)
  content((-0.3, 2.5), $arrow(j)$)
  content((0.2, -0.2), $O$)
  // Courbe Cf
  bezier((-1.5, 2), (-1, 1.5), (-1.3, 1.8), (-1.1, 1.5), stroke: red + 1.5pt)
  circle((-1, 1.5), radius: 0.05, fill: white, stroke: red + 1pt)
  circle((-1, 2), radius: 0.05, fill: red, stroke: red + 1pt)
  bezier((-1, 1.5), (1.5, 1.5), (-0.5, 1.5), (1, 1.5), stroke: red + 1.5pt)
  content((1.5, 1.8), text(fill: red)[$cal(C)_f$])
  // Projections
  line((-1, 0), (-1, 1.5), stroke: (dash: "dashed", paint: gray))
  content((-1, -0.3), $-1$)
  line((0, 1.5), (-1, 1.5), stroke: (dash: "dashed", paint: gray))
  content((-0.4, 1.5), $1.5$)
  line((0, 2), (-1, 2), stroke: (dash: "dashed", paint: gray))
  content((-0.3, 2), $2$)
})

=== Corrigé du QCM

1) $lim_(x arrow 2) (f dot g)(x) = 4$ #h(1cm) **(a)**

2) $lim_(x arrow 2) (frac(f, g))(x) = lim_(x arrow 2) frac(f(x), g(x)) = 1$ #h(1cm) **(a)**

3) c) $lim_(x arrow 2) f(x) dot (x^100 + 4) = 0$ #h(1cm) **(c)**

4) c) $lim_(x arrow 2) [frac(x^2006 + 1, (x + 1)^2005)] = 1$ #h(1cm) **(c)**

5) b) $lim_(x arrow (-1)^+) f(x) = 2$ #h(1cm) **(b)**

// Source: Corrige T1 p.27

=== Vrai -- Faux

Répondre par vrai ou faux en justifiant la réponse.

1. Si f n'est pas définie en a alors f n'admet pas de limite en a.

2. Si f n'admet pas de limite en a alors f n'est pas continue en a.

3. f admet une limite en a, si et seulement si, f admet une limite à droite en a ou à gauche en a.

4. Si $|f|$ admet une limite en a alors f admet une limite en a.

5. Si $|f|$ admet une limite égale à 0 en a alors f admet une limite égale à 0 en a.

// Source: Manuel T1 p.51
=== Corrigé Vrai – Faux

*1) Faux* : contre exemple :

$f(x) = frac(x^2 - 1, x - 1)$ , $D_f = I R without {1}$

Pour $x eq.not 1$ on $a$ : $f(x) = frac((x - 1)(x + 1), x - 1) = x + 1$

On pose $g(x) = x + 1$, $x in I R$

Ainsi on a pour $x eq.not 1$, $f(x) = g(x)$

$g$ est continue en 1 donc :

$lim_(x arrow 1) f(x) = g(1) = 2$

*2) Vrai* : théorème du cours : f continue en a si et seulement si $lim_(x arrow a) f(x) = f(a)$

*3) Faux* :

$lim_(x arrow a) f(x) = l arrow.l.r.double lim_(x arrow a^-) f(x) = lim_(x arrow a^+) f(x) = l$

*4) Faux* : contre exemple :

$ f(x) = cases(
  -1 & "si" x lt.eq 0,
  1 & "si" x > 0
) $

$|f(x)| = 1$ _pour tout_ $x in I R$

$lim_(x arrow 0) |f(x)| = 1$

mais $f$ n'admet pas de limite en 0.

car $( lim_(x arrow 0^+) f(x) = 1 ) eq.not ( lim_(x arrow 0^-) f(x) = -1 )$

*5) Vrai* #h(0.5cm) voir définition.

// Source: Corrige T1 p.27

== Mobiliser ses compétences

=== Situation 1

Soit a un réel.

On considère la fonction f définie sur $[-2 , +infinity[$ par $f : x mapsto cases(
  frac(sqrt(x + 2) - 1, x + 1) & "si" x eq.not -1,
  a & "si" x = -1
)$

Pour quelle valeur de a, la fonction f est-elle continue sur $[-2 , +infinity[$ ?

=== Situation 2

Dans le plan muni d'un repère orthogonal $(O, arrow(i), arrow(j))$, on a représenté graphiquement

les fonctions $f : x mapsto x^2 + 1$ et $g : x mapsto cases(
  -1 & "si" x lt.eq -2,
  x + 1 & "si" x > -2
)$ .

#cetz.canvas({
  import cetz.draw: *
  // Axes
  line((-4, 0), (4, 0), stroke: 0.5pt, mark: (end: ">"))
  line((0, -1.5), (0, 13), stroke: 0.5pt, mark: (end: ">"))
  content((4, -0.4), $arrow(i)$)
  content((-0.4, 13), $arrow(j)$)
  content((0.3, -0.3), $O$)
  // Courbe Cf = x^2 + 1 (parabole)
  bezier((-3, 10), (-1, 2), (-2, 5), (-1.5, 3), stroke: blue + 1.5pt)
  bezier((-1, 2), (0, 1), (-0.5, 1.3), (0, 1), stroke: blue + 1.5pt)
  bezier((0, 1), (1, 2), (0, 1), (0.5, 1.3), stroke: blue + 1.5pt)
  bezier((1, 2), (3, 10), (1.5, 3), (2, 5), stroke: blue + 1.5pt)
  content((3.2, 10), text(fill: blue)[$cal(C)_f$])
  // Courbe Cg
  line((-4, -1), (-2, -1), stroke: blue + 1.5pt)
  bezier((-2, -1), (3, 4), (-1, 0), (1, 2), stroke: blue + 1.5pt)
  content((3.2, 4.2), text(fill: blue)[$cal(C)_g$])
  // Graduations
  content((-3, -0.4), $-3$)
  content((-2, -0.4), $-2$)
  content((-1, -0.4), $-1$)
  content((1, -0.4), $1$)
  content((2, -0.4), $2$)
  content((3, -0.4), $3$)
  content((-0.4, 2), $2$)
  content((-0.4, 4), $4$)
  content((-0.4, 6), $6$)
  content((-0.4, 8), $8$)
  content((-0.4, 10), $10$)
  content((-0.4, 12), $12$)
})

1. On considère la fonction $h : x mapsto cases(
  f(x) & "si" x gt.eq 0,
  g(x) & "si" x < 0
)$

#h(0.5cm) a. Donner l'expression de h(x) sur $RR$.

#h(0.5cm) b. Étudier la continuité de la fonction h sur $RR$.

2. On considère la fonction $t : x mapsto cases(
  f(x) & "si" x gt.eq 0,
  |g(x)| & "si" x < 0
)$

#h(0.5cm) a. Représenter graphiquement la fonction t.

#h(0.5cm) b. Étudier la continuité de la fonction t sur $RR$.

// Source: Manuel T1 p.52
=== Corrigé – Mobiliser ses compétences

=== Situation 1

pour $x in [-2, +infinity[ without {-1}$

$f(x) = frac((sqrt(x + 2) - 1)(sqrt(x + 2) + 1), (x + 1)(sqrt(x + 2) + 1))$

$f(x) = frac(x + 1, (x + 1)(sqrt(x + 2) + 1))$

$f(x) = frac(1, 1 + sqrt(x + 2))$

pour $x in [-2, +infinity[$ , on pose :

$g(x) = frac(1, 1 + sqrt(x + 2))$

$g$ est continue en $(-1)$ et $f(x) = g(x)$ pour tout $x in [-2, +infinity[ without {-1}$

donc : $lim_(x arrow (-1)) f(x) = g(-1) = frac(1, 2)$

$f$ _est continue en_ $(-1)$ si et seulement si :

$lim_(x arrow (-1)) f(x) = f(-1) = a = frac(1, 2)$

et comme $f$ est continue sur $[-2, +infinity[ without {-1}$

alors $f$ est continue sur $x in [-2, +infinity[$

si et seulement si : $a = frac(1, 2)$

// Source: Corrige T1 p.28
=== Situation 2

1) a)

$ h(x) = cases(
  -1 & "si" x lt.eq -2,
  x + 1 & "si" -2 < x < 0,
  x^2 + 1 & "si" x gt.eq 0
) $

b) \* $h$ est continue sur chacun des intervalles

$]-infinity, -2[$ , $]-2, 0[$ et $]0, +infinity[$

\* _Continuité en_ $(-2)$

- pour $x in ]-infinity, -2[$ : $h(x) = f_1(x) = -1$

$f_1$ est continue à gauche en $(-2)$

donc : $lim_(x arrow (-2)^-) h(x) = f_1(-2) = -1 = h(-2)$

- pour $x in ]-2, 0[$ : $h(x) = f_2(x) = x + 1$

$f_2$ est continue à droite en $(-2)$

donc : $lim_(x arrow (-2)^+) h(x) = f_2(-2) = -1 = h(-2)$

$h$ est continue à droite et à gauche en $(-2)$

_d'où $h$ est continue en_ $(-2)$

\* de même $h$ est continue en 0.

*conclusion* : _$h$ est continue sur $I R$_

2) $t(x) = cases(
  f(x) & "si" x gt.eq 0,
  |g(x)| & "si" x < 0
)$

a) \[voir graphe ci-dessous\]

b) graphiquement : $t$ est continue sur IR

car $(C_t)$ ne représente ni un saut ni un trou.

#figure(
  cetz.canvas({
    import cetz.draw: *
    // Axes
    line((-5.5, 0), (5.5, 0), stroke: 0.5pt, mark: (end: ">"))
    line((0, -1.5), (0, 7), stroke: 0.5pt, mark: (end: ">"))
    content((5.5, -0.3), $x$)
    content((0.3, 7), $y$)

    // Grille
    for i in range(-5, 6) {
      if i != 0 {
        line((i, -0.1), (i, 0.1), stroke: 0.3pt)
        content((i, -0.4), text(size: 7pt, str(i)))
      }
    }
    for j in range(-1, 7) {
      if j != 0 {
        line((-0.1, j), (0.1, j), stroke: 0.3pt)
        content((-0.3, j), text(size: 7pt, str(j)))
      }
    }

    // Courbe C_t pour x < 0 : |g(x)| (parabole inversee)
    // Courbe part gauche: descend vers 1 en x=0
    bezier((-5, 1), (-2, 0.5), (-1, 0.8), (0, 1), stroke: 1pt)

    // Courbe C_t pour x >= 0 : f(x) (croissance rapide)
    bezier((0, 1), (1, 2), (2, 4), (3, 6), stroke: 1pt)

    content((2, 5), $C_t$)
  }),
  caption: [Courbe de $t$]
)

// Source: Corrige T1 p.29

== Exercices et problèmes

=== Exercice 1

Dans chacun des cas suivants, calculer la limite de la fonction f en a.

$f(x) = x^4 - x^3 + x + 1$ #h(1cm) ; #h(0.5cm) $a = -1$.

$f(x) = frac(6x^4 + x + 1, x^5 - x + 1)$ #h(1cm) ; #h(0.5cm) $a = 0.1$.

$f(x) = -x^5 - 2x(x - 1) + 5x^4 - 4$ #h(1cm) ; #h(0.5cm) $a = -1$.

$f(x) = frac(10, x^2) - 10x^3 + frac(root(5, x), 25) - 3$ #h(1cm) ; #h(0.5cm) $a = 0$.

$f(x) = -3(-2x + 1)^7$ #h(1cm) ; #h(0.5cm) $a = 1$.

$f(x) = frac(-10x^3, x + 2)$ #h(1cm) ; #h(0.5cm) $a = -3$.

$f(x) = frac(x^2 - 1, x + 2)$ #h(1cm) ; #h(0.5cm) $a = 0.1$.

==== Corrigé

1) $f$ est une fonction polynôme elle est donc continue en $(-1)$ donc :

$lim_(x arrow (-1)) f(x) = f(-1) = 2$

2) $f(x) = frac(6x^4 + x + 1, x^2 - x + 1)$

On a : $x^2 - x + 1 = 0$ avec $Delta = -3 < 0$

Donc $x^2 - x + 1 > 0$ par suite : $D_f = I R$

$f$ est une fonction rationnelle $(0, 1) in D_f$ donc $f$ est continue en $(0, 1)$

$lim_(x arrow (0, 1)) f(x) = f(0, 1) = frac(110,06, 91)$

3) $lim_(x arrow (-1)) f(x) = f(-1) = -12$

car $f$ est une fonction polynôme

4) $lim_(x arrow 0) f(x) = f(0) = -3$ #h(0.5cm) (fonction polynôme)

5) $lim_(x arrow 1) f(x) = f(1) = 3$ #h(0.5cm) (fonction polynôme)

6) $lim_(x arrow (-3)) f(x) = f(-3) = 90$

$f$ fonction rationnelle et $(-3) in D_f = I R without {-2}$

7) $lim_(x arrow (0, 1)) f(x) = f(0, 1) = -frac(900, 301)$

$f$ fonction rationnelle et $(0, 1) in D_f = I R$

// Source: Corrige T1 p.29

=== Exercice 2

Dans chacun des cas suivants, calculer la limite de la fonction f en a.

$f(x) = frac(x^2 - sqrt(2), x - sqrt(2))$ #h(1cm) ; #h(0.5cm) $a = 0$.

$f(x) = frac(-2(x^3 + 50), x - 50)$ #h(1cm) ; #h(0.5cm) $a = 50$.

$f(x) = frac(x, (x - 10)^2)$ #h(1cm) ; #h(0.5cm) $a = 20$.

$f(x) = frac(3x^2 - 3, x + 1)$ #h(1cm) ; #h(0.5cm) $a = -1$.

$f(x) = frac(|x|, x^2)$ #h(1cm) ; #h(0.5cm) $a = 0$.

$f(x) = frac(|x|, 4 + pi)$ #h(1cm) ; #h(0.5cm) $a = 0$.

$f(x) = frac(|-2x^5|, x^4)$ #h(1cm) ; #h(0.5cm) $a = -2$.

$f(x) = frac(x^3, x^2)$ #h(1cm) ; #h(0.5cm) $a = -1$.

==== Corrigé

1) $f(x) = |frac(x^2 - sqrt(2), 2x + 1)|$

$f = |g|$ avec $g(x) = frac(x^2 - sqrt(2), 2x + 1)$ ;

$D_g = I R without {-1\/2}$

$g$ est une fonction rationnelle et $0 in D_g$ donc $g$ est continue en 0, par suite $f$ est continue en 0.

d'où : $lim_(x arrow 0) f(x) = f(0) = sqrt(2)$

2) $f = frac(f_1, f_2)$ avec $f_1(x) = -|x| + 50$ ; $f_2(x) = (x - 10)^2$

$f_1$ et $f_2$ sont continues en 20 et $f_2(20) = 10 eq.not 0$

d'où

$lim_(x arrow 20) f(x) = f(20) = frac(3, 10)$

3) $f$ est continue sur IR (quotient de deux fonctions continues sur IR et $|x|^3 + pi eq.not 0$) comme $0 in I R$

on aura $lim_(x arrow 0) f(x) = f(0) = frac(sqrt(2), pi)$

4) de même : $lim_(x arrow (-2)) f(x) = f(-2) = frac(-116, 3)$

5) $lim_(x arrow (-1)) f(x) = f(-1) = 2$ #h(0.5cm) (pour la même raison)

// Source: Corrige T1 p.29

=== Exercice 3

Dans chacun des cas suivants, calculer la limite de la fonction f en a.

$f(x) = frac(sqrt(x + 3) - 3, x)$ #h(1cm) ; #h(0.5cm) $a = 6$.

$f(x) = frac(2sqrt(x) - 1, x - 1)$ #h(1cm) ; #h(0.5cm) $a = 0.25$.

$f(x) = frac(x^2 - 4, sqrt(x) - 2)$ #h(1cm) ; #h(0.5cm) $a = 4$.

$f(x) = frac(sqrt(x^2 + 3) - 2, x - 1)$ #h(1cm) ; #h(0.5cm) $a = 1$.

==== Corrigé

1) $f(x) = sqrt(3x - 5)$

$f = sqrt(g)$ _avec_ $g = 3x - 5$

La fonction $g$ est définie et positive sur $]frac(5, 3), +infinity[$

et on a : $8 in ]frac(5, 3), +infinity[$

Comme $g$ est continue en 8 (fonction polynôme) alors $f = sqrt(g)$ est continue en 8.

par suite : $lim_(x arrow 8) f(x) = f(8) = sqrt(19)$

2) $f(x) = sqrt(-2x + 1)$

$f$ est continue en 0,002 #h(0.5cm) ( même raison que 1) )

d'où : $lim_(x arrow 0,02) f(x) = f(0,02) = 0,96$

// Source: Corrige T1 p.30
3) $f(x) = sqrt(2x^2 - 3x + 4)$

$g(x) = 2x^2 - 3x + 4 = 0$ avec $Delta = -21 < 0$ donc le trinôme $g$ est strictement positif sur IR

$f = sqrt(g)$ #h(0.5cm) ( $g$ est définie et positive sur tout IR)

_$g$ est continue en_ $(-1, 23)$ #h(0.5cm) (polynôme)

Alors $f = sqrt(g)$ est continue en $(-1, 23)$

Donc : $lim_(x arrow (-1, 23)) f(x) = f(-1, 23) = sqrt(3, 3358) approx 1,84$

4) $f(x) = (-x + 5)^2 + sqrt(2x^2 + 3x + 5)$

$2x^2 - 3x + 4 > 0$ car $Delta < 0$ et $a = 2 > 0$

\* $x arrow.r sqrt(2x^2 + 3x + 5)$ continue sur IR

\* $x arrow.r (-x + 5)^2$ polynôme donc continue sur IR

donc $f$ _est continue en_ $0 in I R$ , par suite :

$lim_(x arrow 0) f(x) = f(0) = 25 + sqrt(5)$

5) \* $x arrow.r sqrt(3x^2 + 2)$ continue sur IR car $3x^2 + 2 gt.eq 0$

\* $(-1)^4 - 8(-1) + 1 = 10 eq.not 0$ donc

$x arrow.r (-3 times frac(x^2 - 3x + 2, x^4 - 8x + 1))$ est continue en $(-1)$

finalement $f$ est la somme de deux fonctions continues en $(-1)$ donc elle est continue en $(-1)$

d'où $lim_(x arrow (-1)) f(x) = f(-1) = sqrt(5) - frac(9, 5)$

// Source: Corrige T1 p.30

=== Exercice 4

Dans chacun des cas suivants, calculer la limite de la fonction f en a.

$f(x) = frac(1, 1 - x) - frac(3, 1 - x^3)$ #h(1cm) ; #h(0.5cm) $a = 1$.

$f(x) = x - 1 - frac(2, x + 1)$ #h(1cm) ; #h(0.5cm) $a = 1$.

$f(x) = frac(x + 1, x^2) - frac(1, x)$ #h(1cm) ; #h(0.5cm) $a = 0$.

$f(x) = frac(x^3 + 27, x^2 + x - 6)$ #h(1cm) ; #h(0.5cm) $a = -3$.

$f(x) = frac(sqrt(x + 6) - x, x^3 - 8)$ #h(1cm) ; #h(0.5cm) $a = 0$.

$f(x) = frac(1, sqrt(x + 1) - 1)$ #h(1cm) ; #h(0.5cm) $a = 0$.

==== Corrigé

1) $f(x) = frac(x(x^2 - 2), x - sqrt(2))$

pour $x eq.not sqrt(2)$ ; $f(x) = frac(x(x - sqrt(2))(x + sqrt(2)), x - sqrt(2)) = x(x + sqrt(2))$

On pose $g(x) = x dot (x + sqrt(2))$

pour $x eq.not sqrt(2)$, on a : $f(x) = g(x)$

de plus $g$ est continue en $sqrt(2)$

d'où : $lim_(x arrow sqrt(2)) f(x) = g(sqrt(2)) = 4$

2) $f(x) = frac(x^2 - 3x + 2, x - 1)$

on rappelle que :

$a x^2 + b x + c = a(x - x')(x - x'')$

_or_ dans l'équation : $x^2 - 3x + 2 = 0$

$a + b + c = 0 arrow.double x' = 1$ _et_ $x'' = frac(c, a) = 2$

_d'où_ : $x^2 - 3x + 2 = (x - 1)(x - 2)$

pour $x eq.not 1$, $f(x) = frac((x - 1)(x - 2), x - 1) = x - 2$

on pose $g(x) = x - 2$

_pour_ $x eq.not 1$, _on a_ : $f(x) = g(x)$

On sait que $g$ est continue en 1

d'où $lim_(x arrow 1) f(x) = g(1) = -1$

3) $f(x) = frac(x^2 - 2x, x^2 - 5x + 6)$

dans l'équation : $x^2 - 5x + 6 = 0$

$Delta = 1 arrow.double x' = 2$ _et_ $x'' = 3$

_d'où_ : $x^2 - 5x + 6 = (x - 2)(x - 3)$

Pour $x eq.not 2$ et $x eq.not 3$ :

$f(x) = frac(x(x - 2), (x - 2)(x - 3)) = frac(x, x - 3)$

On pose $g(x) = frac(x, x - 3)$

$g$ est continue en 2

( fonction rationnelle et $2 in D_g = I R without {3}$ )

// Source: Corrige T1 p.31
et pour $x eq.not 2$ , $f(x) = g(x)$

d'où $lim_(x arrow 2) f(x) = g(2) = -2$

4) $f(x) = frac(sqrt(x + 3) - 1, x + 2)$ ; $D_f = [-3, +infinity[ without {-2}$

pour $x eq.not -2$ : $f(x) = frac((sqrt(x + 3) - 1)(sqrt(x + 3) + 1), (x + 2)(sqrt(x + 3) + 1))$

$f(x) = frac((sqrt(x + 3))^2 - 1, (x + 2)(sqrt(x + 3) + 1))$

$f(x) = frac(x + 2, (x + 2)(sqrt(x + 3) + 1))$

$f(x) = frac(1, sqrt(x + 3) + 1)$

on pose : $g(x) = frac(1, sqrt(x + 3) + 1)$

pour $x eq.not -2$, $f(x) = g(x)$

de plus $g$ est continue en $(-2)$

d'où : $lim_(x arrow (-2)) f(x) = g(-2) = frac(1, 2)$

5) $f(x) = |frac(x^3 + 27, x + 3)|$

On sait que : $(a^3 + b^3) = (a + b)(a^2 - a b + b^2)$

Donc pour $x eq.not 3$ on a :

$f(x) = |frac((x + 3)(x^2 - 3x + 9), (x + 3))|$

$f(x) = |x^2 - 3x + 9|$

On pose $g(x) = x^2 - 3x + 9$

_pour_ $x eq.not 3$ _on a_ $f(x) = |g(x)|$

// Source: Corrige T1 p.31
$g$ est continue en $(-3)$ , par suite :

$lim_(x arrow (-3)) f(x) = |g(-3)| = 27$

6) $f(x) = frac(sqrt(x + 6) - sqrt(6), sqrt(x))$ ; $D_f = ]0, +infinity[$

pour $x > 0$, on a

$f(x) = frac((sqrt(x + 6) - sqrt(6))(sqrt(x + 6) + sqrt(6)), sqrt(x)(sqrt(x + 6) + sqrt(6)))$

$f(x) = frac(x, sqrt(x)(sqrt(x + 6) + sqrt(6))) = frac(sqrt(x), sqrt(x + 6) + sqrt(6))$

on pose : $g(x) = frac(sqrt(x), sqrt(x + 6) + sqrt(6))$

$g$ est continue à droite en 0.

et $f(x) = g(x)$ _pour_ $x > 0$

Donc : $lim_(x arrow 0^+) f(x) = g(0) = 0$

7) $f(x) = frac(frac(1, 1 + x) - 1, x)$

pour $x in D_f = I R^* without {-1}$

$f(x) = frac(1 - (1 + x), x(1 + x)) = -frac(cancel(x), cancel(x)(x + 1)) = -frac(1, x + 1)$

pour $x eq.not 0$, on a : $f(x) = g(x)$

de plus $g$ est continue en 0 d'où :

$lim_(x arrow 0) f(x) = g(0) = -1$

8) pour $x in D_f = [-1, +infinity[ without {0}$

// Source: Corrige T1 p.32
$f(x) = frac((sqrt(1 + x) - 1)(sqrt(1 + x) + 1), x(sqrt(1 + x) + 1))$

$= frac((sqrt(1 + x))^2 - 1^2, x(sqrt(1 + x) + 1))$

$f(x) = frac(1 + x - 1, x(sqrt(1 + x) + 1)) = frac(cancel(x), cancel(x)(sqrt(1 + x) + 1))$

$arrow.double f(x) = frac(1, sqrt(1 + x) + 1)$

$f(x) = g(x) = frac(1, sqrt(1 + x) + 1)$

$g$ est continue en 0 d'où $lim_(x arrow 0) f(x) = g(0) = frac(1, 2)$

// Source: Corrige T1 p.32

=== Exercice 5

Soit f la fonction définie sur $]-2, 1[$ par

$ f(x) = cases(
  x^2 & "si" x in ZZ,
  x & "si" x in.not ZZ
) $

1. Justifier que f est continue sur chacun des intervalles $]-2, -1[$, $]-1, 0[$ et $]0, 1[$.

2. Déterminer les limites suivantes :

$lim_(x arrow 0^-) f(x)$ #h(0.5cm) ; #h(0.5cm) $lim_(x arrow 0^+) f(x)$ #h(0.5cm) ; #h(0.5cm) $lim_(x arrow (-1)^-) f(x)$ #h(0.5cm) ; #h(0.5cm) $lim_(x arrow (-1)^+) f(x)$.

3. En déduire que f est continue sur $]-1, 1[$ et que f n'est pas continue sur $]-2, 0[$.

==== Corrigé

$ f(x) = cases(
  x^2 & "si" x = -1 "ou" x = 0,
  x & "si" x in ]-2 \, -1[ union ]-1 \, 0[ union ]0 \, 1[
) $

1) pour $x in ]-2, -1[$

$f(x) = x$

on sait que la fonction : $x arrow.r x$ est continue sur $I R$ en particulier sur $]-2, -1[$ par suite $f$ est continue sur $]-2, -1[$.

de même : $f$ est continue sur chacun des intervalles $]-1, 0[$ et $]0, 1[$.

2) \* pour $x in ]-2, -1[$ ; $f(x) = g(x) = x$

$g$ est continue à droite en $(-1)$ d'où

$lim_(x arrow (-1)^-) f(x) = g(-1) = -1$

de même on a :

\* $lim_(x arrow (-1)^+) f(x) = g(-1) = -1$

\* $lim_(x arrow 0^-) f(x) = g(0) = 0$

\* $lim_(x arrow 0^+) f(x) = g(0) = 0$

3) \* $f$ est continue sur chacun des intervalles

$]-1, 0[$ et $]0, 1[$.

// Source: Corrige T1 p.32
\* _continuité en 0_

\* $lim_(0^+) f = lim_(0^-) f = 0 arrow.l.r.double lim_(x arrow 0) f(x) = 0$

$lim_(x arrow 0) f(x) = 0 = f(0)$ donc :

$f$ est continue en 0 par suite $f$ est continue sur $]-1, 1[$.

\* _continuité en_ $(-1)$

on a : $f(-1) = (-1)^2 = 1$

$lim_((-1)^+) f = lim_((-1)^-) f = -1$

d'où $lim_(x arrow (-1)) f(x) = -1 eq.not f(-1)$

Donc $f$ n'est pas continue en $(-1)$ par suite $f$ n'est pas continue sur $]-2, 0[$.

// Source: Corrige T1 p.32

=== Exercice 6

Soit f, g et h les fonctions définies sur $RR$ par

$f(x) = |x|$ #h(1cm) ; #h(0.5cm) $g(x) = cases(
  0 & "si" x < 1,
  x^2 + 1 & "si" x gt.eq 1
)$ #h(1cm) et #h(0.5cm) $h(x) = cases(
  frac(x^3, x) & "si" x eq.not 0,
  1 & "si" x = 0
)$

// Source: Manuel T1 p.53
1. Déterminer les fonctions $f + g$ ; $f g$ ; fh.

2. Étudier la continuité de chacune des fonctions $f + g$, $f dot g$, fh sur les intervalles $]-infinity , 1[$ et $]1, +infinity[$.

3. Étudier la continuité en 1 de chacune des fonctions $f + g$, $f dot g$, fh.

==== Corrigé

1)

\* $(f + g)(x) = cases(
  x - 1 & "si" x < 1,
  x^2 + x & "si" x gt.eq 1
)$

\* $(f dot g)(x) = cases(
  0 & "si" x < 1,
  (x - 1)(x^2 + 1) & "si" x gt.eq 1
)$

\* $(f dot h)(x) = cases(
  0 & "si" x < 1,
  1 & "si" x gt.eq 1
)$

2) $bullet$ soit $f_1$ et $f_2$ les fonctions définies sur IR par :

$f_1(x) = 0$ _et_ $f_2(x) = x^2 + 1$

\* $f_1$ est continue sur tout IR en particulier sur $]-infinity, 1[$

par suite $f$ est continue sur $]-infinity, 1[$

\* $f_2$ est continue sur tout IR en particulier _sur_ $]1, +infinity[$

par suite $f$ est continue _sur_ $]1, +infinity[$

// Source: Corrige T1 p.33
$bullet$ soit $f_3$ et $f_4$ les fonctions définies sur IR par :

$f_3(x) = x - 1$ _et_ $f_4(x) = x^2 + x$

\* $f_3$ est continue sur tout IR en particulier sur $]-infinity, 1[$ par suite $f + g$ est continue sur $]-infinity, 1[$

\* $f_4$ est continue sur tout IR en particulier _sur_ $]1, +infinity[$ par suite $f + g$ est continue _sur_ $]1, +infinity[$

\* de même les fonctions, $f dot g$ _et_ $f dot h$ sont continues sur chacun des intervalles $]-infinity, 1[$ _et_ $]1, +infinity[$

3) a) continuité de $f$ _en_ 1

on a : $f(1) = 2$

\* pour $x < 1$ on a : $f(x) = f_1(x) = 0$

$f_1$ est continue en 1 (fonction constante)

d'où : $lim_(x arrow 1^-) f(x) = f_1(1) = 0 eq.not f(1)$

$f$ n'est pas continue à gauche en 1 donc $f$ n'est pas continue en 1

b) continuité de $(f + g)$ en 1

on a : $(f + g)(1) = 2$

Pour $x < 1$ : $(f + g)(x) = g(x) = x - 1$

$g$ est continue en 1 d'où :

$lim_(x arrow 1^-) (f + g)(x) = g(1) = 0 eq.not (f + g)(1)$

la fonction $(f + g)$ n'est pas continue en 1.

c) _continuité de_ $(f dot g)$ en 1

on a : $(f dot g)(1) = 0$

pour $x < 1$ : $(f dot g)(x) = f_1(x) = 0$

$f_1$ est continue en 1 d'où :

$lim_(x arrow 1^-) (f dot g)(x) = f_1(1) = 0 = (f dot g)(1)$

$(f dot g)$ est continue à gauche en 1

pour $x gt.eq 1$ :

$(f dot g)(x) = f_3(x) = (x - 1)(x^2 + 1)$

$f_3$ est continue en 1 , d'où :

$lim_(x arrow 1^+) (f dot g)(x) = f_3(1) = 0 = (f dot g)(1)$

$(f dot g)$ est continue en 1 par suite $(f dot g)$ est continue en 1.

d) continuité de $(f dot h)$ en 1

on a : $(f dot h)(1) = 1$

pour $x < 1$ : $(f dot h)(x) = f_1(x) = 0$

$f_1$ est continue d'où :

$lim_(x arrow 1^-) (f dot h)(x) = f_1(1) = 0 eq.not (f dot h)(1)$

$(f dot h)$ n'est pas continue en 1.

// Source: Corrige T1 p.33

=== Exercice 7

Soit la fonction f définie sur $RR$ par

$ f(x) = cases(
  frac((x - 3)^2, |x - 3|) & "si" x eq.not 3,
  0 & "si" x = 3
) $

1. Représenter f dans le plan muni d'un repère.

2. Étudier la continuité de f à droite et à gauche en 3.

3. La fonction f est-elle continue en 3 ?

4. La fonction f est-elle continue sur $RR$ ?

==== Corrigé

$ f(x) = cases(
  frac((x - 3)^2, |x - 3|) & "si" x eq.not 3,
  0 & "si" x = 3
) $

1) pour $x eq.not 3$

$f(x) = frac(|x - 3|^2, |x - 3|) = |x - 3|$ #h(1cm) et $f(3) = 0$

#figure(
  cetz.canvas({
    import cetz.draw: *
    // Axes
    line((-3.5, 0), (8.5, 0), stroke: 0.5pt, mark: (end: ">"))
    line((0, -1.5), (0, 7), stroke: 0.5pt, mark: (end: ">"))
    content((8.5, -0.3), $x$)
    content((0.3, 7), $y$)

    // Ticks
    for i in range(-3, 9) {
      if i != 0 {
        line((i, -0.1), (i, 0.1), stroke: 0.3pt)
      }
    }
    for j in range(-1, 7) {
      if j != 0 {
        line((-0.1, j), (0.1, j), stroke: 0.3pt)
      }
    }

    // |x - 3| pour x < 3 : -(x-3) = 3-x
    line((-2, 5), (3, 0), stroke: 1pt)
    // |x - 3| pour x >= 3 : x-3
    line((3, 0), (8, 5), stroke: 1pt)

    content((5, 4), $C_f$)
  }),
  caption: [Courbe de $f(x) = |x - 3|$]
)

2) pour $x > 3$ : $f(x) = frac((x - 3)^2, (x - 3)) = x - 3 = g(x)$

$g$ est continue à droite en 3 (fonction polynôme)

// Source: Corrige T1 p.34
d'où : $lim_(x arrow 3^+) f(x) = g(3) = 0 = f(3)$

$f$ est continue à droite en 3, de même, $f$ est continue à gauche en 3.

3) $f$ est continue à droite et à gauche en 3, d'ou $f$ est continue en 3.

4) $f(x) = |x - 3|$ pour tout $x in I R$

(voir question (1))

$x arrow.r (x - 3)$ est continue sur $I R$

d'ou $f$ est continue sur tout $I R$.

// Source: Corrige T1 p.34

=== Exercice 8

Soit la fonction f définie sur $RR$ par

$ f(x) = cases(
  x^2 - 2 & "si" x lt.eq 2,
  sqrt(x + 2) & "si" x > 2
) $

1. Étudier la continuité de f à droite et à gauche en 2.

2. La fonction f est-elle continue en 2 ?

==== Corrigé

$ f(x) = cases(
  x^2 - 2 & "si" x lt.eq 2,
  sqrt(x + 2) & "si" x > 2
) $

1) $f(2) = 2^3 - 2 = 6$

\* pour $x in ]-infinity, 2[$ ; $f(x) = x^3 - 2 = g(x)$

la fonction $g$ est une fonction polynôme, elle est donc continue à gauche en 2.

donc : $lim_(x arrow 2^-) f(x) = g(2) = 6 = f(2)$

$f$ est continue à gauche en 2.

- pour $x in ]2, +infinity[$ $f(x) = sqrt(x + 2) = h(x)$

$h$ est continue à droite en 2.

$lim_(x arrow 2^+) f(x) = h(2) = sqrt(4) = 2 eq.not f(2)$

$f$ n'est pas continue à droite en 2.

2) $f$ n'est pas continue à droite en 2 donc f n'est pas continue en 2.

// Source: Corrige T1 p.34

=== Exercice 9

Soit la fonction f définie sur $RR$ par

$ f(x) = cases(
  1 + sqrt(x) & "si" x gt.eq 0,
  -1 - sqrt(-x) & "si" x < 0,
  0 & "si" x = 0
) $

1. Étudier la continuité de f à droite et à gauche en 0.

2. La fonction f est-elle continue en 0 ?

==== Corrigé

$ f(x) = cases(
  1 + sqrt(x) & "si" x > 0,
  -1 - sqrt(-x) & "si" x < 0,
  0 & "si" x = 0
) $

1) $f(0) = 0$

\* pour $x in ]0, +infinity[$

$f(x) = 1 + sqrt(x) = g(x)$

$g$ est continue à droite en 0 d'où :

$lim_(x arrow 0^+) f(x) = g(0) = 1$

$lim_(x arrow 0^+) f(x) eq.not f(0)$

$f$ n'est pas continue à droite en 0.

\* de même f n'est pas continue à gauche en 0 car :

$lim_(x arrow 0^-) f(x) = -1 eq.not f(0)$

2) $f$ n'est pas continue en 0

// Source: Corrige T1 p.35

=== Exercice 10

Soit la fonction f définie sur $RR$ par

$ f(x) = cases(
  |x| sqrt(|x|) & "si" x eq.not 0,
  0 & "si" x = 0
) $

1. Étudier la continuité de f à droite et à gauche en 0.

2. La fonction f est-elle continue en 0 ?

3. Étudier la continuité de f sur $RR$.

==== Corrigé

$ f(x) = cases(
  frac(|x|, x) dot sqrt(|x|) & "si" x eq.not 0,
  0 & "si" x = 0
) $

1) \* pour $x in ]0, +infinity[$

$f(x) = frac(x, x) dot sqrt(x) = sqrt(x) = g(x)$

$g$ est continue à droite en 0 d'où :

$lim_(x arrow 0^+) f(x) = g(0) = 0 = f(0)$

Donc $f$ est continue à droite en 0

\* pour $x in ]-infinity, 0]$

$f(x) = frac(-x, x) dot sqrt(-x) = -sqrt(-x) = h(x)$

$h$ est continue à gauche en 0 d'où

$lim_(x arrow 0^-) f(x) = h(0) = 0 = f(0)$

Par suite $f$ est continue à gauche en 0.

2) $f$ est continue à droite et à gauche en 0 il résulte que $f$ est continue en 0.

// Source: Corrige T1 p.35

=== Exercice 11

On considère la fonction f définie sur $RR backslash {-frac(1, 3)}$ par $f(x) = frac((3x + 1)^2, 3x + 1)$ .

1. Déterminer la limite de f à droite en $-frac(1, 3)$.

2. Déterminer la limite de f à gauche en $-frac(1, 3)$.

3. La fonction f admet-elle une limite en $-frac(1, 3)$ ?

==== Corrigé

$f(x) = frac(sqrt((3x + 1)^2), 3x + 1)$ , #h(0.5cm) $D f = I R without {-frac(1, 3)}$

1) Pour $x eq.not -frac(1, 3)$

$(3x + 1)^2 = |3x + 1|^2 arrow.double f(x) = frac(|3x + 1|, 3x + 1)$

*Tableau de signe de $(3x + 1)$*

#table(
  columns: 4,
  align: center,
  [$x$], [$-infinity$], [$-frac(1, 3)$], [$+infinity$],
  [$3x + 1$], [$-$], [$0$], [$+$],
)

$bullet$ Pour $x in ]-frac(1, 3), +infinity[$ : $f(x) = frac(3x + 1, 3x + 1) = 1 = g(x)$

$g$ est continue à droite en $(-frac(1, 3))$ (fonction constante)

d'où : $lim_(x arrow (-frac(1, 3))^+) f(x) = g(-frac(1, 3)) = 1$.

2) pour $x in ]-infinity, -frac(1, 3)[$

$f(x) = frac(-(3x + 1), 3x + 1) = -1 = h(x)$

$h$ est continue à gauche en $(-frac(1, 3))$

d'où : $lim_(x arrow (-frac(1, 3))^-) f(x) = h(-frac(1, 3)) = -1$

3) $lim_(x arrow (-frac(1, 3))^-) f(x) eq.not lim_(x arrow (-frac(1, 3))^+) f(x)$

$f$ n'admet pas de limite en $(-frac(1, 3))$.

// Source: Corrige T1 p.35

=== Exercice 12

On considère la fonction $f : x mapsto frac(x^2 - 4, sqrt(x + 2))$ .

Calculer les limites de f en $-2$ et en 2.

==== Corrigé

$f(x) = frac(x^2 - 4, |x - 2|)$

$bullet$ $f$ est continue en $(-2)$

Donc : $lim_(x arrow (-2)) f(x) = f(-2) = frac(0, 4) = 0$

*Tableau de signe de $(x - 2)$*

#table(
  columns: 4,
  align: center,
  [$x$], [$-infinity$], [$2$], [$+infinity$],
  [$x - 2$], [$-$], [$0$], [$+$],
)

$bullet$ Pour $x in ]-infinity, 2[$

$f(x) = frac((x - 2)(x + 2), -(x - 2)) = -(x + 2) = g(x)$

$g$ est continue à gauche en 2 (fonction polynôme)

d'où : $lim_(x arrow 2^-) f(x) = g(2) = -4$

// Source: Corrige T1 p.36
$bullet$ Pour $x in ]2, +infinity[$

$f(x) = frac((x - 2)(x + 2), (x - 2)) = x + 2 = h(x)$

$h$ est continue à droite en 2 (polynôme)

d'où : $lim_(x arrow 2^+) f(x) = h(2) = 4$

Ainsi on trouve : $lim_(2^-) f eq.not lim_(2^+) f$

Ce qui prouve que $f$ n'admet pas de limite en 2.

// Source: Corrige T1 p.36

=== Exercice 13

On considère la fonction f définie sur $RR backslash {frac(1, 2)}$ par

$ f(x) = cases(
  frac(x - 4, sqrt(x + 2) - 3) & "si" x lt.eq 2,
  frac(-2, sqrt(x + 2) - 3) & "si" x > 2
) $

1. Déterminer la limite de f à droite en 2.

2. Déterminer la limite de f à gauche en 2.

3. La fonction f admet-elle une limite en 2 ?

4. La fonction f est-elle prolongeable par continuité en 2 ?

==== Corrigé

$ x arrow.r cases(
  f(x) = frac(x^2 - 4, x - 2) & "si" x < 2,
  f(x) = frac(x - 2, sqrt(x + 2) - 2) & "si" x > 2
) $

1) pour $x in ]2, +infinity[$

$f(x) = frac((x - 2)(sqrt(x + 2) + 2), (sqrt(x + 2) - 2)(sqrt(x + 2) + 2))$

$= frac((x - 2)(sqrt(x + 2) + 2), sqrt(x + 2)^2 - 2^2)$

$= frac((x - 2)(sqrt(x + 2) + 2), x + 2 - 4)$

$= frac((x - 2)(sqrt(x + 2) + 2), (x - 2)) = sqrt(x + 2) + 2 = g(x)$

$g$ est continue à droite en 2

d'où : $lim_(x arrow 2^+) f(x) = g(2) = 4$

2) pour $x in ]-infinity, 2[$

$f(x) = frac((x - 2)(x + 2), x - 2) = x + 2 = h(x)$

$h$ est continue à gauche en 2 (polynôme)

d'où : $lim_(x arrow (2)^-) f(x) = h(2) = 4$

3) $lim_(x arrow (2)^-) f(x) = lim_(x arrow (2)^+) f(x) = 4$

Par suite : $lim_(x arrow 2) f(x) = 4$

4) _On a_ : $lim_(x arrow 2) f(x) = 4$ (nombre fini)

Donc $f$ est prolongeable par continuité en 2

son prolongement par continuité est la fonction $F$

défini par $F(x) = cases(
  f(x) "si" x eq.not 2,
  4 "si" x = 2
)$

// Source: Corrige T1 p.36

=== Exercice 14

On considère la fonction f définie sur $]-1 , +infinity[ backslash {0}$ par

$f(x) = frac(x^2 + 2x, x^2 - x)$ .

1. Calculer la limite de f en 0.

2. La fonction f est-elle prolongeable par continuité en 0 ? Si oui définir ce prolongement.

==== Corrigé

$f(x) = frac(x^2 + 2x, x^2 - x)$

1) Pour $x eq.not 0$

$f(x) = frac(x^2 + 2x, x^2 - x) = frac(x(x + 2), x(x - 1)) = frac(x + 2, x - 1) = g(x)$

$g$ est une fonction rationnelle et $0 in D_g$

$lim_(x arrow 0) f(x) = g(0) = -2$

2) $lim_(x arrow 0) f(x) = -2$ #h(0.5cm) ( nombre fini )

Donc $f$ est prolongeable par continuité en 0

Son prolongement est définie par

$F(x) = cases(
  f(x) & "si" x eq.not 0,
  -2 & "si" x = 0
)$

// Source: Corrige T1 p.36-37

=== Exercice 15

Étudier la continuité sur $]-1, 2]$ de la fonction $x mapsto (x - 1) dot E(x)$ (E(x) désigne la partie entière de x.

// Source: Manuel T1 p.54

==== Corrigé

pour $x in [-1, 2]$ , $f(x) = (x - 1) dot E(x)$

Si $x in [-1, 0[$ _alors_ $E(x) = -1$

Si $x in [0, 1[$ _alors_ $E(x) = 0$

Si $x in [1, 2[$ _alors_ $E(x) = 1$

d'où :

$ f(x) = cases(
  -(x - 1) & "si" x in [-1 \, 0[,
  0 & "si" x in [0 \, 1[,
  x - 1 & "si" x in [1 \, 2[,
  2 & "si" x = 2
) $

// Source: Corrige T1 p.37
\* _Continuité de $f$ en 0_ :

$f(0) = 0$

pour $x in [-1, 0[$ , $f(x) = -x + 1 = g(x)$

$g$ est continue à gauche en 0 d'où :

$lim_(x arrow 0^-) f(x) = g(0) = 1$ #h(0.5cm) or #h(0.5cm) $f(0) = 0$

donc : $lim_(x arrow 0^-) f(x) eq.not f(0)$

$f$ n'est pas continue en 0

\* _Continuité de $f$ en 1_

$f(1) = 0$

$lim_(x arrow 1^-) f(x) = 0 = f(1)$

$lim_(x arrow 1^+) f(x) = lim_(x arrow 1^+) lim_(x arrow 1^+) (x - 1) = 0 = f(1)$

Par suite $f$ est continue en 1.

\* pour $x in [1, 2[$ , $f(x) = x - 1 = h(x)$

$h$ est continue à gauche en 2 d'où :

$lim_(x arrow 2^-) f(x) = h(2) = 1 eq.not f(2)$

$f$ n'est pas continue à gauche en 2.

_Conclusion_ : $f$ est continue sur chacun des intervalles $[-1, 0]$ et $[0, 2[$

// Source: Corrige T1 p.37

=== Exercice 16

On considère la fonction f définie sur $]-1, +infinity[$ par

$ f(x) = cases(
  frac(sqrt(x + 1) - 1, x) & "si" x eq.not 0,
  0.5 & "si" x = 0
) $

Montrer que la fonction f est continue sur $]-1, +infinity[$.

==== Corrigé

$ f(x) = cases(
  frac(sqrt(x + 1) - 1, x) & "si" x eq.not 0,
  frac(1, 2) & "si" x = 0
) $

pour $x eq.not 0$

$f(x) = frac((sqrt(x + 1) - 1)(sqrt(x + 1) + 1), x(sqrt(x + 1) + 1))$

$arrow.double f(x) = frac(1, sqrt(x + 1) + 1) = g(x)$

$g$ _est continue en 0_ d'où :

D'où $lim_(x arrow 0) f(x) = g(0) = frac(1, 2)$

$lim_(x arrow 0) f(x) = frac(1, 2) = f(0)$

_donc $f$ est continue en 0_

et comme $f$ est continue sur $[-1, +infinity[ without {0}$

Alors : $f$ est continue sur $[-1, +infinity[$

// Source: Corrige T1 p.37

=== Exercice 17

On considère la fonction f définie sur $RR$ par

$ f(x) = cases(
  2x + 1 & "si" x > 1,
  x - 1 & "si" 0 lt.eq x < 1,
  frac(x + 1, x - 1) & "si" x < 0
) $

1. Représenter f dans un repère $(O, arrow(i), arrow(j))$.

2. Étudier la continuité de f sur $RR$.

==== Corrigé

$ f(x) = cases(
  2x + 1 & "si" x gt.eq 1,
  x - 1 & "si" 0 lt.eq x < 1,
  frac(x + 1, x - 1) & "si" x < 0
) $

1) pour $x < 0$ $f(x) = frac((x - 1) + 2, x - 1) = 1 + frac(2, x - 1)$

$(H)$ : $y = 1 + frac(2, x - 1)$

$(H)$ : hyperbole de centre $w(1, 1)$ d'asymptote

$x = 1$ et $y = 1$

// Source: Corrige T1 p.38

#figure(
  cetz.canvas({
    import cetz.draw: *
    // Axes
    line((-6.5, 0), (5.5, 0), stroke: 0.5pt, mark: (end: ">"))
    line((0, -4), (0, 7), stroke: 0.5pt, mark: (end: ">"))
    content((5.5, -0.3), $x$)
    content((0.3, 7), $y$)

    // Ticks
    for i in range(-6, 6) {
      if i != 0 {
        line((i, -0.1), (i, 0.1), stroke: 0.3pt)
      }
    }
    for j in range(-3, 7) {
      if j != 0 {
        line((-0.1, j), (0.1, j), stroke: 0.3pt)
      }
    }

    // Asymptote horizontale y = 1 (pour la partie x < 0)
    line((-6.5, 1), (0, 1), stroke: (dash: "dashed", paint: gray))

    // Point H
    content((-2.3, -0.4), $H$)

    // Partie x < 0 : hyperbole f(x) = 1 + 2/(x-1)
    // Pour x de -6 à 0-: f(-6) = 1 + 2/(-7) ≈ 0.71, f(-1) = 1+2/(-2) = 0, f(0-) = 1+2/(-1) = -1
    bezier((-6, 0.71), (-4, 0.6), (-2, 0), (-0.1, -1), stroke: 1pt)

    // Partie 0 <= x < 1 : f(x) = x - 1
    line((0, -1), (0.95, -0.05), stroke: 1pt)
    // Open circle at x=1
    circle((1, 0), radius: 0.06, stroke: 0.5pt, fill: white)

    // Partie x >= 1 : f(x) = 2x + 1
    line((1, 3), (2, 5), stroke: 1pt)
    // Filled circle at x=1
    circle((1, 3), radius: 0.06, stroke: 0.5pt, fill: black)
  }),
  caption: [Courbe de $f$ — Exercice 17]
)

2) $f$ est continue sur chacun des intervalles $]-infinity, 0[$, $[0, 1[$ et $[1, +infinity[$

\* _Continuité à gauche en 0_ :

pour $x in ]-infinity, 0[$ , $f(x) = frac(x + 1, x - 1) = g(x)$

$g$ _est continue en_ 0 d'où :

$lim_(x arrow 0^-) f(x) = g(0) = -1 = f(0)$

$f$ est continue à gauche en 0.

\* _Continuité en 1 à gauche_ :

pour $x in [0, 1[$ $f(x) = x - 1 = h(x)$

$h$ est continue en 1 d'où :

$lim_(x arrow 1^-) f(x) = h(1) = 0$ et $f(1) = 3$

$lim_(x arrow 1^-) f = 0 eq.not f(1)$

d'où $f$ n'est pas continue à gauche en 1.

_conclusion_ : $f$ est continue sur chacun des intervalles $]-infinity, 1[$ et $[1, +infinity[$

( $f$ est continue sur $I R without {1}$ )

// Source: Corrige T1 p.38

=== Exercice 18

On considère la fonction f définie sur $RR$ telle que

$bullet$ $f(-4) = 4$ et $f(-3) = 3$ ,

$bullet$ $f(x) = sqrt(x + 2)$ , si $x > -2$ ,

$bullet$ sa restriction à $]-3, -2]$ est une fonction affine,

$bullet$ f est continue à gauche en $-2$.

1. Représenter f dans un repère $(O, arrow(i), arrow(j))$.

2. Donner l'expression de f(x) pour tout réel x.

3. Étudier la continuité de f en $-2$.

==== Corrigé

1)

#figure(
  cetz.canvas({
    import cetz.draw: *
    // Axes
    line((-5.5, 0), (5.5, 0), stroke: 0.5pt, mark: (end: ">"))
    line((0, -3.5), (0, 7), stroke: 0.5pt, mark: (end: ">"))
    content((5.5, -0.3), $x$)
    content((0.3, 7), $y$)

    // Ticks
    for i in range(-5, 6) {
      if i != 0 {
        line((i, -0.1), (i, 0.1), stroke: 0.3pt)
      }
    }
    for j in range(-3, 7) {
      if j != 0 {
        line((-0.1, j), (0.1, j), stroke: 0.3pt)
      }
    }

    // Courbe pour x <= -2 : f(x) = -x (droite passant par (-2,2) vers (-4,4), (-3,3))
    line((-5, 5), (-2, 2), stroke: 1pt)

    // Courbe pour x > -2 : f(x) = sqrt(x+2)
    // Points: (-2,0), (-1,1), (0,1.41), (1,1.73), (2,2), (3,2.24), (4,2.45), (5,2.65)
    bezier((-2, 0), (0, 1.41), (2, 2), (5, 2.65), stroke: 1pt)

    content((3.5, 3), $C_f$)
  }),
  caption: [Courbe de $f$ — Exercice 18]
)

2) pour $x in ]-infinity, -2]$ $f(x) = a x + b$

$a = frac(f(-4) - f(-3), -4 - (-3)) = frac(4 - 3, -4 + 3) arrow.double a = -1$

$f(-3) = 3 arrow.double -3a + b = 3$

$arrow.double 3 + b = 3 arrow.double b = 0$

Ce qui donne : $f(x) = -x$

$ f(x) = cases(
  -x & "si" x lt.eq -2,
  sqrt(x + 2) & "si" x > -2
) $

3) $f(-2) = 2$

pour $x in ]-2, +infinity[$ , $f(x) = sqrt(x + 2) = g(x)$

$g$ est continue à droite en $(-2)$ d'où :

$lim_(x arrow (-2)^+) f(x) = g(-2) = 0$

$lim_(x arrow (-2)^+) f(x) = 0 eq.not f(-2)$

$f$ _n'est pas continue à droite en_ $(-2)$

_par suite $f$ n'est pas continue en_ $(-2)$

// Source: Corrige T1 p.39

=== Exercice 19

Soit f la fonction définie sur $[1, +infinity[$ par

$ f(x) = cases(
  frac(sqrt(x - 1), x - 2) & "si" x eq.not 2,
  a & "si" x = 2
) $

Pour quelle valeur de a, la fonction f est-elle continue en 2 ?

==== Corrigé

$ f(x) = cases(
  frac(sqrt(x - 1) - 1, x - 2) & "si" x eq.not 2,
  a & "si" x = 2
) $

Pour $x in [1, +infinity[ without {2}$

$f(x) = frac((sqrt(x - 1) - 1)(sqrt(x - 1) + 1), (x - 2)(sqrt(x - 1) + 1))$

$= frac(x - 2, (x - 2)(sqrt(x - 1) + 1))$

$f(x) = frac(1, sqrt(x - 1) + 1)$

pour $x eq.not 2$ : $f(x) = frac(1, sqrt(x - 1) + 1) = g(x)$

$g$ est continue en 2 d'où

$lim_(x arrow 2) f(x) = g(2) = frac(1, 2)$

$f$ est continue en 2 si et seulement si $a = frac(1, 2)$

// Source: Corrige T1 p.39

=== Exercice 20

On considère la fonction f définie sur $RR$ par

$ f(x) = cases(
  frac(3x - 2x^2 - 1, x^2 - 1) & "si" x eq.not -1 "et" x eq.not 1,
  a & "si" x = 1,
  b & "si" x = -1
) $

1. Déterminer la valeur de a pour que f est continue en 1.

2. Déterminer la valeur de b pour que f est continue en $-1$.

==== Corrigé

_Soit_ $P(x) = 3x^3 - 2x^2 - 3x + 2$

On a : $P(x) = (3x^3 - 3x) - (2x^2 - 2)$

$P(x) = 3x(x^2 - 1) - 2(x^2 - 1)$

$P(x) = (x^2 - 1)(3x - 2)$

D'où $P(x) = (x - 1)(x + 1)(3x - 2)$

\* pour $x eq.not -1$ et $x eq.not 1$

On a : $f(x) = frac((x - 1)(x + 1)(3x - 2), (x - 1)(x + 1))$

$f(x) = 3x - 2 = g(x)$

$g$ est continue en $(-1)$ _et en_ $(1)$

d'où : $lim_(x arrow 1) f(x) = g(1) = 1$

et $lim_(x arrow (-1)) f(x) = g(-1) = -5$

1) $f$ est continue en 1 pour $a = 1$

2) $f$ est continue en $(-1)$ pour $b = -5$

// Source: Corrige T1 p.39

=== Exercice 21

Soit P un polynôme défini par

$P(x) = a_n x^n + a_(n-1) x^(n-1) + dots.c + a_1 x + a_0$ .

1. Déterminer $lim_(x arrow 0) frac(P(x) - P(0), x)$ .

2. Appliquer le résultat précédent pour déterminer chacune des limites suivantes :

$lim_(x arrow 0) frac(3(x + 1)^3 - 3, x)$ #h(0.5cm) ; #h(0.5cm) $lim_(x arrow 0) frac((x + 2)(x - 1) + 2, x)$ .

$lim_(x arrow 0) frac((x + 1)^2 - 1, x)$ .

==== Corrigé

$P(x) = a_n x^n + a_(n-1) x^(n-1) + ... + a_1 x + a_0$

1) $P(0) = a_0$

$frac(P(x) - P(0), x) = a_n x^(n-1) + a_(n-1) x^(n-2) + ... + a_2 x + a_1$

Donc

$lim_(x arrow 0) frac(P(x) - P(0), x) =$

$= lim_(x arrow 0) (a_n x^(n-1) + a_(n-1) x^(n-2) + ... + a_2 x + a_1) = a_1$

2) a) $P(x) = 3(x + 1)^2 = 3(x^2 + 2x + 1)$

$P(x) = 3x^2 + 6x + 3$

On a : $P(0) = 3$

$lim_(x arrow 0) frac(3(x + 1)^2 - 3, x) = lim_(x arrow 0) frac(P(x) - P(0), x) = a_1 = 6$

b) $P(x) = (x^3 + 2)(x - 1)$

$P(x) = x^4 - x^3 + 2x - 2$

On a : $P(0) = -2$

$lim_(x arrow 0) frac((x^3 + 2)(x - 1) + 2, x)$

$= lim_(x arrow 0) frac(P(x) - P(0), x) = a_1 = 2$

c) $P(x) = (x + 1)^3$

$P(x) = x^3 + 3x^2 + 3x + 1$

On a : $P(0) = 1$

// Source: Corrige T1 p.40
$lim_(x arrow 0) frac((x + 1)^3 - 1, x) = lim_(x arrow 0) frac(P(x) - P(0), x) = a_1 = 3$

// Source: Corrige T1 p.40

=== Exercice 22

Soit f la fonction définie sur $RR^+$ par

$f(x) = frac(1, sqrt(x)) dot (sqrt(x + 1) - 1)$ .

1. Déterminer $lim_(x arrow 0^+) f(x)$.

2. Déterminer $lim_(x arrow +infinity) frac(f(x), x)$.

// Source: Manuel T1 p.55

==== Corrigé

1) pour $x in I R^*$

$f(x) = frac((sqrt(1 + x^2) - 1)(sqrt(1 + x^2) + 1), x(sqrt(1 + x^2) + 1))$

$arrow.double f(x) = frac((1 + x^2) - 1^2, x(sqrt(1 + x^2) + 1))$

$arrow.double f(x) = frac(x^2, x(sqrt(1 + x^2) + 1)) = frac(x, sqrt(1 + x^2) + 1)$

pour $x eq.not 0$

$f(x) = frac(x, sqrt(1 + x^2) + 1) = g(x)$

$g$ est continue en 0 d'où :

$lim_(x arrow 0) f(x) = g(0) = 0$

2) pour $x eq.not 0$

$frac(f(x), x) = frac(1, sqrt(1 + x^2) + 1) = h(x)$

_$h$ est continue en 0_

d'où $lim_(x arrow 0) (frac(f(x), x)) = h(0) = frac(1, 2)$

== Math -- culture

Tout au long du XVIII#super[ème] siècle, la définition de fonction était un sujet de débat parmi les mathématiciens. Au XIX#super[ème] siècle, Cauchy fut le premier à donner une fondation logique stricte du calcul infinitésimal.

Ce n'est qu'en 1850, que le mathématicien allemand *Karl Weierstrass* poursuivant l'effort de rigueur entrepris par Cauchy, donna la définition de la limite d'une fonction en un point. Cette définition marquera la naissance de l'analyse moderne.

=== Citation

_«Homme toujours debout sur le cap Pensée, à s'écarquiller les yeux sur les limites.»_

#align(right)[*Paul Valéry*]

La distance parcourue par une navette spatiale, est déterminée par une expression d(t), où d est une fonction de la variable t qui désigne le temps.

Pour déterminer la distance parcourue par la navette Columbia, depuis sa lancée jusqu'à l'instant t, du crash, on calcule $lim_(t arrow t_0) d(t)$.
