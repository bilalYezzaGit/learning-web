# Savoir — Fonction derivee

id: module_fonction_derivee
niveau: 3eme-math
version: 0.1

## 0) Objectif du module (1 phrase)

> Maitriser la fonction derivee comme outil central pour etudier les variations d'une fonction (signe de f' => sens de variation), determiner les extrema locaux et globaux, et resoudre des problemes d'optimisation.

## 1) Scope du module

### Inclus
- Definition de la fonction derivee f' sur un intervalle I
- Derivees des fonctions usuelles (constante, identite, x^n, 1/x, 1/x^n, sqrt(x))
- Operations sur les fonctions derivees (somme, produit, quotient, puissance, composition)
- Derivee de sqrt(f) : (sqrt(f))' = f'/(2.sqrt(f))
- Derivee de x -> f(ax+b) : g'(x) = a.f'(ax+b)
- Derivees successives (f'', f''', ..., f^(n))
- Lien derivee-variations : f' >= 0 <=> f croissante (et reciproque)
- Lien derivee-parite : f paire => f' impaire, f impaire => f' paire
- Extrema locaux et globaux : definition, condition necessaire f'(a) = 0, condition suffisante (changement de signe)
- Tableau de variation (construction a partir de f')
- Problemes d'optimisation (modelisation + etude de variations)

### Exclus
- Nombre derive (definition, calcul en un point, tangente) — module 05 (nombre-derive)
- Derivabilite en un point (definition par la limite du taux de variation) — module 05
- Theoreme des accroissements finis — hors programme
- Fonctions trigonometriques et leurs derivees — module ulterieur
- Etude complete de fonctions (limites + asymptotes + derivee + courbe) — module 07

## 2) Transposition didactique

### Savoir savant
- Theorie de la differentiation (Leibniz, Newton)
- Theoreme de Fermat (extremum => derivee nulle)
- Theoreme de la bijection derivee-monotonie (consequence du theoreme des accroissements finis)
- Derivees successives et developpements de Taylor

### Savoir a enseigner (programme tunisien)
- La fonction derivee est introduite comme prolongement naturel du nombre derive (module 05)
- Le theoreme derivee-variations est ADMIS (la demonstration via le TAF est hors programme)
- Les derivees successives sont introduites mais limitees a des cas simples (polynomes, rationnelles)
- L'accent est mis sur les applications : sens de variation, extrema, problemes concrets

### Adaptations didactiques
- Approche motivante par la physique : vitesse instantanee comme derivee de la position
- Le theoreme f' >= 0 <=> f croissante est admis — l'eleve l'utilise comme boite a outils
- La condition necessaire d'extremum (f'(a) = 0) est demontree, la condition suffisante (changement de signe) est admise
- La reciproque "f'(a) = 0 n'implique pas extremum" est illustree par x^3 en 0 (point d'inflexion)
- Les problemes d'optimisation servent de motivation concrete : perimetre maximal, aire maximale, cout minimal

## 3) Prerequisites & liens inter-modules

### Prerequisites
- Module 01 (Generalites fonctions) — variations par la definition, bornes, extrema
- Module 05 (Nombre derive) — definition du nombre derive f'(a), tangente, derivees des fonctions de reference
- 2nde annee : fonctions polynomes, rationnelles, racine carree

### Ouvre vers
- Module 07 (Exemples d'etude de fonctions) — etude complete utilisant la derivee pour les variations
- 4eme annee : primitives et integration (operation inverse de la derivation)
- 4eme annee : equations differentielles (f' = g(f))

## 4) Carte des notions (plan)

- N1: Fonction derivee (definition)
    - N1.1: f' comme fonction qui a x associe f'(x) (nombre derive en x)
    - N1.2: Extension aux bornes : derivee a droite en a, a gauche en b
- N2: Derivees des fonctions usuelles
    - N2.1: Tableau recapitulatif (constante, x, ax+b, x^n, 1/x, 1/x^n, sqrt(x))
    - N2.2: Toute fonction polynome est derivable sur R
    - N2.3: Toute fonction rationnelle est derivable sur son ensemble de definition
- N3: Operations sur les fonctions derivees
    - N3.1: Somme et combinaison lineaire : (alpha.f + beta.g)' = alpha.f' + beta.g'
    - N3.2: Produit : (f.g)' = f'.g + f.g'
    - N3.3: Puissance : (f^k)' = k.f'.f^(k-1)
    - N3.4: Inverse : (1/f)' = -f'/f^2
    - N3.5: Quotient : (g/f)' = (g'.f - g.f')/f^2
    - N3.6: Inverse de puissance : (1/f^k)' = -k.f'/f^(k+1)
- N4: Derivee de sqrt(f)
    - N4.1: Condition : f derivable et strictement positive
    - N4.2: Formule : (sqrt(f))' = f'/(2.sqrt(f))
- N5: Derivee de x -> f(ax+b)
    - N5.1: Theoreme (admis) : g'(x) = a.f'(ax+b)
- N6: Derivees successives
    - N6.1: f'', f''', ..., f^(n)
    - N6.2: Polynomes et rationnelles derivables n fois
- N7: Sens de variation
    - N7.1: f' = 0 sur I <=> f constante sur I
    - N7.2: f' >= 0 sur I <=> f croissante sur I
    - N7.3: f' <= 0 sur I <=> f decroissante sur I
    - N7.4: f paire => f' impaire, f impaire => f' paire
- N8: Extrema
    - N8.1: Extremum local : definition (voisinage de x0)
    - N8.2: Extremum absolu : pour tout x dans D
    - N8.3: Condition necessaire : f admet un extremum en a => f'(a) = 0
    - N8.4: Condition suffisante : f' s'annule en a et change de signe => extremum local
    - N8.5: f' passe de + a - => maximum local ; f' passe de - a + => minimum local
- N9: Tableau de variation
    - N9.1: Construction : signe de f' -> fleches -> valeurs aux bornes et aux extrema
    - N9.2: Lecture : deduire extrema, encadrements, nombre de solutions

## 5) Theoremes & proprietes cles

| ID | Enonce | Statut | Utilise dans |
|----|--------|--------|--------------|
| D1 | f derivable sur I : f'(x) = lim_{h->0} (f(x+h)-f(x))/h | definition | Prax1 |
| D2 | Extremum local en a : il existe J ouvert, a dans J inclus dans I, tel que f(x) <= f(a) (max) ou f(x) >= f(a) (min) pour tout x dans J | definition | Prax5, Prax6 |
| D3 | Extremum absolu en a : f(x) <= f(a) (max) ou f(x) >= f(a) (min) pour tout x dans D | definition | Prax6 |
| T1 | (f+g)' = f'+g', (alpha.f+beta.g)' = alpha.f'+beta.g' | demontre | Prax1, Prax2 |
| T2 | (f.g)' = f'.g + f.g' | demontre | Prax1, Prax2 |
| T3 | (1/f)' = -f'/f^2, (g/f)' = (g'.f-g.f')/f^2 | demontre | Prax1, Prax2 |
| T4 | (f^k)' = k.f'.f^(k-1) | demontre | Prax2 |
| T5 | (sqrt(f))' = f'/(2.sqrt(f)), f > 0 | demontre | Prax2, Prax3 |
| T6 | g(x) = f(ax+b) => g'(x) = a.f'(ax+b) | admis | Prax2 |
| T7 | f' = 0 sur I <=> f constante sur I | admis | Prax4 |
| T8 | f' >= 0 sur I <=> f croissante sur I | admis | Prax4 |
| T9 | f' <= 0 sur I <=> f decroissante sur I | admis | Prax4 |
| T10 | f admet un extremum en a => f'(a) = 0 (condition necessaire) | demontre | Prax5 |
| T11 | f' s'annule en a et change de signe => f admet un extremum local en a | admis | Prax5, Prax6 |
| P1 | f paire et derivable => f' impaire | demontre | Prax4 |
| P2 | f impaire et derivable => f' paire | demontre | Prax4 |
| P3 | Toute fonction polynome est derivable sur R | consequence | Prax1 |
| P4 | Toute fonction rationnelle est derivable sur son ensemble de definition | consequence | Prax1 |

> **Notations tunisiennes** :
> - Derivee notee f'(x), derivees successives f'', f''', f^(n)
> - "Nombre derive" pour la valeur f'(a), "fonction derivee" pour la fonction f'
> - Courbe representative notee C_f ou zeta_f
> - Repere (O, vec(i), vec(j))

## 6) Knowledge Components

### Facts (a memoriser)
- F1: Tableau des derivees usuelles : (x^n)' = n.x^(n-1), (1/x)' = -1/x^2, (sqrt(x))' = 1/(2.sqrt(x))
- F2: Les formules d'operations : somme, produit, quotient, puissance, racine
- F3: f' >= 0 <=> f croissante, f' <= 0 <=> f decroissante (equivalence, pas simple implication)
- F4: Condition necessaire d'extremum : f'(a) = 0 (mais pas suffisante ! contre-exemple x^3)
- F5: Condition suffisante : changement de signe de f' en a
- F6: f paire => f' impaire et reciproquement

### Skills (procedures a maitriser)
- S1: Calculer la derivee d'une fonction polynome — notion: N2, N3 — difficulte: 1 — entraine via: Prax1
- S2: Calculer la derivee d'une fonction rationnelle (quotient) — notion: N3.5 — difficulte: 1 — entraine via: Prax1, Prax2a
- S3: Calculer la derivee d'une fonction avec sqrt(f) — notion: N4 — difficulte: 2 — entraine via: Prax2b, Prax3
- S4: Calculer la derivee d'une fonction composee f(ax+b) — notion: N5 — difficulte: 1 — entraine via: Prax2c
- S5: Calculer des derivees successives — notion: N6 — difficulte: 2 — entraine via: Prax2d
- S6: Etudier le signe de f' (tableau de signes) — notion: N7 — difficulte: 2 — entraine via: Prax4
- S7: Dresser un tableau de variation a partir du signe de f' — notion: N9 — difficulte: 1 — entraine via: Prax4, Prax6
- S8: Determiner les extrema locaux et globaux — notion: N8 — difficulte: 2 — entraine via: Prax5, Prax6
- S9: Modeliser un probleme d'optimisation et trouver l'extremum — notion: N8, N9 — difficulte: 3 — entraine via: Prax7

### Principles (comprendre en profondeur)
- P1: La derivee transforme un probleme de variations (inegalites pour tout a <= b) en un probleme de signe (f'(x) >= 0) — changement de paradigme par rapport au module 01
- P2: f'(a) = 0 est NECESSAIRE mais PAS SUFFISANT pour un extremum — x^3 en 0 est le contre-exemple fondamental
- P3: La reciproque du theoreme variations-derivee est VRAIE (equivalence) : les fleches du tableau de variation et le signe de f' se correspondent exactement
- P4: Calculer une derivee est une competence de CALCUL (appliquer les formules) ; etudier le signe de f' est une competence d'ANALYSE (factoriser, discriminant, tableau de signes)
- P5: Les problemes d'optimisation suivent toujours le meme schema : modeliser -> deriver -> signe -> tableau -> conclure

> **Echelle de difficulte** :
> 0 — decouverte guidee
> 1 — application directe
> 2 — combinaison de techniques
> 3 — probleme synthese

## 7) Exemples canoniques

Les exemples "classiques" qui reviennent dans tous les manuels et au Bac tunisien.

- EC1: f(x) = x^3 + 3x => f'(x) = 3x^2 + 3 > 0 donc f croissante sur R (derivee qui ne s'annule jamais)
- EC2: f(x) = -x^3 + 3x => f'(x) = -3x^2 + 3 = -3(x-1)(x+1), deux extrema : max local en 1, min local en -1
- EC3: f(x) = x^3 en 0 => f'(0) = 0 mais pas d'extremum (contre-exemple fondamental pour la CN)
- EC4: f(x) = x^2 - 6x + 11 => f'(x) = 2(x-3), minimum global en x = 3 (valeur 2)
- EC5: f(x) = 2x/(x^2+1) => f'(x) = 2(1-x^2)/(x^2+1)^2, max en 1 (valeur 1), min en -1 (valeur -1)
- EC6: f(x) = (x-2)^2.(x+3) — tangentes, produit de derivees, extrema
- EC7: f(x) = sqrt(2x+1) => f'(x) = 1/sqrt(2x+1) — derivee d'une racine simple
- EC8: Aire maximale d'un rectangle de perimetre donne (carre) — probleme classique d'optimisation
- EC9: Rectangle inscrit dans un cercle de perimetre maximal — optimisation avec contrainte
- EC10: f(x) = (1-x)/(x^2-1) simplification en -1/(x+1), piege de la simplification
