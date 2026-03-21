// =============================================================================
// Transcription fidele : XY Plus (CAEU Med Ali) — 3eme Math
// Chapitre 6 : Denombrement
// Pages 124 a 147
// =============================================================================

// Source: XY Plus p.124
= Chapitre 6 : Denombrement

== I/ P-uplet

=== Definition

$arrow.r$ Soit E un ensemble non vide et p est un entier naturel non nul.
On appelle p-uplet d'elements de E toute ecriture de la forme $(a_1, ......, a_p)$
ou $a_i in E$ pour tout $1 lt.eq i lt.eq p$.

$arrow.r$ Le produit cartesien $underbrace(E times E times dots.c times E, p "fois")$ est l'ensemble des p-uplet $(a_1, ......, a_p)$
tels que $a_i in E$. On le note $E^p$.

$arrow.r$ $"card"(E^p) = ("card"(E))^p$.

$arrow.r$ Un p-uplet d'elements de E est une liste ordonnee de p elements de E,
deux a deux distincts ou non.

$arrow.r$ Lorsque $p = 2$, un 2-uplet est un *couple*.
Lorsque $p = 3$, un 3-uplet est un *triplet*.

== II/ Arrangements

=== Definition

E est un ensemble de n elements et p est un entier naturel tel que $1 lt.eq p lt.eq n$.

$arrow.r$ Un *arrangement* de p elements d'un ensemble E est un p-uplet
d'elements *deux a deux distincts* de E.

$arrow.r$ Un arrangement de p elements d'un ensemble de n elements est dit :
"arrangement de n elements p a p"

=== Nombre d'arrangements : Theoreme

- Le nombre d'arrangements de p elements d'un ensemble de n elements
  est $A_n^p = n(n-1)......(n-p+1) = frac(n!, (n-p)!)$

- _Remarque :_ Pour calculer $A_n^p$ il suffit, a partir de n, de multiplier p
  facteurs, en diminuant de 1 a chaque fois.

  _Exemple :_ $A_(30)^4 = 30 times 29 times 28 times 27 = 657720$.

// Source: XY Plus p.125
== III/ Permutations

=== Definition : permutations

Soit E un ensemble de n elements. On appelle permutation de E tout
arrangement de n elements de E.

=== Definition : factorielle

Soit n un entier naturel.
On dit que $n!$ (qui se lit "factorielle n") l'entier naturel defini par :
- pour $n eq.not 0$, $quad n! = n times (n-1) times dots.c times 2 times 1$ ;
- pour $n = 0$, $quad 0! = 1$.

_Exemple :_ $4! = 4 times 3 times 2 times 1$

=== Theoreme

Le nombre de permutations de n elements est $A_n^n = 1 times 2 times dots.c times n = n!$

== III/ Combinaisons

=== Definition

Soit n un entier et p un entier $0 lt.eq p lt.eq n$.

On appelle combinaison de p elements d'un ensemble E a n elements toute
partie a p elements de E.

=== Nombre de combinaisons : Theoreme

Le nombre de combinaisons de p elements d'un ensemble E a n elements
est : $C_n^p = frac(A_n^p, p!) = frac(n!, (n-p)! times p!)$

_Exemple :_ $C_(40)^8 = frac(A_(40)^8, 8!) = frac(40 times 39 times 38 times 37 times 36 times 35 times 34 times 33, 8 times 7 times 6 times 5 times 4 times 3 times 2 times 1) = 76904685$

=== Proprietes de $C_n^p$

- Pour tout entier naturel n : $C_n^0 = 1$ ; $C_n^n = 1$

- Pour tout entier $n gt.eq 1$ : $C_n^1 = C_n^(n-1) = n$

// Source: XY Plus p.126
- Pour tous entiers naturels n et p tels que $p lt.eq n$ : $C_n^(n-p) = C_n^p$

  Exemple : $C_8^7 = C_8^1 = 8$

- Pour tous entiers naturels n et p tels que $p lt.eq n$ : $C_n^p = C_(n-1)^(p-1) + C_(n-1)^p$

=== Calcul rapide des $C_n^p$ : Triangle de Pascal

#align(center)[
  #table(
    columns: 10,
    align: center,
    stroke: 0.5pt,
    [*p*], [*0*], [*1*], [*2*], [*3*], [*4*], [*5*], [*6*], [*7*], [*8*],
    [0], [1], [], [], [], [], [], [], [], [],
    [1], [1], [1], [], [], [], [], [], [], [],
    [2], [1], [2], [1], [], [], [], [], [], [],
    [3], [1], [3], [3], [1], [], [], [], [], [],
    [4], [1], [4], [6], [4], [1], [], [], [], [],
    [5], [1], [5], [10], [10], [5], [1], [], [], [],
    [6], [1], [6], [15], [20], [15], [6], [1], [], [],
    [7], [1], [7], [21], [35], [35], [21], [7], [1], [],
    [8], [1], [8], [28], [56], [70], [56], [28], [8], [1],
  )
]

Relation : $C_(n-1)^(p-1) + C_(n-1)^p arrow.b C_n^p$

== IV/ Nombre d'applications d'un ensemble fini dans un ensemble fini

=== Theoreme

Le nombre d'applications d'un ensemble a p elements avec $p in NN^*$, dans un
ensemble a n elements avec $n in NN^*$ est $n^p$.

== V/ Formule du binome de Newton

Soient a et b deux reels et n un entier naturel non nul, on a :

$ (a + b)^n = C_n^0 a^n + C_n^1 a^(n-1) b + dots.c + C_n^p a^(n-p) b^p + dots.c + C_n^(n-1) a b^(n-1) + C_n^n b^n $

=== Application : Nombre de parties d'un ensemble

Le nombre de parties d'un ensemble E a n elements avec $n in NN^*$ est $2^n$

// Source: XY Plus p.127
== VI/ Tableau recapitulatif

Soient p et n deux entiers naturels. On tire p elements d'un ensemble de n
elements.

#align(center)[
  #table(
    columns: 4,
    align: center,
    stroke: 0.5pt,
    [*Nature du tirage*], [*Tirage simultane*], [*Tirages successifs\ avec remise*], [*Tirages successifs\ sans remise*],
    [Un tirage possible], [une combinaison], [une application], [un arrangement],
    [L'ordre], [n'intervient pas], [intervient], [intervient],
    [Nombre de tirages\ possibles], [$C_n^p = frac(n!, p!(n-p)!)$\ $0 lt.eq p lt.eq n$], [$n^p$], [$A_n^p = frac(n!, (n-p)!)$\ $0 lt.eq p lt.eq n$],
  )
]

=== Remarque :

Dans le cas des tirages successifs sans remise, si $n = p$, un tirage est appele
permutation de n elements et le nombre de tirages possibles est $n!$

// Source: XY Plus p.128
= EXERCICES

=== Exercice 1

Un sac contient 15 boules dont 6 rouges et 4 vertes et 5 blanches.

