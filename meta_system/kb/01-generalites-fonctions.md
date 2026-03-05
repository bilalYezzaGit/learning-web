# KB Module — Generalites sur les fonctions

id: module_generalites_fonctions
niveau: 3eme-math
version: 0.1

## 0) Objectif du module (1 phrase)

> Maitriser les outils fondamentaux d'analyse des fonctions (domaine, parite, monotonie, bornes, operations, transformations) qui servent de socle a toute l'etude de fonctions en 3eme et 4eme annee.

## 1) Scope du module

### Inclus
- Ensemble de definition (fractions, racines, valeurs absolues)
- Sens de variation (definition, preuve par la definition)
- Parite (paire, impaire) et reduction de l'intervalle d'etude
- Restriction d'une fonction
- Majorant, minorant, borne, maximum, minimum
- Operations sur les fonctions (somme, produit, multiplication par un scalaire) et impact sur les variations
- Fonction x -> sqrt(f(x)) : existence et monotonie
- Fonctions affines par intervalles
- Fonction partie entiere E(x)
- Construction de courbes par transformations (translations, symetries)
- Resolution graphique d'equations et inequations

### Exclus
- Continuite (module 02)
- Limites (modules 03-04)
- Derivabilite (modules 05-06)
- Etude complete de fonctions (module 07)
- Periodicite (mentionnee mais non approfondie a ce stade)

## 2) Transposition didactique

### Savoir savant
- Theorie des fonctions reelles d'une variable reelle (Cauchy, Weierstrass)
- Espaces fonctionnels, algebre des fonctions
- Fonction partie entiere (theorie des nombres)

### Savoir a enseigner (programme tunisien)
- Rappels et approfondissement des notions de 2nde : domaine, variations, parite
- Introduction formelle de la monotonie par la definition (pour tout a, b dans I, a <= b => ...)
- Majoration/minoration comme outil preparatoire aux limites et a la continuite
- Fonction racine composee sqrt(f) avec theoreme de conservation de la monotonie
- Partie entiere comme exemple de fonction affine par intervalles

### Adaptations didactiques
- La monotonie est demontree par la definition (pas encore par la derivee) : c'est une competence centrale de ce module
- L'approche est algebrique (manipulation d'inegalites) et graphique (lecture de courbes)
- Les theoremes sur sqrt(f) sont demontres a partir de la definition de la monotonie
- La partie entiere sert d'exemple de fonction non continue (preparation au module 02)
- Les transformations de courbes sont liees aux operations sur les fonctions (translation = ajout de constante)

## 3) Prerequisites & liens inter-modules

### Prerequisites
- 2nde annee : notion de fonction, image, antecedent, representation graphique
- 2nde annee : fonctions de reference (carre, cube, inverse, racine carree)
- 2nde annee : factorisation de polynomes, resolution d'inequations du 2nd degre
- 2nde annee : valeur absolue (definition et proprietes)

### Ouvre vers
- Module 02 (Continuite) : les bornes et la monotonie sont des prerequis pour le TVI
- Module 03-04 (Limites) : la maitrise des operations sur les fonctions et de la monotonie est indispensable
- Module 05-06 (Derivation) : la monotonie sera retrouvee via le signe de la derivee — comparaison avec la methode algebrique de ce module
- Module 07 (Etude de fonctions) : ce module fournit le plan-type d'une etude (Df, parite, variations, bornes, courbe)

## 4) Carte des notions (plan)

- N1: Ensemble de definition
    - N1.1: Df de fonctions rationnelles (denominateur non nul)
    - N1.2: Df de fonctions avec racines (radicande >= 0)
    - N1.3: Df de fonctions composees (conditions cumulees)
- N2: Sens de variation
    - N2.1: Definitions (croissante, decroissante, monotone, constante)
    - N2.2: Preuve par la definition (pour tout a <= b dans I...)
    - N2.3: Preuve par le taux de variation T = (f(b)-f(a))/(b-a)
- N3: Parite
    - N3.1: Condition prealable : Df symetrique par rapport a 0
    - N3.2: Fonction paire : f(-x) = f(x), symetrie / axe Oy
    - N3.3: Fonction impaire : f(-x) = -f(x), symetrie / O
    - N3.4: Reduction de l'intervalle d'etude a R+ inter D
