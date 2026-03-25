# Content Agentic Workflow

Document vivant qui decrit le systeme de generation de contenu pedagogique.

---

## Architecture

3 couches decouples, 3 phases de travail independantes.

```
_raw/          Ressources brutes (PDFs, transcriptions Typst)
_meta/         Modele academique (YAML structure)
content/       Livrets produits (atomes MDX + molecules YAML)
```

### Couche `_raw/{programme}/`

```
3eme-math/
├── pdfs/                             # Fichiers bruts (PDF, images)
├── sources/                          # Fiches d'indexation (1 YAML par PDF)
│   └── manuel-3eme-t1.yaml          #   → titre, editeur, modules, pages, status
├── fondations/                       # Transcriptions de reference (creent la KB)
│   └── {module}/                     #   → manuel.typ, parascolaire.typ, xyplus.typ
└── enrichissements/                  # Sources iteratives (confrontent la KB)
    └── {module}/                     #   → series, examens, cours de profs
```

Le dossier dans lequel tu mets un fichier EST l'intention :
- `fondations/` = source de reference, fait autorite
- `enrichissements/` = source a confronter au modele existant

### Couche `_meta/`

```
_meta/
├── booklet-profiles.yaml             # Profils livrets + pedagogie DO/DO NOT
└── 3eme-math/
    ├── prerequis-graph.yaml          # Dependances entre modules
    ├── {module}/                     # 3-4 fichiers par module
    │   ├── savoir.yaml              #   theoremes, concepts, notations, exemples
    │   ├── praxeologies.yaml        #   types d'exercices, techniques, difficulte
    │   ├── misconceptions.yaml      #   erreurs frequentes, diagnostic QCM
    │   └── patterns.yaml            #   variantes observees (optionnel)
    └── examens/{slug}/
        ├── spec.yaml                #   structure, duree, distribution
        └── patterns.yaml            #   patterns cross-module
```

### Couche `content/{programme}/`

```
3eme-math/
├── _programme.yaml                   # Metadata du programme
└── {module}/
    └── {profil}/                     # Ex: cours/, examen/, exploration/
        ├── molecule.yaml             #   Livret assemble (sections → atomes)
        ├── _planning.yaml            #   Manifeste de generation
        └── *.mdx                     #   Atomes du livret (lesson, exercise, qcm)
```

Chaque livret est un dossier autonome. Ses atomes vivent avec lui.

---

## Phases de travail

3 phases independantes. Chaque phase peut etre faite un jour different, par un outil different.

```
Phase 1 — Transcription          brut → structure         /index, /transcrire
Phase 2 — Modelisation           transcriptions → _meta/  /meta
Phase 3 — Production             _meta/ → livrets         /content plan, /content creer, /content valider
```

### Phase 1 — Transcription

**But** : transformer des fichiers bruts en fichiers Typst structures et lisibles.
**Independante** de _meta/ et content/. Activite autonome.

| Commande | Ce qu'elle fait |
|----------|-----------------|
| `/index` | Indexe tous les fichiers bruts non indexes (couverture + table des matieres → fiche YAML) |
| `/index fichier.pdf` | Indexe un fichier specifique |
| `/transcrire` | Montre l'etat global (X transcrits, Y non transcrits), propose quoi transcrire |
| `/transcrire 3eme-math/continuite` | Transcrit un module specifique (3 agents en parallele) |

**Parcours utilisateur** :
```
1. Deposer un PDF dans _raw/3eme-math/fondations/ (ou enrichissements/)
2. /index                    → le systeme detecte le nouveau PDF, cree la fiche source
3. /transcrire               → "12 modules non transcrits. Lesquels ?"
4. /transcrire continuite    → transcrit depuis les 3 sources en parallele
```

### Phase 2 — Modelisation

**But** : creer ou ameliorer le modele academique d'un module.
**Independante** de content/. Activite autonome.

| Commande | Ce qu'elle fait |
|----------|-----------------|
| `/meta 3eme-math/continuite` | Si _meta/ n'existe pas → cree depuis les fondations. Si existe → verifie + propose ameliorations |
| `/meta continuite` | Raccourci (si un seul programme) |
| `/meta continuite serie.typ` | Enrichit avec un fichier specifique |

**Deux modes automatiques** :

| Etat | Mode | Comportement |
|------|------|-------------|
| _meta/ n'existe pas | **Creation** | Lit les fondations → cree 3 fichiers YAML → puis propose enrichissements si disponibles |
| _meta/ existe | **Verification** | Relit fondations + enrichissements → compare → propose ameliorations (ne modifie rien sans validation) |

