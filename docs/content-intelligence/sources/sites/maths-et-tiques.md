# Maths et Tiques (Yvan Monka)

> Derniere mise a jour : 2026-02-07

## Meta

| Champ | Valeur |
|-------|--------|
| URL | https://www.maths-et-tiques.fr |
| Type | site-fr |
| Niveaux | 3eme, 2nde, 1ere, Term |
| Langues | fr |
| Acces | gratuit |
| Qualite | ★★★★★ |
| Derniere verification | 2026-02-07 |

## Description

Maths et Tiques est le site de reference en France pour les mathematiques du college au lycee, cree par Yvan Monka (Academie de Strasbourg). Chaque chapitre propose un cours complet (PDF/Word), des videos de methodes et demonstrations sur YouTube, des exercices corriges en video, des QCM d'auto-evaluation, et des activites/problemes ouverts. Le contenu est d'une qualite pedagogique exceptionnelle, structure par competences, et parfaitement aligne avec les programmes francais (tres proches du curriculum tunisien pour les niveaux 2nde-Terminale). La chaine YouTube associee (@YMONKA) est la plus suivie en France pour les maths.

## Instructions LLM

### Navigation

- URL de base : `https://www.maths-et-tiques.fr`
- Pattern de navigation : `/index.php/cours-maths/niveau-{niveau}`
- Sitemap : non teste
- Le site est accessible en WebFetch et en Chrome sans restriction

### Extraction de contenu

- Format principal : HTML (pages de cours avec liens PDF/videos integres)
- LaTeX : non (formules en images dans les PDF, MathJax absent du HTML)
- Methode d'extraction : WebFetch direct fonctionne. Cours en PDF dans `/telech/`. Videos YouTube liees directement.
- Contenu protege : aucun, tout est gratuit

### Patterns d'URL

- Pages par niveau :
  - 3eme : `/index.php/cours-maths/niveau-troisieme`
  - 2nde : `/index.php/cours-maths/niveau-seconde`
  - 1ere Spe : `/index.php/cours-maths/niveau-premiere`
  - 1ere Techno : `/index.php/cours-maths/niveau-premiere-tech`
  - Term Spe : `/index.php/cours-maths/niveau-terminale`
  - Term Techno : `/index.php/cours-maths/niveau-terminalet`
- Pages par theme :
  - Vecteurs/Reperage : `/index.php/cours-et-exercices-par-theme/vecteurs-reperage`
  - Trigonometrie : `/index.php/cours-et-exercices-par-theme/trigo`
  - Fonctions/Suites : `/index.php/cours-et-exercices-par-theme/fonction-suite`
  - Calcul algebrique : `/index.php/cours-et-exercices-par-theme/calcul-algebrique`
  - Geometrie : `/index.php/cours-et-exercices-par-theme/notions-de-geometrie`
  - Espace : `/index.php/cours-et-exercices-par-theme/espace`
- PDFs cours : `/telech/{code}.pdf`
  - Convention : `19{Topic}{Niveau}M.pdf` (ex: `19vecteurs1M.pdf` pour vecteurs 2nde)
  - Prefixe `19` = programme 2019
- Videos : liens YouTube directs (youtu.be ou youtube.com)

### Limites et precautions

- Le site utilise Joomla (PHP), rendu cote serveur, HTML statique — fiable pour WebFetch
- Les pages par niveau sont longues (tout le programme sur une seule page) — beaucoup de contenu a parser
- Les PDFs de cours sont generes par l'auteur — haute qualite, format uniforme
- Pas de devoirs/annales — uniquement cours, methodes, exercices corriges
- Contenu aligne sur le programme francais (2019), pas specifiquement tunisien — mais les fondamentaux mathematiques sont identiques

## Ressources par module

### Mapping programme francais → curriculum tunisien

Le programme francais ne correspond pas 1:1 au tunisien, mais les recouvrements sont tres importants :

