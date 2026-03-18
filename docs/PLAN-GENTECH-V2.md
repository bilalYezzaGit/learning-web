# Plan GenTech v2 — Roadmap detaillee

> Plan d'execution pour transformer le systeme de contenu en systeme agentique complet.
> Chaque phase est autonome et livrable. Les phases sont sequentielles.

**Reference** : `docs/CONTENT-SYSTEM-VISION.md`
**Date** : 2026-03-18
**Module pilote** : `nombre-derive` (15 atomes, 1 molecule, 1 KB, 1 planning)

---

## Phase 0 — Nettoyage et remise a plat

> Objectif : base de code propre, pipeline fonctionnel, zero artefact orphelin.

### 0.1 Regenerer le pipeline

Le `src/generated/` et `public/pdfs/` contiennent encore les artefacts des 4 modules supprimes (continuite, fonctions, derivation, fdu-usuelle).

- [ ] Executer `npm run generate`
- [ ] Verifier que `src/generated/atoms/` ne contient que les 38 atomes restants
- [ ] Verifier que `src/generated/livrets/` ne contient que 4 fichiers
- [ ] Verifier que `public/pdfs/` ne contient que 4 PDFs
- [ ] Verifier que `npm run build` passe sans erreur

### 0.2 Nettoyer les docs obsoletes

Les documents existants referencent des modules supprimes et un modele ancien.

- [ ] `docs/content-agentic-workflow.md` — Mettre a jour la section "Etat actuel" :
  - Remplacer les metriques (222 atomes → 38, 20 livrets → 4, etc.)
  - Supprimer les references aux modules supprimes
  - Ajouter une note : "GenTech v2 — voir `CONTENT-SYSTEM-VISION.md` pour la vision complete"
- [ ] `docs/referentiels/modules/continuite-3eme-maths.md` — Supprimer (module archive)
- [ ] Verifier que `docs/referentiels/redaction-mathematiques-tunisie.md` est toujours pertinent (conventions tunisiennes generales → garder si oui)

### 0.3 Commit de nettoyage

- [ ] Commiter les suppressions de modules + regeneration pipeline
- [ ] Message : "chore: clean ad-hoc content modules, keep workflow-created only"

---

## Phase 1 — Aligner la documentation sur la vision v2

> Objectif : tous les documents et skills refletent le modele GenTech v2.

### 1.1 Mettre a jour CONTENT-CONVENTIONS.md

C'est la source de verite pour le format du contenu. Ajouts :

- [ ] Section `_patterns.yaml` — Nouveau : format, regles, emplacement (`content/{prog}/{mod}/_patterns.yaml`)
- [ ] Clarifier dans la section arborescence que `_patterns.yaml` est par module (pas par molecule)
- [ ] Ajouter le champ optionnel `pattern: Prax3.v1` dans le frontmatter des atomes (exercices du Livret 2)
- [ ] Ajouter le champ optionnel `pattern:` dans le template du planning
- [ ] Mettre a jour la section "Fichiers invisibles au pipeline" avec `_patterns.yaml`

### 1.2 Mettre a jour content-agentic-workflow.md

C'est la documentation du workflow. Refonte majeure :

- [ ] Ajouter **WF1+** (Enrichissement des patterns) comme nouveau workflow entre WF1 et WF2
  - Input : exercices (PDF/photo/serie/BAC) + KB existante + _patterns.yaml existant
  - Output : `_patterns.yaml` cree ou enrichi
  - Processus : classifier → matcher praxeologie → nouvelle variante ou existante → incrementer
  - Iteratif : peut etre appele N fois
- [ ] Modifier **WF2** pour integrer les patterns :
  - Le planning du Livret 2 reference des pattern IDs (`pattern: Prax3.v1`)
  - Expliquer la strategie de planning par type de livret (Cours vs Examen vs Exploration)
- [ ] Ajouter le schema des **3 livrets par module** :
  - Livret 1 (Cours) : KB → planning → atomes difficulte 0-1
  - Livret 2 (Examen) : Patterns → planning → atomes difficulte 1-2
  - Livret 3 (Exploration) : KB creatif → planning → atomes difficulte 2-3
- [ ] Mettre a jour le diagramme mermaid du workflow global
- [ ] Mettre a jour les metriques "Etat actuel"

### 1.3 Mettre a jour le planning template

Fichier : `.claude/skills/content/references/planning-template.yaml`

- [ ] Ajouter le champ optionnel `pattern:` sur les atomes :
  ```yaml
  - slug: ex-der-tvi-direct
    type: exercise
    pattern: Prax3.v1        # optionnel, reference _patterns.yaml
    contenu: >-
      Instancier le pattern TVI direct avec f(x) = ...
  ```
