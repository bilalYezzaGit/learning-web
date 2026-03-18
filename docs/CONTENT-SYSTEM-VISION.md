# Vision du systeme de contenu — GenTech v2

> Document de reference pour le systeme de generation de livrets.
> Definit le modele conceptuel, le workflow, les artefacts et les decisions de design.

**Version** : 1.0
**Date** : 2026-03-17

---

## 1. Mission

Produire des **livrets mathematiques imprimes** de haute qualite a partir de sources pedagogiques tunisiennes. L'application web sert ces memes livrets en version numerique (HTML statique + QCM interactifs + correction IA).

Le systeme GenTech est une **chaine de production editoriale assistee par IA** :
- Un humain pilote les decisions (scope, validation, qualite)
- Un LLM execute la production (transcription, generation, classification)
- Un pipeline compile les artefacts (MDX → HTML + JSON + PDF)

---

## 2. Modele conceptuel

Le systeme repose sur **3 niveaux** et **6 concepts**.

### Niveau 1 — Le savoir (ce qu'on enseigne)

| Concept | Description | Fichier | Cycle de vie |
|---------|-------------|---------|-------------|
| **Programme** | Un cursus scolaire (3eme-math, 2nde-math...) | `_programme.yaml` | Stable |
| **Module** | Un chapitre du programme (continuite, derivation...) | Dossier `content/{prog}/{mod}/` | Stable |
| **KB** | La base de connaissances du module : notions, theoremes, praxeologies, misconceptions | `_kb.md` | Ecrite une fois (WF1), rarement modifiee |
| **Patterns** | Les variantes d'exercices d'examen, classifiees par praxeologie, avec frequences et exemples reels | `_patterns.yaml` | **Vivant** — enrichi iterativement (WF1+) |

### Niveau 2 — Le contenu (ce qu'on produit)

| Concept | Description | Fichier | Cycle de vie |
|---------|-------------|---------|-------------|
| **Atome** | Unite indivisible de contenu : une lecon, un exercice ou un QCM | `{type}-{topic}-{slug}.mdx` | Genere (WF3), valide (WF4) |

### Niveau 3 — Le produit (ce qu'on livre)

| Concept | Description | Fichier | Cycle de vie |
|---------|-------------|---------|-------------|
| **Molecule** | Assemblage ordonne d'atomes formant un livret imprimable | `_molecules/{slug}/molecule.yaml` | Assemble (WF3), compile (pipeline) |

### Relations

```
Programme (1) ──contains──> Module (N)
Module (1) ──has──> KB (1)              # le savoir stable
Module (1) ──has──> Patterns (1)        # les patterns vivants
Module (1) ──contains──> Atome (N)      # le contenu
Module (1) ──contains──> Molecule (N)   # les produits

KB ──definit──> Praxeologie (N)
Patterns ──instancie──> Praxeologie.Variante (N)
Atome ──couvre──> Praxeologie (N)       # via frontmatter
Molecule ──assemble──> Atome (N)        # via sections/steps
Planning ──specifie──> Atome (N)        # avant generation
Planning ──reference──> Pattern (N)     # pour le Livret Examen
```

### Pourquoi "atome" et "molecule" ?

La metaphore chimique est intentionnelle :
- Un **atome** est indivisible — c'est le plus petit grain de contenu reutilisable
- Une **molecule** est un assemblage d'atomes — le meme atome peut apparaitre dans plusieurs molecules
- Un atome seul n'est pas un produit livrable ; une molecule l'est

---

## 3. Les 3 livrets par module

Chaque module produit **3 molecules distinctes**, chacune servant un besoin different :

### Livret 1 — Cours (Initiation)

| Aspect | Detail |
|--------|--------|
| **But** | Apprendre le chapitre. Decouvrir chaque notion avec un exercice d'application immediate |
| **Structure** | Theoreme → 1-2 exercices d'application directe → theoreme suivant → ... → QCM de consolidation |
| **Difficulte atomes** | 0–1 (rappel + application directe) |
| **Public** | Eleve qui decouvre le chapitre ou revise les bases |
| **Source KB** | Notions + praxeologies (definitions abstraites) |
| **Determinisme** | Haut — structure previsible, contenu derive de la KB |

