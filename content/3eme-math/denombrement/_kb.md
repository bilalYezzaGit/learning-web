# KB Module — Dénombrement

id: module_denombrement
niveau: 3eme-math
version: 0.1

## 0) Objectif du module (1 phrase)

> Maîtriser les outils fondamentaux du dénombrement (arrangements, permutations, combinaisons, binôme de Newton) pour compter de façon systématique et rigoureuse le nombre de configurations possibles dans des situations finies.

## 1) Scope du module

### Inclus
- Cardinal d'un ensemble fini (union, intersection, complémentaire, produit cartésien)
- P-uplets et produit cartésien (listes ordonnées avec ou sans répétition)
- Arrangements sans répétition ($A_n^p$)
- Arrangements avec répétition ($n^p$, nombre d'applications)
- Permutations ($n!$)
- Combinaisons ($C_n^p$) et leurs propriétés
- Triangle de Pascal et relation de récurrence
- Formule du binôme de Newton
- Nombre de parties d'un ensemble ($2^n$)
- Tableau récapitulatif des tirages (simultané, successif avec/sans remise)

### Exclus
- Probabilités (module 12 — Probabilités)
- Dénombrement dans des structures algébriques (hors programme)
- Fonctions génératrices, séries formelles
- Combinatoire avancée (Stirling, Catalan, etc.)
- Analyse combinatoire dans $\mathbb{Z}/n\mathbb{Z}$ (modules 19-20 — Divisibilité, Nombres premiers)

## 2) Transposition didactique

### Savoir savant
- Théorie des ensembles finis et cardinal
- Fonctions entre ensembles finis (injections = arrangements, bijections = permutations, applications = arrangements avec répétition)
- Sous-ensembles de cardinal fixé (combinaisons)
- Algèbre des polynômes (binôme de Newton comme identité algébrique)

### Savoir à enseigner (programme tunisien)
- Le programme introduit les notions dans l'ordre : cardinal → produit cartésien → arrangements → permutations → combinaisons → binôme de Newton
- L'accent est mis sur l'identification du modèle de tirage approprié (simultané = combinaisons, successif sans remise = arrangements, successif avec remise = $n^p$)
- Les démonstrations des formules de $A_n^p$ et $C_n^p$ sont attendues
- La formule du binôme est admise ou démontrée par récurrence selon les classes

### Adaptations didactiques
- Approche par les situations concrètes (urnes, cartes, codes, anagrammes) avant formalisation
- Le « tableau récapitulatif des tirages » (XY Plus, Parascolaire) est un outil pédagogique central pour aider les élèves à choisir la bonne formule
- Les anagrammes servent d'introduction intuitive aux permutations
- Le triangle de Pascal est construit comme outil de calcul rapide des $C_n^p$
- Notation tunisienne : $A_n^p$ (pas $P(n,p)$), $C_n^p$ (pas $\binom{n}{p}$ en priorité, même si la notation binomiale est connue)

## 3) Prérequis & liens inter-modules

### Prérequis
- Acquis antérieurs : opérations sur les ensembles (union, intersection, complémentaire), notion de fonction (injection, surjection, bijection)
- Acquis antérieurs : calcul algébrique (puissances, factorisation, développement)
- Module 9 — Suites réelles : notion de récurrence (pour démonstration du binôme de Newton)

### Ouvre vers
- Module 12 — Probabilités : le dénombrement fournit le calcul des cardinaux pour les probabilités classiques (cas favorables / cas possibles)
- Module 19 — Divisibilité dans N : propriétés de divisibilité de $n!$ et $C_n^p$

## 4) Carte des notions (plan)

- N1: Cardinal d'un ensemble fini
    - N1.1: Notation card(E), ensemble vide
    - N1.2: Cardinal de l'union ($\text{card}(E \cup F) = \text{card}(E) + \text{card}(F) - \text{card}(E \cap F)$)
    - N1.3: Cardinal du complémentaire ($\text{card}(\overline{A}) = \text{card}(E) - \text{card}(A)$)
    - N1.4: Principe additif (ensembles disjoints)
- N2: Produit cartésien et p-uplets
    - N2.1: Définition du p-uplet (liste ordonnée)
    - N2.2: Cardinal du produit cartésien ($\text{card}(E \times F) = \text{card}(E) \times \text{card}(F)$)
    - N2.3: Principe multiplicatif (choix successifs indépendants)
- N3: Arrangements sans répétition
    - N3.1: Définition (p-uplet d'éléments deux à deux distincts)
    - N3.2: Formule $A_n^p = n(n-1)\cdots(n-p+1) = \frac{n!}{(n-p)!}$
- N4: Permutations
    - N4.1: Définition (arrangement de n parmi n)
    - N4.2: Factorielle : $n! = n \times (n-1) \times \cdots \times 1$, convention $0! = 1$
    - N4.3: Anagrammes comme application des permutations
    - N4.4: Anagrammes avec lettres répétées : $\frac{n!}{p_1! p_2! \cdots p_k!}$
- N5: Combinaisons
    - N5.1: Définition (sous-ensemble de p éléments, sans ordre)
    - N5.2: Formule $C_n^p = \frac{A_n^p}{p!} = \frac{n!}{p!(n-p)!}$
    - N5.3: Propriétés : $C_n^0 = C_n^n = 1$, $C_n^1 = C_n^{n-1} = n$
    - N5.4: Symétrie : $C_n^p = C_n^{n-p}$
    - N5.5: Relation de Pascal : $C_n^p = C_{n-1}^{p-1} + C_{n-1}^p$
    - N5.6: Triangle de Pascal (construction et lecture)
- N6: Nombre d'applications ($n^p$)
    - N6.1: Tirages successifs avec remise = applications de $\{1,\ldots,p\}$ dans $E$
    - N6.2: Formule $n^p$
- N7: Binôme de Newton
    - N7.1: Formule $(a+b)^n = \sum_{k=0}^n C_n^k a^{n-k} b^k$
    - N7.2: Cas particuliers : $(1+1)^n = 2^n$, $(1-1)^n = 0$
    - N7.3: Nombre de parties d'un ensemble : $2^n$
- N8: Modélisation et choix de formule
    - N8.1: Tableau récapitulatif des tirages
    - N8.2: Identification du modèle (ordre ? répétition ?)

## 5) Théorèmes & propriétés clés

| ID | Énoncé | Statut | Utilisé dans |
|----|--------|--------|--------------|
| D1 | Cardinal de E = nombre d'éléments de E, noté card(E) | — | Prax1, Prax2 |
| T1 | $\text{card}(E \cup F) = \text{card}(E) + \text{card}(F) - \text{card}(E \cap F)$ | démontré | Prax1 |
| T2 | $\text{card}(E \times F) = \text{card}(E) \times \text{card}(F)$ | démontré | Prax2, Prax3 |
| D2 | Un arrangement de p parmi n est un p-uplet d'éléments deux à deux distincts | — | Prax3 |
| T3 | $A_n^p = \frac{n!}{(n-p)!}$ | démontré | Prax3, Prax4 |
| D3 | Une permutation de n éléments est un arrangement de n parmi n | — | Prax4 |
| T4 | Le nombre de permutations de n éléments est $n!$ | démontré | Prax4 |
| D4 | Une combinaison de p parmi n est un sous-ensemble de cardinal p | — | Prax5 |
| T5 | $C_n^p = \frac{n!}{p!(n-p)!}$ | démontré | Prax5 |
| P1 | $C_n^p = C_n^{n-p}$ (symétrie) | démontré | Prax5 |
| P2 | $C_n^p = C_{n-1}^{p-1} + C_{n-1}^p$ (Pascal) | démontré | Prax5, Prax7 |
| T6 | Le nombre d'applications de $\{1,\ldots,p\}$ dans $E$ ($\text{card}(E)=n$) est $n^p$ | démontré | Prax6 |
| T7 | $(a+b)^n = \sum_{k=0}^n C_n^k a^{n-k} b^k$ (binôme de Newton) | démontré (récurrence) | Prax7 |
| P3 | $\sum_{k=0}^n C_n^k = 2^n$ (nombre de parties) | corollaire de T7 | Prax7 |
| P4 | $\sum_{k=0}^n (-1)^k C_n^k = 0$ | corollaire de T7 | Prax7 |

> **Notations tunisiennes** : $A_n^p$ pour les arrangements (jamais $P(n,p)$), $C_n^p$ pour les combinaisons (la notation $\binom{n}{p}$ est acceptée mais secondaire). Factorielle notée $n!$.

## 6) Knowledge Components

### Facts (à mémoriser)
- F1: $0! = 1$ et $1! = 1$
- F2: $C_n^0 = C_n^n = 1$
- F3: $C_n^1 = C_n^{n-1} = n$
- F4: Les premières lignes du triangle de Pascal (jusqu'à $n=6$ environ)
- F5: $(1+1)^n = 2^n$ et $(1-1)^n = 0$
- F6: Tableau récapitulatif : simultané → $C_n^p$, successif sans remise → $A_n^p$, successif avec remise → $n^p$

### Skills (procédures à maîtriser)
- S1: Calculer le cardinal d'une union/intersection — notion: N1 — difficulté: 1 — entraîné via: Prax1
- S2: Appliquer le principe multiplicatif — notion: N2 — difficulté: 1 — entraîné via: Prax2
- S3: Calculer $A_n^p$ — notion: N3 — difficulté: 1 — entraîné via: Prax3
- S4: Calculer $n!$ et le nombre de permutations — notion: N4 — difficulté: 1 — entraîné via: Prax4a
- S5: Calculer $C_n^p$ (formule directe ou triangle) — notion: N5 — difficulté: 1 — entraîné via: Prax5a
- S6: Identifier le modèle de tirage approprié — notion: N8 — difficulté: 2 — entraîné via: Prax2, Prax8
- S7: Développer $(a+b)^n$ avec le binôme — notion: N7 — difficulté: 1 — entraîné via: Prax7a
- S8: Calculer un nombre d'anagrammes (avec ou sans lettres répétées) — notion: N4 — difficulté: 1-2 — entraîné via: Prax4a, Prax4b
- S9: Dénombrer avec la méthode du complémentaire — notion: N1 — difficulté: 2 — entraîné via: Prax6
- S10: Résoudre une équation en n ou p avec $A_n^p$ ou $C_n^p$ — notion: N3, N5 — difficulté: 2 — entraîné via: Prax9

### Principles (comprendre en profondeur)
- P1: Un arrangement tient compte de l'ordre, une combinaison non — la relation $C_n^p = A_n^p / p!$ traduit le fait qu'on divise par le nombre de réarrangements
- P2: Le complémentaire est souvent plus simple à compter que l'événement direct ("au moins un" = total - "aucun")
- P3: Le triangle de Pascal encode la relation de récurrence et permet de lire les $C_n^p$ directement
- P4: Le binôme de Newton généralise le développement $(a+b)^2$ et fournit des identités puissantes sur les $C_n^p$

> **Échelle de difficulté** :
> 0 — découverte guidée
> 1 — application directe
> 2 — combinaison de techniques
> 3 — problème synthèse

## 7) Exemples canoniques

Les exemples "classiques" qui reviennent dans tous les manuels et au Bac tunisien.

- EC1: Tirage de boules dans une urne (simultané, successif avec/sans remise) — illustre le choix de formule (N8) et la modélisation
- EC2: Anagrammes d'un mot (ANANAS, ESSENTIEL, MATHEMATIQUES) — illustre les permutations avec répétitions (N4.3, N4.4)
- EC3: Mains de cartes dans un jeu de 32 cartes (au moins un as, exactement 2 rois, etc.) — illustre les combinaisons avec contraintes (N5, méthode du complémentaire)
- EC4: Codes et mots de passe (nombres de 4 chiffres distincts, codes à lettres) — illustre arrangements et principe multiplicatif (N2, N3)
- EC5: Chemins sur un réseau/grille (de A à Z, en allant uniquement droite ou haut) — illustre la bijection avec les mots binaires et les combinaisons (N5)
- EC6: Diagonales d'un polygone / triangles formés par n points — illustre les combinaisons géométriques (N5)
- EC7: Somme obtenue en lançant 3 dés (question historique de Galilée) — illustre le dénombrement de p-uplets avec contraintes (N6, N2)
- EC8: Nombre de parties d'un ensemble, sommes alternées de $C_n^k$ — illustre le binôme de Newton (N7)

## 8) Praxéologies — patterns d'exercices

### Prax1 — Calculer le cardinal d'une union/intersection
- **Notions mobilisées** : N1.2, N1.3, N1.4
- **Type de tâche (T)** : Déterminer le nombre d'éléments dans une union ou une intersection de 2 ou 3 ensembles finis, à partir de données partielles
- **Technique (tau)** : Appliquer la formule $\text{card}(E \cup F) = \text{card}(E) + \text{card}(F) - \text{card}(E \cap F)$, éventuellement via un diagramme de Venn ou un tableau de Carrol
- **Technologie (theta)** : Principe d'inclusion-exclusion pour les ensembles finis
- **Variables didactiques** : nombre d'ensembles (2 ou 3), données directes ou à déduire, présence d'un complémentaire
- **Exemples canoniques** : appareils avec défauts A et B (Manuel ex.1), club de joueurs bridge/tarot (Parascolaire résumé), élèves étudiant 3 langues (Parascolaire ex.6)
- **Difficulté** : 1

### Prax2 — Identifier le modèle de tirage et appliquer le principe multiplicatif
- **Notions mobilisées** : N2, N8.1, N8.2
- **Type de tâche (T)** : Face à une situation concrète, identifier s'il s'agit d'un tirage simultané, successif avec ou sans remise, puis calculer le nombre de cas
- **Technique (tau)** : Analyser la situation en 3 critères (ordre ? répétition ? tous les éléments ?) puis appliquer la formule correspondante du tableau récapitulatif
- **Technologie (theta)** : Principe multiplicatif — si un choix se décompose en étapes indépendantes, le nombre total est le produit du nombre de choix à chaque étape
- **Variables didactiques** : contexte (urne, dés, codes, cartes), nombre d'étapes, présence d'indices trompeurs (l'élève doit décider du modèle)
- **Exemples canoniques** : tirage de boules (simultané vs successif), lancer de dés, formation de codes
- **Difficulté** : 1-2

### Prax3 — Calculer un nombre d'arrangements
- **Notions mobilisées** : N3.1, N3.2
- **Type de tâche (T)** : Calculer le nombre de p-uplets d'éléments distincts d'un ensemble de n éléments
- **Technique (tau)** : Appliquer la formule $A_n^p = n(n-1)\cdots(n-p+1) = \frac{n!}{(n-p)!}$
- **Technologie (theta)** : Chaque position du p-uplet réduit d'un le nombre de choix restants (sans remise + ordre)
- **Variables didactiques** : valeurs de n et p, contexte (excursions, bureaux, placements ordonnés)
- **Exemples canoniques** : circuits touristiques de p villes parmi n (Parascolaire ex.12), tirages successifs sans remise de boules
- **Difficulté** : 1

### Prax4a — Calculer un nombre de permutations (anagrammes, mots distincts)
- **Notions mobilisées** : N4.1, N4.2, N4.3
- **Type de tâche (T)** : Calculer le nombre d'anagrammes d'un mot dont toutes les lettres sont distinctes, ou le nombre de façons d'ordonner n objets
- **Technique (tau)** : Le nombre est $n!$ où n est le nombre de lettres/objets
- **Technologie (theta)** : Une permutation est un arrangement de n parmi n ; chaque position a un choix décroissant
- **Variables didactiques** : n (taille du mot), présence de contraintes (commence par X, finit par Y)
- **Exemples canoniques** : anagrammes de BLANCHE (Manuel ex.13), placement de personnes sur des chaises (Manuel ex.14-15)
- **Difficulté** : 1

### Prax4b — Calculer un nombre d'anagrammes avec lettres répétées
- **Notions mobilisées** : N4.3, N4.4
- **Type de tâche (T)** : Calculer le nombre d'anagrammes d'un mot contenant des lettres qui se répètent
- **Technique (tau)** : Appliquer la formule $\frac{n!}{p_1! p_2! \cdots p_k!}$ où $p_i$ est le nombre de répétitions de la i-ème lettre
- **Technologie (theta)** : On divise par le nombre de permutations internes de chaque groupe de lettres identiques, car ces permutations ne changent pas le mot
- **Variables didactiques** : nombre de lettres, nombre de groupes de répétitions, taille des groupes
- **Exemples canoniques** : ANANAS ($\frac{6!}{3!2!}=60$), ESSENTIEL ($\frac{9!}{3!2!}=30240$), MATHEMATIQUES ($\frac{12!}{(2!)^4}$), ANTICONSTITUTIONNELLEMENT
- **Difficulté** : 2

### Prax5a — Calculer un nombre de combinaisons (application directe)
- **Notions mobilisées** : N5.1, N5.2
- **Type de tâche (T)** : Calculer le nombre de façons de choisir p éléments parmi n sans tenir compte de l'ordre
- **Technique (tau)** : Appliquer $C_n^p = \frac{n!}{p!(n-p)!}$ ou lire dans le triangle de Pascal
- **Technologie (theta)** : Une combinaison est un sous-ensemble ; l'absence d'ordre impose de diviser les arrangements par $p!$
- **Variables didactiques** : valeurs de n et p, lecture directe ou nécessité de simplifier
- **Exemples canoniques** : tirage simultané de boules, nombre de droites/triangles formés par n points, mains de cartes
- **Difficulté** : 1

### Prax5b — Utiliser les propriétés des combinaisons
- **Notions mobilisées** : N5.3, N5.4, N5.5, N5.6
- **Type de tâche (T)** : Simplifier une expression contenant des $C_n^p$ en utilisant symétrie, relation de Pascal, ou le triangle
- **Technique (tau)** : Appliquer $C_n^p = C_n^{n-p}$ pour simplifier, ou $C_n^p = C_{n-1}^{p-1} + C_{n-1}^p$ pour décomposer/construire le triangle
- **Technologie (theta)** : La symétrie vient de la formule ($p$ et $n-p$ jouent des rôles symétriques) ; la relation de Pascal vient de la partition des combinaisons selon qu'un élément fixé est choisi ou non
- **Variables didactiques** : expression à simplifier, construction du triangle jusqu'à une ligne donnée, vérification d'identités
- **Exemples canoniques** : vérifier $C_n^p = \frac{n}{p} C_{n-1}^{p-1}$ (Manuel ex.19), construire le triangle de Pascal (Manuel « Avec l'ordinateur »)
- **Difficulté** : 2

### Prax6 — Dénombrer avec la méthode du complémentaire
- **Notions mobilisées** : N1.3, N5, N6
- **Type de tâche (T)** : Calculer le nombre de configurations vérifiant « au moins un... » ou une condition complexe, en passant par le complémentaire
- **Technique (tau)** : Calculer le total puis soustraire le nombre de configurations ne vérifiant pas la condition : $|\text{au moins un}| = |\text{total}| - |\text{aucun}|$
- **Technologie (theta)** : Principe du complémentaire — $\text{card}(A) = \text{card}(E) - \text{card}(\overline{A})$
- **Variables didactiques** : « au moins un/deux », « pas tous de même couleur », contexte (cartes, boules, codes)
- **Exemples canoniques** : mains de cartes avec au moins un as (Manuel ex.6c, Parascolaire ex.5), mots avec au moins 3 fois la lettre S (Manuel V/F), tirages avec au moins une boule verte (XY Plus ex.1)
- **Difficulté** : 2

### Prax7a — Développer une puissance avec le binôme de Newton
- **Notions mobilisées** : N7.1
- **Type de tâche (T)** : Développer $(a+b)^n$ ou trouver un coefficient spécifique dans le développement
- **Technique (tau)** : Appliquer la formule $(a+b)^n = \sum_{k=0}^n C_n^k a^{n-k} b^k$ et identifier le terme de rang k
- **Technologie (theta)** : Le binôme de Newton se démontre par récurrence en utilisant la relation de Pascal
- **Variables didactiques** : valeur de n, nature de a et b (entiers, fractions, expressions algébriques), terme spécifique demandé ou développement complet
- **Exemples canoniques** : développer $(1+x)^5$, trouver le coefficient de $x^3$ dans $(2+x)^7$
- **Difficulté** : 1

### Prax7b — Exploiter les identités du binôme (sommes de $C_n^k$)
- **Notions mobilisées** : N7.2, N7.3
- **Type de tâche (T)** : Calculer des sommes de combinaisons ($\sum C_n^k$, $\sum (-1)^k C_n^k$, $\sum k C_n^k$, sommes pairs/impairs) en spécialisant le binôme
- **Technique (tau)** : Poser $a=1, b=1$ (ou $a=1, b=-1$, ou dériver) dans la formule du binôme pour obtenir l'identité cherchée
- **Technologie (theta)** : Le binôme fournit une fonction génératrice des $C_n^k$ ; spécialiser les variables donne des identités combinatoires
- **Variables didactiques** : type de somme (alternée, pondérée par k, termes pairs/impairs), besoin de dérivation
- **Exemples canoniques** : montrer $\sum C_n^k = 2^n$, montrer $\sum (-1)^k C_n^k = 0$ (Parascolaire ex.24), calculer $n \cdot 2^{n-1} = \sum k C_n^k$ (Parascolaire ex.23), montrer $(1+x)^n \geq 1+nx$ pour $x \geq 0$
- **Difficulté** : 2-3

### Prax8 — Dénombrer sous contraintes multiples (synthèse)
- **Notions mobilisées** : N2, N3, N5, N6, N8
- **Type de tâche (T)** : Résoudre un problème combinatoire concret nécessitant de combiner plusieurs formules et/ou de décomposer en cas
- **Technique (tau)** : Décomposer le problème en sous-cas indépendants, appliquer le principe multiplicatif dans chaque cas, puis sommer (principe additif) ou soustraire (complémentaire)
- **Technologie (theta)** : Combinaison du principe additif, multiplicatif et du complémentaire
- **Variables didactiques** : nombre de contraintes, mélange de types (ordre+sans ordre), nécessité de distinguer des cas (par ex. dernier chiffre = 0 vs dernier chiffre ≠ 0 pour les nombres pairs)
- **Exemples canoniques** : nombres de 4 chiffres pairs avec chiffres distincts (Manuel ex.5), mains de cartes avec exactement 1 roi et 3 coeurs (Parascolaire ex.5), disposition de jetons sur un damier (Parascolaire ex.16), codes antivol (Parascolaire ex.17)
- **Difficulté** : 2-3

### Prax9 — Résoudre une équation combinatoire
- **Notions mobilisées** : N3, N5
- **Type de tâche (T)** : Trouver la valeur de n (ou p) dans une équation faisant intervenir $A_n^p$ ou $C_n^p$
- **Technique (tau)** : Remplacer $A_n^p$ ou $C_n^p$ par leur expression en factorielles, simplifier, puis résoudre l'équation (souvent polynomiale du second degré)
- **Technologie (theta)** : Les formules de $A_n^p$ et $C_n^p$ se ramènent à des produits de facteurs consécutifs, donc à des polynômes en n
- **Variables didactiques** : degré de l'équation, nécessité de vérifier les conditions de validité ($p \leq n$, $n \in \mathbb{N}$)
- **Exemples canoniques** : $A_7^n = 21 A_6^{n-2}$ (Parascolaire ex.20a), $C_n^2 + C_{n-3}^2 = 17$ (Parascolaire ex.20b), agence proposant 56 excursions (Parascolaire ex.12b)
- **Difficulté** : 2

### Prax10 — Dénombrer des chemins sur un réseau
- **Notions mobilisées** : N5, N4.4
- **Type de tâche (T)** : Compter le nombre de chemins reliant deux points d'un quadrillage en se déplaçant uniquement vers la droite ou vers le haut
- **Technique (tau)** : Un chemin de (0,0) à (m,n) correspond à un mot de m+n lettres avec m lettres « d » et n lettres « h » ; le nombre est $C_{m+n}^m = \frac{(m+n)!}{m! \cdot n!}$
- **Technologie (theta)** : Bijection entre les chemins et les anagrammes d'un mot binaire ; le nombre est une combinaison
- **Variables didactiques** : dimensions de la grille, passage obligé par un point intermédiaire (décomposition du chemin), zones interdites
- **Exemples canoniques** : réseau de A à Z avec 10 pas droite et 5 pas haut (Manuel — Mobiliser, Situation 2), chemins passant par E puis M
- **Difficulté** : 2

### Prax11 — Identité de Vandermonde et sommes de carrés de combinaisons
- **Notions mobilisées** : N5, N7
- **Type de tâche (T)** : Démontrer ou exploiter l'identité $\sum_{k=0}^n (C_n^k)^2 = C_{2n}^n$ par un argument combinatoire
- **Technique (tau)** : Modéliser par un tirage de n boules parmi 2n (n noires + n blanches), décomposer selon le nombre de noires tirées
- **Technologie (theta)** : Argument de double comptage — compter le même ensemble de deux manières différentes
- **Variables didactiques** : formulation algébrique vs combinatoire, généralisation à d'autres identités
- **Exemples canoniques** : urne de 2n boules, n noires et n blanches (Parascolaire ex.26)
- **Difficulté** : 3

## 9) Misconceptions & erreurs fréquentes

### E1 — Confusion entre arrangement et combinaison
- **Description** : L'élève utilise $A_n^p$ quand il faut $C_n^p$ (ou inversement), car il ne distingue pas si l'ordre intervient
- **Fréquence** : très fréquente
- **Source cognitive** : Difficulté à déterminer si la situation est ordonnée ou non, surtout quand le contexte n'est pas explicite ("choisir" vs "ranger")
- **Question diagnostique** :
    > On tire simultanément 3 boules parmi 10 boules distinctes. Combien de tirages possibles ?
    - A) $10^3 = 1000$ — révèle : confusion avec tirages avec remise (n^p)
    - B) $A_{10}^3 = 720$ — révèle : confusion arrangement/combinaison (l'ordre n'intervient pas dans un tirage simultané)
    - C) $C_{10}^3 = 120$ — correct
    - D) $3! \times 10 = 60$ — révèle : erreur de formule
- **Remédiation** : Utiliser systématiquement le tableau récapitulatif des tirages ; poser les 3 questions : l'ordre intervient-il ? y a-t-il remise ? combien d'éléments choisis ?

### E2 — Oubli du cas complémentaire pour "au moins"
- **Description** : L'élève tente de lister tous les cas favorables au lieu de passer par le complémentaire
- **Fréquence** : fréquente
- **Source cognitive** : Réflexe de comptage direct ; le complémentaire est contre-intuitif ("compter ce qu'on ne veut pas")
- **Question diagnostique** :
    > Dans un jeu de 32 cartes, on tire 5 cartes. Le nombre de mains contenant au moins un as est :
    - A) $C_4^1 \times C_{28}^4$ — révèle : « au moins un » confondu avec « exactement un »
    - B) $C_{32}^5 - C_{28}^5$ — correct
    - C) $C_4^1 + C_4^2 + C_4^3 + C_4^4$ — révèle : oubli de multiplier par les cartes restantes
    - D) $4 \times C_{32}^4$ — révèle : erreur de modélisation