- [ ] Ajouter un commentaire expliquant quand utiliser `pattern:` (Livret 2 principalement)
- [ ] Ajouter `design_intent:` au niveau racine (deja dans certains plannings, formaliser)

---

## Phase 2 — Creer le systeme de patterns

> Objectif : le concept _patterns.yaml est operationnel avec template + skill + action.

### 2.1 Creer le template de reference

Fichier : `.claude/skills/content/references/patterns-template.yaml`

- [ ] Definir le schema complet :
  ```yaml
  module: "{slug}"
  programme: "{slug}"
  version: 1

  patterns:
    - id: Prax1.v1
      praxeology: Prax1
      name: "Nom court de la variante"
      description: >-
        Description de ce que l'eleve doit faire.
      method:
        - "Etape 1"
        - "Etape 2"
      variables:
        function: ["x²+1", "ln(x)+x"]
        interval: ["[0,1]", "[1,2]"]
      difficulty: 1
      frequency: 0
      sources: []
      examples: []
  ```
- [ ] Documenter les regles :
  - 1 fichier par module
  - IDs : `{Praxeologie}.v{numero}` (ex: Prax3.v1, Prax3.v2)
  - `frequency` = nombre d'occurrences observees dans les sources
  - `examples` = exercices reels (pas inventes), avec source
  - `variables` = ce qui change d'un exercice a l'autre
  - `version` incremente a chaque enrichissement

### 2.2 Creer l'action WF1+ (enrich-patterns)

Fichier : `.claude/skills/content/actions/enrich-patterns.md`

