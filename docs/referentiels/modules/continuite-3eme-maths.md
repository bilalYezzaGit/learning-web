# Referentiel Module — Continuite (3eme Maths)

> Referentiel specifique au chapitre de continuite du programme tunisien de 3eme annee Mathematiques.
> Extrait des trois sources : Manuel scolaire T1 (p.23-37), Parascolaire Analyse (p.26-34), XY Plus T1 (p.15-25).

---

## 1. Hierarchie des notions (ordre du programme)

Le chapitre de continuite suit un ordre precis, commun aux trois sources :

### Bloc 1 — Continuite en un point

| # | Notion | Mot-cle |
|---|--------|---------|
| 1 | Definition formelle ($\alpha$-$\beta$) | `definition-formelle` |
| 2 | Interpretation graphique (trace continu vs saut) | `graphique` |
| 3 | Fonctions usuelles continues | `fonctions-usuelles` |
| 4 | Continuite de $\|f\|$ | `valeur-absolue` |
| 5 | Operations algebriques ($f+g$, $fg$, $kf$, $1/f$, $f/g$) | `operations` |
| 6 | Continuite de $\sqrt{f}$ | `racine` |

### Bloc 2 — Continuite sur un intervalle

| # | Notion | Mot-cle |
|---|--------|---------|
| 7 | Continuite a droite / a gauche | `droite-gauche` |
| 8 | Continuite sur un intervalle (4 cas) | `intervalle` |
| 9 | Consequences : polynomes et rationnelles sur tout intervalle | `consequences` |

### Bloc 3 — Image et TVI

| # | Notion | Mot-cle |
|---|--------|---------|
| 10 | Image d'un intervalle par une fonction continue | `image-intervalle` |
| 11 | TVI — existence ($f(x) = k$ admet au moins une solution) | `tvi` |
| 12 | Corollaire des zeros ($f(a) \times f(b) < 0$) | `tvi-zeros` |
| 13 | TVI + monotonie stricte — unicite | `tvi-unicite` |
| 14 | Methode de dichotomie | `dichotomie` |

### Notion hors programme strict (Manuel uniquement)

| Notion | Statut |
|--------|--------|
| Prolongement par continuite | Present dans le Manuel comme "Rappel", absent du Parascolaire et XY Plus |

---

## 2. Fonctions usuelles continues (liste exhaustive)

La liste est identique dans les trois sources :

| Fonction | Continue en | Domaine de continuite |
|----------|-------------|----------------------|
| $x \mapsto c$ (constante) | tout reel $a$ | $\mathbb{R}$ |
| $x \mapsto x$ | tout reel $a$ | $\mathbb{R}$ |
| $x \mapsto ax$ (lineaire) | tout reel $a$ | $\mathbb{R}$ |
| $x \mapsto ax + b$ (affine) | tout reel $a$ | $\mathbb{R}$ |
| $x \mapsto x^2$ | tout reel $a$ | $\mathbb{R}$ |
| Toute fonction polynome | tout reel $a$ | $\mathbb{R}$ |
| $x \mapsto \dfrac{1}{x}$ | tout reel non nul $a$ | $\mathbb{R}^*$ |
| Toute fonction rationnelle | tout reel ou elle est definie | $D_f$ |
| $x \mapsto \sqrt{x}$ | tout reel strictement positif $a$ | $\mathbb{R}_+^*$ (continue a droite en $0$) |

**Remarque** : La convention tunisienne enonce ces resultats comme **admis** (sans demonstration).

---

## 3. Theoremes du module (formulations exactes)

### T1 — Continuite de |f|

> Soit $f$ une fonction definie sur un intervalle ouvert $I$ et $a$ un reel de $I$.
> Si $f$ est continue en $a$, alors $|f|$ est continue en $a$.

**Prerequis de la demonstration** (Manuel uniquement) :
$\big||c| - |d|\big| \leq |c - d|$ (inegalite triangulaire inverse).

### T2 — Operations