1) Un joueur tire simultanement du sac 4 boules.
   De combien de facons peut-il :
   a) tirer exactement une boule rouge ?
   b) tirer au moins une boule verte ?
   c) tirer 4 boules toutes de meme couleur ?

2) Un joueur tire successivement et sans remise 4 boules.
   De combien de facons peut-il :
   a) avoir la premiere boule tiree rouge ?
   b) tirer au moins une boule verte ?
   c) tirer une seule boule rouge ?

=== Exercice 2

Un sac contient : cinq boules rouges numerotees 0, 0, 1, 2, 2
#h(3.5cm) trois boules blanches numerotees 0, 1, 2
#h(3.5cm) deux boules jaunes numerotees 0, 4

1) On tire simultanement trois boules du sac.
   Denombrer les tirages dans chacun des cas suivants :
   a) obtenir trois boules de meme couleur.
   b) obtenir une seule boule jaune.
   c) la somme des trois numeros inscrits sur les boules tirees est
      egale a 5.
   d) Le produit des trois numeros obtenus est nul.
   e) obtenir une seule boule rouge et une seule boule portant le numero 0.

2) On tire successivement sans remise quatre boules du sac.
   Denombrer les tirages donnant :
   a) deux boules blanches.
   b) au moins une boule jaune
   c) la somme des 4 numeros inscrits sur les boules tirees est egal a 3.
   d) la premiere boule tiree est rouge et la deuxieme porte le numero 0.

// Source: XY Plus p.129
3) On repartit les dix boules dans trois urnes $u_1$, $u_2$, $u_3$.
   De combien de manieres peut-on les placer dans chacun des cas suivants :
   a) les boules de meme couleur sont placees dans une seule urne.
   b) Une seule urne est vide.
   c) aucune urne ne reste vide.

=== Exercice 3

Un code d'acces est compose de 4 chiffres choisis parmi 0 et 1. Combien de
codes peut-on composer ?

=== Exercice 4

Un mot de 3 lettres est tout assemblage ordonne de trois lettres de
l'alphabet, une meme lettre pouvant etre utilisee plusieurs fois (un mot n'a donc
pas necessairement de sens). En utilisant les lettres du mot TUNIS :
1) combien peut on ecrire de mots de trois lettres ?
2) combien peut on ecrire de mots de trois lettres distinctes?
3) combien peut-on ecrire de mots de trois lettres distinctes dont la deuxieme
   lettre est la lettre u ?

=== Exercice 5

On lance un de parfait (non truque), numerote de 1 a 6, deux fois de suite.
Chaque resultat est un couple (a,b) ou a est le numero inscrit sur la face
superieur du de au 1#super[er] lancer et b celui du 2#super[eme] lancer.
1) A l'aide d'un tableau donner tous les couples (a,b) possibles.
   Quel est le nombre de realisations possibles ?
2) Combien y a-t-il de realisations ou les deux lancers ont donne
   a) le meme numero ?
   b) le resultat du premier lancer est strictement superieur au resultat du
      second.
3) a) la somme des points marques est egale a 6.
   b) la somme des points marques est impaire.

=== Exercice 6

1) Combien y a -t-il de nombres entiers ecrits avec trois chiffres distincts pris
   dans l'ensemble $\{0,1,2,3,4,5,6,7,8,9\}$ ?
2) En utilisant les chiffres de l'ensemble $\{0,1,2,3,4,5,6,7,8,9\}$, combien y a-t-il
   de nombres entiers de trois chiffres dans lesquels un chiffre est repete deux
   fois ?
3) En utilisant les chiffres de l'ensemble $\{0,1,2,3,4,5,6,7,8,9\}$ combien y a -t-il
   de nombres entiers de quatre chiffres qui contiennent au moins un des
   chiffres 5 et 7 ?

// Source: XY Plus p.130
=== Exercice 7

1) Combien de nombres entiers de 8 chiffres distincts peut-on former avec les
   chiffres 2, 3, 4, 5, 6, 7, 8, 9.
2) Combien y a-t-il de ces nombres ou les chiffres 6, 7, 8 sont toujours ensemble
   dans cet ordre.
3) Combien y a-t-il de ces nombres ou les chiffres 6, 7, 8 sont toujours ensemble
   dans un ordre quelconque.

=== Exercice 8

Un jeu est constitue d'une boite contenant quatre cases et de six boules
toutes de couleurs differentes, chaque case ne pouvant contenir qu'au plus deux
boules. Determiner le nombre de repartitions possibles.

=== Exercice 9

On prepare quatre colis differents et quatre etiquettes portant le nom de
quatre destinataires. Les destinataires sont designes par les lettres A, B, C, D
et les colis correspondants sont designes par les lettres $C_A$, $C_B$, $C_C$ et $C_D$.
On colle au hasard une etiquette sur chaque colis.
Quel est le nombre de cas dans lesquels :
a) les quatre colis arrivent a leurs destinataires ?
b) le destinataire A est le seul a recevoir son colis ?
c) un destinataire seulement recoit son colis ?
d) deux destinataires seulement recoivent leurs colis ?
e) aucun des destinataires ne recoit son colis ?

=== Exercice 10

La fabrication d'une piece necessite de passer celle-ci sur quatre machines
A, B, C et D. Denombrer les trajets possibles dans chacun des cas suivants :
a) L'ordre de passage est indifferent.
b) La piece doit d'abord passer par A.
c) La piece doit passer en B avant C et D.

=== Exercice 11

On veut colorier six bandes dans un rectangle.
Chacune des bandes est coloriee avec une couleur choisie parmi l'une des cinq
couleurs suivantes : rouge, jaune, vert, bleu, blanc. Les couleurs sont choisies de
telle sorte que deux bandes voisines soient toujours de couleurs differentes.
Denombrer le nombre de coloriages possibles.

// Source: XY Plus p.131
=== Exercice 12

I/ Trois personnes partagent entre eux 5 morceaux de gateaux.
1) On suppose que chacune des trois personnes choisit un morceau pour le
   manger. Combien y a-t-il de choix possibles.
2) On suppose que chacune de trois personnes choisit un et le mange. Deux
   d'entre eux se partagent les deux gateaux restants.
   Combien y a-t-il de repartitions possibles ?

II/ Un portemanteau comporte trois pateres alignees. Cinq personnes laissent
leur manteau. Deux manteaux au plus pouvant etre accroches au meme
portemanteau.
Combien y a-t-il de dispositions possibles des manteaux.
(s'il y a deux manteaux sur un meme portemanteau, l'ordre d'accrochage
des manteaux est indifferent).

=== Exercice 13

I/ Un portemanteau comporte cinq pateres alignees.
Sans mettre deux manteaux l'un sur l'autre, combien y a-t-il de dispositions
possibles pour :
a) trois manteaux ?
b) cinq manteaux ?

=== Exercice 14

En informatique, on appelle octet une liste de 8 elements pris dans
l'ensemble $\{0, 1\}$.
1) Combien y a-t-il d'octets possibles ?
2) Combien y a-t-il d'octets commencant par un 0 et se terminant par un 0 ?
3) Combien y a-t-il d'octets contenant exactement quatre 1 ?