### Livret 2 — Examen (Preparation)

| Aspect | Detail |
|--------|--------|
| **But** | Preparer le controle / BAC. S'entrainer sur les exercices types qui tombent en examen |
| **Structure** | Fiche de synthese (tous les theoremes) → exercices types par pattern, du plus frequent au plus rare → 1-2 sujets complets type BAC |
| **Difficulte atomes** | 1–2 (application + combinaison) |
| **Public** | Eleve qui prepare un examen |
| **Source KB + Patterns** | Les variantes d'examen (`_patterns.yaml`) avec leurs frequences. Chaque exercice instancie un pattern avec de nouvelles valeurs |
| **Determinisme** | **Tres haut** — les patterns sont des templates, le LLM instancie avec des valeurs differentes |

### Livret 3 — Exploration (Approfondissement)

| Aspect | Detail |
|--------|--------|
| **But** | Approfondir et comprendre en profondeur. Problemes atypiques, applications reelles, combinaisons inhabituelles |
| **Structure** | Problemes ouverts, modelisations, cas reels, demonstrations, liens inter-modules |
| **Difficulte atomes** | 2–3 (combinaison + approfondissement) |
| **Public** | Eleve curieux, bon niveau, veut aller au-dela de l'examen |
| **Source KB** | Notions combinees de facon non standard, misconceptions explorees comme problemes |
| **Determinisme** | Bas — le plus creatif, necessite une validation rigoureuse (WF4) |

### Pourquoi exactement 3 ?

- **Completude** : tout eleve trouve son livret (debutant → examen → avance)
- **Systematique** : pas besoin de decider "quel livret pour ce module" — c'est toujours 3
- **Pas de limite** : le systeme permet de creer d'autres molecules (diagnostic, deep-dive, serie thematique...), mais les 3 livrets sont le socle garanti par module

---

## 4. Artefacts du systeme

### 4.1 Arborescence cible

```
content/
├── {programme}/                          # ex: 3eme-math
│   ├── _programme.yaml                  # Metadata programme
│   └── {module}/                        # ex: continuite
│       ├── _kb.md                       # Knowledge Base (WF1, stable)
│       ├── _patterns.yaml              # Patterns d'examen (WF1+, vivant)
│       ├── _molecules/
│       │   └── {slug}/
│       │       ├── molecule.yaml        # Molecule (assemblage d'atomes)
│       │       ├── _planning.yaml       # Planning (fichier de travail WF2)
│       │       └── _validation.md       # Rapport de validation (WF4)
│       ├── lesson-{topic}-{slug}.mdx    # Atome lecon
│       ├── ex-{topic}-{slug}.mdx        # Atome exercice
│       └── qcm-{topic}-{slug}.mdx       # Atome QCM

_raw/
├── *.pdf                                # PDFs sources (manuels, corriges, parascolaires)
├── sources/
│   └── {slug}.yaml                      # Index par PDF (module → pages)
└── reference/
    └── {programme}/{module}/
        ├── manuel.typ                   # Transcription Typst du manuel + corrige
        ├── parascolaire.typ             # Transcription Typst du parascolaire
        └── xyplus.typ                   # Transcription Typst XY Plus
```

### 4.2 Fichiers prefixes `_` (invisibles au pipeline)

Le pipeline ne traite que les fichiers `.mdx` (atomes) et `molecule.yaml` (molecules). Tous les fichiers prefixes `_` sont des **artefacts de travail** invisibles au build :

| Fichier | Role | Cree par |
|---------|------|----------|
| `_kb.md` | Base de connaissances | WF1 |
| `_patterns.yaml` | Patterns d'examen | WF1+ (iteratif) |
| `_planning.yaml` | Spec de generation | WF2 |
| `_validation.md` | Rapport de validation | WF4 |
| `_programme.yaml` | Metadata programme | Manuel (exception : lu par le pipeline) |

### 4.3 Atomes — format MDX

```yaml
---
type: lesson | exercise | qcm
title: "Titre descriptif"
difficulty: 0 | 1 | 2 | 3
timeMinutes: <entier positif>
tags: [tag1, tag2]
category: application | approfondissement | synthese | probleme  # exercices uniquement
praxeologies: [Prax1, Prax2a]                                    # depuis le planning
source: "Manuel T1 p.35"                                          # optionnel
---

Contenu MDX avec directives, LaTeX, blocs Typst...
```

