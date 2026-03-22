# Praxeologies — Fonction derivee

Module: fonction-derivee
Programme: 3eme-math

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
