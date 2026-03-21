// Transcription fidèle du Parascolaire Proba Géo (Kounouz Editions) — 3ème Math
// Chapitre VI : Dénombrement — Pages 138 à 157

// ═══════════════════════════════════════════════════════════════
// RÉSUMÉ DE COURS
// ═══════════════════════════════════════════════════════════════

// Source: Parascolaire p.138

= Chapitre VI : Dénombrement

== Résumé de cours

=== Diagrammes

On l'utilise lorsqu'on a deux ou trois choix compatibles.

#underline[Exemple :]

Dans un club de 60 joueur de cartes, 40 jouent au bridge et 28 au tarot et 10 jouent à ces deux jeux. On peut utiliser le diagramme de Carrol ou Venn.

#figure(
  caption: [Diagrammes de Carrol et Venn],
  grid(
    columns: 2,
    gutter: 2em,
    // Diagramme de Carrol
    align(center)[
      #table(
        columns: 3,
        align: center,
        [], [T], [],
        [B], [10], [18],
        [], [30], [],
      )
    ],
    // Diagramme de Venn
    align(center)[
      B(30) $sect$ (10) $sect$ (18) T(28)
    ],
  )
)

Donc il y a 2 adhérents jouent autre chose.

=== L'arbre de choix

On l'utilise lorsqu'on a des choix successifs.

#underline[Exemple :]

On jette successivement trois pièces de monnaies bien équilibrées, on utilise l'arbre : à la première branche 2 possibilités pile ou face. Puis deux possibilités pour le second lancer etc....

Donc il y a 8 cas possible ou bien $2 times 2 times 2 = 8$

=== Cardinal d'un ensemble fini

- #underline[Définition] : le cardinal d'un ensemble fini E est le nombre d'élément de cet ensemble. On note : card E.

- #underline[Propriétés] : Soient E et F deux ensembles finis.

$ "Card" (E union F) = "card" E + "card" F - "card" (E sect F) $

$ "Card" (E times F) = "card" E times "card" F $

=== Arrangements

==== Arrangements sans répétition

- #underline[Définition] :

Soit E un ensemble fini de cardinal n et p un entier tel que : $0 lt.eq p lt.eq n$.

// Source: Parascolaire p.139

On appelle arrangement de p éléments de E, une p-liste de E\
Ou un p-uplet de E.

#underline[Exemple] : $E = {1, 2, 3, 4}$ ; $(1, 2, 3)$ est triplet de E.

- Le nombre d'arrangement sans répétition de p éléments pris parmi n éléments est : $A_n^p = n(n - 1)....(n - p + 1)$

- #underline[permutations] :

une permutation de E est un arrangement sans répétition de n éléments pris parmi n éléments.

Le nombre de permutations est : $n (n-1) (n-2)... times 3 times 2 times 1 = n !$

\* Convention : $0 ! = 1$ et $1 ! = 1$.

\* On a également : $A_n^p = frac(n!, (n - p)!)$

==== Arrangement avec répétition

- $n^p = underbrace(n times n... times n, p "fois")$ : c'est le nombre de façons de disposer p l'élément pris parmi n, avec des répétitions possibles.

- Théorème : Le nombre d'applications d'un ensemble à p éléments dans un ensemble à n éléments avec $0 lt.eq p lt.eq n$ et p et n deux entiers naturels est $n^p$.

=== Combinaison

- #underline[Définition] :

Soit E un ensemble de cardial n et p un entier tel que : $0 lt.eq p lt.eq n$.

Un sous ensemble (non ordonné) de p éléments de E (distincts) s'appelle une combinaison de p élément de E.

Exemple : $E = {1, 2, 3, 4}$.

${1, 2}$ est une combinaison de 2 éléments de E.

- Le nombre de combinaison de p éléments pris parmi n est :

$ C_n^p = frac(n!, p!(n - p)!) = frac(A_n^p, p!) $

- #underline[Propriétés des $C_n^p$] :

\* Pour tout entiers naturels n et p tel que $0 lt.eq p lt.eq n$ ; on a :

$ C_n^n = 1 ; C_n^1 = C_n^(n-1) = n ; C_n^p = C_n^(n-p) ; C_(n-1)^(p-1) + C_(n-1)^p = C_n^p $

=== Binôme de Newton

- Pour tout $(a, b) in RR^2$ et pour tout $n in NN$.

// Source: Parascolaire p.140

$ (a + b)^n = sum_(k=0)^n C_n^k dot a^k dot b^(n-k) $

- Nombre de parties d'un ensemble de n éléments est $2^n$.

=== Point Méthode

#underline[Situation 1] :

On dispose de n objet qu'il faut placer dans n cases, un par case, il s'agit de permutations :
- situation : n objets, n places et sans répétition.
- La formule : $n !$
- Les mots clés : permuter, déplacer, ordonner n objets.

#underline[Situation 2] :

Une urne contient n objets : On peut prendre un certain nombre p d'objets de 3 manières :

a) #underline[Simultanément] cela signifie #underline[sans ordre], #underline[sans répétition], alors il s'agit des combinaisons.
- Situation : n objets, p places et sans ordre.
- La formule : $C_n^p$.
- Les mots clés : comité, groupe, parties d'un ensemble.

b) #underline[Successivement et sans remise] : cela signifie avec #underline[ordre et sans] #underline[répétition], alors il s'agit des arrangements sans répétition.
- Situation : n objets, p places et ordre.
- La formule : $A_n^p$.
- les mots clés : bureau, groupe ordonnés, liste de p objets distincts.

c) #underline[successivement et avec remise], cela signifie avec #underline[ordre et] #underline[répétition], il s'agit des arrangements avec répétitions.

Dans ce cas seulement p peut être supérieur à n.
- Situation : n objets, p places, ordre et répétition.
- Formule : $n^p$
- Les mots clés : p-liste

// ═══════════════════════════════════════════════════════════════
// ÉNONCÉS
// ═══════════════════════════════════════════════════════════════

// Source: Parascolaire p.141

= Énoncés

== Exercice 1

Les 100 élèves de terminales Techniques prennent le cours de Math chez Mr x. 80 élèves reconnaissent aimer les mathématiques et 80 aiment le professeur et 65 les deux.

#table(
  columns: 4,
  align: center,
  table.header(
    table.cell(colspan: 1, rowspan: 1)[#align(center)[#rotate(-25deg)[Matière\ prof]]],
    [aime], [n'aime pas], [total],
  ),
  [aime], [], [], [],
  [n'aime pas], [], [], [],
  [total], [], [], [],
)

1) Compléter le tableau ci-contre

2) En déduire combien d'élèves :
a) n'aime pas la matière.
b) aime au moins la matière.
c) aime ni la matière, ni le professeur.

