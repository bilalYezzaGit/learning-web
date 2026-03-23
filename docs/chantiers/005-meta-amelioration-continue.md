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

### A2 — Enrichir les patterns sur 2 niveaux
**Priorite** : haute
**Probleme** : seul `nombre-derive` a un fichier patterns, et les patterns actuels ne couvrent que des exercices isoles (1 praxeologie). Les problemes complets multi-questions et les sujets cross-module ne sont pas modelises.
**Proposition** (2 niveaux de patterns) :

**Niveau 1 — `_meta/{prog}/{mod}/patterns.yaml`** (par module) :
- Patterns d'exercices isoles (actuel, type: exercice)
- **NOUVEAU** : patterns de problemes intra-module (type: probleme) — sequence de praxeologies avec role et progression
```yaml
- id: P1
  type: probleme
  name: "Etude de continuite complete"
  sequence:
    - {praxeology: Prax1, role: "justifier continuite"}
    - {praxeology: Prax3, role: "etude par morceaux"}
    - {praxeology: Prax4, role: "TVI existence"}
    - {praxeology: Prax7, role: "dichotomie"}
  frequency: high
  sources: ["Para ex.16", "XY ex.5"]
```

**Niveau 2 — `_meta/{prog}/examens/{slug}/patterns.yaml`** (par examen) :
- Patterns de problemes cross-module frequents dans cet examen
```yaml
- id: EP1
  type: probleme-examen
  name: "Etude de fonction avec TVI et derivee"
  modules: [continuite, fonction-derivee]
  sequence:
    - {praxeology: Prax1, module: continuite, role: "continuite"}
    - {praxeology: Prax4, module: fonction-derivee, role: "tableau de variation"}
    - {praxeology: Prax8, module: continuite, role: "nombre de solutions"}
    - {praxeology: Prax7, module: continuite, role: "dichotomie"}
  frequency: very_high
  points_typiques: 5-6
  sources: ["Synthese T3 2023 ex.3", "Synthese T3 2024 ex.4"]
```

**Sous-taches** :
- [ ] Enrichir le patterns-template.yaml avec le type `probleme`
- [ ] Creer patterns.yaml pour continuite (exercices + problemes intra-module)
- [ ] Creer patterns.yaml pour fonction-derivee
- [ ] Creer patterns.yaml pour denombrement
- [ ] Creer patterns.yaml pour synthese-t3 (problemes cross-module)
**Impact** : direct sur la typicite tunisienne — les livrets examen reproduisent les vrais sujets.
**Status** : a planifier

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