- N4: Restriction d'une fonction
- N5: Majorant, minorant, bornes
    - N5.1: Majorant / minorant (existence, non-unicite)
    - N5.2: Maximum / minimum (atteint, unique)
    - N5.3: Fonction bornee (majoree ET minoree)
- N6: Operations sur les fonctions
    - N6.1: Somme f + g, produit f.g, multiplication lambda.f
    - N6.2: Variations de la somme (meme sens => meme sens)
    - N6.3: Variations de lambda.f (signe de lambda)
- N7: Fonction x -> sqrt(f(x))
    - N7.1: Ensemble de definition (f(x) >= 0)
    - N7.2: Conservation de la monotonie (f positive)
    - N7.3: Conservation de la majoration
- N8: Fonctions affines par intervalles
    - N8.1: Definition et representation graphique
    - N8.2: Valeur absolue comme cas particulier
    - N8.3: Fonction partie entiere E(x)
- N9: Transformations de courbes
    - N9.1: g(x) = f(x) + b => translation de vecteur b.j
    - N9.2: g(x) = f(x - a) => translation de vecteur a.i
    - N9.3: g(x) = -f(x) => symetrie / axe Ox
    - N9.4: g(x) = |f(x)| => rabattement de la partie negative
    - N9.5: g(x) = f(|x|) => fonction paire, symetrie / Oy
- N10: Resolution graphique
    - N10.1: Equations f(x) = g(x) : abscisses des points d'intersection
    - N10.2: Inequations f(x) <= g(x) : positions relatives des courbes

## 5) Theoremes & proprietes cles

| ID | Enonce | Statut | Utilise dans |
|----|--------|--------|--------------|
| D1 | f croissante sur I : pour tout a, b dans I, a <= b => f(a) <= f(b) | definition | Prax2, S1, S2 |
| D2 | f decroissante sur I : pour tout a, b dans I, a <= b => f(a) >= f(b) | definition | Prax2, S1, S2 |
| D3 | f paire : Df symetrique et f(-x) = f(x) pour tout x dans Df | definition | Prax1, S3 |
| D4 | f impaire : Df symetrique et f(-x) = -f(x) pour tout x dans Df | definition | Prax1, S3 |
| D5 | f majoree par M sur D : pour tout x dans D, f(x) <= M | definition | Prax3, S5 |
| D6 | f admet un maximum f(x0) sur D : pour tout x dans D, f(x) <= f(x0) | definition | Prax4, S6 |
| T1 | f et g croissantes sur I => f + g croissante sur I | demontre | Prax5, S7 |
| T2 | f croissante et positive sur I => sqrt(f) croissante sur I | demontre | Prax6, S8 |
| T3 | f decroissante et positive sur I => sqrt(f) decroissante sur I | demontre | Prax6, S8 |
| T4 | f majoree sur I => sqrt(f) majoree sur I | demontre | Prax6 |
| P1 | f impaire et definie en 0 => f(0) = 0 | demontre | Prax1 |
| P2 | f paire ou impaire => on reduit l'etude a R+ inter Df | consequence | Prax1, S3 |
| P3 | f et g paires => f+g paire, f.g paire | demontre | S3 |
| P4 | f et g impaires => f+g impaire, f.g paire | demontre | S3 |

> **Notations tunisiennes** :
> - La courbe representative est notee C_f ou zeta_f (les deux sont utilises)
> - Le taux de variation est note T = (f(b) - f(a)) / (b - a)
> - La partie entiere est notee E(x) (pas floor(x))
> - Le repere est note (O, i_vec, j_vec) avec les vecteurs unitaires

## 6) Knowledge Components

### Facts (a memoriser)
- F1: Les conditions d'existence : denominateur != 0, radicande >= 0
- F2: La parite necessite un domaine symetrique par rapport a 0
- F3: f impaire et definie en 0 => f(0) = 0
- F4: Les regles de transformation de courbes (f(x)+b, f(x-a), -f(x), |f(x)|, f(|x|))
- F5: E(x) = n si n <= x < n+1 (definition de la partie entiere)
- F6: Distinction majorant/maximum : le majorant n'est pas forcement atteint, le maximum si

