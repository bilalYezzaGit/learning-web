# Mathsbook

> Derniere mise a jour : 2026-02-07

## Meta

| Champ | Valeur |
|-------|--------|
| URL | https://www.mathsbook.fr |
| Type | site-fr |
| Niveaux | 3eme, 2nde, 1ere, Term |
| Langues | fr |
| Acces | freemium |
| Qualite | ★★★☆☆ |
| Derniere verification | 2026-02-07 |

## Description

Mathsbook est une plateforme francaise de soutien scolaire en mathematiques couvrant du college (6eme) a la Terminale S/ES. Elle propose des cours HTML en ligne, des exercices corriges, des QCM interactifs, des videos, des fiches de revision PDF et des annales Bac/Brevet. Le modele est freemium : les cours et exercices sont accessibles avec un compte gratuit, mais les QCM interactifs et le suivi personnalise necessitent un abonnement Premium (1€/mois). Le contenu est structure par niveau et par chapitre, avec une couverture complete du programme francais.

## Instructions LLM

### Navigation

- URL de base : `https://www.mathsbook.fr`
- Pattern de navigation :
  - Hub par niveau : `/maths/{niveau}` (ex: `/maths/seconde`)
  - Cours par chapitre : `/cours-maths/{niveau}/{chapitre}`
  - Exercices : `/exercices-maths/{niveau}/{chapitre}`
  - Fiches PDF : `/cours-maths-pdf/{niveau}/{chapitre}`
  - Fiches revision : `/fiche-cours-maths/{niveau}/{chapitre}`
  - QCM : `/qcm-maths` (necessite Premium)
- Sitemap : non teste
- WebFetch fonctionne pour les pages de listing, mais le contenu detaille requiert inscription

### Extraction de contenu

- Format principal : HTML (cours en ligne) + PDF (fiches telechargeable)
- LaTeX : aucun MathJax visible — formules en images ou texte simple
- Methode d'extraction : WebFetch pour structure et listings. Contenu detaille derriere inscription gratuite.
- Contenu protege :
  - Cours et exercices : inscription gratuite requise pour contenu complet
  - QCM interactifs : Premium (1€/mois)
  - PDFs cours : semblent telechargeable gratuitement

### Patterns d'URL

- Niveaux : `3eme`, `seconde`, `premiere-s`, `premiere-es`, `terminale-s`, `terminale-es`
- Cours : `/cours-maths/{niveau}/{slug-chapitre}`
- Lecon specifique : `/cours-maths/{niveau}/{slug-chapitre}/{slug-lecon}-{id}`
- Exercices : `/exercices-maths/{niveau}/{slug-chapitre}`
- Exercice specifique : `/exercices-maths/{niveau}/{slug-chapitre}/{slug-exercice}-{id}`
- PDF : `/cours-maths-pdf/{niveau}/{slug-chapitre}`
- Fiches : `/fiche-cours-maths/{niveau}/{slug-chapitre}`
- QCM : `/qcm-maths/{niveau}/{slug-chapitre}`
- Videos : `/videos-maths`
- Annales : `/annales/bac-maths/s`, `/annales/brevet-maths`

### Limites et precautions

- Le contenu detaille des cours et exercices necessite une inscription (gratuite)
- Les QCM sont payants (Premium 1€/mois)
- Le site utilise encore les anciens programmes (1S, TS, 1ES, TES) — pas mis a jour pour la reforme 2019 (Spe/Complement)
- Pas de MathJax — les formules ne sont pas extractibles en LaTeX
- Le contenu HTML est partiellement tronque pour les non-inscrits ("Identifie-toi pour voir plus")

## Ressources par module

### Mapping programme francais → curriculum tunisien

| Notre module (1ere-tc) | Chapitre Mathsbook | Niveau |
|-------------------------|-------------------|--------|
| `thales` | Theoreme de Thales | 3eme |
| `trigo` | Trigonometrie | 3eme |
| `vt` | Vecteurs et translation | 3eme |
| `repere` | Geometrie analytique | 3eme |
| `algebre` | Developpement et factorisation + Calcul algebrique | 3eme / 2nde |
| `num1` | Racines carrees + Nombres et calculs | 3eme / 2nde |
| `num2` | Ordre des nombres et valeur absolue | 2nde |
| `fl` / `fa` | Fonctions affines et lineaires | 3eme |
| `ei` | Equations et inequations | 3eme / 2nde |
| `sys` | Systeme d'equations + Equations de droites et systemes | 3eme / 2nde |
| `stat` | Statistiques | 3eme / 2nde |
| `qt` | Rotations et angles | 3eme |
| `ss` | Geometrie dans l'espace | 3eme |
| `sv` | Vecteurs (somme, Chasles) — inclus dans Vecteurs 2nde | 2nde |

### thales — Theoreme de Thales

#### Cours
- [cours] /cours-maths/3eme/theoreme-de-thales
  3 lecons : theoreme direct, reciproque, agrandissement/reduction. Format: html (inscription requise).
- [cours] /cours-maths-pdf/3eme/theoreme-de-thales
  Cours PDF telechargeabla (3 pages). Format: pdf.
- [fiche] /fiche-cours-maths/3eme/theoreme-de-thales
  Fiche de revision. Format: html/pdf.

#### Exercices
- [exercice] /exercices-maths/3eme/theoreme-de-thales
  6 exercices corriges : calcul longueur (Thales direct), theoreme des milieux, hauteur d'un arbre, droites paralleles (reciproque), hauteur Tour Eiffel. Diff ~1-2. Corrige: oui (inscription). Format: html.

