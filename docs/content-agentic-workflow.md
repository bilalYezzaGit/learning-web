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
| **--- Knowledge Base (WF1) ---** | | | |
| Referentiels | `docs/referentiels/` | Conventions redaction maths tunisiennes | WF1 — reference KB ; WF3 [3a] — reference generation |
| KB template | `meta_system/kb/template.md` | Modele pour creer une KB module | WF1 — template de creation |
| KB modules | `meta_system/kb/{nn}-{slug}.md` | Savoir structure par module (1 existant) | WF1 — sortie ; WF2 [2a] — entree analyse praxeologies |
| **--- Planning (WF2) ---** | | | |
| Planning template | `meta_system/planning/template.yaml` | Schema du manifeste de livret | WF2 [2b] — template de creation |
| Planning modules | `content/{prog}/{mod}/_planning.yaml` | Manifeste par module (avant generation) | WF2 — sortie ; WF3 [3a] — spec de generation ; WF4 [4a] — verification couverture |
| **--- Generation (WF3) ---** | | | |
| Templates atomes | `.claude/skills/content/references/templates.md` | Templates copier-coller par type | WF3 [3a] — structure MDX de chaque atome |
| Snippets Typst | `.claude/skills/content/references/typst-snippets.md` | Snippets vartable, cetz-plot, cetz | WF3 [3a] — graphiques et tableaux de variation |
| Conventions | `docs/CONTENT-CONVENTIONS.md` | Source de verite syntaxe + structure | WF3 [3a] — reference nommage ; WF4 [4a] — reference validation |
| **--- Validation (WF4) ---** | | | |
| Pipeline | `tools/pipeline/` | Compilation MDX -> HTML/JSON + PDFs | WF4 [4a] — `npm run generate` compilation + validation |
| Validation refs | `scripts/validate-content.mjs` | Integrite molecules -> atomes | WF4 [4a] — verification references croisees |
| **--- Transversal ---** | | | |
| Skill /content | `.claude/skills/content/SKILL.md` | Routeur workflow contenu | WF1 — `/content kb` ; WF2 — `/content plan` ; WF3 — `/content creer` ; WF4 — `/content valider` |

---

## Partie 2 : Workflows

### Vue globale

```mermaid
flowchart TD
    PDF["PDF brut"] -->|"WF0a : indexer"| Fiche[("Fiche source YAML\n_raw/sources/*.yaml")]
    Fiche -->|"WF0b : transcrire\n/transcription"| Typst[("References Typst\n_raw/reference/{prog}/{mod}/*.typ")]
    Typst -->|"WF1 : creer KB\n/content kb"| KB[("KB module\nmeta_system/kb/*.md")]
    KB -->|"WF2 : planifier\n/content plan"| Plan["_planning.yaml\n(draft)"]
    Plan --> Review{"Review\nhumain"}
    Review -->|"ajuste"| Plan
    Review -->|"valide"| PlanV["_planning.yaml\n(validated)"]
    PlanV -->|"WF3 : generer\n/content creer"| Contenu["Atomes MDX\n+ Molecules YAML"]
    Contenu --> V4a["4a Syntaxe\nnpm run generate"]
    V4a --> V4b["4b Maths\nagent LLM"]
    V4b --> V4c["4c Pedagogie\nagent LLM"]
    V4c --> Rapport[/"Rapport pass/fail"/]
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
    TPL["meta_system/kb/template.md"] -.-> Synth
    REF["docs/referentiels/"] -.-> Synth
    Analyse --> Synth["Synthetiser en KB\naxiomatique, praxeologies, misconceptions"]
    Synth --> KB[("KB module\nmeta_system/kb/{nn}-{slug}.md")]
```

Entree : fichiers .typ existants pour le module
Sortie : `meta_system/kb/{nn}-{slug}.md`

#### Declencheurs

| Etape | Declencheur | Ressources chargees |
|-------|-------------|---------------------|
| Creer la KB | `/content kb {module}` | `meta_system/kb/template.md`, `_raw/reference/{prog}/{mod}/*.typ`, `docs/referentiels/` |

#### Exemples de prompts

```
/content kb continuite
```

```
/content kb fonction-derivee
```

---

### WF2 -- Planifier un livret

