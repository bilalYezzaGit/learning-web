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

### A2 — Creer `patterns.yaml` pour 3 modules manquants
**Priorite** : haute
**Probleme** : seul `nombre-derive` a un fichier patterns. Les livrets examen des 3 autres modules (continuite, fonction-derivee, denombrement) sont generes sans reference aux exercices reels tunisiens.
**Proposition** : pour chaque module, analyser les exercices des manuels/parascolaires/xyplus et creer le fichier patterns via `/content patterns {module}`.
**Impact** : direct sur la typicite tunisienne des livrets examen.
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