== Exercice 2

L'équipe A joue contre l'équipe B lors d'un tournoi, la première équipe qui gagne 2 parties de suites ou un total de trois parties gagne le tournoi.

Quel est le nombre maximum des matchs et le nombre minimum de matchs (utiliser un arbre de choix)

== Exercice 3

Le prince de Toscane demande à Galilée

Pourquoi lorsque l'on lance trois dés on obtient plus souvent la somme dix que la somme neuf bien que ces deux sommes soient obtenues chacune de six façons différentes. Quelle était la réponse de Galilée.

== Exercice 4

1) Une urne contient 12 boules : 5 boules noires, 3 boules blanches et 4 boules rouges. On tire simultanément 5 boules.

a) Combien y a-t-il de tirages possibles ?

b) Combien y a-t-il de tirages possibles comportant 2 noires et 3 blanches.

c) Combien y a-t-il de tirages possibles comportant 2 rouges, 1 noire et 2 blanches.

2) Même questions lorsque les 5 boules sont tirées successivement avec remise.

3) Même question lorsque les 5 boules sont tirées successivement sans remise.

== Exercice 5

// Source: Parascolaire p.142

On dispose d'un jeu de 32 cartes. On choisit ou hasard 5 cartes du jeu. (on dit que l'on a une main de 5 cartes).

1) Combien y a-t-il de mains différentes de 5 cartes ?

2) Combien y a-t-il de main de 5 cartes ne contenant que des figures (valets, dames, rois) ?

3) Combien y a-t-il de mains de 5 cartes ne contenant aucun roi ?

4) Combien y a-t-il de mains de 5 cartes contenant au moins un roi ?

5) Combien y a-t-il de mains de 5 cartes contenant exactement un roi et exactement 3 cœurs ?

== Exercice 6

Parmi les élèves d'une classe, 16 étudient l'anglais, 13 l'espagnol, 13 l'allemand, 4 l'anglais et l'espagnol, 6 l'espagnol et l'allemand, 5 l'anglais et l'allemand et 3 les trois langues. Par ailleurs, tous les élèves étudient au moins l'une de ces trois langues.

Combien y a-t-il donc d'élèves dans cette classe ?

== Exercice 7

Un jeu consiste à cocher quatre cartes : un seul pique, un seul cœur, un seul carreau et un seul trèfle sur la grille suivante :

#table(
  columns: 8,
  align: center,
  [$spadesuit$], [As], [Roi], [Dame], [Valet], [10], [9], [8], [7],
  [$heartsuit$], [As], [Roi], [Dame], [Valet], [10], [9], [8], [7],
  [$diamondsuit$], [As], [Roi], [Dame], [Valet], [10], [9], [8], [7],
  [$clubsuit$], [As], [Roi], [Dame], [Valet], [10], [9], [8], [7],
)

1) Quel est le nombre total de grilles ?

2) Dans les conditions imposées ci-dessus, quel est le nombre de grilles où :
a) Les quatre cartes cochées ont été tirées ?
b) Le carte de pique cochée a été tirée.
c) Exactement trois cartes cochées ont été tirées.
d) La carte de carreau cochée n'a pas été tirée.
e) Aucune carte cochée n'a été tirée.
f) Au moins une carte cochée a été tirée.

== Exercice 8

On colorie chaque case de la grille ci-dessous avec une des trois couleurs suivantes : noir, gris et blanc.

Combien y a-t-il de coloriages possibles ?

Combien y a-t-il de coloriages où :
a) Une seule couleur a été utilisée.
b) Le blanc n'a pas été utilisée.
c) Le blanc a été utilisé ou moins une fois.
d) Les cases extrêmes sont de la même couleur.

#table(
  columns: 5,
  [gris], [blanche], [noire], [gris], [blanche],
)

== Exercice 9

Une urne contient 10 jetons :
5 rouges ayant les numéros : $1 - 2 - 3 - 4 - 5$.

// Source: Parascolaire p.143

3 blancs ayant les numéros : $6 - 7 - 8$.
2 jaunes ayant les numéros : $0 - 9$.

1) On tire simultanément 3 jetons de l'urne, combien de tirage peut-on former dans les cas :
a) tirages quelconques
b) Avoir 3 jetons de même couleur.
c) Avoir au moins un jeton portant un numéro pair.
d) Avoir la somme des numéros marqués est paire.

2) On tire successivement et avec remise 3 jetons.
a) Quel est le nombre de tirage possible ?
b) Quel est le nombre de tirage sachant que les jetons sont :
$square$ tous rouges ; $square$ tous portant un numéro paire.
$square$ tous portant des numéros impaires.
c) Quel est le nombre de tirage sachant qu'il y ait au moins un jeton rouge.

3) Mêmes questions que 2) lorsque les 3 jetons sont tirées successivement et sans remise.

== Exercice 10

1) Déterminer le nombre d'anagrammes du mot « élève »
(chacune des lettres devant figurer une seule fois).
a) Les accents permettant de distinguer les e.
b) En supprimant les accents.

2) En s'inspirant de la $1^("er")$ questions, déterminer le nombre d'anagramme des mots : « EUCLIDE » et « ANTICONSTITUTIONNELLEMENT ».

== Exercice 11

Trois personnes se donnent rendez-vous au café d'un village (croyant qu'il a un seul café).

Sachant qu'il y a cinq cafés dans ce villages dénombrer.
1) Les cas possibles de voir les 3 personnes dans les 5 cafés.
2) Les possibilités où aucune personne n'en rencontre une autre.
3) Les trois personnes se rencontrent.
4) Les possibilités ou deux personnes seulement se rencontrent.

== Exercice 12

1) Une agence de voyages veut organiser des circuits touristiques comprenant dans un ordre donné, les 6 villes grecques : Athènes, Delphes, Olympe, Corinthe, Sparte, Nauplie.
a) Combien y a-t-il de circuits possibles.
b) Si la première ville visitée est Athènes, combien peut-on organiser de circuits.

2) a) Cette agence propose aussi des excursions permettant de visiter 2 villes parmi les 6 citées précédemment : les excursions du type, par exemple olympe – Delphes et Delphes – Olympes sont considérés comme différentes.

// Source: Parascolaire p.144

Combien y a-t-il d'excusions différentes ?