=== Exercice 15

On jette trois des de couleurs differentes rouge, vert et bleu. Les faces de
chaque de de ces des sont numerotees de 1 a 6.
1) combien y a-t-il de resultats possibles ?
2) Dans combien de cas obtient-on deux resultats pairs exactement ?
3) Dans combien de cas obtient-on des resultats tous distincts ?
4) Dans combien de cas obtient-on trois resultats egaux ?
5) Dans combien de cas obtient-on deux resultats egaux exactement ?

// Source: XY Plus p.132
=== Exercice 16

Un eleve dispose de 30 livres classifies en 6 disciplines : 10 livres de
Mathematiques, 6 livres de Sciences physiques, 5 livres de Sciences naturelles et
4 livres d'Informatique, 3 livres d'Anglais et 2 livres de Philosophie.
Il desire ranger ses livres dans sa bibliotheque de telle sorte que les ouvrages
traitant la meme discipline se trouvent cote a cote.
De combien de facon peut-il faire son classement ?

=== Exercice 17

De combien de facons peut-on aligner 5 personnes A, B, C, D et E sachant
que A ne peut etre en derniere position, ni E en premiere ?

=== Exercice 18

1) Denombres les dispositions de 7 personnes alignes le long d'une table A.
2) Denombrer les dispositions de 7 personnes autour d'une table ronde.

=== Exercice 19

On veut colorier la figure ci-contre.

// Figure : cercle divise en 16 cases (8 interieures, 8 exterieures)
// Cases interieures : C_1 a C_8 (petit cercle central divise en 8)
// Cases exterieures : C_9 a C_16 (couronne exterieure divisee en 8)

I/ De combien de facons peut-on le faire
dans chacune des conditions suivantes :
a) chaque case peut etre au choix noire, blanche ou rouge.
b) 8 cases doivent etre noires et 8 blanches.
c) 3 cases doivent etre noires, 5 blanches et 8 rouges.
d) chacune des cases interieures au petit cercle peut etre au choix noire ou
   blanche et chacune des cases de la couronne exterieure peut etre au choix
   rouge ou jaune.
e) on dispose de 8 couleurs : chacune des cases interieures est d'une couleur
   differente ; il en est de meme pour les cases exterieures.

II) On dispose de 8 couleurs differentes mais on veut en employer au maximum
3, chaque case pouvant etre de l'une des trois couleurs. Combien y a-t-il de
coloriages possibles ?

=== Exercice 20

Montrer que :

1) Pour tout n, $p in NN$ tel que $3 lt.eq p lt.eq n$ :
   $C_n^p = C_(n-3)^p + 3 C_(n-3)^(p-1) + 3 C_(n-3)^(p-2) + C_(n-3)^(p-3)$

2) Pour tout n, $p in NN$ tel que $0 lt.eq p lt.eq n$ - k avec $k in \{1, 2, ......, n - p\}$ :
   $S_p = C_n^p + C_(n-1)^p + C_(n-2)^p + dots.c + C_(n-k)^p$

// Source: XY Plus p.133
=== Exercice 21

Resoudre dans $NN$ :
1) $C_n^3 = 4 C_n^4$
2) $C_n^2 + C_n^3 = 2n^2 - 2n$
3) $2 A_n^2 + A_n^3 = 32n(n-1)$

=== Exercice 22

1) Montrer que :
   $C_n^m dot C_(n-m)^(p-m) = C_n^p dot C_p^m$ #h(1cm) avec $0 lt.eq m lt.eq p lt.eq n$

2) En deduire que :
   $S_p = C_n^p dot C_p^0 + C_n^p dot C_p^1 + C_n^p dot C_p^2 + dots.c + C_n^p dot C_p^p$

3) Resoudre alors dans $NN$ :
   $C_n^0 dot C_n^0 + C_n^1 dot C_(n-1)^1 + C_n^2 dot C_(n-2)^2 = n^2 + 4n - 5$

=== Exercice 23

1) Montrer que pour tout entier naturel n et p tel que : $1 lt.eq p lt.eq n + 1$
   $frac(1, p) C_n^(p-1) = frac(1, n+1) C_(n+1)^p$

2) En deduire que :
   $C_n^0 + frac(1, 2) C_n^1 + frac(1, 3) C_n^2 + dots.c + frac(1, n) C_n^(n-1) + frac(1, n+1) C_n^n = frac(1, n+1) (2^(n+1) - 1)$

=== Exercice 24

Resoudre dans $NN$ :
1) $C_n^3 = 4 C_n^4$
2) $C_n^2 + C_n^3 = 2n^2 - 2n$
3) $2 A_n^2 + A_n^3 = 32n(n-1)$

=== Exercice 25

Soit $f : RR arrow.r RR$
#h(2cm) $x arrow.r.bar (1 + x)^n$ #h(1cm) $n in NN^*$

1) Calculer la fonction de f de deux facons.
2) En deduire que : $C_n^1 + 2 C_n^2 + 3 C_n^3 + dots.c + n C_n^n = n dot 2^(n-1)$

// =============================================================================
// CORRIGES
// =============================================================================

// Source: XY Plus p.134
= CORRIGES

=== Exercice 1 — Corrige

1) a) Le nombre de tirages contenant 1 seule boule rouge est
   $n_1 = C_6^1 times C_9^3 = 504$
   #h(1cm) $bracket.l$ choix d'une boule rouge
   #h(1cm) $bracket.l$ choix de 3 boules non rouges

b) $n_2$ = nombre de tirages contenant au moins une boule verte.
   Le nombre de tirages de 4 boules est $C_(15)^4 = 1365$
   le nombre de tirages contenant 4 boules non vertes parmi 11 est $C_(11)^4 = 330$
   d'ou $n_2 = 1365 - 330 = 1035$

c) $n_3$ est le nombre de tirages contenant des boules toutes de meme couleur.
   $n_3 = C_6^4 + C_4^4 + C_5^4 = 21$

2) a) Chaque tirage est un arrangement de 4 elements d'un ensemble de 15
      elements.
      $n_4$ = le nombre de tirages tel que la premiere boule tiree est rouge.
      $ n_4 = 6 times A_(14)^3 = 13104 $

   b) $n_5$ = le nombre de tirages contenant au moins une boule verte.
      $ n_5 = A_(15)^4 - A_(11)^4 = 24840 $

   c) $n_6$ = le nombre de tirages contenant une seule boule rouge.
      $ n_6 = 6 times A_9^3 times 4 = 12096 $

=== Exercice 2 — Corrige

1) a) $n_1$ : le nombre de tirages contenant trois boules de meme couleur
   $n_1 = C_5^3 + C_3^3 = 10 + 1 = 11$

b) $n_2$ : le nombre de tirages contenant une seule boule jaune.
   $n_2 = C_2^1 times C_8^2 = 56$

