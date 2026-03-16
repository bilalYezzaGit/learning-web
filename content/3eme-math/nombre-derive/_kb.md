# KB Module — Nombre derive

id: module_nombre_derive
niveau: 3eme-math
version: 0.1

## 0) Objectif du module (1 phrase)

> Introduire le nombre derive comme limite du taux de variation, maitriser son calcul pour les fonctions usuelles et les operations, et l'exploiter pour determiner l'equation de la tangente et l'approximation affine.

## 1) Scope du module

### Inclus
- Definition du nombre derive f'(a) comme limite du taux de variation (deux ecritures : h->0 et x->a)
- Interpretation cinematique : vitesse instantanee comme nombre derive de la position
- Interpretation geometrique : tangente a une courbe, pente, vecteur directeur
- Equation de la tangente : y = f'(a)(x - a) + f(a)
- Approximation affine : f(a+h) ≈ f(a) + h.f'(a) pour h voisin de 0
- Theoreme "derivable => continu" (et non-reciproque)
- Nombre derive des fonctions usuelles (constante, affine, (x-alpha)^2+beta, x^n, 1/(alpha.x+beta), sqrt(x+alpha), (alpha.x+beta)/(lambda.x+gamma))
- Operations sur les nombres derives en un point : (f+g)'(a), (f.g)'(a), (alpha.f+beta.g)'(a), (f^k)'(a), (1/f)'(a), (f/g)'(a), (sqrt(f))'(a)
- Nombre derive d'un polynome en un point
- Derivabilite a droite et a gauche : f'_d(a) et f'_g(a)
- Theoreme : f derivable en a <=> f'_d(a) = f'_g(a)
- Demi-tangentes (non verticales) : equations, vecteurs directeurs
- Point anguleux : f'_d(a) ≠ f'_g(a) avec les deux limites finies
- Demi-tangente verticale : limite infinie du taux de variation
- Derivabilite sur un intervalle (ouvert, semi-ouvert, ferme)
- Calcul de limites par reconnaissance d'un nombre derive

