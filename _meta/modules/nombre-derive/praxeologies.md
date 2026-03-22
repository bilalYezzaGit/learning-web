# Praxeologies — Nombre derive

Module: nombre-derive
Programme: 3eme-math

> **Regle de granularite** : une praxeologie = un type de tache + une technique.
> Si deux exercices utilisent des techniques differentes (theoremes differents, methodes differentes),
> ce sont deux praxeologies distinctes. Utiliser la notation Prax5a, Prax5b pour regrouper
> des variantes d'un meme theme.
> Le champ "Technique" doit decrire UNE SEULE methode — jamais "Methode 1 / Methode 2".

### Prax1 — Calculer f'(a) par la definition

- **Notions mobilisees** : N1.1
- **Type de tache (T)** : Montrer que f est derivable en a et calculer f'(a) en utilisant la definition
- **Technique (tau)** : Ecrire le taux de variation (f(a+h)-f(a))/h, simplifier algebriquement, calculer la limite quand h->0
- **Technologie (theta)** : La limite finie du taux de variation est le nombre derive par definition
- **Variables didactiques** : type de fonction (polynome, racine, inverse, quotient), complexite algebrique de la simplification
- **Exemples canoniques** : f(x)=x^2 en a=1, f(x)=x^3+2x^2-x+1 en a=0, f(x)=sqrt(x+3) en a=-2
- **Difficulte** : 1

### Prax1b — Montrer la non-derivabilite par la definition

- **Notions mobilisees** : N1.1, N6
- **Type de tache (T)** : Montrer que f n'est pas derivable en a (limite infinie ou inexistante)
- **Technique (tau)** : Ecrire le taux de variation, montrer que la limite est infinie (+∞ ou -∞) ou n'existe pas
- **Technologie (theta)** : Absence de limite finie => non-derivabilite
- **Variables didactiques** : sqrt(x-a) en a (tangente verticale), |x-a| en a (point anguleux)
- **Exemples canoniques** : f(x)=sqrt(x-1) en 1, f(x)=|x+1| en -1
- **Difficulte** : 1

### Prax2 — Calculer f'(a) avec les formules

- **Notions mobilisees** : N3, N4
- **Type de tache (T)** : Calculer le nombre derive de f en a en utilisant les formules des fonctions usuelles et les operations
- **Technique (tau)** : Identifier le type de f (polynome, rationnelle, racine composee), appliquer les formules de derivation (T4, T5, T6), substituer a
- **Technologie (theta)** : Les theoremes de derivation des fonctions usuelles et des operations
- **Variables didactiques** : type de fonction (polynome, rationnelle, irrationnelle, composee), nombre d'operations imbriquees
- **Exemples canoniques** : f(x)=x^4-3x^2+5 en 1, f(x)=4/(2x+3) en -1, f(x)=sqrt(4x+5) en 0, f(x)=2x.sqrt(x) en 1
- **Difficulte** : 1

### Prax3 — Equation de la tangente

- **Notions mobilisees** : N1.3, N1.4
- **Type de tache (T)** : Determiner l'equation de la tangente a la courbe de f au point d'abscisse a
- **Technique (tau)** : Calculer f(a) et f'(a), appliquer la formule y = f'(a)(x-a) + f(a)
- **Technologie (theta)** : La tangente est la droite passant par (a, f(a)) de pente f'(a) (T1)
- **Variables didactiques** : type de fonction, valeur de a (entier, fraction), f'(a)=0 (tangente horizontale)
- **Exemples canoniques** : f(x)=2x^3-4x+3 en a=1, f(x)=(x-1)/(x+1) en a=-2
- **Difficulte** : 1

### Prax4a — Tangente parallele a une droite

- **Notions mobilisees** : N1.4, N4
- **Type de tache (T)** : Determiner le(s) point(s) de la courbe ou la tangente est parallele a une droite donnee D
- **Technique (tau)** : Identifier le coefficient directeur m de D, resoudre f'(a) = m
- **Technologie (theta)** : Deux droites sont paralleles ssi elles ont le meme coefficient directeur
- **Variables didactiques** : D horizontale (m=0), D oblique, nombre de solutions, type de fonction
- **Exemples canoniques** : f(x)=x^3-x, tangente parallele a y=x => f'(a)=1 => 3a^2-1=1
- **Difficulte** : 2

### Prax4b — Tangente perpendiculaire a une droite

