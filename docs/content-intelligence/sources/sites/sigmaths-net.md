# Sigmaths.net

> Derniere mise a jour : 2026-02-07

## Meta

| Champ | Valeur |
|-------|--------|
| URL | https://www.sigmaths.net |
| Type | site-tn |
| Niveaux | 1ere, 2nde, 3eme, Term |
| Langues | fr, ar |
| Acces | gratuit |
| Qualite | ★★★★☆ |
| Derniere verification | 2026-02-07 |

## Description

Sigmaths.net est une plateforme educative tunisienne collaborative dediee aux mathematiques, du college au lycee. Le site propose des exercices interactifs corriges en ligne (images GIF avec correction devoilable), des documents PDF uploades par des enseignants contributeurs (series, devoirs, cours), et des manuels scolaires numerises. Le contenu couvre l'integralite du programme tunisien de la 7eme au Baccalaureat, avec une richesse particuliere sur la 1ere annee secondaire (~780 exercices en ligne).

## Instructions LLM

### Navigation

- URL de base : `https://www.sigmaths.net`
- Exercices en ligne : `https://www.sigmaths.net/exercices/exercices.php?classe={classe}&type={type}&page={page}`
- Documents PDF : `https://www.sigmaths.net/up_docs/documents.php?niv={niv}`
- Details document : `https://www.sigmaths.net/up_docs/details.php?doc_id={id}`
- Manuels : `https://www.sigmaths.net/manuels/mnReader.php?id={id}`
- Sitemap : `https://www.sigmaths.net/sitemap.xml` (disponible)

### Extraction de contenu

- Format principal : HTML (exercices en ligne) + PDF (documents uploades)
- LaTeX : KaTeX via JavaScript (`renderMathInElement` avec delimiteurs `$$..$$`, `$...$`, `\[..\]`, `\(..\)`)
- Les enonces d'exercices sont affiches en images GIF (non parsables en texte)
- Les corrections sont en HTML avec KaTeX (texte extractible)
- Methode d'extraction : direct fetch, pas de SPA, HTML server-rendered
- Contenu protege : aucun, tout est gratuit et accessible

### Patterns d'URL

#### Exercices en ligne (1ere annee)

| type | Chapitre | Nb exercices |
|------|----------|-------------|
| 0 | Activites numeriques I | 88 |
| 1 | Activites numeriques II | 119 |
| 2 | Activites algebriques | 77 |
| 3 | Fonctions lineaires | 54 |
| 4 | Equations et inequations | 81 |
| 5 | Fonctions affines | 46 |
| 6 | Systeme de deux equations | 55 |
| 7 | Statistiques | 39 |
| 8 | Angles | 48 |
| 9 | Thales | 61 |
| 10 | Rapports trigonometriques | 67 |
| 11 | Vecteurs et translations | 88 |
| 12 | Activites dans un repere | 58 |
| 13 | Quart de tour | 29 |
| 14 | Sections planes de solides | 14 |
| 15 | QCM | 78 |

Pattern : `exercices.php?classe=1s&type={0-15}&page={1-N}`

#### Exercices en ligne (2eme annee sciences)

Pattern : `exercices.php?classe=2sc&type={0-15}&page={1-N}`
Chapitres : Calcul dans IR, Problemes 1er/2nd degre, Polynomes, Arithmetique, Calcul vectoriel, Barycentre, Translations, Homotheties, Rotations, Suites, Fonctions, Trigonometrie, Geometrie analytique, Geometrie espace, Statistiques, QCM

#### Exercices en ligne (3eme annee maths)

Pattern : `exercices.php?classe=3eme&type={0-4}&page={1-N}`
Chapitres : Generalites fonctions, Produit scalaire, Limites et continuite, Angles orientes, Derivabilite

#### Documents PDF

- Telechargement direct : `https://www.sigmaths.net/up_docs/docs2/{id}_{timestamp}.pdf`
- Page details avec viewers : `details.php?doc_id={id}`
- Filtrage par niveau : `documents.php?niv={7b|8b|9b|1s|2sc|3m|4m}`

### Limites et precautions

