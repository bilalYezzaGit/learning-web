# Chantier 005 — Amelioration continue du systeme _meta/

Status: EN COURS (iteratif)
Date: 2026-03-23

Backlog vivant. Chaque item est analyse, discute, traite ou rejete. On itere.

---

## Objectifs du systeme _meta/

1. Generer des livrets de 3 types (cours, examen, exploration)
2. Les livrets sont tres en phase avec le systeme tunisien
3. Les livrets ne sont pas "froids" — ils ressemblent a ce que produirait un bon prof
4. La qualite educative est au top

---

## Items actifs

### ~~A1 — Ajouter `pedagogy` aux profils de livrets~~ ✅
**Priorite** : haute
**Probleme** : `booklet-profiles.yaml` definit le QUOI mais pas le COMMENT.
**Solution implementee** : section `pedagogy` avec listes `do` et `do_not` par profil (cours: 8 do + 6 do_not, examen: 6 do + 5 do_not, exploration: 6 do + 6 do_not). Format libre en langage naturel, facilement enrichissable. Grille D ajoutee dans `validate-module.md` pour verifier la conformite.
**Commit** : 2026-03-23

### A2 — Enrichir les patterns sur 2 niveaux (format flexible)
**Priorite** : haute
**Probleme** : seul `nombre-derive` a un fichier patterns, et les patterns actuels ne couvrent que des exercices isoles (1 praxeologie). Les problemes complets multi-questions et les sujets cross-module ne sont pas modelises.

**Format simplifie** : chaque pattern (exercice ou probleme) suit le meme schema flexible avec `example`, `do`, `do_not` en langage naturel. Les noms sont distinctifs (encodent la technique ou la sequence).

**Niveau 1 — `_meta/{prog}/{mod}/patterns.yaml`** (par module) :
- Patterns d'exercices isoles (type: exercice) — actuel
- **NOUVEAU** : patterns de problemes intra-module (type: probleme)
```yaml
- id: P1
  type: probleme
  name: "Morceaux → raccordement → TVI → dichotomie"
  description: >-
    Probleme classique en 4 parties : etude d'une fonction par morceaux,
    verification de la continuite au raccordement, localisation d'un zero
    par le TVI, encadrement par dichotomie.
  praxeologies: [Prax3, Prax4, Prax7]
  difficulty: 2
  frequency: high
  sources: ["Para ex.16", "XY ex.5"]
  example: >-
    f(x) = {x^2-3x+2 si x<=2, sqrt(x-2) si x>2}.
    (a) Montrer que f est continue sur R.
    (b) Montrer que f(x)=0 admet une solution dans [0,2].
    (c) Encadrer cette solution a 10^-1 pres.
  do:
    - "Les questions s'enchainent logiquement (le resultat de (a) sert en (b))"
    - "Commencer par la continuite, finir par la dichotomie"
    - "Les fonctions doivent etre realistes (polynomes degre 2-3, racines, rationnelles)"
  do_not:
    - "Ne pas mettre plus de 5 questions"
    - "Ne pas demander une demonstration alpha-beta dans un probleme"
```

**Niveau 2 — `_meta/{prog}/examens/{slug}/patterns.yaml`** (par examen) :
- Patterns de problemes cross-module frequents dans cet examen
```yaml
- id: EP1
  type: probleme-examen
  name: "Cubique : variations → zeros exacts → f(x)=k → encadrement (continuite + derivee)"
  description: >-
    Exercice majeur du devoir de synthese. Etude complete d'un polynome de degre 3 :
    derivee et tableau de variation, nombre exact de zeros par TVI + monotonie,
    resolution de f(x)=k, encadrement d'une solution par dichotomie.
  modules: [continuite, fonction-derivee]
  praxeologies: [Prax1-cont, Prax4-fd, Prax8-cont, Prax7-cont]
  difficulty: 2
  frequency: very_high
  points_typiques: 5-6
  sources: ["Synthese T3 2023 ex.3", "Synthese T3 2024 ex.4"]
  example: >-
    f(x) = 2x^3 - 9x^2 + 12x - 4.
    (a) Calculer f'(x) et dresser le tableau de variation.
    (b) Montrer que f(x)=0 admet exactement 2 solutions.
    (c) Montrer que f(x)=1 admet 3 solutions. Encadrer la plus grande a 10^-1.
  do:
    - "Utiliser un polynome de degre 3 avec des coefficients entiers simples"
    - "Le tableau de variation doit avoir un max local et un min local"
    - "Au moins une racine exacte (factorisable) pour que l'eleve puisse verifier"
  do_not:
    - "Ne pas depasser 6 questions"
    - "Ne pas utiliser des coefficients qui rendent le calcul de f' penible"
```

