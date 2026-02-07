# Devoirat.net

> Derniere mise a jour : 2026-02-07

## Meta

| Champ | Valeur |
|-------|--------|
| URL | https://www.devoirat.net |
| Type | site-tn |
| Niveaux | 1ere, 2nde, 3eme, Term |
| Langues | fr |
| Acces | gratuit |
| Qualite | ★★★☆☆ |
| Derniere verification | 2026-02-07 |

## Description

Devoirat.net est un depot massif de devoirs, series d'exercices et cours pour le lycee tunisien (1ere a 4eme annee secondaire). Le site couvre toutes les matieres (maths, physique, SVT, informatique, langues...) et toutes les sections (Maths, Sciences, Technique, Economie, Informatique). Son point fort est le volume considerable de devoirs de controle et de synthese provenant de divers enseignants tunisiens, organises par trimestre et type. Le contenu est exclusivement en PDF.

## Instructions LLM

### Navigation

- URL de base : `https://www.devoirat.net`
- Pattern de navigation : arborescence par matiere > type > niveau > section > trimestre
- Sitemap : non disponible (403 sur /sitemap.xml)
- Le site bloque les requetes WebFetch directes (403), mais fonctionne via navigateur Chrome

### Extraction de contenu

- Format principal : PDF (telechargements directs)
- LaTeX : aucun (contenu uniquement en PDF)
- Methode d'extraction : navigation Chrome requise, puis liens `/app/download/{id}/{filename}.pdf`
- Contenu protege : aucun, tout est gratuit et en acces libre

### Patterns d'URL

- Cours 1ere : `https://www.devoirat.net/maths/cours-maths/1ère-année-cours-mathématiques/`
- Cours 2eme : `https://www.devoirat.net/maths/cours-maths/2ème-année/`
- Cours 3eme : `https://www.devoirat.net/maths/cours-maths/3ème-année/` (hub avec sous-sections par filiere)
- Cours 4eme : `https://www.devoirat.net/maths/cours-maths/4ème-année-bac/` (hub)
- Series 1ere : `https://www.devoirat.net/maths/séries-maths/1ère-année/`
- Series 3eme Math : `https://www.devoirat.net/maths/séries-maths/3ème-année-mathématiques/`
- Series 4eme Math : `https://www.devoirat.net/maths/séries-maths/4ème-année-bac/`
- Devoirs 1ere T1 DC1 : `https://www.devoirat.net/maths/devoirs-maths/1ère-année-1er-trimestre-contrôle-1/`
- Devoirs 1ere T1 DS1 : `https://www.devoirat.net/maths/devoirs-maths/1ère-année-1er-trimestre-synthèse-1/`
- Devoirs 1ere T2 : `https://www.devoirat.net/maths/devoirs-maths/1ère-année-2ème-trimestre-synthèse-2/`
- Devoirs 1ere T3 : `https://www.devoirat.net/maths/devoirs-maths/1ère-année-3ème-trimestre/`
- Telechargements PDF : `https://www.devoirat.net/app/download/{id}/{filename}.pdf?t={timestamp}`

### Limites et precautions

- Le site retourne 403 pour les requetes programmatiques (WebFetch/curl). Navigateur Chrome requis.
- Les URLs contiennent des caracteres speciaux encodes (accents francais) — utiliser l'encodage URL (%C3%A8 pour e, etc.)
- Le site est heberge sur Jimdo (Quarkpixel), rendu cote serveur, HTML statique.
- Pas de structuration par chapitre/topic au sein des pages — les PDFs sont listes a plat avec titres descriptifs.
- Certaines pages "hub" (ex: cours 3eme annee) sont vides et redirigent vers des sous-sections par filiere.
- Les devoirs ne sont pas classes par chapitre mais par trimestre et type (controle / synthese / maison).

## Ressources par module

### angles — Angles

#### Cours
- [cours] /app/download/.../Cours+Math+-+Angles+-+1ère+AS.pdf
  Cours complet sur les angles par Mr Ali Akir. Format: pdf.

#### Series
- [serie] /app/download/.../Série+d'exercices+-+Math+-+Angles+-+1ère+AS.pdf
  Serie d'exercices sur les angles, 1ere AS. Format: pdf.