c) $n_3$ = le nombre de tirages donnant la somme des numeros inscrits egale a 5.
   Pour obtenir 5 comme somme de 3 numeros, on realise l'un des types de
   tirages suivants : #sym.circle.stroked.tiny, #sym.circle.stroked.tiny, #sym.circle.stroked.tiny $quad$ ou $quad$ $\{$ #sym.circle.stroked.tiny, #sym.circle.stroked.tiny, #sym.circle.stroked.tiny $\}$
   $n_5 = C_4^1 times C_2^1 times C_1^1 + C_2^1 times C_3^2 = 14$

// Source: XY Plus p.135
d) $n_4$ = le nombre de tirages donnant un produit nul.
   Le produit est nul si on obtient au moins un numero #sym.circle.stroked.tiny.
   $n_4 = C_(10)^3 - C_6^3 = 100$

e) $n_5$ = le nombre de tirages contenant une seule boule rouge et une seule
   boule portant le numero (0)
   $n_5 = C_2^1 times C_3^2 + C_3^1 times C_2^1 times C_3^1 = 24$.

2) a) $n_6$ = le nombre de tirages contenant 2 boules blanches.
   $n_6 = A_3^2 times A_7^2 times C_4^2 arrow.l$ l'ordre intervient. $n_6 = 1512$.

b) $n_7$ = le nombre de tirages contenant au moins une boule jaune.
   $n_7 = A_(10)^4 - A_8^4 = 3360$.

c) $n_8$ = la somme de 4 numeros inscrits sur les boules tirees est egal a 3.
   $n_8 = A_4^2 times A_3^1 times A_2^1 times underbrace(C_4^2 times C_2^1, "ordre") = 864$

d) Il y a deux cas : car les tirages sont successivement sans remise donc le
   tirage de la 2#super[eme] boule tiree est influence par le tirage de la 1#super[ere].
   - la premiere boule tiree est rouge et portant (0), la deuxieme boule portant
     (0) et la 3#super[eme] et la 4#super[eme] quelconque, ou
   - la premiere boule tiree est rouge non (0), la deuxieme est (0) et la 3#super[eme] et la
     4#super[eme] quelconque.
   $n_9 = A_2^1 times A_3^1 times A_8^2 + A_3^1 times A_4^1 times A_8^2 quad$ (l'ordre est donnee)

3) a) $n_(10) = 3!$

b) Une seule urne vide : Il y a $C_3^1$ choix pour l'urne vide. Pour chaque
   choix d'une urne vide
   il y a $2^(10) - 2$ possibilites.
   #h(2cm) $arrow.t$ Les cas ou les boules sont placees dans une meme urne
   $n_(11) = C_3^1 times (2^(10) - 2)$

c) $n_(12) = 3^(10) - (n_(11) + C_3^1 times 1^(10))$
   #h(1cm) $arrow.t$ Nombre de placements total
   #h(2cm) $arrow.t$ Nombre de placements pour qu'une seule urne soit vide.
   #h(3cm) $arrow.t$ Nombre de placements pour que deux urne soient vides
   #h(3cm) donc une urne parmi trois recoit toutes les boules.

// Source: XY Plus p.136
=== Exercice 3 — Corrige

#align(center)[
  #table(
    columns: 5,
    align: center,
    stroke: 0.5pt,
    [], [a], [b], [c], [d],
    [], [2 choix], [2 choix], [2 choix], [2 choix],
  )
]

Un chiffre peut etre utilise plus qu'une fois.
Le chiffre 0 peut etre place dans n'importe quelle case.
Chaque code correspond a une application de l'ensemble de ces 4 cases dans
l'ensemble de 2 chiffres $\{0, 1\}$. On obtient donc $2^4 = 16$ codes.

=== Exercice 4 — Corrige

1) On veut constituer un mot en utilisant les lettres du mot tunis, donc il s'agit
   d'avoir trois lettres ordonnees prises parmi les lettres t, u, n, i, s et s.
   L'enonce ne dit pas que les lettres du mot doivent etre distinctes.
   Le nombre total de mots est $5^3 = 125$.

2) Dans cette question on doit tenir compte que les lettres doivent etre
   distinctes.
   Le nombre de mots possibles est le nombre d'arrangement de 3 elements
   d'un ensemble de 5 elements ; $A_5^3 = 60$ mots.

3) Le nombre de mots est donc : $4 times 1 times 3 = 12$.

=== Exercice 5 — Corrige

1) a)

#align(center)[
  #table(
    columns: 8,
    align: center,
    stroke: 0.5pt,
    [], [], [*1#super[er] lancer*], [], [], [], [], [],
    [*2#super[eme] lancer*], [], [*1*], [*2*], [*3*], [*4*], [*5*], [*6*],
    [*1*], [], [(1,1)], [(2,1)], [(3,1)], [(4,1)], [(5,1)], [(6,1)],
    [*2*], [], [(1,2)], [(2,2)], [(3,2)], [(4,2)], [(5,2)], [(6,2)],
    [*3*], [], [(1,3)], [(2,3)], [(3,3)], [(4,3)], [(5,3)], [(6,3)],
    [*4*], [], [(1,4)], [(2,4)], [(3,4)], [(4,4)], [(5,4)], [(6,4)],
    [*5*], [], [(1,5)], [(2,5)], [(3,5)], [(4,5)], [(5,5)], [(6,5)],
    [*6*], [], [(1,6)], [(2,6)], [(3,6)], [(4,6)], [(5,6)], [(6,6)],
  )
]

Il y a 36 realisations possibles.

// Source: XY Plus p.137
2) a) Il y a 6 realisations qui ont donne le meme numero : (1,1) ; (2,2) ; (3,3) ;
      (4,4) ; (5,5) ; (6,6).

3) a)

#align(center)[
  #table(
    columns: 8,
    align: center,
    stroke: 0.5pt,
    [], [], [*1#super[er] lancer*], [], [], [], [], [],
    [*2#super[eme] lancer*], [], [*1*], [*2*], [*3*], [*4*], [*5*], [*6*],
    [*1*], [], [(1,1)], [], [], [], [], [],
    [*2*], [], [(1,2)], [(2,2)], [], [], [], [],
    [*3*], [], [(1,3)], [(2,3)], [(3,3)], [], [], [],
    [*4*], [], [(1,4)], [(2,4)], [(3,4)], [(4,4)], [], [],
    [*5*], [], [(1,5)], [(2,5)], [(3,5)], [(4,5)], [(5,5)], [],
    [*6*], [], [(1,6)], [(2,6)], [(3,6)], [(4,6)], [(5,6)], [(6,6)],
  )
]

Il y a 15 realisations possibles.

Il y a 5 realisations donnant une somme egale a 6.
b) Il y a 18 couples dont la somme des numeros est impaire.

=== Exercice 6 — Corrige

1)

#align(center)[
  #table(
    columns: 4,
    align: center,
    stroke: 0.5pt,
    [], [Centaines], [Dizaines], [Unites],
    [], [$arrow.t$], [$arrow.t$], [$arrow.t$],
    [], [9 choix], [9 choix], [8 choix],
  )
]

