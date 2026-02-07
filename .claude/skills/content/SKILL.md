---
name: content
description: Manage pedagogical content (MDX atoms and YAML molecules). Use when creating, editing, validating, or listing content in content/atoms/ or content/molecules/. Triggers on keywords: ajouter, creer, modifier, editer, corriger, valider, verifier, lister, inventaire, contenu, atome, molecule, cours, exercice, qcm, serie, lecon, module.
argument-hint: "[action] [details]"
---

# Content Management

Skill de gestion du contenu pedagogique : atomes MDX (`content/atoms/`) et molecules YAML (`content/molecules/`).

## Routing

Determine l'action a partir de `$ARGUMENTS` ou du contexte utilisateur :

| Intent | Workflow | Quand |
|--------|----------|-------|
| **Create programme** | [actions/create-programme.md](actions/create-programme.md) | "create-programme", "tous les modules", "programme complet" |
| **Create module** | [actions/create-module.md](actions/create-module.md) | "create-module", "module complet", "creer le module" |
| **Creer** | [Creation](#creation-workflow) | ajouter, creer, nouveau, ecrire un atome/molecule |
| **Editer** | [Edition](#edition-workflow) | modifier, corriger, editer, renommer |
| **Valider** | [Validation](#validation-workflow) | valider, verifier, checker, audit |
| **Lister** | [Listing](#listing-workflow) | lister, inventaire, combien, quels atomes |

**Priority de routing** :
1. Si `$ARGUMENTS` commence par `create-programme` → [actions/create-programme.md](actions/create-programme.md) — pipeline complet pour TOUS les modules d'un programme (recherche mutualisee + creation par batch + review globale)
2. Si `$ARGUMENTS` commence par `create-module` → [actions/create-module.md](actions/create-module.md) — pipeline pour UN module (recherche + creation + review)

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
   Grep pattern: ancien-id dans content/molecules/**/*.yaml
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
- [ ] Exercises : `<Enonce>` + `<Solution>` obligatoires
- [ ] QCM : `<Question>` + 2-5 `<Option>` (une seule `correct`) + `<Explanation>`
- [ ] LaTeX : `$...$` inline et `$$...$$` bloc (pas de HTML)
- [ ] Headings commencent a `###`
- [ ] Pas de composants non autorises

### Checklist molecule

- [ ] Tous les champs obligatoires presents
- [ ] Tous les IDs d'atomes references existent dans `content/atoms/`
- [ ] Groupes `quiz` : 2 a 5 QCM
- [ ] Cours : `programme`, `trimester`, `order` presents
- [ ] Serie : `difficulty`, `tags` presents, minimum 2 steps

4. **Rapporte** les problemes trouves avec fichier:ligne et suggestion de fix

---

## Listing workflow

Utilise Glob et Grep pour repondre aux questions d'inventaire :

| Question | Commande |
|----------|----------|
| Tous les atomes | `Glob: content/atoms/*.mdx` |
| Atomes d'un topic | `Glob: content/atoms/*-{topic}-*.mdx` |
| Atomes d'un type | `Glob: content/atoms/{type}-*.mdx` |
| Atomes avec un tag | `Grep: pattern "- {tag}" dans content/atoms/` |
| Molecules cours | `Glob: content/molecules/cours/*.yaml` |
| Molecules series | `Glob: content/molecules/series/*.yaml` |
| Programmes | `Glob: content/molecules/programmes/*.yaml` |
| Atomes orphelins | Glob tous les atomes, Grep tous les IDs dans molecules, diff |
| References a un atome | `Grep: pattern "{atom-id}" dans content/molecules/` |

---

## Quick Reference

### Nommage des fichiers

```
Atomes:    content/atoms/{type}-{topic}-{slug}.mdx
Cours:     content/molecules/cours/{slug}.yaml
Series:    content/molecules/series/{slug}.yaml
Programme: content/molecules/programmes/{id}.yaml
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

### Composants MDX autorises par type

| Composant | lesson | exercise | qcm |
|-----------|--------|----------|-----|
| `<Definition>` | optionnel | - | - |
| `<Theorem>` | optionnel | - | - |
| `<Property>` | optionnel | - | - |
| `<Example>` | optionnel | - | - |
| `<Remark>` | optionnel | - | - |
| `<Attention>` | optionnel | - | - |
| `<Enonce>` | - | **obligatoire** | - |
| `<Solution>` | - | **obligatoire** | - |
| `<Methode>` | - | optionnel | - |
| `<Hint>` | - | optionnel | - |
| `<Erreurs>` | - | optionnel | - |
| `<Question>` | - | - | **obligatoire** |
| `<Option>` | - | - | **2-5, une correct** |
| `<Explanation>` | - | - | **obligatoire** |
| `<Graph>` | oui | oui | - |
| `<Variations>` | oui | oui | - |
| `<YouTube>` | oui | - | - |

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