b) L'agence souhaiterait proposer un choix de 56 excursions du même type. Combien doit-elle choisir de villes.

== Exercice 13

On lance trois dès parfaitement équilibrés, on lit les nombres a,b,c apparaissant sur les faces supérieures et on calcule la somme $S = a+b+c$. On observe qu'en jouant un très grand nombre de fois la somme 10 est obtenue plus souvent que la somme 9, alors que les deux sommes se décomposent exactement de 6 manières.

Que pensez-vous de cette observation ? Justifier votre réponse. On pourvue : Calculer le nombre de triplets possibles.

Calculer le nombre de triplets pour lesquels $S = 9$ et $S = 10$.

== Exercice 14

Un journal organise un sondage auprès de ses lecteurs comportent dix questions. A chaque question sont attachées cinq affirmations. Le lecteur devra à chaque question soit ne rien cocher, soit cocher une affirmation soit en cocher deux-mais il devra indiquer alors l'affirmation qu'il préfère.

Déterminer le nombre de réponses possibles aux sondages.

== Exercice 15

Pour avoir accès à l'internet, le fournisseur de ce service doit présenter à ses clients un Login et un mot de passe.

1) a) Le Login est formé d'un numéro de six chiffres suivi d'une lettre, répondant aux conditions suivantes :
- il peut y avoir répétition d'un même chiffre plusieurs fois ;
- le premier chiffre de gauche ne peut être un zéro ;
- la lettre ne peut pas être O.
Combien, au maximum, peut-il y avoir de clients.

b) Le mot de passe est composé de quatre lettres prises parmi les vingt-six lettres de l'alphabet (donc O est, cette fois, utilisable), avec répétition possible. Est-ce que tout client peut posséder un mot de passe.

2) Un client veut accéder à l'internet mais il a oublié son mot de passe.
a) Il sait seulement que son mot de passe est formé de quatre lettres distinctes. Combien de mot de passe a-t-il à essayer ?

b) En réfléchissant plus longuement, il réussit à se rappeler que son code contient également 2 voyelles. Combien a-t-il de code à essayer ?

== Exercice 16

Sur un damier carrée de 3 lignes et 3 colonnes, on veut disposer 4 jetons numérotées 1,2, 3 et 4 (chaque case contient au plus un jeton).
1) De combien de façon peut-on disposer les 4 jetons ?
2) De combien de façon peut-on disposer les 4 jetons si l'on veut que la figure formée par les 4 jetons soit un carré.
3) De combien de façon peut-on disposer les 4 jetons : de sorte que 3

// Source: Parascolaire p.145

d'entre eux soient sur une même ligne.

== Exercice 17

Le code antivol d'un autoradio est un nombre de quatre chiffres, chaque chiffre pouvant prendre l'une des dix valeurs 0, 1,...,9 (ainsi 0027 est un nombre de quatres chiffres).

a) Quel est le nombre de codes possibles.
b) Quel est le nombre de codes formé de quatre chiffres distincts.

2) a) Le propriétaire de la voiture sait que les quatre chiffres de son code sont 1,9,9 et 5, mais il a oublié l'ordre des chiffres ; quel nombre maximal d'essais infructueux peut-il faire avant de retrouver son code.

b) Mêmes question s'il sait que les quatre chiffres de son code sont 1,2,6,7..

3) La voiture est elle-même protégée par un autre antivol : il faut appuyer simultanément sur quatre touches d'un cadron portant dix touches marquées A, B, C, J, pour ouvrir la portière ; combien de possibilités de code.

== Exercice 18

Un candidat à un concours doit répondre à un Q.C.M (question à choix multiple) constitué de 10 questions ; pour chaque question, 4 réponses différentes sont proposées, le candidat doit cocher une seule case, une seule des 4 réponses est exacte.

1) Combien de grilles de réponses différentes peut-on obtenir ?

2) a) Combien y a-t-il de grilles comportant 8 bonnes réponses exactement.
b) Combien y a-t-il de grilles comportant p bonnes réponses exactement ($0 lt.eq p lt.eq 10$).

3) En déduire la valeur de la somme $display(sum_(p=0)^(p=10) C_(10)^p 3^(10-p))$

== Exercice 19

On dispose de six jetons sur lesquels on a inscrit respectivement $0,1,2,3,4,5$ à l'aide de ces jetons combien peut-on former :
1) d'entier de quatre chiffres
2) d'entier de six chiffres
3) d'entier de six chiffres paires
4) d'entier de six chiffres dont le chiffre d'unité est 5
5) d'entier de trois chiffres et divisible par 9.

== Exercice 20

Trouver l'entier naturel n dans chaque cas :

a) $A_7^n = 21 A_6^(n-2)$ #h(2em) ; c) $A_3^3 = 72 A_(n-2)^1$

b) $C_n^2 + C_(n-3)^2 = 17$.

== Exercice 21

Soient n points distincts d'un cercle avec $n gt.eq 3$.

1) Quand on joint ces points deux à deux, combien détermine-t-on de droites.
2) Combien existe –t-il de triangles ayant leurs sommets en ces points ?

// Source: Parascolaire p.146

== Exercice 22

Dans un plan, on considère n points tels que 3 quelconques d'entre eux ne soient pas alignes. Combien existe-t-il de cercles passant par 3 points ?

== Exercice 23

1) Pour tout $x in RR$, on pose $f(x) = (1 + x)^n$. Calculer $f'(x)$ de 2 façons différentes.

2) a) En déduire que : $n 2^(n-1) = C_n^1 + 2 C_n^2 + ..... + (n-1) C_n^(n-1) + n C_n^n$

b) En déduire que $(1 + x)^n gt.eq 1 + n x$ pour $x gt.eq 0$.

== Exercice 24

1) Montrer que $C_n^0 - C_n^1 + C_n^2 + ... + (-1)^n C_n^n = 0$

2) Pour n pair, calculer les valeurs de $C_n^0 + C_n^2 + ... + C_n^n$ et de $C_n^1 + C_n^3 + .... + C_n^(n-1)$.

== Exercice 25

Déterminer n de sorte qu'il existe dans la suite des coefficients du développement de $(1+x)^n$ quatre coefficients en progression arithmétique.

== Exercice 26

1) une urne contient dix boules noires numérotées de 1 jusqu'à 10 et dix boules blanches numérotées de 1à 10. On tire simultanément 10 boules de l'urne. Combien ya – il de tirage possibles ?