### thales — Theoreme de Thales

#### Cours
- [cours] /app/download/.../Cours+Math+-+Théorème+de+Thales+-+1ère+AS.pdf
  Cours complet theoreme de Thales par Mr Ali Akir. Format: pdf.

#### Series
- [serie] /app/download/.../Série+d'exercices+-+Math+-+Théorème+de+tales+-+1ère+AS.pdf
  Serie d'exercices sur le theoreme de Thales. Format: pdf.

### trigo — Rapports trigonometriques

#### Cours
- [cours] /app/download/.../Cours+Math+-+Trigonométrie-+1ère+AS.pdf
  Cours rapports trigonometriques par Mr Ali Akir. Format: pdf.
- [cours] /app/download/.../Cours+-+Math+Rapports+trigonométriques...1ère+AS.pdf
  Cours rapports trigo par Mr Hemmedi Sami. Format: pdf.

#### Series
- [serie] /app/download/.../Série+d'exercices+-+Math+-+Trigonométrie+-+1ère+AS.pdf
  Serie d'exercices trigonometrie, 1ere AS. Format: pdf.

### vt — Vecteurs et translations

#### Cours
- [cours] /app/download/.../Cours+Math+-+Vecteure+et+Translation+-+1ère+AS.pdf
  Cours vecteurs et translations par Mr Ali Akir. Format: pdf.
- [cours] /app/download/.../Cours+-+Math+Vecteurs+et+translations+1ère+AS.pdf
  Cours vecteurs et translations par Mr Gary. Format: pdf.

#### Series
- [serie] /app/download/.../Série+d'exercices+-+Math+-+Vecteur+translation+-+1ère+AS.pdf
  Serie d'exercices vecteurs et translations. Format: pdf.

### repere — Activites dans un repere

#### Cours
- [cours] /app/download/.../Cours+Math+-+Activités+dans+un+repère+-+1ère+AS.pdf
  Cours activites dans un repere par Mr Ali Akir. Format: pdf.
- [cours] /app/download/.../Cours+-+Math+Géomertrie+Activités+dans+un+repère+1ère+AS.pdf
  Cours geometrie repere par Mr Gary. Format: pdf.

#### Series
- [serie] /app/download/.../Série+d'exercices+-+Math+-+Activités+dans+un+repère+-+1ère+AS.pdf
  Serie d'exercices sur le repere. Format: pdf.

### qt — Quart de tour

#### Cours
- [cours] /app/download/.../Cours+Math+-+Quard+de+tour+-+1ère+AS.pdf
  Cours quart de tour par Mr Ali Akir. Format: pdf.

#### Series
- [serie] /app/download/.../Série+d'exercices+-+Math+-+Quart+de+tour+-+1ère+AS.pdf
  Serie d'exercices quart de tour. Format: pdf.

### ss — Sections de solides

#### Cours
- [cours] /app/download/.../Cours+Lycée+pilote+-+Math+-+Résumé+de+chapitre+Sections+planes+de+solides+-+1ère+AS.pdf
  Resume de chapitre sections planes de solides (lycee pilote). Format: pdf.

### num1 — Calcul numerique 1 (Activites numeriques 1)

#### Cours
- [cours] /app/download/.../Cours+Math+-+Activités+numériques+1+-+1ère+AS.pdf
  Cours activites numeriques 1 par Mr Ali Akir. Format: pdf.

#### Series
- [serie] /app/download/.../Série+d'exercices+-+Math+-+Activités+numériques+(1)+-+1ère+AS.pdf
  Serie d'exercices activites numeriques 1. Format: pdf.

### num2 — Calcul numerique 2 (Activites numeriques 2)

#### Cours
- [cours] /app/download/.../Cours+Math+-+Activités+numériques+2+-+1ère+AS.pdf
  Cours activites numeriques 2 par Mr Ali Akir. Format: pdf.

#### Series
- [serie] /app/download/.../Série+d'exercices+-+Math+-+Activités+numériques+(2)+-+1ère+AS.pdf
  Serie d'exercices activites numeriques 2. Format: pdf.

### algebre — Algebre (Activites algebriques)

