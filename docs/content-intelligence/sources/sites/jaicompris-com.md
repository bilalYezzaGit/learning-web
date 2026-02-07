# jaicompris.com

> Derniere mise a jour : 2026-02-07

## Meta

| Champ | Valeur |
|-------|--------|
| URL | https://jaicompris.com |
| Type | site-fr |
| Niveaux | 3eme, 2nde, 1ere, Term |
| Langues | fr |
| Acces | gratuit |
| Qualite | ★★★★☆ |
| Derniere verification | 2026-02-07 |

## Description

Site francais cree par un professeur de mathematiques (partenaire Nathan/Transmath). Propose des milliers de cours et exercices corriges en video (YouTube), couvrant du college a la prepa. Specialise dans les corrections video pas-a-pas, tres progressif. Le contenu suit le programme francais — les recoupements avec le curriculum tunisien sont importants mais pas totaux.

## Instructions LLM

### Navigation

- URL de base : `https://jaicompris.com`
- Pattern de navigation : `/lycee/math/{niveau}.php` pour les pages de listing
  - Troisieme : `/lycee/math/troisieme.php`
  - Seconde : `/lycee/math/seconde-math.php`
  - Premiere Spe : `/lycee/math/premiereS-math.php`
  - Terminale : `/lycee/math/terminaleS-math.php`
- Sitemap : oui, `/sitemap.xml` (~500+ URLs)

### Extraction de contenu

- Format principal : HTML + Video YouTube
- LaTeX : MathJax (rendu dans le navigateur)
- Methode d'extraction : direct fetch des pages HTML, les videos sont des embeds YouTube
- Contenu protege : aucun, 100% gratuit

### Patterns d'URL

- Pages par niveau : `https://jaicompris.com/lycee/math/{niveau-slug}.php`
- Cours/exercices par chapitre : `https://jaicompris.com/lycee/math/{domaine}/{sujet}.php`
  - Calcul : `/lycee/math/calcul/{sujet}.php`
  - Equations : `/lycee/math/equation/{sujet}.php`
  - Fonctions : `/lycee/math/fonction/{sous-domaine}/{sujet}.php`
  - Vecteurs : `/lycee/math/vecteur/{sujet}.php`
  - Geometrie : `/lycee/math/figure/triangle/{sujet}.php`
  - Statistiques : `/lycee/math/statistique/{type}/{sujet}.php`
  - Transformations : `/lycee/math/transformation/{type}/{sujet}.php`
  - Espace : `/lycee/math/espace/{type}/{sujet}.php`
  - Coordonnees : `/lycee/math/coordonnee/coordonnee_plan/{sujet}.php`
  - Droites/systemes : `/lycee/math/droite/{sujet}.php`
  - Inequations : `/lycee/math/inequation/{sujet}.php`
  - Trigonometrie (1ere) : `/lycee/math/trigonometrie/{sujet}.php`
- Exercices en ligne : `/exo_en_ligne/{sujet}.php`
- Videos : hebergees sur YouTube (chaine youtube.com/@jaicompris)

### Limites et precautions

- Le site est rapide et leger (HTML statique)
- Tout le contenu video est sur YouTube — les videos ne sont pas hebergees localement
- Pas de PDFs de cours — tout est en format video + HTML
- Le contenu suit le programme francais, pas tunisien : certains chapitres ne mappent pas directement
- Exercices en ligne interactifs (GeoGebra) necessitent JavaScript

## Ressources par module

### num1 — Calcul numerique 1

#### Cours
- [cours] https://jaicompris.com/lycee/math/calcul/puissance.php
  Puissances : definition, proprietes, exposants negatifs. Format: html+video.
- [cours] https://jaicompris.com/lycee/math/calcul/racine-carree.php
  Racine carree : definition, proprietes, simplification. Format: html+video.

#### Exercices
- [exercice] https://jaicompris.com/lycee/math/calcul/puissance.php
  17 exercices sur les puissances (calcul, simplification, exposants negatifs, enigmes). Diff ~1-2. Corrige: oui (video). Format: html+video.
- [exercice] https://jaicompris.com/lycee/math/calcul/racine-carree.php
  24 exercices sur les racines carrees (simplification, operations, rationalisation, demonstrations). Diff ~1-3. Corrige: oui (video). Format: html+video.