**Sortie** : `_meta/{prog}/{mod}/` — savoir.yaml, praxeologies.yaml, misconceptions.yaml (+ patterns.yaml si enrichissements)

### Phase 3 — Production

**But** : generer des livrets a partir du modele academique.
**Depend de** _meta/ mais pas de _raw/.

| Commande | Ce qu'elle fait |
|----------|-----------------|
| `/content plan 3eme-math/continuite : cours` | Genere un planning calibre par le profil |
| `/content plan continuite : examen` | Raccourci |
| `/content creer 3eme-math/continuite : cours` | Genere les atomes + molecule depuis le planning |
| `/content creer continuite` | Sans profil → genere tous les livrets planifies |
| `/content valider continuite` | Validation semantique (4 grilles : structure, maths, pedagogie, profil) |
| `npm run generate` | Pipeline : compile MDX → HTML/JSON + PDFs |

**Profils de livrets** (definis dans `_meta/booklet-profiles.yaml`) :

| Profil | Diff | Atomes | Guidance | DO/DO NOT |
|--------|------|--------|----------|-----------|
| `cours` | 0-1 | ~16 | haute | 14 regles |
| `examen` | 1-2 | ~17 | moyenne | 11 regles |
| `exploration` | 2-3 | ~10 | faible | 12 regles |

**Parcours utilisateur** :
```
1. /content plan continuite : cours      → planning genere (draft)
2. Relire, ajuster si besoin             → passer en validated
3. /content creer continuite : cours     → 16 atomes MDX + molecule.yaml
4. npm run generate                      → PDF genere
5. /content valider continuite           → rapport de validation
```

---

## Notion de path

Le **path** identifie un element partout dans le systeme : `{programme}/{module}` ou `{programme}/examens/{slug}`.

```
3eme-math/continuite                 ← module
3eme-math/examens/synthese-t3        ← examen
continuite                           ← raccourci si un seul programme
```

Le path est le meme dans `_raw/`, `_meta/` et `content/` :
```
_raw/3eme-math/fondations/continuite/   ← transcriptions
_meta/3eme-math/continuite/             ← modele academique
content/3eme-math/continuite/           ← livrets
```

---

## Outils complementaires

| Outil | Phases | Pourquoi |
|-------|--------|----------|
| **Claude Code** | Phase 3 (production) | Pipeline, TypeScript, git, generation batch MDX |
| **Claude Cowork** | Phase 1-2 (transcription, modelisation) | Lecture de PDFs, synthese, discussion iterative |

Les deux outils partagent les memes dossiers (`_raw/`, `_meta/`, `content/`).

---

## Commandes — Reference rapide

| Commande | Phase | Ce qu'elle fait |
|----------|-------|-----------------|
| `/index` | 1 | Indexer les fichiers bruts non indexes |
| `/transcrire` | 1 | Etat global + transcrire des modules |
| `/meta {path}` | 2 | Creer ou verifier/enrichir le modele |
| `/content plan {path} : {profil}` | 3 | Planifier un livret |
| `/content creer {path} : {profil}` | 3 | Generer les atomes + molecule |
| `/content valider {path}` | 3 | Valider le contenu |
| `npm run generate` | 3 | Compiler + PDFs |

---

## Etat actuel

> Mis a jour le 2026-03-24.

| Metrique | Valeur |
|----------|--------|
| Programmes | 1 avec contenu (3eme-math) |
| Modules avec contenu | 4 (continuite, denombrement, fonction-derivee, nombre-derive) |
| Atomes MDX | 218 |
| Livrets | 12 (dans des dossiers par profil) |
| Meta modules | 4 (savoir + praxeologies + misconceptions + patterns) |
| Patterns | 116 (4 modules + 1 examen) |
| Fiches sources | 8 (tous les PDFs 3eme-math indexes) |
| Fondations Typst | 8 modules transcrits (24 fichiers .typ) |
| Modules prets pour meta | 4 (generalites-fonctions, limites-continuite, limites-asymptotiques, exemples-etude-fonctions) |
| Modules non transcrits | 15 |
| Pipeline | 0 erreurs, 12 PDFs |

---

## Lacunes

| # | Lacune | Priorite |
|---|--------|----------|
| L1 | `content-agentic-workflow.md` mentionne encore `_molecules/` dans les schemas WF2/WF3 | haute |
| L2 | Pas d'export lisible de `_meta/` pour review par des profs | haute |
| L3 | Pas de livret cross-module (l'architecture le permet) | moyenne |
| L4 | `docs/CONTENT-CONVENTIONS.md` reference l'ancienne structure | moyenne |
| L5 | Praxeologies.yaml contient des champs non utilises (theory, didactic_variables, difficulty_profiles) | basse |
