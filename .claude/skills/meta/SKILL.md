---
name: meta
description: Creer ou ameliorer le modele academique (_meta/) d'un module ou examen. Utilise les fondations pour creer et les enrichissements pour proposer des ameliorations. Keywords - meta, kb, knowledge base, modele, savoir, praxeologies, misconceptions, patterns, enrichir, fondation.
argument-hint: "{path} [fichier-enrichissement] — ex: 3eme-math/continuite, continuite, 3eme-math/examens/synthese-t3"
---

# Modelisation academique

Cree ou ameliore le modele academique d'un module ou examen dans `_meta/`.
Phase independante — ne s'occupe ni de transcription ni de production de livrets.

## Notion de path

Le **path** identifie un element : `{programme}/{module}` ou `{programme}/examens/{slug}`.

```
3eme-math/continuite              ← module
3eme-math/examens/synthese-t3     ← examen
continuite                        ← raccourci si un seul programme
```

Le path est commun entre `_raw/` et `_meta/` :
- `_raw/3eme-math/fondations/continuite/` ← transcriptions sources
- `_raw/3eme-math/enrichissements/continuite/` ← enrichissements
- `_meta/3eme-math/continuite/` ← modele academique

## Syntaxe

```
/meta 3eme-math/continuite                           # creer ou verifier le modele
/meta continuite                                     # raccourci
/meta continuite serie-prof-ahmed.typ                # enrichir avec un fichier specifique
/meta 3eme-math/examens/synthese-t3                  # creer ou verifier un examen
```

**Argument obligatoire** — `/meta` sans path n'est pas supporte.

## Pipeline

### Etape 1 — Detecter l'etat

Verifier si `_meta/{programme}/{module}/` existe :

```
Glob: _meta/{programme}/{module}/savoir.yaml
```

**Deux modes** selon le resultat :

| Etat | Mode | Comportement |
|------|------|-------------|
| `_meta/` n'existe pas | **Creation** | Lire les fondations → creer le modele → puis proposer enrichissements |
| `_meta/` existe | **Verification** | Relire fondations + enrichissements → comparer → proposer ameliorations |

### Etape 2a — Mode creation (le modele n'existe pas)

**Sous-etape 1 : Creer depuis les fondations**

1. Lire les transcriptions fondation :
   ```
   Glob: _raw/{programme}/fondations/{module}/*.typ
   ```
   Si aucune transcription → **stop**, suggerer `/transcrire {path}`.

2. Charger les references :
   ```
   Read: .claude/skills/content/references/kb-template.md
   Read: docs/CONTENT-CONVENTIONS.md (section 12 : redaction mathematique programme tunisien)
   ```

3. Croiser les sources (manuel + parascolaire + xyplus) et synthetiser en 3 fichiers :
   ```
   Write: _meta/{programme}/{module}/savoir.yaml         # sections 0-7 + 10 (notations)
   Write: _meta/{programme}/{module}/praxeologies.yaml    # section 8
   Write: _meta/{programme}/{module}/misconceptions.yaml  # section 9
   ```

4. Mettre a jour les fiches sources : `status: meta-complete`.

**Sous-etape 2 : Proposer des enrichissements** (si des fichiers existent dans enrichissements/)

Scanner `_raw/{programme}/enrichissements/{module}/` pour les fichiers non traites.
Si des fichiers existent → passer a l'etape 3 (confrontation).
Sinon → terminer.

### Etape 2b — Mode verification (le modele existe)

1. Charger le modele existant :
   ```
   Read: _meta/{programme}/{module}/savoir.yaml
   Read: _meta/{programme}/{module}/praxeologies.yaml
   Read: _meta/{programme}/{module}/misconceptions.yaml
   Read: _meta/{programme}/{module}/patterns.yaml (si existe)
   ```

2. Relire les fondations :
   ```
   Glob: _raw/{programme}/fondations/{module}/*.typ
   ```

3. Scanner les enrichissements :
   ```
   Glob: _raw/{programme}/enrichissements/{module}/*
   ```
   Si un 2eme argument est donne (fichier specifique), ne traiter que celui-la.

4. Passer a l'etape 3 (confrontation).

### Etape 3 — Confrontation et propositions

Pour chaque source (fondation relue ou enrichissement), comparer avec `_meta/` existant :

**Effets possibles** :

| Effet | Detail | Cible |
|-------|--------|-------|
| Pattern connu | Un exercice correspond a un pattern existant | patterns.yaml : frequency++ |
| Nouveau pattern | Un exercice avec une structure inconnue | patterns.yaml : nouveau pattern propose |
| Praxeologie manquante | Un type de tache non identifie | praxeologies.yaml : nouvelle praxeologie proposee |
| Contradiction | La source dit X, la KB dit Y | Alerte dans le rapport |
| Nouvelle misconception | Une erreur classique non documentee | misconceptions.yaml : ajout propose |
| Enrichissement du savoir | Un theoreme mieux formule ou un exemple supplementaire | savoir.yaml : modification proposee |
| Confirmation | Source coherente avec le modele | Rien a modifier |

**Regle absolue** : ne JAMAIS modifier `_meta/` directement en mode confrontation. Produire un rapport avec des propositions.

### Etape 4 — Rapport

Presenter un rapport structure :

```
## Rapport — 3eme-math/continuite

### Sources analysees
- Fondations : manuel.typ, parascolaire.typ, xyplus.typ (relues)
- Enrichissements : serie-prof-ahmed.typ (nouveau)

### Propositions d'amelioration

| # | Source | Effet | Detail | Fichier cible |
|---|--------|-------|--------|--------------|
| 1 | serie-prof | pattern connu | Prax1.v1 freq 6→7 | patterns.yaml |
| 2 | serie-prof | nouveau pattern | Prax3.v4 (morceaux 3 pieces + parametre) | patterns.yaml |
| 3 | serie-prof | contradiction | "continue ⇒ derivable" (faux) | alerte |
| 4 | fondation | enrichissement | Meilleure formulation de T8 | savoir.yaml |

### Actions
Valider les propositions ? (oui / non / choisir / detail N)
```

### Etape 5 — Validation humaine

L'utilisateur peut :
- **oui** → appliquer toutes les propositions
- **non** → ne rien modifier
- **choisir** → selectionner les propositions a appliquer (ex: "1, 2, 4")
- **detail N** → voir le detail d'une proposition avant de decider

Appliquer les propositions validees et marquer les fichiers d'enrichissement comme traites dans `_raw/{programme}/enrichissements/_processed.yaml`.

## Regles

- **Path obligatoire** — toujours specifier quel module/examen
- **Creation** : modifie `_meta/` directement (c'est le but)
- **Verification/enrichissement** : ne modifie JAMAIS sans validation humaine
- **Fondations** : sources de reference, creent le modele de base
- **Enrichissements** : sources iteratives, proposent des ameliorations
- **Les 3 fichiers meta** : savoir.yaml (sections 0-7+10), praxeologies.yaml (section 8), misconceptions.yaml (section 9)
- **patterns.yaml** : cree/enrichi par la confrontation avec des exercices (optionnel, WF1+)

## Fichiers de sortie

```
_meta/{programme}/{module}/
├── savoir.yaml           # Objectif, theoremes, concepts, notations, exemples
├── praxeologies.yaml     # Types de taches, techniques, difficulty, exam_frequency
├── misconceptions.yaml   # Erreurs frequentes avec diagnostic QCM
└── patterns.yaml         # Variantes d'exercices observees (optionnel)
```
