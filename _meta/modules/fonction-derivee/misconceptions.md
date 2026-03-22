# Misconceptions — Fonction derivee

Module: fonction-derivee
Programme: 3eme-math

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
