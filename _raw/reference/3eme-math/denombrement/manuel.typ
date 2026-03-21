// =============================================================================
// Module 18 : Dénombrement
// Programme : 3ème Math (Tunisie)
// Source : Manuel scolaire CNP (T2, p.109–125)
// =============================================================================

// Source: Manuel p.109
= Chapitre 6 : Dénombrement

#emph[« La mathématique est une science dangereuse : elle dévoile les supercheries et les erreurs de calcul. »]

#align(right)[*Galilée*]

// Source: Manuel p.110
== Pour commencer

=== Activité 1

On considère un tableau à 4 cases alignées, numérotées de 1 à 4, qui sont de couleurs distinctes : bleue, jaune, rouge, verte.

1. Donner un tableau vérifiant la condition suivante :
  - la case 1 est verte et la case 4 est rouge.

2. Donner un tableau vérifiant la condition suivante :
  - la case 2 est à côté de la case rouge et la case 4 est verte.

3. Donner un tableau vérifiant les conditions suivantes :
  - la case 3 est jaune et la case 4 est bleue,
  - si la case 1 est verte alors la case 2 est rouge.

=== Activité 2

On considère un ensemble de 10 boules dont chacune est soit noire soit blanche, soit pleine soit creuse.

On considère une partie X de 3 boules parmi ces 10 telle que :
- il existe au moins une boule blanche et creuse.
- si X contient une boule pleine alors celle-ci est noire.

1. Donner un ensemble X vérifiant de plus la condition suivante :
  - X contient 3 boules creuses.

2. Donner un ensemble X vérifiant de plus la condition suivante :
  - X contient une boule noire et creuse.

3. Donner un ensemble X vérifiant de plus la condition suivante :
  - X contient 3 boules pleines.

4. Donner un ensemble X vérifiant de plus la condition suivante :
  - X contient au moins deux boules pleines.

// Source: Manuel p.111
== Cours

=== 1. Cardinal d'un ensemble fini

=== Activité 1

1. Déterminer le nombre d'éléments de l'ensemble des entiers naturels pairs et inférieurs à 100.

2. Déterminer le nombre d'éléments de l'ensemble des entiers naturels impairs et inférieurs à 100.

==== Vocabulaire et notation

Un ensemble qui a un nombre fini d'éléments est dit fini.

Dans ce cas, on appelle cardinal de E le nombre de ses éléments.

Lorsque un ensemble E a n éléments, on dit que son cardinal est n.

On note alors card E = n.

Un ensemble qui a zéro éléments, est appelé ensemble vide : et est noté $emptyset$.

=== Activité 2

On désigne par C l'ensemble des diviseurs de 15, par D l'ensemble des diviseurs de 8 et E l'ensemble des diviseurs de 12.

1. Déterminer card$(C sect D)$ ; card$(E sect D)$; card$(C sect E)$.

#block(inset: (left: 2em))[
  Soit A et B deux ensembles finis.

  Leur intersection $A sect B$, qui se lit "A inter B", est l'ensemble des éléments qui appartiennent à la fois à A et à B.

  Les ensembles A et B sont dits disjoints lorsqu'il n'ont aucun élément en commun.

  $A sect B$ sont disjoints signifie $A sect B = emptyset$.
]

2. Déterminer card$(C union D)$ ; card$(E union D)$; card$(C union E)$.

#block(inset: (left: 2em))[
  Soit A et B deux ensembles finis.

  $A union B$, qui se lit "A union B", est l'ensemble dont les éléments appartiennent à A ou à B.

  Si $A sect B$ sont disjoints, alors card$(A union B)$ = card $A$ + card $B$.

  Si $A sect B$ ne sont pas disjoints, alors card$(A union B)$ = card $A$ + card $B$ - card$(A sect B)$.
]

=== Activité 3

1. Déterminer l'ensemble E des diviseurs de 42.

2. Déterminer l'ensemble A des éléments de E, qui sont impairs.

3. Déterminer l'ensemble $overline(A)$ des éléments de E qui n'appartiennent pas à A.

Soit E l'ensemble des entiers n tels que $1 lt.eq n lt.eq 100$.

Pour tout entier naturel a, on note M(a) l'ensemble

$M(a) = {n in E "tel que" n "est un multiple de" a}$.

1. a. Calculer card(M(2)), card(M(5)) et card(M(3)).

// Source: Manuel p.112

#h(1em) b. En déduire le nombre d'éléments de E qui sont divisibles par 2 et non pas par 5.

#h(1em) c. Calculer le nombre d'éléments de E qui sont divisibles soit par 2, soit par 5.

3. Calculer card(M(3)), card(M(7)) et card(M(3) $union$ M(7)).

4. Calculer card(M(6) $union$ M(25)).

=== Activité 5

On considère l'ensemble E et deux parties A et B de E, tels que

$E = {1, 1; (1, 2); (1, 3); (2, 3)},$

$A = {(1, 2); 1},$

$B = {(1, 3); (1, 3)}.$

Déterminer le cardinal des ensembles $overline(A)$, $A union B$, $A sect B$ ; $overline(A) union overline(B)$.

=== 2. Produit cartésien d'ensembles finis

==== Propriété

On désigne par E l'ensemble des entiers naturels non nuls, inférieurs ou égaux à 6 et par F l'ensemble des entiers négatifs non nuls supérieurs ou égaux à $-6$.

Déterminer le cardinal de l'ensemble $E times F$.

=== Activité 7

Un centre culturel propose un abonnement pour deux activités, une le samedi et une le dimanche.

En l'an 2003, les activités du samedi étaient théâtre, musique et sport.

On les note par $(T, M, S)$, celles du dimanche étaient cinéma et peinture.

On les note par $(C, P)$.

Un abonnement est représenté par le couple (a, b), où a désigne une activité proposée le samedi et b une activité proposée le dimanche.

1. Compléter le tableau ci-contre pour déterminer tous les abonnements possibles.

#table(
  columns: 4,
  [], [C], [P], [],
  [T], [], [], [],
  [S], [], [], [],
  [M], [], [], [],
)

2. Combien a-t-on d'abonnements possibles ?

3. En l'an 2005, les activités du samedi sont devenues au nombre de 5 et celles du dimanche au nombre de 4. Combien a-t-on d'abonnements possibles ?

=== Activité 8

On lance une pièce de monnaie et le résultat est soit pile (noté P) soit face (noté F).

On lance la pièce deux fois. On modélise une issue par le couple (a, b) où a et b appartiennent à ${P, F}$.

1. Combien a-t-on d'issues possibles ?

2. Déterminer les issues où figure une seule face. Combien y en a-t-il ?

3. Déterminer les issues où figure une seule fois pile. Combien y en a-t-il ?

4. Déterminer les issues où ne figure aucune fois pile. Combien y en a-t-il ?

