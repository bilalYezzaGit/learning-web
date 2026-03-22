# Savoir — Denombrement

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