- [ ] Definir le workflow :
  1. Charger la KB du module (verifier qu'elle existe)
  2. Charger `_patterns.yaml` existant (ou creer vide si premier appel)
  3. Lire les exercices fournis (source variable : Typst, MDX, texte, image)
  4. Pour chaque exercice :
     - Identifier la/les praxeologie(s) (reference KB section 8)
     - Comparer avec les patterns existants
     - Si variante connue → incrementer frequency + ajouter source
     - Si nouvelle variante → creer nouveau pattern
     - Si praxeologie inconnue → signaler (ne pas modifier la KB)
  5. Ecrire `_patterns.yaml` mis a jour
  6. Incrementer `version`
  7. Afficher un resume : N exercices analyses, M nouveaux patterns, K variantes enrichies
- [ ] Gerer les differents types d'input :
  - Transcriptions Typst (`_raw/reference/*.typ`) — lecture directe
  - Fichiers MDX existants — parse le contenu
  - Texte libre / description — analyse directe
  - Pages PNG — lecture visuelle (meme approche que WF0)
- [ ] Definir les gardes :
  - KB obligatoire (pas de patterns sans KB)
  - Ne jamais modifier la KB automatiquement
  - Signaler si un exercice ne correspond a aucune praxeologie connue

### 2.3 Mettre a jour le SKILL.md du content

Fichier : `.claude/skills/content/SKILL.md`

- [ ] Ajouter la route `/content patterns {module}` :
  - Trigger : patterns, enrichir, feeder, exercices types, examen
  - Action : `enrich-patterns.md`
  - Pre-requis : KB existante (`_kb.md`)
- [ ] Mettre a jour la section "Quick reference" avec `_patterns.yaml`
- [ ] Ajouter le workflow WF1+ dans la description du planning (contexte)

---

## Phase 3 — Piloter sur nombre-derive

> Objectif : valider le workflow complet WF0→WF1→WF1+→WF2×3→WF3×3→WF4 sur un module reel.

### 3.1 Etat actuel de nombre-derive

Ce qui existe deja :
- [x] WF0 : Transcriptions Typst (`_raw/reference/3eme-math/nombre-derive/`)
- [x] WF1 : KB (`content/3eme-math/nombre-derive/_kb.md`)
- [x] WF2 : 1 planning (`serie-derivabilite-point/_planning.yaml`, status: validated)
- [x] WF3 : 15 atomes + 1 molecule
- [ ] WF4 : Pas de validation

Ce qui manque :
- [ ] WF1+ : `_patterns.yaml` (n'existe pas encore)
- [ ] WF2 : Plannings pour les 2 autres livrets (Examen + Exploration)
- [ ] WF3 : Atomes et molecules pour les 2 autres livrets
- [ ] WF4 : Validation de tous les livrets

### 3.2 WF1+ — Creer _patterns.yaml pour nombre-derive

- [ ] Charger la KB (`nombre-derive/_kb.md`) — identifier les 13 praxeologies
- [ ] Feeder les transcriptions Typst existantes :
  - `_raw/reference/3eme-math/nombre-derive/manuel.typ`
  - `_raw/reference/3eme-math/nombre-derive/parascolaire.typ`
  - `_raw/reference/3eme-math/nombre-derive/xyplus.typ`
- [ ] Classifier chaque exercice des transcriptions contre les 13 praxeologies
- [ ] Extraire les variantes d'examen avec methode, variables, exemples
- [ ] Ecrire `content/3eme-math/nombre-derive/_patterns.yaml` (version 1)
- [ ] Valider : chaque praxeologie a au moins 1 variante ?

### 3.3 Evaluer le livret existant

Le module a deja 1 livret (`serie-derivabilite-point`). Determiner :

- [ ] Ce livret correspond a quel type ? (Cours ? Serie ? Autre ?)
- [ ] Faut-il le garder tel quel, l'adapter, ou le regenerer ?
- [ ] Les 15 atomes existants sont-ils reutilisables dans les 3 nouveaux livrets ?

Decision attendue : soit on garde le livret existant comme Livret 1 (ou Livret 2) et on genere les manquants, soit on regenere les 3 depuis zero.

### 3.4 WF2 — Planifier les 3 livrets

- [ ] **Livret 1 (Cours)** : Planning base sur la KB
  - Structure : lesson → ex direct → lesson → ... → quiz
  - Difficulte 0-1
  - Couvrir toutes les notions de la carte (KB section 4)
  - Slug : `nombre-derive-cours`

- [ ] **Livret 2 (Examen)** : Planning base sur les patterns
  - Structure : fiche synthese → exercices types par frequence → sujet complet
  - Difficulte 1-2
  - Chaque exercice reference un pattern ID
  - Slug : `nombre-derive-examen`

- [ ] **Livret 3 (Exploration)** : Planning base sur la KB, creatif
  - Structure : problemes ouverts, modelisations, demonstrations
  - Difficulte 2-3
  - Slug : `nombre-derive-exploration`

- [ ] Revue humaine des 3 plannings → status : `validated`

### 3.5 WF3 — Generer les atomes et molecules

- [ ] Generer les atomes du Livret 1 (cours)
- [ ] Generer les atomes du Livret 2 (examen)
- [ ] Generer les atomes du Livret 3 (exploration)
- [ ] Assembler les 3 molecules YAML
- [ ] Mettre a jour les plannings : status → `generated`

### 3.6 WF4 — Valider

- [ ] `npm run generate` — validation syntaxique (pipeline)
- [ ] `/content valider nombre-derive` — validation semantique (grilles A/B/C)
- [ ] Corriger les FAIL et WARN
- [ ] Verification des PDFs generes (3 livrets)

### 3.7 Retrospective pilote

- [ ] Documenter ce qui a bien marche / mal marche
- [ ] Ajuster la vision si necessaire (`CONTENT-SYSTEM-VISION.md`)
- [ ] Ajuster les templates/skills si necessaire
- [ ] Estimer le temps pour un module complet

---

## Phase 4 — Durcir le pipeline

> Objectif : corriger les bugs critiques identifies dans l'audit.

### 4.1 Bugs P0 (bloquants)

- [ ] **compile-all.ts** — NaN concurrency : valider `parseInt()` resultat, throw si invalide
- [ ] **read-atoms.ts** — Duplicates silencieux : verifier unicite des IDs d'atomes entre modules, throw si doublon
- [ ] **generate-pdfs.ts** — Echecs silencieux : retourner `{ success, failed }`, logger les erreurs, echouer si > 0 failed

### 4.2 Bugs P1 (importants)

- [ ] **generate-pdfs.ts** — Passer `RawLivret` directement au lieu de reconstruire depuis `ResolvedActivity`
- [ ] **write-output.ts** — Ecriture atomique : utiliser un dossier temporaire, renommer a la fin
- [ ] **compile-typst.ts** — Remplacer `curl` subprocess par `fetch` natif Node
- [ ] **mdx-to-typst.ts** — Documenter l'ordre des regex, ajouter commentaires sur les cas limites

### 4.3 Bugs P2 (ameliorations)

- [ ] **qr-generator.ts** — Passer error correction de 'L' a 'H' (meilleure resistance au pliage)
- [ ] **config.ts** — Centraliser toutes les constantes (PDFS_DIR, QR_BASE_URL, concurrency, etc.)
- [ ] **generate-pdfs.ts** — Dedupliquer la logique booklet code (une seule source de verite avec `src/types/booklet.ts`)
- [ ] **compile-mdx.ts** — Extraire les SVG icons dans des fichiers separees

### 4.4 Tests d'integration

- [ ] Creer `tools/pipeline/tests/integration.test.ts`
- [ ] Test : build complet sur les 2 modules existants
- [ ] Assertions : manifest.json existe, bon nombre d'atomes/livrets, PDFs non-vides
- [ ] Ajouter `npm run test:pipeline` dans package.json
- [ ] Runner dans CI (optionnel, apres stabilisation)

---

## Phase 5 — Deployer le module suivant

> Objectif : valider que le workflow scale au-dela du pilote.

### 5.1 Choisir le module

Le prochain module devrait etre un module **dont les transcriptions existent deja** dans `_raw/reference/`. Candidats :

| Module | Transcriptions | Complexite | Recommandation |
|--------|---------------|------------|----------------|
| continuite | 3 fichiers .typ | Elevee (gros module) | 2eme ou 3eme |
| generalites-fonctions | 3 fichiers .typ | Moyenne | **Bon candidat** |
| derivation | Possible via nombre-derive + fonction-derivee | Moyenne | Possible |
| limites-continuite | 3 fichiers .typ | Elevee | Plus tard |
| limites-comportements-asymptotiques | 3 fichiers .typ | Elevee | Plus tard |
| exemples-etude-fonctions | 3 fichiers .typ | Moyenne | Possible |

### 5.2 Workflow complet

- [ ] WF1 : Creer KB (si pas existante)
- [ ] WF1+ : Feeder les transcriptions → `_patterns.yaml`
- [ ] WF1+ : Feeder des sources supplementaires (BAC, series) si disponibles
- [ ] WF2 : Planifier les 3 livrets
- [ ] WF3 : Generer
- [ ] WF4 : Valider
- [ ] Retro : comparer avec le pilote, affiner

### 5.3 Iterer

- [ ] Appliquer les corrections issues de la retro
- [ ] Mettre a jour les templates/skills si necessaire
- [ ] Documenter les patterns recurrents dans les skills

---

## Phase 6 — Optimisation et scaling

> Objectif : preparer le systeme pour produire tous les modules de 3eme-math.

### 6.1 Metriques de couverture

- [ ] Creer une commande `/content stats` ou un script qui affiche :
  - Par module : nombre de praxeologies couvertes vs totales (depuis KB)
  - Par module : nombre de patterns vs praxeologies (depuis _patterns.yaml)
  - Par livret : nombre d'atomes, repartition par type et difficulte
  - Global : modules completes / en cours / a faire

### 6.2 Enrichissement continu des patterns

- [ ] Identifier des sources supplementaires (BAC, devoirs, sites educatifs tunisiens)
- [ ] Pour chaque source : `/content patterns {module}` → enrichir `_patterns.yaml`
- [ ] Objectif : chaque praxeologie a au moins 3 variantes avant de generer le Livret 2

### 6.3 Qualite des PDFs

- [ ] Revoir le template Typst (`livret-template.ts`) :
  - Couverture plus soignee
  - Mise en page exercices (espacement, QR positionnement)
  - Header/footer ajustes par type de livret
- [ ] Tester l'impression reelle (A4, recto-verso)
- [ ] Tester le scan QR sur papier imprime

### 6.4 Documentation finale

- [ ] Mettre a jour `CONTENT-SYSTEM-VISION.md` avec les retours d'experience
- [ ] Mettre a jour `CLAUDE.md` si les commandes/conventions ont change
- [ ] Ecrire un guide "Comment ajouter un nouveau module de A a Z"

---

## Resume des livrables par phase

| Phase | Livrable | Effort estime |
|-------|----------|---------------|
| **0** | Pipeline propre, zero artefact orphelin | Petit |
| **1** | Documentation alignee sur la vision v2 | Moyen |
| **2** | Systeme de patterns operationnel (template + skill + action) | Moyen |
| **3** | Module nombre-derive complet (3 livrets, validates, PDFs) | **Grand** |
| **4** | Pipeline durci (bugs fixes, tests d'integration) | Moyen |
| **5** | 2eme module complet | Grand |
| **6** | Systeme pret pour produire tous les modules | Moyen |

---

## Criteres de succes

Le systeme GenTech v2 est "complet" quand :

1. **Un nouveau module peut etre produit de A a Z** en suivant le workflow WF0→WF1→WF1+→WF2→WF3→WF4 sans sortir des skills
2. **Les 3 livrets sont generes systematiquement** (Cours, Examen, Exploration)
3. **Le Livret 2 (Examen) est fidele aux patterns reels** grace a `_patterns.yaml` enrichi
4. **Le pipeline compile sans erreur** et produit HTML + JSON + PDF pour tous les modules
5. **La validation (WF4) detecte les problemes** avant publication
6. **Les metriques de couverture** montrent que chaque praxeologie est couverte par au moins 1 exercice dans chaque livret