### Skills (procedures a maitriser)
- S1: Determiner l'ensemble de definition d'une fonction — notion: N1 — difficulte: 1 — entraine via: Prax0
- S2: Prouver la monotonie par la definition — notion: N2 — difficulte: 2 — entraine via: Prax2
- S3: Etudier la parite d'une fonction — notion: N3 — difficulte: 1 — entraine via: Prax1
- S4: Montrer qu'une fonction est bornee (trouver M et m) — notion: N5 — difficulte: 2 — entraine via: Prax3
- S5: Determiner le max/min d'une fonction sur un intervalle — notion: N5 — difficulte: 2 — entraine via: Prax4
- S6: Lire un tableau de variations et en deduire max/min — notion: N2, N5 — difficulte: 1 — entraine via: Prax4
- S7: Utiliser les operations pour deduire les variations — notion: N6 — difficulte: 2 — entraine via: Prax5
- S8: Etudier les variations de sqrt(f) a partir de celles de f — notion: N7 — difficulte: 2 — entraine via: Prax6
- S9: Tracer une courbe par transformation a partir d'une courbe de reference — notion: N9 — difficulte: 1 — entraine via: Prax7
- S10: Resoudre graphiquement une equation ou inequation — notion: N10 — difficulte: 1 — entraine via: Prax8
- S11: Donner l'expression d'une fonction affine par morceaux (avec valeur absolue) — notion: N8 — difficulte: 1 — entraine via: Prax9

### Principles (comprendre en profondeur)
- P1: La monotonie par la definition est une competence fondamentale qui sera replacee par la derivee — mais la definition reste necessaire quand la derivee ne s'applique pas
- P2: La distinction majorant / maximum est subtile : un majorant peut ne pas etre atteint, un maximum est toujours atteint
- P3: "f et g croissantes => f.g croissante" est FAUX en general — seule la somme conserve la monotonie
- P4: "f croissante => f^2 croissante" est FAUX si f change de signe — vrai seulement si f >= 0
- P5: Les transformations de courbes sont la traduction geometrique des operations algebriques sur les fonctions

> **Echelle de difficulte** :
> 0 — decouverte guidee
> 1 — application directe
> 2 — combinaison de techniques
> 3 — probleme synthese

## 7) Exemples canoniques

Les exemples "classiques" qui reviennent dans tous les manuels et au Bac tunisien.

- EC1: f(x) = x/(1+x^2) — bornee entre -1/2 et 1/2, impaire, technique: etude du signe de f(x) - 1/2 = -(x-1)^2 / 2(1+x^2)
- EC2: f(x) = (x-1)/(x+3) — decomposition en -4/(x+3) + 1, hyperbole translatee, asymptotes
- EC3: f(x) = sqrt(x+1) - sqrt(x) — multiplication par le conjugue pour borner entre 0 et 1
- EC4: f(x) = x^2 + 1/x^2 — lien avec u(x) = x - 1/x, u^2 = f - 2, minimum 2 en x=1
- EC5: E(x) — partie entiere, escalier, points ouverts/fermes
- EC6: f(x) = 2x/(x^2+1) — bornee par |f(x)| <= 1, preuve via (|x|-1)^2 >= 0
- EC7: f(x) = |2x-1| - 3x — affine par morceaux, ecriture sur chaque intervalle
- EC8: f(x) = (x+1)/(|x|+1) — ni paire ni impaire car Df non symetrique
- EC9: Rectangle inscrit dans un cercle — S(x) = 4x.sqrt(1-x^2), maximum pour x = 1/sqrt(2)
- EC10: g(x) = (f(x)+f(-x))/2 est paire, h(x) = (f(x)-f(-x))/2 est impaire — decomposition canonique

## 8) Praxeologies — patterns d'exercices

### Prax0 — Determiner l'ensemble de definition
- **Notions mobilisees** : N1
- **Type de tache (T)** : Trouver Df pour une fonction donnee (fraction, racine, composee)
- **Technique (tau)** : Poser les conditions d'existence : denominateur != 0, radicande >= 0. Resoudre les inequations obtenues. Intersecter les domaines si composition.
- **Technologie (theta)** : f(x) existe ssi toutes les operations sont definies
- **Variables didactiques** : type de fonction (rationnelle, irrationnelle, composee), nombre de conditions, presence de valeur absolue
- **Exemples canoniques** : f(x) = (5x-1)/(x+3), g(x) = sqrt(1-x), h(x) = 1/sqrt(|x-1|)
- **Difficulte** : 0-1

