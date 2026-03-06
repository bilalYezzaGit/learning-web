# KB Module — Fonction derivee

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

## 8) Praxeologies — patterns d'exercices

> **Regle de granularite** : une praxeologie = un type de tache + une technique.
> Si deux exercices utilisent des techniques differentes, ce sont deux praxeologies distinctes.

### Prax1 — Calculer la derivee d'une fonction simple
- **Notions mobilisees** : N2, N3
- **Type de tache (T)** : Determiner f' pour une fonction polynome, rationnelle ou combinaison lineaire
- **Technique (tau)** : Identifier le type de fonction. Appliquer la formule correspondante du tableau des derivees. Si combinaison lineaire : (alpha.f + beta.g)' = alpha.f' + beta.g'. Simplifier l'expression obtenue.
- **Technologie (theta)** : Les derivees des fonctions usuelles + linearite de la derivation
- **Variables didactiques** : degre du polynome, nombre de termes, coefficients fractionnaires
- **Exemples canoniques** : f(x) = 5x^4 - 3x + 1 => f'(x) = 20x^3 - 3
- **Difficulte** : 1

### Prax2a — Calculer la derivee d'un produit ou quotient
- **Notions mobilisees** : N3.2, N3.4, N3.5
- **Type de tache (T)** : Calculer f' quand f est un produit u.v ou un quotient u/v
- **Technique (tau)** : Pour le produit : (u.v)' = u'.v + u.v'. Pour le quotient : (u/v)' = (u'.v - u.v')/v^2. Calculer u', v' separement puis appliquer la formule. Factoriser le resultat quand c'est possible.
- **Technologie (theta)** : Formule de Leibniz pour le produit, formule du quotient
- **Variables didactiques** : u et v polynomiales ou rationnelles, factorisation simple ou elaborate du resultat
- **Exemples canoniques** : f(x) = (x^2-1)/(x-3) => f'(x) = (x^2-6x+1)/(x-3)^2
- **Difficulte** : 1-2

### Prax2b — Calculer la derivee avec sqrt(f)
- **Notions mobilisees** : N4, N3
- **Type de tache (T)** : Calculer la derivee d'une fonction contenant sqrt(expression)
- **Technique (tau)** : Identifier u(x) sous la racine. Verifier u(x) > 0 sur le domaine. Appliquer (sqrt(u))' = u'/(2.sqrt(u)). Si f = g.sqrt(u), utiliser la formule du produit.
- **Technologie (theta)** : Theoreme T5 — condition f > 0 strictement
- **Variables didactiques** : u lineaire, quadratique ou plus complexe, f = sqrt(u) seul ou dans un produit/quotient
- **Exemples canoniques** : f(x) = sqrt(3x^2+1) => f'(x) = 3x/sqrt(3x^2+1), f(x) = x.sqrt(2x+1)
- **Difficulte** : 2

### Prax2c — Calculer la derivee de f(ax+b)
- **Notions mobilisees** : N5
- **Type de tache (T)** : Calculer la derivee de g(x) = f(ax+b) par le theoreme de composition
- **Technique (tau)** : Identifier a, b et la fonction f. Appliquer g'(x) = a.f'(ax+b). Verifier le domaine de derivabilite.
- **Technologie (theta)** : Theoreme T6 (admis) — derivation d'une composition affine
- **Variables didactiques** : f = puissance, racine, inverse ; a et b entiers ou fractionnaires
- **Exemples canoniques** : f(x) = (5x-2)^4 => f'(x) = 20(5x-2)^3, g(x) = 1/(2x+3)^2
- **Difficulte** : 1

### Prax2d — Calculer des derivees successives et conjecturer une formule
- **Notions mobilisees** : N6
- **Type de tache (T)** : Calculer f', f'', f''', conjecturer f^(k) et (optionnellement) prouver par recurrence
- **Technique (tau)** : Calculer f', f'', f''' en appliquant les formules. Observer la structure : factorielles, puissances alternees. Formuler une conjecture pour f^(k)(x). Si demande, prouver par recurrence.
- **Technologie (theta)** : (1/(x-a))^(k) = (-1)^k . k! / (x-a)^(k+1)
- **Variables didactiques** : f rationnelle simple (1/(x-a)) ou decomposee, lien avec la recurrence (module 09)
- **Exemples canoniques** : f(x) = 1/(x-a) => f^(k)(x) = (-1)^k.k!/(x-a)^(k+1)
- **Difficulte** : 2-3

