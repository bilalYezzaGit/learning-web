# Devoir.TN

> Derniere mise a jour : 2026-02-07

## Meta

| Champ | Valeur |
|-------|--------|
| URL | https://www.devoir.tn |
| Type | site-tn |
| Niveaux | 1ere, 2nde, 3eme, Term |
| Langues | fr, ar |
| Acces | gratuit |
| Qualite | ★★★☆☆ |
| Derniere verification | 2026-02-07 |

## Description

Devoir.TN est le plus grand portail tunisien de devoirs et series d'exercices pour le secondaire. Le site se presente comme "le site Numero 1 pour la preparation des devoirs en Tunisie". Il couvre tous les niveaux du primaire au superieur, avec un focus sur les devoirs de controle et de synthese accompagnes parfois de corrections. Le contenu est principalement en PDF, produit par des enseignants tunisiens identifies par nom et lycee. Le site est bilingue francais/arabe.

## Instructions LLM

### Navigation

- URL de base : `https://www.devoir.tn`
- Pattern de navigation : `/secondaire/{niveau}/{matiere}/{type}.html`
- Niveaux : `1-ère-année`, `2-ème-années`, `3-ème-années`, `4-ème-années`
- Types : `Cours`, `Devoirs`, `Séries`
- Les devoirs sont sous-categorises : `Devoirs/Devoirs-de-contrôle-n°1.html`, `Devoirs/Devoirs-de-synthèse-n°1.html`, etc.
- Sitemap : oui (`/sitemap.xml` — tres volumineux, >10MB)

### Extraction de contenu

- Format principal : PDF
- LaTeX : absent (documents PDF scannes ou generes par Word)
- Methode d'extraction : navigation HTML vers pages listing, puis liens directs PDF
- Les PDFs sont stockes dans `/Doc/{niveau}/{matiere}/{type}/{sous-type}/{fichier}.pdf`
- Contenu protege : aucun, tout est en acces libre

### Patterns d'URL

- Cours : `https://www.devoir.tn/secondaire/{niveau}/Mathématiques/Cours.html`
- Series : `https://www.devoir.tn/secondaire/{niveau}/Mathématiques/Séries.html`
- Devoirs : `https://www.devoir.tn/secondaire/{niveau}/Mathématiques/Devoirs.html`
- Devoirs specifiques : `https://www.devoir.tn/secondaire/{niveau}/Mathématiques/Devoirs/Devoirs-de-{type}-n°{N}.html`
- PDFs : `https://www.devoir.tn/Doc/{niveau}/Mathématiques/{section}/{fichier}.pdf`

### Limites et precautions