Donc le nombre d'entiers qu'on peut former est $9 times 9 times 8$.

2)

#align(center)[
  #table(
    columns: 4,
    align: center,
    stroke: 0.5pt,
    [], [Centaines], [Dizaines], [Resultat],
    [ou], [a], [b], [(a,b)],
    [ou], [a], [b], [(a,b,a)],
    [ou], [a], [b], [(a,b,a)],
  )
]

$a in \{1, 2, 3, 4, 5, 6, 7, 8, 9\}$
$b eq.not a$

Le nombre d'entiers qu'on peut former est $9 times 9 = 243$ (corrige: $30 times 9 = 243$).

3) Dans un entier de 4 chiffres, le chiffre des milliers est different de 0.

#align(center)[
  #table(
    columns: 5,
    align: center,
    stroke: 0.5pt,
    [Milliers], [Centaines], [Dizaines], [Unites], [],
    [$eq.not 0$], [], [], [], [],
  )
]

Le nombre d'entiers a 4 chiffres et ne contenant ni 5 ni 7 est :
$n_1 = 7 times 8^3$

// Source: XY Plus p.138
- Des entiers qui ne contiennent aucun des chiffres 5 ni 7.

Le nombre d'entiers a 4 chiffres (sans contraintes) est $9 times 10^3$

Conclusion : Le nombre d'entiers a quatre chiffres qui contiennent au
moins un des chiffres 5 et 7 est $n_3 = 9 times 10^3 - 7 times 8^3$.

=== Exercice 7 — Corrige

1) $n_1 = 8!$

2)

#align(center)[
  #table(
    columns: 9,
    align: center,
    stroke: 0.5pt,
    [], [], [], [6], [7], [8], [], [], [],
    [case 1], [case 2], [case 3], table.cell(colspan: 3)[case 4], [case 5], [case 6], [],
  )
]

On assimile le bloc 6,7,8 a un seul chiffre, donc le nombre d'entiers naturels
formes est le nombre de permutations de 6 chiffres.
$n_2 = 6!$

3) Si on assimile le bloc 6,78 a un seul chiffre, on peut former 6! entiers
   naturels, or dans un bloc $[6,7,8]$, il y a $6 !$ facons de placer les 3 chiffres.
   Donc $n_3 = 3! times 6!$

=== Exercice 8 — Corrige

Il y aura :
- soit 3 cases contenant 2 boules et 1 case vide #h(1cm) (1)
- soit 2 cases contenant 2 boules et 2 cases contenant 1 boule #h(0.5cm) (2)

1#super[er] cas : il y a $C_4^3$ facons de choisir 3 cases, $C_6^2$ facons de remplir l'une de ces 3
cases, $C_4^2$ facons de remplir la 2#super[eme] case, et $C_2^2 = 1$ facon de remplir la 3#super[eme]
donc $C_4^3 times C_6^2 times C_4^2 times C_2^2$ repartitions possibles.

2#super[eme] cas : il y a $C_4^2$ facons de choisir 2 cases, $C_6^2 times C_4^2$ facons de mettre 2 boules
par case, 2 facons de remplir les 2 case restantes, donc :
$C_4^2 times C_6^2 times C_4^2 times 2$ repartitions possibles.

En total : il y a $C_4^3 times C_6^2 times C_4^2 + C_4^2 times C_6^2 times C_4^2 times 2 = 1440$ remplissages possibles.

=== Exercice 9 — Corrige

a) Il y a une seule facon pour que chacun des destinataires recoive son colis.
   $n_1 = 1 times 1 times 1 times 1 = 1$.

b) Le destinataire A est le seul qui recoit son colis :
   Il reste les colis $C_B$, $C_C$ et $C_D$. Comme A est le seul qui recoit son colis, alors
   chacun des destinataires B, C et D ne recoit pas son colis.
   Pour le destinataire B il y a deux choix : $C_C$ ou $C_D$.

// Source: XY Plus p.139
   Pour chacune de ces deux possibilites, chacun des destinataires C et D ont
   une seule possibilite. Donc le nombre de cas pour que A seulement recoive
   son colis est :
   $n_2 = 1 times 2 times 1 = 2$

c) Une seule personne retrouve son colis : Il y a 4 choix pour la personne qui
   retrouve son colis, et pour chaque choix le nombre de cas possible pour que
   les 3 qui restent ne retrouve pas leurs colis est $n_2$.
   $n_3 = 4 times n_2 = 4 times 2 = 8$.

d) Deux personnes seulement retrouvent leur colis :
   On commence par choisir 2 destinataires parmi 4 qui retrouvent leurs colis :
   il y a $C_4^2$ choix pour ces deux destinataires.
   Pour chaque choix de deux destinataires ayant retrouve leurs colis, il reste
   deux destinataires et leurs colis, or ces deux ne doivent pas retrouver leurs
   colis, donc ils ont une seule possibilite : echanger les colis.
   Le nombre de facons est $C_4^2 times 1 times 1 times 1 times 1 = 6$

e) Il y a $4! = 24$ facons possibles pour distribuer les colis sur les destinataires.
   Ces 24 cas contiennent 4 cas qui s'excluent mutuellement : la realisation
   d'un cas exclut les 3 autres cas.

   $ 24 "cas possibles" cases(
     "4 destinataires recoivent leurs colis",
     "2 destinataires recoivent leurs colis",
     "1 seul destinataire recoit son colis",
     "aucun destinataire ne recoit son colis"
   ) $

   On remarque que lorsque 4 destinataires recoivent leurs colis c'est
   equivalent que 3 destinataires recoivent leurs colis.

   Designons par $n_4$ le nombre de cas possibles ou aucun destinataire ne
   retrouve son colis. Donc
   $n_4 = 24 - (n_1 + n_2 + n_3) = 24 - (1 + 6 + 8) = 24 - 15 = 9$

   On peut retrouver ce resultat a l'aide d'un arbre de choix :

   // Arbre de choix montrant les distributions possibles
   // A -> C_B, C_C, C_D
   // Pour chaque choix, B recoit un colis different, etc.
   // 9 cas au total ou aucun destinataire ne recoit son colis

=== Exercice 10 — Corrige

a) Le nombre de trajets est $4!$

b) La piece doit d'abord passer par A, donc il reste $3!$ facons pour passer par
   les 3 autres machines.

// Source: XY Plus p.140
c) Si B est la premiere machine alors on a $3!$ pour les 3 passages par les
   autres machines.
   Si B est la deuxieme machine donc obligatoirement A est la premiere
   puisque B est avant C et D. On a $2!$ facons pour les passages par C et D.
   B ne peut etre la 3#super[eme] ni la 4#super[eme] car dans ces deux cas l'une des machine C
   ou D au moins vient avant B ce qui n'est pas acceptable.
   Le nombre de trajets ou la piece passe en B avant C et D est : $3! + 2!$

=== Exercice 11 — Corrige