- **Remédiation** : Enseigner le réflexe "au moins = total - aucun" ; montrer que la méthode directe nécessite une disjonction en "exactement 1, exactement 2, ..." qui est plus lourde

### E3 — Erreur dans les anagrammes avec répétitions
- **Description** : L'élève calcule $n!$ sans diviser par les factorielles des lettres répétées, ou se trompe dans le décompte des répétitions
- **Fréquence** : fréquente
- **Source cognitive** : Confusion entre le cas « toutes lettres distinctes » ($n!$) et le cas avec répétitions ($\frac{n!}{p_1!\cdots p_k!}$)
- **Question diagnostique** :
    > Le nombre d'anagrammes du mot ANANAS est :
    - A) $6! = 720$ — révèle : oubli de la division par les répétitions
    - B) $\frac{6!}{3!} = 120$ — révèle : oubli de diviser aussi par le 2! des N
    - C) $\frac{6!}{3! \times 2!} = 60$ — correct
    - D) $\frac{6!}{3! \times 2! \times 1!} = 60$ — correct (le 1! ne change rien, mais l'écriture montre une bonne compréhension)
- **Remédiation** : Identifier d'abord toutes les lettres et leurs fréquences avant d'appliquer la formule

### E4 — Erreur sur le premier chiffre d'un nombre
- **Description** : L'élève oublie que le premier chiffre d'un nombre à k chiffres ne peut pas être 0
- **Fréquence** : fréquente
- **Source cognitive** : Le 0 est un chiffre comme les autres dans l'ensemble {0,...,9}, mais pas en position de tête
- **Question diagnostique** :
    > Combien peut-on former de nombres de 4 chiffres distincts avec les chiffres 0 à 9 ?
    - A) $A_{10}^4 = 5040$ — révèle : oubli de la contrainte premier chiffre ≠ 0
    - B) $9 \times A_9^3 = 4536$ — correct
    - C) $9 \times 10^3 = 9000$ — révèle : oubli de la contrainte « distincts »
    - D) $10^4 = 10000$ — révèle : oubli des deux contraintes