#### Videos
- [video] https://www.youtube.com/watch?v=AyOyACoA_bI
  Cours : calculer la puissance d'un nombre. Duree: ~5min.
- [video] https://www.youtube.com/watch?v=E2XsiRo57hw
  Definition de a^(-n). Duree: ~5min.
- [video] https://www.youtube.com/watch?v=8vB2JUGuUDM
  Cours complet sur les racines carrees. Duree: ~10min.
- [video] https://www.youtube.com/watch?v=-CxldOFBekg
  Regles de calcul avec les racines carrees. Duree: ~5min.
- [video] https://www.youtube.com/watch?v=orW0l0iRuiQ
  Demonstration : sqrt(ab) = sqrt(a) x sqrt(b). Duree: ~5min.

### num2 — Calcul numerique 2

#### Cours
- [cours] https://jaicompris.com/lycee/math/ensemble/intervalle.php
  Intervalles : notation, intersection, reunion. Format: html+video.
- [cours] https://jaicompris.com/lycee/math/fonction/valeur-absolue/valeur-absolue.php
  Valeur absolue : definition, equations et inequations. Format: html+video.

#### Exercices
- [exercice] https://jaicompris.com/lycee/math/ensemble/intervalle.php
  5 exercices sur les intervalles (intersection, reunion, traduction inegalites). Diff ~1. Corrige: oui (video). Format: html+video.
- [exercice] https://jaicompris.com/lycee/math/fonction/valeur-absolue/valeur-absolue.php
  8 exercices sur la valeur absolue (calcul, equations, inequations, geometrie). Diff ~1-2. Corrige: oui (video). Format: html+video.

#### Videos
- [video] https://www.youtube.com/watch?v=lDPKFCR6eBw
  Cours : les intervalles. Duree: 7min.
- [video] https://www.youtube.com/watch?v=fhZuyVr32rA
  Intersection et reunion d'intervalles. Duree: 6min.
- [video] https://www.youtube.com/watch?v=VdMI5PZTaws
  Valeur absolue expliquee. Duree: ~5min.
- [video] https://www.youtube.com/watch?v=NAxxo7406WA
  Equations et inequations avec valeur absolue. Duree: ~10min.

### algebre — Algebre

#### Cours
- [cours] https://jaicompris.com/lycee/math/calcul/identite-remarquable.php
  Identites remarquables : (a+b)², (a-b)², a²-b². Format: html+video.
- [cours] https://jaicompris.com/lycee/math/calcul/factoriser-seconde.php
  Factorisation par facteur commun. Format: html+video.
- [cours] https://jaicompris.com/lycee/math/calcul/factoriser-seconde-identite.php
  Factorisation par identite remarquable a²-b². Format: html+video.
- [cours] https://jaicompris.com/lycee/math/calcul/distributivite-double.php
  Distributivite double (developpement). Format: html+video.
- [cours] https://jaicompris.com/lycee/math/calcul/fraction/fraction_seconde.php
  Fractions et calcul litteral (niveau seconde). Format: html+video.

#### Exercices
- [exercice] https://jaicompris.com/lycee/math/calcul/identite-remarquable.php
  14 exercices sur les identites remarquables (developpement, calcul mental, demonstrations). Diff ~1-2. Corrige: oui (video). Format: html+video.
- [exercice] https://jaicompris.com/lycee/math/calcul/factoriser-seconde.php
  11 exercices sur la factorisation (facteur commun, expressions complexes). Diff ~1-2. Corrige: oui (video). Format: html+video.
- [exercice] https://jaicompris.com/lycee/math/calcul/factoriser-seconde-identite.php
  Exercices sur la factorisation par identite remarquable. Diff ~2. Corrige: oui (video). Format: html+video.
- [exercice] https://jaicompris.com/lycee/math/calcul/factoriser-seconde-suite.php
  Exercices complementaires de factorisation. Diff ~2-3. Corrige: oui (video). Format: html+video.

#### Videos
- [video] https://www.youtube.com/watch?v=qQcaAxQH-lc
  Identite (a+b)². Duree: ~5min.
- [video] https://www.youtube.com/watch?v=O0H6Iq8-82E
  Identite (a-b)². Duree: ~5min.
- [video] https://www.youtube.com/watch?v=iTLZOZAtxnE
  Identite a²-b² (difference de carres). Duree: ~5min.