#### Cours
- [cours] /app/download/.../Cours+Math+-+Activités+algébriques+-+1ère+AS.pdf
  Cours activites algebriques par Mr Ali Akir. Format: pdf.

#### Series
- [serie] /app/download/.../Série+d'exercices+-+Math+-+Activités+algébriques+-+1ère+AS.pdf
  Serie d'exercices activites algebriques. Format: pdf.

### fl — Fonctions lineaires

#### Cours
- [cours] /app/download/.../Cours+Math+-+Fonctions+linéaires+-+1ère+AS.pdf
  Cours fonctions lineaires par Mr Ali Akir. Format: pdf.
- [cours] /app/download/.../Cours+-+Math+Fonctions+linéaires+1ère+AS.pdf
  Cours fonctions lineaires par Mr Gary. Format: pdf.

#### Series
- [serie] /app/download/.../Serie+Math+-+1ère+AS+(Fonctions+linéaires).pdf
  Serie exercices fonctions lineaires. Format: pdf.
- [serie] /app/download/.../Serie+d'exercices+-+Math+-+Fonctions+linéaires,+fonctions+affines+-+1ère+AS.pdf
  Serie exercices fonctions lineaires et affines. Format: pdf.
- [serie] /app/download/.../Série+d'exercices+-+Math+-+Fonctions+linéaires+-+1ère+AS.pdf
  Serie exercices fonctions lineaires (2eme version). Format: pdf.

### fa — Fonctions affines

#### Cours
- [cours] /app/download/.../Cours+Math+-+Fonctions+affines+-+1ère+AS.pdf
  Cours fonctions affines par Mr Ali Akir. Format: pdf.
- [cours] /app/download/.../Cours+-+Math+Fonctions+affines+1ère+AS.pdf
  Cours fonctions affines par Mr Gary. Format: pdf.

#### Series
- [serie] /app/download/.../Série+d'exercices+-+Math+-+Fonctions+affines+-+1ère+AS.pdf
  Serie exercices fonctions affines. Format: pdf.

### ei — Equations et inequations

#### Cours
- [cours] /app/download/.../Cours+Math+-+Equations+&+Inequations+-+1ère+AS.pdf
  Cours equations et inequations par Mr Ali Akir. Format: pdf.
- [cours] /app/download/.../Cours+-+Math+-+Equations+et+inéquations...1ère+AS.pdf
  Cours equations et inequations par Ahmed Lazhar. Format: pdf.

#### Series
- [serie] /app/download/.../Série+d'exercices+-+Math+-+Equations+Inequations+-+1ère+AS.pdf
  Serie exercices equations et inequations. Format: pdf.

### sys — Systemes

#### Cours
- [cours] /app/download/.../Cours+Math+-+Systèmes+-+1ère+AS.pdf
  Cours systemes par Mr Ali Akir. Format: pdf.
- [cours] /app/download/.../Cours+-+Math+Système+de+deux+équations...1ère+AS.pdf
  Cours systemes par Mr Gary. Format: pdf.

#### Series
- [serie] /app/download/.../Série+d'exercices+-+Math+-+Systèmes+-+1ère+AS.pdf
  Serie exercices systemes. Format: pdf.

### stat — Statistiques

#### Cours
- [cours] /app/download/.../Cours+-+Math+Statistiques+1ère+AS.pdf
  Cours statistiques par Mr Gary. Format: pdf.
- [cours] /app/download/.../Cours+-+Math+Statistiques+-+1ère+AS.pdf
  Cours statistiques par Mme Guesmia Aziza. Format: pdf.

### Devoirs 1ere annee (tous chapitres confondus)

Le site propose des centaines de devoirs organises par trimestre et type, NON par chapitre.
Chaque page de devoirs contient des dizaines de PDFs de differents enseignants et annees scolaires.

#### Devoirs de controle
- [devoir] /maths/devoirs-maths/1ère-année-1er-trimestre-contrôle-1/
  ~91 devoirs de controle N1, 1er trimestre. Annees 2011-2023. Certains avec correction. Format: pdf.
- [devoir] /maths/devoirs-maths/1ère-année-1er-trimestre-contrôle-2/
  Devoirs de controle N2, 1er trimestre. Format: pdf.