- Sitemap trop volumineux pour etre telecharge (>10MB)
- Pas de LaTeX/MathJax : les formules sont dans les PDFs uniquement
- Tres peu de corriges disponibles (ratio ~2% des ressources)
- Qualite variable selon l'auteur : certains PDFs sont scannes, d'autres bien structures
- Pas de classification par chapitre dans les devoirs (les devoirs couvrent generalement plusieurs chapitres)
- Encodage URL avec caracteres accentues (utiliser l'URL-encoding pour les accents)
- Site relativement lent sur certaines pages de listing

## Ressources par module

### num1 — Calcul numerique 1

#### Series
- [serie] Séries/Activite-numeriques-1.pdf
  Activites numeriques 1. Format: pdf.
- [serie] Séries/activites-numeriques-i-04-exercices.pdf
  Activites numeriques I — 4 exercices. Format: pdf.
- [serie] Séries/activites-numeriques-i-06-exercices.pdf
  Activites numeriques I — 6 exercices. Format: pdf.
- [serie] Séries/activites-numeriques-i-07-exercices.pdf
  Activites numeriques I — 7 exercices. Format: pdf.
- [serie] Séries/activites-numeriques-i-13-exercices.pdf
  Activites numeriques I — 13 exercices. Format: pdf.
- [serie] Séries/activité-numérique-i--2010-2011.pdf
  Activite numerique I (2010-2011). Format: pdf.
- [serie] Séries/Activité-numérique.pdf
  Activite numerique. Format: pdf.
- [serie] Séries/activités-numériques-i--2009-2010.pdf
  Activites numeriques I (2009-2010). Format: pdf.
- [serie] Séries/activités-numériques-I--2019-2020.pdf
  Activites numeriques I (2019-2020). Format: pdf.
- [serie] Séries/Activités-numériques-Mohamed-Benzina-2013-2014.pdf
  Activites numeriques — Benzina (2013-2014). Format: pdf.
- [serie] Séries/Activités-numériques-Yahmadi-Selmi-Sonia-2010-2011.pdf
  Activites numeriques — Yahmadi (2010-2011). Format: pdf.
- [serie] Séries/Calculnumériques-1.pdf
  Calculs numeriques 1. Format: pdf.
- [serie] Séries/calculs-dans-ir-6-exercices.pdf
  Calculs dans IR — 6 exercices. Format: pdf.
- [serie] Séries/opération-dans-IR.pdf
  Operations dans IR. Format: pdf.
- [serie] Séries/racines-carrés.pdf
  Racines carrees. Format: pdf.

### num2 — Calcul numerique 2

#### Series
- [serie] Séries/activites-numeriques-ii-11-exercices.pdf
  Activites numeriques II — 11 exercices. Format: pdf.
- [serie] Séries/activites-numeriques-ii-et-angles-08-exercices.pdf
  Activites numeriques II et Angles — 8 exercices (mixte num2+angles). Format: pdf.
- [serie] Séries/Activité-numérique-2.pdf
  Activite numerique 2. Format: pdf.
- [serie] Séries/activités-numériques-ii--2009-2010.pdf
  Activites numeriques II (2009-2010). Format: pdf.
- [serie] Séries/activités-numériques-ii--2011-2012.pdf
  Activites numeriques II — Guesmia (2011-2012). Format: pdf.

### algebre — Algebre

#### Series
- [serie] Séries/activités-algébriques--2009-2010.pdf
  Activites algebriques (2009-2010). Format: pdf.
- [serie] Séries/produit-remarquable-Yahmadi-Selmi-Sonia-2010-2011.pdf
  Produits remarquables — Yahmadi (2010-2011). Format: pdf.
- [serie] Séries/produits-remarquables-2.pdf
  Produits remarquables 2. Format: pdf.
- [serie] Séries/Produits-remarquables-Rgaig-Farhat-2008-2009.pdf
  Produits remarquables — Rgaig Farhat (2008-2009). Format: pdf.
- [serie] Séries/Produits-remarquables.pdf
  Produits remarquables. Format: pdf.

### angles — Angles

#### Series
- [serie] Séries/angles--2010.pdf
  Angles (2010). Format: pdf.
- [serie] Séries/angles-4-exercices.pdf
  Angles — 4 exercices. Format: pdf.
- [serie] Séries/angles-5-exercices.pdf
  Angles — 5 exercices. Format: pdf.
- [serie] Séries/angles-6-exercices-.pdf
  Angles — 6 exercices. Format: pdf.
- [serie] Séries/angles-6-exercices.pdf
  Angles — 6 exercices (variante). Format: pdf.
- [serie] Séries/angles-12-exercices-corr.pdf
  Angles — 12 exercices. Corrige: oui. Format: pdf.
- [serie] Séries/les-angles-Yahmadi-Sonia-2011-2012.pdf
  Les angles — Yahmadi (2011-2012). Format: pdf.
- [serie] Séries/série-d'exercices-n°1-activités-numériques-i-angles--2018-2019.pdf
  Serie n°1 Activites numeriques I + Angles (2018-2019) — mixte. Format: pdf.

### thales — Thales

#### Series
- [serie] Séries/Tahlès-Mounir-Bchir.pdf
  Thales — Mounir Bchir. Format: pdf.
- [serie] Séries/thalese-8-exercices.pdf
  Thales — 8 exercices. Format: pdf.
- [serie] Séries/Thalés1.pdf
  Thales 1. Format: pdf.
- [serie] Séries/théoreme-de-thales-et-sa-reciproque-activités-numeriques-ii--2011-2012.pdf
  Theoreme de Thales et sa reciproque + Activites numeriques II (2011-2012) — mixte. Format: pdf.
- [serie] Séries/théorème-de-thales-et-sa-réciproque--2009-2010.pdf
  Theoreme de Thales et sa reciproque (2009-2010). Format: pdf.
- [serie] Séries/série-d'exercices-n°1-thales-activité-numérique-2--2017-2018.pdf
  Serie n°1 Thales + Activite numerique 2 (2017-2018) — mixte. Format: pdf.

### trigo — Rapports trigonometriques

#### Series
- [serie] Séries/trigonometrie-3-exercices-corrigé.pdf
  Trigonometrie — 3 exercices. Corrige: oui. Format: pdf.
- [serie] Séries/trigonométrie--2009-2010.pdf
  Trigonometrie (2009-2010). Format: pdf.
- [serie] Séries/Trigonométrie-2.pdf
  Trigonometrie 2. Format: pdf.
- [serie] Séries/Trigonométrie-3.pdf
  Trigonometrie 3. Format: pdf.
- [serie] Séries/Trigonométrie-4.pdf
  Trigonometrie 4. Format: pdf.
- [serie] Séries/Trigonométrie-5.pdf
  Trigonometrie 5. Format: pdf.
- [serie] Séries/Trigonométrie-6.pdf
  Trigonometrie 6. Format: pdf.
- [serie] Séries/Trigonométrie-7.pdf
  Trigonometrie 7. Format: pdf.
- [serie] Séries/Trigonométrie-8.pdf
  Trigonometrie 8. Format: pdf.
- [serie] Séries/Trigonométrie-9.pdf
  Trigonometrie 9. Format: pdf.
- [serie] Séries/Trigonométrie-10.pdf
  Trigonometrie 10. Format: pdf.
- [serie] Séries/Trigonométrie-11.pdf
  Trigonometrie 11. Format: pdf.
- [serie] Séries/trigonométrie-2011-2012.pdf
  Trigonometrie — Guesmia (2011-2012). Format: pdf.
- [serie] Séries/Trigonométrie-cos-et-pythagore.pdf
  Trigonometrie cos et Pythagore. Format: pdf.
- [serie] Séries/Trigonométrie-Relation-métrique-dans-un-triangle-Mohamed-Benzina-2012-2013.pdf
  Trigonometrie + Relation metrique — Benzina (2012-2013). Format: pdf.
- [serie] Séries/Trigonométrie-relation-métrique-dans-un-triangle-Rgaig-Farhat-2008-2009.pdf
  Trigonometrie + Relation metrique — Rgaig Farhat (2008-2009). Format: pdf.
- [serie] Séries/Trigonométrie-Yahmadi-Selmi-Sonia-2010-2011.pdf
  Trigonometrie — Yahmadi (2010-2011). Format: pdf.
- [serie] Séries/Trigonométrie.pdf
  Trigonometrie. Format: pdf.

### vt — Vecteurs et translations

#### Series
- [serie] Séries/vecteurs--2011-2012.pdf
  Vecteurs — Bellassoued (2011-2012). Format: pdf.
- [serie] Séries/vecteurs-du-plan-2.pdf
  Vecteurs du plan 2. Format: pdf.
- [serie] Séries/Vecteurs-du-plan.pdf
  Vecteurs du plan. Format: pdf.
- [serie] Séries/Vecteurs-et-translations-Rgaig-Farhat-2008-2009.pdf
  Vecteurs et translations — Rgaig Farhat (2008-2009). Format: pdf.
- [serie] Séries/Vecteurs-et-translations.pdf
  Vecteurs et translations. Format: pdf.
- [serie] Séries/vecteurs-et-translation-fonction-linéaire.pdf
  Vecteurs et translation + Fonction lineaire — mixte. Format: pdf.
- [serie] Séries/vecteurs-equations--2013-2014.pdf
  Vecteurs + Equations — Bouzouraa (2013-2014) — mixte. Format: pdf.
- [serie] Séries/TRanslation-et-puissance.pdf
  Translation et puissance — mixte. Format: pdf.
- [serie] Séries/translation-equation--2013-2014.pdf
  Translation + Equation — Bouzouraa (2013-2014) — mixte. Format: pdf.

### sv — Somme de vecteurs

#### Series
- [serie] Séries/somme-de-deux-vecteurs-vecteurs-colinéaires--2013-2014.pdf
  Somme de deux vecteurs + vecteurs colineaires (2013-2014). Format: pdf.
- [serie] Séries/Somme-des-deux-vecteurs.pdf
  Somme des deux vecteurs. Format: pdf.
- [serie] Séries/Somme-des-vecteurs.pdf
  Somme des vecteurs. Format: pdf.

### repere — Repere

#### Series
- [serie] Séries/activites-dans-un-repere-systemes.pdf
  Activites dans un repere + systemes — mixte. Format: pdf.
- [serie] Séries/activités-dans-repère--2012-2013.pdf
  Activites dans un repere (2012-2013). Format: pdf.
- [serie] Séries/activités-dans-un-repère--2011-2012.pdf
  Activites dans un repere (2011-2012). Format: pdf.
- [serie] Séries/Activités-dans-un-repère-statistique-et-systéme-Zrafi.pdf
  Activites dans un repere + statistique + systeme — Zrafi — mixte. Format: pdf.
- [serie] Séries/Activités-dans-un-repére.pdf
  Activites dans un repere. Format: pdf.
- [serie] Séries/Serie-fonction-affine-et-activité-dans-un-repére.pdf
  Fonction affine + activite dans un repere — mixte. Format: pdf.

### qt — Quart de tour

#### Series
- [serie] Séries/quart-de-tour--2011-2012.pdf
  Quart de tour — Bellassoued (2011-2012). Format: pdf.
- [serie] Séries/système-et-quart-de-tour--2013-2014.pdf
  Systeme + Quart de tour (2013-2014) — mixte. Format: pdf.

### ei — Equations et inequations

#### Series
- [serie] Séries/Equations-et-Inéquations-Rgaig-Farhat-2008-2009.pdf
  Equations et inequations — Rgaig Farhat (2008-2009). Format: pdf.
- [serie] Séries/équations-et-inéquations-du-1er-degré-à-1-inconnue--2009-2010.pdf
  Equations et inequations du 1er degre a 1 inconnue (2009-2010). Format: pdf.
- [serie] Séries/Série-eqautions-et-inéquations-du-premiers-degré--2021-2022.pdf
  Serie equations et inequations du 1er degre (2021-2022). Format: pdf.
- [serie] Séries/Séries--equations.pdf
  Series equations — Boulila. Format: pdf.
- [serie] Séries/droites-equations-systèmes--2010-2011.pdf
  Droites + equations + systemes — Boulila (2010-2011) — mixte. Format: pdf.

### fa — Fonctions affines

#### Series
- [serie] Séries/fonction-affine--2013-2014.pdf
  Fonction affine — Bouzouraa (2013-2014). Format: pdf.
- [serie] Séries/fonction-affine-1.pdf
  Fonction affine 1. Format: pdf.
- [serie] Séries/fonction-affine-2.pdf
  Fonction affine 2. Format: pdf.
- [serie] Séries/fonction-affine-avec-correction.pdf
  Fonction affine. Corrige: oui. Format: pdf.
- [serie] Séries/fonction-affine-fonction-linéaire-avec-correction.pdf
  Fonction affine + Fonction lineaire. Corrige: oui. Format: pdf.
- [serie] Séries/fonction-affine-fonction-linéaire-Chortani-Atef.pdf
  Fonction affine + Fonction lineaire — Chortani Atef. Format: pdf.
- [serie] Séries/fonction-affine-fonction-linéaire.pdf
  Fonction affine + Fonction lineaire. Format: pdf.
- [serie] Séries/fonctions-affines-25-exercices.pdf
  Fonctions affines — 25 exercices. Format: pdf.
- [serie] Séries/fonctions-linéaires-fonctions-affines.pdf
  Fonctions lineaires + Fonctions affines. Format: pdf.
- [serie] Séries/Applications-affines.pdf
  Applications affines. Format: pdf.

### fl — Fonctions lineaires

#### Series
- [serie] Séries/fonction-linéaire-1.pdf
  Fonction lineaire 1. Format: pdf.
- [serie] Séries/fonction-linéaire-2.pdf
  Fonction lineaire 2. Format: pdf.
- [serie] Séries/fonction-linéaire-3.pdf
  Fonction lineaire 3. Format: pdf.
- [serie] Séries/fonction-linéaire-4.pdf
  Fonction lineaire 4. Format: pdf.
- [serie] Séries/fonction-linéaire.pdf
  Fonction lineaire. Format: pdf.
- [serie] Séries/fonctions-linéaires--2009-2010.pdf
  Fonctions lineaires (2009-2010). Format: pdf.
- [serie] Séries/fonctions-linéaires--2011-2012.pdf
  Fonctions lineaires — Guesmia (2011-2012). Format: pdf.
- [serie] Séries/série-d'exercices-fonction-linéaire--2017-2018.pdf
  Serie d'exercices fonction lineaire — Kchoum (2017-2018). Format: pdf.

### sys — Systemes

#### Series
- [serie] Séries/systeme-d'-equations-et-problémes.pdf
  Systeme d'equations et problemes. Format: pdf.
- [serie] Séries/Système-d'équation-et-vecteurs.pdf
  Systeme d'equation + vecteurs — mixte. Format: pdf.
- [serie] Séries/systèmes-de-deux-équations-à-deux-inconnues--2011-2012.pdf
  Systemes de deux equations a deux inconnues (2011-2012). Format: pdf.
- [serie] Séries/Systéme.pdf
  Systeme. Format: pdf.

### stat — Statistiques

#### Series
- [serie] Séries/Statistique.pdf
  Statistique. Format: pdf.
- [serie] Séries/statistiques.pdf
  Statistiques. Format: pdf.

### ss — Sections de solides

#### Series
- [serie] Séries/géométrie-de-léspace--2012-2013.pdf
  Geometrie de l'espace — Boulila (2012-2013). Format: pdf.

### Devoirs / Annales (tous modules confondus)

#### Devoirs de controle n°1
- [devoir] Devoirs/Devoirs-de-contrôle-n°1/
  ~100+ devoirs de controle n°1. Periode 2004-2018. Corrige: ~1 seul. Format: pdf.

#### Devoirs de controle n°2 a n°6
- [devoir] Devoirs/Devoirs-de-contrôle-n°2.html a n°6.html
  Categories supplementaires avec devoirs de controle multi-chapitres. Format: pdf.

#### Devoirs de synthese n°1
- [devoir] Devoirs/Devoirs-de-synthèse-n°1/
  113 devoirs de synthese n°1. Periode 1998-2021. Corriges: 2. Format: pdf.

#### Devoirs de synthese n°2 et n°3
- [devoir] Devoirs/Devoirs-de-synthèse-n°2.html et n°3.html
  Categories supplementaires. Format: pdf.

#### Devoirs a la maison
- [devoir] Devoirs/Devoirs-à-la-maison.html
  Devoirs a domicile. Format: pdf.

#### Annales
- [serie] Séries/annale-104-exercices.pdf
  Annale — 104 exercices de revision. Format: pdf.

### Series mixtes (multi-modules)

- [serie] Séries/activites-algebriques-trigonometrie.pdf
  Activites algebriques + trigonometrie (algebre + trigo). Format: pdf.
- [serie] Séries/activités-algébriques-angles-fonction-affine-Souid-N.pdf
  Activites algebriques + angles + fonction affine (algebre + angles + fa). Format: pdf.
- [serie] Séries/Activités-algébriques-et-Angles-Mohamed-Benzina-2012-2013.pdf
  Activites algebriques + Angles — Benzina (algebre + angles). Format: pdf.
- [serie] Séries/Activités-numérique-alg..-Zayoud-Abidi-1.pdf
  Activites numeriques + algebriques + geometriques 1 — Zayoud Abidi (mixte). Format: pdf.
- [serie] Séries/Activités-numérique-alg..-Zayoud-Abidi-2.pdf
  Activites numeriques + algebriques + geometriques 2 — Zayoud Abidi (mixte). Format: pdf.
- [serie] Séries/Activités-numérique-et-angles-Yahmadi-Selmi-Sonia-2010-2011-2.pdf
  Activites numeriques + Angles — Yahmadi 1 (num + angles). Format: pdf.
- [serie] Séries/Activités-numérique-et-angles-Yahmadi-Selmi-Sonia-2010-2011.pdf
  Activites numeriques + Angles — Yahmadi 2 (num + angles). Format: pdf.
- [serie] Séries/Angles-Activités-algébriques-Benzina-Mohamed-2012-2013.pdf
  Angles + Activites algebriques — Benzina (angles + algebre). Format: pdf.
- [serie] Séries/Angles-Activités-alg..-et-numériques-Benzina-2012-2013-2.pdf
  Angles + Activites algebriques + numeriques 1 — Benzina (mixte). Format: pdf.
- [serie] Séries/Angles-Activités-alg..-et-numériques-Benzina-2012-2013.pdf
  Angles + Activites algebriques + numeriques 2 — Benzina (mixte). Format: pdf.
- [serie] Séries/Angles-Equation-et-inéquation-Benzina-Mohamed-2012-2013.pdf
  Angles + Equations + Inequations — Benzina (angles + ei). Format: pdf.
- [serie] Séries/Angles-Equation-et-inéquation-et-fonction-linéaire-et-affine-Benzina-2012-2013.pdf
  Angles + Equations + Inequations + Fonctions lineaires + affines — Benzina (mixte). Format: pdf.
- [serie] Séries/Equation-et-Inéquation-vecteurs-et-translation.pdf
  Equation + Inequation + Vecteurs + Translation (ei + vt). Format: pdf.
- [serie] Séries/Equation-Inéquation-Vecteurs-et-translations-Zrafi.pdf
  Equation + Inequation + Vecteurs + Translations — Zrafi (ei + vt). Format: pdf.
- [serie] Séries/Fonction-affine-Equation-vecteur-et-translation.pdf
  Fonction affine + Equation + Vecteurs + Translation (fa + ei + vt). Format: pdf.
- [serie] Séries/Fonction-affine-vecteurs-Activités-dans-un-rep.pdf
  Fonction affine + Vecteurs + Activites dans un repere (fa + vt + repere). Format: pdf.
- [serie] Séries/fonction-linéaire-vecteur-et-translation--2013-2014.pdf
  Fonction lineaire + Vecteur + Translation (fl + vt). Format: pdf.
- [serie] Séries/systeme-Fonction-affine-activités-dans-un-rep.pdf
  Systeme + Fonction affine + Activites dans un repere (sys + fa + repere). Format: pdf.
- [serie] Séries/Thalès-Equation-et-inéquation-et-fonction-linéaire-et-affine-Benzina-2012-2013.pdf
  Thales + Equations + Inequations + Fonctions — Benzina (thales + ei + fl + fa). Format: pdf.
- [serie] Séries/révision-devoir-de-synthèse-n°1--2021-2022.pdf
  Revision devoir de synthese n°1 — Chortani (2021-2022) — revision. Format: pdf.
- [serie] Séries/choix-devoir-de-contrôle-n°1.pdf
  Choix devoir de controle n°1 — Boulila — revision. Format: pdf.
- [serie] Séries/preparation-au-ds2--2013-2014.pdf
  Preparation au DS2 — Bouzouraa (2013-2014) — revision. Format: pdf.

### Series numerotees generiques
- [serie] Séries/série-d'exercices-n°1--2017-2018.pdf
  Serie d'exercices n°1 — Zantour (2017-2018) — theme non precise. Format: pdf.
- [serie] Séries/série-d'exercices-n°2--2017-2018.pdf
  Serie d'exercices n°2 — Zantour (2017-2018). Format: pdf.
- [serie] Séries/série-d'exercices-n°3--2017-2018.pdf
  Serie d'exercices n°3 — Zantour (2017-2018). Format: pdf.
- [serie] Séries/Séries-n-4--2020-2021.pdf
  Series n°4 (2020-2021). Format: pdf.
- [serie] Séries/01.IE.Ensembles,NP-1.pdf
  Ensembles, NP 1. Format: pdf.
- [serie] Séries/AI1.pdf
  Activites integrees 1. Format: pdf.
- [serie] Séries/test-6--2015-2016.pdf
  Test 6 (2015-2016). Format: pdf.
- [serie] Séries/test-7--2015-2016.pdf
  Test 7 (2015-2016). Format: pdf.
- [serie] Séries/Test-dévaluation-Yahmadi-Selmi-Sonia-2010-2011.pdf
  Test d'evaluation — Yahmadi (2010-2011). Format: pdf.
- [serie] Séries/denombrement.pdf
  Denombrement. Format: pdf.

## Modules non-mappes

- Denombrement : Séries/denombrement.pdf — non couvert dans notre programme 1ere-tc
- Relation metrique dans un triangle : inclus dans certaines series trigo — peut etre rattache a trigo

## Couverture niveaux superieurs

Le site couvre aussi les niveaux 2nde (sciences, eco, lettres, TI), 3eme (math, sciences, etc.) et 4eme (math, sciences, etc.) avec la meme structure Cours/Devoirs/Series. Les 3eme et 4eme annees sont hors scope du programme 1ere-tc actuel mais constituent une ressource riche pour les futures extensions.

## Historique des scans

| Date | Action | Notes |
|------|--------|-------|
| 2026-02-07 | Scan initial | 140 series, 100+ DC1, 113 DS1 catalogues pour 1ere annee. Focus sur maths 1ere. |
