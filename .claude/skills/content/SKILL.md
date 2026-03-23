---
name: content
description: Manage pedagogical content (MDX atoms and YAML molecules). Use when creating, editing, validating, or listing content in content/{programme}/{module}/. Triggers on keywords: ajouter, creer, modifier, editer, corriger, valider, verifier, lister, inventaire, contenu, atome, molecule, cours, exercice, qcm, serie, lecon, module, planifier, planning, plan, kb, knowledge base, base de connaissances.
argument-hint: "[action] [details] : [custom_detail]"
---

# Content Management

Skill de gestion du contenu pedagogique : atomes MDX (`content/{programme}/{module}/`) et molecules YAML (`content/{programme}/{module}/_molecules/`).

## Routing

Determine l'action a partir de `$ARGUMENTS` ou du contexte utilisateur :

| Intent | Workflow | Quand |
|--------|----------|-------|
| **Creer** | [Creation](#creation-workflow) | ajouter, creer, nouveau, ecrire un atome/molecule |
| **Editer** | [Edition](#edition-workflow) | modifier, corriger, editer, renommer |
| **Valider** | [Validation](#validation-workflow) | valider, verifier, checker, audit |
| **Planifier** | [Planning](#planning-workflow) | planifier, planning, plan livret |
| **KB** | [Knowledge Base](#kb-workflow) | kb, knowledge base, creer KB, base de connaissances |
| **Patterns** | [Patterns](#patterns-workflow) | patterns, enrichir, feeder, exercices types, examen, variantes |
| **Lister** | [Listing](#listing-workflow) | lister, inventaire, combien, quels atomes |

---

## Planning workflow

Genere un planning de livret a partir d'une KB module. Le planning declare tous les atomes et molecules AVANT generation.

### Pre-requis

- Meta module existante (`_meta/{programme}/{module}/` avec savoir.yaml, praxeologies.yaml)
- Si pas de meta : creer d'abord la KB (`/content kb {module}`)

### Syntaxe

```
/content plan {module} : {profil}
/content plan {module} : {profil}, {specs libres}
```

Le premier mot apres `:` est matche contre les profils de `_meta/booklet-profiles.yaml` :
- **`cours`** — difficulte 0-1, application directe, ~16 atomes, guidance elevee
- **`examen`** — difficulte 1-2, combinaison de techniques, ~17 atomes, exercices types
- **`exploration`** — difficulte 2-3, problemes de synthese, ~10 atomes, guidance faible

Les specs libres apres le profil overrident les valeurs du profil.

Si aucun profil reconnu : traiter comme specs libres (comportement par defaut, couverture complete).

Exemples :
- `/content plan continuite : cours` — livret cours standard
- `/content plan continuite : examen` — livret examen standard
- `/content plan continuite : exploration` — livret exploration standard
- `/content plan continuite : cours, focus TVI et dichotomie` — cours avec override
- `/content plan continuite : examen, seulement Prax1-5` — examen filtre

### Etapes

0. **Charger le profil de livret** :
   - Read `_meta/booklet-profiles.yaml`
   - Matcher le premier mot apres `:` (cours, examen, exploration)
   - Extraire : difficulty range, structure (exercise_count, lesson_count, qcm_count), exercise_categories (required/forbidden), contexts (allowed/forbidden), progression, guidance_level, expected_order
   - Si specs libres supplementaires : elles overrident les valeurs du profil
   - Ecrire le champ `profile:` dans le planning genere

1. **Charge la meta module** : Read `_meta/{programme}/{module}/savoir.yaml` + `_meta/{programme}/{module}/praxeologies.yaml`

2. **Charge le template planning** : Read `.claude/skills/content/references/planning-template.yaml`

3. **Analyse les praxeologies** de `_meta/{programme}/{module}/praxeologies.yaml` :
   - Lister toutes les praxeologies avec leur difficulte
   - Identifier les groupements thematiques naturels

4. **Genere un planning per-molecule** `content/{programme}/{module}/_molecules/{slug}/_planning.yaml` :
   - Un fichier par molecule (pas de wrapper `molecules:` ni `praxeologies:`)
   - **Respecter les contraintes du profil** : exercise_count, lesson_count, qcm_count, difficulty range, exercise_categories (required/forbidden), contexts (allowed/forbidden), expected_order
   - Pour chaque section : declarer les atomes (lecons, exercices, QCM)
   - Pour chaque atome : slug, type, title, praxeologies, contenu (2-3 phrases), difficulte, timeMinutes

5. **Verifie la conformite au profil** :
   - Nombre d'atomes dans les fourchettes du profil (exercise_count, lesson_count, qcm_count)
   - Toutes les difficultes dans le range du profil (ex: cours = 0-1, pas de niveau 2)
   - Categories d'exercices conformes (required presentes, forbidden absentes)
   - Contextes conformes (pas de contexte forbidden dans les enonces)
   - Progression conforme (expected_order respecte)
   - Chaque praxeologie de la KB est couverte par au moins 1 atome

6. **Redige les objectifs** pour chaque molecule :
   - Minimum 3 objectifs d'apprentissage clairs et mesurables
   - Formuler en "Verbe d'action + objet" (ex: "Calculer le cardinal d'une union")
   - Les objectifs sont inclus dans le champ `objectives:` du planning

7. **Ecrit le(s) fichier(s)** `_planning.yaml` avec `status: draft`
   - Les plannings referencent `_meta/` via le champ `meta_refs` (interface definie dans `_meta/_interface.yaml`)

8. **Presente le planning a l'humain** pour validation :
   - Resume : nombre de molecules, nombre d'atomes par type, praxeologies couvertes
   - Demander validation ou ajustements

9. **Apres validation humaine** : mettre `status: validated`

### Checklist planning

**Conformite au profil** (si profil charge) :
- [ ] `profile:` field present dans le planning
- [ ] Nombre d'exercices dans la fourchette du profil (exercise_count)
- [ ] Nombre de lecons dans la fourchette du profil (lesson_count)
- [ ] Nombre de QCM dans la fourchette du profil (qcm_count)
- [ ] Toutes les difficultes dans le range du profil (ex: cours = max 1)
- [ ] Categories required presentes, categories forbidden absentes
- [ ] Aucun contexte forbidden dans les enonces

**Qualite du planning** :
- [ ] Toutes les praxeologies de la KB sont couvertes
- [ ] Slugs conformes au nommage (`{type}-{topic}-{slug}`)
- [ ] Topics du vocabulaire controle
- [ ] Chaque atome a un champ `contenu` de 2-3 phrases
- [ ] Categories presentes pour tous les exercices
- [ ] QCM regroupables en blocs de 2-5 par theme
- [ ] Chaque molecule a >= 3 objectifs d'apprentissage clairs et mesurables
- [ ] Les tableaux utilisent des blocs typst `#table()`, jamais du Markdown

---

## KB workflow

Cree une Knowledge Base module a partir des transcriptions Typst.

Prerequis : transcriptions .typ dans `_raw/reference/{programme}/{module}/`.
Si absentes : utiliser `/transcription {module}` d'abord.

Voir [actions/create-kb.md](actions/create-kb.md) pour le pipeline complet.

---

## Patterns workflow

Enrichit le fichier `patterns.yaml` d'un module a partir de series d'exercices (WF1+).

Voir [actions/enrich-patterns.md](actions/enrich-patterns.md) pour le pipeline complet.

### Pre-requis

- Meta module existante (`_meta/{programme}/{module}/` avec savoir.yaml, praxeologies.yaml)
- Si pas de meta : creer d'abord la KB (`/content kb {module}`)

### Syntaxe

```
/content patterns {module}
```

L'utilisateur fournit des exercices en contexte (transcriptions Typst, texte, images, PDFs).

### Etapes

1. **Charge la meta module** : lire `_meta/{programme}/{module}/savoir.yaml` + `_meta/{programme}/{module}/praxeologies.yaml`

2. **Charge `_meta/{programme}/{module}/patterns.yaml` existant** (ou creer la structure vide si premier appel)

3. **Charge le template patterns** : Read `.claude/skills/content/references/patterns-template.yaml`

4. **Analyse chaque exercice fourni** :
   - Identifier la/les praxeologie(s) mobilisees (reference KB)
   - Extraire : type de tache, technique, variables qui changent
   - Comparer avec les patterns existants dans `_meta/{programme}/{module}/patterns.yaml`

5. **Classifier** :
   - Si **variante connue** → incrementer `frequency`, ajouter source, optionnellement ajouter un exemple
   - Si **nouvelle variante** → creer un nouveau pattern avec ID `PraxN.vM`
   - Si **praxeologie inconnue** (pas dans la KB) → **signaler a l'humain**, ne pas modifier la KB

6. **Ecrire** `_meta/{programme}/{module}/patterns.yaml` mis a jour, incrementer `version`

7. **Afficher un resume** : N exercices analyses, M nouveaux patterns, K variantes enrichies, J non classifies

### Regles

- 1 fichier `_meta/{programme}/{module}/patterns.yaml` par module (pas par molecule)
- Ne jamais modifier la KB automatiquement
- Les `examples` sont des exercices reels (pas inventes), avec source
- `frequency` est incremente a chaque observation dans une nouvelle source
- IDs de patterns : `{Praxeologie}.v{numero}` (ex: `Prax3.v1`)

---

## Creation workflow

### Etape 0 — Detecter un planning

Avant toute creation, verifier si un planning valide existe pour le module cible :

```
Glob: content/{programme}/{module}/_molecules/*/_planning.yaml
```

- **Si planning(s) avec `status: validated`** : utiliser le pipeline planning.
  Voir [actions/create-from-planning.md](actions/create-from-planning.md).
- **Si planning(s) avec `status: draft`** : informer que le planning doit etre valide d'abord.
- **Si pas de planning** : continuer avec le workflow generique ci-dessous.

### Workflow generique (sans planning)

1. **Determine le type** a creer :
   - Atome : `lesson`, `exercise`, `qcm`
   - Molecule : `livret`

2. **Charge le template** : Read [references/templates.md](references/templates.md) pour le template correspondant

3. **Si doute sur les regles** : Read `docs/CONTENT-CONVENTIONS.md` (source de verite)

4. **Genere le contenu** en suivant les regles :
   - ID conforme au nommage (`{type}-{topic}-{slug}.mdx`)
   - Topic du vocabulaire controle (voir Quick Reference ci-dessous)
   - Frontmatter complet
   - Structure MDX correcte pour le type

5. **Valide** avec la checklist rapide (ci-dessous)

6. **Ecrit le fichier** dans le bon dossier

---

## Edition workflow

1. **Lis le fichier cible** avec Read

2. **Applique les modifications** demandees

3. **Valide** avec la checklist rapide

4. **Si renommage d'ID** : chercher les molecules qui referencent cet ID et les mettre a jour
   ```
   Grep pattern: ancien-id dans content/**/_molecules/*/molecule.yaml
   ```

5. **Ecrit le fichier** modifie

---

## Validation workflow

### Etape 0 — Routage

Deux modes selon l'argument :

- **`/content valider {module}`** (nom de module) → validation LLM semantique complete.
  Delegue a [actions/validate-module.md](actions/validate-module.md).
  Analyse chaque atome du module selon 3 grilles (Structure, Maths, Pedagogie) et ecrit un rapport par molecule dans `content/{prog}/{mod}/_molecules/{slug}/_validation.md`.

- **`/content valider {fichier}`** (chemin ou ID d'un fichier unique) → validation rapide avec checklist inline ci-dessous.

### Validation rapide (fichier unique)

1. **Charge les regles completes** : Read `docs/CONTENT-CONVENTIONS.md` (source de verite)

2. **Lis le(s) fichier(s)** a valider

3. **Execute la checklist complete** :

#### Checklist atome

- [ ] ID suit `{type}-{topic}-{slug}` avec topic du vocabulaire controle
- [ ] Frontmatter : tous les champs obligatoires presents
- [ ] `type` est `lesson`, `exercise` ou `qcm`
- [ ] `difficulty` est 0, 1, 2 ou 3
- [ ] `timeMinutes` est un entier positif dans la fourchette du type
- [ ] `tags` contient au moins 1 tag
- [ ] `category` present ssi `type: exercise`
- [ ] Structure MDX correcte pour le type (voir section type)
- [ ] Exercises : `:::enonce` + `:::solution` obligatoires
- [ ] QCM : `:::question` + 2-5 `:::option` (une seule `{correct}`) + `:::explanation`
- [ ] LaTeX : `$...$` inline et `$$...$$` bloc (pas de HTML)
- [ ] Headings commencent a `###`
- [ ] Pas de composants non autorises

#### Checklist molecule

- [ ] Tous les champs obligatoires presents (`kind: livret`, `title`, `description`, `trimester`, `order`)
- [ ] Tous les IDs d'atomes references existent dans le module correspondant
- [ ] Groupes `quiz` : 2 a 5 QCM
- [ ] Au moins 1 section avec label + steps

4. **Rapporte** les problemes trouves avec fichier:ligne et suggestion de fix

---

## Listing workflow

Utilise Glob et Grep pour repondre aux questions d'inventaire :

| Question | Commande |
|----------|----------|
| Tous les atomes | `Glob: content/**/*.mdx` |
| Atomes d'un topic | `Glob: content/**/*-{topic}-*.mdx` |
| Atomes d'un type | `Glob: content/**/{type}-*.mdx` |
| Atomes avec un tag | `Grep: pattern "- {tag}" dans content/` glob `*.mdx` |
| Molecules livrets | `Glob: content/**/_molecules/*/molecule.yaml` |
| Programmes | `Glob: content/*/_programme.yaml` |
| Atomes orphelins | Glob tous les atomes, Grep tous les IDs dans `_molecules/*/molecule.yaml`, diff |
| References a un atome | `Grep: pattern "{atom-id}" dans content/**/_molecules/*/molecule.yaml` |

---

## Quick Reference

### Nommage des fichiers

```
Atomes:     content/{programme}/{module}/{type}-{topic}-{slug}.mdx
Molecules:  content/{programme}/{module}/_molecules/{slug}/molecule.yaml
Planning:   content/{programme}/{module}/_molecules/{slug}/_planning.yaml
Validation: content/{programme}/{module}/_molecules/{slug}/_validation.md
Meta:       _meta/{programme}/{module}/  (savoir.yaml, praxeologies.yaml, misconceptions.yaml + optional patterns.yaml)
Programme:  content/{programme}/_programme.yaml
```

### Frontmatter par type

| Champ | lesson | exercise | qcm |
|-------|--------|----------|-----|
| `type` | `lesson` | `exercise` | `qcm` |
| `title` | oui | oui | oui |
| `difficulty` | 0-3 | 0-3 | 0-3 |
| `timeMinutes` | 3-10 | 5-20 | 1-2 |
| `tags` | oui | oui | oui |
| `category` | non | **obligatoire** | non |

Categories exercice : `application`, `approfondissement`, `synthese`, `probleme`

### Directives autorisees par type

| Directive | lesson | exercise | qcm |
|-----------|--------|----------|-----|
| `:::definition[Titre]` | optionnel | - | - |
| `:::theorem[Titre]` | optionnel | - | - |
| `:::property[Titre]` | optionnel | - | - |
| `:::example[Titre]` | optionnel | - | - |
| `:::remark` | optionnel | - | - |
| `:::attention[Titre]` | optionnel | - | - |
| `:::enonce` | - | **obligatoire** | - |
| `:::solution` | - | **obligatoire** | - |
| `:::methode` | - | optionnel | - |
| `:::hint` | - | optionnel | - |
| `:::erreurs` | - | optionnel | - |
| `:::question` | - | - | **obligatoire** |
| `:::option` / `{correct}` | - | - | **2-5, une correct** |
| `:::explanation` | - | - | **obligatoire** |
| ` ```typst ` | oui | oui | - |
| `::youtube{...}` | oui | - | - |

### Vocabulaire controle — Topics

| Topic | Cours |
|-------|-------|
| `cont` | Continuite |
| `der` | Derivation |
| `fn` | Fonctions (generalites) |
| `angles` | Angles |
| `thales` | Thales |
| `trigo` | Rapports trigonometriques |
| `vt` | Vecteurs et translations |
| `sv` | Somme de vecteurs |
| `repere` | Repere |
| `qt` | Quart de tour |
| `ss` | Sections de solides |
| `num1` | Calcul numerique 1 |
| `num2` | Calcul numerique 2 |
| `algebre` | Algebre |
| `fl` | Fonctions lineaires |
| `ei` | Equations et inequations |
| `fa` | Fonctions affines |
| `sys` | Systemes |
| `stat` | Statistiques |

### Sources pedagogiques

Le registre de sources (`docs/content-intelligence/sources/`) contient des fiches
detaillees de sites web educatifs pre-scannes. Utile pour enrichir les KB modules
et croiser les references lors de la creation de contenu.

Commandes liees : `/source scan`, `/source discover`, `/source status`

### Meta (modele academique)
- Interface : `_meta/_interface.yaml`
- Savoir module : `_meta/{programme}/{module}/savoir.yaml` (inclut notations)
- Praxeologies : `_meta/{programme}/{module}/praxeologies.yaml`
- Misconceptions : `_meta/{programme}/{module}/misconceptions.yaml`
- Patterns : `_meta/{programme}/{module}/patterns.yaml` (optionnel, WF1+)
- Specs examen : `_meta/{programme}/examens/{slug}/spec.yaml`
- Profils livrets : `_meta/booklet-profiles.yaml` (cours, examen, exploration — inclut echelle de difficulte)
- Prerequis : `_meta/{programme}/prerequis-graph.yaml`


### Difficulty scale

| Valeur | Signification |
|--------|--------------|
| `0` | Rappel / prerequis |
| `1` | Application directe |
| `2` | Combinaison de notions |
| `3` | Approfondissement / demonstration |