### Prax1 — Etudier la parite
- **Notions mobilisees** : N3, N1
- **Type de tache (T)** : Determiner si f est paire, impaire, ou ni l'un ni l'autre
- **Technique (tau)** : (1) Verifier que Df est symetrique par rapport a 0. Si non => ni paire ni impaire, STOP. (2) Calculer f(-x). (3) Comparer avec f(x) et -f(x).
- **Technologie (theta)** : La condition Df symetrique est une condition PREALABLE, pas optionnelle
- **Variables didactiques** : presence de |x| (souvent paire), degre du polynome, fonctions composees
- **Exemples canoniques** : f(x) = x^2+2 (paire), f(x) = (x^3-x)/(|x|+4) (impaire), f(x) = sqrt(x)-1 (ni l'un ni l'autre car Df non symetrique)
- **Difficulte** : 1

### Prax2 — Prouver la monotonie par la definition
- **Notions mobilisees** : N2.1, N2.2, N2.3
- **Type de tache (T)** : Montrer qu'une fonction est croissante (ou decroissante) sur un intervalle I
- **Technique (tau)** : Methode 1 — Prendre a, b dans I avec a <= b, montrer que f(a) <= f(b) (ou f(a) >= f(b)) par manipulation d'inegalites. Methode 2 — Calculer le taux de variation T = (f(b)-f(a))/(b-a) et determiner son signe.
- **Technologie (theta)** : La monotonie est une propriete globale sur I. Le taux de variation a le meme signe que f(b)-f(a) car b-a > 0.
- **Variables didactiques** : type de fonction (polynome, rationnelle, irrationnelle), methode imposee ou au choix, sens de variation a determiner ou donne
- **Exemples canoniques** : f(x) = -4/(x+3) + 1 sur ]-3, +inf[ (croissante), f(x) = x/(x-2) sur ]2,4] par taux de variation
- **Difficulte** : 2

### Prax3 — Montrer qu'une fonction est majoree/minoree/bornee
- **Notions mobilisees** : N5.1, N5.2, N5.3
- **Type de tache (T)** : Prouver que pour tout x dans D, m <= f(x) <= M
- **Technique (tau)** : Methode 1 — Etudier le signe de f(x) - M (montrer <= 0) et f(x) - m (montrer >= 0), souvent via identite remarquable. Methode 2 — Enchainer des inegalites a partir d'une inegalite connue (x^2 >= 0, |cos x| <= 1). Methode 3 — Utiliser le tableau de variations si disponible.
- **Technologie (theta)** : f(x) - M = -(carre) / (positif) <= 0 est le pattern typique
- **Variables didactiques** : bornes a trouver ou donnees, technique imposee ou libre, fonction avec cos/sin (combiner avec |cos x| <= 1)
- **Exemples canoniques** : f(x) = x/(1+x^2) bornee par [-1/2, 1/2], f(x) = x^2/(1+x+x^2) bornee par [0, 4/3]
- **Difficulte** : 2

### Prax4 — Determiner le maximum ou minimum
- **Notions mobilisees** : N5.2, N2
- **Type de tache (T)** : Montrer que f admet un extremum en x0 sur I et donner sa valeur
- **Technique (tau)** : Montrer que f(x) - f(x0) a un signe constant sur I. Souvent f(x) - f(x0) = k(x - x0)^2 (signe evident) ou f(x) - f(x0) = produit de facteurs dont on connait le signe sur I.
- **Technologie (theta)** : f(x0) est un maximum ssi pour tout x dans I, f(x) <= f(x0), cad f(x) - f(x0) <= 0 sur I
- **Variables didactiques** : x0 donne ou a trouver, forme canonique explicite ou a construire
- **Exemples canoniques** : f(x) = 3(x-4)^2 + 8 minimum en x=4, f(x) = -2x^3 + 42x^2 maximum sur [14,20]
- **Difficulte** : 2