Pour colorier la 1#super[ere] bande on a 5 choix possibles de couleurs.
La couleur de la 1#super[ere] bande est interdite dans la bande suivante. Donc pour
colorier la 2#super[eme] bande on a $5 times 4$ choix. Pour colorier la 3#super[eme]
bande, on peut utiliser la 1#super[ere] couleur. Donc pour chaque coloriage des deux
premieres bandes il y a 4 choix pour la troisieme bande.
Il y a donc $5 times 4 times 4 times 4 times 4 = 1280$ possibilites.

=== Exercice 12 — Corrige

I/ Chaque personne mange le gateau qu'elle a choisi. Le nombre de choix
   possibles est le nombre d'arrangement 3 a 3 de l'ensemble de 5 gateaux.
   On obtient $A_5^3 = 60$ choix possibles.

II/ Deux des trois personnes mangent deux gateaux, l'une d'elles un seul. Il y
    a trois facons de choisir cette derniere personne, et cinq facon pour le
    gateau qu'elle mange.
    Il reste quatre gateaux a partager entre deux personnes. Il y a $C_4^2$ facons de
    choisir 2 morceaux parmi les 4 et de les donner a l'une des deux personnes.
    Les deux morceaux qui restent sont recus par l'autre personne.
    Le nombre de distributions possibles est donc : $3 times 5 times C_4^2 = 90$

=== Exercice 13 — Corrige

I/ Le meme raisonnement qu'a l'exercice precedent en remplacant les 3
   personnes par les trois portemanteaux et les 5 gateaux par les 5 manteaux.
   On trouve $3 times 5 times C_4^2 = 90$ dispositions.

II/ a) Chaque disposition est un arrangement de 3 elements d'un ensemble de
       5 elements.
       On trouve $A_5^3 = 5 times 4 times 3 = 60$ dispositions.

    b) Le nombre de dispositions est le nombre de permutations de 5 elements.
       On trouve $5! = 120$ dispositions.

=== Exercice 14 — Corrige

1) Former un octet c'est ordonner les chiffres 0 et 1 dans 8 cases avec la
   permission de repetition.

// Source: XY Plus p.141
   Le nombre d'octets possibles est $2^8$

2) Le nombre d'octets commencant par 0 et se terminant par 0 est $2^6$.
   C'est le nombre de choix de remplissage de 6 cases de chiffres prises de
   $\{0,1\}$

3) Un octet qui contient exactement quatre 1 contient aussi quatre 0.
   Tout revient a choisir 4 places parmi 8 pour les quatre 1 et les places qui
   restent seront occupes obligatoirement par les quatre 0 : On a donc $C_8^4$
   octets.

=== Exercice 15 — Corrige

1) On note : r le resultat du de rouge ; v le resultat du de vert et b le resultat
   du de bleu.
   Chaque resultat est un triplet (r, v, b) ou r, v et b sont des entiers de 1 a 6.

   #align(center)[
     #table(
       columns: 2,
       align: center,
       stroke: 0.5pt,
       [*r*], [*v*], [*b*],
       [6 resultats], [6 resultats], [6 resultats],
       table.cell(colspan: 3)[$6 times 6 times 6 = 6^3$ resultats],
     )
   ]

   On obtient $6^3 = 216$ resultats possibles.

2) On obtient deux resultats pairs exactement dans 3 cas : lorsque l'un des trois des
   donne un resultat impair et les deux autres donnent chacun un resultat pair. Dans
   chacun de ces cas, il y a $3 times 3 times 3$ resultats possibles, puisque chaque resultat pair
   (ou impair) est choisi parmi 3.
   On obtient donc deux resultats pairs exactement dans $3 times (3 times 3 times 3) = 91$ cas.
   A l'aide d'un arbre de choix :

   // Arbre : De Rouge (r) -> P ou I
   // P -> De Vert (v) -> I -> De Bleu (b) -> (P,P,I)
   //                  -> P -> De Bleu (b) -> (P,I,P)
   // I -> De Vert (v) -> P -> De Bleu (b) -> P -> (I,P,P)
   //                                      -> I -> inacceptable

   Pour obtenir (P,P,I) il y a $3 times 3 times 3 = 27$ ; de meme pour (P,I,P) et (I,P,P).
   On obtient $3 times (3 times 3 times 3) = 91$ resultats.

3) On obtient des resultats tous distincts dans $A_6^3 = 120$ cas.

// Source: XY Plus p.142
   Cela revient a faire des arrangements de l'ensemble de 6 numeros 3 a 3.

4) On obtient trois resultats egaux dans 6 cas : les trois des donnent le meme resultat
   element de $\{1, 2, 3, 4, 5, 6\}$

5) On a deux resultats egaux exactement dans 90 cas :

   1#super[ere] methode : $6 times 5 times C_3^2 = 90$
   #h(1cm) $arrow.t$ Choix du resultat obtenu deux fois
   #h(2cm) $arrow.t$ choix de l'autre resultat
   #h(3cm) $arrow.t$ Choix des des qui donnent le meme resultat

   2#super[eme] methode : $N + 120 + 6 = 216$
   #h(1cm) $arrow.t$ Nombre total de resultats
   #h(2cm) $arrow.t$ 3 resultats distincts
   #h(3cm) $arrow.t$ 3 resultats egaux
   #h(1cm) $arrow.t$ 2 resultats egaux exactement

   Donc $N = 216 - (120 + 6) = 90$

=== Exercice 16 — Corrige

Si on ne considere que les 6 disciplines, il y a $6!$ facons de les permuter.
Pour chaque classement de disciplines choisi, on peut permuter tous les
livres traitant la meme discipline.
On a donc $10! times 6! times 5! times 4! times 3! times 2!$ rangements possibles pour un classement
de disciplines fixe.
Donc : il y a $6! times 10! times 6! times 5! times 4! times 3! times 2!$ facons de ranger les livres de cet
eleve.

=== Exercice 17 — Corrige

#align(center)[
  #table(
    columns: 6,
    align: center,
    stroke: 0.5pt,
    [*Position*], [*1#super[ere]*], [*2#super[eme]*], [*3#super[eme]*], [*4#super[eme]*], [*5#super[eme]*],
    [], [$times.circle$], [], [], [], [$times.circle$],
  )
]

*1#super[ere] methode*

Soit un alignement de A, B, C, D et E ou A n'est pas en derniere position
et E n'est pas en premiere position. Il y a 4 possibilites pour A (positions 1,
2, 3 ou 4) et 4 possibilites pour E (2, 3, 4 ou 5). On peut donc placer A et E
de 13 facons differentes : il faut eliminer les cas ou A et E sont
simultanement dans les positions 2, 3, 4.
Pour chacune des 13 dispositions de E et A, il reste 3 personnes qu'on peut
alignes de $3! = 6$ facons.
Le nombre d'alignements cherche est donc egal a : $13 times 6 = 78$.

// Source: XY Plus p.143
*2#super[eme] methode :*

