# Maths-France.fr

> Derniere mise a jour : 2026-02-07

## Meta

| Champ | Valeur |
|-------|--------|
| URL | https://maths-france.fr |
| Type | site-fr |
| Niveaux | Term, Sup, Spe |
| Langues | fr |
| Acces | freemium (35 EUR/an pour contenu complet) |
| Qualite | ★★★★★ |
| Derniere verification | 2026-02-07 |

## Description

Maths-France.fr est un site francais de haute qualite cree par Jean-Louis Rouget, propose sous le titre "Mathematiques : Problemes et Solutions". Il couvre les niveaux Terminale S (ancien programme, arrete en 2019), Math Sup (MPSI/PCSI, programme 2021) et Math Spe, ainsi que le CAPES. Le contenu est rigoureux, avec des cours complets demontres, des fiches resumes, et un enorme corpus d'annales du BAC S classees par theme avec corriges. Le site est majoritairement gratuit avec un abonnement payant (35 EUR/an) pour les cours complets et certains corriges recents. La section Seconde a ete supprimee. Pas de niveau Premiere.

## Instructions LLM

### Navigation

- URL de base : `https://maths-france.fr`
- Niveaux : `/terminales/`, `/math-sup/`, `/math-spe/`, `/capes/`
- Sous-sections Terminale : `/terminales/cours/`, `/terminales/fiche-de-cours/`, `/terminales/problemes-du-bac-s/`
- Sous-sections Math Sup : `/math-sup/cours/`, `/math-sup/exercices/`, `/math-sup/problemes/`
- Sitemap : oui (`/sitemap.xml`)

### Extraction de contenu

- Format principal : PDF (cours, exercices, corriges)
- LaTeX : oui (les PDFs sont generes avec LaTeX, haute qualite typographique)
- Methode d'extraction : navigation HTML vers pages listing, puis liens PDF directs
- Contenu protege : cours complets (payant), fiches et annales (majoritairement gratuit)
- Les PDFs ne sont pas directement accessibles sans naviguer les pages listing

### Patterns d'URL

- Cours Terminale : `https://maths-france.fr/terminales/cours/`
- Fiches Terminale : `https://maths-france.fr/terminales/fiche-de-cours/`
- Annales thematiques : `https://maths-france.fr/terminales/problemes-du-bac-s/annales-thematiques/{theme}/`
- Annales par annee : `https://maths-france.fr/terminales/problemes-du-bac-s/bac-s-{annee}/`
- Exercices Math Sup : `https://maths-france.fr/math-sup/exercices/`
- Cours Math Sup : `https://maths-france.fr/math-sup/cours/`

### Limites et precautions

- **Pas de niveau Seconde ni Premiere** : section Secondes supprimee (404), Premiere inexistante
- Programme Terminale S = ancien programme (arrete 2019), mais "bon nombre de chapitres restent utilisables"
- Cours complets reservees aux abonnes (35 EUR/an)
- Site WordPress/Divi : contenu mal extrait par WebFetch (CSS/JS massif), necessiter Chrome/JS pour lire les pages
- Auteur unique : Jean-Louis Rouget (2006-2025), qualite homogene mais un seul point de vue pedagogique

## Modele economique

| Aspect | Detail |
|--------|--------|
| Auteur | Jean-Louis Rouget (societe individuelle) |
| Adresse | 3 Allee des Dahlias, 13821 La Penne sur Huveaune |
| Abonnement | 35 EUR/an |
| Gratuit | Fiches resumes, annales thematiques (enonces), certains corriges anciens |
| Payant | Cours complets, corriges recents, contenu Math Sup |

## Ressources par module

### Terminale S — Cours (21 chapitres, ~264+ pages)

#### Analyse (154 pages)
- [cours] /terminales/cours/ — Chapitre 1 : Le raisonnement par recurrence. Format: pdf. Payant.
- [cours] /terminales/cours/ — Chapitre 2 : Rappels sur les suites arithmetiques et geometriques. Format: pdf. Payant.
- [cours] /terminales/cours/ — Chapitre 3 : Les suites reelles. Format: pdf. Payant.
- [cours] /terminales/cours/ — Chapitre 4 : Generalites sur les fonctions. Format: pdf. Payant.
- [cours] /terminales/cours/ — Chapitre 5 : Limites de fonctions. Format: pdf. Payant.
- [cours] /terminales/cours/ — Chapitre 6 : Continuite. Format: pdf. Payant.
- [cours] /terminales/cours/ — Chapitre 7 : Derivation. Format: pdf. Payant.
- [cours] /terminales/cours/ — Chapitre 8 : Integration. Format: pdf. Payant.
- [cours] /terminales/cours/ — Chapitre 9 : La fonction exponentielle. Format: pdf. Payant.
- [cours] /terminales/cours/ — Chapitre 10 : La fonction logarithme neperien. Format: pdf. Payant.
- [cours] /terminales/cours/ — Chapitre 11 : Les fonctions sinus et cosinus. Format: pdf. Payant.

