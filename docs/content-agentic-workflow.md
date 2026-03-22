# Content Agentic Workflow

Document vivant qui cartographie le systeme de contenu pilote par LLM.

---

## Partie 1 : Inventaire des ressources

| Ressource | Chemin | Role | Utilise dans |
|-----------|--------|------|--------------|
| **--- Indexation & transcription (WF0) ---** | | | |
| PDFs bruts | `_raw/*.pdf` | Sources PDF manuels tunisiens | WF0 [0a] — entree indexation |
| Fiches sources | `_raw/sources/{slug}.yaml` | Cartographie structuree par PDF (1 fiche = 1 PDF) | WF0 [0a] — sortie ; WF0 [0b] — plages de pages |
| Skill /transcription | `.claude/skills/transcription/SKILL.md` | Transcription PDF -> Typst | WF0 [0b] — declencheur transcription |
| Skill /source | `.claude/skills/source/SKILL.md` | Gestion sources pedagogiques web | pre-WF0 — veille et scan de sources |
| Sources web | `docs/content-intelligence/sources/registry.md` | Registre de sources pedagogiques | pre-WF0 — reference lors de la recherche |
| References Typst | `_raw/reference/{programme}/{module}/` | Transcriptions PDF -> Typst | WF0 [0b] — sortie ; WF1 — entree |
| **--- Modele academique (_meta/) ---** | | | |
| Interface | `_meta/_interface.yaml` | Contrat IDs modules/patterns/examens | WF1 — enregistrement ; WF2 — resolution refs ; WF3 — resolution refs |
| Savoir module | `_meta/modules/{mod}/savoir.yaml` | Objectif, scope, theoremes, knowledge components | WF1 — sortie ; WF2 [2a] — entree analyse |
| Praxeologies | `_meta/modules/{mod}/praxeologies.yaml` | Types de taches, techniques, technologies | WF1 — sortie ; WF2 [2a] — entree analyse ; WF3 [3a] — reference |
| Patterns module | `_meta/modules/{mod}/patterns.yaml` | Variantes d'examen par praxeologie | WF1+ — sortie ; WF2 — entree Livret 2 |
| Misconceptions | `_meta/modules/{mod}/misconceptions.yaml` | Erreurs frequentes, diagnostics, remediations | WF1 — sortie ; WF3 [3a] — reference QCM |
| Lexique module | `_meta/modules/{mod}/lexique.yaml` | Regles de redaction specifiques au module | WF1 — sortie ; WF3 [3a] — reference redaction |
| Redaction module | `_meta/modules/{mod}/redaction.yaml` | Conventions de redaction specifiques au module | WF1 — sortie ; WF3 [3a] — reference redaction |
| Specs examen | `_meta/examens/{slug}.yaml` | Structure, duree, distribution par module | WF2 — plans cross-module/examen |
| Globaux | `_meta/global/` | Lexique partage, echelle complexite, graphe prerequis | WF2 — reference transversale ; WF3 — reference |
| **--- Knowledge Base (WF1) ---** | | | |
| Referentiels | `docs/referentiels/` | Conventions redaction maths tunisiennes | WF1 — reference KB ; WF3 [3a] — reference generation |
| KB template | `.claude/skills/content/references/kb-template.md` | Modele pour creer une KB module | WF1 — template de creation |
| KB modules | `_meta/modules/{mod}/` (savoir.yaml, praxeologies.yaml, misconceptions.yaml, lexique.yaml, redaction.yaml) | Savoir structure par module (migre depuis _kb.md) | WF1 — sortie ; WF1+ — reference praxeologies ; WF2 [2a] — entree analyse |
| **--- Patterns (WF1+) ---** | | | |
| Patterns template | `.claude/skills/content/references/patterns-template.yaml` | Schema du fichier patterns | WF1+ — template |
| Patterns module | `_meta/modules/{mod}/patterns.yaml` | Variantes d'examen par praxeologie | WF1+ — sortie ; WF2 — entree Livret 2 |
| **--- Planning (WF2) ---** | | | |
| Planning template | `.claude/skills/content/references/planning-template.yaml` | Schema du manifeste per-molecule | WF2 [2b] — template de creation |
| Planning per-molecule | `content/{prog}/{mod}/_molecules/{slug}/_planning.yaml` | Manifeste par molecule (avant generation) | WF2 — sortie ; WF3 [3a] — spec de generation ; WF4 [4a] — verification couverture |
| **--- Generation (WF3) ---** | | | |
| Templates atomes | `.claude/skills/content/references/templates.md` | Templates copier-coller par type | WF3 [3a] — structure MDX de chaque atome |
| Snippets Typst | `.claude/skills/content/references/typst-snippets.md` | Snippets vartable, cetz-plot, cetz | WF3 [3a] — graphiques et tableaux de variation |
| Conventions | `docs/CONTENT-CONVENTIONS.md` | Source de verite syntaxe + structure | WF3 [3a] — reference nommage ; WF4 [4a] — reference validation |
| **--- Validation (WF4) ---** | | | |
| Pipeline | `tools/pipeline/` | Compilation MDX -> HTML/JSON + PDFs | WF4 [4a] — `npm run generate` compilation + validation |
| Validation refs | `tools/pipeline/src/stages/validate.ts` | Integrite molecules -> atomes (integre au pipeline) | WF4 [4a] — verification references croisees |
| **--- Transversal ---** | | | |
| Skill /content | `.claude/skills/content/SKILL.md` | Routeur workflow contenu | WF1 — `/content kb` ; WF2 — `/content plan` ; WF3 — `/content creer` ; WF4 — `/content valider` |