// Source: Manuel p.113

2. On lance la pièce trois fois.

On modélise une issue par le triplet (a, b, c) où a, b, c appartiennent à ${P, F}$.

a. Compléter l'arbre de choix ci-contre.

b. Combien a-t-on d'issues possibles ?

c. Dans combien d'issues figure une seule fois face ?

d. Dans combien d'issues figurent trois fois pile ?

e. Combien d'issues ne figurent aucune fois face ?

=== Activité 4 (p.113)

Dans une urne, il y a trois boules portant respectivement les lettres A, I et L.

On tire une boule et on note la lettre puis on la remet dans l'urne.

1. On effectue cette opération trois fois, on obtient alors un triplet.

Combien a-t-on de triplets possibles ?

#block(inset: (left: 2em))[
  Soit E un ensemble non vide et fini.

  Le produit cartésien $E times E times ... times E$ ($n$ fois), qu'on appelle $E^n$, est l'ensemble des $n$-uplets.

  card $E^n$ = (card $E$)$^n$.
]

2. On effectue cette opération dix fois, on obtient alors un dix-uplet.

Combien a-t-on de dix-uplets possibles ?

=== Activité 5

En informatique un "bit" (binary digit) vaut soit 0 soit 1, un "octet" est une succession de huit bits (exemple : 00011001).

1. Combien existe-t-il d'octets possibles ?

2. Combien existe-t-il d'octets possibles commençant par 1 ?

3. Combien existe-t-il d'octets possibles commençant par 0 ?

4. Combien existe-t-il d'octets possibles commençant par 00 ?

=== Activité 6

Une commode contient trois tiroirs. On range des objets distincts dans cette commode. On suppose que chaque tiroir peut ne pas contenir d'objet ou en contenir un ou plusieurs.

1. Déterminer le nombre de rangements possibles que l'on peut réaliser, si on veut ranger deux objets.

2. Déterminer le nombre de rangements possibles que l'on peut réaliser, si on veut ranger trois objets.

3. Déterminer le nombre de rangements possibles que l'on peut réaliser, si on veut ranger vingt objets.

// Source: Manuel p.114

=== Activité 7

La porte d'entrée d'un immeuble est commandée par un code d'accès composé d'une lettre suivie de trois chiffres.

On dispose d'un clavier comportant les lettres A, B et C, et les chiffres 1, 2, 3, 4, 5, 6, 7, 8 et 9.

1. Combien de codes peut-on proposer ?

2. Combien de codes commençant par la lettre A, peut-on proposer ?

3. Combien de codes commençant par B9, peut-on proposer ?

4. Combien de codes comportant trois chiffres distincts, peut-on proposer ?

== 3. Permutations

=== Activité 1

1. On appelle anagramme du mot MAI tout mot (ayant un sens ou non) formé des trois lettres M, A et I. Combien y a-t-il d'anagrammes du mot MAI ?

2. Combien y a-t-il d'anagrammes du mot NATUREL ?

=== Activité 2

Huit personnes choisissent un nombre compris entre 1 et 8.

Combien y a-t-il de choix distincts possibles ?

#block(fill: rgb("#f0f7ff"), inset: 12pt, radius: 4pt, width: 100%)[
  *Définition*

  Soit E un ensemble fini non vide de cardinal n.

  On appelle permutation des n éléments de E tout n-uplet d'éléments distincts de E.
]

=== Activité 3

On dispose d'un mot de n lettres distinctes. Combien y a-t-il d'anagrammes possibles ?

Le nombre de permutations des n éléments de E est égal à $n times (n-1) times ... times 1$.

==== Notation

Soit n un entier naturel non nul.

On appelle factorielle n et on note $n!$, l'entier $1a times 2a ...times n$. Par suite, le nombre de permutations des n éléments de E est égal à $n!$.

On convient que $0! = 1$.

=== Activité 4

1. Calculer $4!$ ; $5!$ ; $6!$ ; $7!$ ; $8!$.

2. Calculer $frac(5!, 5)$ ; $frac(5!, 12)$ ; $frac(1004!, 99!)$.

3. Soit n un entier naturel.

Simplifier les écritures $frac(n!, (n-1)!)$ ; $frac((n+1)!, (n-1)!)$ ; $frac(n!, (n-2)!)$.

// Source: Manuel p.115

== 4. Arrangements

=== Activité 1

On veut former des mots à deux lettres distinctes, avec les lettres A, B, C, D, E et F.

À l'aide d'un arbre de choix, déterminer le nombre de mots possibles.

=== Activité 2

Un parking comprend dix places libres repérées par les numéros 1 à 10.

1. De combien de façons peut-on garer une voiture ?

2. De combien de façons peut-on garer deux voitures ?

3. De combien de façons peut-on garer trois voitures ?

4. De combien de façons peut-on garer neuf voitures ?

5. De combien de façons peut-on garer dix voitures ?

#block(fill: rgb("#f0f7ff"), inset: 12pt, radius: 4pt, width: 100%)[
  *Définition*

  Soit E un ensemble fini non vide de cardinal n et p un entier naturel tel que $1 lt.eq p lt.eq n$.

  On appelle arrangement de p éléments de E tout p-uplet d'éléments distincts de E.
]

=== Activité 3

Soit E un ensemble fini non vide de cardinal n et p un entier naturel tel que $1 lt.eq p lt.eq n$.

1. Montrer que le nombre d'arrangements de p éléments de E est égal au produit $n times (n-1) times ... times (n-p+1)$.

2. En déduire que $n times (n-1) times ... times (n-p+1) = frac(n!, (n-p)!)$.

==== Théorème

Soit E un ensemble fini non vide de cardinal n et p un entier naturel tel que $1 lt.eq p lt.eq n$.

Le nombre d'arrangements de p éléments de E est l'entier noté $A_n^p$, (on lit « A n, p ») tel que :

$ A_n^p = n times (n-1) times ... times (n-p+1) = frac(n!, (n-p)!) $

On convient que $A_n^0 = 1$.

=== Activité 4

Une association comporte 50 membres. On doit élire un bureau composé de quatre membres (un président, un vice-président, un secrétaire et un trésorier).

Combien y a-t-il de bureaux possibles ?

=== Activité 5

Un sac contient six jetons numérotés de 10 à 15.

On tire successivement trois jetons, sans les remettre dans le sac.

Déterminer le nombre de tirages possibles.

// Source: Manuel p.116

=== Activité 6

1. Soit E un ensemble à quatre éléments et F un ensemble à trois éléments.

Dénombrer les applications injectives de E vers F.

#block(inset: (left: 2em))[
  Soit f une application d'un ensemble E vers un ensemble F.

  On dit que f est injective lorsque pour tout $x, x'$ de E tels que $x eq.not x'$, on a $f(x) eq.not f(x')$.
]