### Prax5 — Variations par operations sur les fonctions
- **Notions mobilisees** : N6.1, N6.2, N6.3, N2
- **Type de tache (T)** : Deduire les variations de f a partir de sa decomposition en somme/produit de fonctions connues
- **Technique (tau)** : Decomposer f = u + v (ou f = lambda.u). Si u et v sont toutes deux croissantes (resp. decroissantes) sur I, alors f aussi. Si f = lambda.u avec lambda > 0, meme sens ; lambda < 0, sens contraire.
- **Technologie (theta)** : T1 (somme de fonctions monotones de meme sens). ATTENTION : ne marche PAS pour le produit en general.
- **Variables didactiques** : nombre de termes, presence de 1/x ou sqrt(x), sens opposes (impossibilite de conclure)
- **Exemples canoniques** : f(x) = -x + 1/x (somme de deux decroissantes sur R+*), f(x) = (x^2+3).sqrt(x) (produit de positives croissantes sur R+)
- **Difficulte** : 2

### Prax6 — Etude de sqrt(f)
- **Notions mobilisees** : N7.1, N7.2, N7.3, N1
- **Type de tache (T)** : Determiner Df, etudier les variations de g(x) = sqrt(f(x))
- **Technique (tau)** : (1) Df = {x : f(x) >= 0}. (2) Appliquer T2/T3 : si f positive et croissante (resp. decroissante) alors sqrt(f) aussi.
- **Technologie (theta)** : Theoremes T2, T3, T4 — la racine carree conserve la monotonie et la majoration (quand f >= 0)
- **Variables didactiques** : f polynomiale ou rationnelle, enchainement avec Prax5
- **Exemples canoniques** : g(x) = sqrt(x+1) (croissante), h(x) = sqrt(x(1-x)) (variations non triviales)
- **Difficulte** : 2

### Prax7 — Construction de courbes par transformation
- **Notions mobilisees** : N9.1, N9.2, N9.3, N9.4, N9.5
- **Type de tache (T)** : Tracer la courbe de g a partir de celle de f, en identifiant la transformation geometrique
- **Technique (tau)** : Identifier la relation entre g et f (g(x) = f(x)+b, f(x-a), -f(x), |f(x)|, f(|x|)). En deduire la transformation (translation, symetrie, rabattement).
- **Technologie (theta)** : Les transformations sont la lecture geometrique des operations algebriques
- **Variables didactiques** : type de transformation, composition de transformations, courbe de depart donnee ou a tracer
- **Exemples canoniques** : f(x) = (1-3x)/x = 1/x - 3 => translation de y=1/x par -3j ; f(x) = sqrt(x+1) => translation de y=sqrt(x) par -i
- **Difficulte** : 1

### Prax8 — Resolution graphique
- **Notions mobilisees** : N10.1, N10.2
- **Type de tache (T)** : Resoudre graphiquement f(x) = g(x) ou f(x) <= g(x)
- **Technique (tau)** : Tracer Cf et Cg. Equations : lire les abscisses des points d'intersection. Inequations : lire les intervalles ou une courbe est au-dessus/au-dessous de l'autre.
- **Technologie (theta)** : f(x) = g(x) <=> le point (x, f(x)) est sur les deux courbes. f(x) <= g(x) <=> Cf est en dessous de Cg.
- **Variables didactiques** : nombre de solutions, precision demandee, reformulation prealable (ramener a f(x) <= g(x))
- **Exemples canoniques** : (1-3x)/x = -2x^2 (3 solutions), sqrt(x+1)-1 <= 2x
- **Difficulte** : 1-2