- **Notions mobilisees** : N1.4, N4
- **Type de tache (T)** : Determiner le(s) point(s) de la courbe ou la tangente est perpendiculaire a une droite donnee D
- **Technique (tau)** : Identifier le coefficient directeur m de D, resoudre f'(a) . m = -1
- **Technologie (theta)** : Deux droites sont perpendiculaires ssi le produit de leurs coefficients directeurs vaut -1
- **Variables didactiques** : equation de D sous forme ax+by+c=0 (extraire m), type de fonction
- **Exemples canoniques** : f(x)=2x^2+x+1, tangente perpendiculaire a x-7y+7=0
- **Difficulte** : 2

### Prax5a — Approximation affine directe

- **Notions mobilisees** : N2.1, N2.3
- **Type de tache (T)** : Determiner une approximation affine de f(a+h) pour h voisin de 0
- **Technique (tau)** : Identifier f et a, calculer f(a) et f'(a), appliquer f(a+h) ≈ f(a) + h.f'(a)
- **Technologie (theta)** : L'approximation affine remplace la courbe par sa tangente au voisinage de a (T2)
- **Variables didactiques** : choix de f et a (sqrt, inverse, puissance), valeur de h
- **Exemples canoniques** : sqrt(1+h) ≈ 1+h/2, (1+h)^n ≈ 1+nh, 1/(1+h) ≈ 1-h
- **Difficulte** : 1

### Prax5b — Estimation numerique par approximation affine

- **Notions mobilisees** : N2.1, N2.3
- **Type de tache (T)** : Calculer une valeur approchee d'un nombre (sqrt(27), (3,01)^2, 1/1,002...) en utilisant l'approximation affine
- **Technique (tau)** : Identifier f et a tels que le nombre = f(a+h) avec h petit, appliquer f(a+h) ≈ f(a) + h.f'(a)
- **Technologie (theta)** : L'approximation est d'autant meilleure que h est petit
- **Variables didactiques** : choix du point de reference a, type de nombre (racine, puissance, inverse), precision demandee
- **Exemples canoniques** : sqrt(1,001) ≈ 1 + 0,001/2 = 1,0005 ; (3,01)^2 ≈ 9 + 2×3×0,01 = 9,06
- **Difficulte** : 1

### Prax6a — Justifier la continuite via la derivabilite

- **Notions mobilisees** : N2.2
- **Type de tache (T)** : Montrer que f est continue en a en utilisant le fait que f est derivable en a
- **Technique (tau)** : Montrer que f est derivable en a (par definition ou formule), puis conclure par T3
- **Technologie (theta)** : Derivable en a => continu en a (T3)
- **Variables didactiques** : type de fonction
- **Exemples canoniques** : f derivable en a par calcul du taux de variation => f continue en a
- **Difficulte** : 0

### Prax6b — Continu mais non derivable (contre-exemple)

- **Notions mobilisees** : N2.2, N5.4, N6
- **Type de tache (T)** : Donner un contre-exemple de la reciproque de T3 (fonction continue mais non derivable)
- **Technique (tau)** : Exhiber une fonction (|x|, sqrt(x)) continue en un point mais avec un point anguleux ou une tangente verticale
- **Technologie (theta)** : La reciproque de T3 est fausse
- **Variables didactiques** : type de non-derivabilite (point anguleux vs tangente verticale)
- **Exemples canoniques** : f(x)=|x| en 0 (continu, f'_d=1≠f'_g=-1), f(x)=sqrt(x) en 0 (continu, limite infinie)
- **Difficulte** : 1

### Prax7 — Derivabilite a droite et a gauche

- **Notions mobilisees** : N5.1, N5.2, N5.3, N5.4
- **Type de tache (T)** : Calculer f'_d(a) et f'_g(a), conclure sur la derivabilite en a, ecrire les equations des demi-tangentes
- **Technique (tau)** : Calculer les limites laterales du taux de variation, comparer f'_d(a) et f'_g(a), si differentes => point anguleux, ecrire les demi-tangentes
- **Technologie (theta)** : f derivable en a <=> f'_d(a) = f'_g(a) (T7)
- **Variables didactiques** : valeur absolue, fonction definie par morceaux, nature du point (anguleux, tangente verticale unilaterale)
- **Exemples canoniques** : f(x)=|x| en 0, f(x)=x^2+2|x| en 0, f(x)=|x^2-4| en ±2
- **Difficulte** : 2

### Prax8 — Derivabilite d'une fonction par morceaux