| Notre module (1ere-tc) | Equivalent francais | Niveau |
|-------------------------|---------------------|--------|
| `angles` | Pas de chapitre dedie (inclus dans Thales/Trigo 3eme) | 3eme |
| `thales` | Theoreme de Thales | 3eme |
| `trigo` | Trigonometrie (dans le triangle rectangle) | 3eme |
| `vt` | Les Vecteurs (chapitre 1) + Transformations | 2nde / 3eme |
| `sv` | Les Vecteurs (chapitre 2 — somme, Chasles) | 2nde |
| `repere` | Vecteurs et Reperage | 2nde |
| `qt` | Transformations (rotations) | 3eme |
| `ss` | Espace (sections de solides) | 3eme |
| `num1` | Fractions, Puissances, Racines Carrees | 2nde |
| `num2` | Nombres Reels | 2nde |
| `algebre` | Calcul Litteral (developpement, factorisation) | 2nde / 3eme |
| `fl` | Fonctions Affines (partie lineaire) | 3eme |
| `fa` | Fonctions Affines | 3eme |
| `ei` | Equations, Inequations | 2nde / 3eme |
| `sys` | Systemes d'Equations et Droites | 2nde |
| `stat` | Statistiques Descriptives | 2nde |

### thales — Theoreme de Thales

#### Cours
- [cours] /telech/19Thales_3e.pdf
  Cours complet theoreme de Thales et sa reciproque. Format: pdf.

#### Videos
- [video] Methodes en video : appliquer Thales direct, appliquer la reciproque, calculer une longueur
- [video] Demonstrations : theoreme direct et reciproque

#### Exercices
- [exercice] Exercices corriges en video (6+ videos)
- [qcm] QCM d'auto-evaluation Thales

### trigo — Trigonometrie (triangle rectangle)

#### Cours
- [cours] /telech/19Trigo_3e.pdf
  Cours trigonometrie dans le triangle rectangle (cos, sin, tan). Format: pdf.

#### Videos
- [video] Methodes : calculer un angle, calculer une longueur, utiliser cos/sin/tan
- [video] Exercices corriges en video (8+ videos)
- [qcm] QCM trigonometrie

### vt — Vecteurs et translations

#### Cours (2nde)
- [cours] /telech/19vecteurs1M.pdf
  Vecteurs chapitre 1 : definition, egalite, somme. Format: pdf.
- [cours] /telech/19vecteurs2M.pdf
  Vecteurs chapitre 2 : coordonnees, norme, milieu. Format: pdf.

#### Cours (3eme)
- [cours] Transformations — inclut les translations

#### Videos
- [video] 10+ methodes video : translation, vecteurs egaux, relation de Chasles, colinearite
- [qcm] QCM vecteurs

### sv — Somme de vecteurs

Inclus dans le chapitre Vecteurs 2nde (voir vt ci-dessus).
- [video] Methodes : somme de vecteurs, relation de Chasles, difference de vecteurs

### repere — Reperage dans le plan

#### Cours
- [cours] /telech/19vecteurs3M.pdf
  Vecteurs et reperage : coordonnees dans un repere, milieu, distance. Format: pdf.

#### Videos
- [video] 14+ methodes video : lire des coordonnees, calculer coordonnees d'un vecteur, tester colinearite, milieu, distance
- [qcm] QCM reperage

### num1 — Calcul numerique (puissances, racines)

#### Cours
- [cours] /telech/19RacPuissM.pdf
  Fractions, puissances, racines carrees. Format: pdf.

#### Videos
- [video] Methodes : simplifier racines, puissances, operations sur fractions
- [video] Exercices corriges video

### num2 — Nombres reels

#### Cours
- [cours] /telech/19NombresReels1M.pdf
  Nombres reels chapitre 1 : ensembles de nombres, intervalles. Format: pdf.
- [cours] /telech/19NombresReels2M.pdf
  Nombres reels chapitre 2 : valeur absolue, encadrements. Format: pdf.

### algebre — Calcul algebrique

#### Cours (2nde)
- [cours] /telech/19Calc_algebriqueM.pdf
  Calcul litteral : developpement, factorisation, identites remarquables. Format: pdf.

#### Cours (3eme)
- [cours] /telech/19Dev3e.pdf — Developpements
- [cours] /telech/19Facto3e.pdf — Factorisations

#### Videos
- [video] Methodes : developper, factoriser, identites remarquables (a+b)², (a-b)², (a+b)(a-b)

### fl — Fonctions lineaires

Inclus dans Fonctions Affines 3eme (la fonction lineaire est un cas particulier).

### fa — Fonctions affines

#### Cours
- [cours] /telech/19FonctAffines1_3e.pdf
  Fonctions affines chapitre 1. Format: pdf.
- [cours] /telech/19FonctAffines2_3e.pdf
  Fonctions affines chapitre 2. Format: pdf.