Si on n'exige aucune condition, on peut ranger 5 personnes A, B, C, D et E
dans un rang de $5! = 120$ facons differentes (nombre de permutations d'un
ensemble de 5 elements).
Dans ces 120 facons, on a compte le nombre d'alignements ou A est en derniere
position, comme on a compte le nombre d'alignements ou E est en premiere
position.
Le nombre d'alignements ou A est en derniere position est $4! = 24$.
De meme, le nombre d'alignements ou E est en premiere position est $4! = 24$.
Dans chacun de ces deux cas on a compte les alignements suivants : E premier
et A dernier.
Il y a $3! = 6$ alignements ou E est le premier et A est le dernier.
Le nombre d'alignements cherche est egal a : $5! - (4! + 4! - 3!) = 78$

=== Exercice 18 — Corrige

1) Le nombre de dispositions des 7 personnes alignes le long d'une table A est
   le nombre de files qu'on peut former avec ces personnes : c'est le nombre de
   permutations de 7 elements :
   $N_1 = 7!$

2) Chaque ronde rompue donne naissance a une file et il existe *7 files
   distinctes* permettant de former la *meme ronde*.
   Avec 7 personnes on peut former $7!$ files. Une meme ronde est former par
   7 files distinctes donc pour trouver le nombre de rondes il suffit de diviser
   le nombre de files par 7.

   Le nombre de dispositions de 7 personnes autour d'une table ronde est : $frac(7!, 7) = 6!$

=== Exercice 19 — Corrige

a) La figure a colorier comporte 16 cases. Definir une disposition pour
   laquelle chaque case peut etre noire, blanche ou rouge consiste a chaque
   element de $\{(1), (2), ....., (16)\}$ un element de $\{N, B, R\}$.
   Le nombre de dispositions cherchees est le nombre d'application d'un
   ensemble de 16 cases dans un ensemble de 3 couleurs.
   $n_1 = 3^(16) = 43046721$ facons de colorier la figure en n'utilisant que du noir,
   du blanc ou du rouge.

b) 8 cases doivent etre noires : il y a autant de facons differentes de colorier la
   figure que de choisir 8 cases parmi 16 et les autres seront necessairement
   blanches.
   $n_2 = C_(16)^8 = 12870$ facons de colorier 8 cases noires et 8 blanches.

c) 3 cases doivent etre noires, 5 blanches et 8 rouges. Le choix des cases noires
   et des cases blanches donnent le nombre de dispositions possibles. On

// Source: XY Plus p.144
   choisit d'abord 3 cases parmi 16 (coloriees en noir) puis 5 case parmi les 13
   qui ne sont pas encore coloriees.
   Il y a $n_3 = C_(16)^3 times C_(13)^5 = 720720$ dispositions.

d) Pour colorier les cases interieures, on associe a chaque case une couleur
   (noir ou blanc), cela peut se faire de $2^8$ facons ; il y a de meme $2^8$ facons de
   colorier la couronne exterieure.
   Pour colorier la figure, il y a $2^8 times 2^8 = 2^(16) = 65536$ possibilites.

e) Chaque case interieure est coloriee d'une couleur differente : il y a $8!$
   possibilites. Il y a aussi $8!$ possibilites de colorier la couronne exterieure.
   Donc il y a $(8!)^2$ possibilites.

II) On dispose de 8 couleurs.
   Utiliser au maximum 3 couleurs c'est utiliser 1 seule couleur, ou bien 2
   couleurs exactement ou bien 3 couleurs exactement.

   Pour une seule couleur :
   il y a 8 possibilites de colorier la figure en utilisant une seule couleur.

   Pour deux couleurs :
   Il y a $C_8^2$ facons de choisir les couleurs.
   Si on prend 2 couleurs il y a $2^(16)$ facons de colorier, mais il y a dans ce
   nombre 2 coloriages unicolores.
   Les deux couleurs etant choisies, il y a $2^(16) - 2$ coloriages bicolores.
   Donc le nombre de coloriages bicolores est de $C_8^2 times (2^(16) - 2)$.

   Pour 3 couleurs :
   Il y a $C_8^3$ facons de choisir les trois couleurs.
   Si on prend 3 couleurs, il y a $3^(16)$ facons de colorier, mais il y a dans ce
   nombre 3 coloriages unicolores et $C_3^2 times (2^(16) - 2)$ coloriages bicolores.
   Le nombre de coloriages tricolores est de :
   $C_8^3 times [3^(16) - C_3^2 (2^(16) - 2) - 3]$.

   Le nombre de coloriages qui fait intervenir au plus trois couleurs est de :
   $C_8^3 [3^(16) - C_3^2 (2^(16) - 2) - 3] + C_8^2 (2^(16) - 2) + 8$

=== Exercice 20 — Corrige

(application de la formule $C_n^p = C_(n-1)^p + C_(n-1)^(p-1)$)

1) $C_(n-3)^p + 3 C_(n-3)^(p-1) + 3 C_(n-3)^(p-2) + C_(n-3)^(p-3) =$

   $C_(n-3)^p + C_(n-3)^(p-1) + 2(C_(n-3)^(p-1) + C_(n-3)^(p-2)) + C_(n-3)^(p-2) + C_(n-3)^(p-3) =$

   $C_(n-2)^p + 2 C_(n-2)^(p-1) + C_(n-2)^(p-2) =$

   $C_(n-2)^p + C_(n-2)^(p-1) + C_(n-2)^(p-1) + C_(n-2)^(p-2) = C_(n-1)^p + C_(n-1)^(p-1) = C_n^p$

// Source: XY Plus p.145
2) on a :
   $ C_(n+1)^(p+1) &= cancel(C_n^(p+1)) + C_n^p \
     cancel(C_n^(p+1)) &= cancel(C_(n-1)^(p+1)) + C_(n-1)^p \
     &dots.v \
     cancel(C_(p+2)^(p+1)) &= cancel(C_(p+1)^(p+1)) + C_(p+1)^p \
     cancel(C_(p+1)^(p+1)) &= C_p^p $

   $C_(n+1)^(p+1) = C_n^p + C_(n-1)^p + C_(n-2)^p + dots.c + C_p^p$

=== Exercice 21 — Corrige

1) $C_n^3 = 4 C_n^4$ #h(2cm) Condition : $n gt.eq 3 \ n gt.eq 4$ $arrow.double$ $n gt.eq 4$

   $arrow.l.r.double frac(n!, 3!(n-3)!) = 4 frac(n!, 4!(n-4)!) arrow.l.r.double frac(1, cancel(3!)(n-3)!) = frac(1, 4 times cancel(3!) (n-4)!)$

   $arrow.l.r.double frac((n-3)!, (n-4)!) = 4 arrow.l.r.double n - 3 = 4 arrow.l.r.double n = 7$

   $S_(NN) = \{7\}$