- **Notions mobilisees** : N5, N7
- **Type de tache (T)** : Etudier la derivabilite d'une fonction definie par morceaux en un point de raccordement
- **Technique (tau)** : Verifier la continuite en a, puis calculer f'_d(a) et f'_g(a) separement sur chaque morceau, comparer
- **Technologie (theta)** : Il faut d'abord verifier la continuite (prerequis a la derivabilite), puis appliquer T7
- **Variables didactiques** : nombre de morceaux (2 ou 3), type de fonctions sur chaque morceau, cas ou la limite est infinie (demi-tangente verticale)
- **Exemples canoniques** : f(x)={x^2+x-6 si x≤2, sqrt(x^2-4)+x-2 si x>2} en x=2
- **Difficulte** : 2

### Prax9 — Calcul de limite par nombre derive

- **Notions mobilisees** : N1.1, N8.1
- **Type de tache (T)** : Calculer une limite de la forme lim_{x->a} (g(x)-g(a))/(x-a) en reconnaissant g'(a)
- **Technique (tau)** : Identifier une fonction g et un point a tels que l'expression est le taux de variation de g, conclure que la limite vaut g'(a)
- **Technologie (theta)** : Par definition, si g est derivable en a, lim_{x->a} (g(x)-g(a))/(x-a) = g'(a)
- **Variables didactiques** : forme de l'expression (fraction, racine), choix de g et a non evident
- **Exemples canoniques** : lim_{x->1} (x^3-1)/(x-1) = 3 (car g(x)=x^3, g'(1)=3), lim_{x->0} (sqrt(1+x)-1)/x = 1/2
- **Difficulte** : 2

### Prax10 — Determiner des coefficients (probleme inverse)

- **Notions mobilisees** : N1.4, N3, N4
- **Type de tache (T)** : Determiner des reels a, b, c pour qu'une courbe passe par des points donnes avec des tangentes de pentes donnees
- **Technique (tau)** : Traduire les conditions en systeme d'equations (f(x_i) = y_i et f'(x_j) = m_j), resoudre le systeme
- **Technologie (theta)** : La tangente en un point a pour pente f'(a), et passe par (a, f(a))
- **Variables didactiques** : nombre de conditions (2 ou 3), type de fonction (polynome de degre 2 ou 3), nature des conditions (passage par un point, pente de tangente, tangente parallele/perpendiculaire)
- **Exemples canoniques** : f(x)=ax^2+bx+c avec C passant par A(1,4), B(-1,6) et tangente en A de pente 3
- **Difficulte** : 2

### Prax11 — Tangente commune a deux courbes

- **Notions mobilisees** : N1.4, N4
- **Type de tache (T)** : Montrer que deux courbes admettent une tangente commune en un point
- **Technique (tau)** : Trouver le(s) point(s) d'intersection f(a)=g(a), puis verifier que f'(a)=g'(a) au point commun
- **Technologie (theta)** : Tangente commune <=> meme point, meme pente => meme equation de tangente
- **Variables didactiques** : type de courbes (paraboles, hyperboles), unicite du point de tangence
- **Exemples canoniques** : f(x)=x^2+2x-1, g(x)=-x^2-6x-9 => tangente commune en A(-2,-1)
- **Difficulte** : 2

### Prax12 — Tangentes perpendiculaires entre deux courbes

- **Notions mobilisees** : N1.4, N4
- **Type de tache (T)** : Montrer que les tangentes a deux courbes en un point commun sont perpendiculaires
- **Technique (tau)** : Aux points communs, calculer f'(a) et g'(a), verifier que f'(a).g'(a) = -1
- **Technologie (theta)** : Deux droites sont perpendiculaires ssi le produit de leurs coefficients directeurs vaut -1
- **Variables didactiques** : les deux courbes sont-elles donnees, ou faut-il d'abord trouver les points communs
- **Exemples canoniques** : P: y=x^2 et P': y=-x^2/3+1, tangentes perpendiculaires aux points d'intersection
- **Difficulte** : 2

### Prax13 — Lecture graphique du nombre derive

- **Notions mobilisees** : N1.3
- **Type de tache (T)** : Determiner graphiquement f(a), f'(a) et l'equation de la tangente a partir d'une courbe tracee
- **Technique (tau)** : Lire f(a) sur la courbe, tracer la tangente et mesurer sa pente (coefficient directeur), ecrire l'equation
- **Technologie (theta)** : f'(a) est le coefficient directeur de la tangente en a (T1)
- **Variables didactiques** : precision de la lecture graphique, tangente horizontale (f'(a)=0), tangente avec pente entiere ou fractionnaire
- **Exemples canoniques** : Lire f(-1), f'(-1), f(1), f'(1) sur un graphe donne
- **Difficulte** : 1
