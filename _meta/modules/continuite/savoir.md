# Savoir — Continuite

id: module_continuite
niveau: 3eme-math
version: 0.1

## 0) Objectif du module (1 phrase)

> Maitriser la notion de continuite d'une fonction en un point et sur un intervalle, exploiter les operations sur les fonctions continues, et appliquer le theoreme des valeurs intermediaires pour prouver l'existence et l'unicite de solutions d'equations.

## 1) Scope du module

### Inclus
- Definition de la continuite en un point (formulation alpha-beta, convention tunisienne)
- Interpretation graphique de la continuite (trace sans lever le crayon)
- Continuite des fonctions usuelles (constante, identite, lineaire, affine, x^2, 1/x, sqrt(x), polynome, rationnelle)
- Operations sur les fonctions continues (somme, produit, scalaire, inverse, quotient, |f|, sqrt(f))
- Continuite a droite et a gauche en un point
- Theoreme : f continue en a <=> f continue a droite et a gauche en a
- Continuite sur un intervalle (ouvert, ferme, semi-ouvert)
- Image d'un intervalle par une fonction continue (l'image d'un intervalle est un intervalle)
- Theoreme des valeurs intermediaires (TVI)
- Cas particulier du TVI : existence d'un zero (f(a).f(b) < 0)
- Unicite de la solution par monotonie stricte
- Approximation d'une solution par dichotomie (a 10^-1, 10^-2, etc.)
- Etude de la continuite de fonctions definies par morceaux
- Nombre de solutions d'une equation (via tableau de variation + TVI)

### Exclus
- Continuite uniforme — hors programme
- Theoreme de Heine (continuite uniforme sur un compact) — hors programme
- Theoreme de Bolzano-Weierstrass — hors programme
- Continuite et derivabilite (module 05 — nombre-derive)
- Fonctions trigonometriques — hors programme 3eme
- Theoreme des bornes atteintes (f continue sur [a,b] admet un max et un min) — mentionne mais pas approfondi

## 2) Transposition didactique

### Savoir savant
- Definition topologique de la continuite (epsilon-delta, Weierstrass)
- Theoreme des valeurs intermediaires (Bolzano, 1817)
- Theoreme de l'image continue d'un connexe (l'image d'un intervalle par une fonction continue est un intervalle)
- Proprietes des fonctions continues sur les compacts (bornes atteintes, continuite uniforme)

### Savoir a enseigner (programme tunisien)
- La definition utilise alpha et beta (au lieu de epsilon et delta) — convention specifique au programme tunisien
- Le TVI est le theoreme central du module : existence d'au moins une solution
- L'unicite est obtenue en ajoutant la monotonie stricte (theoreme separe)
- L'image d'un intervalle par une fonction continue est admise comme theoreme
- La dichotomie est presentee comme methode pratique d'approximation

### Adaptations didactiques
- Introduction graphique : "la courbe peut etre tracee sans lever le crayon" avant la formalisation
- La definition alpha-beta est motivee par des activites graphiques (rectangles de tolerance)
- La partie entiere E(x) sert de contre-exemple fondamental (discontinue en tout entier)
- Le TVI est illustre par des applications concretes avant l'enonce formel
- La dichotomie est illustree par le calcul effectif (tableaux de valeurs)

## 3) Prerequisites & liens inter-modules

### Prerequisites
- Module "generalites-fonctions" (01) — ensemble de definition, image, domaine, representation graphique
- Acquis anterieurs : inegalites, valeur absolue, intervalles, notion de fonction, polynomes, fonctions rationnelles, racine carree

### Ouvre vers
- Module "nombre-derive" (05) — le theoreme "derivable => continu" utilise la continuite
- Module "fonction-derivee" (06) — etude de variations qui utilise la continuite sur un intervalle
- Module "limites-comportements-asymptotiques" — le lien entre limites et continuite (f continue en a <=> lim_{x->a} f(x) = f(a))

## 4) Carte des notions (plan)

- N1: Continuite en un point
    - N1.1: Definition alpha-beta (convention tunisienne)
    - N1.2: Interpretation graphique (trace sans lever le crayon)
    - N1.3: Discontinuite en un point (saut, point isole)