2. Soit E un ensemble à quatre éléments et F un ensemble à dix éléments.

Dénombrer les applications injectives de E vers F.

3. Soit E un ensemble à p éléments et F un ensemble à n éléments tels que $n gt.eq p$.

Dénombrer les applications injectives de E vers F.

== 5. Combinaisons

=== Activité 1

On considère l'ensemble E = { a, b, c, d }.

1. Dénombrer les parties de E à un élément, les parties à trois éléments, les parties à quatre éléments.

2. On convient que la seule partie de E à zéro élément est la partie vide et on note P(E) l'ensemble de toutes les parties de E. Déterminer card(P(E)).

=== Activité 2

Une association culturelle propose à ses adhérents six activités diverses.

De combien de façons différentes, un adhérent peut-il choisir ses activités ?

#block(fill: rgb("#f0f7ff"), inset: 12pt, radius: 4pt, width: 100%)[
  *Définition*

  Soit E un ensemble fini non vide de cardinal n et p un entier naturel tel que $0 lt.eq p lt.eq n$.

  On appelle combinaison de p éléments de E, toute partie à p éléments distincts de E.

  Le nombre de parties à p éléments d'un ensemble à n éléments est l'entier noté

  $C_n^p$, (on lit « C n, p »), ou $binom(n, p)$.
]

=== Activité 3

Soit n un entier naturel.

1. Vérifier que $C_n^0 = 1$ et que $C_n^n = 1$.

On suppose que $n gt.eq 1$.

2. Vérifier que $C_n^1 = n$ et $C_n^(n-1) = n$.

3. Montrer que $C_n^1 = n$.

// Source: Manuel p.117

=== Activité 4

1. On veut écrire un mot de dix lettres et on dispose de trois fois la lettre a et sept fois la lettre b.

On commence par mettre les a, en choisissant trois cases parmi les dix. On place ensuite les b.

Le nombre de mots est donc $C_(10)^3$.

Que obtient-on en commençant par mettre les b ?

2. Soit E un ensemble fini de cardinal n et p tel que $0 lt.eq p lt.eq n$.

a. Vérifier que choisir une partie à p éléments de E revient à choisir une partie à $n - p$ éléments.

b. En déduire que $C_n^p = C_n^(n-p)$.

=== Activité 4bis

Au jeu de loto, on tire chaque semaine six numéros distincts parmi les entiers compris entre 1 et 49.

On désigne par "résultat" l'ensemble des six numéros tirés.

On se propose de déterminer le nombre de résultats possibles.

1. On appelle tirage un arrangement de six numéros parmi les quarante neuf numéros.

Combien y a-t-il de tirages au loto ?

2. On a effectué le tirage 21, 10, 7, 43, 2, 29.

Combien y a-t-il de permutations de l'ensemble de ces six nombres ?

3. Combien de tirages conduisent au même ensemble de nombres tirés ?

=== Activité 5

Soit n et p deux entiers naturels tels que $n gt.eq 1$ et $0 lt.eq p lt.eq n$.

Montrer que pour tout $0 lt.eq p lt.eq n$, $C_n^p = frac(A_n^p, p!)$.

==== Théorème

Soit n et p deux entiers naturels tels que $0 lt.eq p lt.eq n$. Alors $C_n^p = frac(n!, p! times (n-p)!)$.

=== Activité 7

Une urne contient trois boules blanches et cinq boules noires.

On tire simultanément quatre boules de l'urne.

1. Combien y a-t-il de tirages possibles ?

2. Combien y a-t-il de tirages qui contiennent une seule boule blanche ?

3. Combien y a-t-il de tirages qui contiennent deux boules blanches ?

4. Combien y a-t-il de tirages qui contiennent trois boules blanches ?

5. Combien y a-t-il de tirages qui contiennent cinq boules blanches ?

6. Combien y a-t-il de tirages qui contiennent quatre boules blanches ?

7. Combien y a-t-il de tirages qui contiennent au moins une boule blanche ?

8. Combien y a-t-il de tirages qui contiennent quatre boules noires ?

// Source: Manuel p.118

=== Activité 8

Soit deux entiers n et p tels que $1 lt.eq p lt.eq n - 1$.

1. Soit E un ensemble fini non vide de cardinal n et e un élément de E.

a. Dénombrer les parties à p éléments de E qui contiennent e.

b. Dénombrer les parties à p éléments de E qui ne contiennent pas e.

c. En déduire que $C_n^p = C_(n-1)^p + C_(n-1)^(p-1)$.

2. La formule $C_n^p = C_(n-1)^p + C_(n-1)^(p-1)$ permet de calculer de proche en proche les nombres $C_n^p$.

En effet si on place dans un tableau à la $n$-ème ligne et $p$-ème colonne le nombre $C_n^p$, (voir schéma ci-contre), on obtient un tableau appelé triangle de Pascal.

Compléter le triangle de Pascal pour $n = 6$ représenté ci-dessous.

#table(
  columns: 8,
  [], [0], [1], [2], [3], [4], [5], [6],
  [0], [1], [], [], [], [], [], [],
  [1], [1], [1], [], [], [], [], [],
  [2], [1], [2], [1], [], [], [], [],
  [3], [1], [3], [3], [1], [], [], [],
  [4], [], [], [], [], [], [], [],
  [5], [], [], [], [], [], [], [],
  [6], [], [], [], [], [], [], [],
)

=== Activité 9

Soit un polygone $A_1 A_2 ... A_n$ à n côtés, $n gt.eq 3$.

1. Dénombrer les segments d'extrémités deux sommets du polygone.

2. Une diagonale du polygone est un segment d'extrémités deux sommets non consécutifs de celui-ci.

Dénombrer les diagonales d'un polygone à n côtés, $n gt.eq 3$.

#block(inset: (left: 2em))[
  // Figure: polygone avec ses diagonales (hexagone avec diagonales tracées)
  #import "@preview/cetz:0.3.4"
  #cetz.canvas({
    import cetz.draw: *
    let n = 6
    let r = 1.5
    let vertices = range(n).map(i => {
      let angle = 90deg + i * 360deg / n
      (r * calc.cos(angle), r * calc.sin(angle))
    })
    // Draw polygon edges
    for i in range(n) {
      line(vertices.at(i), vertices.at(calc.rem(i + 1, n)), stroke: blue)
    }
    // Draw diagonals
    for i in range(n) {
      for j in range(i + 2, n) {
        if calc.rem(j - i, n) != 1 and calc.rem(i - j, n) != 1 {
          line(vertices.at(i), vertices.at(j), stroke: gray + 0.5pt)
        }
      }
    }
    // Draw vertices
    for v in vertices {
      circle(v, radius: 0.05, fill: blue)
    }
    // Labels
    let labels = ("A₁", "A₂", "A₃", "A₄", "A₅", "A₆")
    for i in range(n) {
      let angle = 90deg + i * 360deg / n
      let lx = (r + 0.3) * calc.cos(angle)
      let ly = (r + 0.3) * calc.sin(angle)
      content((lx, ly), labels.at(i))
    }
  })
]