- [video] https://www.youtube.com/watch?v=M2zFRLckrzI
  Comprendre (a+b)² avec les aires. Duree: ~5min.
- [video] https://www.youtube.com/watch?v=9O2A8SmbPWk
  Cours complet factorisation par facteur commun. Duree: ~10min.

### ei — Equations et inequations

#### Cours
- [cours] https://jaicompris.com/lycee/math/equation/equation-seconde.php
  Equation du premier degre (niveau seconde). Format: html+video.
- [cours] https://jaicompris.com/lycee/math/equation/equation-seconde-produit-nul.php
  Equation produit nul. Format: html+video.
- [cours] https://jaicompris.com/lycee/math/equation/equation-seconde-general.php
  Equations — cas general. Format: html+video.
- [cours] https://jaicompris.com/lycee/math/equation/equation-fraction-seconde.php
  Equations avec fractions/quotients. Format: html+video.
- [cours] https://jaicompris.com/lycee/math/inequation/inequation-premier-degre.php
  Inequation du premier degre — niveau 1. Format: html+video.
- [cours] https://jaicompris.com/lycee/math/inequation/tableau-signe-inequation-seconde.php
  Tableau de signe — inequation niveau 2. Format: html+video.

#### Exercices
- [exercice] https://jaicompris.com/lycee/math/equation/equation-seconde.php
  ~20 exercices progressifs sur les equations du 1er degre. Diff ~1-3. Corrige: oui (video). Format: html+video.
- [exercice] https://jaicompris.com/lycee/math/equation/equation-seconde-controle.php
  Exercices type controle sur les equations. Diff ~2-3. Corrige: oui (video). Format: html+video.
- [exercice] https://jaicompris.com/lycee/math/equation/equation-seconde-expert.php
  Equations — niveau expert. Diff ~3. Corrige: oui (video). Format: html+video.

#### Videos
- [video] https://www.youtube.com/watch?v=JYLaXCQqB9g
  Equations cartesiennes de droites. Duree: ~5min.

### fl — Fonctions lineaires

#### Cours
- [cours] https://jaicompris.com/lycee/math/fonction/fonction-lineaire.php
  Fonction lineaire : definition, representation, proportionnalite. Format: html+video.

#### Exercices
- [exercice] https://jaicompris.com/lycee/math/fonction/fonction-lineaire.php
  7 exercices sur les fonctions lineaires (images, antecedents, graphiques, coefficient). Diff ~1-2. Corrige: oui (video). Format: html+video.

#### Videos
- [video] https://www.youtube.com/watch?v=XQWD0gsRNGw
  Fonction lineaire — notions essentielles, droite et proportionnalite. Duree: ~10min.
- [video] https://www.youtube.com/watch?v=0NrHtkmfUlU
  Lecture graphique du coefficient d'une fonction lineaire. Duree: ~5min.

### fa — Fonctions affines

#### Cours
- [cours] https://jaicompris.com/lycee/math/fonction/affine/fonction-affine.php
  Fonction affine f(x)=ax+b : techniques de base. Format: html+video.
- [cours] https://jaicompris.com/lycee/math/fonction/affine/fonction_affine_probleme.php
  Fonction affine : problemes. Format: html+video.

#### Exercices
- [exercice] https://jaicompris.com/lycee/math/fonction/affine/fonction-affine.php
  29 exercices progressifs (coefficient directeur, lecture graphique, representation, problemes). Diff ~1-2. Corrige: oui (video). Format: html+video.

#### Videos
- [video] https://www.youtube.com/watch?v=wAc_hG2XPVs
  Fonction affine : definition, coefficient directeur, ordonnee a l'origine. Duree: ~10min.
- [video] https://www.youtube.com/watch?v=y3_Ml14uZxY
  Tracer des fonctions affines. Duree: ~5min.
- [video] https://www.youtube.com/watch?v=UyofVDL6DM8
  Lecture graphique pente et ordonnee a l'origine. Duree: ~5min.
- [video] https://www.youtube.com/watch?v=sLhqVY4hyQk
  Determiner l'expression d'une fonction affine. Duree: ~5min.

### thales — Thales

#### Cours
- [cours] https://jaicompris.com/lycee/math/figure/triangle/thales-emboite.php
  Thales — triangles emboites : cours + reciproque. Format: html+video.
