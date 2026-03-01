# Referentiel de redaction mathematique — Programme tunisien (Lycee)

> Source de verite pour la redaction du contenu pedagogique en mathematiques.
> Extrait des trois sources officielles du module de continuite (3eme Maths) :
> Manuel scolaire T1, Parascolaire Analyse, XY Plus T1.
> A enrichir au fur et a mesure avec d'autres modules.

---

## 1. Vocabulaire standard

### Ouvertures de definitions et theoremes

| Forme correcte | A eviter |
|---|---|
| "Soit $f$ une fonction **definie** sur un intervalle $I$" | "Considerons une fonction..." |
| "Soit $a$ un reel de $I$" | "Soit $a$ un element de $I$" |
| "Soit $f$ et $g$ deux fonctions definies sur $I$" | "Soient les fonctions $f$ et $g$..." |
| "On dit que $f$ est **continue en $a$**" | "La fonction $f$ est dite continue..." (acceptable mais moins courant) |
| "Soit $a$ et $b$ deux reels de $I$ tels que $a < b$" | "Pour $a < b$ dans $I$..." |

### Termes normalises

| Terme | Usage |
|---|---|
| **ensemble de definition** | Toujours (jamais "domaine de definition") |
| **reel** | Pour designer un nombre ($a$ un reel, $k$ un reel) |
| **fonction polynome** | Pas "polynomiale" (le Manuel et le Parascolaire ecrivent "fonction polynome") |
| **fonction rationnelle** | Standard |
| **partie entiere** | Notee $E(x)$, jamais $\lfloor x \rfloor$ |
| **valeur absolue** | Notee $\|x\|$ |
| **repere orthonorme** | Toujours nomme $(O, \vec{i}, \vec{j})$ |
| **courbe representative** | Notee $C_f$, $\mathcal{C}_f$ ou $\zeta_f$ selon la source |

### Formulations recurrentes

- "en tout reel $a$" (pour la continuite des fonctions usuelles)
- "en tout reel ou elle est definie" (pour les rationnelles)
- "en particulier sur $[a, b]$" (pour restreindre un domaine)
- "D'ou $f$ est continue en $a$" (conclusion standard)
- "Par suite..." / "Finalement..." (enchainements)

---

## 2. Notation mathematique

### Nombres decimaux

Virgule decimale avec espace fin en LaTeX : `$0{,}1$` → $0{,}1$

Jamais le point decimal : ~~`$0.1$`~~

### Fractions

- **En ligne dans le texte** : `$\dfrac{a}{b}$` (display fraction, plus lisible)
- **En bloc $$ ... $$** : `$\frac{a}{b}$` suffit

### Ensembles

| Notation | Signification |
|---|---|
| $\mathbb{R}$ | Ensemble des reels |
| $\mathbb{R}^*$ | Reels non nuls |
| $\mathbb{R}_+$ | Reels positifs |
| $\mathbb{R}_+^*$ | Reels strictement positifs |
| $\mathbb{Z}$ | Entiers relatifs |
| $\mathbb{N}$ | Entiers naturels |

### Intervalles

