# Bibm@th.net

> Derniere mise a jour : 2026-02-07

## Meta

| Champ | Valeur |
|-------|--------|
| URL | https://www.bibmath.net |
| Type | site-fr |
| Niveaux | College, 2nde, Sup+ |
| Langues | fr |
| Acces | gratuit |
| Qualite | ★★★★★ |
| Derniere verification | 2026-02-07 |

## Description

Bibm@th est une encyclopedie mathematique francophone de reference. Le site propose un dictionnaire de 2 876 definitions, une base de donnees de 3 692 exercices corriges (principalement niveau superieur), un formulaire complet, 100+ quiz interactifs (du college a l'agregation), des resumes de cours par niveau (college, seconde, sup), et des biographies de mathematiciens. Le contenu est rigoureux et redige par des enseignants. C'est une reference de qualite pour les definitions, theoremes, et formules, mais les exercices corriges ciblent principalement le niveau superieur (MPSI, CAPES, Agregation).

## Instructions LLM

### Navigation

- URL de base : `https://www.bibmath.net`
- Ressources par niveau : `https://www.bibmath.net/ressources/index.php?action=affiche&quoi={niveau}/index`
  - Niveaux : `college`, `seconde`, `grandoral`, `mpsi`, `mathspe`, `capes`, `agreginterne`, `bts`
- Dictionnaire : `https://www.bibmath.net/dico/index.php?action=affiche&quoi=./{lettre}/{terme}.html`
- Formulaire : `https://www.bibmath.net/formulaire/index.php?action=affiche&quoi={section}`
- Base d'exercices : `https://www.bibmath.net/ressources/index.php?action=affiche&quoi=bde/{categorie}/{sous-categorie}&type=fexo`
- Quiz : `https://www.bibmath.net/quizz/index.php?action=displayquizz&quizzFile=mesquizz/{categorie}/{quiz}`
- Sitemap : non (404)

### Extraction de contenu

- Format principal : HTML
- LaTeX : MathJax (delimiteurs `$...$`, `\(...\)`)
- Figures : images PNG/GIF
- Methode d'extraction : direct fetch, HTML server-rendered avec PHP
- Contenu protege : aucun, tout est gratuit
- Les pages PHP redirigent parfois vers la page d'accueil si le parametre `quoi` est mal forme
- Les PDFs (mementos college) ne sont pas accessibles en direct via fetch, necessitent navigation manuelle

### Patterns d'URL

#### Dictionnaire (definitions)
- Pattern : `dico/index.php?action=affiche&quoi=./{lettre}/{terme}.html`
- Exemples : `./t/thales.html`, `./v/vecteur.html`, `./t/translation.html`
- Contenu : definition formelle, theoreme enonce, demonstration, figures, contexte historique

#### Formulaire (fiches de formules)
- Pattern : `formulaire/index.php?action=affiche&quoi={section}`
- Sections geometrie : `aire`, `volume`, `geoplan`, `geospace`, `triangle`
- Sections trigonometrie : `cerctrigo`, `trigofonc`, `trigodecalage`, `trigoadd`, `trigolinearisation`
- Sections algebre : `identitesremarquables`, `puissances`, `racines`
- Sections analyse : `derivees`, `primitives`, `limitesusuelles`
- Sections proba/stat : `combinatoire`, `loisdiscretes`, `loiscontinues`

#### Base d'exercices corriges (BDE — niveau Sup+)
- Pattern : `ressources/index.php?action=affiche&quoi=bde/{domaine}/{theme}&type=fexo`
- Algebre : `algebre/trigo` (39 ex.), `algebre/calculalgebrique`, `algebre/complexe`
- Arithmetique : `arithm/congruence`, `arithm/pgcd`, `arithm/premiers`
- Geometrie : `geo/geoplan` (12 ex.), `geo/geospace`, `geo/transformations`
- Analyse : `analyse/...` (multiples sous-categories)
- Proba/Stat : `proba/statdescriptive` (9 ex.)

#### Quiz / Automatismes (multi-niveaux)
- Pattern : `quizz/index.php?action=displayquizz&quizzFile=mesquizz/{categorie}/{quiz}`
- Categories : arithm, calcullitteral, equations, derivation, fonctions, fractions, geometrie, integration, matrices, mesures, nombresreels, numeration, operations, proportionnalite, puissances, racines, series, suites, trigo
- 100+ quiz disponibles, du college a l'agregation

#### Ressources Seconde
- Pattern : `ressources/index.php?action=affiche&quoi=seconde/cours/{chapitre}.html`
- Chapitres : `ensemblenombres`, `calculsalgebriques`, `inegalites`, + geometrie, fonctions, stats (non confirmes individuellement)
- Chaque chapitre : cours + methodes + exercices (3 niveaux) + automatismes + algorithmique

#### Mementos College (PDF)
- Pattern : `ressources/index.php?action=affiche&quoi=college/mementos/Memento_{theme}.pdf`
- Themes : `Thales`, `Trigo`, `racines_carrees`, `Developper_Reduire`, `Factorisations`
- Note : les liens PDF redirigent vers la page d'accueil lors du fetch direct

### Limites et precautions

- Les pages PHP a parametre `quoi` ne rendent pas toujours le contenu attendu lors du fetch (redirections vers accueil)
- Les PDFs de mementos ne sont pas directement telechargeable via fetch
- La BDE (base d'exercices) est principalement niveau Sup+ (classes preparatoires), pas lycee
- Les ressources Seconde existent mais la structure interne est difficile a explorer programmatiquement
- Pas de rate limiting apparent, site rapide

## Ressources par module

### thales — Thales

#### Dictionnaire
- [cours] https://www.bibmath.net/dico/index.php?action=affiche&quoi=./t/thales.html
  Definition complete du theoreme de Thales : enonce, reciproque, corollaire, demonstration d'Euclide, figures, contexte historique. Format: html.

#### Memento
- [fiche] https://www.bibmath.net/ressources/index.php?action=affiche&quoi=college/mementos/Memento_Thales.pdf
  Resume de cours college sur Thales. Format: pdf (acces indirect).

### trigo — Rapports trigonometriques

#### Exercices corriges (BDE — niveau Sup+)
- [exercice] https://www.bibmath.net/ressources/index.php?action=affiche&quoi=bde/algebre/trigo&type=fexo
  39 exercices corriges : formules, equations trigo, fonctions trigo, linearisation. Diff ~2-4. Corrige: oui. Format: html.

#### Formulaire
- [fiche] https://www.bibmath.net/formulaire/index.php?action=affiche&quoi=cerctrigo
  Cercle trigonometrique, angles, valeurs remarquables. Format: html.
- [fiche] https://www.bibmath.net/formulaire/index.php?action=affiche&quoi=trigofonc
  Etude des fonctions trigonometriques. Format: html.
- [fiche] https://www.bibmath.net/formulaire/index.php?action=affiche&quoi=trigoadd
  Formules d'addition. Format: html.
- [fiche] https://www.bibmath.net/formulaire/index.php?action=affiche&quoi=trigolinearisation
  Formules de linearisation. Format: html.

#### Memento
- [fiche] https://www.bibmath.net/ressources/index.php?action=affiche&quoi=college/mementos/Memento_Trigo.pdf
  Resume de cours college sur la trigonometrie. Format: pdf (acces indirect).

#### Quiz
- [qcm] https://www.bibmath.net/quizz/index.php (section Trigonometrie)
  Quiz interactifs sur la trigonometrie et les nombres complexes. Format: html.

### repere — Repere

#### Formulaire
- [fiche] https://www.bibmath.net/formulaire/index.php?action=affiche&quoi=geoplan
  Geometrie analytique du plan : produit scalaire, determinant, equations de droites, distances. Format: html.

### num1 — Calcul numerique 1

#### Quiz
- [qcm] https://www.bibmath.net/quizz/index.php (sections Arithmetique, Fractions, Operations)
  Quiz interactifs : divisibilite, nombres premiers, fractions, operations. Multi-niveaux. Format: html.

#### Exercices corriges (BDE — niveau Sup+)
- [exercice] https://www.bibmath.net/ressources/index.php?action=affiche&quoi=bde/arithm/congruence&type=fexo
  Exercices corriges divisibilite et congruence. Diff ~3. Corrige: oui. Format: html.
- [exercice] https://www.bibmath.net/ressources/index.php?action=affiche&quoi=bde/arithm/pgcd&type=fexo
  Exercices corriges PGCD, PPCM, nombres premiers entre eux. Diff ~3. Corrige: oui. Format: html.
- [exercice] https://www.bibmath.net/ressources/index.php?action=affiche&quoi=bde/arithm/premiers&type=fexo
  Exercices corriges nombres premiers, decomposition. Diff ~3. Corrige: oui. Format: html.

### num2 — Calcul numerique 2

#### Quiz
- [qcm] https://www.bibmath.net/quizz/index.php (sections Puissances, Racines carrees)
  Quiz interactifs sur les puissances et racines carrees. Format: html.

### algebre — Algebre

#### Quiz
- [qcm] https://www.bibmath.net/quizz/index.php (section Calcul litteral)
  Quiz interactifs : developpement, factorisation, identites remarquables. Format: html.

#### Exercices corriges (BDE — niveau Sup+)
- [exercice] https://www.bibmath.net/ressources/index.php?action=affiche&quoi=bde/algebre/calculalgebrique&type=fexo
  Exercices corriges calculs algebriques, sommes, produits, binome. Diff ~3. Corrige: oui. Format: html.

### ei — Equations et inequations

#### Quiz
- [qcm] https://www.bibmath.net/quizz/index.php (section Equations/Inequations)
  Quiz interactifs : equations 1er et 2nd degre, inequations. Format: html.

### fa — Fonctions affines

#### Quiz
- [qcm] https://www.bibmath.net/quizz/index.php (section Fonctions)
  Quiz interactifs : fonctions, fonctions affines, second degre. Format: html.

### stat — Statistiques

#### Exercices corriges (BDE — niveau Sup+)
- [exercice] https://www.bibmath.net/ressources/index.php?action=affiche&quoi=bde/proba/statdescriptive&type=fexo
  9 exercices corriges statistiques descriptives (1 et 2 variables). Diff ~2-3. Corrige: oui. Format: html.

## Modules non-mappes

Bibm@th couvre enormement de themes au-dela de notre curriculum actuel :

- **Algebre superieure** : groupes, anneaux, corps, algebre lineaire, espaces vectoriels
- **Analyse** : suites, series, integrales, fonctions de plusieurs variables, equations differentielles
- **Geometrie superieure** : coniques, courbes parametrees, geometrie differentielle, geometrie affine
- **Probabilites** : variables aleatoires, lois discretes/continues, convergence
- **Logique et ensembles** : logique formelle, theorie des ensembles

## Historique des scans

| Date | Action | Notes |
|------|--------|-------|
| 2026-02-07 | Scan initial | Site de reference encyclopedique. Principal interet : dictionnaire (definitions rigoureuses), formulaire (fiches de formules), quiz multi-niveaux. La BDE (3692 exercices) est principalement Sup+. Les ressources Seconde existent mais sont difficiles a explorer via fetch. |