- [cours] https://jaicompris.com/lycee/math/figure/triangle/thales-papillon.php
  Thales — configuration papillon. Format: html+video.

#### Exercices
- [exercice] https://jaicompris.com/lycee/math/figure/triangle/thales-emboite.php
  13 exercices (calcul longueurs, reciproque, problemes concrets). Diff ~1-3. Corrige: oui (video). Format: html+video.
- [exercice] https://jaicompris.com/lycee/math/figure/triangle/thales-papillon.php
  4 exercices (calcul longueurs config papillon, reciproque). Diff ~1-2. Corrige: oui (video). Format: html+video.

#### Videos
- [video] https://www.youtube.com/watch?v=ko6KkiCmrMo
  Theoreme de Thales — cours (triangles emboites). Duree: ~10min.
- [video] https://www.youtube.com/watch?v=Z-Ux8gY386A
  Reciproque du theoreme de Thales. Duree: ~5min.
- [video] https://www.youtube.com/watch?v=YHA81vyt05Y
  Thales — configuration papillon. Duree: ~5min.
- [video] https://www.youtube.com/watch?v=r1833RsQPy4
  Contraposee et reciproque. Duree: ~5min.

### trigo — Rapports trigonometriques

#### Cours
- [cours] https://jaicompris.com/lycee/math/figure/triangle/trigonometrie_triangle_rectangle.php
  Trigonometrie dans le triangle rectangle : SOHCAHTOA. Format: html+video.

#### Exercices
- [exercice] https://jaicompris.com/lycee/math/figure/triangle/trigonometrie_triangle_rectangle.php
  11 exercices progressifs (identifier rapports, calculer longueurs, calculer angles). Diff ~1-2. Corrige: oui (video). Format: html+video.
- [exercice] https://jaicompris.com/lycee/math/figure/triangle/trigonometrie_triangle_rectangle_niveau2.php
  Exercices controle — niveau 2. Diff ~2-3. Corrige: oui (video). Format: html+video.

#### Videos
- [video] https://www.youtube.com/watch?v=ZEEGuzJ-vHA
  SOHCAHTOA : calculer sinus, cosinus, tangente. Duree: ~10min.
- [video] https://www.youtube.com/watch?v=jTIFRIWyT1Y
  Calculer une longueur avec cos/sin/tan. Duree: ~5min.
- [video] https://www.youtube.com/watch?v=fsIoRqw7T70
  Calculer un angle avec cos/sin/tan. Duree: ~5min.

### vt — Vecteurs et translations

#### Cours
- [cours] https://jaicompris.com/lycee/math/vecteur/vecteur-construire-seconde.php
  Construire somme et difference de vecteurs. Format: html+video.
- [cours] https://jaicompris.com/lycee/math/transformation/translation/translation-college.php
  Translation (niveau college/3eme). Format: html+video.

#### Exercices
- [exercice] https://jaicompris.com/lycee/math/vecteur/vecteur-construire-seconde.php
  5 exercices (construction, somme, combinaisons). Diff ~1. Corrige: oui (video). Format: html+video.

#### Videos
- [video] https://www.youtube.com/watch?v=1AowNCUB30w
  Construire somme de vecteurs. Duree: ~10min.

### sv — Somme de vecteurs

#### Cours
- [cours] https://jaicompris.com/lycee/math/vecteur/vecteur-seconde.php
  Relation de Chasles. Format: html+video.
- [cours] https://jaicompris.com/lycee/math/vecteur/vecteur-seconde-chasles-parallelogramme.php
  Chasles et parallelogramme. Format: html+video.
- [cours] https://jaicompris.com/lycee/math/vecteur/vecteur-seconde-chasles-milieu.php
  Chasles et milieu. Format: html+video.

#### Exercices
- [exercice] https://jaicompris.com/lycee/math/vecteur/vecteur-seconde.php
  4 exercices (simplification Chasles, soustraction, expression en fonction de vecteurs de base). Diff ~1-2. Corrige: oui (video). Format: html+video.

#### Videos
- [video] https://www.youtube.com/watch?v=PK1eRGHS7WI
  Relation de Chasles — cours. Duree: ~10min.

### repere — Repere