### Prax9 — Fonctions affines par morceaux et partie entiere
- **Notions mobilisees** : N8.1, N8.2, N8.3
- **Type de tache (T)** : Donner l'expression d'une fonction definie par morceaux (souvent avec |.|) et/ou tracer sa courbe. Pour E(x) : determiner E(x) sur chaque intervalle [n, n+1[.
- **Technique (tau)** : Lever la valeur absolue en distinguant les cas (signe de l'argument). Pour E(x) : encadrer x entre deux entiers consecutifs.
- **Technologie (theta)** : |a| = a si a >= 0, |a| = -a si a < 0. E(x) = n <=> n <= x < n+1.
- **Variables didactiques** : nombre de valeurs absolues, combinaisons E(x) - 2E(x/2), fonctions type f(x) = E(x) + sqrt(x - E(x))
- **Exemples canoniques** : f(x) = |2x-1| - 3x, g(x) = 2 - 2|x|, f(x) = E(x) - 2E(x/2)
- **Difficulte** : 1-2

### Prax10 — Probleme de modelisation avec optimisation
- **Notions mobilisees** : N2, N5.2, N6, N7
- **Type de tache (T)** : Modeliser une situation concrete par une fonction, etudier ses variations, trouver un optimum
- **Technique (tau)** : Traduire le probleme en fonction f(x). Ecrire f sous forme canonique ou decomposee. Etudier les variations. En deduire le maximum/minimum.
- **Technologie (theta)** : La forme canonique a(x-alpha)^2 + beta donne directement l'extremum
- **Variables didactiques** : contexte (geometrique, economique), contraintes sur x, besoin d'une preuve de monotonie
- **Exemples canoniques** : Aire d'un rectangle inscrit dans un cercle S(x) = 4x.sqrt(1-x^2), benefice d'entreprise B(n) = -20n^2 + 880n + 100
- **Difficulte** : 3

## 9) Misconceptions & erreurs frequentes

### E1 — Oublier de verifier la symetrie de Df avant la parite
- **Description** : L'eleve calcule f(-x), trouve f(-x) = f(x), et conclut "f est paire" sans verifier que Df est symetrique par rapport a 0.
- **Frequence** : tres frequente
- **Source cognitive** : La condition sur Df est percue comme un detail technique, pas comme une condition prealable.
- **Question diagnostique** :
    > Soit f definie sur [-1, +inf[ par f(x) = 3x/(1+|x|). f est :
    - A) paire — revele : oubli de la condition sur Df
    - B) impaire — revele : oubli de la condition sur Df + calcul errone
    - C) ni paire ni impaire — correct (Df non symetrique : 3 est dans Df mais -3 ne l'est pas)
- **Remediation** : Toujours commencer par "Df est-il symetrique ?" AVANT de calculer f(-x). Si non => STOP, ni paire ni impaire.

### E2 — Confondre majorant et maximum
- **Description** : L'eleve dit "5 est un maximum de f" alors que 5 est seulement un majorant (pas atteint).
- **Frequence** : tres frequente
- **Source cognitive** : Confusion entre "f(x) <= M pour tout x" (majorant) et "il existe x0 tel que f(x0) = M ET f(x) <= M pour tout x" (maximum).
- **Question diagnostique** :
    > f est definie sur R par f(x) = 2/(x^2+4). On sait que 0 <= f(x) <= 1/2 pour tout x. Que peut-on dire ?
    - A) f admet 0 comme minimum — revele : croire que la borne inferieure est toujours atteinte
    - B) f admet 1/2 comme maximum — correct (atteint en x=0)
    - C) f est bornee donc elle admet un minimum et un maximum — revele : croire que borne => extremum atteint
    - D) f admet 1/2 comme majorant — correct mais incomplet (c'est aussi le maximum)
- **Remediation** : Presenter des contre-exemples : f(x) = 2/(x^2+4) est bornee par 0, mais 0 n'est jamais atteint. Distinguer clairement "la valeur est atteinte" (maximum) vs "la valeur est une borne" (majorant).

### E3 — Croire que si f admet un maximum, elle est bornee
- **Description** : L'eleve pense que "maximum => bornee" (oublie qu'il faut aussi etre minoree).
- **Frequence** : frequente
- **Source cognitive** : Confusion entre une condition et ses deux composantes (majoree ET minoree).
- **Question diagnostique** :
    > f(x) = -x^2 sur R. f admet un maximum en 0 (f(0) = 0). Est-ce que f est bornee ?
    - A) Oui, car elle admet un maximum — revele : confusion bornee = a un extremum
    - B) Non, car f n'est pas minoree — correct
- **Remediation** : Bornee = majoree ET minoree. Un maximum ne dit rien sur le minorant.