**Types d'atomes :**

| Type | Directives obligatoires | Directives optionnelles |
|------|------------------------|------------------------|
| **lesson** | aucune | `:::definition`, `:::theorem`, `:::property`, `:::example`, `:::remark`, `:::attention` |
| **exercise** | `:::enonce`, `:::solution` | `:::methode`, `:::hint`, `:::erreurs` |
| **qcm** | `:::question`, 2-5 `:::option` (1 `{correct}`), `:::explanation` | aucune |

**Nommage :** `{type}-{topic}-{slug}.mdx` — le topic vient du vocabulaire controle, le slug est semantique et unique dans le module.

### 4.4 Molecules — format YAML

```yaml
kind: livret
visible: true
title: "Titre du livret"
description: "Description courte"
trimester: T1 | T2
order: 1
estimatedMinutes: 120       # optionnel, calcule automatiquement si omis
objectives:
  - "Objectif 1"
  - "Objectif 2"

sections:
  - label: "Nom de la section"
    steps:
      - lesson-{topic}-{slug}          # reference atome par ID
      - ex-{topic}-{slug}
      - quiz:
          - qcm-{topic}-{slug1}        # groupe de 2-5 QCM
          - qcm-{topic}-{slug2}
```

### 4.5 KB — format Markdown

10 sections (cf. template `.claude/skills/content/references/kb-template.md`) :

| # | Section | Contenu |
|---|---------|---------|
| 0 | Objectif | 1 phrase, essence du module |
| 1 | Scope | Inclus / Exclus |
| 2 | Transposition didactique | Savoir savant → savoir a enseigner, conventions tunisiennes |
| 3 | Prerequis & liens | Modules en amont et en aval |
| 4 | Carte des notions | Taxonomie hierarchique (N1, N1.1, N1.2...) |
| 5 | Theoremes & proprietes | Table : ID, enonce, statut (admis/demontre), usage |
| 6 | Composantes de connaissance | Faits, savoir-faire, principes avec difficulte |
| 7 | Exemples canoniques | Exercices recurrents des manuels tunisiens / BAC |
| 8 | Praxeologies | 1 praxeologie = 1 type de tache + 1 technique. Notation : Prax1, Prax2... |
| 9 | Misconceptions & erreurs | Erreurs frequentes avec QCM diagnostiques |

La KB est **ecrite une fois** lors du WF1 et rarement modifiee. Elle est la reference stable du module.

### 4.6 Patterns — format YAML (nouveau)

```yaml
module: continuite
programme: 3eme-math
version: 1                              # incremente a chaque enrichissement

patterns:
  - id: Prax3.v1                        # convention : {praxeologie}.v{numero}
    praxeology: Prax3                   # reference vers la KB
    name: "TVI direct + unicite par monotonie"
    description: >-
      Montrer que f(x)=0 admet une unique solution dans [a,b].
      Continuite + signes opposes + monotonie stricte.
    method:
      - "Verifier que f est continue sur [a,b]"
      - "Calculer f(a) et f(b), montrer les signes opposes"
      - "Appliquer le TVI → existence"
      - "Montrer f strictement monotone → unicite"
    variables:
      function: ["x³-3x+1", "eˣ-2x", "ln(x)+x-2"]
      interval: ["[0,1]", "[1,2]", "[-1,0]"]
    difficulty: 1
    frequency: 5                        # nombre d'occurrences observees dans les sources
    sources:
      - "Manuel T1 p.35 ex.1"
      - "BAC 2024 ex.3a"
      - "Para p.42 ex.7"
    examples:
      - title: "BAC 2024 — Exercice 3a"
        enonce: >-
          Soit f(x) = x³ - 3x + 1. Montrer que l'equation
          f(x)=0 admet une unique solution α dans [0,1].
        sketch: >-
          f(0)=1>0, f(1)=-1<0, f continue → TVI.
          f'(x)=3x²-3<0 sur ]0,1[ → strictement decroissante → unicite.

  - id: Prax3.v2
    praxeology: Prax3
    name: "TVI + encadrement successif"
    # ... meme structure
```

