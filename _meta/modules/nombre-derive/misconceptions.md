# Misconceptions — Nombre derive

Module: nombre-derive
Programme: 3eme-math

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
