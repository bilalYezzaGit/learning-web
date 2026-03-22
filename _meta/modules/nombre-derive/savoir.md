# Savoir — Nombre derive

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