=== Activité 10

Dans un jeu de 32 cartes, on appelle main tout ensemble de cinq cartes.

1. Combien y a-t-il de mains possibles ?

2. Combien y a-t-il de mains contenant le valet de pique ?

3. Combien y a-t-il de mains contenant exactement une carte de couleur rouge ?

4. Combien y a-t-il de mains contenant au plus une reine ?

5. Combien y a-t-il de mains ne contenant aucun roi ?

6. Combien y a-t-il de mains contenant au moins un roi ?

// Source: Manuel p.119

== 6. Binôme de Newton

=== Activité 11

Soit un entier naturel $n gt.eq 3$. On considère l'ensemble $E = {0, 1, ..., n}$.

1. a. Soit un entier p tel que $0 lt.eq p lt.eq n$. Combien y a-t-il de couples (x, p) d'éléments de E avec $x lt.eq p$ ?

b. Combien y a-t-il de couples (x, y) d'éléments de E tels que $x lt.eq y$ ?

c. En déduire que $1 + 2 + ... + n = C_(n+1)^2$.

2. a. Soit un entier p tel que $0 lt.eq p lt.eq n$. Combien y a-t-il de triplets $(x, y, z)$ d'éléments de E avec $x lt.eq y lt.eq z$ ?

b. En déduire que $(n + 1)^2 times 2n + ... = "ptn" = p!... = "r(n + 1)" = C_(n+2)^3$.

=== Activité 1

Soit a et b deux réels.

1. Développer $(a + b)^2$.

Vérifier que $(a + b)^3 = C_3^0 a^3 + C_3^1 a^2 b + C_3^2 a b^2 + C_3^3 b^3$.

2. À l'aide du triangle de Pascal développer :

a. $(a + b)^4$

b. $(a + b)^5$

#block(fill: rgb("#e8f5e9"), inset: 12pt, radius: 4pt, width: 100%)[
  *Binôme de Newton*

  Soit a et b deux réels.

  Pour tout entier naturel non nul n, on a,

  $ (a + b)^n = sum_(k=0)^(n) C_n^k a^(n-k) b^k = C_n^0 a^n + C_n^1 a^(n-1) b + ... + C_n^n b^n $
]

=== Activité 2

1. Soit n un entier naturel non nul.

a. Développer $(2 + 1)^n$.

b. En déduire la valeur de $C_n^0 + 2 C_n^1 + ... + 2^n C_n^n$.

2. Soit un entier pair $n gt.eq 2$.

a. Développer $(1 + 1)^n$ et $(1 - 1)^n$.

b. En déduire que les nombres $C_n^0 + C_n^2 + C_n^4 + ... = C_n^1 + C_n^3 + ...$

sont égaux et donner leur valeur commune.

=== Activité 3

Soit E un ensemble fini non vide de cardinal n.

1. Montrer que le nombre de toutes les parties de E est égal à $C_n^0 + C_n^1 + ... + C_n^n$.

2. En déduire que le nombre de toutes les parties de E est égal à $2^n$.

=== Activité 4

Soit la fonction $f : x arrow.r (1 + x)^n$, où n est un entier naturel, supérieur ou égal à 2.

a. Calculer de deux façons différentes le nombre dérivé $f'(x)$.

b. En déduire le calcul de $S = C_n^1 + 2 C_n^2 + 3 C_n^3 + ... + n C_n^n$.

2. Calculer de même $S_2 = 2 C_n^2 + 6 C_n^3 + ... = "nn"$.

3. En déduire le calcul de $S_3 = 2 C_n^2 + 6 C_n^3 + ... + n(n-1) C_n^n = ...$.

// Source: Manuel p.120

== QCM -- VRAI -- FAUX

=== QCM

Cocher la réponse exacte.

1. En utilisant les lettres Q, C et M, on écrit tous les mots à trois lettres distinctes. On en obtient :

#h(1em) $square$ 9 #h(2em) $square$ 27.

2. Une urne contient quatre boules numérotées 1, 2, 3, 4. On tire successivement avec remise trois boules de l'urne. Le nombre de tirages possibles est :

#h(1em) $square$ 4 #h(2em) $square$ 12 #h(2em) $square$ 64.

3. Une assemblée élit un bureau de trois membres parmi quatre candidats. Le nombre de bureaux possibles est :

#h(1em) $square$ 24 #h(2em) $square$ 4 #h(2em) $square$ 64.

4. Le nombre de droites passant par deux sommets distincts d'un pentagone est égal au nombre de :

#h(1em) $square$ $C_5^2$ #h(2em) $square$ $A_5^2$ #h(2em) $square$ $C_5^3$.

5. Les triangles formés par trois sommets distincts d'un pentagone sont au nombre de :

#h(1em) $square$ 3 #h(2em) $square$ $A_5^3$ #h(2em) $square$ $C_5^3$.


=== Corrigé du QCM

*1) (a)*

QCM contient 3 lettres distinctes. Le nombre d'anagrammes est donc : $3! = 6$

*2) (c)*

Nombre des triplets (ordre et repetition) parmi 4 donc c'est $4^3 = 64$

*3) (b)*

le nombre des bureaux possible est le nombre des combinaisons de 3 parmi 4
donc c'est $C_4^3 = 4$

*4) (a) Deux points distinctes definissent une droite donc*

Nombre de partie a 2 elements d'un ensemble a 5 elements donc le nombre des droites
obtenu est : $C_5^2 = 10$

*5) (c)*

Nombre de partie a 3 elements d'un ensemble a 5 elements donc le nombre des triangles
obtenu est : $C_5^3 = 10$

=== VRAI -- FAUX

1. Les anagrammes du mot ANANAS sont au nombre de $6!$.

2. Les anagrammes du mot ANANAS sont au nombre de $frac(6!, 2! times 3!)$.

3. Lorsqu'on lance successivement quatre dés, plus que la moitié des issues possibles contiennent au moins 1.

4. Parmi les mots de 8 lettres écrits à l'aide des lettres O et S, il y a $2^8 - (1 + C_8^2 + C_8^4)$ mots qui contiennent au moins 3 fois la lettre S.

5. Dans un jeu de 32 cartes, le nombre de mains de 5 cartes contenant 2 as et 3 cœurs est $C_4^2 times C_8^3$.

// Source: Manuel p.121


=== Corrigé Vrai -- Faux

*1) Faux*

