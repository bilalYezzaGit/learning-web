# Chantier 002 — Livret unifié

**Statut** : PLANIFICATION
**Objectif** : Fusionner `cours` et `serie` en un seul type de molécule (`livret`) + nettoyer le frontmatter des atomes.

## Contexte

### Molécules
Aujourd'hui on a 2 types de molécules :
- `cours` (11 fichiers) : sections structurées → PDF + page app
- `serie` (9 fichiers) : liste plate de steps → incluse dans le PDF du cours

**Constat** : la distinction est artificielle. Les séries contiennent déjà des leçons + exos + QCM, exactement comme un cours. La seule vraie différence est la présence de `sections`.

**Constat technique** : 7 des 13 champs de `serie` sont du dead code (jamais consommés).

### Atomes
Sur 7 champs du frontmatter atome, 4 ne sont jamais lus par le pipeline ni exposés au frontend :

| Champ | Consommé ? |
|-------|-----------|
| `type` | oui (partout) |
| `title` | oui (partout) |
| `timeMinutes` | oui (pipeline + frontend) |
| `correctOption` | oui (QCM, pipeline) — mais doublon avec `:::option{correct}` |
| `difficulty` | **jamais lu** |
| `category` | **jamais lu** (requis pour exercises mais jamais consommé) |
| `tags` | **jamais lu** |

Un champ `source` existe dans ~10 QCM sans être dans le schema zod.

## Vision cible

```
1 fichier YAML dans _molecules/ = 1 livret = 1 PDF + 1 page dans l'app
```

Un module peut contenir N livrets, chacun étant un assemblage libre d'atomes.

---

## Partie A — Schéma YAML livret

### Schema proposé

```yaml
kind: livret

# --- Identité ---
title: "Titre du livret"                    # obligatoire
description: "Description courte"            # obligatoire
visible: true                                # optionnel, défaut: true

# --- Classification ---
trimester: T1                                # obligatoire (T1, T2, T3)
order: 1                                     # obligatoire, position dans le programme
difficulty: 2                                # optionnel, défaut: null
tags: [derivation, variations]               # optionnel, défaut: []

# --- Contenu ---
estimatedMinutes: 120                        # optionnel, si absent = somme auto des atomes
objectives:                                  # optionnel, défaut: []
  - "Objectif 1"
  - "Objectif 2"

sections:                                    # obligatoire, >= 1 section
  - label: "Première section"                # obligatoire
    steps:                                   # obligatoire, >= 1 step
      - lesson-der-formules
      - ex-der-application
      - quiz:
          - qcm-der-formule-1
          - qcm-der-formule-2
```

### Décisions prises

| Champ | Décision | Justification |
|-------|----------|---------------|
| `kind` | `livret` | Nouveau discriminant unique |
| `title` | **obligatoire** | Identité |
| `description` | **obligatoire** | Identité |
| `visible` | **optionnel** (défaut true) | Workflow draft/publish |
| `trimester` | **obligatoire** | Nommage standardisé (remplace aussi `trimestre`) |
| `order` | **obligatoire** | Tri dans le programme (remplace aussi `priority`) |
| `difficulty` | **optionnel** (défaut null) | Pas pertinent pour un cours mixte, utile pour un livret d'exos |
| `tags` | **optionnel** (défaut []) | Dead code aujourd'hui, gardé pour usage futur |
| `estimatedMinutes` | **optionnel** | Si présent → affiché tel quel. Si absent → calculé auto (somme des timeMinutes des atomes) |
| `objectives` | **optionnel** (défaut []) | Pas pertinent pour un livret 100% exos |
| `sections` | **obligatoire** (min 1) | Structure unique, pas de sucre syntaxique (pas de `steps` plat) |

### Champs supprimés