- **Remédiation** : Toujours traiter le premier chiffre séparément (9 choix), puis compléter avec les chiffres restants

### E5 — Confusion entre $C_n^p$ et le binôme de Newton
- **Description** : L'élève ne fait pas le lien entre les coefficients binomiaux et la formule du binôme, ou applique mal les exposants
- **Fréquence** : occasionnelle
- **Source cognitive** : Le passage de l'algèbre (développement) à la combinatoire (comptage) n'est pas naturel
- **Question diagnostique** :
    > Le coefficient de $x^3$ dans le développement de $(1+x)^5$ est :
    - A) $C_5^3 = 10$ — correct
    - B) $C_5^2 = 10$ — correct aussi (par symétrie), mais si l'élève donne $C_5^2$ par erreur de raisonnement (confondant l'exposant de $x$ et celui de $1$), c'est un faux positif
    - C) $5^3 = 125$ — révèle : confusion avec $n^p$
    - D) $3! = 6$ — révèle : confusion avec permutations
- **Remédiation** : Écrire explicitement chaque terme $C_n^k a^{n-k} b^k$ et identifier le bon $k$

### E6 — Nombres pairs avec chiffres distincts : oubli de distinguer les cas
- **Description** : L'élève ne distingue pas le cas où le dernier chiffre est 0 des autres cas pairs, ce qui mène à un double comptage ou un sous-comptage
- **Fréquence** : fréquente
- **Source cognitive** : Le cas 0 en dernière position est spécial car il ne contraint pas le premier chiffre, contrairement aux autres chiffres pairs
- **Question diagnostique** :
    > Le nombre de nombres pairs de 4 chiffres distincts (chiffres de 0 à 9) est :
    - A) $5 \times A_9^3 = 2520$ — révèle : pas de distinction de cas (traite dernier chiffre ∈ {0,2,4,6,8} sans séparer)
    - B) $504 + 1792 = 2296$ — correct (cas 0 séparé du cas pair ≠ 0)
    - C) $4 \times 9 \times 8 \times 7 = 2016$ — révèle : oubli du cas dernier chiffre = 0
    - D) $9 \times 8 \times 7 \times 5 = 2520$ — révèle : traitement comme si le dernier chiffre était indépendant du premier
