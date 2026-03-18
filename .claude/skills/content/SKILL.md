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

- KB module existante (`content/{prog}/{mod}/_kb.md`)
- Si pas de KB : creer d'abord la KB (voir `.claude/skills/content/references/kb-template.md`)

### Syntaxe

```
/content plan {module}
/content plan {module} : {specs libres}
```

Le texte apres `:` est un argument libre de customisation. Il peut contenir des contraintes sur :
- le nombre de molecules
- les praxeologies a couvrir ou exclure
- les types d'atomes a inclure/exclure
- les niveaux de difficulte
- la structure des sections
- toute autre intention pedagogique

Exemples :
- `/content plan nombre-derive : 2 molecules, focus bases dans la 1ere, approfondissement dans la 2eme`
- `/content plan continuite : une seule molecule, seulement les Prax1-4, difficulte max 2`
- `/content plan fonctions : 3 molecules progressives, pas de QCM dans la premiere`

### Etapes

0. **Parse les specs de customisation** (si presentes apres `:` dans `$ARGUMENTS`) :
   - Extraire les contraintes (nombre de molecules, praxeologies, difficultes, types, structure)
   - Ces contraintes sont appliquees a l'etape 4 (generation) et 5 (verification)
   - Si aucune spec : generer un planning par defaut (couverture complete, equilibre standard)

1. **Charge la KB module** : Read `content/{programme}/{module}/_kb.md`

2. **Charge le template planning** : Read `.claude/skills/content/references/planning-template.yaml`

3. **Analyse les praxeologies** de la KB (section 8) :
   - Lister toutes les praxeologies avec leur difficulte
   - Identifier les groupements thematiques naturels

4. **Genere un planning per-molecule** `content/{programme}/{module}/_molecules/{slug}/_planning.yaml` :
   - Un fichier par molecule (pas de wrapper `molecules:` ni `praxeologies:`)
   - Pour chaque livret : organiser en sections thematiques
   - Pour chaque section : declarer les atomes (lecons, exercices, QCM)
   - Pour chaque atome : slug, type, title, praxeologies, contenu (2-3 phrases), difficulte, timeMinutes

5. **Verifie la couverture** :
   - Chaque praxeologie de la KB est couverte par au moins 1 atome
   - Equilibre des types : ~60% exercices, ~25% lecons, ~15% QCM
   - Progression de difficulte coherente dans chaque molecule

6. **Ecrit le(s) fichier(s)** `_planning.yaml` avec `status: draft`

7. **Presente le planning a l'humain** pour validation :
   - Resume : nombre de molecules, nombre d'atomes par type, praxeologies couvertes
   - Demander validation ou ajustements

8. **Apres validation humaine** : mettre `status: validated`

### Checklist planning

- [ ] Toutes les praxeologies de la KB sont couvertes
- [ ] Slugs conformes au nommage (`{type}-{topic}-{slug}`)
- [ ] Topics du vocabulaire controle
- [ ] Chaque atome a un champ `contenu` de 2-3 phrases
- [ ] Difficultes coherentes avec la KB
- [ ] Categories presentes pour tous les exercices
- [ ] QCM regroupables en blocs de 2-5 par theme

---

## KB workflow

Cree une Knowledge Base module a partir des transcriptions Typst.

Prerequis : transcriptions .typ dans `_raw/reference/{programme}/{module}/`.
Si absentes : utiliser `/transcription {module}` d'abord.

Voir [actions/create-kb.md](actions/create-kb.md) pour le pipeline complet.

---

## Patterns workflow

Enrichit le fichier `_patterns.yaml` d'un module a partir de series d'exercices (WF1+).

Voir [actions/enrich-patterns.md](actions/enrich-patterns.md) pour le pipeline complet.

### Pre-requis

- KB module existante (`content/{prog}/{mod}/_kb.md`)
- Si pas de KB : creer d'abord la KB (`/content kb {module}`)

### Syntaxe

```
/content patterns {module}
```

L'utilisateur fournit des exercices en contexte (transcriptions Typst, texte, images, PDFs).

### Etapes

1. **Charge la KB module** : lire `content/{programme}/{module}/_kb.md`, extraire les praxeologies (section 8)

2. **Charge `_patterns.yaml` existant** (ou creer la structure vide si premier appel)

3. **Charge le template patterns** : Read `.claude/skills/content/references/patterns-template.yaml`

4. **Analyse chaque exercice fourni** :
   - Identifier la/les praxeologie(s) mobilisees (reference KB)
   - Extraire : type de tache, technique, variables qui changent
   - Comparer avec les patterns existants dans `_patterns.yaml`

5. **Classifier** :
   - Si **variante connue** → incrementer `frequency`, ajouter source, optionnellement ajouter un exemple
   - Si **nouvelle variante** → creer un nouveau pattern avec ID `PraxN.vM`
   - Si **praxeologie inconnue** (pas dans la KB) → **signaler a l'humain**, ne pas modifier la KB

6. **Ecrire** `_patterns.yaml` mis a jour, incrementer `version`

7. **Afficher un resume** : N exercices analyses, M nouveaux patterns, K variantes enrichies, J non classifies

### Regles

- 1 fichier `_patterns.yaml` par module (pas par molecule)
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
KB:         content/{programme}/{module}/_kb.md
Patterns:   content/{programme}/{module}/_patterns.yaml
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

### Difficulty scale

| Valeur | Signification |
|--------|--------------|
| `0` | Rappel / prerequis |
| `1` | Application directe |
| `2` | Combinaison de notions |
| `3` | Approfondissement / demonstration |