**Regles :**
- 1 fichier `_patterns.yaml` par module (pas par molecule)
- Chaque pattern est lie a une praxeologie de la KB via `praxeology: PraxN`
- Les `examples` contiennent des exercices reels (pas inventes) avec source
- `frequency` est incremente a chaque observation dans une nouvelle source
- `variables` liste ce qui change d'un exercice a l'autre pour ce pattern
- `version` est incremente a chaque enrichissement (WF1+)

### 4.7 Planning — format YAML (fichier de travail)

```yaml
kind: planning
module: "{slug-module}"
programme: "{slug-programme}"
status: draft | validated | generated

slug: "{molecule-slug}"
title: "Titre du livret"
description: "Description"
trimester: T1 | T2
order: 1

design_intent: >-
  Explication libre du choix pedagogique de ce livret.

sections:
  - label: "Nom de la section"
    atoms:
      - slug: lesson-{topic}-{slug}
        type: lesson
        title: "Titre de la lecon"
        praxeologies: [Prax1, Prax3]
        contenu: >-
          2-3 phrases decrivant le contenu a generer.
          Assez precis pour guider la generation.
        difficulte: 1
        timeMinutes: 10

      - slug: ex-{topic}-{slug}
        type: exercise
        title: "Titre de l'exercice"
        praxeologies: [Prax3]
        pattern: Prax3.v1               # reference au pattern (Livret 2)
        contenu: >-
          Instancier le pattern TVI direct avec f(x) = ...
        category: application
        difficulte: 1
        timeMinutes: 10
```

**Regles :**
- Le planning est un **fichier de travail**, pas un artefact final
- Il contient suffisamment de detail pour guider la generation (WF3)
- L'atome genere est la **source de verite finale** — le planning peut diverger apres generation
- Le champ `pattern` est optionnel, utilise principalement pour le Livret 2
- Cycle de vie : `draft` → `validated` (revue humaine) → `generated` (apres WF3)

---

## 5. Workflow GenTech

### 5.1 Vue d'ensemble

```
WF0 (Index + Transcription)
 ↓
WF1 (Knowledge Base) ────── _kb.md (1 fois, stable)
 ↓
WF1+ (Patterns) ─────────── _patterns.yaml (N fois, iteratif)
 │   ↑    ↑    ↑
 │  serie  BAC  parascolaire
 ↓
WF2 (Planning) ──────────── _planning.yaml × 3 (un par livret)
 ↓
WF3 (Generation) ────────── atomes .mdx + molecule.yaml
 ↓
WF4 (Validation) ────────── _validation.md
 │
 ├── Si OK → module termine
 ├── Si FAIL atome → corriger atome, re-valider
 ├── Si FAIL planning → retour WF2
 └── Si KB incomplete → retour WF1
```

### 5.2 WF0 — Index & Transcription

**But :** Transformer les PDFs sources en references Typst exploitables.

**Sous-workflows :**

| Etape | Input | Output | Trigger |
|-------|-------|--------|---------|
| **0a — Index PDF** | PDF brut | `_raw/sources/{slug}.yaml` | `/transcription index {pdf}` |
| **0b — Transcrire module** | Index YAML + pages PNG | `_raw/reference/{prog}/{mod}/*.typ` | `/transcription {module}` |

**Regles :**
- Lecture visuelle uniquement (pas de pdftotext) — les maths ont des figures, tableaux, courbes
- Extraction a 150 DPI max (API rejette les images > 2000px)
- Chunks de 5 pages max par appel
- Fidelite a l'original (pas de reformulation)
- Generer des figures cetz pour les diagrammes

**Etat actuel :** 8 PDFs indexes, 21 transcriptions Typst couvrant 7 modules.

### 5.3 WF1 — Knowledge Base

**But :** Synthetiser le savoir du module a partir des transcriptions.

| | Detail |
|---|---|
| **Input** | Transcriptions Typst (`_raw/reference/{prog}/{mod}/*.typ`) |
| **Output** | `content/{prog}/{mod}/_kb.md` |
| **Trigger** | `/content kb {module}` |
| **Frequence** | 1 fois par module |