```mermaid
flowchart TD
    KB[("KB module\nmeta_system/kb/*.md")] --> Analyse["2a — Analyser les praxeologies\nsection 8 de la KB"]
    Analyse --> Gen["2b — Generer _planning.yaml\nmolecules, atomes, praxeologies"]
    TPL["meta_system/planning/template.yaml"] -.-> Gen
    Gen --> PlanD[("_planning.yaml\nstatus: draft")]
    PlanD --> Review{"2c — Review humain\ncouverture, slugs, difficultes"}
    Review -->|"ajuste"| Gen
    Review -->|"valide"| PlanV[("_planning.yaml\nstatus: validated")]
```

Entree : KB module complete (`meta_system/kb/{nn}-{slug}.md`)
Sortie : `content/{programme}/{module}/_planning.yaml` avec `status: validated`

#### Declencheurs

| Etape | Declencheur | Ressources chargees |
|-------|-------------|---------------------|
| Generer le planning | `/content plan {module}` | KB module, `meta_system/planning/template.yaml` |
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
    GenMol --> Molecules[("Livrets YAML\n_molecules/*.yaml")]
    Molecules --> Status["3c — status -> generated"]
```

Chaque molecule generee utilise `kind: livret` avec des sections (pas de distinction cours/serie).

Entree : `_planning.yaml` avec `status: validated`
Sortie : atomes MDX + molecules YAML (`kind: livret`) dans `content/{programme}/{module}/`

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
    Atomes[("Atomes MDX\ncontent/**/*.mdx")] --> V4a["4a — Syntaxe\nnpm run generate\n+ validate-content.mjs"]
    CONV["CONTENT-CONVENTIONS.md"] -.-> V4a
    PIPE["tools/pipeline/"] -.-> V4a
    Plan[("_planning.yaml")] -.-> V4a
    V4a --> V4b["4b — Mathematiques\nagent LLM\nformules, calculs, solutions"]
    V4b --> V4c["4c — Pedagogie\nagent LLM\nalignement KB + planning"]
    KB[("KB module")] -.-> V4c
    Plan -.-> V4c
    V4c --> Rapport[/"Rapport pass/fail\npar palier"/]
```

Entree : atomes MDX (generes ou existants)
Sortie : rapport de validation par palier

#### Declencheurs

| Etape | Declencheur | Ressources chargees |
|-------|-------------|---------------------|
| 4a — Pipeline | `npm run generate` | `tools/pipeline/` (read, validate, compile, resolve, write) |
| 4a — References | `node scripts/validate-content.mjs` | Molecules + atomes |
| 4a — Conventions | `/content valider {module}` | `docs/CONTENT-CONVENTIONS.md` |
| 4b — Maths | **inexistant** | — |
| 4c — Pedagogie | **inexistant** | — |

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

- Palier 4b (maths) : aucun outil — necessite un agent LLM avec checklist dediee
- Palier 4c (pedagogie) : aucun outil — necessite un agent LLM avec acces a la KB et au planning
- Pas de rapport structure (les erreurs sont dans le stdout de npm run generate, pas dans un fichier exploitable)
- Pas de conformite planning -> atomes generes (verifier que tous les slugs du planning existent)

---

## Partie 3 : Etat actuel

| Metrique | Valeur |
|----------|--------|
| Programmes | 3 declares (3eme-math, 1ere-tc, 2nde-math), 1 avec contenu |
| Modules avec contenu | 5 (continuite, derivation, fonctions, fonction-derivee, fonction-derivee-usuelle) |
| Atomes MDX | 222 |
| Livrets YAML | 20 (kind: livret unifie, plus de distinction cours/serie) |
| KB modules | 2 (generalites-fonctions, fonction-derivee) |
| Fiches sources | 8 (tous les PDFs 3eme-math indexes) |
| References Typst | 7 modules transcrits (21 fichiers .typ) |
| Plannings | 2 (fonction-derivee, fonction-derivee-usuelle) |

---

## Partie 4 : Synthese des lacunes

| # | Lacune | Workflows impactes | Priorite |
|---|--------|--------------------|----------|
| ~~L1~~ | ~~Pas de skill dedie pour l'indexation de PDF (WF0a)~~ | ~~WF0~~ | resolue |
| ~~L2~~ | ~~Planning jamais teste en conditions reelles~~ | ~~WF2~~ | resolue (2 plannings executes) |
| ~~L3~~ | ~~`/content creer` ne lit pas `_planning.yaml` comme source~~ | ~~WF3~~ | resolue |
| L4 | Pas d'orchestration multi-atomes (reprise, progression) — partiellement resolu (progression par Glob) | WF3 | moyenne |
| L5 | Paliers validation maths + pedagogie inexistants | WF4 | moyenne |
| L6 | Pas de verification automatique planning -> atomes generes | WF4 | basse |
