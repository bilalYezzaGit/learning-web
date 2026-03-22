# Praxeologies — Denombrement

Module: denombrement
Programme: 3eme-math

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