> Soit $f$ et $g$ deux fonctions definies sur un intervalle ouvert $I$, $a$ un reel de $I$ et $k$ un reel.
> - Si $f$ et $g$ sont continues en $a$ alors $f + g$, $fg$ et $kf$ sont continues en $a$.
> - Si $f$ est continue en $a$ et si $f(a) \neq 0$ alors $\dfrac{1}{f}$ est continue en $a$.
> - Si $f$ et $g$ sont continues en $a$ et si $g(a) \neq 0$ alors $\dfrac{f}{g}$ est continue en $a$.

### T3 — Continuite de sqrt(f)

> Soit $f$ une fonction definie et positive sur un intervalle ouvert $I$ et $a$ un reel de $I$.
> Si $f$ est continue en $a$, alors $\sqrt{f}$ est continue en $a$.

### T4 — Equivalence droite-gauche

> Soit $f$ une fonction definie sur un intervalle ouvert contenant $a$.
> $f$ est continue en $a$ si et seulement si $f$ est continue a droite et a gauche en $a$.

### T5 — sqrt(f) et continuite laterale

> Soit $f$ definie et positive sur $I$ et $a \in I$.
> - Si $f$ est continue a droite en $a$, alors $\sqrt{f}$ est continue a droite en $a$.
> - Si $f$ est continue a gauche en $a$, alors $\sqrt{f}$ est continue a gauche en $a$.

### T6 — Image d'un intervalle

> L'image d'un intervalle par une fonction continue est un intervalle.

**Remarque** : La continuite est une condition **suffisante** mais pas necessaire.

### T7 — TVI

> Soit $f$ une fonction definie et continue sur un intervalle $I$, $a$ et $b$ deux reels de $I$ tels que $a < b$.
> Pour tout reel $k$ compris entre $f(a)$ et $f(b)$, l'equation $f(x) = k$ possede **au moins une** solution dans $[a, b]$.

### T7bis — Corollaire des zeros