- Les enonces d'exercices en ligne sont des **images GIF** (non extractibles en texte, necessitent OCR)
- Les corrections sont en HTML/KaTeX (extractibles)
- Le site est rapide, pas de rate limiting apparent
- Certains documents PDF sont des scans (non parsables)
- Pas d'API, scraping HTML classique uniquement
- Les images d'exercices suivent le pattern `/{timestamp}_{random}.gif`

## Ressources par module

### angles — Angles

#### Exercices en ligne
- [exercice] https://www.sigmaths.net/exercices/exercices.php?classe=1s&type=8&page={1-48}
  48 exercices corriges sur les angles. Enonces en images GIF, corrections en HTML/KaTeX. Format: html.

#### Series
- [serie] https://www.sigmaths.net/up_docs/details.php?doc_id=445
  Serie d'exercices 1s (Angles) par Dhaouadi Nejib (2021). Corrige: non. Format: pdf.

### thales — Thales

#### Exercices en ligne
- [exercice] https://www.sigmaths.net/exercices/exercices.php?classe=1s&type=9&page={1-61}
  61 exercices corriges sur le theoreme de Thales. Figures geometriques en images GIF. Format: html.

### trigo — Rapports trigonometriques

#### Exercices en ligne
- [exercice] https://www.sigmaths.net/exercices/exercices.php?classe=1s&type=10&page={1-67}
  67 exercices corriges sur les rapports trigonometriques (sin, cos, tan). Format: html.

### vt — Vecteurs et translations

#### Exercices en ligne
- [exercice] https://www.sigmaths.net/exercices/exercices.php?classe=1s&type=11&page={1-88}
  88 exercices corriges sur les vecteurs et translations. Format: html.

### repere — Activites dans un repere

#### Exercices en ligne
- [exercice] https://www.sigmaths.net/exercices/exercices.php?classe=1s&type=12&page={1-58}
  58 exercices corriges sur les coordonnees, distances, milieux dans un repere. Format: html.

### qt — Quart de tour

#### Exercices en ligne
- [exercice] https://www.sigmaths.net/exercices/exercices.php?classe=1s&type=13&page={1-29}
  29 exercices corriges sur la rotation d'un quart de tour. Format: html.

### ss — Sections de solides

#### Exercices en ligne
- [exercice] https://www.sigmaths.net/exercices/exercices.php?classe=1s&type=14&page={1-14}
  14 exercices corriges sur les sections planes de solides. Format: html.

### num1 — Calcul numerique 1

#### Exercices en ligne
- [exercice] https://www.sigmaths.net/exercices/exercices.php?classe=1s&type=0&page={1-88}
  88 exercices corriges sur les activites numeriques (divisibilite, PGCD, fractions). Format: html.

### num2 — Calcul numerique 2

#### Exercices en ligne
- [exercice] https://www.sigmaths.net/exercices/exercices.php?classe=1s&type=1&page={1-119}
  119 exercices corriges sur les activites numeriques II (puissances, racines). Format: html.

### algebre — Algebre

#### Exercices en ligne
- [exercice] https://www.sigmaths.net/exercices/exercices.php?classe=1s&type=2&page={1-77}
  77 exercices corriges sur les activites algebriques (calcul litteral, factorisation). Format: html.

### fl — Fonctions lineaires

#### Exercices en ligne
- [exercice] https://www.sigmaths.net/exercices/exercices.php?classe=1s&type=3&page={1-54}
  54 exercices corriges sur les fonctions lineaires. Format: html.

### ei — Equations et inequations

#### Exercices en ligne
- [exercice] https://www.sigmaths.net/exercices/exercices.php?classe=1s&type=4&page={1-81}
  81 exercices corriges sur les equations et inequations du 1er degre. Format: html.

#### Cours PDF
- [cours] https://www.sigmaths.net/up_docs/details.php?doc_id=377
  Cours equation premier degre par Dhaouadi Nejib (2019). Format: pdf.
- [cours] https://www.sigmaths.net/up_docs/details.php?doc_id=378
  Cours inequation premier degre par Dhaouadi Nejib (2019). Format: pdf.

### fa — Fonctions affines

#### Exercices en ligne
- [exercice] https://www.sigmaths.net/exercices/exercices.php?classe=1s&type=5&page={1-46}
  46 exercices corriges sur les fonctions affines. Format: html.