### Exclus
- Fonction derivee (derivee sur tout un intervalle, etude de signe de f') — module 06 (fonction-derivee)
- Etude de variations, extrema, tableaux de variation — module 06
- Derivees successives (f'', f''') — module 06
- Derivee de la composee f(ax+b) — module 06
- Fonctions trigonometriques — hors programme 3eme
- Theoreme des accroissements finis — hors programme

## 2) Transposition didactique

### Savoir savant
- Differentiation au sens de Leibniz-Newton : nombre derive comme taux de variation infinitesimal
- Definition rigoureuse (Weierstrass) : limite du taux de variation
- Lien derivabilite-continuite : derivabilite => continuite (implication stricte)
- Existence de fonctions continues non derivables (fonction de Weierstrass — evoquee en culture mathematique)

### Savoir a enseigner (programme tunisien)
- Le nombre derive est introduit par deux motivations paralleles : la vitesse instantanee (physique) et la pente de la tangente (geometrie)
- Les deux ecritures de la definition sont traitees simultanement : lim_{x->a} (f(x)-f(a))/(x-a) et lim_{h->0} (f(a+h)-f(a))/h
- Le theoreme "derivable => continu" est demontre (via l'approximation affine)
- La reciproque "continu => derivable" est refutee par des contre-exemples (|x|, sqrt(x) en 0)
- Les nombres derives des fonctions usuelles sont etablis par le calcul direct de la limite du taux de variation
- L'approximation affine est presentee comme application pratique (estimation numerique)

### Adaptations didactiques
- Approche progressive : activites → definition → proprietes → exercices
- La vitesse instantanee sert de motivation concrete avant la formalisation
- Les fonctions usuelles sont derivees une par une par calcul direct (pas de formules admises)
- L'approximation affine est illustree par des estimations numeriques comparees a la calculatrice
- La non-derivabilite est illustree graphiquement (point anguleux, tangente verticale)
- La methode de Newton est presentee comme application avancee de la tangente

## 3) Prerequisites & liens inter-modules

### Prerequisites
- Module "generalites-fonctions" (04) — ensemble de definition, courbe representative, repere
- Module "continuite" (03) — continuite en un point, TVI (utilise pour la methode de Newton)
- Acquis anterieurs : limites de fonctions (lim_{x->a}), operations sur les limites, coefficient directeur d'une droite, equation de droite, formes indeterminees

### Ouvre vers
- Module "fonction-derivee" (06) — derivee comme fonction, formules de derivation, etude de variations
- Module "fonction-derivee-usuelle" (07) — derivees des fonctions usuelles sur des intervalles
- La tangente est un outil fondamental pour les etudes de fonctions ulterieures

## 4) Carte des notions (plan)

- N1: Nombre derive en un point
    - N1.1: Definition (deux ecritures equivalentes)
    - N1.2: Interpretation cinematique (vitesse instantanee)
    - N1.3: Interpretation geometrique (tangente, pente, vecteur directeur)
    - N1.4: Equation de la tangente
- N2: Approximation affine
    - N2.1: Definition et formule : f(a+h) ≈ f(a) + h.f'(a)
    - N2.2: Theoreme "derivable => continu" (consequence)
    - N2.3: Applications numeriques (estimations)
- N3: Nombres derives des fonctions usuelles
    - N3.1: Constante, affine, (x-alpha)^2+beta
    - N3.2: x^n (entier naturel)
    - N3.3: 1/(alpha.x+beta)
    - N3.4: sqrt(x+alpha)
    - N3.5: (alpha.x+beta)/(lambda.x+gamma) — formule du quotient de deux affines
- N4: Operations algebriques
    - N4.1: Somme, combinaison lineaire
    - N4.2: Produit
    - N4.3: Puissance f^k
    - N4.4: Inverse 1/f, quotient f/g
    - N4.5: Racine sqrt(f)
    - N4.6: Polynome (formule explicite)
- N5: Derivabilite a droite et a gauche
    - N5.1: Definitions de f'_d(a) et f'_g(a)
    - N5.2: Theoreme d'equivalence : derivable <=> f'_d = f'_g
    - N5.3: Demi-tangentes non verticales
    - N5.4: Point anguleux
- N6: Tangente verticale et demi-tangente verticale
    - N6.1: Limite infinie du taux de variation
    - N6.2: Demi-tangente verticale (a droite ou a gauche)
- N7: Derivabilite sur un intervalle
    - N7.1: Definitions (intervalle ouvert, ferme, semi-ouvert)
    - N7.2: Exemples de verification
- N8: Applications
    - N8.1: Calcul de limites par reconnaissance d'un nombre derive
    - N8.2: Methode de Newton (approximation d'une racine)
    - N8.3: Tangente commune a deux courbes
    - N8.4: Tangentes paralleles / perpendiculaires a une droite donnee

## 5) Theoremes & proprietes cles

| ID | Enonce | Statut | Utilise dans |
|----|--------|--------|--------------|
| D1 | Soit f definie sur un intervalle ouvert I et a un reel de I. f est derivable en a s'il existe un reel l tel que lim_{x->a} (f(x)-f(a))/(x-a) = l. Le reel l est note f'(a). | definition | Prax1, Prax2, Prax3 |
| D1' | Ecriture equivalente : f'(a) = lim_{h->0} (f(a+h)-f(a))/h | definition | Prax1 |
| T1 | Si f est derivable en a, alors la courbe de f admet en M(a,f(a)) une tangente d'equation y = f'(a)(x-a) + f(a) | theoreme | Prax3, Prax4 |
| T2 | Si f est derivable en a, alors f(a+h) ≈ f(a) + h.f'(a) pour h voisin de 0 (approximation affine) | theoreme | Prax5 |
| T3 | Si f est derivable en a, alors f est continue en a | demontre | Prax6a |
| T3' | La reciproque de T3 est fausse : f continue en a n'implique pas f derivable en a | propriete | Prax6b |
| T4 | Nombres derives des fonctions usuelles (table : constante, affine, (x-alpha)^2+beta, x^n, 1/(alpha.x+beta), sqrt(x+alpha)) | demontre | Prax2 |
| T5 | f+g, f.g, alpha.f+beta.g, f^k, 1/f, f/g derivables en a si f et g le sont (et conditions) | admis | Prax2, Prax4 |
| T6 | Si f derivable en a et f(a) > 0, alors (sqrt(f))'(a) = f'(a) / (2.sqrt(f(a))) | admis | Prax2 |
| D2 | f'_g(a) = lim_{h->0^-} (f(a+h)-f(a))/h ; f'_d(a) = lim_{h->0^+} (f(a+h)-f(a))/h | definition | Prax7 |
| T7 | f derivable en a <=> f derivable a droite et a gauche en a et f'_d(a) = f'_g(a) | demontre | Prax7 |

> **Notations tunisiennes** : la courbe representative est notee C_f, zeta_f ou C selon la source.
> Les vecteurs sont notes avec la fleche : vec(i), vec(j), vec(u).
> Le repere est toujours (O, vec(i), vec(j)).

## 6) Knowledge Components

### Facts (a memoriser)
- F1: f'(a) = lim_{x->a} (f(x)-f(a))/(x-a) = lim_{h->0} (f(a+h)-f(a))/h
- F2: Equation de la tangente : y = f'(a)(x-a) + f(a)
- F3: Approximation affine : f(a+h) ≈ f(a) + h.f'(a)
- F4: Table des nombres derives des fonctions usuelles (constante, affine, carre, x^n, inverse, racine, quotient de deux affines)
- F5: (f+g)'(a) = f'(a) + g'(a)
- F6: (f.g)'(a) = f'(a).g(a) + f(a).g'(a)
- F7: (f/g)'(a) = (f'(a).g(a) - f(a).g'(a)) / (g(a))^2
- F8: (f^k)'(a) = k.f^(k-1)(a).f'(a)
- F9: (sqrt(f))'(a) = f'(a) / (2.sqrt(f(a)))
- F10: Derivable en a => continu en a (reciproque fausse)
- F11: Derivable en a <=> f'_d(a) = f'_g(a)

### Skills (procedures a maitriser)
- S1: Calculer f'(a) par la definition (limite du taux de variation) — notion: N1.1 — difficulte: 1 — entraine via: Prax1
- S2: Calculer f'(a) en utilisant les formules usuelles et les operations — notion: N3, N4 — difficulte: 1 — entraine via: Prax2
- S3: Ecrire l'equation de la tangente a une courbe en un point — notion: N1.4 — difficulte: 1 — entraine via: Prax3
- S4: Determiner un point ou la tangente est parallele/perpendiculaire a une droite donnee — notion: N1.4, N4 — difficulte: 2 — entraine via: Prax4
- S5: Calculer une approximation affine — notion: N2 — difficulte: 1 — entraine via: Prax5
- S6: Etudier la derivabilite a droite et a gauche en un point — notion: N5 — difficulte: 2 — entraine via: Prax7
- S7: Ecrire les equations des demi-tangentes — notion: N5.3 — difficulte: 2 — entraine via: Prax7
- S8: Etudier la derivabilite d'une fonction definie par morceaux — notion: N5, N7 — difficulte: 2 — entraine via: Prax8
- S9: Calculer une limite par reconnaissance d'un nombre derive — notion: N8.1 — difficulte: 2 — entraine via: Prax9
- S10: Determiner des coefficients a, b, c pour qu'une courbe passe par un point avec une tangente donnee — notion: N1.4, N3 — difficulte: 2 — entraine via: Prax10

### Principles (comprendre en profondeur)
- P1: Le nombre derive mesure la pente de la tangente — le taux de variation "se fige" a la limite
- P2: La derivabilite est plus forte que la continuite — un point anguleux est continu mais non derivable
- P3: L'approximation affine consiste a remplacer localement la courbe par sa tangente
- P4: La non-derivabilite se manifeste geometriquement par un point anguleux ou une tangente verticale

## 7) Exemples canoniques

- EC1: f(x) = x^2, calculer f'(1) par la definition — illustre la definition avec un polynome simple
- EC2: f(x) = sqrt(x), calculer f'(a) par la definition (conjugue) — illustre la technique de rationalisation
- EC3: f(x) = 1/(x+1), calculer f'(a) par la definition — illustre la technique de mise au meme denominateur
- EC4: Tangente a y = x^2 au point d'abscisse 1 — illustre l'equation de la tangente
- EC5: Approximation affine de sqrt(1+h) ≈ 1 + h/2 — illustre l'estimation numerique
- EC6: f(x) = |x|, etude de la derivabilite en 0 — illustre le point anguleux (f'_d(0) = 1, f'_g(0) = -1)
- EC7: f(x) = sqrt(x), etude en 0 — illustre la demi-tangente verticale
- EC8: lim_{x->1} (x^3-1)/(x-1) reconnu comme f'(1) avec f(x) = x^3 — illustre le calcul de limite

## 8) Praxeologies — patterns d'exercices

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

## 9) Misconceptions & erreurs frequentes

### E1 — Confondre continuite et derivabilite

- **Description** : L'eleve pense que si f est continue en a, alors f est derivable en a
- **Frequence** : tres frequente
- **Source cognitive** : generalisation abusive du theoreme T3 (derivable => continu), difficulte a distinguer les deux concepts
- **Question diagnostique** :
    > Parmi les affirmations suivantes, lesquelles sont vraies ?
    > (I) Si f est continue en a alors f est derivable en a
    > (II) Si f est derivable en a alors f est continue en a
    > (III) Si f n'est pas continue en a alors f n'est pas derivable en a
    - A) Aucune n'est vraie — revele : incomprehension totale du lien
    - B) Une seule est vraie — revele : confusion sur la direction de l'implication
    - C) Deux sont vraies (II et III) — correct
    - D) Les trois sont vraies — revele : croyance que continuite <=> derivabilite
- **Remediation** : contre-exemples visuels (f(x)=|x| en 0, f(x)=x^{1/3} en 0)

### E2 — Oublier de verifier la continuite avant la derivabilite

- **Description** : L'eleve etudie directement la derivabilite d'une fonction par morceaux sans verifier d'abord la continuite
- **Frequence** : frequente
- **Source cognitive** : la derivabilite est perçue comme independante de la continuite
- **Question diagnostique** :
    > Soit f(x) = {x^2 si x ≤ 1, x+1 si x > 1}. f est-elle derivable en 1 ?
    - A) Oui car f'_g(1) = 2 et f'_d(1) = 1, et les deux existent — revele : ne verifie pas la continuite
    - B) Non car f'_g(1) ≠ f'_d(1) — revele : bonne conclusion mais mauvaise raison (f n'est meme pas continue)
    - C) Non car f n'est pas continue en 1 (f(1)=1 mais lim_{x->1+} f(x)=2) — correct
    - D) Oui car les deux limites laterales existent — revele : confusion entre existence et egalite
- **Remediation** : Insister sur le schema : continuite d'abord, puis derivabilite

### E3 — Erreur de signe dans le taux de variation

- **Description** : L'eleve ecrit (f(a)-f(a+h))/h au lieu de (f(a+h)-f(a))/h, ou oublie le signe moins dans la derivee de 1/f
- **Frequence** : frequente
- **Source cognitive** : inversion mecanique dans la fraction
- **Question diagnostique** :
    > Si f(x) = 1/(x+1), que vaut f'(a) ?
    - A) 1/(a+1)^2 — revele : oubli du signe moins
    - B) -1/(a+1)^2 — correct
    - C) -1/(a+1) — revele : oubli du carre au denominateur
    - D) 1/(a+1) — revele : confusion avec la derivee de x
- **Remediation** : refaire le calcul par la definition pour verifier le signe

### E4 — Confondre f'(a) = 0 et "non derivable"

- **Description** : L'eleve pense que si la tangente est horizontale, la fonction n'est pas derivable en a
- **Frequence** : occasionnelle
- **Source cognitive** : confusion entre "pas de pente" (pente nulle) et "pas de tangente"
- **Question diagnostique** :
    > Si f'(a) = 0, que peut-on dire ?
    - A) f n'est pas derivable en a — revele : confusion f'(a)=0 et non-derivabilite
    - B) La tangente en a est verticale — revele : confusion horizontale/verticale
    - C) La tangente en a est horizontale, parallele a l'axe des abscisses — correct
    - D) f est constante au voisinage de a — revele : confusion locale/globale
- **Remediation** : Distinguer clairement f'(a)=0 (tangente horizontale) de f non derivable (pas de tangente)

### E5 — Oublier la condition f(a) > 0 pour (sqrt(f))'(a)

- **Description** : L'eleve applique la formule (sqrt(f))'(a) = f'(a)/(2.sqrt(f(a))) sans verifier que f(a) > 0
- **Frequence** : frequente
- **Source cognitive** : application mecanique de la formule
- **Question diagnostique** :
    > Soit f(x) = sqrt(x^2-4). Peut-on calculer f'(2) avec la formule (sqrt(u))'(a) = u'(a)/(2.sqrt(u(a))) ?
    - A) Oui, f'(2) = 4/(2.sqrt(0)) = +∞ — revele : division par zero ignoree
    - B) Oui, f'(2) = 4/0 = impossible, mais f est quand meme derivable — revele : confusion
    - C) Non, car u(2) = 0, la condition u(a) > 0 n'est pas verifiee — correct
    - D) Non, car f n'est pas definie en 2 — revele : confusion (f(2)=0 est defini)
- **Remediation** : Toujours verifier f(a) > 0 STRICTEMENT avant d'appliquer la formule

### E6 — Confondre derivabilite a droite et a gauche

- **Description** : L'eleve se trompe dans le sens des limites laterales (0+ pour gauche, 0- pour droite)
- **Frequence** : frequente
- **Source cognitive** : confusion entre le sens de la limite (h->0+ ou h->0-) et le cote (droite/gauche)
- **Question diagnostique** :
    > f'_d(a) est defini comme :
    - A) lim_{h->0^-} (f(a+h)-f(a))/h — revele : inversion gauche/droite
    - B) lim_{h->0^+} (f(a+h)-f(a))/h — correct
    - C) lim_{x->a^-} (f(x)-f(a))/(x-a) — revele : inversion gauche/droite
    - D) lim_{h->0} (f(a+h)-f(a))/h — revele : confusion avec la derivabilite en a
- **Remediation** : h->0+ signifie h>0 donc x=a+h>a, on approche par la droite

### E7 — Erreur dans le produit de derivees

- **Description** : L'eleve ecrit (f.g)'(a) = f'(a).g'(a) au lieu de f'(a).g(a) + f(a).g'(a)
- **Frequence** : tres frequente
- **Source cognitive** : analogie avec (f+g)' = f'+g' generalisee a tort au produit
- **Question diagnostique** :
    > Soit f(x) = x^2 et g(x) = x+1. Que vaut (f.g)'(1) ?
    - A) f'(1).g'(1) = 2×1 = 2 — revele : derivee du produit = produit des derivees
    - B) f'(1).g(1) + f(1).g'(1) = 2×2 + 1×1 = 5 — correct
    - C) f(1).g'(1) = 1×1 = 1 — revele : oubli du premier terme
    - D) f'(1).g(1) = 2×2 = 4 — revele : oubli du second terme
- **Remediation** : insister sur la formule du produit avec un moyen mnemotechnique (u'v + uv')

## 10) Regles redactionnelles

- **Notations** : f'(a) pour le nombre derive, f'_d(a) et f'_g(a) pour les derivees laterales, vec(u) vec(1, f'(a)) pour le vecteur directeur de la tangente
- **Virgule decimale** : 0,1 et non 0.1 (convention francaise tunisienne)
- **Ouverture standard** : "Soit f une fonction definie sur un intervalle ouvert I et a un reel de I"
- **Conclusion de derivabilite** : "D'ou f est derivable en a et f'(a) = ..." ou "Donc f n'est pas derivable en a"
- **Conclusion de non-derivabilite** : distinguer le type — "f admet un point anguleux en a" ou "la courbe admet une demi-tangente verticale en a"
- **Approximation affine** : ecrire f(a+h) ≈ f(a) + h.f'(a) "pour h voisin de zero"
- **Justification de la tangente** : toujours preciser f(a) ET f'(a) avant d'ecrire l'equation
- **Rigueur** : pour les fonctions par morceaux, toujours verifier la continuite AVANT la derivabilite
- **Formules de redaction** : "D'ou...", "Par suite...", "On en deduit que...", "Il en resulte que..."
- **Longueur type** : un calcul de nombre derive par la definition = 4-6 lignes ; equation de tangente = 3 lignes
