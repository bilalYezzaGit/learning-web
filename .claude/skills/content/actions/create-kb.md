# Action : Creer une KB module

## Regles

- La KB est une **synthese**, pas une copie — croiser les 3 sources (manuel, parascolaire, xyplus)
- Suivre le template section par section (10 sections)
- Respecter les conventions du referentiel `docs/referentiels/redaction-mathematiques-tunisie.md`
- Section 8 (Praxeologies) est la plus critique : 1 praxeologie = 1 type de tache + 1 technique
- Section 9 (Misconceptions) : inclure des questions diagnostiques au format QCM
- Output : fichiers splites dans `_meta/{programme}/{module}/` (savoir.yaml, praxeologies.yaml, misconceptions.yaml)

## Pre-requis

Verifier que les transcriptions .typ existent dans `_raw/{programme}/fondations/{module}/`.

```
Glob: _raw/{programme}/fondations/{module}/*.typ
```

Si elles manquent, indiquer quels fichiers sont absents et suggerer `/transcrire {module}`.

## Pipeline

### Etape 1 — Verifier les transcriptions disponibles

```
Glob: _raw/{programme}/fondations/{module}/*.typ
```

Lister les fichiers trouves. On attend jusqu'a 3 sources (manuel, parascolaire, xyplus). Si aucun fichier n'existe, **stop** et orienter vers `/transcrire {module}`.

### Etape 2 — Charger le template

```
Read: .claude/skills/content/references/kb-template.md
```

### Etape 3 — Charger les referentiels

```
Read: docs/referentiels/redaction-mathematiques-tunisie.md
```

### Etape 4 — Lire les transcriptions

Lire les fichiers .typ trouves a l'etape 1 (typiquement 3 fichiers). Ce sont des transcriptions Typst des sources PDF — les lire integralement.

### Etape 5 — Remplir le template section par section

Croiser les 3 sources pour chaque section. Estimation de taille par section :

| Section | Contenu | ~Lignes |
|---------|---------|---------|
| 0 — Objectif | 1 phrase | 3 |
| 1 — Scope | Inclus/Exclus | 15 |
| 2 — Transposition didactique | Savoir savant, savoir a enseigner, adaptations | 20 |
| 3 — Prerequisites | Liens inter-modules | 15 |
| 4 — Carte des notions | Hierarchie N1, N1.1, etc. | 40 |
| 5 — Theoremes et proprietes | Table ID/Enonce/Statut | 25 |
| 6 — Knowledge Components | Facts, Skills, Principles | 30 |
| 7 — Exemples canoniques | Classiques tunisiens | 15 |
| 8 — Praxeologies | T, tau, theta, variables, difficulte | 150-200 |
| 9 — Misconceptions | Avec QCM diagnostique | 70 |
| 10 — Regles redactionnelles | Notations, rigueur, formules (inclus dans savoir.yaml) | 30 |

**Section 8 — Praxeologies** (la plus critique) :
- 1 praxeologie = 1 type de tache + 1 technique (jamais d'alternatives dans "Technique")
- Chaque praxeologie a : Notions mobilisees, Type de tache (T), Technique (tau), Technologie (theta), Variables didactiques, Exemples canoniques, Difficulte
- Utiliser Prax5a, Prax5b pour regrouper des variantes d'un meme theme

**Section 9 — Misconceptions** :
- Chaque erreur a une question diagnostique QCM avec distracteurs cibles
- Chaque distracteur revele une misconception specifique

### Etape 6 — Ecrire les fichiers splites

Ecrire la KB en 3 fichiers dans `_meta/{programme}/{module}/` :

```
Write: _meta/{programme}/{module}/savoir.yaml        # Sections 0-7 + 10 (objectif, scope, transposition, prereqs, carte, theoremes, KC, exemples, notations)
Write: _meta/{programme}/{module}/praxeologies.yaml   # Section 8 (praxeologies)
Write: _meta/{programme}/{module}/misconceptions.yaml # Section 9 (misconceptions + QCM diagnostiques)
```

### Etape 7 — Mettre a jour l'interface

Ajouter/mettre a jour l'entree du module dans `_meta/_interface.yaml` :

```yaml
modules:
  {module}:
    programme: {programme}
    kb_status: complete     # ou partial
    files: [savoir, praxeologies, misconceptions]
```

## Checklist KB

Avant de presenter le resultat a l'utilisateur, verifier :

- [ ] Les 10 sections sont presentes et remplies (reparties sur les 3 fichiers)
- [ ] Chaque praxeologie a T, tau, theta, variables didactiques, difficulte
- [ ] Chaque misconception a une question diagnostique QCM
- [ ] Les notations suivent le referentiel tunisien
- [ ] Les liens inter-modules sont corrects (prerequisites, ouvre vers)
- [ ] Les 3 fichiers sont bien places dans `_meta/{programme}/{module}/`
- [ ] `_meta/_interface.yaml` est mis a jour avec l'entree du module