**Le coeur de la KB : les praxeologies.** Chaque praxeologie definit un pattern abstrait d'exercice :
- **T** (Type de tache) : ce que l'eleve doit faire
- **τ** (Technique) : comment le faire
- **θ** (Technologie) : pourquoi ca marche (theoreme justificatif)
- **Variables didactiques** : ce qui peut varier
- **Difficulte** : 0–3

La KB est stable. Si des ajustements sont necessaires apres WF4, ils sont exceptionnels.

### 5.4 WF1+ — Enrichissement des patterns (nouveau)

**But :** Accumuler des patterns d'examen concrets a partir de series d'exercices.

| | Detail |
|---|---|
| **Input** | Exercices (PDF, photo, serie, BAC, URL) + KB existante |
| **Output** | `content/{prog}/{mod}/_patterns.yaml` (cree ou enrichi) |
| **Trigger** | `/content patterns {module}` |
| **Frequence** | N fois par module — chaque nouvelle source enrichit le fichier |

**Processus par exercice ingere :**

1. Lire l'exercice et identifier la/les praxeologie(s) mobilisees (reference KB)
2. Comparer avec les patterns existants dans `_patterns.yaml`
3. Si **variante connue** → incrementer `frequency`, ajouter la source, optionnellement ajouter un exemple
4. Si **nouvelle variante** → creer un nouveau pattern avec ID `PraxN.vM`
5. Si **nouvelle praxeologie** (pas dans la KB) → signaler a l'humain (ne pas modifier la KB automatiquement)
6. Incrementer `version`

**Anti-fragile :** Plus on feede le systeme, meilleur il devient. Chaque serie d'exercices, chaque sujet de BAC, chaque parascolaire enrichit la base de patterns.

**Seuil :** Au-dela de ~10 variantes par praxeologie, regrouper ou elaguer les variantes trop proches.

### 5.5 WF2 — Planning

**But :** Specifier les atomes a generer pour une molecule.

| | Detail |
|---|---|
| **Input** | KB + Patterns + choix du type de livret |
| **Output** | `content/{prog}/{mod}/_molecules/{slug}/_planning.yaml` |
| **Trigger** | `/content plan {module}` |
| **Frequence** | 1 fois par molecule (3 par module pour les 3 livrets) |

**Specificites par type de livret :**

| Livret | Source principale | Champ `pattern` | Structure typique |
|--------|-----------------|-----------------|-------------------|
| **1 — Cours** | KB (praxeologies) | Rarement utilise | lesson → ex direct → lesson → ... → quiz |
| **2 — Examen** | Patterns (`_patterns.yaml`) | Systematique | fiche synthese → ex types par frequence decroissante → sujet complet |
| **3 — Exploration** | KB (notions combinees) | Jamais utilise | problemes ouverts, modelisations, demonstrations |

**Le planning est un fichier de travail :**
- Il sert a guider WF3 (generation)
- Il contient suffisamment de detail (`contenu`, `praxeologies`, `pattern`) pour une generation fidele
- Apres generation, l'atome MDX est la source de verite — le planning peut diverger
- Cycle : `draft` → `validated` (revue humaine obligatoire) → `generated`

### 5.6 WF3 — Generation

**But :** Creer les atomes MDX et la molecule YAML a partir du planning valide.

| | Detail |
|---|---|
| **Input** | Planning valide + KB + Patterns + templates |
| **Output** | Atomes `.mdx` + `molecule.yaml` |
| **Trigger** | `/content creer {module}` |

**Processus :**

1. Charger le planning (status = `validated`)
2. Charger la KB et les patterns comme contexte
3. Pour chaque atome du planning :
   - Generer le MDX selon le type (lesson/exercise/qcm)
   - Respecter le `contenu` du planning
   - Si `pattern` reference → instancier la variante avec de nouvelles valeurs
   - Remplir le frontmatter (praxeologies, difficulty, tags depuis le planning)