ANANAS contient six lettres dont trois lettres A et deux lettres N d'ou le nombre
d'anagrammes est donc egal au nombre de classements
des cinq lettres, divise par le nombre de classements des deux N et de trois A. Le nombre
d'anagrammes de ANANAS est egal a : $(6!) / (3! times 2!) = 60$

*2) Vrai* #h(1cm) (voir (1))

#block(fill: rgb("#fff7f0"), inset: 1em, radius: 4pt, width: 100%)[
  *Remarque :*

  Une anagramme d'un mot de n lettres est une permutation des n elements de ce mot. Il y
  en a donc, a priori ($n !$)

  Mais si un groupe de lettres se repete $p_1$ fois au sein de ce mot, alors les permutations de
  ces $p_1$ lettres, qui sont au nombre de ($p_1 !$) ne changent pas le mot, de sorte que l'on a
  compte, dans les ($n !$) anagrammes, $p_1 !$ fois trop d'anagrammes. Il faut donc diviser ($n !$)
  par $p_1 !$ pour ne pas compter trop d'anagrammes. On procede de meme avec le deuxieme
  groupe de mots se repetant $p_2$ fois. Et ainsi de suite. Le nombre N d'anagrammes de mots
  de n lettres comportant k groupes lettres se repetant $p_1$, $p_2$,...$p_k$ fois est donc egal a :

  $ N = frac(n!, p_1 ! p_2 ! .... p_k !) $
]

*3) Vrai* #h(1cm) *En effet :*

le nombre des issues possibles est : $6^4 = 1296$

le nombre des issues ne contenant aucun 1 est : $5^4 = 625$

le nombre des issues contenant au moins un 1 est : $1296 - 625 = 671 > frac(1296, 2)$

*4) Vrai* #h(1cm) *en effet*

// Source: Corrige p.165
- Le nombre total des mots a 8 lettres contenant O et S est : $2^8$
- Le nombre total des mots a 8 lettres ne contenant aucune lettre S est 1
- Le nombre total des mots a 8 lettres contenant une seule fois la lettre
  S est $1^1 times 1^7 times C_8^1 = C_8^1$
- Le nombre total des mots a 8 lettres contenant deux fois la lettre
  S est $1^2 times 1^6 times C_8^2 = C_8^2$

D'ou le nombre des mots demande est : $2^8 - (1 + C_8^1 + C_8^2)$

*5) Faux* : il faut faire attention car parmi les 3 coeurs on peut trouver un as coeur.

*Le nombre* est alors : $C_1^1 dot C_3^1 dot C_7^2 dot C_(21)^1 + C_2^1 dot C_7^3$

== Mobiliser ses compétences

=== Situation 1

1. Dénombrer les anagrammes du mot ESSENTIEL.

2. Dénombrer les anagrammes du mot MATHEMATIQUES.

=== Situation 2

On peut se déplacer sur le réseau ci-contre, en ne se dirigeant que vers la droite ou bien vers le haut (ainsi de A on ne peut aller que vers B ou C).

// Figure: grille de déplacement avec points A, B, C, E, M, Z

1. Dénombrer les mots à 15 lettres qui contiennent 10 fois la lettre d et 5 fois la lettre h.

2. En déduire le nombre de chemins qui joignent A à Z.

3. a. Déterminer le nombre de chemins qui joignent A à E.

#h(1em) b. Déterminer le nombre de chemins qui joignent E à Z.

#h(1em) c. En déduire le nombre de chemins qui joignent A à Z en passant par E.

4. Déterminer le nombre de chemins qui joignent A à Z en passant par E puis par M.

// Source: Manuel p.122


=== Corrigé -- Mobiliser ses compétences

=== Situation 1

1) ESSENTIEL contient 9 lettres dont trois lettres E et deux lettres S d'ou le nombre
d'anagrammes est donc egal au nombre de classements des 9 lettres, divise par le nombre de
classements des deux S et de trois E.

$ "C'est :" quad frac(9!, 3! times 2!) = 30240 $

2) MATHEMATIQUES contient 12 lettres dont 2 lettres E et 2 lettres M, 2 lettres A et 2 lettres T
d'ou le nombre d'anagrammes est egal :

$ frac(12!, (2!)^4) = 29937600 $

=== Situation 2

1) $quad frac(15!, 10! times 5!) = 3003$

2) Un chemin qui joigne A a Z correspond a 10 pas vers la droite et 5 pas vers le haut

3) Donc le nombre de chemins qui joignent A a Z est le meme que le nombre de 15 lettres qui
contiennent 10 fois la lettre d et 5 fois la lettre h. c'est donc $frac(15!, 10! times 5!) = 3003$.

4) a. Le nombre de chemins qui joigne A a E est : 2 #h(1cm) (hd ; dh)

#h(0.5cm) b. Le nombre de chemins qui joigne E a Z est : $frac(13!, 9! times 4!) = 715$

#h(0.5cm) c. le nombre de chemins qui joignent A a Z en passant par E est : $2 times frac(13!, 9! times 4!) = 1430$

5) le nombre de chemins qui joignent A a Z en passant par E puis par M est :

$ 2 times frac(5!, 4!) dot frac(8!, 3! times 5!) = 2 times 5 times 7 times 8 = 560 $

// Source: Corrige p.166

== Exercices et problèmes

=== Exercice 1

Un appareil électroménager fabriqué en très grande quantité, peut présenter de deux défauts, seulement désignés par A et B.

Sur cent appareils on a en moyenne les résultats suivants :
- six appareils présentent le défaut A et pas-t-il aussi le défaut B ;
- huit appareils présentent le défaut B et pas le défaut A ;
- quatre appareils présentent simultanément les deux défauts.

Combien d'appareils en moyenne, sur cent, ne présentent aucun défaut ?


==== Corrigé

On peut representer ces donnees par un diagramme a l'interieur de l'ensemble E des appareils,
en representant en #text(fill: rgb("#0000ff"))[partie hachure] l'ensemble A des appareils qui possede un defaut A et
en #text(fill: rgb("#ff0000"))[partie pointee] l'ensemble des appareils qui possede un defaut B. L'intersection A $inter$ B des
deux ensembles A et B apparait en #text(fill: rgb("#800080"))[partie colore].

On complete en suite les effectifs de differentes parties en utilisant les donnees :

4 appareils possede un defaut A et B

On place le nombre 4 dans la partie coloree

mais parmi les 50 appareils on est sait qu'il y en a 4
qui possede un defaut. Il y a donc 50 $-$ 4 = 46 appareils qui
possede un defaut A sans qu'il presente le defaut B

On place le nombre 4 dans la partie hachuree

$"card"(A) = 10$; $"card"(A sect B) = "card"(B) = 4$; $"card"(A union B) = 10 + 4 + 4 = 14$

Il y a donc 14 appareils possede un defaut A ou B (ou les deux)