2) $C_n^2 + C_n^3 = 2n^2 - 2n$ #h(2cm) Condition : $n gt.eq 3 \ n gt.eq 4$ $arrow.double$ $n gt.eq 4$

   $arrow.l.r.double C_(n+1)^3 = 2n^2 - 2n arrow.l.r.double frac((n+1)!, 3!((n+1) - 3)!) = 2n^2 - 2n$

   $arrow.l.r.double frac((n+1) n (n-1) cancel((n-2)!), 6 dot cancel((n-2)!)) = 2n^2 - 2n arrow.l.r.double n(n+1)(n-1) = 12n(n-1)$

   $arrow.l.r.double n(n-1)(n + 1 - 12) = 0$

   $arrow.l.r.double n = 0 "ou" n = 1 quad "ou" quad n = 11 arrow.double S_(NN) = \{4\}$

   #h(1cm) #underline[impossible car $n gt.eq 3$]

=== Exercice 22 — Corrige

1) $C_n^m dot C_(n-m)^(p-m) = frac(n!, m! (n-m)!) times frac(cancel((n-m)!), (p-m)!(n-p)!) = frac(n!, p!(n-p)!) times frac(p!, m!(p-m)) = C_n^p times C_p^m$

// Source: XY Plus p.146
2) d'apres 1) :

   $m = 0 quad C_n^0 C_n^p = C_n^p C_0^p$

   $m = 1 quad C_n^1 C_(n-1)^(p-1) = C_n^p C_p^1$

   $m = 2 quad C_n^2 C_(n-2)^(p-2) = C_n^p C_p^2$

   $dots.v$

   $m = p quad C_n^p C_(n-p)^0 = C_n^p C_p^p$

   donc : $S_p = C_n^p dot C_p^0 + C_n^p dot C_p^1 + C_n^p dot C_p^2 + dots.c + C_n^p dot C_p^p$

   $= C_n^p (C_p^0 + C_p^1 + C_p^2 + dots.c + C_p^p) = C_n^p dot 2^p$

3) $C_n^0 dot C_n^2 + C_n^1 dot C_(n-1)^1 + C_n^2 dot C_(n-2)^0 = S_2 quad$ (d'apres 2))

   $= 2^2 C_n^2 quad (p = 2)$

   donc l'equation devient :
   $2^2 C_n^2 = n^2 + 4n - 5 arrow.l.r.double 4 frac(n!, 2!(n-2)!) = n^2 + 4n - 5$

   $arrow.l.r.double 2n(n-1) = n^2 + 4n - 5 arrow.l.r.double n^2 - 6n + 5 = 0$

   $a + b + c = 0 arrow.double n = 1 quad "ou" quad n = frac(c, a) = 5$

   On a $p = 2 lt.eq n arrow.double n = frac(c, a) = 5$

=== Exercice 23 — Corrige

1) $frac(1, n+1) C_(n+1)^p = frac(1, n+1) dot frac((n+1)!, p!(n+1-p)!) = frac(n!, p!(n+1-p)!)$

   $= frac(1, p) dot frac(n!, (p-1)!(n-(p-1))!) = frac(1, p) C_n^(p-1)$

2) d'apres 1) :

   $p = 1 quad quad frac(1, 1) C_n^0 quad = frac(1, n+1) C_(n+1)^1$

   $p = 2 quad quad frac(1, 2) C_n^1 quad = frac(1, n+1) C_(n+1)^2$

   $p = 3 quad quad frac(1, 3) C_n^2 quad = frac(1, n+1) C_(n+1)^3$

   $dots.v$

   $p = n quad quad frac(1, n) C_n^(n-1) = frac(1, n+1) C_(n+1)^n$

   $p = n+1 quad frac(1, n+1) C_n^n = frac(1, n+1) C_(n+1)^(n+1)$

// Source: XY Plus p.147
   $C_n^0 + frac(1, 2) C_n^1 + frac(1, 3) C_n^2 + dots.c + frac(1, n) C_n^(n-1) + frac(1, n+1) C_n^n$

   $= frac(1, n+1) C_(n+1)^1 + frac(1, n+1) C_(n+1)^2 + dots.c + frac(1, n+1) C_(n+1)^n + frac(1, n+1) C_(n+1)^(n+1)$

   $= frac(1, n+1) (C_(n+1)^1 + C_(n+1)^2 + dots.c + C_(n+1)^(n+1))$

   $= frac(1, n+1) [(C_(n+1)^0 + C_(n+1)^1 + C_(n+1)^2 + dots.c + C_(n+1)^(n+1)) - C_(n+1)^0] = frac(1, n+1) [2^(n+1) - 1]$

=== Exercice 24 — Corrige

1) $C_n^3 = 4 C_n^4$ #h(2cm) Condition : $n gt.eq 3 \ n gt.eq 4$ $arrow.double$ $n gt.eq 4$

   $arrow.l.r.double frac(n!, 3!(n-3)!) = 4 frac(n!, 4!(n-4)!) arrow.l.r.double frac(1, cancel(3!)(n-3)!) = frac(1, 4 times cancel(3!) (n-4)!)$

   $arrow.l.r.double frac((n-3)!, (n-4)!) = 4 arrow.l.r.double n - 3 = 4 arrow.l.r.double n = 7$

   $S_(NN) = \{7\}$

2) $C_n^2 + C_n^3 = 2n^2 - 2n$ #h(2cm) Condition : $n gt.eq 3 \ n gt.eq 4$ $arrow.double$ $n gt.eq 4$

   $arrow.l.r.double C_(n+1)^3 = 2n^2 - 2n arrow.l.r.double frac((n+1)!, 3!((n+1)-3)!) = 2n^2 - 2n$

   $arrow.l.r.double frac((n+1)n(n-1)cancel((n-2)!), 6 dot cancel((n-2)!)) = 2n^2 - 2n$

   $arrow.l.r.double n(n+1)(n-1) = 12n(n-1) arrow.l.r.double n(n-1)(n+1-12) = 0$

   $arrow.l.r.double n = 0 "ou" n = 1 "ou" n = 11 arrow.double S_(NN) = \{11\}$

   #h(1cm) #underline[impossible car $n gt.eq 3$]

3) $2 A_n^2 + A_n^3 = 32n(n-1)$

=== Exercice 25 — Corrige

Soit $f : RR arrow.r RR$
#h(2cm) $x arrow.r.bar (1 + x)^n$ #h(1cm) $n in NN^*$

1) $f(x) = (1+x)^n arrow.double f'(x) = n(1+x)^(n-1)$

   d'autre part $f(x) = C_n^0 + C_n^1 x + C_n^2 x^2 + dots.c + C_n^p x^p + C_n^n x^n$
   #h(3cm) (d'apres la formule du binome de Newton)

   $arrow.double f'(x) = C_n^1 + 2 C_n^2 x + 3 C_n^3 x^2 + dots.c + p C_n^p x^(p-1) + dots.c + n C_n^n x^(n-1)$

2) On prend $x = 1$, $f'(1) = n(1+1)^(n-1) = C_n^1 + 2 C_n^2 times 1 + 3 C_n^3 times 1^2 + dots.c + n C_n^n times 1^(n-1)$

   D'ou $C_n^1 + 2 C_n^2 + 3 C_n^3 + dots.c + n C_n^n = n dot 2^(n-1)$