---

## Partie 2 : Workflows

### Vue globale

```mermaid
flowchart TD
    PDF["PDF brut"] -->|"WF0a : indexer"| Fiche[("Fiche source YAML\n_raw/sources/*.yaml")]
    Fiche -->|"WF0b : transcrire\n/transcription"| Typst[("References Typst\n_raw/reference/{prog}/{mod}/*.typ")]
    Typst -->|"WF1 : creer KB\n/content kb"| KB[("_meta/modules/{mod}/\nsavoir + praxeologies\nmisconceptions + lexique")]
    KB -->|"WF1+ : enrichir patterns\n/content patterns"| Patterns[("_meta/modules/{mod}/\npatterns.yaml\n(version N)")]
    Series["Nouvelles series\nBAC, devoirs, parascolaires"] -->|"WF1+"| Patterns
    Patterns -.->|"iteratif\n(N fois)"| Patterns
    KB -->|"WF2 : planifier\n/content plan"| Plan["_planning.yaml x3\n(draft)"]
    Patterns -.->|"Livret 2\n(patterns)"| Plan
    Plan --> Review{"Review\nhumain"}
    Review -->|"ajuste"| Plan
    Review -->|"valide"| PlanV["_planning.yaml\n(validated)"]
    PlanV -->|"WF3 : generer\n/content creer"| Contenu["Atomes MDX\n+ Molecules YAML"]
    Contenu --> PlanG["_planning.yaml\n(generated)"]
    PlanG --> V4a["4a Syntaxe\nnpm run generate"]
    V4a --> V4bc["4b+4c Semantique\n/content valider {module}"]
    V4bc --> Rapport[/"Rapport pass/fail\n_validation.md"/]
    V4bc -->|"Si FAIL"| Plan
```

---

### WF0 -- Indexer & transcrire les sources

Workflow d'alimentation du stock de references. Deux sous-etapes independantes.

```mermaid
flowchart TD
    PDF["PDF brut\n_raw/*.pdf"] --> Index["0a — Indexer\nparcourir le PDF, identifier\nmodules et plages de pages"]
    Index --> Fiche[("Fiche source YAML\n_raw/sources/{slug}.yaml")]
    Fiche --> Demande{"Module\ndemande ?"}
    Demande -->|"oui"| Extract["0b — Extraire pages PNG\npdftoppm -png -r 150"]
    Fiche -.-> Extract
    Extract --> Read["Lire visuellement\npar chunks de 5 pages"]
    Read --> Transcribe["Transcrire en Typst"]
    CONV["Conventions Typst\n(skill /transcription)"] -.-> Transcribe
    Transcribe --> TYPST[("Fichier .typ\n_raw/reference/{prog}/{mod}/")]
    Demande -->|"pas maintenant"| Stock["Stock indexe\n(transcription a la demande)"]
```