### Prax3 — Etudier la derivabilite d'une fonction avec racines ou valeurs absolues
- **Notions mobilisees** : N1, N4
- **Type de tache (T)** : Determiner si f est derivable en un point, en particulier aux bornes du domaine de sqrt(f) ou aux points de changement de |.|
- **Technique (tau)** : Calculer le taux de variation (f(x)-f(a))/(x-a) et passer a la limite. Si la limite est infinie : non derivable (tangente verticale). Si les limites a gauche et a droite different : non derivable (point anguleux). Interpreter graphiquement.
- **Technologie (theta)** : f derivable en a <=> le taux de variation a une limite finie en a
- **Variables didactiques** : sqrt au bord du domaine (tangente verticale), valeur absolue (point anguleux), fonction definie par morceaux
- **Exemples canoniques** : f(x) = |x| non derivable en 0 (f'_d = 1, f'_g = -1), sqrt(x) non derivable en 0 (limite infinie)
- **Difficulte** : 2

### Prax4 — Etudier les variations a l'aide de la derivee
- **Notions mobilisees** : N7, N3, N9
- **Type de tache (T)** : Determiner le sens de variation de f sur son domaine
- **Technique (tau)** : (1) Calculer f'(x). (2) Factoriser f'(x) ou trouver ses racines (discriminant pour trinome). (3) Dresser le tableau de signes de f'. (4) En deduire les variations de f : f' > 0 => f croissante, f' < 0 => f decroissante. (5) Completer le tableau de variation avec les valeurs de f aux bornes et aux zeros de f'.
- **Technologie (theta)** : Theoremes T7, T8, T9 — equivalence signe de f' et sens de variation
- **Variables didactiques** : degre de f' (lineaire, trinome, polynome de degre > 2), presence de fractions, zeros de f' rationnels ou irrationnels
- **Exemples canoniques** : f(x) = x^3 - 3x => f'(x) = 3(x^2-1), max local en -1, min local en 1
- **Difficulte** : 1-2