#### Algebre et Geometrie (59 pages)
- [cours] /terminales/cours/ — Chapitre 12 : Les nombres complexes. Format: pdf. Payant.
- [cours] /terminales/cours/ — Chapitre 13 : Droites et plans de l'espace. Format: pdf. Payant.
- [cours] /terminales/cours/ — Chapitre 14 : Produit scalaire dans l'espace. Format: pdf. Payant.

#### Probabilites (51 pages)
- [cours] /terminales/cours/ — Chapitre 15 : Probabilites conditionnelles. Format: pdf. Payant.
- [cours] /terminales/cours/ — Chapitre 16 : Le schema de Bernoulli. Format: pdf. Payant.
- [cours] /terminales/cours/ — Chapitre 17 : Lois continues. Format: pdf. Payant.
- [cours] /terminales/cours/ — Chapitre 18 : La loi normale. Format: pdf. Payant.
- [cours] /terminales/cours/ — Chapitre 19 : Echantillonnage. Format: pdf. Payant.

#### Enseignement de Specialite
- [cours] /terminales/cours/ — Chapitre 20 : Arithmetique. Format: pdf. Payant.
- [cours] /terminales/cours/ — Chapitre 21 : Matrices. Format: pdf. Payant.

### Terminale S — Fiches resumes (33 documents)

#### Fiches Enseignement Specifique (26 fiches)
- [fiche] /terminales/fiche-de-cours/ — Fiche 1 : Generalites sur les suites. Format: pdf.
- [fiche] /terminales/fiche-de-cours/ — Fiche 2 : Suites arithmetiques et geometriques. Format: pdf.
- [fiche] /terminales/fiche-de-cours/ — Fiche 3 : Raisonnement par recurrence. Format: pdf.
- [fiche] /terminales/fiche-de-cours/ — Fiche 4 : Generalites sur les fonctions. Format: pdf.
- [fiche] /terminales/fiche-de-cours/ — Fiche 5 : Limites de suites et de fonctions. Format: pdf.
- [fiche] /terminales/fiche-de-cours/ — Fiche 6 : Operations sur les limites. Format: pdf.
- [fiche] /terminales/fiche-de-cours/ — Fiche 7 : Continuite, theoreme des valeurs intermediaires. Format: pdf.
- [fiche] /terminales/fiche-de-cours/ — Fiche 8 : Derivation des fonctions. Format: pdf.
- [fiche] /terminales/fiche-de-cours/ — Fiche 9 : Integration. Format: pdf.
- [fiche] /terminales/fiche-de-cours/ — Fiche 10 : Calcul integral, primitives. Format: pdf.
- [fiche] /terminales/fiche-de-cours/ — Fiche 11 : La fonction exponentielle. Format: pdf.
- [fiche] /terminales/fiche-de-cours/ — Fiche 12 : La fonction logarithme neperien. Format: pdf.
- [fiche] /terminales/fiche-de-cours/ — Fiche 13 : Fonction logarithme decimal. Format: pdf.
- [fiche] /terminales/fiche-de-cours/ — Fiche 14 : Fonctions trigonometriques. Format: pdf.
- [fiche] /terminales/fiche-de-cours/ — Fiche 15 : Formes indeterminees usuelles. Format: pdf.
- [fiche] /terminales/fiche-de-cours/ — Fiche 16 : Forme algebrique des nombres complexes. Format: pdf.
- [fiche] /terminales/fiche-de-cours/ — Fiche 17 : Forme trigonometrique des nombres complexes. Format: pdf.
- [fiche] /terminales/fiche-de-cours/ — Fiche 18 : Interpretation geometrique des nombres complexes. Format: pdf.
- [fiche] /terminales/fiche-de-cours/ — Fiche 19 : Geometrie dans l'espace (vecteurs, coordonnees, produit scalaire). Format: pdf.
- [fiche] /terminales/fiche-de-cours/ — Fiche 20 : Droites et plans de l'espace. Format: pdf.
- [fiche] /terminales/fiche-de-cours/ — Fiche 21 : Probabilites conditionnelles. Format: pdf.
- [fiche] /terminales/fiche-de-cours/ — Fiche 22 : Coefficients binomiaux, loi binomiale. Format: pdf.
- [fiche] /terminales/fiche-de-cours/ — Fiche 23 : Lois de probabilite discretes. Format: pdf.
- [fiche] /terminales/fiche-de-cours/ — Fiche 24 : Lois de probabilite continues. Format: pdf.
- [fiche] /terminales/fiche-de-cours/ — Fiche 25 : Loi normale. Format: pdf.
- [fiche] /terminales/fiche-de-cours/ — Fiche 26 : Echantillonnage, estimation. Format: pdf.