2) On suppose que l 'urne contient n boules noires numérotées de 1 à n et n boules blanches numérotées de 1 à n, on tire simultanément n boules de l'urne.
a) combien y a-il de tirages possibles ?
b) combien parmi ces tirages comporte p boules noires avec $0 lt.eq p lt.eq n$ ?
c) Déduire de ce qui précède une écriture plus simple de

$ (C_n^0)^2 + (C_n^1)^2 + (C_n^2)^2 + ... (C_n^n)^2 $

// ═══════════════════════════════════════════════════════════════
// CORRIGÉS
// ═══════════════════════════════════════════════════════════════

// Source: Parascolaire p.147

= Corrigés

== Exercice 1

#table(
  columns: 4,
  align: center,
  table.header(
    table.cell(colspan: 1, rowspan: 1)[#align(center)[#rotate(-25deg)[Matière\ professeur]]],
    [aime], [n'aime pas], [total],
  ),
  [aime], [65], [15], [80],
  [N'aime pas], [15], [5], [20],
  [total], [80], [20], [100],
)

2) a) 15 élèves n'aiment pas la matière

b) 80 aiment au moins la matière

c) 5 n'aiment ni la matière, ni le professeur

== Exercice 2

On note a lorsque l'équipe A qui gagne et b lorsque l'équipe B gagne.

#table(
  columns: 5,
  align: center,
  [$1^("er")$ match], [$2^("ème")$ match], [$3^("ème")$ match], [$4^("ème")$ match], [$5^("ème")$ match],
)

Le nombre maximum des matchs est : 5.\
Le nombre minimum des matchs est : 2.

== Exercice 3

Pour avoir une somme égale à 10 il faut avoir $2 + 3 + 5 = 10$ et les triplets qui correspondent.

Sont six ; $(2,3,5)$ $(2,5,3)$ $(3,5,2)$ $(3,2,5)(5,2,3)(5,3,2)$

Ou $4+1+5=10$ et les triplets qui correspondent sont six aussi.

Ou $3 + 6 + 1 = 10$ et les triplets qui correspondent sont six aussi.

Ou $2 + 4 + 4 = 10$ et les triplets qui correspondent sont trois : $(2,4,4);(4,4,2);(4,2,4)$.

Ou $6+2+2=10$ et les triplets qui correspondent sont trois.

Ou $3+3+4=10$ et les triplet qui correspondent sont trois.

Finalement il y a : $6+6+6+3+3+3=27$ possibilités.

// Source: Parascolaire p.148

\* pour avoir une somme égale à 9, il faut avoir:
$1+2+6=9$ et il y a 6 cas possibles.

Ou $1+3+5=9$ et il y a 6 cas possibles.

Ou $2+3+4=9$ et il y a 6 cas possibles.

Ou $1+4+4=9$ et il y a 3 cas possibles.

Ou $2+2+5=9$ et il y a 3 cas possibles.

Ou $3+3+3=9$ et il y a 1 cas possible.

Donc il ya $6+6+6+3+3+1=25$ possibilités.

Il fallait beaucoup jouer pour découvrir une telle différence.

== Exercice 4

1) a) Les 5 boules sont tirées simultanément.\
Un tirage est donc une combinaison de 5 boules prises parmi 12. Il y a donc $C_(12)^5 = 792$ tirages possibles.

b) Puisque l'on ne tient pas compte de l'ordre. Un tirage est composé de 2 boules noirs prises parmi 5 ($C_5^2 = 10$ choix) et 3 blanches prises parmi 3 ($C_3^3 = 1$ choix) il y a donc $C_5^2 times C_3^3 = 10$ tirages contenant 2 noires et 3 blanches.

c) Un tirage est composé de 2 rouges prises parmi 4 ($C_4^2 = 6$ choix) ; de 1 noire prise parmi 5 ($C_5^1 = 5$ choix) et 2 blanches parmi 3 ($C_3^2 = 3$ choix) donc il y a : $C_4^2 times C_5^1 times C_3^2 = 90$ tirages contenant 2 rouges, 1 noire et 2 blanches.

2) a) Cette fois, les 5 boules sont tirées successivement et avec remise (on tient compte de l'ordre). Un tirage est donc une « 5 listes » de 5 éléments pris parmi 12. Il y a donc $12^5 = 248832$ tirages possibles.

b) Le tirage est composé de 2 boules noires prises parmi 5 ($5^2 = 25$ choix) et 3 blanches prises parmi 3 ($3^3 = 27$ choix). Comme l'ordre intervient, il faut tenir compte des $C_5^2 = 10$ façons de les répartir ($C_5^2$ est le nombre de façons de choisir, par exemple, les positions des 2 noires parmi les 5 qui contient le tirage). Il y a donc $C_5^2 times 5^2 times 3^3 = 6750$ tirages contenant 2 noires et 3 blanches.

c) Le tirage est composé de 2 rouges tirées parmi 4 ($4^2 = 16$ choix), de 1 noir parmi 5 (5 choix) et 2 blanches parmi 3 ($3^2 = 9$ choix). De plus il y a $C_5^2 = 10$ façons de placer les 2 rouges parmi les 5 places libres, puis 3 façons de placer la noire (il reste 3 places libres) et enfin, une façon de placer les 2 blanches restantes. Au total, il y a $C_5^2 times 3 times 4^2 times 5 times 3^2 = 21600$ tirages contenant 2 rouges, 1 noire et 2 blanches.

3) a) Les 5 boules sont tirées successivement et sans remise. Un tirage est donc

// Source: Parascolaire p.149

un arrangement de 5 éléments pris parmi 12. Il y a donc $A_(12)^5 = 12 times 11 times 10 times 9 times 8 = 95040$ tirages possibles.

b) La méthode est identique à celle du $2^("ème")$ question, il y a $A_5^2 = 20$ façons de tirer les 2 noires parmi 5 et $A_3^3 = 6$ façons de tirer les trois blanches parmi 3. En tenant compte des $C_5^2$ manière de les répartir, il y a donc $C_5^2 times A_5^2 times A_3^3 = 1200$ tirages contenant 2 noires et 3 blanches.

c) Le tirage est composé de 2 rouges tirées parmi 4 ($A_4^2 = 12$ choix), 1 noire parmi 5 ($A_5^1 = 5$) et 2 blanches parmi 3 ($A_3^2 = 6$ choix) il y a toujours $C_5^2 times 3$ façons de les répartir sur 5 positions. Donc il y a: $C_5^2 times 3 times A_4^2 times A_5^1 times A_3^2$

$= 10800$ tirages contenant 2 rouges, 1 noire et 2 blanches.

== Exercice 5