### Prax5 — Determiner les extrema a partir du tableau de variation
- **Notions mobilisees** : N8, N9
- **Type de tache (T)** : Identifier les extrema locaux et globaux de f a partir de son tableau de variation
- **Technique (tau)** : (1) Localiser les zeros de f' (condition necessaire). (2) Verifier le changement de signe de f' en ces points. (3) f' passe de + a - en a => maximum local f(a). f' passe de - a + en a => minimum local f(a). (4) Comparer avec les limites aux bornes pour les extrema globaux.
- **Technologie (theta)** : T10 (condition necessaire) + T11 (condition suffisante par changement de signe)
- **Variables didactiques** : nombre d'extrema, extrema locaux vs globaux, f'(a) = 0 sans extremum (point d'inflexion)
- **Exemples canoniques** : f(x) = 2x^4 - x^2 + 5 : deux minima locaux en +/-1/2, un max local en 0
- **Difficulte** : 2

### Prax6 — Determiner les extrema avec parametres
- **Notions mobilisees** : N8, N3, N7
- **Type de tache (T)** : Trouver la valeur d'un parametre pour qu'une fonction admette un extremum donne (en un point donne, ou d'une certaine nature)
- **Technique (tau)** : (1) Calculer f'(x) en fonction du parametre. (2) Imposer f'(x0) = 0 pour trouver le parametre. (3) Verifier le changement de signe de f'. (4) Attention : verifier que le resultat ne simplifie pas f en une fonction sans extremum.
- **Technologie (theta)** : f'(x0) = 0 est necessaire ; il faut en plus que f' change de signe
- **Variables didactiques** : parametre dans le numerateur ou denominateur, presence de valeur absolue, conditions de discussion
- **Exemples canoniques** : f(x) = ax^3 + 3x, extrema en +/-1 => a = -1
- **Difficulte** : 2-3

### Prax7a — Probleme d'optimisation geometrique
- **Notions mobilisees** : N7, N8, N9
- **Type de tache (T)** : Modeliser un probleme geometrique (aire, perimetre, volume, distance) par une fonction, puis trouver la valeur optimale
- **Technique (tau)** : (1) Poser la variable x et exprimer la grandeur a optimiser en fonction de x. (2) Identifier le domaine de x (contraintes). (3) Deriver. (4) Etudier le signe de la derivee. (5) En deduire l'extremum.
- **Technologie (theta)** : Derivee pour les variations + lecture du tableau pour l'extremum
- **Variables didactiques** : dimension (2D ou 3D), type de figure (rectangle, cercle, cone), contrainte (perimetre fixe, volume fixe)
- **Exemples canoniques** : Rectangle de perimetre 20 cm d'aire maximale (carre 5x5), rectangle inscrit dans un cercle de perimetre maximal (carre)
- **Difficulte** : 3

### Prax7b — Probleme d'optimisation economique / pratique
- **Notions mobilisees** : N7, N8, N9
- **Type de tache (T)** : Modeliser un probleme de cout, revenu, benefice par une fonction et trouver l'optimum
- **Technique (tau)** : (1) Traduire les donnees en fonction R(n) ou C(x). (2) Deriver. (3) Tableau de variation. (4) Conclure avec la variable entiere (comparer les deux entiers encadrant x0).
- **Technologie (theta)** : Le maximum de f sur R n'est pas forcement atteint en un entier — il faut comparer f(m) et f(m+1)
- **Variables didactiques** : variable continue ou discrete, contrainte de capacite, discussion entre valeurs entieres
- **Exemples canoniques** : Compagnie de bus : R(n) = (15+n)(90-n), maximum pour n entre 37 et 38
- **Difficulte** : 3

### Prax8 — Prouver une inegalite a l'aide de la derivee
- **Notions mobilisees** : N7, N8
- **Type de tache (T)** : Demontrer que f(x) >= g(x) pour tout x dans I, en etudiant h(x) = f(x) - g(x)
- **Technique (tau)** : (1) Poser h(x) = f(x) - g(x). (2) Calculer h'(x). (3) Etudier le signe de h' pour determiner les variations de h. (4) En deduire le minimum de h sur I. (5) Si min >= 0, alors h(x) >= 0 pour tout x, donc f(x) >= g(x).
- **Technologie (theta)** : Comparer deux fonctions revient a etudier le signe de leur difference
- **Variables didactiques** : inegalite avec racine, ln (hors programme), inegalite classique type (1+x/2) >= sqrt(1+x)
- **Exemples canoniques** : Montrer que sqrt(1+x) <= 1 + x/2 pour x >= 0
- **Difficulte** : 2-3

### Prax9 — Lire graphiquement la derivee et reciproquement
- **Notions mobilisees** : N7, N9
- **Type de tache (T)** : Identifier graphiquement la courbe de f' a partir de celle de f, ou lire les variations de f a partir de la courbe de f'
- **Technique (tau)** : (1) De Cf vers f' : la ou f croit, f' > 0 ; la ou f decroit, f' < 0 ; aux extrema, f' = 0. (2) De Cf' vers f : la ou f' > 0, f est croissante ; la ou f' < 0, f est decroissante.
- **Technologie (theta)** : Lien bijectif entre signe de f' et sens de variation de f
- **Variables didactiques** : plusieurs courbes proposees, extrema locaux, points d'inflexion
- **Exemples canoniques** : f cubique => f' parabolique ; f parabolique => f' lineaire
- **Difficulte** : 1-2

### Prax10 — Etudier les tangentes et leur position par rapport a la courbe
- **Notions mobilisees** : N1, N7, N8
- **Type de tache (T)** : Trouver les points ou la tangente est parallele a une droite donnee, ou les tangentes issues d'un point exterieur
- **Technique (tau)** : Tangente parallele a D de pente m : resoudre f'(x) = m. Tangente passant par A(a,b) : resoudre y_A = f'(x0)(a-x0) + f(x0) en x0. Position de la tangente : etudier le signe de f(x) - T(x) via la derivee seconde ou l'etude directe.
- **Technologie (theta)** : L'equation de la tangente est y = f'(a)(x-a) + f(a) ; la pente est f'(a)
- **Variables didactiques** : pente donnee, point exterieur donne, nombre de solutions, discussion parametrique
- **Exemples canoniques** : f(x) = (x-2)^2(x+3), tangentes paralleles a D: x+y+3=0
- **Difficulte** : 2-3

## 9) Misconceptions & erreurs frequentes

### E1 — Croire que f'(a) = 0 suffit pour un extremum
- **Description** : L'eleve voit f'(a) = 0 et conclut immediatement "f admet un extremum en a" sans verifier le changement de signe.
- **Frequence** : tres frequente
- **Source cognitive** : Confusion entre condition necessaire et condition suffisante. Le theoreme T10 dit => mais pas <=>.
- **Question diagnostique** :
    > Soit f(x) = x^3. On a f'(0) = 0. f admet-elle un extremum en 0 ?
    - A) Oui, un minimum car f(0) = 0 est la plus petite valeur — revele : confusion avec la valeur nulle
    - B) Oui, un point d'inflexion — revele : melange des concepts (point d'inflexion hors programme)
    - C) Non, car f' ne change pas de signe en 0 — correct (f' = 3x^2 >= 0 partout)