### sys — Systemes

#### Exercices en ligne
- [exercice] https://www.sigmaths.net/exercices/exercices.php?classe=1s&type=6&page={1-55}
  55 exercices corriges sur les systemes de deux equations. Format: html.

#### Cours PDF
- [cours] https://www.sigmaths.net/up_docs/details.php?doc_id=379
  Cours systeme d'equations par Dhaouadi Nejib (2019). Format: pdf.

### stat — Statistiques

#### Exercices en ligne
- [exercice] https://www.sigmaths.net/exercices/exercices.php?classe=1s&type=7&page={1-39}
  39 exercices corriges sur les statistiques. Format: html.

### QCM (tous modules confondus)

- [qcm] https://www.sigmaths.net/exercices/exercices.php?classe=1s&type=15&page={1-78}
  78 QCM couvrant tous les modules de 1ere annee. Format: html.

### Devoirs (tous modules confondus)

#### Devoirs de controle
- [devoir] https://www.sigmaths.net/up_docs/details.php?doc_id=410
  DC1 2019/20 par Smaali Mondher. Corrige: non. Format: pdf.
- [devoir] https://www.sigmaths.net/up_docs/details.php?doc_id=375
  DC1 2018 par Bellili Mongi. Corrige: non. Format: pdf.
- [devoir] https://www.sigmaths.net/up_docs/details.php?doc_id=364
  DC1 2018 par Bellili Mongi. Corrige: non. Format: pdf.
- [devoir] https://www.sigmaths.net/up_docs/details.php?doc_id=343
  DC1 2018 par Bellili Mongi. Corrige: non. Format: pdf.
- [devoir] https://www.sigmaths.net/up_docs/details.php?doc_id=292
  DC1 2017/18 par Smaali Mondher. Corrige: non. Format: pdf.
- [devoir] https://www.sigmaths.net/up_docs/details.php?doc_id=281
  DC1 2017 par Elabidi Zahi. Corrige: non. Format: pdf.
- [devoir] https://www.sigmaths.net/up_docs/details.php?doc_id=282
  DC1 2017 par Elabidi Zahi. Corrige: non. Format: pdf.
- [devoir] https://www.sigmaths.net/up_docs/details.php?doc_id=217
  DC1 2016 par Missaoui Lazhar. Corrige: non. Format: pdf.
- [devoir] https://www.sigmaths.net/up_docs/details.php?doc_id=216
  DC1 2016 par Missaoui Lazhar. Corrige: non. Format: pdf.
- [devoir] https://www.sigmaths.net/up_docs/details.php?doc_id=88
  DC1 2010 par Hamdi Mabrouk. Corrige: non. Format: pdf.
- [devoir] https://www.sigmaths.net/up_docs/details.php?doc_id=411
  DC2 2019/20 par Smaali Mondher. Corrige: non. Format: pdf.
- [devoir] https://www.sigmaths.net/up_docs/details.php?doc_id=293
  DC2 2017/18 par Smaali Mondher. Corrige: non. Format: pdf.
- [devoir] https://www.sigmaths.net/up_docs/details.php?doc_id=297
  DC2 2017 par Elabidi Zahi. Corrige: non. Format: pdf.
- [devoir] https://www.sigmaths.net/up_docs/details.php?doc_id=295
  DC2 2017 par Elabidi Zahi. Corrige: non. Format: pdf.
- [devoir] https://www.sigmaths.net/up_docs/details.php?doc_id=296
  DC2 2017 par Elabidi Zahi. Corrige: non. Format: pdf.
- [devoir] https://www.sigmaths.net/up_docs/details.php?doc_id=366
  DC2 2016 par Bellili Mongi. Corrige: non. Format: pdf.
- [devoir] https://www.sigmaths.net/up_docs/details.php?doc_id=365
  DC2 2016 par Bellili Mongi. Corrige: non. Format: pdf.
- [devoir] https://www.sigmaths.net/up_docs/details.php?doc_id=85
  DC2 2011 par Hamdi Mabrouk. Corrige: non. Format: pdf.
- [devoir] https://www.sigmaths.net/up_docs/details.php?doc_id=86
  DC2 2010 par Hamdi Mabrouk. Corrige: non. Format: pdf.