*Conclusion* il reste donc $50 - 14 = 86 = 36$ appareils ne presentant aucun defaut

=== Exercice 2

1. Calculer pour tout $0 lt.eq p lt.eq 4$ : $binom(4, p)$.

2. Montrer que $(n - 1)n$ est pair.

3. En déduire que tout entier $C_n^p$ est en entier pair.


==== Corrigé

$ 1 lt.eq p lt.eq 10 $

$ A_p^2 = p(p-1) = 2p(frac(p-1, 1)) quad ; quad frac(10!, p!) = frac(10!, p!) = 3628800 / p! $

$ A_(10)^3 = frac(10!, 7!) = frac(3628800, 5040) = 720 quad ; quad frac(10!, (10-p)!) $

$ A_5^2 = 5! / 3! = frac(120, 6) = 20 quad ; quad 5 times 4 = 20 $

$ A_(10)^5 = frac(10!, 5!) = frac(3628800, 120) = 30240 $

$ A_(10)^(10) = 10! = 3628800 $

2) $a gt.eq 2$

- $n$ est paire alors $n = 2p$ alors $n(n-1) = 2p(2p-1)$ : nombre pair

- $n$ est impaire alors $n = 2p + 1$ alors $n(n-1) = (2p+1)(2p) = 2p(2p+1)$ : nombre pair

Conclusion : $n(n-1)$ est pair

// Source: Corrige p.167

=== Exercice 3

Montrer que :

$2 times 4 times ... = (2n)! = 2^n times n!$

$frac(2 times 4 times ... times (2n), 1 times 3 times 5 times ... times (2n-1)) = frac((2n)!!, (2n)!!) quad (2001)!$


==== Corrigé

a) $2 times 4 times 6 times ... times (198) times (200) = (2 times 1) dot (2 times 2) dot (2 times 3) ... ... (2 times 99)(2 times 100)$

$ = underbrace([2 times 2 times ... times 2], "100 termes") times [1 times 2 times ... times 99 times 100] $

$ = 2^(100) dot 100! $

b) un travail analogue a celui fait en a) donne : $2 dot 4 dot 6 .... 2000 = 2^(1000) dot 1000!$

On a alors : #h(1cm) $frac(2 dot 4 dot 6 .... 2000, 3 dot 5 dot 7 .... 2001) = frac((2 dot 4 dot 6 .... 2000)^2, 2001!) = frac((2^(1000) dot 1000!)^2, 2001!)$

=== Exercice 4

1. Calculer $n!$ pour $n$ appartenant à ${2, 3, 4, 5}$.

2. À partir de quelle valeur de l'entier $n$ a-t-on $n! > n^2$ ?

3. À partir de quelle valeur de l'entier $n$ a-t-on $n! > 10 n$ ?

en multipliant par $10^3$ ?

4. À partir de quelle valeur de l'entier $n$ a-t-on $n! > n^4$ ?

5. À partir de quelle valeur de l'entier $n$ a-t-on $n! > n^5$ ?

en multipliant par $10^6$ ?

6. Trouver les trois derniers chiffres en écriture décimale de :

$1 times 2! + 3 times 4! + ... times 3006!$


==== Corrigé

1) $n in {2, 3, 4, 5}$

#h(1cm) $2! = 1 times 2 = 2$ #h(3cm) $4! = 1 times 2 times 3 times 4 = 24$

#h(1cm) $3! = 1 times 2 times 3 = 6$ #h(3cm) $5! = 4! times 5 = 120$

2) #h(1cm) l'entier $n!$ est multiple de 10 pour tout $n gt.eq 5$

3) #h(1cm) l'entier $n!$ est multiple de 20 pour tout $n gt.eq 5$

4) #h(1cm) l'entier $n!$ est multiple de 100 pour tout $n gt.eq 10$

5) #h(1cm) l'entier $n!$ est multiple de 1000 pour tout $n gt.eq 15$

6) le reste de la division euclidienne entier naturel par 1000 , forme ces trois derniers chiffres

$ N = 1! + 2! + 3! + 4! + 5! + .... + 2006! $

- Pour tout $n gt.eq 15$, l'entier $n!$ est multiple de 1000

  D'ou le reste de la division euclidienne de la somme $(15! + 16! .... + 2006!)$
  par 1000 est 0 ainsi les trois derniers chiffres de N sont les trois derniers chiffres de
  la somme $(1! + 2! .... + 14!)$

*1! = 1 ; 2! = 2 ; 3! = 6 ; 4! = 24 ; 5! = 120 ; 6! = 720 ; 7! = 5040 ; 8! = 40320*
*9! = 362880 ; 10! = 3628800 ; 11! = 39916800 ; 12! = 479001600 ; 13! = 6227020800*
*14! = 87178291200*

d'ou les trois derniers chiffres recherches sont les trois derniers chiffres de la somme :

$ 200 + 800 + 600 + 800 + 800 + 880 + 320 + 040 + 720 + 120 + 24 + 6 + 2 + 1 = 5313 $

Les trois derniers chiffres de N : 313

// Source: Corrige p.168

=== Exercice 5

1. Combien peut-on former de nombres de quatre chiffres ?

2. Combien peut-on former de nombres de quatre chiffres distincts ?

3. Combien peut-on former de nombres de quatre chiffres pairs ?

4. Combien peut-on former de nombres pairs de quatre chiffres distincts ?

5. Combien peut-on former de nombres de quatre chiffres distincts au moins l'un des chiffres ?


==== Corrigé

On compte 10 chiffres : ${0, 1, 2, 3, 4, 5, 6, 7, 8, 9}$

Soit A l'ensemble des nombres de quatre chiffres, le premier etant non nul.

(Un nombre de quatre chiffre et de la forme $a b c d$ avec $a eq.not 0$)

1) Ainsi $"Card"(A) = 9 times 10^3 = 9000$

2) Un nombre de A est un element du produit cartesien :

- d'un element de $Omega = 1 thin {1; 2; 3; 4; 5; 6; 7; 8; 9}$ en guise de premier chiffre. Il y a 9 possibilites.

- Une fois cet element choisi, il va falloir choisir les 3 chiffres restants parmi 9 seulement

  (aucun ne pouvant etre egal au premier chiffre choisi). On doit donc choisir un arrangement de
  trois elements pris dans un ensemble de 9 chiffres.

Le nombre d'elements de A composes de quatre chiffres distincts vaut donc :

$ 9 times A_9^3 = 9 times 504 = 4536 $

3) un nombre pair est de la forme $a b c d$ avec $a eq.not 0$ et $d in {0, 2, 4, 6, 8}$

On peut former $9 times 10^2 times 5 = 4500$ nombres paires de quatre chiffres

4) un nombre pair est de la forme $a b c d$ avec $a eq.not 0$ et $d in {0, 2, 4, 6, 8}$