#### Cours
- [cours] https://jaicompris.com/lycee/math/coordonnee/coordonnee_plan/milieu.php
  Coordonnees du milieu d'un segment. Format: html+video.
- [cours] https://jaicompris.com/lycee/math/coordonnee/coordonnee_plan/milieu_longueur.php
  Distance entre deux points (formule). Format: html+video.
- [cours] https://jaicompris.com/lycee/math/vecteur/vecteur-coordonnee-seconde.php
  Coordonnees d'un vecteur. Format: html+video.

#### Exercices
- [exercice] https://jaicompris.com/lycee/math/coordonnee/coordonnee_plan/milieu.php
  6 exercices (milieu, symetrique, parallelogramme). Diff ~1-2. Corrige: oui (video). Format: html+video.
- [exercice] https://jaicompris.com/lycee/math/coordonnee/coordonnee_plan/milieu_longueur.php
  11 exercices (distance, triangles, cercles, mediatrice). Diff ~1-2. Corrige: oui (video). Format: html+video.
- [exercice] https://jaicompris.com/lycee/math/vecteur/vecteur-coordonnee-seconde.php
  4 exercices (lire coordonnees, calculer coordonnees vecteur). Diff ~1. Corrige: oui (video). Format: html+video.
- [exercice] https://jaicompris.com/lycee/math/vecteur/vecteur-parallelogramme-seconde.php
  Vecteurs — parallelogramme et coordonnees. Diff ~2. Corrige: oui (video). Format: html+video.
- [exercice] https://jaicompris.com/lycee/math/vecteur/vecteur-colineaire-seconde.php
  Vecteurs colineaires et determinant. Diff ~2. Corrige: oui (video). Format: html+video.
- [exercice] https://jaicompris.com/lycee/math/vecteur/vecteur-colineaire-seconde-alignement.php
  Vecteurs colineaires et points alignes. Diff ~2. Corrige: oui (video). Format: html+video.

#### Videos
- [video] https://www.youtube.com/watch?v=g6tn00EIYks
  Coordonnees du milieu d'un segment + exemple. Duree: 4min.

### qt — Quart de tour

#### Cours
- [cours] https://jaicompris.com/lycee/math/transformation/rotation/rotation-college.php
  Rotation (dont quart de tour) : definition, construction, proprietes. Format: html+video.

#### Exercices
- [exercice] https://jaicompris.com/lycee/math/transformation/rotation/rotation-college.php
  3 exercices (rotation 90, rosace, pavage Escher). Diff ~1-2. Corrige: oui (video). Format: html+video.

### ss — Sections de solides

#### Cours
- [cours] https://jaicompris.com/lycee/math/espace/solide_representation/solide_section.php
  Sections de solides : pave droit, cylindre, cone. Format: html+video.

#### Exercices
- [exercice] https://jaicompris.com/lycee/math/espace/solide_representation/solide_section.php
  3 exercices (section cube, cylindre, cone). Diff ~1-2. Corrige: oui (video). Format: html+video.

#### Videos
- [video] https://www.youtube.com/watch?v=xmo0_h4BrR8
  Section d'un pave droit par un plan. Duree: 2min.
- [video] https://www.youtube.com/watch?v=xHahz3awknQ
  Section d'un cylindre par un plan. Duree: 2min.

### stat — Statistiques

#### Cours
- [cours] https://jaicompris.com/lycee/math/statistique/frequence/frequence_quatrieme.php
  Effectifs et frequences. Format: html+video.
- [cours] https://jaicompris.com/lycee/math/statistique/moyenne/moyenne_quatrieme.php
  Moyenne simple et ponderee. Format: html+video.
- [cours] https://jaicompris.com/lycee/math/statistique/mediane/mediane_quatrieme.php
  Mediane statistique. Format: html+video.
- [cours] https://jaicompris.com/lycee/math/statistique/histogramme/histogramme.php
  Histogramme. Format: html+video.

#### Exercices
- [exercice] https://jaicompris.com/lycee/math/statistique/frequence/frequence_quatrieme.php
  3 exercices (effectifs, frequences, pourcentages). Diff ~1. Corrige: oui (video). Format: html+video.
- [exercice] https://jaicompris.com/lycee/math/statistique/moyenne/moyenne_quatrieme.php
  3 exercices (moyenne simple, ponderee, diagramme en barres). Diff ~1. Corrige: oui (video). Format: html+video.
