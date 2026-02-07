# TOPNETSCHOOL / Kademia.tn

> Derniere mise a jour : 2026-02-07

## Meta

| Champ | Valeur |
|-------|--------|
| URL | https://www.topnetschool.tn |
| Alias | https://www.kademia.tn |
| Type | site-tn |
| Niveaux | 1ere, 2nde, 3eme, Term |
| Langues | fr, ar |
| Acces | payant (freemium) |
| Qualite | ★★★☆☆ (estimation — site inaccessible au moment du scan) |
| Derniere verification | 2026-02-07 |
| Statut | **HORS LIGNE** — ECONNREFUSED sur topnetschool.tn et kademia.tn |

## Description

TOPNETSCHOOL (rebaptise Kademia.tn) est une plateforme d'enseignement a distance tunisienne, lancee en octobre 2020 en partenariat entre TOPNET (FAI tunisien) et la startup Easy School SARL. Elle propose des cours video, resumes, exercices corriges et quiz conformes aux programmes de l'Education Nationale tunisienne, du prescolaire au baccalaureat. Initialement exclusive aux clients TOPNET, elle a evolue en plateforme ouverte avec abonnement payant. Le site est actuellement **inaccessible** (ECONNREFUSED depuis fevrier 2026).

## Instructions LLM

### Navigation

- URL de base : `https://www.topnetschool.tn` (HORS LIGNE)
- URL alternative : `https://www.kademia.tn` (HORS LIGNE)
- Pattern de navigation : `/cours/{matiere}-{niveau}-{filiere}/`
- Exemples d'URLs connues :
  - `/cours/mathematiques-1ere-annee-partie-1/`
  - `/cours/mathematiques-1ere-annee-partie-2/`
  - `/cours/mathematiques-2eme-sciencesinfo-toute-lannee/`
  - `/cours/mathematiques-2eme-technologie-de-linformatique/`
  - `/cours/mathematiques-3eme-sciences-experimentales/`
  - `/cours/mathematiques-3eme-sciences-techniques/`
  - `/cours/mathematiques-3eme-mathematiques/`
  - `/cours/mathematiques-3eme-sciences-de-linformatique/`
  - `/cours/mathematiques-4eme-sciences-de-linformatique/`
  - `/cours/mathematiques-4eme-sciences-techniques/`
- Sitemap : non teste (site hors ligne)

### Extraction de contenu

- Format principal : Video (cours filmes)
- Contenu complementaire : resumes de cours (texte/PDF), exercices corriges, quiz interactifs
- LaTeX : inconnu (probablement images dans les videos)
- Methode d'extraction : navigation requise + authentification (abonnement)
- Contenu protege : **tout le contenu necessite un abonnement** (1 matiere gratuite a l'inscription)

### Patterns d'URL

- Cours 1ere : `https://www.topnetschool.tn/cours/mathematiques-1ere-annee-partie-{1|2}/`
- Cours 2eme : `https://www.topnetschool.tn/cours/mathematiques-2eme-{filiere}/`
- Cours 3eme : `https://www.topnetschool.tn/cours/mathematiques-3eme-{filiere}/`
- Cours 4eme : `https://www.topnetschool.tn/cours/mathematiques-4eme-{filiere}/`
- Pages generales : `/mes-cours/`, `/aide/`, `/accueil/`

### Limites et precautions

- **SITE HORS LIGNE** : ECONNREFUSED depuis au moins fevrier 2026
- Contenu payant : abonnement requis (2 DT/mois ou 20 DT/an — tarifs 2021)
- Package 4 matieres : 30 DT (tarifs 2021)
- Videos non-extractibles : pas de PDFs telechargeables, contenu uniquement en streaming
- Authentification obligatoire : pas d'acces anonyme au contenu
- Le site pourrait revenir en ligne ou avoir migre vers un autre domaine

## Modele economique

| Aspect | Detail |
|--------|--------|
| Lancement | Octobre 2020 (Tunisia Digital Summit) |
| Operateur | Easy School SARL + TOPNET |
| Gratuit initial | Jusqu'au 31/12/2020 pour clients TOPNET |
| Tarif mensuel | 2 DT/mois (2021) |
| Tarif annuel | 20 DT/an (10 mois payes, 2 offerts) |
| Package | 30 DT pour 4 matieres |
| Essai gratuit | 1 matiere gratuite a l'inscription |

## Ressources par module

> **Note importante** : Le detail ci-dessous est reconstitue a partir des metadonnees Google et des snippets de recherche. Le contenu exact n'a pas pu etre verifie car le site est hors ligne.

### Organisation du contenu 1ere annee

Le programme est divise en 2 parties :

**Partie 1** — Chapitres du 1er semestre (~9 lecons estimees)
Chaque lecon contient : cours video, activites, resume de cours, exercices corriges.

Chapitres identifies :
- Developpement, factorisation, identites remarquables
- Activites numeriques / Nombres premiers
- Fonctions lineaires
- Angles

**Partie 2** — Chapitres du 2eme semestre
Chapitres identifies :
- Rapports trigonometriques d'un angle aigu + Relations metriques dans un triangle rectangle (Lecon 7, 8 chapitres)
- Systemes d'equations
- Exploitation de l'information (Statistiques)

### Mapping partiel vers nos modules

| Chapitre TOPNETSCHOOL | Notre topic | Notes |
|------------------------|-------------|-------|
| Developpement, factorisation, identites remarquables | `algebre` | Programme 1ere-tc |
| Activites numeriques | `num1`, `num2` | Probablement calcul dans IR |
| Fonctions lineaires | `fl` | Programme 1ere-tc |
| Angles | `angles` | Programme 1ere-tc |
| Rapports trigonometriques | `trigo` | Confirme dans snippets Google |
| Systemes d'equations | `sys` | Programme 1ere-tc |
| Statistiques | `stat` | Programme 1ere-tc |

### Niveaux superieurs (non detailles)

Le site proposait egalement des cours pour :

- **2eme annee** : Sciences/Info, Technologie de l'informatique
- **3eme annee** : Math, Sciences experimentales, Sciences techniques, Sciences de l'informatique
  - Chapitres identifies : Continuite, TVI, Equations trigonometriques, Representation parametrique, Positions relatives
- **4eme annee** : Sciences de l'informatique, Sciences techniques
  - Chapitres identifies : Analyse de fonctions, Suites, Derivation, Theoreme de Bezout, Lemme de Gauss

## Modules non-mappes

Aucun module non-mappe identifie — les chapitres connus correspondent au programme tunisien officiel.

## Historique des scans

| Date | Action | Notes |
|------|--------|-------|
| 2026-02-07 | Scan initial (partiel) | Site HORS LIGNE. Fiche reconstituee a partir de Google Search, snippets, et article THD.tn. Aucune page n'a pu etre fetchee directement. A re-scanner si le site revient en ligne. |