4. Assembler la molecule YAML (sections/steps referencant les IDs d'atomes)
5. Mettre a jour le planning : `status: generated`

**Determinisme :**
- Livret 1 : le LLM suit la KB → assez deterministe
- Livret 2 : le LLM instancie des patterns → **tres deterministe**
- Livret 3 : le LLM cree librement dans le scope KB → peu deterministe

### 5.7 WF4 — Validation

**But :** Verifier la qualite des atomes generes.

| | Detail |
|---|---|
| **Input** | Atomes generes + KB + Planning |
| **Output** | `_validation.md` par molecule |
| **Trigger** | `/content valider {module}` |

**Deux niveaux :**

| Niveau | Outil | Ce qu'il verifie |
|--------|-------|-------------------|
| **Syntaxe** | `npm run generate` (pipeline) | IDs valides, references resolues, structure MDX, QCM bien formes |
| **Semantique** | `/content valider {module}` (LLM) | Maths correctes, pedagogie alignee, praxeologies couvertes |

**Grille de validation semantique :**

| Grille | Criteres |
|--------|----------|
| **A — Structure** | Frontmatter complet, ID conforme, directives autorisees, Typst compile |
| **B — Mathematiques** | Calculs justes, solutions completes, QCM corrects, domaines verifies |
| **C — Pedagogie** | Difficulte alignee, praxeologies correspondantes, temps realiste, enonces clairs |

**Verdicts par atome :** PASS / WARN / FAIL

**Boucle de retour :**
- FAIL atome → corriger l'atome, re-valider
- FAIL systematique → revenir a WF2 (ajuster le planning)
- KB incomplete → revenir a WF1 (completer)

---

## 6. Pipeline de compilation

Le pipeline transforme les artefacts de contenu en fichiers web + PDF.

### 6.1 Stages

```
content/                          src/generated/              public/pdfs/
  *.mdx + molecule.yaml    →     atoms/*.html                *.pdf
                                  atoms/*.json (QCM)
                                  atoms/*.mdx (raw, pour scan API)
                                  livrets/*.json
                                  catalogues/*.json
                                  programmes.json
                                  manifest.json
```

| Stage | Input | Output |
|-------|-------|--------|
| **1. Read** | `*.mdx` + `molecule.yaml` | RawAtom[] + RawLivret[] |
| **2. Validate** | Raw data | Errors/warnings (orphelins, QCM malformes, refs manquantes) |
| **3. Compile** | RawAtom[] | HTML (lessons/exercices) + JSON (QCM) via MDX→HTML + KaTeX + Typst→SVG |
| **4. Resolve** | RawLivret[] + Atoms | ResolvedLivret[] (atomes lies, metadata calculees) |
| **5. Write** | Tout | `src/generated/` (JSON + HTML + MDX raw) |
| **6. Generate PDFs** | Atomes + Livrets resolus | `public/pdfs/{slug}.pdf` via MDX→Typst + Typst WASM |

### 6.2 Double compilation

Chaque atome est compile **deux fois** :
- **MDX → HTML** : pour l'application web (KaTeX, directives → HTML style, Typst → SVG inline)
- **MDX → Typst** : pour le PDF (directives → fonctions Typst, LaTeX → mitex, structure A4)

### 6.3 QR codes

Chaque exercice dans un PDF a un QR code pointant vers :
```
{QR_BASE_URL}/app/ex?b={compact_code}&e={atom_id}
```
L'app redirige vers la page exercice correspondante. Le QR code de couverture pointe vers le hub du livret.

### 6.4 Commandes

```bash
npm run generate     # Pipeline complet (6 stages)
npm run build        # Pipeline + Next.js build
```

---

## 7. Tracabilite

Le systeme maintient une chaine de tracabilite complete :

```
Source PDF
  ↓ (WF0)
Transcription Typst (_raw/reference/)
  ↓ (WF1)
KB (_kb.md) → Praxeologie (Prax3)
  ↓ (WF1+)
Pattern (_patterns.yaml) → Variante (Prax3.v1)
  ↓ (WF2)
Planning (_planning.yaml) → Spec atome (slug + contenu + pattern)
  ↓ (WF3)
Atome (.mdx) → frontmatter: praxeologies: [Prax3]
  ↓ (WF4)
Validation (_validation.md) → PASS / FAIL
  ↓ (Pipeline)
HTML + PDF → produit livre
```

A chaque niveau, on peut remonter a la source.

---

## 8. Etat actuel et prochaines etapes

### Ce qui existe (post-nettoyage 2026-03-17)

| Artefact | Quantite |
|----------|----------|
| Programmes actifs | 1 (3eme-math) |
| Modules avec contenu | 2 (fonction-derivee, nombre-derive) |
| Atomes | 38 |
| Molecules | 4 |
| KB | 2 |
| Plannings | 4 |
| Validations | 3 |
| Patterns | 0 (nouveau concept) |
| Transcriptions Typst | 21 (couvrant 7 modules) |
| PDFs sources indexes | 8 |

### Prochaines etapes

| # | Etape | Description |
|---|-------|-------------|
| 1 | **Creer le skill WF1+** | Implementer `/content patterns {module}` pour l'enrichissement iteratif |
| 2 | **Piloter sur nombre-derive** | C'est le module le plus petit (15 atomes, 1 molecule). Creer `_patterns.yaml` en feedant les exercices des transcriptions existantes |
| 3 | **Generer les 3 livrets** | Tester le workflow complet WF1→WF1+→WF2×3→WF3×3→WF4 sur nombre-derive |
| 4 | **Durcir le pipeline** | Fixer les bugs critiques (NaN concurrency, duplicates silencieux, echecs PDF silencieux) |
| 5 | **Iterer** | Appliquer le meme processus aux modules suivants, affiner le workflow |

---

## 9. Decisions de design

| Date | Decision | Raison |
|------|----------|--------|
| 2026-03-17 | Garder la metaphore atome/molecule | Coherente : atome = indivisible, molecule = assemblage |
| 2026-03-17 | Pas de types formels de livrets | Liberte de creer n'importe quel type (cours, examen, exploration, deep-dive, diagnostic...) |
| 2026-03-17 | KB stable, patterns iteratifs | Separer le savoir (stable) des observations empiriques (vivantes) |
| 2026-03-17 | `_patterns.yaml` separe de `_kb.md` | La KB est ecrite 1 fois, les patterns sont enrichis N fois |
| 2026-03-17 | Planning = fichier de travail | L'atome est la source de verite finale, le planning guide la generation |
| 2026-03-17 | 3 livrets par module (cours, examen, exploration) | Couvre 3 besoins distincts : apprendre, reviser, approfondir |
| 2026-03-17 | Workflow iteratif | WF4 peut renvoyer a WF2 ou WF1, WF1+ s'appelle N fois |
| 2026-03-17 | Nettoyage des modules ad-hoc | Supprimer les modules crees hors workflow (continuite, fonctions, derivation, fdu-usuelle) pour repartir sur une base propre |
| 2026-03-17 | Conserver les transcriptions _raw/ | WF0 deja fait pour 7 modules — reutilisable pour recreer ces modules via le workflow |
| 2026-03-17 | 10 sections KB gardees | Iterer apres plusieurs usages complets avant de simplifier |

---

## 10. Glossaire

| Terme | Definition |
|-------|-----------|
| **Atome** | Plus petite unite de contenu : 1 fichier MDX (lecon, exercice ou QCM) |
| **Molecule** | Assemblage ordonne d'atomes formant un livret imprimable (YAML) |
| **Module** | Chapitre du programme. Dossier contenant atomes, molecules, KB et patterns |
| **Programme** | Cursus scolaire (ex: 3eme-math). Contient N modules |
| **KB** | Knowledge Base — base de connaissances du module (notions, theoremes, praxeologies, erreurs) |
| **Patterns** | Variantes d'exercices d'examen classifiees par praxeologie, avec frequences et exemples |
| **Planning** | Fichier de travail specifiant les atomes a generer pour une molecule |
| **Praxeologie** | Pattern abstrait d'exercice : 1 type de tache + 1 technique |
| **Variante** | Instance concrete d'une praxeologie telle qu'elle apparait en examen |
| **Pipeline** | Chaine de compilation : MDX/YAML → HTML/JSON/PDF |
| **WF0** | Workflow d'indexation et transcription des PDFs sources |
| **WF1** | Workflow de creation de la KB |
| **WF1+** | Workflow d'enrichissement iteratif des patterns |
| **WF2** | Workflow de planning (specification des atomes a generer) |
| **WF3** | Workflow de generation (creation des atomes et molecules) |
| **WF4** | Workflow de validation (verification qualite) |