- [exercice] https://jaicompris.com/lycee/math/statistique/mediane/mediane_quatrieme.php
  7 exercices (mediane cas pair/impair, exercices brevet). Diff ~1-2. Corrige: oui (video). Format: html+video.

#### Videos
- [video] https://www.youtube.com/watch?v=36eP8tt_QK0
  Calculer une mediane. Duree: 4min.
- [video] https://www.youtube.com/watch?v=8eqc7rqGQks
  Cours complet — comment calculer la mediane. Duree: ~10min.

### sys — Systemes

#### Cours
- [cours] https://jaicompris.com/lycee/math/droite/systeme-equation.php
  Systemes d'equations : substitution et combinaison. Format: html+video.

#### Exercices
- [exercice] https://jaicompris.com/lycee/math/droite/systeme-equation.php
  16 exercices (substitution, combinaison, problemes concrets, systemes sans solution, non lineaires). Diff ~1-3. Corrige: oui (video, 8 sur 16). Format: html+video.

#### Videos
- [video] https://www.youtube.com/watch?v=tQ0LAcihpmw
  Qu'est-ce qu'un systeme d'equations lineaire. Duree: ~5min.
- [video] https://www.youtube.com/watch?v=k8uLNt81ZLA
  Resoudre par substitution. Duree: ~5min.
- [video] https://www.youtube.com/watch?v=rlLlzYMaN-E
  Resoudre par combinaison. Duree: ~5min.

### angles — Angles

> Pas de chapitre specifique "angles" au sens du curriculum tunisien (angles inscrits, angles au centre, conversion radians).
> Le site couvre la trigonometrie du cercle en Premiere Spe (voir ci-dessous dans modules non-mappes).

## Modules non-mappes

Chapitres du site qui ne correspondent a aucun de nos modules actuels mais pourraient etre utiles :

- **Second degre (1ere Spe)** : https://jaicompris.com/lycee/math/equation/equation-second-degre.php — Polynome, discriminant, signe trinome
- **Suites (1ere Spe)** : https://jaicompris.com/lycee/math/suite/suite-definition.php — Suites arithmetiques et geometriques
- **Derivation (1ere Spe)** : https://jaicompris.com/lycee/math/fonction/derivation/derivation-definition.php — Calcul de derivees, variations, tangentes
- **Exponentielle (1ere Spe)** : https://jaicompris.com/lycee/math/fonction/exponentielle/exponentielle-premiere.php — Fonction exponentielle
- **Produit scalaire (1ere Spe)** : https://jaicompris.com/lycee/math/produitscalaire/produit-scalaire-plan.php — Produit scalaire dans le plan
- **Probabilites conditionnelles (1ere Spe)** : https://jaicompris.com/lycee/math/probabilite/probabilite-conditionnelle.php — Arbres ponderes
- **Cercle trigonometrique (1ere Spe)** : https://jaicompris.com/lycee/math/trigonometrie/cercle_trigonometrique.php — Radians, sinus, cosinus
- **Pythagore** : https://jaicompris.com/lycee/math/figure/triangle/pythagore.php — 3 niveaux
- **Homothetie** : https://jaicompris.com/lycee/math/transformation/homothetie/homothetie-college.php — Transformation
- **Pourcentages** : https://jaicompris.com/lycee/math/pourcentage/pourcentage_troisieme.php — Base a evolution
- **Probabilites (college)** : https://jaicompris.com/lycee/math/probabilite/probabilite_quatrieme/probabilite_quatrieme.php — Bases
- **Equation cartesienne de droite** : https://jaicompris.com/lycee/math/droite/droite-equation-cartesienne.php — Droites dans le plan
- **Equation reduite de droite** : https://jaicompris.com/lycee/math/droite/droite-equation-reduite.php — y=ax+b
- **Python** : https://jaicompris.com/python.php — Algorithmes en Python

## Historique des scans

| Date | Action | Notes |
|------|--------|-------|
| 2026-02-07 | Scan initial | 14 modules mappes, ~200+ ressources cataloguees. Couverture forte sur num1, algebre, thales, trigo, systemes, repere. Couverture faible sur angles (pas d'angles inscrits/centre) et qt (rotations generales seulement). |
