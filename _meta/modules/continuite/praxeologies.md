# Praxeologies — Continuite

Module: continuite
Programme: 3eme-math

> **Regle de granularite** : une praxeologie = un type de tache + une technique.
> Si deux exercices utilisent des techniques differentes (theoremes differents, methodes differentes),
> ce sont deux praxeologies distinctes. Utiliser la notation Prax5a, Prax5b pour regrouper
> des variantes d'un meme theme.

### Prax1 — Justifier la continuite en un point par le type de fonction

- **Notions mobilisees** : N2
- **Type de tache (T)** : Montrer que f est continue en a en identifiant son type (polynome, rationnelle, sqrt...)
- **Technique (tau)** : Identifier le type de f (polynome, rationnelle, sqrt, affine). Citer le theoreme T1 correspondant. Verifier les conditions (a dans le domaine, denominateur non nul, expression sous la racine positive). Conclure "D'ou f est continue en a".
- **Technologie (theta)** : Les fonctions usuelles sont continues sur leur domaine de definition (T1)
- **Variables didactiques** : type de fonction (polynome, rationnelle, irrationnelle), complexite de l'expression, valeur de a
- **Exemples canoniques** : f(x) = 2x^4+4x^3-1 en 0, f(x) = x^7-3x^4/100+2x+1 en sqrt(2)
- **Difficulte** : 1

### Prax2 — Justifier la continuite par les operations

- **Notions mobilisees** : N3
- **Type de tache (T)** : Montrer que f est continue en a en la decomposant en operations de fonctions continues
- **Technique (tau)** : Decomposer f en somme/produit/quotient/composition de fonctions continues. Pour chaque composante, citer le theoreme adapte (T2 somme/produit, T3 quotient, T4 valeur absolue, T5 sqrt). Verifier les conditions (denominateur non nul, expression sous sqrt positive). Conclure par enchainement.
- **Technologie (theta)** : Les operations algebriques preservent la continuite (T2, T3, T4, T5)
- **Variables didactiques** : nombre d'operations imbriquees, presence de sqrt, de valeur absolue, de quotient
- **Exemples canoniques** : f(x) = sqrt(x-2)/(x^2+2x+5) en 2, f(x) = |2x-1|+sqrt(x+3) en 1
- **Difficulte** : 1

### Prax3 — Etudier la continuite d'une fonction par morceaux

- **Notions mobilisees** : N4, N5
- **Type de tache (T)** : Etudier la continuite d'une fonction definie par morceaux sur un intervalle ou en un point de raccordement
- **Technique (tau)** : (1) Sur chaque morceau ouvert, identifier le type (polynome, rationnelle...) et conclure par T1. (2) Au(x) point(s) de raccordement x0 : calculer la limite a gauche, la limite a droite, et f(x0). (3) Si les trois sont egaux : f continue en x0. Sinon : f discontinue en x0.
- **Technologie (theta)** : f continue en a <=> f continue a droite et a gauche en a (T6). Chaque morceau est continu par T1.
- **Variables didactiques** : nombre de morceaux (2 ou 3), type de fonctions sur chaque morceau, nature de la discontinuite (saut ou point isole)
- **Exemples canoniques** : f(x) = {2x+1 si x>1, 3 si x=1, 3x-1 si x<1}, f(x) = {x^2 si x<=0, sqrt(x) si x>0}
- **Difficulte** : 2

### Prax4 — Appliquer le TVI pour prouver l'existence d'une solution