- **Remédiation** : Toujours séparer en deux cas : dernier chiffre = 0 (premier chiffre a 9 choix) et dernier chiffre ∈ {2,4,6,8} (premier chiffre a 8 choix, car ≠ 0 et ≠ dernier)

## 10) Règles rédactionnelles

- **Notations** :
  - $A_n^p$ pour les arrangements (jamais $P(n,p)$ ou $P_r$)
  - $C_n^p$ pour les combinaisons (la notation $\binom{n}{p}$ est acceptée mais $C_n^p$ est privilégiée)
  - $n!$ pour factorielle
  - card(E) pour le cardinal (pas |E| ni #E)
  - $\overline{A}$ ou $C_E A$ pour le complémentaire de A dans E

- **Niveau de rigueur** :
  - Toujours préciser les conditions de validité : $0 \leq p \leq n$ pour $A_n^p$ et $C_n^p$
  - Justifier le choix du modèle (« tirage simultané donc combinaisons » ou « ordre et sans remise donc arrangements »)
  - Lorsqu'on dénombre sous contraintes, expliciter la décomposition en cas et vérifier que les cas sont disjoints

- **Formules de rédaction** :
  - « Le nombre de façons de choisir p éléments parmi n est $C_n^p$ »
  - « On utilise le principe multiplicatif : ... d'où le nombre total est ... »
  - « Par la méthode du complémentaire, le nombre de ... est : total − nombre de ... = ... »
  - « D'après la formule du binôme de Newton appliquée avec $a = ..., b = ..., n = ...$ »

- **Longueur type** :
  - Application directe : 3-5 lignes (formule + calcul numérique)
  - Problème avec contraintes : 8-15 lignes (identification du modèle, décomposition en cas, calculs)
  - Démonstration (binôme, identité) : 10-20 lignes