#### Videos
- [video] Methodes : determiner expression, representation graphique, coefficient directeur

### ei — Equations et inequations

#### Cours (2nde)
- [cours] /telech/19Equations_InequationsM.pdf
  Equations et inequations du premier degre. Format: pdf.
- [cours] /telech/19Equations_InequationsM2.pdf
  Equations-produits, equations-quotients, tableaux de signes. Format: pdf.

#### Cours (3eme)
- [cours] /telech/19Equations_3e.pdf
  Equations du premier degre. Format: pdf.

#### Videos
- [video] Methodes : resoudre equation, inequation, equation-produit, tableau de signes
- [qcm] QCM equations / inequations

### sys — Systemes d'equations

#### Cours
- [cours] /telech/19Droites_SystemesM.pdf
  Systemes d'equations et droites. Format: pdf.

#### Videos
- [video] Methodes : resolution par substitution, combinaison lineaire, interpretation graphique

### stat — Statistiques descriptives

#### Cours
- [cours] /telech/19StatM.pdf
  Statistiques descriptives : moyenne, mediane, etendue, ecart-type. Format: pdf.

#### Videos
- [video] Methodes + tutoriels calculatrices (TI, CASIO, HP)

### ss — Sections de solides (Espace 3eme)

#### Cours
- [cours] Espace 3eme : sections planes, patron, volumes

#### Videos
- [video] Methodes : construire une section, calculer un volume

### qt — Quart de tour (Rotations)

Inclus dans le chapitre Transformations 3eme. Pas de chapitre dedie au quart de tour.

## Ressources avancees (3eme-math / term-math)

### Premiere Specialite
- **Second degre** : 2 cours PDF, methodes video, demonstrations, exercices corriges
- **Suites** : 2 cours PDF (generalites + arithmetiques/geometriques), methodes video
- **Derivation** : 3 cours PDF, methodes completes, exercices BAC
- **Exponentielle** : 1 cours PDF, methodes video
- **Trigo (fonctions)** : 2 cours PDF, methodes, demonstrations
- **Produit scalaire** : 2 cours PDF, methodes video
- **Geometrie reperee** : 1 cours PDF
- **Probabilites conditionnelles** : 1 cours PDF
- **Variables aleatoires** : 1 cours PDF

### Terminale Specialite
- **Suites** : 2 cours PDF (recurrence, limites, convergence)
- **Limites de fonctions** : 2 cours PDF
- **Derivation** : 1 cours PDF (fonctions composees)
- **Continuite** : 1 cours PDF (TVI, dichotomie)
- **Convexite** : 1 cours PDF
- **Logarithme neperien** : 2 cours PDF
- **Fonctions trigo** : 1 cours PDF
- **Primitives et equations differentielles** : 1 cours PDF
- **Calcul integral** : 2 cours PDF
- **Denombrement** : 1 cours PDF
- **Vecteurs/Droites/Plans espace** : 1 cours PDF
- **Orthogonalite espace** : 1 cours PDF
- **Representations parametriques** : 1 cours PDF
- **Loi binomiale** : 1 cours PDF
- **Loi des grands nombres** : 2 cours PDF

## Modules non-mappes

Les chapitres suivants n'ont pas d'equivalent direct dans notre curriculum actuel :

- **Triangles semblables** (3eme) — concept lie a Thales mais traite separement
- **Convexite** (Terminale) — pas dans notre programme
- **Loi des grands nombres** (Terminale) — pas dans notre programme
- **Echantillonnage** (2nde) — pas dans notre programme
- **Information chiffree** (2nde) — proportionnalite, pourcentages

## Volume estime

| Niveau | PDFs cours | Videos | Total estime |
|--------|-----------|--------|--------------|
| 3eme | ~52 | ~211 | ~263 |
| 2nde | ~52 | ~315 | ~367 |
| 1ere Spe | ~49 | ~316 | ~365 |
| Terminale | ~50+ | ~300+ | ~350+ |
| **Total** | **~200+** | **~1100+** | **~1300+** |

## Historique des scans

| Date | Action | Notes |
|------|--------|-------|
| 2026-02-07 | Scan initial | Site accessible en WebFetch + Chrome. Qualite exceptionnelle. ~200 PDF cours + ~1100 videos YouTube. Reference pedagogique #1 pour le contenu francophone. |