- **Notions mobilisees** : N7.1, N7.2
- **Type de tache (T)** : Montrer que l'equation f(x) = 0 (ou f(x) = k) admet au moins une solution dans un intervalle donne
- **Technique (tau)** : (1) Justifier que f est continue sur [a,b] (par type ou par operations). (2) Calculer f(a) et f(b). (3) Constater que k est entre f(a) et f(b) (ou que f(a).f(b) < 0 pour k=0). (4) Conclure par le TVI : il existe au moins un c dans ]a,b[ tel que f(c) = k.
- **Technologie (theta)** : Theoreme des valeurs intermediaires (T8, T8')
- **Variables didactiques** : type de f (polynome, rationnelle, sqrt), valeur de k (0 ou autre), intervalle donne ou a trouver
- **Exemples canoniques** : f(x) = x^3+3x/2+1, solution dans [-2,1] ; f(x) = 2x^3-3x^2-1, zero dans [1,2]
- **Difficulte** : 1

### Prax5 — Prouver l'unicite d'une solution (TVI + monotonie)

- **Notions mobilisees** : N7.3
- **Type de tache (T)** : Montrer que l'equation f(x) = 0 admet une unique solution dans un intervalle donne
- **Technique (tau)** : (1) Appliquer le TVI pour l'existence (comme Prax4). (2) Montrer que f est strictement monotone sur [a,b] (soit par definition, soit par etude de f'). (3) Conclure : la solution est unique (T9).
- **Technologie (theta)** : Une fonction continue strictement monotone est injective : chaque valeur est atteinte au plus une fois (T9)
- **Variables didactiques** : monotonie evidente (f est un polynome de degre 1 ou 3 sans extremum sur l'intervalle) ou necessitant une etude de signe
- **Exemples canoniques** : f(x) = x^3+3x-1, unique solution dans [0,1] ; f(x) = sqrt(x)+x, unique solution de f(x)=3
- **Difficulte** : 2

### Prax6 — Determiner l'image d'un intervalle par une fonction continue

- **Notions mobilisees** : N6
- **Type de tache (T)** : Determiner f(I) pour un intervalle I donne
- **Technique (tau)** : (1) Etudier les variations de f sur I (croissante, decroissante, ou changement de sens). (2) Si f monotone : f([a,b]) = [f(a),f(b)] ou [f(b),f(a)]. (3) Si f change de sens : trouver le(s) extremum(s), puis composer les images des sous-intervalles. (4) Attention aux bornes ouvertes/fermees.
- **Technologie (theta)** : L'image d'un intervalle par une fonction continue est un intervalle (T7). Les bornes sont ouvertes si l'intervalle est ouvert ou si la valeur n'est pas atteinte.
- **Variables didactiques** : intervalle ouvert/ferme/semi-ouvert, f monotone ou non, lecture depuis un tableau de variation
- **Exemples canoniques** : f(x) = x^2 sur [-1, 2], f(I) = [0, 4] ; lecture d'image depuis un tableau de variation
- **Difficulte** : 2

### Prax7 — Approximer une solution par dichotomie

- **Notions mobilisees** : N8.1
- **Type de tache (T)** : Encadrer une solution alpha de f(x) = 0 a la precision demandee (10^-1, 10^-2)
- **Technique (tau)** : (1) Partir de l'intervalle [a,b] ou f(a).f(b) < 0. (2) Calculer f(m) ou m = (a+b)/2. (3) Si f(a).f(m) < 0 : la solution est dans [a,m], sinon dans [m,b]. (4) Repeter jusqu'a la precision souhaitee.
- **Technologie (theta)** : A chaque etape, on divise l'intervalle par 2. Apres n etapes, la precision est (b-a)/2^n.
- **Variables didactiques** : precision demandee (10^-1, 10^-2), nombre d'etapes, presentation en tableau
- **Exemples canoniques** : Encadrer alpha a 10^-2 ou f(x) = x^3-x-1 ; intersection f(x) = x^2+1 et g(x) = -1/x
- **Difficulte** : 1

### Prax8 — Determiner le nombre de solutions d'une equation

- **Notions mobilisees** : N7, N8.2
- **Type de tache (T)** : Montrer que l'equation f(x) = 0 admet exactement n solutions (souvent 1, 2, 3 ou 4)
- **Technique (tau)** : (1) Dresser le tableau de variation complet de f (deriver, signe de f', valeurs aux bornes et extrema). (2) Sur chaque intervalle de monotonie, appliquer le TVI + unicite. (3) Compter le nombre total de solutions.
- **Technologie (theta)** : Sur chaque intervalle de monotonie, le TVI + monotonie donne au plus une solution. Le nombre total est la somme sur tous les intervalles.
- **Variables didactiques** : degre du polynome, nombre d'extrema, valeurs aux extrema (signe), type de fonction
- **Exemples canoniques** : f(x) = x^4-4x^2-x+1, exactement 4 solutions ; f(x) = 2x^3-3x^2-1, exactement 1 solution
- **Difficulte** : 2

### Prax9 — Justifier la continuite de |f| ou sqrt(f)

- **Notions mobilisees** : N3.4, N3.5
- **Type de tache (T)** : Montrer que |f| est continue en a, ou que sqrt(f) est continue en a
- **Technique (tau)** : Pour |f| : f continue en a => |f| continue en a (T4, direct). Pour sqrt(f) : verifier que f est continue en a ET que f(a) > 0 (strictement), puis appliquer T5.
- **Technologie (theta)** : T4 (valeur absolue) et T5 (racine carree avec condition stricte)
- **Variables didactiques** : condition f(a) > 0 oubliee pour sqrt, cas limite f(a) = 0
- **Exemples canoniques** : |x^2-4| continue en 2, sqrt(x^2+1) continue en tout reel
- **Difficulte** : 1

### Prax10 — Montrer la continuite par la definition alpha-beta

- **Notions mobilisees** : N1.1
- **Type de tache (T)** : Montrer que f est continue en a en utilisant directement la definition (trouver alpha en fonction de beta)
- **Technique (tau)** : (1) Ecrire |f(x)-f(a)| et simplifier. (2) Majorer |f(x)-f(a)| en fonction de |x-a|. (3) Choisir alpha = beta/K (ou K est le coefficient de majoration). (4) Conclure : pour tout beta > 0, il suffit de prendre alpha = ... pour que |f(x)-f(a)| < beta.
- **Technologie (theta)** : Definition D1 de la continuite. La difficulte est de trouver la bonne majoration.
- **Variables didactiques** : f affine (alpha = beta/|a| direct), f quadratique (necessite une restriction locale), f avec sqrt (utiliser la conjuguee)
- **Exemples canoniques** : f(x) = 2x-1 en a=2 (alpha = beta/2), f(x) = x^2 en a (restriction locale)
- **Difficulte** : 2