| Ancien champ | Raison |
|-------------|--------|
| `steps` (plat, serie) | Remplacé par `sections` (wrapper dans 1 section) |
| `type` (serie) | Dead code, jamais utilisé |
| `modules` (serie) | Déduit de la hiérarchie de dossiers |
| `priority` (serie) | Remplacé par `order` |
| `trimestre` (serie) | Remplacé par `trimester` (nommage cohérent) |
| `successThreshold` (serie) | Dead code, jamais implémenté |

### Migration des 20 fichiers existants

| Ancien type | Exemple | Migration |
|-------------|---------|-----------|
| Cours structuré | `continuite.yaml` (3 sections) | `kind: livret`, garder les sections |
| Série d'exercices | `tvi-maitrise.yaml` (steps plats) | `kind: livret`, wrapper les steps dans 1 section |
| Série diagnostic | `continuite-diagnostic.yaml` (QCM only) | `kind: livret`, 1 section avec les quiz groups |
| Cours exos-only | `fn-livret-complet.yaml` | `kind: livret`, déjà le bon format |

### Exemple concret

**Avant** (serie) :
```yaml
kind: serie
title: "TVI : maitrise complete"
difficulty: 2
estimatedMinutes: 50
tags: [continuite, tvi]
steps:
  - lesson-cont-tvi
  - ex-cont-3
  - ex-cont-3b
type: mono-module
trimestre: 1
modules: [continuite]
priority: 0
```

**Après** (livret) :
```yaml
kind: livret
title: "TVI : maitrise complete"
description: "Approfondis le TVI avec des exercices progressifs."
trimester: T1
order: 2
difficulty: 2
tags: [continuite, tvi]

sections:
  - label: "Exercices TVI"
    steps:
      - lesson-cont-tvi
      - ex-cont-3
      - ex-cont-3b
```

---

## Partie B — Nettoyage du frontmatter atome

### Changement 1 : Supprimer `correctOption` du frontmatter QCM

**Problème** : double source de vérité pour la bonne réponse QCM.
- `correctOption: 2` dans le frontmatter (index 0-based)
- `:::option{correct}` dans le contenu MDX

**Décision** : `:::option{correct}` devient la **seule** source de vérité.
Le pipeline calcule `correctIndex` automatiquement en comptant la position de l'option marquée `{correct}`.

**Impact** :
- Supprimer `correctOption` du schema zod dans `read-atoms.ts`
- Modifier `compile-qcm.ts` pour détecter `{correct}` et en déduire l'index
- Modifier `validate.ts` pour vérifier qu'exactement 1 option a `{correct}`
- Supprimer `correctOption` de tous les QCM existants (~40 fichiers)

### Changement 2 : Brancher `difficulty`, `category`, `tags` dans le pipeline

**Problème** : ces champs existent dans chaque atome mais ne sont jamais lus.

**Décision** : les propager dans `ResolvedActivity` pour que le frontend puisse les utiliser.

**Nouveau `ResolvedActivity`** :
```typescript
interface ResolvedActivity {
  id: string
  type: 'lesson' | 'exercise' | 'qcm' | 'resume'
  title: string
  timeMinutes: number
  difficulty: number        // ← NOUVEAU
  category?: string         // ← NOUVEAU (exercices seulement)
  tags: string[]            // ← NOUVEAU
  sectionId?: string
  quizAtomIds?: string[]
}
```

**Impact** :
- Modifier `resolve-cours.ts` et `resolve-series.ts` (→ `resolve-livrets.ts`) pour propager ces champs
- Le frontend peut ensuite afficher des badges de difficulté, filtrer par catégorie, etc.

### Changement 3 : Formaliser `source` comme champ optionnel

**Problème** : ~10 QCM ont un champ `source` (traçabilité) qui n'est pas dans le schema.

**Décision** : ajouter `source` au schema zod comme champ **optionnel**.
Le pipeline le stocke mais ne l'affiche pas (usage interne/audit).

### Schema atome après nettoyage