Entree : fichier PDF brut
Sortie 0a : `_raw/sources/{slug}.yaml` (fiche d'indexation)
Sortie 0b : `_raw/reference/{programme}/{module}/*.typ` (transcription a la demande)

#### Declencheurs

| Etape | Declencheur | Ressources chargees |
|-------|-------------|---------------------|
| 0a — Indexer un PDF | `/transcription index <pdf>` | PDF brut (table des matieres) |
| 0b — Transcrire un module | `/transcription {module}` | `_raw/sources/*.yaml` (plages de pages), PDFs source |

#### Exemples de prompts

```
/transcription index Parascolaire_Analyse_3eme_sec_Section_Math_ocr.pdf
```

```
/transcription continuite
```

---

### WF1 -- Creer une KB module

Prerequis : les transcriptions .typ du module doivent exister dans `_raw/reference/`. Si elles manquent, retourner au WF0b.

```mermaid
flowchart TD
    TYPST[("References Typst\n_raw/reference/{prog}/{mod}/*.typ")] --> Analyse["Analyser les transcriptions\nmanuel + parascolaire + xyplus"]
    TPL[".claude/skills/content/references/kb-template.md"] -.-> Synth
    REF["docs/referentiels/"] -.-> Synth
    Analyse --> Synth["Synthetiser en KB\naxiomatique, praxeologies, misconceptions"]
    Synth --> Meta[("_meta/modules/{mod}/\nsavoir.yaml\npraxeologies.yaml\nmisconceptions.yaml\nlexique.yaml")]
```

Entree : fichiers .typ existants pour le module
Sortie : `_meta/modules/{module}/` (4 fichiers : savoir.yaml, praxeologies.yaml, misconceptions.yaml, lexique.yaml)

#### Declencheurs

| Etape | Declencheur | Ressources chargees |
|-------|-------------|---------------------|
| Creer la KB | `/content kb {module}` | `.claude/skills/content/references/kb-template.md`, `_raw/reference/{prog}/{mod}/*.typ`, `docs/referentiels/` |

#### Exemples de prompts

```
/content kb continuite
```

```
/content kb fonction-derivee
```

---

### WF1+ -- Enrichir les patterns d'examen (iteratif)

Workflow iteratif qui accumule des patterns d'exercices a partir de series, BAC, parascolaires. Peut etre appele N fois par module. Chaque appel enrichit `patterns.yaml`.

Prerequis : KB module existante (`_meta/modules/{mod}/savoir.yaml` + `praxeologies.yaml`).

```mermaid
flowchart TD
    KB[("_meta/modules/{mod}/\npraxeologies.yaml")] --> Load["Charger praxeologies"]
    PAT[("_meta/modules/{mod}/\npatterns.yaml\n(existant ou vide)")] --> Load
    Source["Exercices\n(Typst, MDX, texte, image)"] --> Analyse["Analyser chaque exercice"]
    Load --> Analyse
    Analyse --> Class{"Variante\nconnue ?"}
    Class -->|"oui"| Incr["Incrementer frequency\najouter source + exemple"]
    Class -->|"non, meme prax"| New["Creer nouveau pattern\nPraxN.vM"]
    Class -->|"prax inconnue"| Alert["Signaler a l'humain"]
    Incr --> Write["Ecrire patterns.yaml\nincrementer version"]
    New --> Write
```

Entree : exercices (Typst, MDX, texte, image) + KB module (_meta/)
Sortie : `_meta/modules/{module}/patterns.yaml` (cree ou enrichi)

#### Declencheurs

| Etape | Declencheur | Ressources chargees |
|-------|-------------|---------------------|
| Enrichir les patterns | `/content patterns {module}` | KB module (_meta/), `patterns.yaml` existant, exercices fournis par l'utilisateur |

#### Exemples de prompts

```
/content patterns nombre-derive
(puis fournir des exercices en contexte : Typst, texte, images...)
```

```
Voici un sujet de BAC 2024, enrichis les patterns du module nombre-derive
```

---

### WF2 -- Planifier un livret

```mermaid
flowchart TD
    KB[("_meta/modules/{mod}/\nsavoir.yaml + praxeologies.yaml")] --> Analyse["2a — Analyser les praxeologies"]
    Analyse --> Gen["2b — Generer _molecules/{slug}/_planning.yaml\natomes par molecule"]
    TPL[".claude/skills/content/references/planning-template.yaml"] -.-> Gen
    Gen --> PlanD[("_planning.yaml per-molecule\nstatus: draft")]
    PlanD --> Review{"2c — Review humain\ncouverture, slugs, difficultes"}
    Review -->|"ajuste"| Gen
    Review -->|"valide"| PlanV[("_planning.yaml per-molecule\nstatus: validated")]
```

Entree : KB module complete (`_meta/modules/{module}/savoir.yaml` + `praxeologies.yaml`)
Sortie : `content/{programme}/{module}/_molecules/{slug}/_planning.yaml` avec `status: validated` (1 fichier par molecule)

> **_meta/ examens** : les plans peuvent aussi referencer les specs d'examen depuis `_meta/examens/{slug}.yaml` pour construire des livrets cross-module ou alignes sur un examen specifique (ex: bac-3eme-t3).

**Cycle de vie du status** : `draft` → `validated` (review humain) → `generated` (apres WF3)

#### Declencheurs

| Etape | Declencheur | Ressources chargees |
|-------|-------------|---------------------|
| Generer le planning | `/content plan {module}` | KB module (`_meta/modules/{mod}/`), `.claude/skills/content/references/planning-template.yaml`, optionnel : `_meta/examens/*.yaml` |
| Review humain | manuel (lecture du YAML) | — |
| Valider le planning | prompt libre | `_planning.yaml` |

#### Exemples de prompts

```
/content plan continuite
```

```
Le planning est bon, passe le status a validated
```

#### Lacunes identifiees

- ~~Workflow nouveau, jamais execute en conditions reelles~~ — resolu (2 plannings executes avec succes)
- Pas de validation automatique du planning (couverture praxeologies, slugs conformes)

---

### WF3 -- Generer le livret a partir du planning

```mermaid
flowchart TD
    PlanV[("_planning.yaml\nstatus: validated")] --> GenAtomes["3a — Generer chaque atome\nle champ contenu = spec"]
    TPL["references/templates.md"] -.-> GenAtomes
    TYPST["references/typst-snippets.md"] -.-> GenAtomes
    CONV["CONTENT-CONVENTIONS.md"] -.-> GenAtomes
    GenAtomes --> Atomes[("Atomes MDX\ncontent/{prog}/{mod}/*.mdx")]
    Atomes --> GenMol["3b — Assembler les livrets\nkind: livret, sections > steps"]
    PlanV -.-> GenMol
    GenMol --> Molecules[("Livrets YAML\n_molecules/{slug}/molecule.yaml")]
    Molecules --> Status["3c — status -> generated"]
```

Chaque molecule generee utilise `kind: livret` avec des sections (pas de distinction cours/serie).

Entree : `_planning.yaml` avec `status: validated`
Sortie : atomes MDX + molecules YAML (`_molecules/{slug}/molecule.yaml`) dans `content/{programme}/{module}/`

#### Declencheurs

| Etape | Declencheur | Ressources chargees |
|-------|-------------|---------------------|
| Generer depuis le planning | `/content creer {module}` | `_planning.yaml`, KB, templates, typst-snippets, conventions |
| Generer une section | `/content creer section {label} {module}` | idem, filtre par section |
| Generer un atome libre | `/content creer {type} {slug}` | templates, conventions |
| Compiler le resultat | `npm run generate` | `tools/pipeline/` |

#### Exemples de prompts

```
/content creer les atomes du module continuite selon le planning
```

```
Genere tous les atomes de la section "Definition et continuite en un point"
du planning continuite
```

#### Lacunes identifiees

- ~~Le skill `/content creer` ne sait pas encore lire `_planning.yaml` comme source~~ — resolu
- Pas d'orchestration multi-atomes — **partiellement resolu** (progression par Glob, reprise possible)
- Le suivi de progression est manuel (pas de fichier de tracking automatique)

---

### WF4 -- Valider le contenu genere

Validation multi-paliers du contenu genere (ou existant) :

```mermaid
flowchart TD
    Atomes[("Atomes MDX\ncontent/**/*.mdx")] --> V4a["4a — Syntaxe\nnpm run generate"]
    CONV["CONTENT-CONVENTIONS.md"] -.-> V4a
    PIPE["tools/pipeline/"] -.-> V4a
    Plan[("_planning.yaml")] -.-> V4a
    V4a --> V4bc["4b+4c — Semantique\n/content valider {module}\nstructure + maths + pedagogie"]
    KB[("KB module")] -.-> V4bc
    Plan -.-> V4bc
    CONV -.-> V4bc
    V4bc --> Rapport[/"Rapport pass/fail\n_molecules/{slug}/_validation.md"/]
```

Le palier 4a (`npm run generate`) execute 6 phases internes :

```mermaid
flowchart LR
    R["1. read\natoms + molecules"] --> V["2. validate\nreferences croisees"]
    V --> C["3. compile\nMDX → HTML/JSON"]
    C --> Res["4. resolve\nlivrets complets"]
    Res --> W["5. write\nsrc/generated/"]
    W --> P["6. generate-pdfs\npublic/pdfs/"]
```

Entree : atomes MDX (generes ou existants)
Sortie : rapport de validation par palier

#### Declencheurs

| Etape | Declencheur | Ressources chargees |
|-------|-------------|---------------------|
| 4a — Pipeline | `npm run generate` | `tools/pipeline/` (read, validate, compile, resolve, write) |
| 4a — References | integre dans `npm run generate` (validate.ts) | Molecules + atomes |
| 4a — Conventions | `/content valider {fichier}` | `docs/CONTENT-CONVENTIONS.md` |
| 4b+4c — Semantique | `/content valider {module}` | `CONTENT-CONVENTIONS.md`, KB, planning, templates |

#### Exemples de prompts

```
npm run generate
```

```
/content valider les atomes du module continuite
```

```
# Futur — palier maths (pas encore implemente)
Verifie les mathematiques de tous les exercices du module continuite :
formules, calculs, solutions
```

#### Lacunes identifiees

- ~~Palier 4b (maths) : aucun outil~~ — resolu (`/content valider {module}`, Grille B)
- ~~Palier 4c (pedagogie) : aucun outil~~ — resolu (`/content valider {module}`, Grille C)
- ~~Pas de rapport structure~~ — resolu (rapport par molecule dans `content/{prog}/{mod}/_molecules/{slug}/_validation.md`)
- Pas de conformite planning -> atomes generes (verifier que tous les slugs du planning existent)

---

## Partie 3 : Etat actuel

> Mis a jour le 2026-03-22 apres migration vers l'architecture _meta/ 3-couches.

| Metrique | Valeur |
|----------|--------|
| Programmes | 3 declares (3eme-math, 1ere-tc, 2nde-math), 1 avec contenu |
| Modules avec contenu | 2 (fonction-derivee, nombre-derive) — modules workflow uniquement |
| Atomes MDX | 38 |
| Livrets YAML | 4 (kind: livret unifie) |
| KB modules | 3 (migres vers `_meta/modules/`) |
| Patterns (patterns.yaml) | 1 (nombre-derive, migre vers `_meta/`) |
| Specs examen | 1 (bac-3eme-t3) |
| Fichiers _meta/ globaux | 3 (lexique, complexite, prerequis-graph) |
| Fiches sources | 8 (tous les PDFs 3eme-math indexes) |
| References Typst | 7 modules transcrits (21 fichiers .typ) |
| Plannings | 4 per-molecule (3 fonction-derivee + 1 nombre-derive) |

> **GenTech v2 + _meta/** : l'architecture 3-couches (`_meta/` modele academique, `content/` atomes+molecules, `_raw/` sources)
> separe le savoir structure du contenu livrable. Voir `docs/CONTENT-SYSTEM-VISION.md` pour la vision complete
> (3 livrets/module, `patterns.yaml` iteratif, workflow WF0->WF1->WF1+->WF2->WF3->WF4).

---

## Partie 4 : Synthese des lacunes

| # | Lacune | Workflows impactes | Priorite |
|---|--------|--------------------|----------|
| ~~L1~~ | ~~Pas de skill dedie pour l'indexation de PDF (WF0a)~~ | ~~WF0~~ | resolue |
| ~~L2~~ | ~~Planning jamais teste en conditions reelles~~ | ~~WF2~~ | resolue (2 plannings executes) |
| ~~L3~~ | ~~`/content creer` ne lit pas `_planning.yaml` comme source~~ | ~~WF3~~ | resolue |
| L4 | Pas d'orchestration multi-atomes (reprise, progression) — partiellement resolu (progression par Glob) | WF3 | moyenne |
| ~~L5~~ | ~~Paliers validation maths + pedagogie inexistants~~ | ~~WF4~~ | resolue (`/content valider {module}`) |
| L6 | Pas de verification automatique planning -> atomes generes | WF4 | basse |
| L7 | ~~Pas de skill WF1+ (enrichissement patterns)~~ — partiellement resolu (patterns template existe, skill `/content patterns` operationnel) | WF1+ | moyenne — template + skill en place |
| L8 | ~~Pas de `_patterns.yaml` existant~~ — partiellement resolu (1 fichier `_meta/modules/nombre-derive/patterns.yaml`, architecture _meta/ en place) | WF1+ | moyenne — structure _meta/ deployee |