1) On choisit 5 cartes sans ordre et sans remise. Il y a $C_(32)^5 = 201 space 376$ mains de 5 carts.

2) Il y a, dans le jeu, 12 figures (4 valets, 4 dames et 4 rois). Tout se passe comme si l'on choisissait les 5 cartes parmi 12 il y a $C_(12)^5 = 792$ mains comportant 5 figures.

3) On retire les rois il reste 28 cartes, on choisit 5 cartes parmi 28, il y a donc $C_(28)^5 = 98280$ mains ne comportant pas de roi.

4) C'est le complémentaire de l'ensemble précédent il y a donc $C_(32)^5 - C_(28)^5 = 103096$ mains contenant au moins un roi.

5) Deux possibilités :
- un roi qui n'est pas cœur, trois cœurs différents du roi, et une carte qui n'est ni roi ni cœur ; il y a alors $C_3^1 times C_7^3 times C_(21)^1 = 2205$ mains.
- Un roi de cœur, deux autres cœurs et deux cartes qui ne sont ni rois ni cœurs : il y a alors $C_1^1 times C_7^2 times C_(21)^2 = 4410$ mains.

Conclusion : cela fait $2205 + 4410 = 6615$ mains comportant exactement 1 roi et 3 cœurs.

== Exercice 6

#figure(
  caption: [Diagramme de Venn — Exercice 6],
  align(center)[
    Anglais(10) $sect$ (2) $sect$ (5) Allemand\
    $sect$ (1) $sect$ (3) $sect$\
    Espagnol

    An et AL, Pas espagnol\
    An et AL, Pas anglais\
    AL et An et ES

    Il y a donc 30 élèves dans cette classe
  ]
)

// Source: Parascolaire p.150

== Exercice 7

1) Il y a $8^4 = 4096$ grilles possibles.

2) a) $1^4 = 1$ #h(2em) ; b) $1 times 8^3 = 512$ #h(2em) ; c) $(1^3 times 7) times 4 = 2$

d) $7 times 8^3 = 358$ #h(2em) ; e) $7^4 = 2401$ #h(2em) ; f) $8^4 - 7^4 = 1695$.

== Exercice 8

1) Il y a $3^5 = 243$ coloriages possibles.

2) a) $3 times 1^4 = 3$ #h(2em) ; b) $2^5 = 32$ #h(2em) ; c) $3^5 - 2^5 = 211$ #h(2em) ; d) $3^4 times 1 = 81$

== Exercice 9

1) a) Les 3 jetons sont tirées simultanément, un tirage est donc une combinaison de 3 jetons parmis 10 il y a donc $C_(10)^3 = 120$ tirages.

b) Les 3 sont rouges ou les trois sont blancs, il y a donc $C_5^3 + C_3^3 = 11$

c) Les numéros pairs sont : $2 - 4 - 6 - 8 - 0$.
Les numéros impairs sont : $1 - 3 - 5 - 7 - 9$.

Avoir au moins un jeton portant un numéro paire ou encore toutes les tirages possibles sauf qui contiennent 3 impairs il y a donc $C_(10)^3 - C_5^3 = 120 - 10 = 110$.

d) Avoir la somme des numéros marques est paire il suffit d'avoir :
\* 2 impaires et 1 pair il y a $C_5^2 times C_5^1 = 50$.
\* 3 pairs il y a $C_5^3 = 10$.

Il y a donc $C_5^3 + C_5^2 dot C_5^1 = 50 + 10 = 60$ choix possibles.

2) a) Tirage successifs de 3 jetons parmi 10 avec remise. Le nombre de tirage possible est $10^3 = 1000$.

b) \* Les trois jetons tirés sont rouges alors il y a $5^3 = 125$ choix.
\* Tous portant un numéro pair alors il y a $5^3 = 125$ choix.
\* Tous portant un numéro impair alors il y a $5^3 = 125$ choix.

c) Au moins un qui est rouge c'est à dire tous les tirages sauf le cas ou on n'a pas de jeton rouge ; il y a donc $10^3 - 5^3 = 875$.

3) a) Tirage successif sans remise de 3 jetons parmi 10. Le nombre de tirage possible est $A_(10)^3 = 720$.

b) \* Tous rouges on a alors $A_5^3 = 60$

\* Tous pairs on a alors $A_5^3 = 60$

\* Tous impairs on a alors $A_5^3 = 60$

c) Au moins un jeton rouge il y a donc $A_(10)^3 - A_5^3 = 660$

== Exercice 10

1) a) Il y a 5 ! manières de placer les lettres distinctes du mots « *élève* ».

b) Les 5 lettres du mot « *élève* » étant placées dans un ordre donnés, il y a

// Source: Parascolaire p.151

3 ! mots obtenus en permettant les trois « e ». Le nombre d'anagrammes obtenus sans tenir compte des accents est donc : $frac(5!, 3!) = 20$.

2) Si l'on distingue les deux « E » du mot « EUCLIDE » il y a 7 ! mots possibles.

Si l'on supprime le moyen de distinguer les « E » il y a #h(2em) $frac(7!, 2!) = 2520$.

\* Il y a 25 lettre dans le mot « ANTICONSTITUTIONNELLEMENT » et parmi ces 25 lettres 5 N, 5T, 3I, 2O, 3E, 2L.

Si l'on distingue les lettres communes les unes par rapport aux autres il y a 25 ! anagrammes. En ne distinguant pas les lettres multiples, le nombre d'anagrammes est $frac(25!, 5!5!2!3!2!) = frac(25!, (5!)^2 dot (2!)^2 dot (3!)^2)$.

== Exercice 11

1) Trois personnes se rendent rendez-vous au café du village comme il y a 5 cafés alors le nombre de cas possible est $5^3 = 125$.

2) Aucune personne ne rencontre l'autre il y a $A_5^3 = 60$.

3) Les trois personnes se rencontrent est 5.

4) 2 personnes seulement se rencontrent est le nombre de tous les cas possibles sauf le cas où personne ne rencontre l'autre et les trois personnes se rencontrent il y a alors $125 - (60+5) = 60$.

== Exercice 12

1) a) Le nombre de circuits correspond au nombre de permutations des 6 villes c'est à dire, d'après la situation 1, $6 ! = 720$ circuits possibles.

b) Si la première ville est Athene, il reste 5 villes ; le même raisonnement donne $5 ! = 120$ circuits possibles.

2) a) Si on a choisit que deux villes parmi les 6, on a 6 choix pour la première et 5 choix pour la seconde donc $A_6^2 = 30$ excursions possibles.