#### Fiches Enseignement de Specialite (2 fiches)
- [fiche] /terminales/fiche-de-cours/ — Fiche 27 : Arithmetique. Format: pdf.
- [fiche] /terminales/fiche-de-cours/ — Fiche 28 : Matrices. Format: pdf.

#### Formulaires (5 documents)
- [fiche] /terminales/fiche-de-cours/ — Formulaire 1 : Formulaire de derivees. Format: pdf.
- [fiche] /terminales/fiche-de-cours/ — Formulaire 2 : Formulaire de primitives. Format: pdf.
- [fiche] /terminales/fiche-de-cours/ — Formulaire 3 : Formulaire de trigonometrie. Format: pdf.
- [fiche] /terminales/fiche-de-cours/ — Formulaire 4 : Resolutions d'equations. Format: pdf.
- [fiche] /terminales/fiche-de-cours/ — Formulaire 5 : Aires et volumes usuels. Format: pdf.

### Terminale S — Annales thematiques (520 enonces, 529 corriges)

#### Analyse
- [annale] /terminales/problemes-du-bac-s/annales-thematiques/suites/
  Suites — 43 enonces + 43 corriges (2011-2017). Format: pdf.
- [annale] /terminales/problemes-du-bac-s/annales-thematiques/fonctions/
  Fonctions. Format: pdf.
- [annale] /terminales/problemes-du-bac-s/annales-thematiques/exponentielle-2017-2015/
  Fonction exponentielle (2017-2015). Format: pdf.
- [annale] /terminales/problemes-du-bac-s/annales-thematiques/exponentielle-2014-2010/
  Fonction exponentielle (2014-2010). Format: pdf.
- [annale] /terminales/problemes-du-bac-s/annales-thematiques/exponentielle-2012-2004/
  Fonction exponentielle (2012-2004). Format: pdf.
- [annale] /terminales/problemes-du-bac-s/annales-thematiques/logarithme-neperien-2017-2015/
  Logarithme neperien (2017-2015). Format: pdf.
- [annale] /terminales/problemes-du-bac-s/annales-thematiques/logarithme-neperien-2014-2010/
  Logarithme neperien (2014-2010). Format: pdf.
- [annale] /terminales/problemes-du-bac-s/annales-thematiques/logarithme-neperien-2012-2004/
  Logarithme neperien (2012-2004). Format: pdf.
- [annale] /terminales/problemes-du-bac-s/annales-thematiques/integrales/
  Integrales et calculs d'aires. Format: pdf.

#### Algebre et Geometrie
- [annale] /terminales/problemes-du-bac-s/annales-thematiques/complexes-2017-2016-2015/
  Nombres complexes (2017-2015). Format: pdf.
- [annale] /terminales/problemes-du-bac-s/annales-thematiques/complexes-2014-2013-2012-2011/
  Nombres complexes (2014-2011). Format: pdf.
- [annale] /terminales/problemes-du-bac-s/annales-thematiques/complexes-2012-2004/
  Nombres complexes (2012-2004). Format: pdf.
- [annale] /terminales/problemes-du-bac-s/annales-thematiques/geometrie-dans-lespace-2017-2015/
  Geometrie dans l'espace (2017-2015). Format: pdf.
- [annale] /terminales/problemes-du-bac-s/annales-thematiques/geometrie-dans-lespace-2014-2010/
  Geometrie dans l'espace (2014-2010). Format: pdf.
- [annale] /terminales/problemes-du-bac-s/annales-thematiques/geometrie-dans-lespace-2012-2004/
  Geometrie dans l'espace (2012-2004). Format: pdf.

#### Probabilites et Statistiques
- [annale] /terminales/problemes-du-bac-s/annales-thematiques/probabilites-2017-2015/
  Probabilites (2017-2015). Format: pdf.
- [annale] /terminales/problemes-du-bac-s/annales-thematiques/probabilites-2014-2011/
  Probabilites (2014-2011). Format: pdf.
- [annale] /terminales/problemes-du-bac-s/annales-thematiques/probabilites-2012-2004/
  Probabilites (2012-2004). Format: pdf.

#### Divers
- [annale] /terminales/problemes-du-bac-s/annales-thematiques/algorithmes/
  Algorithmes. Format: pdf.