- **Remediation** : Toujours verifier le changement de signe de f' apres avoir trouve f'(a) = 0. Dresser systematiquement le tableau de signes de f'.

### E2 — Erreur de formule dans la derivee d'un quotient
- **Description** : L'eleve ecrit (u/v)' = u'/v' ou (u/v)' = (u'.v + u.v')/v^2 (signe + au lieu de -)
- **Frequence** : tres frequente
- **Source cognitive** : Confusion avec la formule du produit (f.g)' = f'.g + f.g', transposee au quotient sans le signe -.
- **Question diagnostique** :
    > La derivee de f(x) = (x+1)/(x-1) est :
    - A) f'(x) = 1 — revele : derivee du quotient = quotient des derivees
    - B) f'(x) = 2/(x-1)^2 — revele : signe + dans la formule
    - C) f'(x) = -2/(x-1)^2 — correct
- **Remediation** : Moyen mnemotechnique : "au quotient, c'est MOINS" (u'.v - u.v'). Verifier sur un cas simple connu : (1/x)' = (0.x - 1.1)/x^2 = -1/x^2.

### E3 — Oublier la condition f > 0 pour (sqrt(f))'
- **Description** : L'eleve applique (sqrt(f))' = f'/(2.sqrt(f)) sans verifier que f est strictement positive, ou oublie que sqrt(f) n'est pas derivable aux zeros de f.
- **Frequence** : frequente
- **Source cognitive** : La condition f > 0 (strictement) est oubliee, l'eleve pense que f >= 0 suffit.
- **Question diagnostique** :
    > f(x) = sqrt(1-x^2) est-elle derivable en x = 1 ?
    - A) Oui, f'(1) = -1/(2.sqrt(0)) — revele : division par zero non detectee
    - B) Non, car f(1) = 0 et le taux de variation tend vers -infini — correct
- **Remediation** : Aux points ou f(x0) = 0, il faut revenir a la definition (taux de variation) pour conclure que sqrt(f) n'est pas derivable (tangente verticale).

### E4 — Confondre f' > 0 (strict) et f' >= 0 pour la croissance stricte
- **Description** : L'eleve croit que f strictement croissante implique f' > 0 partout (strictement), et inversement.
- **Frequence** : frequente
- **Source cognitive** : Le theoreme dit f' >= 0 <=> f croissante. La croissance stricte correspond a f' >= 0 avec f' qui ne s'annule que ponctuellement.
- **Question diagnostique** :
    > f(x) = x^3 est strictement croissante sur R. Or f'(0) = 0. Comment est-ce possible ?
    - A) C'est impossible, il y a une erreur — revele : confusion strict / large
    - B) f' >= 0 suffit pour la croissance ; f' peut s'annuler ponctuellement — correct
- **Remediation** : Preciser : f strictement croissante <=> f' >= 0 et f' ne s'annule pas sur un intervalle entier (elle peut s'annuler en des points isoles).