b) Soit n le nombre de villes proposées, pour que le nombre d'exursions soit égal à 56 il faut que $n (n-1) = 56$ ce qui équivaut à $n^2-n-56 = 0$.

$Delta = 225 = 15^2$ alors $n' = 8$ et $n'' = -7 in.not NN$, l'agence doit donc chossir 8 villes pour pouvoir proposer 56 excursions différentes.

== Exercice 13

1) De chaque dé à 6 faces. Le nombre de triplets possibles est donc de $6 times 6 times 6 = 216$.

2) Ecrivons tous les triplets dont la somme est égale à 9 :
- Du type $1 + 2 + 6$, il y en a 6 car on peut permuter de $3 ! = 6$.

On peut aussi écrire tous les cas :
$1 + 2 + 6 ; 1+6+2 ; 2+1+6 ; 2+6+1 ; 6+1+2 ; 6+2+1$.
- Du type $1+3+5$ il y en a de même 6.
- Du type $2+3+4$ il y en a de même 6.

// Source: Parascolaire p.152

- Du type $1+4+4$ il y en a 3. En effet on a $1 + 4 + 4 ; 4 + 1 + 4 ; 4+4+1$.
- Du type $2 + 2 + 5$ il y en a 3.
- Du type $3 + 3 + 3$ il y en a qu'un. Soit un total de 25.

*Ecrivons tous les triplets dont la somme est égale à 10 :*
Du type $1 + 3 + 6$ il y en a $6 = 3 !$
Du type $1 + 4 + 5$ il y en a 6.
Du type $2 + 3 + 5$ il y en a 6.
Du type $2 + 4 + 4$ il y en a 3.
Du type $2 + 2 + 6$ il y en a 3.
Du type $3 + 3 + 4$ il y en a 3. Soit un total de 27.

== Exercice 14

Il y a pour une question :
1 façon de ne rien cocher. 5 façon de cocher une seule affirmation.
$A_5^2$ manières de cocher deux affirmations car il est nécessaire d'indiquer une préférence. Il y a donc pour une question $(1+5+ A_5^2)$ manières de répondre donc par 10. Questions : $(1+5+ A_5^2)^(10)$ manières de répondre $A_5^2 = 5 times 4 = 20$.

donc il y a $26^(10)$ manières de répondre.

== Exercice 15

1) a) Calculons le nombre de Login que l'on peut former :
- Pour le $1^("er")$ chiffre, il y a 9 choix possibles (le 0 n'est pas admis).
- Pour le $2^("ème")$ chiffre, il y a 10 choix possibles.
- Pour le $6^("ème")$ chiffre, il y a 10 choix possibles.
- Pour la lettre, il y a 25 choix possibles (le O n'est pas admis).

Il y a ainsi $9 times 25 times 10^5$ numéros possibles, donc $225.10^5$ clients possibles.

b) Un mot de passe est formé de 4 lettre prises parmi 26 ; avec possibilité de remise ; donc il y a $26^4 = 456976$ mot de passes possibles. Tout client ne peut pas avoir un mot de passe, car $225.10^5 > 456976$.

2) a) Le mot de passe du client est formé de 4 lettres distincts il y a $A_(26)^4 = 358800$ mot de passe possible.

b) Il faut d'abord calculer le nombre de façon de placer les voyelles. Il y a deux voyelles parmi 4 lettres, donc $C_4^2 = 6$ façons de les placer, puis 6 choix pour la $1^("ère")$ voyelle et 5 pour la seconde. Le client doit donc essayer $6 times 6 times 5 times 20 times 19 = 68400$ mot de passe.

== Exercice 16

1) Les jetons ont une disposition correspondant à un arrangement de 4 numéros pris parmi 9. Donc, il y a $9 times 8 times 7 times 6 = 3024$ dispositions.

2) Enumérons les dispositions où les jetons formant un carré.

// Source: Parascolaire p.153

De plus, chaque position est invariante par permutation des pions.
Il y a donc $6 times 4 ! = 144$ dispositions.

3) Lorsque 3 jetons sont sur une ligne, le $4^("ème")$ à 6 positions possibles ceci se reproduit pour chacune des 3 lignes, donc $6 times 3$ dispositions. Comme chaque position est invariante par permutation des pions il y a donc $3 times 6 times 4! = 432$ dispositions.

== Exercice 17

1) a) Exemples de codes : 2143, 9999, un tel code est un nombre compris entre 0000 et 9999 et qu'il y a donc $10000 = 10^4$.

b) Les codes formés de 4 chiffres distincts sont des arrangement sans répétition donc il y a : $A_(10)^4 = 5040$ codes.

2) a) Il y a 4 ! numéros si les chiffres sont distincts or 9 se répète 2 fois donc le nombre de codes possibles avec $9 - 9 - 5 - 1$ est $frac(4!, 2!) = 12$.

Donc au maximum 11 essais infructueux.

b) Les chiffres sont distincts deux à deux alors il y a $4 ! = 24$ codes possibles donc 23 essais infructueux.

3) Dans ce cas l'ordre ne joue plus de rôle, puisqu'on appuie simultanément sur les quatre touches, de plus il ne peut y avoir de répétition, toujours pour la même raison. Il y a donc $C_(10)^4 = 210$ codes possibles.

== Exercice 18

1) Exemple de réponse : $(3,1,3,2,4,1,2,2,4,3)$ qui indique que le condidat a coché la troisième case de la $1^("ère")$ question, la $1^("ère")$ case de la $2^("ème")$ question, etc.... Il y a quatre choix pour la première question de même pour les autres questions. Il y a donc $4^(10) = 1048576$ réponses.

2) a) Imaginons une urne qui contient 10 boules numérotée de 1 à 10 et tirons siumltanément huit boules de cette urne : les numéros obtenus seront les numéros des questions aux quelles on a répondu exactement ; il y a donc $C_(10)^8$ choix possibles pour les huit bonnes réponses. Quand on a coché ces huits bonnes cases, il reste a répondre a deux questions, pour chacune d'elles, on a le choix entre trois mauvaises réponses c'est à dire $3 times 3 = 9$ possibilités. Il y a donc en tout $C_(10)^8 times 9 = 405$ telles grilles.

b) Même raisonnement, si p remplace 8 : il y a en tout $C_(10)^p dot 3^(10-p)$

3) La somme à calculer est la somme du nombre de cas où il y a 0,...,10 réponses exactes on obtient dans la totalité des cas, et on a donc