- N2: Continuite des fonctions usuelles
    - N2.1: Constante, identite, lineaire, affine
    - N2.2: x^2, polynomes
    - N2.3: 1/x, fonctions rationnelles
    - N2.4: sqrt(x), sqrt(f(x))
- N3: Operations sur les fonctions continues
    - N3.1: Somme, produit, combinaison lineaire
    - N3.2: Inverse 1/f (condition f(a) != 0)
    - N3.3: Quotient f/g (condition g(a) != 0)
    - N3.4: Valeur absolue |f|
    - N3.5: Racine carree sqrt(f) (condition f(a) > 0)
- N4: Continuite laterale
    - N4.1: Continuite a droite en a
    - N4.2: Continuite a gauche en a
    - N4.3: Theoreme : f continue en a <=> f continue a droite et a gauche en a
- N5: Continuite sur un intervalle
    - N5.1: Definitions (intervalle ouvert, ferme, semi-ouvert)
    - N5.2: Consequence : continuite sur tout sous-intervalle
- N6: Image d'un intervalle
    - N6.1: Theoreme : l'image d'un intervalle par une fonction continue est un intervalle
    - N6.2: Determination de f(I) par le tableau de variation
- N7: Theoreme des valeurs intermediaires (TVI)
    - N7.1: Enonce general (existence d'au moins une solution)
    - N7.2: Cas particulier : localisation d'un zero (f(a).f(b) < 0)
    - N7.3: Unicite par monotonie stricte
- N8: Applications
    - N8.1: Approximation par dichotomie
    - N8.2: Nombre de solutions d'une equation
    - N8.3: Intersection de courbes (f(x) = g(x) via h(x) = f(x) - g(x))

## 5) Theoremes & proprietes cles

| ID | Enonce | Statut | Utilise dans |
|----|--------|--------|--------------|
| D1 | Soit f definie sur un intervalle ouvert I et a un reel de I. f est continue en a si pour tout beta > 0, il existe alpha > 0 tel que : si x dans I et \|x-a\| < alpha, alors \|f(x)-f(a)\| < beta | definition | Prax1, Prax10 |
| D2 | f est continue a droite en a si pour tout beta > 0, il existe alpha > 0 tel que 0 <= x-a < alpha implique \|f(x)-f(a)\| < beta | definition | Prax3 |
| D3 | f est continue a gauche en a si pour tout beta > 0, il existe alpha > 0 tel que 0 <= a-x < alpha implique \|f(x)-f(a)\| < beta | definition | Prax3 |
| T1 | Toute fonction constante, lineaire, affine, x^2 est continue en tout reel. Toute fonction polynome est continue sur R. Toute fonction rationnelle est continue sur son ensemble de definition. sqrt(x) est continue sur R+*. | admis | Prax1, Prax2 |
| T2 | Si f et g sont continues en a et k un reel, alors f+g, f.g, k.f sont continues en a | demontre | Prax2 |
| T3 | Si f est continue en a et f(a) != 0, alors 1/f est continue en a. Si g(a) != 0, alors f/g est continue en a | demontre | Prax2 |
| T4 | Si f est continue en a, alors \|f\| est continue en a | demontre | Prax2 |
| T5 | Si f est continue en a et f(a) > 0, alors sqrt(f) est continue en a | demontre | Prax2, Prax9 |
| T6 | f est continue en a <=> f est continue a droite et a gauche en a | demontre | Prax3 |
| T7 | L'image d'un intervalle par une fonction continue est un intervalle | admis | Prax6 |
| T8 | (TVI) Soit f continue sur [a,b]. Pour tout k entre f(a) et f(b), l'equation f(x) = k admet au moins une solution dans [a,b] | admis | Prax4, Prax5, Prax8 |
| T8' | Cas particulier : si f(a).f(b) < 0, il existe c dans ]a,b[ tel que f(c) = 0 | corollaire | Prax4 |
| T9 | Si de plus f est strictement monotone sur [a,b], la solution est unique | propriete | Prax5 |

> **Notations tunisiennes** : la definition utilise alpha et beta (pas epsilon et delta).
> Courbe representative notee C_f, zeta_f ou C selon la source.
> Partie entiere notee E(x) (pas la notation crochet).
> Intervalles en notation francaise : ]a, b[ pour ouvert.

## 6) Knowledge Components

### Facts (a memoriser)
- F1: Definition de la continuite en a (formulation alpha-beta)
- F2: Table des fonctions usuelles continues (constante, affine, polynome, rationnelle, sqrt)
- F3: Les operations preservent la continuite (somme, produit, quotient sous conditions)
- F4: f continue en a <=> f continue a droite et a gauche en a
- F5: L'image d'un intervalle par une fonction continue est un intervalle
- F6: TVI : existence d'au moins une solution si f(a).f(b) < 0
- F7: Unicite si f est strictement monotone sur l'intervalle
- F8: La partie entiere E(x) est discontinue en tout entier (contre-exemple fondamental)

### Skills (procedures a maitriser)
- S1: Justifier la continuite en un point par identification du type de fonction — notion: N2 — difficulte: 1 — entraine via: Prax1
- S2: Justifier la continuite par les operations (somme, produit, quotient, sqrt) — notion: N3 — difficulte: 1 — entraine via: Prax2
- S3: Etudier la continuite d'une fonction par morceaux — notion: N4 — difficulte: 2 — entraine via: Prax3
- S4: Appliquer le TVI pour prouver l'existence d'une solution — notion: N7 — difficulte: 1 — entraine via: Prax4
- S5: Prouver l'unicite d'une solution (TVI + monotonie) — notion: N7.3 — difficulte: 2 — entraine via: Prax5
- S6: Determiner l'image d'un intervalle par une fonction continue — notion: N6 — difficulte: 2 — entraine via: Prax6
- S7: Approximer une solution par dichotomie — notion: N8.1 — difficulte: 1 — entraine via: Prax7
- S8: Determiner le nombre de solutions via tableau de variation + TVI — notion: N8.2 — difficulte: 2 — entraine via: Prax8

### Principles (comprendre en profondeur)
- P1: La continuite est une propriete locale (en un point) qui se globalise (sur un intervalle)
- P2: Le TVI garantit l'EXISTENCE mais pas l'UNICITE — la monotonie est necessaire pour l'unicite
- P3: L'image d'un intervalle est un intervalle — c'est la propriete fondamentale qui sous-tend le TVI
- P4: La discontinuite se manifeste graphiquement par un saut ou une rupture dans la courbe

> **Echelle de difficulte** :
> 0 — decouverte guidee
> 1 — application directe
> 2 — combinaison de techniques
> 3 — probleme synthese

## 7) Exemples canoniques

- EC1: f(x) = 2x - 1, montrer la continuite en a = 2 par la definition alpha-beta — illustre la definition avec une fonction affine (alpha = beta/2)
- EC2: f(x) = sqrt(x-2)/(x^2+2x+5), justifier la continuite en 2 — illustre la composition d'operations (sqrt + polynome + quotient)
- EC3: f(x) = E(x) (partie entiere), etudier la continuite — illustre la discontinuite en tout entier (contre-exemple fondamental)
- EC4: f par morceaux {2x+1 si x>1, 3 si x=1, 3x-1 si x<1}, continuite en 1 — illustre la continuite laterale
- EC5: f(x) = x^3 + 3x/2 + 1, montrer que f(x) = 0 admet une solution dans [-2, 1] — illustre l'application du TVI (f(-2) < 0, f(1) > 0)
- EC6: f(x) = x^4 - 4x^2 - x + 1, montrer exactement 4 solutions — illustre le comptage de solutions par TVI + tableau de variation
- EC7: sqrt(x-2) = 8/x^2, existence d'une solution sur [3, +inf[ — illustre l'intersection de courbes (h(x) = f(x) - g(x))
- EC8: Approximation d'un zero a 10^-2 par dichotomie — illustre la methode pratique (tableau de valeurs successifs)