Nous voulons de plus que les quatre chiffres soit distincts

- pour $d = 0$ correspond 9 choix possible pour la valeur de $a$ ; 8 choix possibles pour la valeur de
  b et 7 choix pour c. on a donc $9 times 8 times 7 = 504$ nombres paire de quatre chiffres distincts se terminant
  par 0

- pour $d eq.not 0$ correspond 8 choix possible pour la valeur de $a$ ($a eq.not 0$) ; 8 choix possibles pour la valeur
  de b et 7 choix possibles pour c. on a donc $(8 times 8 times 7) times 4 = 1792$ nombres paire de quatre chiffres
  distincts ne se terminant pas par 0.

*Conclusion :* On peut former $504 + 1792 = 2296$ nombres paires de quatre chiffres distincts

5) Le contraire de C : "au moins l'un des chiffres 0, 1, 2"

est B : "ne contient aucun des chiffre 0, 1, 2"

Le nombre d'elements de C est egal au nombre total d'elements de B diminue du nombre
d'elements de A (composes de quatre chiffres distincts), nombre qui a ete calcule dans la question 2

On a : $"card"(B) = A_7^4 = 840$ d'ou $"card"(C) = 4536 - 840 = 3696$

// Source: Corrige p.169

=== Exercice 6

Parmi toutes les mains de 8 cartes d'extrait d'un jeu de 32 cartes, dénombrer celles contenant :

a. un seul roi et al ;

b. exactement deux as ;

c. au moins un as ;

d. au moins un as et au moins un valet.


==== Corrigé

a) Une main qui contient exactement un as est formee d'un as parmi les quatre as et sept parmi
les 28 cartes qui restent donc le nombre $m_1$ de mains contenant un seul as est :

$ m_1 = C_4^1 times C_(28)^7 = 4736160 $

b) Une main qui contient exactement deux as est formee de 2 as parmi les quatre as et six parmi
les 28 cartes qui restent donc le nombre $m_2$ de mains contenant exactement 2 as est :

$ m_2 = C_4^2 times C_(28)^6 = 1506960 $

c) Le nombre des mains contenant au moins un as est egal au :

nombre total de mains - le nombre de mains ne contenant aucun as $= C_(32)^8 - C_(28)^8 = ...$

d) Le nombre de main contenant au moins un as et au moins un valet est :

(Le nombre de main contenant au moins un as) $-$ (Le nombre de main contenant au moins un
as et aucun valet) $= (C_(32)^8 - C_(28)^8) - (C_(28)^8 - C_(24)^8) = C_(32)^8 + C_(24)^8 - 2 C_(28)^8 = 5 037 561$

=== Exercice 7

Combien peut-on former une grille de mots croisés de 10 lignes et 12 colonnes, en noircit 23 cases.


==== Corrigé

On a 120 cases en totales, on va compter le nombre de combinaison des cases noircis qui
est le nombres possibles des grilles, ainsi on a : $C_(120)^(23)$ grilles possibles

=== Exercice 8

On dispose de 4 lettres A, 5 lettres B et 9 lettres C.

Des mots de 8 lettres. 18 lettres peut-on écrire avec ces lettres ?

// Source: Manuel p.123


==== Corrigé

On peut ecrire $frac(18!, 4! 5! 9!)$ mots a 18 lettres avec ces lettres

=== Exercice 10

Une pyramide reposant sur un escalier de 13 marches.

Elle peut progresser en sautant d'une marche à la suivante ou en sautant par dessus une marche (la marche à la marche $n + 2$).

De combien de façons distinctes peut-elle arriver au sommet de l'escalier ?


==== Corrigé

Pour une facon donnee, on appelle : $N$ le nombre de sauts de 2 marches qu'elle a effectue
$P$ le nombre de sauts de 1 marche qu'elle a effectue.

On sait que $2N + P = 13$ puisque la grenouille arrive en haut des marches

Les possibilites pour le couple $(N, P)$ sont donc :

$(0, 13)$ ; $(1, 11)$ ; $(2, 9)$ ; $(3, 7)$ ; $(4, 5)$ ; $(5, 3)$ et $(6, 1)$

Pour une possibilite $(N, P)$ donnee, le nombre de maniere possible revient a choisir les positions
des $N$ sauts de deux marches parmi les $(N + P)$ sauts, soit donc $C_(N+P)^N$

Donc si on reprend la liste, ca donne :

$ cases(
  (0, 13) &arrow.r C_(13)^(13) = 1,
  (1, 11) &arrow.r C_(12)^1 = 12,
  (2, 9) &arrow.r C_(11)^2 = 55,
  (3, 7) &arrow.r C_(10)^3 = 120,
  (4, 5) &arrow.r C_9^4 = 126,
  (5, 3) &arrow.r C_8^5 = 56,
  (6, 1) &arrow.r C_7^1 = 7,
) $

Le nombre de facons distinctes que la grenouille a d'arriver en haut de l'escalier est donc

$(1 + 12 + 55 + 120 + 126 + 56 + 7)$ soit 377 facons

#block(fill: rgb("#fff7f0"), inset: 1em, radius: 4pt, width: 100%)[
  *Remarque*

  Ce probleme peut se resoudre de maniere plus generale pour un escalier a $n$ marches : On appelle
  $u_n$ le nombre de possibilites pour monter l'escalier, par exemple s'il a 1 marche, $n = 1$ et $u_1 = 1$
  (En effet la grenouille ne peut que faire un saut de 1 marche), s'il a 2 marches, $n = 2$ _et_ $u_2 = 2$

  La grenouille peut soit sauter deux fois une marche, soit une fois 2 marches.

  La grenouille peut arriver dans deux positions differentes :

  - Soit elle est a une marche du sommet, auquel cas elle devra sauter une marche

  ce qui donne $u_(n-1)$ possibilites

  - Soit elle se trouve a deux marches du haut de l'escalier, elle devra donc sauter 2 marches ce qui
  donne $u_(n-2)$ possibilite. On a donc $cases(u_1 = 1 "et" u_2 = 2, u_n = u_(n-1) + u_(n-2) quad ; quad n > 2)$

  #table(
    columns: 14,
    align: center,
    [$n$], [1], [2], [3], [4], [5], [6], [7], [8], [9], [10], [11], [12], [*13*],
    [$u_n$], [1], [2], [3], [5], [8], [13], [21], [34], [55], [89], [144], [233], [*377*],
  )

  Conclusion : pour n = 13 on $#box(stroke: 1pt, inset: 3pt)[$u_(13) = 377$]$
]

// Source: Corrige p.171

=== Exercice 11

Une ligne de chemin de fer comporte 25 stations.

Chaque station délivre des billets, de première ou en basse de deuxième classe, pour chacune des autres stations.