$ sum_(p=0)^(p=10) C_(10)^p 3^(10-p) = (1 + 3)^(10) = 4^(10) $

== Exercice 19

1) Un entier de 4 chiffres notons le abcd avec $a eq.not 0$ on a alors un arrangement.

// Source: Parascolaire p.154

Le nombre de tous les cas possibles $A_6^4 = 360$ privé du nombre des cas ou le chiffre des milliers est 0 ($A_5^3 = 60$) donc il y a $360 - 60 = 300$ nombres de 4 chiffres.

2) Même raisonnement donc il y a $A_6^6 - A_5^5 = 720 - 120 = 600$ nombres de 6 chiffres.

3) Un nombre entier est pair si le chiffre des unités est $0 - 2 - 4$ : « le nombre d'entiers dont le chiffre des unités est O, il y en a $A_5^5 = 120$

Le nombre d'entier dont le chiffre des unités est 2 ; il y en a $A_5^5 - A_4^4 = 96$

Le nombre d'entier dont le chiffre des unités est 4 ; il y en a $A_5^5 - A_4^4 = 96$

finalement le nombre d'entier pair est : $120 + 96 + 96 = 312$.

4) Le chiffre des unités est 5 et le chiffre des milliers est différent de 0 on a alors $A_5^5 - A_4^4 = 96$.

5) Soit X un entier de trois chiffres est divisible par 9 avec $X = a b c$ avec $a eq.not 0$ et $a,b,c in {0,1,2,3,4,5}$. X est divisible par 9 si et seulement si $a + b + c$ est divisible par 9.
- Du type $4 + 0 + 5$ il y en a $A_3^3 - A_2^2 = 4$.
- Du type $2 + 3 + 4$ il y en a $A_3^3 = 6$.
- Du type $3 + 1 + 5$ il y en a $A_3^3 = 6$

Donc le nombre d'entiers de 3 chiffres et divisibles par 9 est : $6 + 6 + 4 = 16$.

== Exercice 20

On sait que $A_n^p = frac(n!, (n-p)!)$ et $C_n^p = frac(n!, p!(n-p)!)$ ; $p lt.eq n$

a) $A_7^n = 21 A_6^(n-2)$ avec $n lt.eq 7$ et $n-2 lt.eq 6$ soit $n lt.eq 7$.

$frac(7!, (7-n)!) = 21 dot frac(6!, (6-n+2)!)$ ou encore $frac(7 dot 6!, (7-n)!) = frac(3 dot 7 dot 6!, (8-n)!)$

équivaut à : $frac(1, (7-n)!) = frac(3, (8-n)!)$ on multiple par $(8-n)!$ l'équation devient

$(8-n)= 3$ soit $n = 5 lt.eq 7$ donc la solution est $n = 5$.

b) $C_n^2 + C_(n-3)^2 = 17$ avec $n - 3 gt.eq 2$ et $n gt.eq 2$ soit $n gt.eq 5$

$frac(n!, 2!(n-2)!) + frac((n-3)!, 2!(n-3-2)!) = 17$ ou encore $frac(n(n-1)(n-2)!, 2.(n-2)!) + frac((n-3)(n-4)(n-5)!, 2(n-5)!) = 17$

et par suite $n(n-1) + (n-3)(n-4) = 34$. Soit $2n^2 - 8n + 12 - 34 = 0 arrow.double n^2 - 4n - 11 = 0$

$Delta' = (2)^2 + 11 = 15$, les solutions sont $n' = 2 + sqrt(15)$ ou $n = 2 - sqrt(15)$

n'appartiennent pas IN, donc cette équation n'a pas de solution dans IN.

c) $A_n^3 = 72 A_(n-2)^1$ définie que pour $n gt.eq 3$.

$frac(n!, (n-3)!) = 72 dot frac((n-2)!, (n-2-1)!)$ soit $n(n-1)(n-2) = 72(n-2)$

// Source: Parascolaire p.155

ou encore $(n - 2)(n^2 - n - 72) = 0$ équivaut à $n = 2 lt.eq 3$ (à rejeter) ou $(n^2 - n - 72 = 0)$

\* $n^2 - n - 72 = 0$ $Delta' = 1 + 72 times 4 = 289$ donc les solutions $n = -8 in.not NN$ ou $n = 9 gt.eq 3$

finalement la lution est $n = 9$.

== Exercice 21

1) Une droite est définie par la donnée de deux de ses points.

En prenant deux à deux les n points donnés du cercle, on détermine $C_n^2$ droites distincts (car une droite rencontre un cercle en au plus deux points).

Donc les n points du cercle que l'on joint deux à deux détermine

$C_n^2 = frac(n(n-1), 2)$ droites.

2) Un triangle est définie par la donnée de ses sommets, c'est à dire par la donnée de trois points non alignés. (On ne tient pas compte de l'ordre dans lequel sont énoncés les sommets). Or, les n points donnés du cercle sont distincts et il n'en existe pas trois qui soient alignés (car une droite rencontre un cercle en au plus deux points). Donc les n points donnés du cercle déterminent $C_n^3$ triangles différents, soit : $frac(n(n-1)(n-2), 6)$ triangles.

== Exercice 22

Par trois points non alignés, ne passe qu'un seul cercle et on ne tient pas compte de l'ordre dans lequel sont énoncé les points et ceci bien sur pour justifier l'emploi des combinaisons, dans le nombre de cercle est

$C_n^3 = frac(n(n-1)(n-2), 6)$.

== Exercice 23

1) f est une fonction polynome donc dérivable sur $RR$ et on a : pour tout $x in RR$, $f'(x) = n(1 + x)^(n-1)$.

Si on développe $f(x)$ par le binome de Newton, on a :

$f(x) = C_n^0 + C_n^1 x + C_n^2 x^2 + ... + C_n^(n-1) x^(n-1) + C_n^n x^n$ et en dérivant cette somme

on a : $f'(x) = C_n^1 + 2 C_n^2 x + .... + (n-1) C_n^(n-1) x^(n-2) + n C_n^n x^(n-1)$.

2) a) En égalisant les deux écritures de $f'(x)$ et en remplaçant x par 1, on trouve que : $n(1+1)^(n-1) = C_n^1 + 2 C_n^2 times 1 + ... + (n-1) C_n^(n-1) times 1 + n C_n^n times 1$

d'où : $n 2^(n-1) = C_n^1 + 2 C_n^2 + ... + (n-1) C_n^(n-1) + n C_n^n$.

b) Remplaçons $C_n^0$ par 1 et $C_n^1$ par n dans l'expression :