**Sous-taches** :
- [ ] Mettre a jour patterns-template.yaml avec le format flexible (type probleme, example, do/do_not)
- [ ] Creer patterns.yaml pour continuite (exercices + problemes intra-module)
- [ ] Creer patterns.yaml pour fonction-derivee
- [ ] Creer patterns.yaml pour denombrement
- [ ] Creer patterns.yaml pour synthese-t3 (problemes cross-module)
**Impact** : direct sur la typicite tunisienne — les livrets examen reproduisent les vrais sujets.
**Status** : ✅ termine

**Resultat** :
- continuite/patterns.yaml : 30 patterns (25 exercice + 5 probleme), 1023 lignes
- fonction-derivee/patterns.yaml : 46 patterns (36 exercice + 10 probleme), 1674 lignes
- denombrement/patterns.yaml : 34 patterns (30 exercice + 4 probleme), 1277 lignes
- examens/synthese-t3/patterns.yaml : 6 patterns cross-module, 352 lignes
- patterns-template.yaml mis a jour avec format flexible (type probleme, example, do/do_not)

### A3 — Simplifier `redaction.yaml`
**Priorite** : moyenne
**Probleme** : `grading_criteria` avec `weight` simule un systeme de correction automatique qui n'existe pas. Le LLM n'utilise pas les poids.
**Proposition** : garder les `template` et `variants` (utiles pour guider la redaction), supprimer `grading_criteria`.
**Impact** : reduction de complexite, pas de perte fonctionnelle.
**Status** : a discuter

### A4 — Supprimer `complexite.yaml`
**Priorite** : basse
**Probleme** : l'echelle 0-3 est deja dans `CONTENT-CONVENTIONS.md`, dans le skill, et dans `booklet-profiles.yaml`. Triple duplication.
**Proposition** : fusionner le contenu utile dans `booklet-profiles.yaml` et supprimer le fichier.
**Status** : a discuter

### A5 — Alleger `_interface.yaml`
**Priorite** : basse
**Probleme** : 75 lignes de schemas (savoir_schema, praxeologies_schema, etc.) qui ne sont jamais valides programmatiquement. C'est de la documentation deguisee en configuration.
**Proposition** : retirer les sections schema, garder uniquement : version, programmes, modules, examens, identifiers, composition.
**Status** : a discuter

### A6 — Clarifier la source unique pour le lexique global
**Priorite** : basse
**Probleme** : les conventions de notation (virgule decimale, intervalles francais) sont dans 3 endroits : `_meta/lexique.yaml`, `docs/referentiels/redaction-mathematiques-tunisie.md`, `docs/CONTENT-CONVENTIONS.md`.
**Proposition** : decider d'une source unique et faire pointer les autres vers elle.
**Status** : a discuter

### A7 — Exemples d'atomes "gold standard"
**Priorite** : moyenne
**Probleme** : le systeme a des templates (comment structurer un MDX) mais pas d'exemples de ce a quoi un excellent atome ressemble pour chaque type et profil.
**Proposition** : selectionner les meilleurs atomes generes, les annoter, et les stocker comme reference dans `.claude/skills/content/references/exemplars/`.
**Impact** : ameliore la qualite de generation par l'exemple.
**Status** : a discuter

---

## Items traites

- **A1** — pedagogy DO/DO NOT dans booklet-profiles.yaml + Grille D dans validate-module.md (2026-03-23)
- **A2** — patterns 2 niveaux : 3 modules + 1 examen, format flexible avec example/do/do_not, 116 patterns total (2026-03-23)

---

## Items rejetes

(vide — on commence)

---

## Journal des iterations

### Iteration 1 — 2026-03-23
- Creation du backlog avec 7 items (A1-A7)
- Analyse initiale du systeme : savoir/praxeologies/misconceptions sont solides, booklet-profiles manque de pedagogie, patterns manquent pour 3 modules, redaction et interface sont over-engineered

### Iteration 2 — 2026-03-23
- A1 traite : pedagogy DO/DO NOT par profil + Grille D validation
- Cours: 8 do + 6 do_not (ton encourageant, intuition avant formule, exemples apres definitions)
- Examen: 6 do + 5 do_not (formulation type devoirs tunisiens, pas d'indices)
- Exploration: 6 do + 6 do_not (autonomie, rigueur, pas de simplification)

### Iteration 3 — 2026-03-23
- A2 traite : patterns 2 niveaux avec format flexible
- patterns-template.yaml reecrit (type exercice + probleme, example, do/do_not, noms distinctifs)
- continuite : 30 patterns extraits des 3 sources (manuel, parascolaire, xyplus)
- fonction-derivee : 46 patterns
- denombrement : 34 patterns
- synthese-t3 : 6 patterns cross-module (cubique, rationnelle, irrationnelle, denomb+proba, morceaux, binome)
- Total : 116 patterns, 4326 lignes