- [devoir] /maths/devoirs-maths/1ère-année-2ème-trimestre-contrôle-3/
  Devoirs de controle, 2eme trimestre. Format: pdf.

#### Devoirs de synthese
- [devoir] /maths/devoirs-maths/1ère-année-1er-trimestre-synthèse-1/
  Devoirs de synthese N1, 1er trimestre. Format: pdf.
- [devoir] /maths/devoirs-maths/1ère-année-2ème-trimestre-synthèse-2/
  Devoirs de synthese N2, 2eme trimestre. Format: pdf.

#### 3eme trimestre
- [devoir] /maths/devoirs-maths/1ère-année-3ème-trimestre/
  Devoirs du 3eme trimestre (controle et synthese). Format: pdf.

## Ressources 3eme annee (Section Mathematiques)

### Series 3eme Math

Le site propose ~74 series pour la section Mathematiques, couvrant :
- Generalites sur les fonctions
- Nombre derive
- Limites et asymptotes
- Limites, continuite et derivabilite
- Denombrement
- Geometrie dans l'espace
- Fonctions trigonometriques
- Produit scalaire dans le plan
- Suites reelles

Ces topics correspondent a notre programme 3eme-math.

### Devoirs 3eme Math

Organises par trimestre :
- [devoir] /maths/devoirs-maths/3ème-année-maths-1er-trimestre/
- [devoir] /maths/devoirs-maths/3ème-année-maths-2ème-trimestre/
- [devoir] /maths/devoirs-maths/3ème-année-maths-3ème-trimestre/

## Ressources 4eme annee (Bac)

### Series 4eme Math

Series organisees par periode :
- [serie] /maths/séries-maths/4ème-année-bac/ — Hub general
- 2008-2013, 2013-2015, 2015-2016, 2016-2018, 2018-2020, 2021-2025

Topics couverts : Continuite et limites, Suites reelles, Derivabilite, Fonctions reciproques, Primitives, Nombres complexes, Isometries du plan, Deplacements et anti-deplacements, Similitudes.

### Cours 4eme Math
- [cours] /maths/cours-maths/bac-maths/ — Section Mathematiques
- [cours] /maths/cours-maths/bac-sciences/ — Section Sciences Expert

### Devoirs Bac
- [devoir] /maths/devoirs-maths/4ème-année-maths-1er-trimestre/
- [devoir] /maths/devoirs-maths/4ème-année-maths-2ème-trimestre/
- [devoir] /maths/devoirs-maths/4ème-année-maths-3ème-trimestre/

## Modules non-mappes

Les chapitres suivants du 3eme/4eme annee ne correspondent pas a nos modules actuels (1ere-tc) :

- **Continuite et limites** : 3eme/4eme math — programme 3eme-math
- **Derivation / Derivabilite** : 3eme/4eme math
- **Suites reelles** : 3eme/4eme math
- **Denombrement** : 3eme math
- **Produit scalaire** : 3eme math
- **Fonctions trigonometriques** : 3eme math
- **Nombres complexes** : 4eme math
- **Isometries du plan** : 4eme math
- **Primitives / Integrales** : 4eme math
- **Fonctions reciproques** : 4eme math
- **Similitudes** : 4eme math
- **Coniques** : 4eme math

## Volume estime

| Niveau | Type | Nb PDFs (estime) |
|--------|------|-------------------|
| 1ere annee | Cours | ~23 |
| 1ere annee | Series | ~130 |
| 1ere annee | Devoirs | ~400+ (91 pour DC1 seul) |
| 2eme annee | Series + Devoirs | ~200+ |
| 3eme annee Math | Series | ~74 |
| 3eme annee | Devoirs | ~300+ |
| 4eme annee | Series | ~200+ |
| 4eme annee | Devoirs | ~500+ |
| **Total estime** | | **~1500+ PDFs maths** |

## Historique des scans

| Date | Action | Notes |
|------|--------|-------|
| 2026-02-07 | Scan initial | Site bloque WebFetch (403), scan via Chrome. Volume massif de devoirs. Cours limites a 2 auteurs principaux (Mr Ali Akir, Mr Gary). |