- [devoir] https://www.sigmaths.net/up_docs/details.php?doc_id=412
  DC3 2019/20 par Smaali Mondher. Corrige: non. Format: pdf.
- [devoir] https://www.sigmaths.net/up_docs/details.php?doc_id=413
  DC4 2019/20 par Smaali Mondher. Corrige: non. Format: pdf.
- [devoir] https://www.sigmaths.net/up_docs/details.php?doc_id=87
  DC6 2010 par Hamdi Mabrouk. Corrige: non. Format: pdf.

#### Devoirs de synthese
- [devoir] https://www.sigmaths.net/up_docs/details.php?doc_id=414
  DS1 2019/20 par Smaali Mondher. Corrige: non. Format: pdf.
- [devoir] https://www.sigmaths.net/up_docs/details.php?doc_id=384
  DS1 2019 par Bellili Mongi. Corrige: non. Format: pdf.
- [devoir] https://www.sigmaths.net/up_docs/details.php?doc_id=222
  DS1 2016 par Missaoui Lazhar. Corrige: non. Format: pdf.
- [devoir] https://www.sigmaths.net/up_docs/details.php?doc_id=221
  DS1 2016 par Missaoui Lazhar. Corrige: non. Format: pdf.
- [devoir] https://www.sigmaths.net/up_docs/details.php?doc_id=220
  DS1 2016 par Missaoui Lazhar. Corrige: non. Format: pdf.
- [devoir] https://www.sigmaths.net/up_docs/details.php?doc_id=89
  DS1 2010 par Hamdi Mabrouk. Corrige: non. Format: pdf.
- [devoir] https://www.sigmaths.net/up_docs/details.php?doc_id=415
  DS2 2019/20 par Smaali Mondher. Corrige: non. Format: pdf.
- [devoir] https://www.sigmaths.net/up_docs/details.php?doc_id=394
  DS3 2019 par Bellili Mongi. Corrige: non. Format: pdf.

#### Series d'exercices (PDF)
- [serie] https://www.sigmaths.net/up_docs/details.php?doc_id=445
  Serie d'exercices Angles par Dhaouadi Nejib (2021). Corrige: non. Format: pdf.
- [serie] https://www.sigmaths.net/up_docs/details.php?doc_id=438
  Serie equations + repere par Smaali Mondher (2018/19). Corrige: non. Format: pdf.
- [serie] https://www.sigmaths.net/up_docs/details.php?doc_id=298
  Devoir maison par Smaali Mondher (2017/18). Corrige: non. Format: pdf.
- [serie] https://www.sigmaths.net/up_docs/details.php?doc_id=458
  Exercices systemes par Slim Hmam. Corrige: non. Format: pdf.

### Manuels scolaires (1ere annee)

- [cours] https://www.sigmaths.net/manuels/mnReader.php?id=4
  Manuel scolaire 1ere annee — Tome 1. Format: html (reader en ligne).
- [cours] https://www.sigmaths.net/manuels/mnReader.php?id=5
  Manuel scolaire 1ere annee — Tome 2. Format: html (reader en ligne).

## Modules non-mappes

Aucun — tous les chapitres du site pour la 1ere annee correspondent a nos modules.

Les chapitres des autres niveaux non encore mappes :
- **2eme sciences** : Calcul dans IR, Problemes 1er/2nd degre, Polynomes, Arithmetique, Calcul vectoriel, Barycentre, Homotheties, Rotations, Suites, Fonctions, Trigonometrie, Geometrie analytique, Geometrie espace
- **3eme maths** : Generalites fonctions, Produit scalaire, Limites et continuite, Angles orientes, Derivabilite
- **Bac** : Limites/Derivees, Suites, Etude de fonctions, Logarithmes, Exponentielles, Integrales, Nombres complexes, Geometrie, Arithmetique, Probabilites, Statistiques

## Historique des scans

| Date | Action | Notes |
|------|--------|-------|
| 2026-02-07 | Scan initial | 780+ exercices en ligne 1ere annee, 60+ documents PDF, 23 manuels numerises. Exercices = images GIF (enonces) + HTML/KaTeX (corrections). |