- Crochets francais : $[a, b]$, $]a, b[$, $[a, b[$, $]a, b]$
- Jamais la notation anglo-saxonne avec parentheses : ~~$(a, b)$~~ pour un intervalle ouvert
- Infinis : $]-\infty, a]$, $[a, +\infty[$

### Fonctions speciales

| Objet | Notation |
|---|---|
| Partie entiere | $E(x)$ |
| Valeur absolue | $\|x\|$, $\|f(x)\|$ |
| Racine composee | $\sqrt{f}$ (pas $\sqrt{f(x)}$ dans les theoremes, mais $\sqrt{f(x)}$ dans les calculs) |
| Image d'un ensemble | $f(A) = \{f(x) \; ; \; x \in A\}$ |
| Courbe | $C_f$, $\mathcal{C}_f$, ou $\zeta_f$ |
| Repere | $(O, \vec{i}, \vec{j})$ |

### Quantificateurs (definition formelle)

La convention tunisienne utilise $\alpha$ et $\beta$ (pas $\varepsilon$ et $\delta$) :

> Pour tout $\beta > 0$, il existe $\alpha > 0$ tel que si $x \in I$ et $|x - a| < \alpha$, alors $|f(x) - f(a)| < \beta$.

---

## 3. Structure des exercices

### Types d'atomes

| Type | Description |
|---|---|
| **lesson** | Cours : definitions, theoremes, proprietes, exemples/activites |
| **exercise** | Exercice avec enonce + solution |
| **qcm** | Question a choix multiples (3-4 options) |

### Verbes d'action (consignes)

Les verbes sont normalises et chacun implique un niveau de rigueur attendu :

| Verbe | Signification | Niveau de rigueur |
|---|---|---|
| **Justifier** | Appliquer un theoreme connu, citer la regle | Citation + verification des hypotheses |
| **Montrer que** | Demonstration ou preuve d'existence | Raisonnement complet |
| **Determiner** | Calculer un resultat precis | Calcul + resultat explicite |
| **Etudier** | Analyse ouverte (continuite, variations...) | Methodique, cas par cas |
| **Tracer** | Representation graphique | Courbe avec repere |
| **Verifier** | Confirmer un resultat donne | Calcul de verification |
| **En deduire que** | Enchainement logique depuis un resultat precedent | Reference explicite au resultat |
| **Resoudre** | Trouver toutes les solutions | Solutions + ensemble |
| **Calculer** | Effectuer un calcul numerique | Resultat exact |

### Numerotation des questions

```
1. Question principale
   a. Sous-question
   b. Sous-question
2. Question principale
3. ...
```

### Categories de difficulte

| Categorie | Difficulte | Description |
|---|---|---|
| **application** | 1 | Application directe d'un theoreme unique |
| **approfondissement** | 2 | Combinaison de 2-3 notions |
| **synthese** | 3 | Etude complete multi-etapes |

---

## 4. Patterns de redaction des solutions

### Justification de continuite

Le schema est toujours le meme, en 2-3 phrases :

1. **Identifier le type** de la fonction (polynome, rationnelle, racine, valeur absolue, composee)
2. **Citer le theoreme** applicable
3. **Verifier les conditions** (domaine, positivite, denominateur non nul)
4. **Conclure** : "D'ou $f$ est continue en $a$."

#### Exemples-types

**Polynome :**
> $f$ est une fonction polynome donc continue sur $\mathbb{R}$, en particulier en $a$.

**Rationnelle :**
> $f$ est une fonction rationnelle. Le denominateur $x - 4$ ne s'annule pas en $a = 0{,}7$, donc $f$ est continue en $a$.

**Racine :**
> La fonction $u : x \mapsto 3x + 5$ est polynome donc continue en $a = \dfrac{2}{3}$. De plus $u\left(\dfrac{2}{3}\right) = 7 > 0$. Donc $f = \sqrt{u}$ est continue en $a$.

**Valeur absolue :**
> La fonction $g : x \mapsto x^2 - 3x + 2$ est polynome donc continue sur $\mathbb{R}$. D'ou $f = |g|$ est continue sur $\mathbb{R}$.

**Operations (somme/produit/quotient) :**
> $f_1$ et $f_2$ sont continues en $a$ et $f_2(a) \neq 0$. Donc $f = \dfrac{f_1}{f_2}$ est continue en $a$.

**Discriminant pour la positivite :**
> $\Delta = 9 - 20 = -11 < 0$ et le coefficient dominant $a = 1 > 0$, donc $x^2 + 3x + 5 > 0$ pour tout $x \in \mathbb{R}$.

### Continuite par morceaux

Schema standard :

1. Etudier la continuite sur chaque morceau separement (fonctions usuelles)
2. Aux points de raccordement $x_0$ : comparer $f(x_0)$, $\lim_{x \to x_0^-} f(x)$ et $\lim_{x \to x_0^+} f(x)$
3. Si egalite des trois : continue en $x_0$. Sinon : discontinue (saut).

Formulation-type :
> En $x = a$ : $\lim_{x \to a^-} f(x) = ... \neq f(a) = ...$, donc $f$ n'est pas continue en $a$.

### Application du TVI

Le patron est identique dans les trois sources :

```
$f$ est une fonction polynome donc continue sur $\mathbb{R}$,
en particulier sur $[a, b]$.

$f(a) = ... > 0$ et $f(b) = ... < 0$.

$f(a) \times f(b) = ... < 0$.

D'apres le TVI, il existe au moins un $c \in ]a, b[$
tel que $f(c) = 0$.
```

Variante pour $f(x) = k$ (pas zero) :
> $k$ est compris entre $f(a)$ et $f(b)$. D'apres le TVI, il existe au moins un $c \in [a, b]$ tel que $f(c) = k$.

### Unicite (TVI + monotonie)

> De plus, $f$ est strictement croissante sur $[a, b]$, donc la solution est **unique**.

### Nombre exact de solutions (polynome de degre $n$)

Schema :
1. Trouver $n$ solutions par le TVI dans des intervalles **disjoints**
2. Argument : "un polynome de degre $n$ a au plus $n$ racines reelles"
3. Conclusion : "donc exactement $n$ solutions"

### Images d'intervalles

Methode systematique :
1. Identifier les variations de $f$ sur l'intervalle (croissante/decroissante)
2. Si monotone : $f([a,b]) = [f(a), f(b)]$ ou $[f(b), f(a)]$
3. Si changement de monotonie : reperer le min/max atteint sur l'intervalle
4. Attention aux bornes ouvertes/fermees (atteintes ou non)

### Dichotomie (valeur approchee)

Schema :
> $f(0{,}6) > 0$ et $f(0{,}7) < 0$, donc $\alpha \in [0{,}6 \; ; \; 0{,}7]$.

Precision demandee : generalement $10^{-1}$ ou $10^{-2}$.

---

## 5. Structuration des cours (lessons)

### Approche du Manuel scolaire

Le Manuel suit un schema pedagogique precis :

1. **Activite** introductive (situation concrete, graphique, ou calcul guide)
2. **Definition** ou **Theoreme** (encadre, formulation rigoureuse)
3. **Activite** d'application (exemples resolus)
4. Repetition du cycle pour chaque notion

Les activites sont numerotees par section : "Activite 1", "Activite 2", etc.

### Approche du Parascolaire

Plus condense :
1. **Resume** direct (definition + theoreme, sans activite motivante)
2. **Tableau** recapitulatif (fonctions usuelles continues)
3. **Exemples** intercales (courts, 3-4 lignes)

### Approche XY Plus

Le plus concis :
1. **Resume** ultra-compact (1-2 pages pour tout le module)
2. Enchainement rapide des theoremes sans activites
3. Exercices corriges plus elabores que le cours

### Blocs de cours (directives MDX)

| Directive | Usage |
|---|---|
| `:::definition[Titre]` | Definitions formelles |
| `:::theorem[Titre]` | Theoremes et resultats admis |
| `:::property[Titre]` | Proprietes et consequences |
| `:::remark[Titre]` | Remarques, mises en garde |
| `:::example[Titre]` | Exemples et activites |
| `:::attention` | Pieges courants |

---

## 6. Conventions graphiques (Typst/CeTZ)

### Axes et repere

- Axes avec fleches : `mark: (end: ">", fill: black)`
- Labels : $x$ en bout d'axe horizontal, $y$ en bout d'axe vertical
- Origine : $O$ en bas a gauche de l'intersection
- Graduations : traits courts `line((x, -0.1), (x, 0.1))`

### Courbes

- **Fonctions analytiques** : `cetz-plot` avec `plot.add(domain: (...), x => ..., style: (stroke: 2pt + blue))`
- **Courbes manuelles** (morceaux, discontinuites) : `cetz` canvas avec `line()`, `bezier()`, `circle()`
- Couleur principale : **blue** (stroke `1.5pt + blue` ou `2pt + blue`)

### Points remarquables

- **Point plein** (valeur atteinte) : `circle((x, y), radius: 0.07, fill: blue, stroke: 1pt + blue)`
- **Point vide** (valeur non atteinte) : `circle((x, y), radius: 0.07, fill: white, stroke: 1pt + blue)`
- **Point d'interet** (intersection, extremum) : `fill: red, stroke: red`

### Discontinuites

- Lignes en pointilles gris : `stroke: (dash: "dashed", paint: gray)`
- Traits verticaux reliant les deux branches aux points de saut

### Tableaux de variations

- Package : `vartable:0.2.3`
- Ligne de variation : `("v")`, ligne de signe : `("s")`
- Valeurs : `(top, $val$)` pour maximum, `(bottom, $val$)` pour minimum

---

## 7. Regles d'ecriture specifiques

### Accents

Tous les contenus doivent avoir les accents francais corrects :
- definie, theoreme, reel, intermediaire, polynome, decroissante, etc.

Note : les fichiers existants du Manuel scolaire n'ont pas d'accents (heritage historique).
Les fichiers XY Plus et Parascolaire recents ont les accents.
**Convention a suivre : avec accents.**

### Ponctuation mathematique

- Pas de point final apres une formule en bloc `$$...$$`
- Point final apres la derniere phrase qui precede un bloc de formule
- Deux-points avant une liste a puces
- Virgule entre les conditions d'un theoreme

### Formulations a eviter

| A eviter | Correct |
|---|---|
| "On a donc le theoreme suivant" | "On a donc obtenu le theoreme ci-dessous" |
| "Il est evident que..." | (supprimer, aller droit au calcul) |
| "Trivialement..." | (supprimer) |
| "$\forall$", "$\exists$" dans le texte | Ecrire en toutes lettres : "pour tout", "il existe" |
| "CQFD" | (pas utilise dans le programme tunisien) |