Du déstockage le billet à l'arrivée des billets en $1^("ère")$ et $2^("ème")$ ?

Combien doit-on imprimer de nouveaux types de billets ?


==== Corrigé

Pour 25 stations il faut $quad 2 C_(25)^2 = 600$ types de billets.

Pour 28 stations il faut $quad 2 C_(28)^2 = 756$ types de billets.

Il faut donc imprimer $756 - 600 = 156$ nouveaux types de billets.

=== Exercice 12

La figure est un carré ABCD de côté 3 découpé en 9 petits carrés.

Déterminer le nombre de carrés que l'on peut former avec les sommets du quadrillage.


==== Corrigé

1) $3! = 6$

2) $4! = 24$

3) $8! =$

=== Exercice 13

Le mot est BLANCHE, on forme des anagrammes.

1. Combien y en a-t-il ?

2. Combien se terminent par E ?

3. Dans combien de mots E suit-il H ?

4. Combien ne commencent par B ?

5. Dans combien de mots les voyelles sont-elles séparées exactement par deux lettres ?


==== Corrigé

1) $7!$

2) $6!$

3) $6!$

4) $6 times 6!$

5) $cases(A .. E ..., E .. A ..) ; cases(. A .. E .., . E .. A ..) ; cases(.. A .. E ., .. E .. A .) ; cases(... A .. E, ... E .. A)$

Dans 8 mots les voyelles sont separees par deux lettres.

=== Exercice 14

De combien de façons peuvent s'asseoir trois filles et trois garçons dans une rangée de six places, sachant que filles et garçons doivent alterner ?


==== Corrigé

Il ya deux configurations possibles : G.F.G.F.G.F #h(1cm) OU #h(1cm) F.G.F.G.F.G

Pour chaque configuration il ya 3! manieres de presenter les filles et 3! manieres de presenter les
garcons ; il ya donc au total : $2 times (3! times 3!) = 72$ manieres.

=== Exercice 15

De combien de façons peut-on séjour donner trois personnes dans trois pièces :

a. de deux, quatre et six chaises ;

b. de quatre chaises.


==== Corrigé

a) $C_(12)^2 dot C_(10)^4 dot C_6^6$

b) $C_(12)^4 dot C_8^4 dot C_4^4$

=== Exercice 16

Un caractère de l'écriture Braille est formé de points obtenus en plaçant une feuille de papier à travers au moins l'un des six trous de la grille ci-contre.

#block(inset: (left: 2em))[
  1. Combien y a-t-il de caractères Braille possibles ?

  2. Combien y a-t-il de caractères Braille à 3 points ?

  3. Combien y a-t-il de caractères Braille à 4 points ?

  4. Combien y a-t-il de caractères Braille ?
]


==== Corrigé

$ C_8^0 + C_8^1 + C_8^2 + C_8^3 + C_8^4 + C_8^5 + C_8^6 + C_8^7 + C_8^8 = (1 + 1)^8 = 2^8 $

=== Exercice 17

De combien de façons un client peut-il choisir ses activités ?


==== Corrigé

1. $C_6^5 = 6$

2. $C_6^4 =$

3. $C_6^3 =$

4. $C_6^1 + C_6^2 + C_6^3 + C_6^4 + C_6^5 + C_6^6 = 2^6 - 1 = 63$

=== Exercice 18

On lance simultanément trois dés dont les faces sont numérotées 1, 2, 3, 4, 5, 6.

Déterminer le nombre d'issues possibles dans chacun des cas suivants :

a. les dés sont discernables.

b. les dés sont indiscernables.

=== Exercice 19

1. Combien y en a-t-il de sommes ?

2. Soit deux entiers n et p tels que $1 lt.eq p lt.eq n - 1$.

a. Vérifier que $C_n^p = frac(n, p) C_(n-1)^(p-1)$.

b. En déduire la somme

$S = 1 + frac(1, 2) + frac(1, 3) + ... + frac(1, (n!))$.

=== Exercice 20

De combien de façons peut-on choisir trois entiers compris entre 1 et 9 qui soient trois termes consécutifs d'une suite arithmétique ?

// Source: Manuel p.124

== Avec l'ordinateur

=== Séquence 1

On sait que le nombre de diagonales d'un quadrilatère convexe est égal à deux et que celui d'un triangle est nul.

1. À l'aide d'un logiciel de géométrie dynamique, (construire un pentagone ABCDE inscrit dans un cercle C).

2. Déterminer le nombre de diagonales du pentagone.

3. En plaçant un nouveau point F sur l'arc $A E$, déterminer le nombre de diagonales de l'hexagone ABCDEF.

4. Conjecturer le nombre de segments obtenus pour un polygone $P_n$ de n sommets puis déterminer le nombre de ses diagonales.

5. Démontrer cette conjecture.

=== Séquence 2

Après avoir écrit le titre Triangle de "PASCAL", on inscrit le nombre 1 dans toutes les cellules du champ A4:A18. Puis, on saisit, dans les dix cellules du champ B7:B18, les nombres successifs de 1 à 11 18.

En cellule, on tape, dans les dix cellules du champ P:K7, les nombres successifs de 1 à 18.

Dans la cellule C5, recopier la formule =SI(\$B5>=C\$2,COMBIN(\$B5,C\$2),"") et recopier en biais.

Recopier la formule dans toutes les cellules du champ C7:K11 puis masquer les cellules C2:K2 en leur donnant, par exemple, une couleur de police identique à la couleur de fond. Le triangle est terminé.

#block(inset: (left: 2em))[
  // Illustration: Triangle de PASCAL dans un tableur (cellules jaunes)
  Triangle de "PASCAL"
]

// Source: Manuel p.125

== Math -- culture

Le triangle dit de Pascal, a été décrit par Zhu Shijie en 1303 dans son livre _Le Miroir de Jade des Quatre Inconnues_. Dans ce livre, Zhu présente le triangle comme une méthode ancienne (de plus 200 années avant son temps) pour déterminer les coefficients du binôme, ce qui indique que la méthode était connue en Chine cinq siècles avant Pascal. Elle était également connue des mathématiciens arabes, par exemple Al Karaji et Omar Khayyam.

Lorsque Pascal construisit en 1654 son triangle arithmétique, il est loin d'être le premier à avoir organisé les nombres de cette façon. Le triangle arithmétique est même connu en Chine, en Inde ou dans les pays arabes du le XIe ou le XIIe siècle. L'apport de Pascal est une étude systématique, et surtout pour réaliser cette étude, il utilise pour la première fois le raisonnement par récurrence.

En remplaçant dans le triangle de Pascal les nombres pairs par 0 et les impairs par 1, ou encore les entiers pairs par un carreau noir et les impairs par un carreau rouge, nous obtenons ce qu'on appelle le triangle de Sierpinski.
