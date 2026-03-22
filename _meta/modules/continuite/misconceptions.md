# Misconceptions — Continuite

Module: continuite
Programme: 3eme-math

### E1 — Confondre continuite et "definie en a"

- **Description** : L'eleve pense que si f est definie en a, alors f est continue en a
- **Frequence** : frequente
- **Source cognitive** : La continuite exige plus que l'existence de f(a) — il faut aussi que le comportement de f(x) au voisinage de a soit coherent avec f(a)
- **Question diagnostique** :
    > Soit f(x) = {1 si x >= 0, -1 si x < 0}. f est definie en 0 (f(0) = 1). f est-elle continue en 0 ?
    - A) Oui, car f(0) = 1 existe — revele : confusion definie/continue
    - B) Oui, car f est definie sur R — revele : confusion globale/locale
    - C) Non, car lim_{x->0^-} f(x) = -1 != f(0) = 1 — correct
    - D) Non, car f n'est pas derivable en 0 — revele : confusion continuite/derivabilite
- **Remediation** : Insister sur les 3 conditions : f(a) existe, lim a gauche = lim a droite = f(a)

### E2 — Croire que le TVI donne l'unicite

- **Description** : L'eleve applique le TVI et conclut "il existe UNE solution" au lieu de "il existe AU MOINS UNE solution"
- **Frequence** : tres frequente
- **Source cognitive** : L'eleve ne distingue pas existence et unicite. Le TVI ne garantit que l'existence.
- **Question diagnostique** :
    > f continue sur [-2, 2], f(-2) = -3, f(2) = 5. Que peut-on dire de f(x) = 0 ?
    - A) L'equation admet exactement une solution dans [-2, 2] — revele : confusion existence/unicite
    - B) L'equation admet au moins une solution dans ]-2, 2[ — correct
    - C) L'equation admet une solution en x = 0 — revele : confusion sur la localisation
    - D) On ne peut rien dire car on ne connait pas la formule de f — revele : non-comprehension du TVI
- **Remediation** : Donner un contre-exemple : f(x) = x^3 - 4x sur [-3, 3] a TROIS zeros. Le TVI prouve l'existence, la monotonie prouve l'unicite.

### E3 — Oublier de verifier les conditions pour sqrt(f)

- **Description** : L'eleve dit "sqrt(f) est continue en a car f est continue en a" sans verifier que f(a) > 0 (strictement)
- **Frequence** : frequente
- **Source cognitive** : Application mecanique du theoreme T5 sans verifier la condition f(a) > 0
- **Question diagnostique** :
    > f(x) = sqrt(x^2 - 4). f est-elle continue en x = 2 ?
    - A) Oui, car x^2 - 4 est continue et sqrt est continue — revele : oubli de la condition > 0
    - B) Oui, car f(2) = 0 existe — revele : confusion definie/continue
    - C) Non, car x^2 - 4 = 0 en x = 2, la condition f(a) > 0 n'est pas verifiee — correct (il faut une etude plus fine)
    - D) Non, car sqrt n'est pas definie pour les negatifs — revele : hors sujet
- **Remediation** : Le theoreme T5 exige f(a) > 0 (STRICTEMENT). Si f(a) = 0, il faut revenir a la definition ou etudier separement.

### E4 — Appliquer le TVI sans verifier la continuite

- **Description** : L'eleve applique le TVI a une fonction non continue sur l'intervalle, ou ignore une discontinuite
- **Frequence** : occasionnelle
- **Source cognitive** : L'hypothese de continuite du TVI est vue comme une formalite
- **Question diagnostique** :
    > f(x) = 1/x. f(-1) = -1 < 0 et f(1) = 1 > 0. Peut-on conclure que f(x) = 0 admet une solution dans [-1, 1] ?
    - A) Oui, par le TVI car f(-1) < 0 et f(1) > 0 — revele : oubli de verifier la continuite
    - B) Non, car f n'est pas continue sur [-1, 1] (f non definie en 0) — correct
    - C) Oui, car 1/x passe par toutes les valeurs — revele : intuition fausse
    - D) Non, car 1/x n'admet jamais la valeur 0 — correct aussi, mais pas la raison principale
- **Remediation** : Toujours verifier TROIS choses avant le TVI : (1) f continue sur [a,b], (2) f(a) et f(b) calcules, (3) k entre f(a) et f(b).

### E5 — Confondre continuite en un point et continuite sur un intervalle

- **Description** : L'eleve dit "f est continue" sans preciser ou (en un point ou sur un intervalle)
- **Frequence** : frequente
- **Source cognitive** : Manque de rigueur dans l'enonce. La continuite en un point est locale, la continuite sur un intervalle est globale.
- **Question diagnostique** :
    > f(x) = E(x) (partie entiere). Laquelle de ces affirmations est correcte ?
    - A) f est continue sur R — revele : confusion globale
    - B) f est continue sur ]0, 1[ — correct (pas d'entier dans l'intervalle ouvert)
    - C) f est continue en 1 — revele : la partie entiere est discontinue en tout entier
    - D) f n'est continue nulle part — revele : trop radical (f est continue entre les entiers)
- **Remediation** : E(x) est continue sur chaque intervalle ]n, n+1[ mais discontinue en tout entier n. Toujours preciser OU la fonction est continue.

### E6 — Erreur sur les bornes de l'image d'un intervalle

- **Description** : L'eleve ecrit f([a,b]) = [f(a), f(b)] sans verifier la monotonie, ou confond les bornes ouvertes/fermees
- **Frequence** : frequente
- **Source cognitive** : L'eleve suppose que f est croissante par defaut, ou ignore le cas ou f change de monotonie
- **Question diagnostique** :
    > f(x) = x^2 sur [-1, 2]. Quelle est l'image f([-1, 2]) ?
    - A) [f(-1), f(2)] = [1, 4] — revele : suppose f croissante sans verifier
    - B) [f(2), f(-1)] = [4, 1] — revele : intervalle inverse (pas un intervalle)
    - C) [0, 4] — correct (f atteint son minimum 0 en x=0)
    - D) [-1, 4] — revele : confond x et f(x)
- **Remediation** : Toujours dresser le tableau de variation de f sur I AVANT de determiner l'image. Le minimum et le maximum de f sur I donnent les bornes de f(I).
