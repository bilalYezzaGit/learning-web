---
name: content
description: Manage pedagogical content (MDX atoms and YAML molecules). Use when creating, editing, validating, or listing content in content/{programme}/{module}/. Triggers on keywords: ajouter, creer, modifier, editer, corriger, valider, verifier, lister, inventaire, contenu, atome, molecule, cours, exercice, qcm, serie, lecon, module, planifier, planning, plan.
argument-hint: "[action] [details]"
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
| **Lister** | [Listing](#listing-workflow) | lister, inventaire, combien, quels atomes |

---

## Planning workflow

Genere un planning de livret a partir d'une KB module. Le planning declare tous les atomes et molecules AVANT generation.

### Pre-requis

- KB module existante dans `meta_system/kb/`
- Si pas de KB : creer d'abord la KB (voir `meta_system/kb/template.md`)

### Etapes

1. **Charge la KB module** : Read `meta_system/kb/{nn}-{slug}.md`

2. **Charge le template planning** : Read `meta_system/planning/template.yaml`

3. **Analyse les praxeologies** de la KB (section 8) :
   - Lister toutes les praxeologies avec leur difficulte
   - Identifier les groupements thematiques naturels

4. **Genere le planning** `content/{programme}/{module}/_planning.yaml` :
   - Declarer chaque praxeologie dans la section `praxeologies:`
   - Concevoir les molecules (1 cours + 1-3 series)
   - Pour le cours : organiser en sections thematiques
   - Pour chaque section : declarer les atomes (lecons, exercices, QCM)
   - Pour chaque atome : slug, type, title, praxeologies, contenu (2-3 phrases), difficulte, timeMinutes
   - Pour les series : liste plate d'atomes

5. **Verifie la couverture** :
   - Chaque praxeologie de la KB est couverte par au moins 1 atome
   - Equilibre des types : ~60% exercices, ~25% lecons, ~15% QCM
   - Progression de difficulte coherente dans chaque molecule

6. **Ecrit le fichier** `_planning.yaml` avec `status: draft`

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

## Creation workflow

1. **Determine le type** a creer :
   - Atome : `lesson`, `exercise`, `qcm`
   - Molecule : `cours`, `serie`

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
   Grep pattern: ancien-id dans content/**/_molecules/*.yaml
   ```

5. **Ecrit le fichier** modifie

---

## Validation workflow

1. **Charge les regles completes** : Read `docs/CONTENT-CONVENTIONS.md` (source de verite)

2. **Lis le(s) fichier(s)** a valider

3. **Execute la checklist complete** :

### Checklist atome

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

### Checklist molecule

- [ ] Tous les champs obligatoires presents
- [ ] Tous les IDs d'atomes references existent dans le module correspondant
- [ ] Groupes `quiz` : 2 a 5 QCM
- [ ] Cours : `trimester`, `order` presents
- [ ] Serie : `difficulty`, `tags` presents, minimum 2 steps

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
| Molecules cours/series | `Glob: content/**/_molecules/*.yaml` |
| Programmes | `Glob: content/*/_programme.yaml` |
| Atomes orphelins | Glob tous les atomes, Grep tous les IDs dans `_molecules/`, diff |
| References a un atome | `Grep: pattern "{atom-id}" dans content/**/_molecules/` |

---

## Quick Reference

### Nommage des fichiers

```
Atomes:    content/{programme}/{module}/{type}-{topic}-{slug}.mdx
Molecules: content/{programme}/{module}/_molecules/{slug}.yaml
Programme: content/{programme}/_programme.yaml
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
detaillees de sites web educatifs pre-scannes. Les actions create-module et
create-programme consultent automatiquement ces fiches avant la recherche web.

Commandes liees : `/source scan`, `/source discover`, `/source status`

### Difficulty scale

| Valeur | Signification |
|--------|--------------|
| `0` | Rappel / prerequis |
| `1` | Application directe |
| `2` | Combinaison de notions |
| `3` | Approfondissement / demonstration |