#### QCM
- [qcm] /qcm-maths/3eme/theoreme-de-thales
  QCM interactif. Premium requis.

### trigo — Trigonometrie

#### Cours
- [cours] /cours-maths/3eme/trigonometrie
  Cours complet cos, sin, tan dans le triangle rectangle. Format: html.
- [cours] /cours-maths-pdf/3eme/trigonometrie
  PDF telechargeable. Format: pdf.
- [fiche] /fiche-cours-maths/3eme/trigonometrie
  Fiche de revision. Format: html/pdf.

#### Exercices
- [exercice] /exercices-maths/3eme/trigonometrie
  Exercices corriges trigonometrie. Format: html.

### vt — Vecteurs et translations

#### Cours
- [cours] /cours-maths/3eme/vecteurs-et-translation
  Vecteurs : definition, egalite, opposes, translation. Format: html.
- [cours] /cours-maths-pdf/3eme/vecteurs-et-translation
  PDF. Format: pdf.

### repere — Geometrie analytique

#### Cours
- [cours] /cours-maths/3eme/geometrie-analytique
  Vecteurs dans un repere, coordonnees. Format: html.

### algebre — Calcul algebrique

#### Cours (3eme)
- [cours] /cours-maths/3eme/developpement-factorisation
  Developpement et factorisation, identites remarquables. Format: html.

#### Cours (2nde)
- [cours] /cours-maths/seconde/calcul-algebrique
  Calcul litteral, developpement, factorisation. Format: html.

### num1 — Nombres et calculs

#### Cours (3eme)
- [cours] /cours-maths/3eme/les-racines-carres
  Racines carrees : definition, proprietes, operations. Format: html.

#### Cours (2nde)
- [cours] /cours-maths/seconde/nombres-et-calculs
  Nombres et calculs : puissances, fractions, racines. Format: html.

### num2 — Ordre et valeur absolue

#### Cours
- [cours] /cours-maths/seconde/ordre-des-nombres-et-valeur-absolue
  Intervalles, valeur absolue, encadrements. Format: html.

### ei — Equations et inequations

#### Cours
- [cours] /cours-maths/3eme/equations-et-inequations
  Equations du premier degre. Format: html.
- [cours] /cours-maths/seconde/equations-et-inequations
  Equations, inequations, tableaux de signes. Format: html.

### fl / fa — Fonctions lineaires et affines

#### Cours
- [cours] /cours-maths/3eme/fonctions-lineaires-et-affines
  Fonctions lineaires et affines, representation graphique. Format: html.

### sys — Systemes

#### Cours
- [cours] /cours-maths/3eme/systeme-d-equations
  Systemes de deux equations. Format: html.
- [cours] /cours-maths/seconde/equations-de-droites-et-systemes-lineaires
  Equations de droites et systemes. Format: html.

### qt — Rotations et angles

#### Cours
- [cours] /cours-maths/3eme/rotations-et-angles
  Rotations, angles inscrits/au centre. Format: html.

### ss — Geometrie dans l'espace

#### Cours
- [cours] /cours-maths/3eme/geometrie-dans-l-espace
  Sections de solides, volumes, patrons. Format: html.

### stat — Statistiques

#### Cours
- [cours] /cours-maths/3eme/statistiques + /cours-maths/seconde/statistiques
  Moyenne, mediane, etendue, ecart-type. Format: html.

## Ressources avancees (3eme-math / term-math)

### Premiere S (10 chapitres)
- Generalites sur les fonctions
- Polynome du second degre
- Derivation
- Suites numeriques
- Limites de suites
- Produit scalaire
- Trigonometrie
- Statistiques
- Probabilites
- Geometrie plane

### Terminale S (12 chapitres)
- Continuite et TVI
- Derivation
- Suites numeriques
- Limites de suites et fonctions
- Fonction logarithme
- Fonction exponentielle
- Primitives
- Calcul integral
- Nombres complexes
- Produit scalaire dans l'espace
- Conditionnement et independance
- Fonctions sinus et cosinus

## Modules non-mappes

- **Arithmetique** (3eme) — PGCD, PPCM, nombres premiers — pas dans notre programme 1ere-tc
- **Probabilites** (3eme, 2nde) — pas dans notre programme actuel
- **Echantillonnage** — pas dans notre programme
- **Triangles isometriques et semblables** (2nde) — concept lie a Thales

## Volume estime

| Niveau | Chapitres | Cours | Exercices | QCM | PDFs |
|--------|-----------|-------|-----------|-----|------|
| 3eme | 14 | ~14 | ~80+ | ~14 | ~14 |
| 2nde | 12 | ~12 | ~70+ | ~12 | ~12 |
| 1ere S | 10 | ~10 | ~60+ | ~10 | ~10 |
| 1ere ES | 8 | ~8 | ~50+ | ~8 | ~8 |
| Term S | 12 | ~12 | ~70+ | ~12 | ~12 |
| Term ES | 10 | ~10 | ~60+ | ~10 | ~10 |
| **Total** | **~66** | **~66** | **~390+** | **~66** | **~66** |

## Historique des scans

| Date | Action | Notes |
|------|--------|-------|
| 2026-02-07 | Scan initial | Site freemium, WebFetch OK pour listings. Cours HTML derriere inscription gratuite, QCM payants. Anciens programmes S/ES (pas reforme 2019). Qualite correcte mais inferieure a maths-et-tiques. |