- [annale] /terminales/problemes-du-bac-s/annales-thematiques/qcm/
  QCM. Format: pdf.
- [annale] /terminales/problemes-du-bac-s/annales-thematiques/roc/
  ROC (Restitutions Organisees de Connaissances). Format: pdf.

#### Specialite
- [annale] /terminales/problemes-du-bac-s/annales-thematiques/arithmetique-spe/
  Arithmetique (Specialite). Format: pdf.
- [annale] /terminales/problemes-du-bac-s/annales-thematiques/matrices-spe/
  Matrices (Specialite). Format: pdf.

### Terminale S — Annales par annee (2004-2019)

- [annale] /terminales/problemes-du-bac-s/bac-s-{2004..2019}/
  16 annees de BAC S (2004-2019). Enonces et corriges pour chaque session. Format: pdf.

### Math Sup — Exercices (44 planches, 555 exercices corriges)

- [exercice] /math-sup/exercices/
  44 planches d'exercices (nouveau programme 2021). 555 exercices corriges. Enonces avec indication de difficulte. Divises en 1er et 2eme semestre. Format: pdf.

### Math Sup — Cours (37 chapitres, 944 pages)

- [cours] /math-sup/cours/
  Cours complet de Math Sup en 37 chapitres (944 pages). Programme 2021. **Payant** (abonnes uniquement). Format: pdf.

### Math Sup — Problemes

- [exercice] /math-sup/problemes/
  Anciennes epreuves ecrites Petites Mines + QCM ENAC Pilotes depuis 2005. Enonces et corriges. Format: pdf.

### Math Spe — Exercices et Problemes

- [exercice] /math-spe/exercices/
  Planches d'exercices Math Spe. Format: pdf.
- [annale] /math-spe/ — Concours
  Epreuves Mines, Centrale, CCINP, E3A, EPITA, BECEAS. Enonces et corriges. Format: pdf.

### CAPES

- [exercice] /capes/
  Ressources pour la preparation du CAPES de mathematiques. Format: pdf.

## Mapping vers notre curriculum

Le site ne couvre **pas directement** nos niveaux 1ere-tc ou 2nde-math. Cependant, certains contenus Terminale S sont pertinents pour les niveaux 3eme-math et term-math du curriculum tunisien :

| Chapitre Maths-France | Notre topic | Programme | Pertinence |
|------------------------|-------------|-----------|------------|
| Ch. 6 : Continuite | `cont` | 3eme-math | Directement utilisable |
| Ch. 7 : Derivation | `der` | 3eme-math | Directement utilisable |
| Ch. 3 : Suites reelles | — | 3eme-math / term-math | Utilisable (suites) |
| Ch. 4 : Generalites fonctions | `fn` | 3eme-math | Reference |
| Ch. 5 : Limites de fonctions | — | 3eme-math / term-math | Directement utilisable |
| Ch. 8 : Integration | — | term-math | Directement utilisable |
| Ch. 9 : Fonction exponentielle | — | term-math | Directement utilisable |
| Ch. 10 : Logarithme neperien | — | term-math | Directement utilisable |
| Ch. 11 : Fonctions sinus/cosinus | `trigo` (avance) | term-math | Partiellement utilisable |
| Ch. 12 : Nombres complexes | — | term-math | Directement utilisable |
| Ch. 15 : Probabilites cond. | — | term-math | Directement utilisable |
| Fiche 3 : Trigonometrie | `trigo` | 1ere-tc (reference) | Formulaire de reference |
| Fiche 7 : Continuite/TVI | `cont` | 3eme-math | Fiche resume utile |
| Fiche 8 : Derivation | `der` | 3eme-math | Fiche resume utile |

**Pour 1ere-tc** : aucun contenu directement utilisable (pas de Thales, vecteurs/translations, repere, quart de tour, etc.).

## Modules non-mappes

Le site couvre des chapitres avances non presents dans notre programme actuel mais potentiellement utiles pour extensions futures :

- Nombres complexes (Term) — futur term-math
- Integration (Term) — futur term-math
- Fonction exponentielle / Logarithme (Term) — futur term-math
- Probabilites (Term) — futur term-math / stat
- Arithmetique (Specialite) — non prevu
- Matrices (Specialite) — non prevu
- Tout le programme Math Sup/Spe — hors scope

## Historique des scans

| Date | Action | Notes |
|------|--------|-------|
| 2026-02-07 | Scan initial | Extraction via Chrome (Divi bloque WebFetch). 21 chapitres cours, 33 fiches, 520 annales, 44 planches exos Math Sup catalogues. Section Secondes supprimee (404). |