### E4 — Etendre la regle de la somme au produit
- **Description** : L'eleve applique "f et g croissantes => f.g croissante" par analogie avec la somme.
- **Frequence** : frequente
- **Source cognitive** : Generalisation abusive de T1 (valable pour la somme) au produit.
- **Question diagnostique** :
    > f(x) = x et g(x) = x-2 sont croissantes sur R. Que dire de h(x) = f(x).g(x) = x(x-2) = x^2 - 2x ?
    - A) h est croissante sur R — revele : application abusive de la regle de la somme
    - B) h est decroissante puis croissante — correct (minimum en x=1)
- **Remediation** : Le produit de croissantes n'est croissant que si les deux fonctions sont POSITIVES sur I. Donner l'exemple ci-dessus comme contre-exemple.

### E5 — Confondre f croissante et f^2 croissante
- **Description** : L'eleve deduit "f croissante => f^2 croissante" sans verifier le signe de f.
- **Frequence** : frequente
- **Source cognitive** : Oubli que le carre inverse les inegalites pour les negatifs.
- **Question diagnostique** :
    > u(x) = x - 1/x est croissante sur ]0, +inf[. u^2 est-elle croissante sur ]0, +inf[ ?
    - A) Oui, car u est croissante — revele : oubli du signe
    - B) Non : u^2 est decroissante sur ]0,1] puis croissante sur [1, +inf[ — correct (u change de signe en x=1)
- **Remediation** : f^2 est croissante la ou f est croissante ET positive. f^2 est decroissante la ou f est croissante ET negative.

### E6 — Oublier la condition "positive" pour sqrt(f)
- **Description** : L'eleve applique "f croissante => sqrt(f) croissante" sans verifier que f >= 0 sur I.
- **Frequence** : occasionnelle
- **Source cognitive** : Le theoreme T2 a une hypothese que l'eleve omet.
- **Remediation** : Toujours ecrire les deux conditions : "f positive ET croissante sur I => sqrt(f) croissante sur I".

### E7 — Erreur de signe dans le taux de variation
- **Description** : L'eleve calcule T = (f(a)-f(b))/(a-b) au lieu de (f(b)-f(a))/(b-a), ou oublie que b-a > 0 (car a < b).
- **Frequence** : frequente
- **Source cognitive** : Inattention sur l'ordre a < b, ou inversion numerateur/denominateur.
- **Remediation** : Convention systematique : toujours poser "soient a et b dans I tels que a < b", puis calculer f(b) - f(a), et diviser par b - a > 0. Le signe de T est celui de f(b) - f(a).

## 10) Regles redactionnelles

### Notations
- Courbe representative : C_f ou zeta_f (les deux sont acceptes)
- Repere : (O, i_vec, j_vec) toujours precise au debut d'un probleme graphique
- Taux de variation : T = (f(b) - f(a)) / (b - a)
- Partie entiere : E(x) (notation francaise standard)
- Points fermes/ouverts sur les courbes : rond plein = inclus, rond vide = exclu

### Niveau de rigueur
- La preuve de monotonie par la definition est OBLIGATOIRE tant que la derivee n'est pas introduite
- Format standard : "Soient a et b deux reels de I tels que a <= b. On a : [chaine d'implications]. D'ou f(a) <= f(b). Donc f est croissante sur I."
- Pour la majoration : "Pour tout x dans D, f(x) - M = [expression] <= 0, d'ou f(x) <= M."
- Pour la parite : TOUJOURS commencer par "Df est-il symetrique par rapport a 0 ?"
- Un contre-exemple suffit pour prouver qu'un enonce est FAUX

### Formules de redaction consacrees
- "Soient a et b deux reels de I tels que a <= b" — ouverture standard monotonie
- "D'ou..." / "Par suite..." / "Ainsi..." — connecteurs logiques
- "On en deduit que..." — pour les consequences
- "Par consequent, f est [croissante/decroissante] sur I" — conclusion monotonie
- "f est majoree par M et minoree par m, donc f est bornee sur D" — conclusion bornage
- "contre-exemple : ..." — pour refuter un enonce

### Longueur type
- Preuve de monotonie : 5-8 lignes (hypothese, chaine d'inegalites, conclusion)
- Etude de parite : 3-5 lignes (verification Df, calcul f(-x), conclusion)
- Majoration/minoration : 4-6 lignes (calcul f(x)-M, signe, conclusion)