```typescript
const atomMetaSchema = z.object({
  type: z.enum(['lesson', 'exercise', 'qcm']),    // 'resume' supprimé (1 seul atome, purpose unclear)
  title: z.string().min(1),
  difficulty: z.number().int().min(0).max(3),       // obligatoire, plus de default
  timeMinutes: z.number().int().min(1),             // obligatoire, plus de default
  tags: z.array(z.string()).default([]),             // optionnel, défaut [] (pas consommé aujourd'hui)
  category: z.enum([...]).optional(),               // exercices seulement
  source: z.string().optional(),                    // traçabilité
  // correctOption: SUPPRIMÉ — déduit de :::option{correct}
})
```

---

## Partie C — Impact technique

### Pipeline (`tools/pipeline/`)

| Fichier | Changement |
|---------|-----------|
| `types.ts` | Supprimer `RawCours`, `RawSerie`, `ResolvedCours`, `ResolvedSerie`. Ajouter `RawLivret`, `ResolvedLivret`. Enrichir `ResolvedActivity` (difficulty, category, tags). |
| `read-atoms.ts` | Supprimer `correctOption`, ajouter `source`, rendre `difficulty`/`timeMinutes`/`tags` strictement obligatoires. Supprimer type `resume`. |
| `read-molecules.ts` | Un seul schema zod `livretSchema` au lieu de 2. |
| `resolve-cours.ts` + `resolve-series.ts` | Fusionner en `resolve-livrets.ts`. Propager difficulty/category/tags dans les activités. |
| `compile-qcm.ts` | Détecter `{correct}` dans les options pour calculer `correctIndex`. |
| `validate.ts` | Supprimer check `correctOption`. Ajouter check "exactement 1 `:::option{correct}`". |
| `assemble-catalogues.ts` | Un seul tableau `livrets` au lieu de `cours[]` + `series[]`. |
| `generate-pdfs.ts` | Chaque `ResolvedLivret` → 1 PDF. Plus de logique séparée cours/séries. |
| `index.ts` | Adapter les appels de stages. |

### Frontend (`src/`)

| Fichier | Changement |
|---------|-----------|
| `types/content.ts` | `ResolvedLivret` remplace `ResolvedCours` + `ResolvedSerie`. |
| `types/booklet.ts` | Simplifier ou supprimer `BookletDefinition` (le livret EST le booklet). |
| `lib/content-loader.ts` | `getLivret()` remplace `getCours()`. |
| `lib/booklet.ts` | Simplifier. |
| `app/app/mes-livrets/` | Adapter les pages (même structure, types changés). |

### Contenu (`content/`)

| Changement | Scope |
|-----------|-------|
| Migrer 20 YAML molécules | `kind: cours` → `kind: livret`, `kind: serie` → `kind: livret` + wrapper sections |
| Supprimer `correctOption` des ~40 QCM | Sed/script automatisable |
| Vérifier que tous les QCM ont `:::option{correct}` | Script de validation |

### Documentation

| Fichier | Changement |
|---------|-----------|
| `docs/CONTENT-CONVENTIONS.md` | Section 3 : un seul type de molécule `livret`. Section 2.3 QCM : supprimer `correctOption`. |
| `.claude/skills/content/references/templates.md` | Templates molécule : un seul template `livret`. |
| `.claude/skills/content/` (actions, routing) | Adapter le vocabulaire. |

---

## Ordre d'exécution proposé

1. **Pipeline types** — nouveaux types `RawLivret`, `ResolvedLivret`, `ResolvedActivity` enrichi
2. **Pipeline read** — nouveau schema zod livret + atome nettoyé
3. **Pipeline compile-qcm** — `{correct}` comme source unique
4. **Pipeline resolve** — fusionner en `resolve-livrets.ts`
5. **Pipeline assemble + generate-pdfs** — adapter
6. **Migration YAML** — convertir les 20 molécules + supprimer `correctOption` des QCM
7. **Frontend types + loader** — adapter
8. **Frontend pages** — adapter les routes
9. **Documentation** — mettre à jour conventions, templates, skills
10. **Validation** — `npm run generate` + `npm run build` + vérifier les PDFs