$(1+x)^n = C_n^0 + C_n^1 x + C_n^2 x^2 + .... + C_n^(n-1) x^(n-1) + C_n^n x^n$

Nous obtenons : $((1+x)^n = 1 + n x + C_n^2 x^2 + .... + C_n^(n-1) x^(n-1) + C_n^n x^n)$.

// Source: Parascolaire p.156

Il est immédiat que $(1 + x)^n gt.eq 1 + n x$ pour $x gt.eq 0$.

== Exercice 24

Ce genre d'exercice doit obligatoirement faire penser au binome de Newton. Restent à trouver les valeurs par lesquelles seront remplacés a et b.

1) On a : $(1 + x)^n = C_n^0 + C_n^1 x + C_n^2 x^2 + .... + C_n^(n-1) x^(n-1) + C_n^n x^n$ #h(1em) *(1)*

Si on remplace x par $(-1)$ on obtient :

$C_n^0 - C_n^1 + C_n^2 + ..... (-1)^(n-1) C_n^(n-1) + (-1)^n C_n^n = 0$.

2) On suppose que n est pair ($n = 2p$). Remplaçons dans la formule du (1), n par 2p. On trouve :

$C_(2p)^0 - C_(2p)^1 + C_(2p)^2 + .... + (-1)^(2p) C_(2p)^(2p) = 0 arrow.double C_(2p)^0 - C_(2p)^1 + C_(2p)^2 + .... + C_(2p)^(2p) = 0$ #h(1em) *(2)*.

Appliquons la formule (1) au cas $x = 1$

on obtient : $(1 + 1)^n = C_n^0 + C_n^1 times 1 + C_n^2 times 1^2 + ..... + C_n^n dot 1^n$.

D'où $2^n = C_n^0 + C_n^1 + C_n^2 + ...... + C_n^(n-1) + C_n^n$ ; remplaçons aussi n par 2p

on obtient : $2^(2p) = C_(2p)^0 + C_(2p)^1 + C_(2p)^2 + ..... + C_(2p)^(2p)$ #h(1em) *(3)*.

3) *(2)* + *(3)* conduit à $2 C_(2p)^0 + 2 C_(2p)^2 + ..... + 2 C_(2p)^(2p) = 2^(2p)$.

D'où $C_(2p)^0 + C_(2p)^2 + ..... + C_(2p)^(2p) = frac(2^(2p), 2) = 2^(2p-1)$.

*(3)* $-$ *(2)* donne : $2 C_(2p)^1 + 2 C_(2p)^3 + .... + 2 C_(2p)^(2p-1) = 2^(2p)$.

Où encore $C_(2p)^1 + C_(2p)^3 + ..... + C_(2p)^(2p-1) = 2^(2p-1)$.

== Exercice 25

Soit a, $a+b$, $a+2b$, $a + 3b$ les quatre coefficients en question.

Reconstitutions un fragment de triangle de Pascal :

$2a + b$ #h(1em) $a + 2b$ #h(1em) $a + 3b$ #h(1em) $2a + 5b$\
$4a + 4b$ #h(1em) $4a + 8b$ écrire comme $a + b$ #h(2em) $a + 2$ #h(2em) $a + 3b$\
$2a + b$ #h(1em) $2a + 3b$ #h(1em) $2a + 5b$ #h(1em) $4a + 4b$ #h(1em) $4a + 8b$

avec a est un coefficient qui existe à l'intersection de la $n^e$ ligne et la $p^e$ colonne du triangle de Pascal.

Donc $a = C_n^p$ ; $a + b = C_n^(p+1)$ ; $a + 2b = C_n^(p+2)$ ; $a + 3b = C_n^(p+3)$

$2a + b = C_(n+1)^(p+1)$ ; $2a + 3b = C_(n+1)^(p+2)$ ; $2a + 5b = C_(n+1)^(p+3)$

$4a + 4b = C_(n+2)^(p+2)$ ; $4a + 8b = C_(n+2)^(p+3)$

Des conditions nécessaires apparaissent :

$4a + 4b = 4(a + b)$ et donc $C_(n+2)^(p+2) = 4 C_n^(p+1)$.

// Source: Parascolaire p.157

$4a + 8b = 4(a + 2b)$ et donc $C_(n+2)^(p+3) = 4 C_n^(p+2)$.

Soit $frac((n+2)!, (p+2)!(n-p)!) = 4 frac(n!, (p+1)!(n-p-1)!)$

et $frac((n+2)!, (p+3)!(n-p-1)!) = 4 frac(n!, (p+2)!(n-p-2)!)$

La simplification des factorielles donne respectivement :

$frac((n+2)(n+1), (p+2)(n-p)) = 4$ et $frac((n+2)(n+1), (p+3)(n-p-1)) = 4$.

Pour que les deux égalités soient vrais on doit avoir :

$(p + 2)(n - p) = (p + 3)(n - p - 1)$ ou encore $n = 2p + 3$.

Chacune des relations équivalent alors à :

$(2p + 5)(2p + 4) = 4(p + 2)(p + 3)$ soit à $2p + 5 = 2(p+3)$ et ce si est impossible donc il n'existe pas de valeur de n pour laquelle quatre coefficient binomiaux sont en progression arithmétique

== Exercice 26

1) l'urne contient 20 boules et on tire simultanément 10 boules alors le nombre de cas possibles est $C_(20)^(10) = 184756$

2) a) l'urne contient 2 n boules et on tire simultanément n boules alors le nombre de cas possibles est. $C_(2n)^n = frac((2n)!, n!(2n - n)!) = frac((2n)!, (n!)^2)$

b) on tire parmis les 2 n boules : p noires et n-p blanches alors le nombre de cas possibles est : $C_n^p C_n^(n-p) = C_n^p dot C_n^p = (C_n^p)$ car $C_n^p = C_n^(n-p)$

c) on a :

$ "le nombre de cas où on tire 0 noires et n blanches est" (C_n^0)^2 $
$ "le nombre de cas où on tire 1 noires et n-1 blanches est" (C_n^1)^2 $
$ "le nombre des cas où on tire 2 noires et n-2 blanches est" (C_n^2)^2 $
$ dots.v $
$ "le nombre de cas où on tire n boules noires et 0 blanche est" (C_n^n)^2 $

on additionne ces cas on trouve tous les cas possibles

par suite $(C_n^0)^2 + (C_n^1)^2 + (C_n^2)^2 + ... + (C_n^n)^2 = C_(2n)^n = frac((2n)!, (n!)^2)$