### E5 — Ne pas factoriser f' avant l'etude de signe
- **Description** : L'eleve essaie d'etudier le signe de f' sous forme developpee au lieu de factoriser.
- **Frequence** : frequente
- **Source cognitive** : L'eleve calcule f' correctement mais ne pense pas a factoriser pour simplifier l'etude de signe.
- **Question diagnostique** :
    > f'(x) = 6x^3 + 12x^2 - 18x. Comment etudier le signe ?
    - A) Tester des valeurs — revele : pas de methode systematique
    - B) Factoriser : 6x(x^2+2x-3) = 6x(x+3)(x-1), tableau de signes — correct
- **Remediation** : Reflexe : toujours mettre en facteur le coefficient commun, puis factoriser le polynome restant (racines, discriminant).

### E6 — Oublier le facteur a dans la derivee de f(ax+b)
- **Description** : L'eleve ecrit (f(ax+b))' = f'(ax+b) en oubliant de multiplier par a.
- **Frequence** : frequente
- **Source cognitive** : L'eleve "derive l'interieur" (ax+b)' = a mais oublie de le multiplier.
- **Question diagnostique** :
    > La derivee de f(x) = (5x-2)^4 est :
    - A) f'(x) = 4(5x-2)^3 — revele : oubli du facteur a = 5
    - B) f'(x) = 20(5x-2)^3 — correct
- **Remediation** : Formuler explicitement : "je derive l'exterieur ET je multiplie par la derivee de l'interieur". Verifier la coherence dimensionnelle.

### E7 — Conclure sur un mauvais intervalle
- **Description** : L'eleve ecrit "f est croissante sur R" alors que f' >= 0 seulement sur un sous-intervalle, ou applique le theoreme de part et d'autre d'une discontinuite.
- **Frequence** : occasionnelle
- **Source cognitive** : Le theoreme s'applique sur un INTERVALLE. Si Df n'est pas un intervalle (ex: R\{a}), il faut traiter chaque intervalle separement.
- **Question diagnostique** :
    > f(x) = 1/x. f'(x) = -1/x^2 < 0 pour tout x != 0. f est-elle decroissante sur R* ?
    - A) Oui, f' < 0 partout donc f decroissante sur R* — revele : R* n'est pas un intervalle
    - B) Non : f est decroissante sur ]-inf,0[ et decroissante sur ]0,+inf[ separement — correct
- **Remediation** : Verifier que le domaine est un intervalle avant d'appliquer le theoreme. Sinon, traiter chaque intervalle.

## 10) Regles redactionnelles

### Notations
- Derivee : f', f'(x), f'(a)
- Derivees successives : f'', f''', f^(4), ..., f^(n)
- Derivee a droite/gauche : f'_d(a), f'_g(b)
- Nombre derive : "le nombre derive de f en a est f'(a)"
- Fonction derivee : "la fonction derivee de f est f'"
- Extremum local : "f admet un maximum local en a egal a f(a)"
- Extremum absolu : "f admet un minimum absolu en a"

### Niveau de rigueur
- Le calcul de f' doit montrer les etapes intermediaires (identification de u, v, application de la formule)
- L'etude de signe de f' doit passer par un tableau de signes complet
- Le tableau de variation doit comporter : ligne x (bornes + zeros de f'), ligne signe de f', ligne variations de f (fleches + valeurs)
- Pour un extremum : "f'(a) = 0 et f' change de signe en a, donc f admet un [max/min] local en a egal a f(a)"
- Pour l'optimisation : modeliser, deriver, tableau de variation, conclusion en revenant au probleme initial

### Formules de redaction consacrees
- "f est une fonction polynome donc derivable sur R" — ouverture standard
- "f est une fonction rationnelle definie et derivable sur D" — pour les quotients
- "f est derivable et strictement positive sur I, donc sqrt(f) est derivable sur I" — preambule sqrt
- "D'ou le tableau de variation de f..." — transition vers le tableau
- "f admet [un max/min] local en a egal a f(a) = ..." — conclusion extremum
- "Pour tout x dans I, f(x) >= f(a) = ..., donc f(a) est le minimum de f sur I" — extremum global

### Longueur type
- Calcul de derivee simple : 2-4 lignes (formule + simplification)
- Calcul de derivee composee : 4-6 lignes (identification + formule + simplification)
- Etude de variations complete : 8-12 lignes (f', signe, tableau, conclusion)
- Probleme d'optimisation : 15-20 lignes (modelisation + etude + conclusion)