> Si $f$ est continue sur $[a, b]$ et $f(a) \cdot f(b) < 0$, alors il existe au moins un $c \in ]a, b[$ tel que $f(c) = 0$.

### T8 — TVI + monotonie (unicite)

> Si $f$ est continue et strictement monotone sur $[a, b]$, alors pour tout $k$ compris entre $f(a)$ et $f(b)$, l'equation $f(x) = k$ admet une **unique** solution dans $[a, b]$.

---

## 4. Types de questions et patterns de redaction

### Type A — Justifier la continuite en un point

**Consigne-type** : "Justifier que $f$ est continue en $a$."

**Schema de reponse** :
```
1. Identifier le type de f (polynome, rationnelle, racine, |·|, composee)
2. Citer le theoreme applicable
3. Verifier les hypotheses (domaine, positivite, denominateur)
4. Conclure : "D'ou f est continue en a."
```

**Fonctions typiques rencontrees** :
- Polynomes simples : $f(x) = -2x^3 + 4x^2 - 1$
- Rationnelles : $f(x) = \dfrac{x + 2}{x - 4}$
- Racines composees : $f(x) = \sqrt{4x^2 - 4x - 3}$
- Valeurs absolues composees : $f(x) = \dfrac{|x - 3|}{|x^2 - 1|}$
- Combinaisons : $f(x) = \dfrac{\sqrt{2x - 1}}{x - 1}$

**Astuce discriminant** : Quand la fonction sous la racine est un trinome, verifier $\Delta < 0$ et $a > 0$ pour prouver la positivite sur $\mathbb{R}$.

---

### Type B — Justifier la continuite sur $\mathbb{R}$ (ou un intervalle)

**Consigne-type** : "Justifier que $f$ est continue sur $\mathbb{R}$."

**Schema de reponse** :
```
1. Decomposer f en operations sur des fonctions continues connues
2. Pour chaque composante, citer le theoreme de continuite
3. Appliquer les theoremes de stabilite (somme, produit, quotient, |·|, sqrt)
4. Conclure sur le domaine demande
```

**Particularite** : Pour les rationnelles definies partout, montrer que le denominateur ne s'annule jamais ($\Delta < 0$).

---

### Type C — Fonction par morceaux

**Consigne-type** : "Tracer $\mathcal{C}_f$. Justifier graphiquement que $f$ n'est pas continue sur $\mathbb{R}$."

**Schema de reponse** :
```
1. Pour chaque morceau : identifier le type de fonction, conclure a la continuite
2. Aux points de raccordement x_0 :
   - Calculer f(x_0) (valeur effective)
   - Calculer lim_{x -> x_0^-} f(x) (limite a gauche)
   - Calculer lim_{x -> x_0^+} f(x) (limite a droite)
3. Si les trois sont egaux : continue. Sinon : discontinue (saut).
```

**Fonctions par morceaux typiques** :
- 2 morceaux : affine + racine (saut typique a la jonction)
- 3 morceaux : affine + polynome + racine
- Partie entiere : $E(x)$ ou $x - E(x)$ (discontinuite a chaque entier)
- Valeur absolue developpee : $|ax + b|$ → 2 morceaux affines

**Graphe** : Utiliser des points pleins (valeur atteinte) et vides (valeur non atteinte) aux jonctions.

---

### Type D — Images d'intervalles

**Consigne-type** : "Determiner les images par $f$ des intervalles $I$, $J$, $K$."

**Schema de reponse** :
```
1. Identifier les variations de f sur l'intervalle (tableau de variations)
2. Si f monotone sur l'intervalle :
   - Croissante : f([a,b]) = [f(a), f(b)]
   - Decroissante : f([a,b]) = [f(b), f(a)]
3. Si changement de monotonie :
   - Reperer le min et le max atteints sur l'intervalle
   - f(I) = [min, max]
4. Attention aux bornes ouvertes/fermees
```

**Fonctions typiques** : trinomes ($x^2 - 4x + 1$), cubes ($x^3$), racines ($\sqrt{x+3} - 2$), rationnelles ($-2/(x-1)$).

---

### Type E — TVI (existence)

**Consigne-type** : "Montrer que l'equation $f(x) = 0$ admet au moins une solution dans $[a, b]$."

**Schema de reponse (patron exact)** :
```
$f$ est une fonction polynome donc continue sur $\mathbb{R}$,
en particulier sur $[a, b]$.

$f(a) = ... > 0$ (ou $< 0$)
$f(b) = ... < 0$ (ou $> 0$)

$f(a) \times f(b) = ... < 0$

D'apres le TVI, il existe au moins un $c \in ]a, b[$
tel que $f(c) = 0$.
```

**Variante $f(x) = k$** :
```
$k$ est compris entre $f(a)$ et $f(b)$.
D'apres le TVI, il existe au moins un $c \in [a, b]$ tel que $f(c) = k$.
```

**Point critique** : Toujours justifier la continuite AVANT d'appliquer le TVI.

---

### Type F — TVI (unicite)

**Consigne-type** : "Montrer que l'equation $f(x) = 0$ admet une unique solution."

**Schema supplementaire** :
```
De plus, $f$ est strictement [croissante/decroissante] sur $[a, b]$,
donc la solution est unique.
```

---

### Type G — Dichotomie

**Consigne-type** : "Donner une valeur approchee a $10^{-1}$ pres de $\alpha$."

**Schema de reponse** :
```
On subdivise $[a, b]$ en sous-intervalles de longueur $10^{-1}$ :
$f(a_1) = ... > 0$ et $f(a_2) = ... < 0$
Donc $\alpha \in [a_1 ; a_2]$.
```

**Precisions typiques demandees** : $10^{-1}$, $10^{-2}$.
**Vocabulaire** : "valeur approchee **par defaut**" (borne inferieure de l'encadrement).

---

### Type H — Nombre exact de solutions

**Consigne-type** : "Montrer que l'equation $f(x) = 0$ admet exactement $n$ solutions."

**Schema de reponse** :
```
1. Par le TVI, trouver n solutions dans n intervalles DISJOINTS
2. Argument : "f(x) = 0 est une equation de degre n,
   donc elle admet au plus n solutions"
3. Conclusion : "donc exactement n solutions"
```

---

### Type I — Etude complete

**Consigne-type** : "Etudier $f$. Dresser le tableau de variations. Determiner les images d'intervalles. Montrer que $f(x) = 0$ admet une unique solution."

**Structure** :
1. Domaine de definition
2. Continuite (justification)
3. Variations (sans derivee en 3eme Maths — argument par comparaison directe)
4. Tableau de variations
5. Images d'intervalles
6. TVI + unicite
7. Encadrement par dichotomie
8. (Optionnel) Tableau de signe

---

## 5. Fonctions-pieges recurrentes

### Partie entiere $E(x)$

- **Discontinue** en tout entier $n$ : $\lim_{x \to n^-} E(x) = n - 1 \neq n = E(n)$
- **Continue a droite** en tout entier : $\lim_{x \to n^+} E(x) = n = E(n)$
- **Continue** sur chaque intervalle $[n, n+1[$
- Exercice classique : $f(x) = x - E(x)$ (partie fractionnaire) → dents de scie

### Fonctions avec saut a la jonction

Cas typique : $f(x) = \sqrt{2x - 4}$ si $x \geq 2$ et $f(x) = x$ si $x < 2$.
- $f(2) = 0$ mais $\lim_{x \to 2^-} f(x) = 2$ → saut de 2.

### Contre-exemple du TVI

Le TVI est **faux** sans continuite. Exemple : la partie entiere saute de $0$ a $1$ sans prendre les valeurs intermediaires.

---

## 6. Differences entre les trois sources

| Aspect | Manuel scolaire | Parascolaire | XY Plus |
|--------|----------------|--------------|---------|
| **Approche pedagogique** | Activite → Theoreme → Activite | Resume → Tableau → Exercices | Resume condense → Exercices |
| **Definition formelle** | $\alpha$-$\beta$ complete avec demonstration | $\alpha$-$\beta$ avec exemple resolu | Mentionnee sans detail |
| **Notation courbe** | $C_f$, $\mathcal{C}_f$ | $\zeta$, $\zeta_f$ | $\mathcal{C}_f$, $\mathcal{C}$ |
| **Exercices geometriques** | Oui (distances AM+BM, carre ABCD) | Non | Non |
| **Prolongement par continuite** | Oui (section dediee) | Non | Non |
| **Composition $g \circ f$** | Mentionnee dans le rappel | Absente | Absente |
| **Nombre d'exercices TVI** | ~8 | ~6 | ~2 |
| **Nombre de lecons** | 11 atomes | 3 atomes | 3 atomes |
| **Nombre d'exercices** | ~20 atomes | ~14 atomes | ~7 atomes |
| **Nombre de QCM** | ~12 atomes | ~8 atomes | 0 |

### Richesse relative

- Le **Manuel** est la reference la plus complete et la plus rigoureuse.
- Le **Parascolaire** est le plus procedural (patterns de resolution clairs).
- Le **XY Plus** a les exercices les plus techniques (compositions complexes).

---

## 7. Tags specifiques au module

Tags utilises dans les atomes de continuite :

| Tag | Description |
|-----|-------------|
| `continuite` | Tag principal du module |
| `definition` | Definition en un point |
| `definition-formelle` | Definition $\alpha$-$\beta$ |
| `graphique` | Lecture graphique |
| `fonctions-usuelles` | Polynomes, rationnelles, etc. |
| `valeur-absolue` | Continuite de $\|f\|$ |
| `operations` | $f+g$, $fg$, $f/g$ |
| `racine` | Continuite de $\sqrt{f}$ |
| `droite-gauche` | Continuite laterale |
| `intervalle` | Continuite sur un intervalle |
| `image-intervalle` | $f(I)$ est un intervalle |
| `tvi` | Theoreme des valeurs intermediaires |
| `dichotomie` | Methode de dichotomie |
| `morceaux` | Fonctions par morceaux |
| `partie-entiere` | Fonction $E(x)$ |
| `trinome` | Exercices avec $ax^2 + bx + c$ |
| `cube` | Exercices avec $x^3$ |

### Tags de source

| Tag | Source |
|-----|--------|
| `manuel` | Manuel scolaire T1 |
| `parascolaire` | Parascolaire Analyse |
| `xy-plus` | XY Plus T1 |
